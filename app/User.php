<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;
class User extends \TCG\Voyager\Models\User
{
    use Notifiable,HasApiTokens;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',"bus_id","current_bus_id","device_token"
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function apirole(){
            return $this->belongsTo('App\Role', 'role_id');
    }
    public function token(){
        return $this->hasOne("App\Token","user_id");
    }
    // public function firebase_tokens()
    // {
    //     return $this->hasOne('App\UserFirebaseTokens', 'user_id');
    // }

    public function Bus()
    {
        return $this->belongsTo('App\Bus', 'bus_id');
    }   
    public function currentbus()
    {
        return $this->belongsTo('App\Bus', 'current_bus_id');
    }
}
