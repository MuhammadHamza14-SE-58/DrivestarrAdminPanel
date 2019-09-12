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
            \App\StudentAttendance::create(["user_id"=>$data->id,"bus_id"=>$bus_id,"checkin"=>date("Y-m-d H:i:s")]);
            }

            $student=new \App\Student();
            $userTokens=\App\Student::select("user_firebase_device_tokens.device_token")
        ->leftJoin("user_students",
        "user_students.student_id",
        "=","students.id")
        ->leftJoin("users","user_students.user_id","=","users.id")
        ->join("user_firebase_device_tokens","user_firebase_device_tokens.user_id","=","users.id")
        ->where("students.id",$student_id)
        ->get();

        if(count($userTokens)>0){
            $tokens='';
          
            foreach($userTokens as $token){
                $tokens=$token->device_token;
       $student->revokeNotification($tokens,$type,$data);
                }
       
        //   $tokens=substr($tokens,0,-1);     
          
        }
            return response()->json(["message"=>"Attendance Successfull "],200);
        }
       }
       return response()->json(
           ["message"=>"Input required"],
           200);
    }

    public function addParentsNotification(Request $request){
        $user=$request->user();
        $count=\App\UserFirebaseTokens::where("device_token",$request->input("device_token"))
        ->count();
        
        if($count==0){
        \App\UserFirebaseTokens::create(
        ["user_id"=>$user->id,"device_token"=>$request->input("device_token")]
            );
        }
       return response()->json(["data"=>"success"]); 
    }

    public function getStudentAttendance(Request $request){
        $user=$request->user();
        $date=$request->input("date");
        if(empty($date)){
            $date=date("Y-m-d");
        }else{
            $date=date("Y-m-d",strtotime($date));
        }
       $data= \App\StudentAttendance::select("bus.route_name",
       "students.name","student_attendance.checkin",
       "student_attendance.checkout")
        ->leftJoin("students",
        "students.id","=","student_attendance.user_id")
        ->leftJoin("user_students","user_students.student_id","=","students.id")
        ->leftJoin("users","user_students.user_id","=","users.id")
        ->leftJoin("bus","student_attendance.bus_id","=","bus.id")
        ->where("users.id",$user->id)
        ->where(\DB::raw("DATE(checkin)"),$date)
        ->orWhere(\DB::raw("DATE(checkout)"),$date)
        ->get();
        $attendances=[];
        foreach($data as $attendance){
            $type=!empty($attendance->checkin)?"checkedin":"checkedout";
            $date=!empty($attendance->checkin)?$attendance->checkin:$attendance->checkout;
            array_push($attendances,
            $attendance->name." ".$type." at ".$date);
        }
        return response()->json(["data"=>$attendances]);
    }
}
