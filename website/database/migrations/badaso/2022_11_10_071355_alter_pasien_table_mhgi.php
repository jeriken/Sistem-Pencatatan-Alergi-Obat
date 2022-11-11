<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterPasienTableMhgi extends Migration
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
            $table->string('nama', 60)->charset('')->collation('')->change();
			$table->string('tmp_lahir', 60)->charset('')->collation('')->change();
			DB::statement('ALTER TABLE pasien ALTER COLUMN tgl_lahir DROP DEFAULT');
			$table->string('goldar', 3)->charset('')->collation('')->change();
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
            $table->string('nama', 255)->charset('')->collation('')->change();
			$table->string('tmp_lahir', 255)->charset('')->collation('')->change();
			$table->timestamp('tgl_lahir')->default('CURRENT_TIMESTAMP')->charset('')->collation('')->change();
			$table->string('goldar', 255)->charset('')->collation('')->change();
        });
    }
}
