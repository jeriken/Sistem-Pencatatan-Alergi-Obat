<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterPasienTableInsd extends Migration
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
            $table->dropForeign(['ktp_id']);
			$table->foreign('ktp_id')->references('rfid')->on('ktp')->onDelete('set null')->onUpdate('cascade');
			$table->dropForeign(['bpjs_id']);
			$table->foreign('bpjs_id')->references('barcode')->on('bpjs')->onDelete('set null')->onUpdate('cascade');
			$table->dropForeign(['alergi_id']);
			$table->foreign('alergi_id')->references('id')->on('alergi')->onDelete('set null')->onUpdate('cascade');
        });        Schema::table('pasien', function (Blueprint $table) {
            $table->dropForeign(['ktp_id']);
			$table->foreign('ktp_id')->references('rfid')->on('ktp')->onDelete('set null')->onUpdate('cascade');
			$table->dropForeign(['bpjs_id']);
			$table->foreign('bpjs_id')->references('barcode')->on('bpjs')->onDelete('set null')->onUpdate('cascade');
			$table->dropForeign(['alergi_id']);
			$table->foreign('alergi_id')->references('id')->on('alergi')->onDelete('set null')->onUpdate('cascade');
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
			$table->foreign('ktp_id')->references('rfid')->on('ktp')->onDelete('cascade')->onUpdate('cascade');
			$table->dropForeign(['bpjs_id']);
			$table->foreign('bpjs_id')->references('barcode')->on('bpjs')->onDelete('cascade')->onUpdate('cascade');
			$table->dropForeign(['alergi_id']);
			$table->foreign('alergi_id')->references('id')->on('alergi')->onDelete('cascade')->onUpdate('cascade');
        });
        Schema::table('pasien', function (Blueprint $table) {
            $table->dropForeign(['ktp_id']);
			$table->foreign('ktp_id')->references('rfid')->on('ktp')->onDelete('cascade')->onUpdate('cascade');
			$table->dropForeign(['bpjs_id']);
			$table->foreign('bpjs_id')->references('barcode')->on('bpjs')->onDelete('cascade')->onUpdate('cascade');
			$table->dropForeign(['alergi_id']);
			$table->foreign('alergi_id')->references('id')->on('alergi')->onDelete('cascade')->onUpdate('cascade');
        });

    }
}
