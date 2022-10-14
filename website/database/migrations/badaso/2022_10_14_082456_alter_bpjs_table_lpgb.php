<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterBpjsTableLpgb extends Migration
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
            $table->string('barcode', 255)->unsigned()->charset('')->collation('')->change();
			$table->index('barcode');
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
            $table->string('barcode', 255)->unsigned(false)->charset('')->collation('')->change();
        });
    }
}
