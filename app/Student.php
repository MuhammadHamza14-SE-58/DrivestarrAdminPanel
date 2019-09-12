<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use TCG\Voyager\Traits\Translatable;

class Student extends Model
{
    use Translatable;

    protected $table="students";
    protected $fillable = ['name',"school_id","qr_code"];

    /**
     * Statuses.
     */
    const STATUS_ACTIVE = 'ACTIVE';
    const STATUS_INACTIVE = 'INACTIVE';

    /**
     * List of statuses.
     *
     * @var array
     */
    public static $statuses = [self::STATUS_ACTIVE, self::STATUS_INACTIVE];

    protected $guarded = [];


    /**
     * Scope a query to only include active pages.
     *
     * @param  $query  \Illuminate\Database\Eloquent\Builder
     *
     * @return \Illuminate\Database\Eloquent\Builder
     */
    public function scopeActive($query)
    {
        return $query->where('status', static::STATUS_ACTIVE);
    }

    public function revokeNotification($parents_tokens,$type,$student){
        $messageBody="";
        if(!empty($student)){
            if($type=="checkin"){
                $messageBody=$student->name." has just checked in the School Bus";
            }else{   
                $messageBody=$student->name." has just checked Out the School Bus";
            }
        }
        // $parents_token="d8CsYLTOMzE:APA91bF-QLYdhl_ZV60AbB60qbTyYtoXKVQ6nO2e1qM4wFL6eJlpUalBy9Jv01kpITIje6Xy_Wk6FMGvpuggubIMDLCLrK0Fkj6vupkaG44hL-sNTOUXIY4LT_ItR2CtqseDSIVEYYOI";
        $data = array("to" => $parents_tokens, "notification" => array( 
            "title" => "Drivestarr", 
            "body" => $messageBody,
            // "icon" => "icon.png", 
            "click_action" => "MainActivity"
        )); 
            $data_string = json_encode($data); 
            // echo "The Json Data : ".$data_string; 
            $headers = array ( 'Authorization: key=' . env("authorizationKey"), 'Content-Type: application/json' ); 
            $ch = curl_init(); curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' ); 
            curl_setopt( $ch,CURLOPT_POST, true ); 
            curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers ); 
            curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true ); 
            curl_setopt( $ch,CURLOPT_POSTFIELDS, $data_string); 
            $result = curl_exec($ch); 
            curl_close ($ch); 
            // echo $result;
            // exit;
          
    }
}
