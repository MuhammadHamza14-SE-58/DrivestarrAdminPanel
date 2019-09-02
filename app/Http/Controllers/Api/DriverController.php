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
        
        $buses=\App\Bus::whereNotIn("id",
        \App\User::whereNotNull("current_bus_id")
        ->pluck("current_bus_id"))
        ->get();
        $currentBus=\App\Bus::select("route_name","users.id")
        ->leftJoin("users","users.current_bus_id","=","bus.id")
        ->where("users.id","=",$user->id??"")
        ->first();
        
        return response()->json(["data"=> $buses,"currentBus"=>$currentBus]);
    }
    public function engageBus(Request $request){
        $user=$request->user();
        $user->current_bus_id=$request->input("bus_id");
        $user->save();
        $buses=\App\Bus::whereNotIn("id",
        \App\User::whereNotNull("current_bus_id")->pluck("current_bus_id"))
        ->get();

        $currentBus=\App\Bus::select("route_name","users.id")
        ->leftJoin("users","users.current_bus_id","=","bus.id")
        ->where("users.id","=",$user->id??"")
        ->first();
        return response()->json(["data"=> $buses,"currentBus"=>$currentBus]);
    }

    public function disengageBus(Request $request){
        $user=$request->user();
        $user->current_bus_id=$request->input("bus_id");
        $user->save();

        $buses=\App\Bus::whereNotIn("id",
        \App\User::whereNotNull("current_bus_id")->pluck("current_bus_id"))
        ->get();

        return response()->json(["data"=> $buses]);
    }
}
