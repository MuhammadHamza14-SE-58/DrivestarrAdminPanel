<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Permission extends Model
{
    use Translatable;

    protected $table="permission_role";
    protected $fillable = ["id","key","table_name"];

   
}
