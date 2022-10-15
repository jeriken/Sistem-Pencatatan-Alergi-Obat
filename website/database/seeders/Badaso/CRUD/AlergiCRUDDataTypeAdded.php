<?php

namespace Database\Seeders\Badaso\CRUD;

use Illuminate\Database\Seeder;
use Uasoft\Badaso\Facades\Badaso;
use Uasoft\Badaso\Models\MenuItem;

class AlergiCRUDDataTypeAdded extends Seeder
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

            $data_type = Badaso::model('DataType')->where('name', 'alergi')->first();

            if ($data_type) {
                Badaso::model('DataType')->where('name', 'alergi')->delete();
            }

            \DB::table('badaso_data_types')->insert(array (
                'name' => 'alergi',
                'slug' => 'alergi',
                'display_name_singular' => 'Alergi',
                'display_name_plural' => 'Alergi',
                'icon' => 'healing',
                'model_name' => NULL,
                'policy_name' => NULL,
                'controller' => NULL,
                'order_column' => NULL,
                'order_display_column' => NULL,
                'order_direction' => NULL,
                'generate_permissions' => true,
                'server_side' => false,
                'description' => NULL,
                'details' => NULL,
                'notification' => '[]',
                'is_soft_delete' => false,
                'updated_at' => '2022-10-15T08:38:20.000000Z',
                'created_at' => '2022-10-15T08:38:20.000000Z',
                'id' => 5,
            ));

            Badaso::model('Permission')->generateFor('alergi');

            $menu = Badaso::model('Menu')->where('key', config('badaso.default_menu'))->firstOrFail();

            $menu_item = Badaso::model('MenuItem')
                ->where('menu_id', $menu->id)
                ->where('url', '/general/alergi')
                ->first();

            $order = Badaso::model('MenuItem')->highestOrderMenuItem($menu->id);

            if (!is_null($menu_item)) {
                $menu_item->fill([
                    'title' => 'Alergi',
                    'target' => '_self',
                    'icon_class' => 'healing',
                    'color' => null,
                    'parent_id' => null,
                    'permissions' => 'browse_alergi',
                    'order' => $order,
                ])->save();
            } else {
                $menu_item = new MenuItem();
                $menu_item->menu_id = $menu->id;
                $menu_item->url = '/general/alergi';
                $menu_item->title = 'Alergi';
                $menu_item->target = '_self';
                $menu_item->icon_class = 'healing';
                $menu_item->color = null;
                $menu_item->parent_id = null;
                $menu_item->permissions = 'browse_alergi';
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
