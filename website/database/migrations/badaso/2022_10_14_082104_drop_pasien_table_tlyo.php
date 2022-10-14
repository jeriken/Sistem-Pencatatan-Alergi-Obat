<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DropPasienTableTlyo extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        try {

                    Schema::dropIfExists('pasien');

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
        Schema::create('pasien', function (Blueprint $table) {
            $table->bigInteger('id')->autoIncrement();
			$table->bigInteger('ktp_id')->index('ktp_id');
			$table->string('nama', 255);
			$table->string('tmp_lahir', 255);
			$table->timestamp('tgl_lhr')->default('as_defined');
			$table->text('alamat');
			$table->string('agama', 255);
			$table->string('pekerjaan', 255);
			$table->bigInteger('bpjs_id')->index('bpjs_id');
			$table->bigInteger('alergi_id')->index('alergi_id');
			$table->timestamps();
        });
    }
}
