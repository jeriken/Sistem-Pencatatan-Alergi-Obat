<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePasienTableHifr extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        try {

                    Schema::create('pasien', function (Blueprint $table) {
            $table->bigInteger('id')->unsigned()->autoIncrement();
			$table->string('nama', 255);
			$table->string('tmp_lahir', 255);
			$table->timestamp('tgl_lahir');
			$table->text('alamat');
			$table->string('goldar', 255)->nullable(true);
			$table->bigInteger('nik')->nullable(true);
			$table->string('ktp_id', 255)->nullable(true);
			$table->string('bpjs_id', 255)->nullable(true);
			$table->bigInteger('alergi_id')->nullable(true)->unsigned();
			$table->timestamps();
        });

        Schema::table('pasien', function (Blueprint $table) {
            $table->foreign('ktp_id')->references('rfid')->on('ktp')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('bpjs_id')->references('barcode')->on('bpjs')->onDelete('cascade')->onUpdate('cascade');
			$table->foreign('alergi_id')->references('alergi')->on('alergi')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('pasien');
    }
}
