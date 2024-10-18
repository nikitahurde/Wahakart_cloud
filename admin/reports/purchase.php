
  <div class="container">
  <div class="row justify-content-center">
      <div class="col-md-12">
          <div class="card mt-5">
              <div class="card-header">
                  <h4>Purchase Report</h4>
              </div>
              <div class="card-body">
              
              <form method="post">
              <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                      <label for="start_date">Start Date:</label>
                      <input class="form-control" type="date" id="start_date" name="start_date">
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">    
                      <label for="end_date">End Date:</label>
                      <input class="form-control" type="date" id="end_date" name="end_date">
                      </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group pt-3 mt-3">     
                    <input type="submit" name="submit" class="btn btn-primary" value="submit">
                    </div>
                </div>
                    </form>
              </div>
          </div>

        
              <div class="card-body" id="print_out">
		<div class="container-fluid">
        <div class="container-fluid">
			<table class="table table-bordered table-striped">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="15%">
                    <col width="10%">
					<col width="15%">
                    <col width="15%">
					<col width="10%">
					
				</colgroup>
                 
                      <thead>
                          <tr>
                              <th class="text-center">PO no</th>
                              <th class="text-center">Discount %</th>
                              <th class="text-center">Discount</th>
                              <th class="text-center">Tax %</th>
                              <th class="text-center">Tax</th>
                              <th class="text-center">Amount</th>
                              <th class="text-center">Status</th>
                          </tr>
                      </thead>
                      <tbody>
                      
                      <?php
                            if (isset($_POST['submit'])) {
                            $start_date = $_POST['start_date'];
                            $end_date = $_POST['end_date'];
                            
                            $conn = mysqli_connect("localhost", "root", "", "sms_db");
                            $query = "SELECT * FROM purchase_order_list WHERE date_updated BETWEEN '$start_date' AND '$end_date'";
                            $result = mysqli_query($conn, $query);
                            
                            if (mysqli_num_rows($result) > 0) {
                                $final_price=0;
                                $total_discount=0;
                                $total_tax=0;
                                while ($row = mysqli_fetch_assoc($result)) {
                                    $final_price=$final_price+$row['amount'];
                                    $total_discount=$total_discount+$row['discount'];
                                    $total_tax=$total_tax+$row['tax'];
                                    ?>
                                      <tr>
                                          <td class="text-center"><?= $row['po_code']; ?></td>
                                          <td class="text-center"><?= $row['discount_perc']; ?>%</td>
                                          <td class="text-center"><?= $row['discount']; ?></td>
                                          <td class="text-center"><?= $row['tax_perc']; ?>%</td>
                                          <td class="text-center"><?= $row['tax']; ?></td>
                                          <td class="text-center"><?= $row['amount']; ?></td>
                                          <td class="text-center"> <?php if($row['status'] == 1): ?>
                                                <span class="badge badge-primary rounded-pill">Pending</span>
                                            <?php else: ?>
                                                <span class="badge badge-success rounded-pill">Recived</span>
                                            <?php endif; ?>
                                        </td>
                                      </tr>
                                      <?php   }
                              
                            }
                            
                            else {
                               echo "No results found.";
                           }?>
                           <tr>
                             <th colspan="2"></th>
                             <th class="text-center"><spam style="font-weight:500;color:grey;">Total Discount</spam> <br><?php echo $total_discount?></th>
                             <th></th>
                             <th class="text-center"><spam style="font-weight:500;color:grey;">Total Tax </spam><br><?php echo $total_tax?></th>
                             <th class="text-center"><spam style="font-weight:500;color:grey;">Total Purchase </spam><br><?php echo $final_price?></th>
                             <th></th>
                          </tr>  
                          <?php  mysqli_close($conn);
                           }
                   ?>
                             
                      </tbody>
                  </table>
              </div>
          </div>

      </div>
  </div>
</div> 
<div class="card-footer py-1 text-center">
        <button class="btn btn-flat btn-success" type="button" id="print">Print</button>
        
    </div>
<script>

$(function(){
        $('#print').click(function(){
            start_loader()
            var _el = $('<div>')
            var _head = $('head').clone()
                _head.find('title').text("Expenses Report - Print View")
            var p = $('#print_out').clone()
            p.find('tr.text-light').removeClass("text-light bg-navy")
            _el.append(_head)
            _el.append('<div class="d-flex justify-content-center">'+
                      '<div class="col-1 text-right">'+
                      '<img src="<?php echo validate_image($_settings->info('logo')) ?>" width="65px" height="65px" />'+
                      '</div>'+
                      '<div class="col-10">'+
                      '<h4 class="text-center"><?php echo $_settings->info('name') ?></h4>'+
                      '<h4 class="text-center">Expenses Reports</h4>'+
                      '</div>'+
                      '<div class="col-1 text-right">'+
                      '</div>'+
                      '</div><hr/>')
            _el.append(p.html())
            var nw = window.open("","","width=1200,height=900,left=250,location=no,titlebar=yes")
                     nw.document.write(_el.html())
                     nw.document.close()
                     setTimeout(() => {
                         nw.print()
                         setTimeout(() => {
                            nw.close()
                            end_loader()
                         }, 200);
                     }, 500);
        })
    })
</script>
