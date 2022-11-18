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

class CustomController extends Controller
{
    public function browsePasien(Request $request)
    {
        try {
            $data = PasienModel::with(['rs', 'ktp', 'bpjs', 'alergi'])
            ->where(function($query) use ($request) {
                $query->where('nama', 'LIKE', '%' . $request->get('q') . '%')
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

    public function searchPasien(Request $request)
    {
        try {
            $data = PasienModel::with(['rs', 'ktp', 'bpjs', 'alergi'])
            ->where(function($query) use ($request) {
                $query->where('nama', 'LIKE', '%' . $request->get('q') . '%')
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
