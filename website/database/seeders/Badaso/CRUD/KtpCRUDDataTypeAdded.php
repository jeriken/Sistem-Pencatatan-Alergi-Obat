<?php

namespace Database\Seeders\Badaso\CRUD;

use Illuminate\Database\Seeder;
use Uasoft\Badaso\Facades\Badaso;
use Uasoft\Badaso\Models\MenuItem;

class KtpCRUDDataTypeAdded extends Seeder
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

            $data_type = Badaso::model('DataType')->where('name', 'ktp')->first();

            if ($data_type) {
                Badaso::model('DataType')->where('name', 'ktp')->delete();
            }

            \DB::table('badaso_data_types')->insert(array (
                'id' => 1,
                'name' => 'ktp',
                'slug' => 'ktp',
                'display_name_singular' => 'Ktp',
                'display_name_plural' => 'Ktp',
                'icon' => 'fingerprint',
                'model_name' => NULL,
                'policy_name' => NULL,
                'controller' => 'App\\Http\\Controllers\\KtpController',
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
                'created_at' => '2022-10-14T08:39:42.000000Z',
                'updated_at' => '2022-10-16T04:23:44.000000Z',
            ));

            Badaso::model('Permission')->generateFor('ktp');

            $menu = Badaso::model('Menu')->where('key', config('badaso.default_menu'))->firstOrFail();

            $menu_item = Badaso::model('MenuItem')
                ->where('menu_id', $menu->id)
                ->where('url', '/general/ktp')
                ->first();

            $order = Badaso::model('MenuItem')->highestOrderMenuItem($menu->id);

            if (!is_null($menu_item)) {
                $menu_item->fill([
                    'title' => 'Ktp',
                    'target' => '_self',
                    'icon_class' => 'fingerprint',
                    'color' => null,
                    'parent_id' => null,
                    'permissions' => 'browse_ktp',
                    'order' => $order,
                ])->save();
            } else {
                $menu_item = new MenuItem();
                $menu_item->menu_id = $menu->id;
                $menu_item->url = '/general/ktp';
                $menu_item->title = 'Ktp';
                $menu_item->target = '_self';
                $menu_item->icon_class = 'fingerprint';
                $menu_item->color = null;
                $menu_item->parent_id = null;
                $menu_item->permissions = 'browse_ktp';
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
