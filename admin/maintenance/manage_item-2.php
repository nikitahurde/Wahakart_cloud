<?php
$conn=mysqli_connect("localhost","root","","sms_db");
if(mysqli_connect_error()){
    echo "not connected to database";
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>image upload</title>
</head>
<body>
<div class="modal" tabindex="-1" role="dialog" id="exampleModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <h1>upload images</h1>
    <div class="myform">
        <form action="" method="POST" enctype="multipart/form-data">
			
             <label>insert image</label>
             <input type="file" name="profile"><br>
	
			<label for="name" class="control-label">Name</label>
			<input type="text" name="name" id="name" >
            <div class="form-group">
			<label for="description" class="control-label">Description</label>
			<textarea name="description" id="description" cols="30" rows="2" class="form-control form no-resize"><?php echo isset($description) ? $description : ''; ?></textarea>
		</div>
        <div class="form-group">
			<label for="cost" class="control-label">Cost</label>
			<input type="number" name="cost" id="cost" step="any" class="form-control rounded-0 text-end" value="<?php echo isset($cost) ? $cost : ''; ?>">
		</div>

        <div class="form-group">
			<label for="categories_id" class="control-label">Categories</label>
			<select name="categories_id" id="categories_id" class="custom-select select2">
			<option <?php echo !isset($categories_id) ? 'selected' : '' ?> disabled></option>
			<?php 
			$categories = $conn->query("SELECT * FROM `categories` where categories_status = 1 order by `categories_name` asc");
			while($row=$categories->fetch_assoc()):
			?>
			<option value="<?php echo $row['id'] ?>" <?php echo isset($categories_id) && $categories_id == $row['id'] ? "selected" : "" ?> ><?php echo $row['categories_name'] ?></option>
			<?php endwhile; ?>
			</select>
		</div>
        <div class="form-group">
			<label for="brands_id" class="control-label">Brand</label>
			<select name="brands_id" id="brands_id" class="custom-select select2">
			<option <?php echo !isset($brands_id) ? 'selected' : '' ?> disabled></option>
			<?php 
			$brands = $conn->query("SELECT * FROM `brands` where brands_status = 1 order by `brands_name` asc");
			while($row=$brands->fetch_assoc()):
			?>
			<option value="<?php echo $row['id'] ?>" <?php echo isset($brands_id) && $brands_id == $row['id'] ? "selected" : "" ?> ><?php echo $row['brands_name'] ?></option>
			<?php endwhile; ?>
			</select>
		</div>

        <div class="form-group">
			<label for="status" class="control-label">Status</label>
			<select name="status" id="status" class="custom-select selevt">
			<option value="1" <?php echo isset($status) && $status == 1 ? 'selected' : '' ?>>Active</option>
			<option value="0" <?php echo isset($status) && $status == 0 ? 'selected' : '' ?>>Inactive</option>
			</select>
		</div>
		
             <!-- <button type="submit" name="upload">UPLOAD</button> -->
        
    </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" name="upload">Save changes</button>
      </div>
    </div>
  </div>
</div>
</form>
   


    <?php
    if(isset($_POST['upload']))
    {
        $img_loc=$_FILES['profile']['tmp_name'];
        $img_name=$_FILES['profile']['name'];
		$name=$_POST['name'];
		$description=$_POST['description'];
		$cost=$_POST['cost'];
        $categories_id=$_POST['categories_id'];
        $brands_id=$_POST['brands_id'];
        $status=$_POST['status'];
        $img_exc=pathinfo($img_name,PATHINFO_EXTENSION);
        $img_size=$_FILES['profile']['size']/(1024*1024);

        if(($img_exc!='jpg')&&($img_exc!='JPG')&&($img_exc!='png')&&($img_exc!='PNG')&&($img_exc!='jpeg')&&($img_exc!='JPEG')&&($img_exc!='webp')&&($img_exc!='WEBP'))
        {
            echo"<script>alert('Invalid Image Extension');</script>";
            exit();
        }
        if($img_size>3){
            echo"<script>alert('Image Size Allow Upto 3 Mb.');</script>";
            exit();
        }

        $query="INSERT INTO `item_list`(`name`,`description`,`profile`,`cost`,`categories_id`,`brands_id`) VALUES ('$name','$description','$img_name','$cost','$categories_id','$brands_id')";
        if(mysqli_query($conn,$query)){
            move_uploaded_file($img_loc,"upload/".$img_name);
            echo"<script>alert('successfull');</script>";
        }
        else{
            echo"<script>alert('unsuccessfull');</script>";
        }
        
    }
    ?>
</body>
</html>