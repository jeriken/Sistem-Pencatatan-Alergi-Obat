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

class BpjsController extends BadasoBaseController
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

            // validate and store data to table
            $this->validateData($data, $data_type);
            $stored_data = $this->insertData($data, $data_type);

            activity($data_type->display_name_singular)
                ->causedBy(auth()->user() ?? null)
                ->withProperties(['attributes' => $stored_data])
                ->log($data_type->display_name_singular.' has been created');
            
            DB::commit();
            // $last_id = DB::table('ktp')->latest()->first();
            DB::table('pasien')
                ->where('id', $data['ids'])
                ->update(['bpjs_id' => $data['barcode']]);
            

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
                'barcode' => 'required',
            ]);

            $slug = $this->getSlug($request);
            $data_type = $this->getDataType($slug);
            $request->validate([
                'barcode' => 'exists:'.$data_type->name,
            ]);
            $barcode = $request->barcode;

            $id = DB::table('bpjs')->where('barcode',$barcode)->first();

            $data = $this->getDataDetail($slug, $id->id);

            // add event notification handle
            $table_name = $data_type->name;
            FCMNotification::notification(FCMNotification::$ACTIVE_EVENT_ON_READ, $table_name);

            return ApiResponse::onlyEntity($data);
        } catch (Exception $e) {
            return ApiResponse::failed($e);
        }
    }
}
