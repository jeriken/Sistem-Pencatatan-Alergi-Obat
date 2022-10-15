<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AlterAlergiTableVzme extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        try {

                    Schema::table('alergi', function (Blueprint $table) {
            $table->bigInteger('alergi')->charset('')->collation('')->change();
			$table->dropIndex('alergi');
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
        Schema::table('alergi', function (Blueprint $table) {
            $table->index('alergi');
        });

        Schema::table('alergi', function (Blueprint $table) {
            $table->bigInteger('alergi')->unsigned()->charset('')->collation('')->change();
        });
    }
}
