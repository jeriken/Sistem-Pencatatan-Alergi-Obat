<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterKtpTableWqho extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        try {

                    Schema::table('ktp', function (Blueprint $table) {
            $table->string('agama', 20)->charset('')->collation('')->change();
			$table->string('pekerjaan', 60)->charset('')->collation('')->change();
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
        Schema::table('ktp', function (Blueprint $table) {
            $table->string('agama', 255)->charset('')->collation('')->change();
			$table->string('pekerjaan', 255)->charset('')->collation('')->change();
        });
    }
}
