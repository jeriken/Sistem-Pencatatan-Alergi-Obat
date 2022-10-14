<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterPasienTableSfkz extends Migration
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
            $table->bigInteger('ktp_id')->charset('')->collation('')->change();
			$table->bigInteger('ktp_id')->unsigned()->charset('')->collation('')->change();
        });        Schema::table('pasien', function (Blueprint $table) {
            $table->foreign('ktp_id')->references('rfid')->on('ktp')->onDelete('set null')->onUpdate('set null');
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
            $table->dropForeign(['ktp_id']);
        });
        Schema::table('pasien', function (Blueprint $table) {
            $table->bigInteger('ktp_id')->nullable(true)->charset('')->collation('')->change();
			$table->bigInteger('ktp_id')->unsigned(false)->charset('')->collation('')->change();
        });
    }
}
