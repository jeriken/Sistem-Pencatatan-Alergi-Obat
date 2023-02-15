<?php

namespace App\Http\Controllers;

use App\Models\AlergiModel;
use App\Models\BpjsModel;
use App\Models\KtpModel;
use App\Models\PasienModel;
use App\Models\RsModel;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Uasoft\Badaso\Helpers\ApiResponse;
use Illuminate\Support\Facades\Crypt;

class CustomController extends Controller
{
    public function browsePasien(Request $request)
    {
        try {
            $data = PasienModel::with(['rs', 'ktp', 'bpjs', 'alergi'])
                ->where(function ($query) use ($request) {
                    $query->where('nama', $request->get('q'))
                        ->orWhere('ktp_id', $request->get('q'))
                        ->orWhere('bpjs_id', $request->get('q'))
                        ->orWhere('nik', $request->get('q'));
                })
                ->paginate(10);
            return ApiResponse::onlyEntity($data);
        } catch (Exception $e) {
            DB::rollBack();
            return ApiResponse::failed($e);
        }
    }

    public function filterPasien(Request $request)
    {
        try {
            $data = new PasienModel;
            $data = $data->with(['rs', 'ktp', 'bpjs', 'alergi']);
            if ($request->has('q')) {
                $data = $data->where(function ($query) use ($request) {
                    $query->where('nama', $request->get('q'))
                        ->orWhere('ktp_id', $request->get('q'))
                        ->orWhere('bpjs_id', $request->get('q'));
                });
            }
            if ($request->has('rsid')) {
                $data = $data->where('rs_id', $request->get('rsid'));
            }
            if ($request->has('jk')) {
                $data = $data->where('jenkel', $request->get('jk'));
            }
            if ($request->has('catat')) {
                $data = $data->whereYear('tgl_catat', '=', $request->get('catat'));
            }
            if ($request->has('min')) {
                $data = $data->whereYear('tgl_lahir', '<=', date("Y") - $request->get('min'));
            }
            if ($request->has('max')) {
                $data = $data->whereYear('tgl_lahir', '>=', date("Y") - $request->get('max'));
            }

            $data = $data->paginate(100);
            // print_r($data[0]->tgl_lahir);
            foreach ($data as $decy) {
                if (isset($decy->alamat)) {
                    $decy->alamat = Crypt::decryptString($decy->alamat);
                }
                if (isset($decy->nik)) {
                    $decy->nik = Crypt::decryptString($decy->nik);
                }
                if (isset($decy->keterangan)) {
                    $decy->keterangan = Crypt::decryptString($decy->keterangan);
                }
                if (isset($decy->alergi)) {
                    $decy->alergi->data = Crypt::decryptString($decy->alergi->data);
                }
            }
            return ApiResponse::onlyEntity($data);
        } catch (Exception $e) {
            DB::rollBack();
            return ApiResponse::failed($e);
        }
    }

    public function searchPasien(Request $request)
    {
        try {
            $data = PasienModel::with(['rs', 'ktp', 'bpjs', 'alergi'])
                ->where(function ($query) use ($request) {
                    $query->where('nama', $request->get('q'))
                        ->orWhere('ktp_id', $request->get('q'))
                        ->orWhere('bpjs_id', $request->get('q'))
                        ->orWhere('nik', $request->get('q'));
                })
                ->first();
            return ApiResponse::onlyEntity($data);
        } catch (Exception $e) {
            DB::rollBack();
            return ApiResponse::failed($e);
        }
    }

    public function dashboard(Request $request)
    {
        try {
            $pasienCount = PasienModel::count();
            $rsCount = RsModel::count();
            $ktpCount = KtpModel::count();
            $bpjsCount = BpjsModel::count();
            $alergiCount = AlergiModel::count();
            $lastPasien = PasienModel::with(['rs', 'ktp', 'bpjs', 'alergi'])->orderBy('tgl_catat', 'desc')->limit(10)->get();
            $rumahSakit = RsModel::withCount('pasien')->orderBy('pasien_count', 'desc')->limit(5)->get();
            $data = ([
                "pasienCount" => $pasienCount,
                "rsCount" => $rsCount,
                "ktpCount" => $ktpCount,
                "bpjsCount" => $bpjsCount,
                "alergiCount" => $alergiCount,
                "lastPasien" => $lastPasien,
                "rumahSakit" => $rumahSakit
            ]);
            return ApiResponse::onlyEntity($data);
        } catch (Exception $e) {
            DB::rollBack();
            return ApiResponse::failed($e);
        }
    }
}
