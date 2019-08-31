<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Carbon\Carbon;
class StudentController extends Controller
{
    
  
    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function scan(Request $request)
    {   
       $user=$request->user();
       if(empty($user->id))
       {
           return response()->json([
               "message"=>"You must login first"
           ],500);
       }
       $student_id=$request->input("myContent");
       $bus_id=$request->input("bus_id");
       $type=$request->input("attendance_type");
       if(!empty($student_id))
       {
        $student_id=json_decode($student_id);
        $student_id = Crypt::decryptString($student_id->data);
        
        $data=\App\Student::find($student_id);
       
        if(!empty($data))
        {

            if($type=="checkout")
            {
            \App\StudentAttendance::create(["user_id"=>$data->id,"bus_id"=>$bus_id,"checkout"=>date("Y-m-d H:i:s")]);
            }
            else
            {
            \App\StudentAttendance::create(["user_id"=>$data->id,"bus_id"=>$bus_id,"checkout"=>date("Y-m-d H:i:s")]);
            }
            return response()->json(["message"=>"Attendance Successfull "],200);
        }
       }
       return response()->json(
           ["message"=>"Input required"],
           200);

    }
}
