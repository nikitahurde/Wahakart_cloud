


<div class="row card card-outline card-primary">
	<div class="col-md-12">
	<div class="col-md-12">
	<div class="card-header">
		<h3 class="card-title">List of Categories</h3>
		<div class="card-tools">
			<a href="javascript:void(0)" id="create_new" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Add Categories</a>
		</div>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
				<table class="table table-hovered table-striped" >
					<thead>
						<tr>
						    <th class="text-center">Id</th>							
							<th>categories Name</th>
							<th>Status</th>
							<th style="width:15%;">Options</th>
						</tr>
					</thead>
					
					<tbody>
					<?php 
					$i = 1;
						$qry = $conn->query("SELECT * from `categories` ");
						while($row = $qry->fetch_assoc()):
					?>
                <tr>
				    <td class="text-center"><?php echo $row['id']; ?></td>
                    <td><?php echo $row['categories_name']; ?></td>
                    <td> <?php if($row['categories_status'] == 1): ?>
                                    <span class="badge badge-success rounded-pill">Active</span>
                                <?php else: ?>
                                    <span class="badge badge-danger rounded-pill">Inactive</span>
                                <?php endif; ?></td>
                   <td >
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
				<!-- /table -->

			</div> <!-- /panel-body -->
		</div> <!-- /panel -->		
	</div> <!-- /col-md-12 -->
</div> <!-- /row -->



<script>
	$(document).ready(function(){
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this categories permanently?","delete_categories",[$(this).attr('data-id')])
		})
		$('#create_new').click(function(){
			uni_modal("<i class='fa fa-plus'></i> Add New categories","maintenance/manage_categories.php","mid-large")
		})
		$('.edit_data').click(function(){
			uni_modal("<i class='fa fa-edit'></i> Edit categories Detials","maintenance/manage_categories.php?id="+$(this).attr('data-id'),"mid-large")
		})
		$('.view_data').click(function(){
			uni_modal("<i class=''></i> categories Details","maintenance/view_categories.php?id="+$(this).attr('data-id'),"")
		})
		$('.table td,.table th').addClass('py-1 px-2 align-middle')
		$('.table').dataTable();
	})
	function delete_categories($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_categories",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				
				alert_toast("An error occured.",'error');
				end_loader();
			},
			success:function(resp){
				if(typeof resp== 'object' && resp.status == 'success'){
					location.reload();
				}else{
					alert_toast("An error occured.",'error');
					end_loader();
				}
			}
		})
	}
</script>