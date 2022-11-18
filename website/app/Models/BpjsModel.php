<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BpjsModel extends Model
{
    use HasFactory;

    protected $table = 'bpjs';

    public $timestamps = false;


    public function pasien(){
        return $this->hasOne(PasienModel::class, 'bpjs_id');
    }
}
