
  <div class="container">
  <div class="row justify-content-center">
      <div class="col-md-12">
          <div class="card mt-5">
              <div class="card-header">
                  <h4>Purchase Report</h4>
              </div>
              <div class="card-body">
              
                  <form action="" method="GET">
                      <div class="row">
                          <div class="col-md-4">
                              <div class="form-group">
                                  <label>From Date</label>
                                  <input type="date" name="from_date" value="<?php if(isset($_GET['from_date'])){ echo $_GET['from_date']; } ?>" class="form-control">
                              </div>
                          </div>
                          <div class="col-md-4">
                              <div class="form-group">
                                  <label>To Date</label>
                                  <input type="date" name="to_date" value="<?php if(isset($_GET['to_date'])){ echo $_GET['to_date']; } ?>" class="form-control">
                              </div>
                          </div>
                          <div class="col-md-4">
                              <div class="form-group">
                                  <label></label> <br>
                                <button type="submit" class="btn btn-primary">submit</button>
                              </div>
                          </div>
                      </div>
                  </form>
              </div>
          </div>

          <div class="card mt-4">
              <div class="card-body">
                  <table class="table table-borderd">
                      <thead>
                          <tr>
                              <th>PO no</th>
                              <th>Product Name</th>
                              <th>QTY</th>
                              <th>Tax</th>
                              <th>Price</th>
                          </tr>
                      </thead>
                      <tbody>
                      
                      <?php 
                          $con = mysqli_connect("localhost","root","","sms_db");

                          if(isset($_GET['from_date']) && isset($_GET['to_date']))
                          {
                              $from_date = $_GET['from_date'];
                              $to_date = $_GET['to_date'];
                             
                              $query = "SELECT * FROM purchase_order_list WHERE date_updated BETWEEN '$from_date' AND '$to_date' ";
                              $query_run = mysqli_query($con, $query);
                             
                              if(mysqli_num_rows($query_run) > 0)
                              {
                                  foreach($query_run as $row)
                                  {
                                    $final_price=0;
                                     $final_price=$final_price+$row['price'];
                                      ?>
                                      <tr>
                                          <td><?= $row['po_code']; ?></td>
                                          <td><?= $row['item']; ?></td>
                                          <td><?= $row['quantity']; ?></td>
                                          <td><?= $row['tax']; ?></td>
                                          <td><?= $row['price']; ?></td>
                                          
                                      </tr>
                                      <tr>
                                          <th>Total</th>
                                          <th></th>
                                          <th></th>
                                          <th></th>
                                          <th><?php echo $final_price?></th>
                                       </tr>
                                      <?php
                                  }
                              }
                              else
                              {
                                  echo "No Record Found";
                              }
                          }
                      ?>
                      </tbody>
                  </table>
              </div>
          </div>

      </div>
  </div>
</div>
</script>
