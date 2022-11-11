<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterBpjsTableXawb extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        try {

                    Schema::table('bpjs', function (Blueprint $table) {
            $table->string('nomor', 60)->charset('')->collation('')->change();
			$table->string('faskes', 100)->charset('')->collation('')->change();
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
        Schema::table('bpjs', function (Blueprint $table) {
            $table->string('nomor', 255)->charset('')->collation('')->change();
			$table->string('faskes', 255)->charset('')->collation('')->change();
        });
    }
}
