<?php

namespace App\Models;

use Illuminate\Database\Query\Builder;
use Illuminate\Notifications\Notifiable;
use Saritasa\Database\Eloquent\Models\User as BaseUserModel;
use Saritasa\Enums\Gender;

/**
 * Application User
 *
 * @property int $id
 * @property string $first_name
 * @property string $last_name
 * @property string $email
 * @property string $password
 * @property string $facebook_id
 * @property string $instagram_id
 * @property Gender $gender
 * @property string $avatar_url
 * @property string $remember_token
 * @property \Carbon\Carbon $created_at
 * @property \Carbon\Carbon $updated_at
 * @property string $deleted_at
 * @method static Builder|User whereId($value)
 * @method static Builder|User whereFirstName($value)
 * @method static Builder|User whereLastName($value)
 * @method static Builder|User whereEmail($value)
 * @method static Builder|User wherePassword($value)
 * @method static Builder|User whereFacebookId($value)
 * @method static Builder|User whereInstagramId($value)
 * @method static Builder|User whereAvatarUrl($value)
 * @method static Builder|User whereGender($value)
 * @method static Builder|User whereRememberToken($value)
 * @method static Builder|User whereCreatedAt($value)
 * @method static Builder|User whereUpdatedAt($value)
 * @method static Builder|User whereDeletedAt($value)
 * @mixin \Eloquent
 */
class User extends BaseUserModel
{
    use Notifiable;

    const DEFAULT_AVATAR = 'images/avatar/default.png';

    protected $enums = [
        'gender' => Gender::class,
    ];

    protected $defaults = [
        'avatar_url' => self::DEFAULT_AVATAR
    ];
}
