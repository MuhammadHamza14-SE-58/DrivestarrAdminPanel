<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Role extends Model
{
    use Translatable;

    protected $table="roles";
    protected $fillable = ['route_name',"company_id"];

    public function user()
    {
        return $this->hasOne('App\User', 'role_id');
    }
    public function permissions()
    {
            return $this->belongsToMany('App\Role', 'permission_role', 'permission_id', 'role_id');
      
    }
}
