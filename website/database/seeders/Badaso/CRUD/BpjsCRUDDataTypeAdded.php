<?php

namespace Database\Seeders\Badaso\CRUD;

use Illuminate\Database\Seeder;
use Uasoft\Badaso\Facades\Badaso;
use Uasoft\Badaso\Models\MenuItem;

class BpjsCRUDDataTypeAdded extends Seeder
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

            $data_type = Badaso::model('DataType')->where('name', 'bpjs')->first();

            if ($data_type) {
                Badaso::model('DataType')->where('name', 'bpjs')->delete();
            }

            \DB::table('badaso_data_types')->insert(array (
                'id' => 2,
                'name' => 'bpjs',
                'slug' => 'bpjs',
                'display_name_singular' => 'Bpjs',
                'display_name_plural' => 'Bpjs',
                'icon' => 'attach_file',
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
                'created_at' => '2022-10-14T08:42:56.000000Z',
                'updated_at' => '2022-10-14T08:50:02.000000Z',
            ));

            Badaso::model('Permission')->generateFor('bpjs');

            $menu = Badaso::model('Menu')->where('key', config('badaso.default_menu'))->firstOrFail();

            $menu_item = Badaso::model('MenuItem')
                ->where('menu_id', $menu->id)
                ->where('url', '/general/bpjs')
                ->first();

            $order = Badaso::model('MenuItem')->highestOrderMenuItem($menu->id);

            if (!is_null($menu_item)) {
                $menu_item->fill([
                    'title' => 'Bpjs',
                    'target' => '_self',
                    'icon_class' => 'attach_file',
                    'color' => null,
                    'parent_id' => null,
                    'permissions' => 'browse_bpjs',
                    'order' => $order,
                ])->save();
            } else {
                $menu_item = new MenuItem();
                $menu_item->menu_id = $menu->id;
                $menu_item->url = '/general/bpjs';
                $menu_item->title = 'Bpjs';
                $menu_item->target = '_self';
                $menu_item->icon_class = 'attach_file';
                $menu_item->color = null;
                $menu_item->parent_id = null;
                $menu_item->permissions = 'browse_bpjs';
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
