<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterPasienTableJdvz extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        try {

                    Schema::table('pasien', function (Blueprint $table) {
            DB::statement('ALTER TABLE pasien ALTER COLUMN tgl_lahir DROP DEFAULT');
        });

        } catch (PDOException $ex) {
            $this->down();
            throw $ex;
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {


        Schema::table('pasien', function (Blueprint $table) {
            $table->dateTime('tgl_lahir')->default('CURRENT_TIMESTAMP')->charset('')->collation('')->change();
        });
    }
}
