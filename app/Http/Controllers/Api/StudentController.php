<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Carbon\Carbon;
class AuthController extends Controller
{
    
  
    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function scan(Request $request)
    {   
       $request->user();
       $student_id=$request->input("data");
       if(!empty($student_id))
       {
           $student_id = Crypt::decryptString($encrypted);
           
       }
       return response()->json(["message"=>"Input required"],200);

    }
}
