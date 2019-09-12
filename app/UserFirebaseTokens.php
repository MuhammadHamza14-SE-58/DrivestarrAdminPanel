<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class UserFirebaseTokens extends Model
{
    use Translatable;
    public $timestamps = false;
    protected $table="user_firebase_device_tokens";
    protected $fillable = ['user_id',"device_token"];

    /**
     * List of statuses.
     *
     * @var array
     */
   
    protected $guarded = [];


}
