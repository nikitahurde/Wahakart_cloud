
  <div class="container">
  <div class="row justify-content-center" >
      <div class="col-md-12">
          <div class="card mt-5">
              <div class="card-header">
                  <h4>Expense Report</h4>
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
                    <div class="form-group">     
                    <input type="submit" name="submit" class="btn btn-primary" value="Filter">
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
					<col width="20%">
					<col width="30%">
					<col width="20%">
					
				</colgroup>
                      <thead>
                          <tr>
                              <th>Item Name</th>
                              <th>Details</th>
                              <th>Price</th>
                          </tr>
                      </thead>
                      <tbody>
                      
                      <?php
                            if (isset($_POST['submit'])) {
                            $start_date = $_POST['start_date'];
                            $end_date = $_POST['end_date'];
                            
                            $conn = mysqli_connect("localhost", "root", "", "sms_db");
                            $query = "SELECT * FROM expense WHERE expense_date BETWEEN '$start_date' AND '$end_date'";
                            $result = mysqli_query($conn, $query);
                            
                            if (mysqli_num_rows($result) > 0) {
                                $final_price=0;
                                while ($row = mysqli_fetch_assoc($result)) {
                                    $final_price=$final_price+$row['price'];
                                    ?>
                               <tr>
                           <td><?php echo $row['details']?></td>
                           <td><?php echo $row['item']?></td>
                           <td><?php echo $row['price']?></td>
                        </tr>
                        
                                <?php   }
                              
                             }
                             
                             else {
                                echo "No results found.";
                            }?>
                            <tr>
                              <th>Total</th>
                              <th></th>
                              <th><?php echo $final_price?></th>
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
                      '<h4 class="text-center">Expenses Report</h4>'+
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
