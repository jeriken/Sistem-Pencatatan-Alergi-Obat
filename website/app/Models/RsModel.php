<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RsModel extends Model
{
    use HasFactory;

    protected $table = 'rs';

    public $timestamps = false;

    public function pasien(){
        return $this->hasMany(PasienModel::class, 'rs_id');
    }
}
