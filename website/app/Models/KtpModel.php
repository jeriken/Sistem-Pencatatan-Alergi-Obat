<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KtpModel extends Model
{
    use HasFactory;

    protected $table = 'ktp';

    public $timestamps = false;

    public function pasien(){
        return $this->hasOne(PasienModel::class, 'ktp_id');
    }
}
