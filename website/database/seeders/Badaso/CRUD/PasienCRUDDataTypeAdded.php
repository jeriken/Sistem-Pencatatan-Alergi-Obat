<?php

namespace Database\Seeders\Badaso\CRUD;

use Illuminate\Database\Seeder;
use Uasoft\Badaso\Facades\Badaso;
use Uasoft\Badaso\Models\MenuItem;

class PasienCRUDDataTypeAdded extends Seeder
{
    /**
     * Auto generated seed file
     *
     * @return void
     *
     * @throws Exception
     */
    public function run()
    {
        \DB::beginTransaction();

        try {

            $data_type = Badaso::model('DataType')->where('name', 'pasien')->first();

            if ($data_type) {
                Badaso::model('DataType')->where('name', 'pasien')->delete();
            }

            \DB::table('badaso_data_types')->insert(array (
                'id' => 4,
                'name' => 'pasien',
                'slug' => 'pasien',
                'display_name_singular' => 'Pasien',
                'display_name_plural' => 'Pasien',
                'icon' => 'people',
                'model_name' => NULL,
                'policy_name' => NULL,
                'controller' => NULL,
                'order_column' => NULL,
                'order_display_column' => NULL,
                'order_direction' => NULL,
                'generate_permissions' => true,
                'server_side' => false,
                'is_maintenance' => 0,
                'description' => NULL,
                'details' => NULL,
                'notification' => '[]',
                'is_soft_delete' => false,
                'created_at' => '2022-10-14T08:55:28.000000Z',
                'updated_at' => '2022-10-14T08:56:11.000000Z',
            ));

            Badaso::model('Permission')->generateFor('pasien');

            $menu = Badaso::model('Menu')->where('key', config('badaso.default_menu'))->firstOrFail();

            $menu_item = Badaso::model('MenuItem')
                ->where('menu_id', $menu->id)
                ->where('url', '/general/pasien')
                ->first();

            $order = Badaso::model('MenuItem')->highestOrderMenuItem($menu->id);

            if (!is_null($menu_item)) {
                $menu_item->fill([
                    'title' => 'Pasien',
                    'target' => '_self',
                    'icon_class' => 'people',
                    'color' => null,
                    'parent_id' => null,
                    'permissions' => 'browse_pasien',
                    'order' => $order,
                ])->save();
            } else {
                $menu_item = new MenuItem();
                $menu_item->menu_id = $menu->id;
                $menu_item->url = '/general/pasien';
                $menu_item->title = 'Pasien';
                $menu_item->target = '_self';
                $menu_item->icon_class = 'people';
                $menu_item->color = null;
                $menu_item->parent_id = null;
                $menu_item->permissions = 'browse_pasien';
                $menu_item->order = $order;
                $menu_item->save();
            }

            \DB::commit();
        } catch(Exception $e) {
            \DB::rollBack();

           throw new Exception('Exception occur ' . $e);
        }
    }
}
