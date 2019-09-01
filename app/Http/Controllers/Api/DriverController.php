<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Carbon\Carbon;
class DriverController extends Controller
{
    
  
    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function getAvailableBuses(Request $request){
        $user=$request->user();
        // $buses=\App\Bus::leftJoin("user","user.current_bus_id","=","bus.id")
        // ->where("")->get();
        $buses=\App\Bus::whereNotIn("id",
        \App\User::whereNotNull("current_bus_id")->pluck("current_bus_id"))
        ->get();
        return response()->json(["data"=> $buses]);

    }
}
