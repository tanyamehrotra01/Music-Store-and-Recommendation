<?php

$link=mysqli_connect("localhost","root","","music store");
session_start();
extract($_POST);

$sql="insert into customer(first_name,last_name,city,street,zip,email,phone_number,prefered_genre) values('$_POST[f_name]','$_POST[l_name]','$_POST[city]','$_POST[street]','$_POST[zip]','$_POST[email]','$_POST[phone]','$_POST[genre]')";
$ret=mysqli_query($link,$sql);
$_SESSION["genre"]=$_POST['genre'];
$rows = mysqli_num_rows($ret);
for($i=0;$i<$rows;$i++)
{	
	$row=mysqli_fetch_row($ret);
	if($i==($rows-1))
	{$_SESSION["id"]=$row[0];
	}
	
}
	


?>

<html>
	<script>
		function fun1()
		{
			window.location="display_songs.php";
		}
	</script>
	<body onload="fun1()">
	</body>
</html>
	