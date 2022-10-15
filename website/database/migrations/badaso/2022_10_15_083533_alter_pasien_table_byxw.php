<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterPasienTableByxw extends Migration
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
            $table->dropForeign(['alergi_id']);
			$table->foreign('alergi_id')->references('id')->on('alergi')->onDelete('cascade')->onUpdate('cascade');
        });        Schema::table('pasien', function (Blueprint $table) {
            $table->dropForeign(['alergi_id']);
			$table->foreign('alergi_id')->references('id')->on('alergi')->onDelete('cascade')->onUpdate('cascade');
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
            $table->dropForeign(['alergi_id']);
			$table->foreign('alergi_id')->references('alergi')->on('alergi')->onDelete('cascade')->onUpdate('cascade');
        });
        Schema::table('pasien', function (Blueprint $table) {
            $table->dropForeign(['alergi_id']);
			$table->foreign('alergi_id')->references('alergi')->on('alergi')->onDelete('cascade')->onUpdate('cascade');
        });

    }
}
