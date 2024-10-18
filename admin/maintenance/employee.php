<style>
	.img-avatar {
		width: 45px;
		height: 45px;
		object-fit: cover;
		object-position: center center;
		border-radius: 100%;
	}
</style>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Employee</h3>
		<div class="card-tools">
			<button type="button" class="btn btn-flat btn-primary" data-toggle="modal" data-target="#exampleModal"><span class="fas fa-plus">
					Add Employee
			</button>
		</div>
	</div>
	<div class="card-body">
		<div class="container-fluid">
			<div class="container-fluid">
				<table class="table table-hovered table-striped">
					<colgroup>
						<col width="5%">
						<col width="15%">
						<col width="15%">
						<col width="20%">
						<col width="15%">

					</colgroup>
					<thead>
						<tr>
							<th>#</th>
							<th>Employee Img</th>
							<th>Employee Name</th>
							<th>Work</th>
							<th>Salary</th>
							<th>Status</th>
							<th>Action</th>

						</tr>
					</thead>
					<tbody>
						<?php

						$i = 1;
						$qry = $conn->query("SELECT i.*,s.categories_name as categories from `item_list_man` i inner join categories_man s on i.categories_id = s.id order by i.name asc,s.categories_name asc");
						while ($row = $qry->fetch_assoc()) :

						?>
							<tr>
								<td class="text-center"><?php echo $i++; ?></td>
								<td class="text-center"><img src="<?php echo $row['profile'] ?>" class="img-avatar img-thumbnail p-0 border-2" alt="user_avatar"></td>
								<td><?php echo $row['name'] ?></td>

								<td><?php echo $row['description'] ?></td>
								<td><?php echo $row['cost'] ?></td>

								<td class="text-center">
									<?php if ($row['status'] == 1) : ?>
										<span class="badge badge-success rounded-pill">Active</span>
									<?php else : ?>
										<span class="badge badge-danger rounded-pill">Inactive</span>
									<?php endif; ?>
								</td>
								<td align="center">
									<button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
										Action
										<span class="sr-only">Toggle Dropdown</span>
									</button>
									<div class="dropdown-menu" role="menu">
										<a class="dropdown-item view_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-eye text-dark"></span> View</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item edit_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-edit text-primary"></span> Edit</a>
										<div class="dropdown-divider"></div>
										<a class="dropdown-item delete_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>"><span class="fa fa-trash text-danger"></span> Delete</a>
									</div>
								</td>

							</tr>
						<?php endwhile; ?>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<div class="modal" tabindex="-1" role="dialog" id="exampleModal">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Add Employee</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<div class="myform">
					<form action="" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label for="profile" class="control-label">Employee Image</label><br>
							<input type="file" name="profile" class="form-control rounded-0 text-end"><br>
						</div>
						<div class="form-group">
							<label for="name" class="control-label">Name</label>
							<input type="text" name="name" class="form-control rounded-0 text-end" id="name">
						</div>
						<div class="form-group">
							<label for="description" class="control-label">Work</label>
							<!-- <input name="description" id="description" class="form-control form no-resize"><?php echo isset($description) ? $description : ''; ?></input> -->
							<select name="description" id="description" class="form-control form no-resize"><?php echo isset($description) ? $description : ''; ?>>
								<option value="Ghisai">Select Work</option>
								<option value="Ghisai">Ghisai</option>
								<option value="Molding">Molding</option>
								<option value="Painter">Painter</option>
								<option value="MudWork">Mud Work</option>
								<option value="Murtikar">Murtikar</option>
								<option value="Fabrication">Fabrication</option>
								<option value="Bowling_Machine">Bowling Machine</option>
							</select>
						</div>
						<div class="form-group">
							<label for="cost" class="control-label">Salary</label>
							<input type="number" name="cost" id="cost" step="any" class="form-control rounded-0 text-end" value="<?php echo isset($cost) ? $cost : ''; ?>">
						</div>

						<div class="form-group" hidden>
							<label for="categories_id" class="control-label">Employee type</label>
							<select name="categories_id" id="categories_id" class="custom-select select2">
								<option <?php echo !isset($categories_id) ? 'selected' : '' ?> disabled></option>
								<?php
								$categories = $conn->query("SELECT * FROM `categories_man` where categories_status = 1 order by `categories_name` asc");
								while ($row = $categories->fetch_assoc()) :
									$selected = isset($categories_id) && $categories_id == $row['id'] ? "selected" : ($row['id'] == 1 ? "selected" : "");
								?>
									<option value="<?php echo $row['id'] ?>" <?php echo $selected ?>><?php echo $row['categories_name'] ?></option>
								<?php endwhile; ?>
							</select>
						</div>

						<div hidden class="form-group">
							<label for="brands_id" class="control-label">Brand</label>
							<select name="brands_id" id="brands_id" class="custom-select select2">
								<option <?php echo !isset($brands_id) ? 'selected' : '' ?> disabled></option>
								<?php
								$brands = $conn->query("SELECT * FROM `brands` where brands_status = 1 order by `brands_name` asc");
								while ($row = $brands->fetch_assoc()) :
								?>
									<option value="<?php echo $row['id'] ?>" <?php echo isset($brands_id) && $brands_id == $row['id'] ? "selected" : "" ?>><?php echo $row['brands_name'] ?></option>
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
if (isset($_POST['upload'])) {
	$img_loc = $_FILES['profile']['tmp_name'];
	$img_name = $_FILES['profile']['name'];
	$img_path = "upload/$img_name";
	$name = $_POST['name'];
	$description = $_POST['description'];
	$cost = $_POST['cost'];
	$categories_id = $_POST['categories_id'];
	$brands_id = isset($_POST['brands_id']) ? $_POST['brands_id'] : 1;
	$status = $_POST['status'];
	$img_exc = pathinfo($img_name, PATHINFO_EXTENSION);
	$img_size = $_FILES['profile']['size'] / (1024 * 1024);

	// if (($img_exc != 'jpg') && ($img_exc != 'JPG') && ($img_exc != 'png') && ($img_exc != 'PNG') && ($img_exc != 'jpeg') && ($img_exc != 'JPEG') && ($img_exc != 'webp') && ($img_exc != 'WEBP')) {
	// 	echo "<script>alert('Invalid Image Extension');</script>";
	// 	exit();
	// }
	if ($img_size > 3) {
		echo "<script>alert('Image Size Allow Upto 3 Mb.');</script>";
		exit();
	}

	$query = "INSERT INTO `item_list_man`(`name`,`description`,`profile`,`cost`,`categories_id`,`brands_id`) VALUES ('$name','$description','$img_path','$cost','$categories_id','$brands_id')";
	if (mysqli_query($conn, $query)) {
		move_uploaded_file($img_loc, "upload/" . $img_name);
		echo "<meta http-equiv='refresh' content='0'>";
	}
}
?>
<script>
	$(document).ready(function() {
		$('.delete_data').click(function() {
			_conf("Are you sure to delete this Employee permanently?", "delete_category_man", [$(this).attr('data-id')])
		})
		$('#create_new').click(function() {
			uni_modal("<i class='fa fa-plus'></i> Add New Employee", "maintenance/manage_item_man.php", "mid-large")
		})
		$('.edit_data').click(function() {
			uni_modal("<i class='fa fa-edit'></i> Edit Employee Details", "maintenance/manage_item_man.php?id=" + $(this).attr('data-id'), "mid-large")
		})
		$('.view_data').click(function() {
			uni_modal("<i class='fa fa-box'></i> Employee Details", "maintenance/view_item_man.php?id=" + $(this).attr('data-id'), "")
		})
		$('.table td,.table th').addClass('py-1 px-2 align-middle')
		$('.table').dataTable();
	})

	function delete_category_man($id) {
		start_loader();
		$.ajax({
			url: _base_url_ + "classes/Master.php?f=delete_item_man",
			method: "POST",
			data: {
				id: $id
			},
			dataType: "json",
			error: err => {
				console.log(err)
				alert_toast("An error occured.", 'error');
				end_loader();
			},
			success: function(resp) {
				if (typeof resp == 'object' && resp.status == 'success') {
					location.reload();
				} else {
					alert_toast("An error occured.", 'error');
					end_loader();
				}
			}
		})
	}
</script>