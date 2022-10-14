<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePasienTableOydc extends Migration
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
			$table->timestamp('tgl_lhr');
			$table->text('alamat');
			$table->string('agama', 255);
			$table->string('pekerjaan', 255);
			$table->bigInteger('ktp_id')->nullable(true)->index('ktp_id');
			$table->bigInteger('bpjs_id')->nullable(true)->index('bpjs_id');
			$table->bigInteger('alergi_id')->nullable(true)->index('alergi_id');
			$table->timestamps();
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
