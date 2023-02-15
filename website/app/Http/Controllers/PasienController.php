<?php

namespace App\Http\Controllers;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Uasoft\Badaso\Helpers\GetData;
use Uasoft\Badaso\Models\DataType;
use Uasoft\Badaso\Helpers\ApiResponse;
use Uasoft\Badaso\Controllers\BadasoBaseController;
use Uasoft\Badaso\Helpers\Firebase\FCMNotification;
use Illuminate\Support\Facades\Crypt;

class PasienController extends BadasoBaseController
{
    public function add(Request $request)
    {
        DB::beginTransaction();

        try {
            $request->validate([
                'data' => [
                    'required',
                ],
            ]);

            // get slug by route name and get data type in table
            $slug = $this->getSlug($request);
            $data_type = $this->getDataType($slug);

            // get data from request
            $data = $request->input('data');
            $data['alamat'] = Crypt::encryptString($data['alamat']);
            $data['nik'] = Crypt::encryptString($data['nik']);
            $data['keterangan'] = Crypt::encryptString($data['keterangan']);

            // validate and store data to table
            $this->validateData($data, $data_type);
            $stored_data = $this->insertData($data, $data_type);

            activity($data_type->display_name_singular)
                ->causedBy(auth()->user() ?? null)
                ->withProperties(['attributes' => $stored_data])
                ->log($data_type->display_name_singular . ' has been created');

            DB::commit();

            // add event notification handle
            $table_name = $data_type->name;
            FCMNotification::notification(FCMNotification::$ACTIVE_EVENT_ON_CREATE, $table_name);

            return ApiResponse::onlyEntity($stored_data);
        } catch (Exception $e) {
            DB::rollBack();

            return ApiResponse::failed($e);
        }
    }

    public function read(Request $request)
    {
        try {
            $request->validate([
                'id' => 'required',
            ]);

            $slug = $this->getSlug($request);
            $data_type = $this->getDataType($slug);
            $request->validate([
                'id' => 'exists:' . $data_type->name,
            ]);

            $data = $this->getDataDetail($slug, $request->id);
            if (isset($data->alamat)) {
                $data->alamat = Crypt::decryptString($data->alamat);
            }
            if (isset($data->nik)) {
                $data->nik = Crypt::decryptString($data->nik);
            }
            if (isset($data->keterangan)) {
                $data->keterangan = Crypt::decryptString($data->keterangan);
            }
            if (isset($data->alergi)) {
                $data->alergi->data = Crypt::decryptString($data->alergi->data);
            }

            // add event notification handle
            $table_name = $data_type->name;
            FCMNotification::notification(FCMNotification::$ACTIVE_EVENT_ON_READ, $table_name);

            return ApiResponse::onlyEntity($data);
        } catch (Exception $e) {
            return ApiResponse::failed($e);
        }
    }

    public function edit(Request $request)
    {
        DB::beginTransaction();

        try {
            $request->validate([
                'data' => [
                    'required',
                    function ($attribute, $value, $fail) use ($request) {
                        $slug = $this->getSlug($request);
                        $data_type = $this->getDataType($slug);
                        $table_entity = DB::table($data_type->name)->where('id', $request->data['id'])->first();
                        if (is_null($table_entity)) {
                            $fail(__('badaso::validation.crud.id_not_exist'));
                        }
                    },
                ],
            ]);

            // get slug by route name and get data type
            $slug = $this->getSlug($request);
            $data_type = $this->getDataType($slug);

            // get data in request, validate, and update data
            $data = $request->input('data');
            if (isset($data['alamat'])) {
                $data['alamat'] = Crypt::encryptString($data['alamat']);
            }
            if (isset($data['nik'])) {
                $data['nik'] = Crypt::encryptString($data['nik']);
            }
            if (isset($data['keterangan'])) {
                $data['keterangan'] = Crypt::encryptString($data['keterangan']);
            }
            $this->validateData($data, $data_type);
            $updated = $this->updateData($data, $data_type);

            DB::commit();
            activity($data_type->display_name_singular)
                ->causedBy(auth()->user() ?? null)
                ->withProperties([
                    'old' => $updated['old_data'],
                    'attributes' => $updated['updated_data'],
                ])
                ->log($data_type->display_name_singular . ' has been updated');
            // add event notification handle
            $table_name = $data_type->name;
            FCMNotification::notification(FCMNotification::$ACTIVE_EVENT_ON_UPDATE, $table_name);

            return ApiResponse::onlyEntity($updated['updated_data']);
        } catch (Exception $e) {
            DB::rollBack();

            return ApiResponse::failed($e);
        }
    }
}
