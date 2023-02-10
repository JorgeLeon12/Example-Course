<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Validator;
use Illuminate\Support\Facades\Storage; 
use Illuminate\Support\Facades\Crypt;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\DB;


class RosterController extends Controller {
	public function get_students(Request $request){
		$data = DB::table("course_students")->select("student_id", "first_name", "last_name", "email")->get();
		return $data;
	}
	public function save_roster(Request $request){
		if($request->has("roster")){
			$roster = $request->input("roster");//[{"id": "1605031215599", "status": "Present"}, {"id": "1605092601799", "status": "Present"}, {"id": "1607102510699", "status": "Absent"} ]
			$roster = json_decode($roster);
			foreach ($roster as $key => $value) {
				DB::table('roster')->insert(
					['student_id' => $roster[$key]->id, 'status' => ($roster[$key]->status == 0 ? 'Absent':'Present')]
				);
			}
			return $roster;
		}else{
			return array('error' => "Missing param");
		}
	}
}