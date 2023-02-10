<template>
	<div>
		<table class="tg">
			<thead>
				<tr>
					<th class="txt-center">Student id</th>
					<th class="txt-center">First Name</th>
					<th class="txt-center">Last Name</th>
					<th class="txt-center">Email</th>
					<th class="txt-center">Student Present</th>
				</tr>
			</thead>
			<tbody>
				<tr v-for="student in students" :key="student.student_id">
					<td class="txt-center">{{student.student_id}}</td>
					<td class="txt-center">{{student.first_name}}</td>
					<td class="txt-center">{{student.last_name}}</td>
					<td class="txt-center">{{student.email}}</td>
					<td class="txt-center">
						<input type="checkbox" id="checkbox" v-model="student.present">
					</td>
				</tr>
			</tbody>
		</table>
		<div><a class="myButton" @click="saveHandler">Save</a></div>
		<div>
			<h3>Feature:</h3>
			<a class="myButtonBlue" @click="checkAll(true)">Check All</a>
			<a class="myButtonRed" @click="checkAll(false)">Uncheck All</a>
		</div>
	</div>
</template>

<script>
	import axios from "axios";
	const ENDPOINT_PATH = "http://localhost:8000/";
	const GET_STUDENTS = "get/students";
	const SAVE_ROSTER = "save/roster";

	export default {
		name: 'Roster',
		data () {
			return {
				students: [],
			}
		},
		mounted(){
			this.getStudents();
		},
		methods:{
			checkAll(check){
				this.students.forEach(student => 
					student.present = check
				);
			},
			async getStudents(){
				console.log(ENDPOINT_PATH + GET_STUDENTS);
				this.students = [];
				var optionAxios = {
					headers: {
						'Content-Type': 'multipart/form-data'
					}
				}
				axios.get(ENDPOINT_PATH + GET_STUDENTS, new FormData(), optionAxios)
				.then(response => (response.data.forEach(student => 
						this.students.push({
							student_id: student.student_id,
							first_name: student.first_name,
							last_name: student.last_name,
							email: student.email,
							present: false,
						})
					)));
			},
			async saveHandler(){
				console.log(ENDPOINT_PATH + SAVE_ROSTER);
				var sendRoster = [];
				this.students.forEach(student => sendRoster.push({
					id: student.student_id,
					status: student.present
				}));
				var optionAxios = {
					headers: {
						'Content-Type': 'multipart/form-data'
					}
				}
				await axios.get(ENDPOINT_PATH + SAVE_ROSTER + "?roster=" + JSON.stringify(sendRoster), new FormData(), optionAxios)
				.then(response => (this.students = response.data));
				alert("Data saved, re-loading list of students");
				this.getStudents();
			}
		},
	}
</script>

<style lang="css" scoped>
	/*Table CSS generated with https://www.tablesgenerator.com/html_tables# */
	.tg{
		border-collapse:collapse;
		border-color:#ccc;
		border-spacing:0;
	}
	.tg td{
		background-color:#fff;
		border-color:#ccc;
		border-style:solid;
		border-width:1px;
		color:#333;
		font-family:Arial, sans-serif;
		font-size:14px;
		overflow:hidden;
		padding:10px 5px;
		word-break:normal;
	}
	.tg th{
		background-color:#f0f0f0;
		border-color:#ccc;
		border-style:solid;
		border-width:1px;
		color:#333;
		font-family:Arial, sans-serif;
		font-size:14px;
		font-weight:normal;
		overflow:hidden;
		padding:10px 5px;
		word-break:normal;
	}
	.tg .txt-center{
		text-align:left;
		vertical-align:top;
		text-align: center;
	}

	/*Button CSS generated with https://www.bestcssbuttongenerator.com/#/15 */
	.myButton, .myButtonRed, .myButtonBlue{
		margin-left: 25px;
	}
	.myButton {
		margin-top: 25px;
		box-shadow:inset 0px 1px 0px 0px #9acc85;
		background:linear-gradient(to bottom, #74ad5a 5%, #68a54b 100%);
		background-color:#74ad5a;
		border:1px solid #3b6e22;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:13px;
		font-weight:bold;
		padding:6px 12px;
		text-decoration:none;
	}
	.myButton:hover {
		background:linear-gradient(to bottom, #68a54b 5%, #74ad5a 100%);
		background-color:#68a54b;
	}
	.myButton:active {
		position:relative;
		top:1px;
	}

	.myButtonBlue {
		box-shadow:inset 0px -3px 7px 0px #29bbff;
		background:linear-gradient(to bottom, #2dabf9 5%, #0688fa 100%);
		background-color:#2dabf9;
		border-radius:3px;
		border:1px solid #0b0e07;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:15px;
		padding:9px 23px;
		text-decoration:none;
		text-shadow:0px 1px 0px #263666;
	}
	.myButtonBlue:hover {
		background:linear-gradient(to bottom, #0688fa 5%, #2dabf9 100%);
		background-color:#0688fa;
	}
	.myButtonBlue:active {
		position:relative;
		top:1px;
	}

	.myButtonRed {
		box-shadow:inset 0px 34px 0px -15px #b54b3a;
		background-color:#a73f2d;
		border:1px solid #241d13;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:15px;
		font-weight:bold;
		padding:9px 23px;
		text-decoration:none;
		text-shadow:0px -1px 0px #7a2a1d;
	}
	.myButtonRed:hover {
		background-color:#b34332;
	}
	.myButtonRed:active {
		position:relative;
		top:1px;
	}


</style>