<?php

use Illuminate\Database\Migrations\Migration;
use Saritasa\Roles\Enums\Roles;
use Saritasa\Roles\Models\Role;

class AddRoles extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Role::firstOrCreate([
            'name' => 'Admin',
            'slug' => Roles::ADMIN
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Role::whereSlug(Roles::ADMIN)->delete();
    }
}
