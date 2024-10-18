

<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Purchase Orders Expiry</h3>
       
	</div>
	<div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-bordered table-stripped">
                    <colgroup>
                        <col width="5%">
                        <col width="15%">
                        <col width="20%">
                        <col width="20%">
                        <col width="10%">
                        
                        
                    </colgroup>
                    <thead>
                        <tr>
                            <th>#</th>
                            <th align="center">Expiry Date</th>
                            <th align="center">PO Code</th>
                            <th align="center">Product Name</th>
                            <th align="center">QTY</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        $i = 1;
                        $qry = $conn->query("SELECT p.*,i.name,i.description FROM `po_items` p inner join item_list i on p.item_id = i.id ");
                        while($row = $qry->fetch_assoc()):
                            $row['expiry_date'] = $conn->query("SELECT  `expiry_date` FROM `purchase_order_list` where id = '{$row['po_id']}' ")->fetch_assoc()['expiry_date'];
                            $row['po_code'] = $conn->query("SELECT  `po_code` FROM `purchase_order_list` where id = '{$row['po_id']}' ")->fetch_assoc()['po_code'];
                           
                        ?>
                         
                            <tr>
                                <td class="text-center"><?php echo $i++; ?></td>
                                <td><?php echo date("Y-m-d",strtotime($row['expiry_date'])) ?></td>
                                <td><?php echo $row['po_code'] ?></td>
                                <td><?php echo $row['name'] ?></td>
                                <td align="center"><?php echo number_format($row['quantity']) ?></td>
                               
                                
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
		</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('.delete_data').click(function(){
			_conf("Are you sure to delete this Purchase Order permanently?","delete_po",[$(this).attr('data-id')])
		})
		$('.view_details').click(function(){
			uni_modal("Payment Details","transaction/view_payment.php?id="+$(this).attr('data-id'),'mid-large')
		})
		$('.table td,.table th').addClass('py-1 px-2 align-middle')
		$('.table').dataTable();
	})
	function delete_po($id){
		start_loader();
		$.ajax({
			url:_base_url_+"classes/Master.php?f=delete_po",
			method:"POST",
			data:{id: $id},
			dataType:"json",
			error:err=>{
				console.log(err)
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