<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class PasienModel extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'pasien';

    public function ktp(){
        return $this->belongsTo(KtpModel::class, 'ktp_id', 'rfid');
    }

    public function bpjs(){
        return $this->belongsTo(BpjsModel::class, 'bpjs_id', 'barcode');
    }

    public function alergi(){
        return $this->belongsTo(AlergiModel::class);
    }

    public function rs(){
        return $this->belongsTo(RsModel::class);
    }
}
