<?php
extract($_POST);
session_start();
$a=$_POST['artist'];
$link=mysqli_connect("localhost","root","","music store");
$sql="select track_title,length_of_track,genre from track where track_title in (select track_title from produces where artist_id in (select artist_id from artist where artist_name like '$a'))";
$result=mysqli_query($link,$sql);

?>

<html>
	<body >
	<div style="position:absolute;left:30px;">
        <form id="form1" action="filter_artist.php" method="post">
            <label><h4>FILTER BASED ON ARTIST</h4></label><input id="artist" name="artist" type="text" value="" placeholder="Artist name"/>
			<input type="submit" value="GO"/>
        </form>
		
       <form id="form2" action="filter_genre.php" method="post"> 
		  <label><h4>FILTER BASED ON GENRE</h4></label><input id="genre" name="genre" type="text" value="" placeholder="Genre"/>
		  <input type="submit" value="GO"/>
        </form>
		
		 <form id="form3" action="display_songs.php" method="post">
		<input type="submit" value="ALL SONGS"/></form>
		<form id="form4" action="form.html" method="post"> 
		  
		  <input type="submit" value="ORDER"/>
        </form>
	
	</div>	  
		
		<center><table width="800" border="12" cellpadding="10" cellspacing="15">
                    <tr>
                    <th>Track Title</th>
					<th>Artist</th>
					 <th>Genre</th>
                    <th>Length</th>
                   
					
                    </tr>
                    </tr>
                    <?php
                        while($row = mysqli_fetch_array($result)) 
                        {
                            $title = $row['track_title'];
							$link=mysqli_connect("localhost","root","","music store");
							$sql="select artist_name from artist where artist_id in (select artist_id from produces where track_title like '$title')";
							$result1=mysqli_query($link,$sql);

							$length = $row['length_of_track'];
                            $genre = $row['genre'];
							
                            $row1 = mysqli_fetch_array($result1);
							$artist=$row1['artist_name'];
							
                            echo "<tr><td>".$title."</td><td>".$artist."</td>"."<td>".$genre."</td><td>".$length."</td></tr>";
                            
                            
                        }
                        echo "</table>";
                       
                    ?>
                    </table> </center>
					
              </form>
</body>
</html>