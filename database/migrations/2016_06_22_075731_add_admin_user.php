<?php

use App\Models\User;
use Illuminate\Database\Migrations\Migration;
use Saritasa\Roles\Enums\Roles;
use Saritasa\Roles\Models\Role;

class AddAdminUser extends Migration
{
    const ADMIN_EMAIL = 'admin@mail.com';

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $user = User::firstOrCreate([
            'first_name' => 'Admin',
            'last_name' => 'Saritasa',
            'email' => static::ADMIN_EMAIL,
            'password' => '123456'
        ]);
        $user->role_id = Role::where('slug', Roles::ADMIN)->first()->id;
        $user->save();
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        User::whereEmail(static::ADMIN_EMAIL)->delete();
    }
}
