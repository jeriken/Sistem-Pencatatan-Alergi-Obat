<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AlergiModel extends Model
{
    use HasFactory;

    protected $table = 'alergi';

    public $timestamps = false;

    public function pasien(){
        return $this->hasOne(PasienModel::class, 'alergi_id');
    }
}
