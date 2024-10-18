<?php
require_once('../../config.php');
if(isset($_GET['id']) && $_GET['id'] > 0){
    $qry = $conn->query("SELECT * from `brands` where id = '{$_GET['id']}' ");
    if($qry->num_rows > 0){
        foreach($qry->fetch_assoc() as $k => $v){
            $$k=$v;
        }
    }
}
?>
<style>
	img#cimg{
		height: 15vh;
		width: 15vh;
		object-fit: scale-down;
		object-position: center center;
	}
</style>
<div class="container-fluid">
	<form action="" id="brands-form">
		<input type="hidden" name ="id" value="<?php echo isset($id) ? $id : '' ?>">
		<div class="form-group">
			<label for="brands_name" class="control-label">brands Name</label>
			<input name="brands_name" id="brands_name" class="form-control rounded-0" value="<?php echo isset($brands_name) ? $brands_name : ''; ?>">
		</div>
		
		<div class="form-group">
			<label for="brands_status" class="control-label">brands Status</label>
			<select name="brands_status" id="brands_status" class="custom-select selevt">
			<option value="1" <?php echo isset($brands_status) && $brands_status == 1 ? 'selected' : '' ?>>Active</option>
			<option value="0" <?php echo isset($brands_status) && $brands_status == 0 ? 'selected' : '' ?>>Inactive</option>
			</select>
		</div>
	</form>
</div>
<script>
	$(document).ready(function(){
		$('#brands-form').submit(function(e){
			e.preventDefault();
            var _this = $(this)
			 $('.err-msg').remove();
			start_loader();
			$.ajax({
				url:_base_url_+"classes/Master.php?f=save_brands",
				data: new FormData($(this)[0]),
                cache: false,
                contentType: false,
                processData: false,
                method: 'POST',
                type: 'POST',
                dataType: 'json',
				error:err=>{
					console.log(err)
					alert_toast("An error occured",'error');
					end_loader();
				},
				success:function(resp){
					if(typeof resp =='object' && resp.status == 'success'){
						location.reload();
					}else if(resp.status == 'failed' && !!resp.msg){
                        var el = $('<div>')
                            el.addClass("alert alert-danger err-msg").text(resp.msg)
                            _this.prepend(el)
                            el.show('slow')
                            end_loader()
                    }else{
						alert_toast("An error occured",'error');
						end_loader();
                        console.log(resp)
					}
				}
			})
		})
	})
</script>