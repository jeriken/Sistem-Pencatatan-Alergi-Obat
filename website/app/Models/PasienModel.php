<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PasienModel extends Model
{
    use HasFactory;

    protected $table = 'pasien';

    public function ktp(){
        return $this->belongsTo('App\Models\KtpModel');
    }

    public function bpjs(){
        return $this->belongsTo('App\Models\BpjsModel');
    }

    public function alergi(){
        return $this->belongsTo('App\Models\AlergiModel');
    }

    public function rs(){
        return $this->belongsTo(RsModel::class);
    }
}
