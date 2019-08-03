<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Token extends Model
{
    use Translatable;

    protected $table="oauth_access_tokens";
    public function user(){
        return $this->belongsTo('App\User', 'user_id');  
    }
}