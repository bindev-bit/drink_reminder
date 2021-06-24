<?php 
	include 'conn.php';
	$response = array();
	$method = $_SERVER['REQUEST_METHOD'];


	if($method == 'POST') {
		$ml = mysqli_real_escape_string($conn, $_POST['ml']);

		$sql = "insert into drink values (null, '$ml', CURRENT_DATE(), CURRENT_TIME())";

		$result = mysqli_query($conn, $sql);


	    if($result > 0){
			$response['value'] = 200;
	        $response['message'] = 'Success Add Data';

	    } else {
	    	$response['value'] = 400;
			$response['message'] = 'Bad Request';
	    }

	} else if($method == 'GET') {
		$query = mysqli_query($conn, "SELECT * FROM log_drink ORDER BY date ASC");

		if(mysqli_num_rows($query) == 0) {
			$response['value'] = 204;
			$response['message'] = 'Data is empty';
		} else {
			while($row = mysqli_fetch_assoc($query)) {
				$response[] = $row;
			}
		}

	} else if($method == 'DELETE') {
		$id = $_GET['id'];
		$value = mysqli_query($conn, "DELETE FROM log_drink WHERE id = '$id' ");

        if($value) {
        	$response['value'] = 200;
        	$response['message'] = "Data $id has been deleted";
        } else {
        	$response['value'] = 404;
			$response['message'] = 'Connection Failure';
        }
        
	} else {
		$response['value'] = 404;
		$response['message'] = 'Connection Failure';
	}

	echo json_encode($response);

 ?>
