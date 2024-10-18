


<div class="row card card-outline card-primary">
	<div class="col-md-12">
	<div class="card-header">
		<h3 class="card-title">List of Brands</h3>
		<div class="card-tools">
			<a href="javascript:void(0)" id="create_new" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span>  Add brands</a>
		</div>
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
				<table class="table table-hovered table-striped" id="managebrandsTable">
					<thead>
						<tr>
						    <th>Brands Id</th>							
							<th>Brands Name</th>
							<th>Status</th>
							<th style="width:15%;">Options</th>
						</tr>
					</thead>
					<tbody>
					<?php 
					$i = 1;
						$qry = $conn->query("SELECT * from `brands` ");
						while($row = $qry->fetch_assoc()):
					?>
                <tr>
				    <td class="text-center"><?php echo $row['id']; ?></td>
                    <td><?php echo $row['brands_name']; ?></td>
                    <td> <?php if($row['brands_status'] == 1): ?>
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
                
		
				</table>
				<!-- /table -->

			</div> <!-- /panel-body -->
		</div> <!-- /panel -->		
	</div> <!-- /col-md-12 -->
</div> <!-- /row -->

<script>
	$(document).ready(function(){
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this brands permanently?","delete_brands",[$(this).attr('data-id')])
		})
		$('#create_new').click(function(){
			uni_modal("<i class='fa fa-plus'></i> Add New brands","maintenance/manage_brands.php","mid-large")
		})
		$('.edit_data').click(function(){
			uni_modal("<i class='fa fa-edit'></i> Edit brands Detials","maintenance/manage_brands.php?id="+$(this).attr('data-id'),"mid-large")
		})
		$('.view_data').click(function(){
			uni_modal("<i class=''></i> brands Details","maintenance/view_brands.php?id="+$(this).attr('data-id'),"")
		})
		$('.table td,.table th').addClass('py-1 px-2 align-middle')
		$('.table').dataTable();
	})
	function delete_brands($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_brands",
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

