<?php

namespace Database\Seeders\Badaso\CRUD;

use Illuminate\Database\Seeder;
use Uasoft\Badaso\Traits\Seedable;

class BadasoDeploymentOrchestratorSeeder extends Seeder
{
    use Seedable;

    protected $seedersPath = 'database/seeders/Badaso/CRUD/';

    /**
     * Run the database seeders.
     *
     * @return void
     */
    public function run()
    {
        
        
        
        
        
        
        
        
        $this->seed(AlergiCRUDDataDeleted::class);
        $this->seed(PasienCRUDDataDeleted::class);
        
        
        
        
        $this->seed(BpjsCRUDDataDeleted::class);
        $this->seed(KtpCRUDDataDeleted::class);
        $this->seed(RsCRUDDataTypeAdded::class);
        $this->seed(RsCRUDDataRowAdded::class);
        $this->seed(AlergiCRUDDataTypeAdded::class);
        $this->seed(AlergiCRUDDataRowAdded::class);
        $this->seed(BpjsCRUDDataTypeAdded::class);
        $this->seed(BpjsCRUDDataRowAdded::class);
        $this->seed(KtpCRUDDataTypeAdded::class);
        $this->seed(KtpCRUDDataRowAdded::class);
        
        
        $this->seed(PasienCRUDDataTypeAdded::class);
        $this->seed(PasienCRUDDataRowAdded::class);
    }
}
