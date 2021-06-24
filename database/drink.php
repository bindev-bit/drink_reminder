<?php 
	include 'conn.php';

	$response = array();
	
	if($_SERVER['REQUEST_METHOD'] == 'POST') {
		
		$date = $_POST['date'];
		$q = mysqli_query($conn, "SELECT * from drink where date = '$date' ORDER BY id DESC");
		
		if(mysqli_num_rows($q) == 0) {
			$response['value'] = 204;
			$response['message'] = 'Data is Empty';
		} else {
			$response['value'] = 200;
			$response['message'] = 'success get data';
			while ($row = mysqli_fetch_assoc($q)) {
				$response['data'][] = $row;
			}	
		}
	

	} else if($_SERVER['REQUEST_METHOD'] == 'GET') {
		$date = $_GET['date'];
		$query = mysqli_query($conn, "SELECT * FROM log_drink WHERE date = '$date'");

		if(mysqli_num_rows($query) == 0) {
			$sql = "insert into drink values (null, '0', CURRENT_DATE(), CURRENT_TIME())";

			$result = mysqli_query($conn, $sql);
		} else {
			$response['value'] = 200;
			$response['message'] = 'success get data';
			while($row = mysqli_fetch_assoc($query)) {
				$response['data'][] = $row;
			}
		}
	} else {
		$response['value'] = 400;
		$response['message'] = 'Bad Request';
	}

	echo json_encode($response);

 ?>