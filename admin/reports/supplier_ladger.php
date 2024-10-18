
<div class="card card-outline card-primary">
<?php
// Establish database connection
$dsn = "mysql:host=localhost;dbname=u432726438_wineshop";
$username = "u432726438_wineshop";
$password = "Kstar@2022";
$conn = new PDO($dsn, $username, $password);

// Construct SQL query
$sql = "SELECT `name` FROM supplier_list";

// Execute query and fetch data
$stmt = $conn->query($sql);
$data = $stmt->fetchAll(PDO::FETCH_ASSOC);

// Create HTML select element with options
// Step 1: Create HTML select element with options
$select = "<select name='myselect'class='form-control  ml-5 mt-5'>";
foreach ($data as $item) {
    $select .= "<option value='{$item['name']}'>{$item['name']}</option>";
}
$select .= "</select>";

?>
<form method="post">
  <div class="row">
  <div class="col-md-5"><?php echo $select;?></div>
  <div class="col-md-3  mt-5">
  <button type="submit" name="submit" class="btn btn-primary ml-5">Search</button>
  </div>
  </div>
</form>
<?php

// Step 2: Connect to database
$host = 'localhost';
$user = 'u432726438_wineshop';
$pass = 'Kstar@2022';
$dbname = 'u432726438_wineshop';
$conn = mysqli_connect($host, $user, $pass, $dbname);

// Check connection
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
}
?>
<div class="card card-outline card-primary m-5">
  <div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
<table class="table table-bordered table-stripped">
                    
                    <thead>
                        <tr>
                            <th>PO Code</th>
                            <th>Date Created</th>
                            <th>Total Amount</th>
                            
                        </tr>
                    </thead>
                    <tbody>


<?php
$selected_value = '';

// Step 3: Retrieve data based on the selected value
if (isset($_POST['submit'])) :
   
  $selected_value = $_POST['myselect'];
    
  $sql = "SELECT * FROM purchase_order_list WHERE supplier = '$selected_value'";
  $result = mysqli_query($conn, $sql);
  $total=0;
  // Step 4: Add selected row in HTML table
  while($row = mysqli_fetch_assoc($result)):
         
    ?>
    <tr>
                                <td class="text-center"><?php echo ($row['po_code']) ?></td>
                                <td><?php echo date("Y-m-d",strtotime($row['date_created'])) ?></td>
                                <td><?php echo ($row['amount'])?></td>
                                
                            </tr>
                            <?php
      // Accumulate total
      
      $total += $row['amount'];
  
    ?>
                           
                    </tbody>
                  
                    
                    <?php endwhile; ?>
                   <tfoot>
                        <tr>
                            <th class="text-right py-1 px-2" colspan="2"> Total</th>
                            <th class=" py-1 px-2 sub-total" id="total_bill_amount"><?php echo $total?></th>
                        </tr>
                   </tfoot>
                   
                        <?php endif; ?>
                </table>
                </div>
       </div>
     </div>
  </div>  
   <?php
  


?>

  <form action="" method="post" class="ml-5 mr-5">
      <div class="row">
                  <div class="col-md-5">
                      <div class="form-group">
                        <label for="supplier">supplier Name:</label>
                        <input class="form-control" value="<?php echo ($selected_value)?>" id="supplier" name="supplier">
                      </div>
                  </div>
                <div class="col-md-5">
                      <div class="form-group">
                        <label for="paid_amount">Paid Amount:</label>
                        <input class="form-control" type="number" id="paid_amount" name="paid_amount" value="0" oninput="updateBalance()">
                        </div>
                  </div>
                  <div class="col-md-5">
                      <div class="form-group">
                        <label for="balance_amount">Balance Amount:</label>
                        <input class="form-control" type="number" id="balance_amount" name="balance_amount" >
                        </div>
                  </div>
                  <div class="col-md-5">
                      <div class="form-group">
                        <label for="date">Payment Date:</label>
                        <input class="form-control" type="date" id="date" name="date">
                      </div>
                  </div>
                  <div class="col-md-2">
                      <div class="form-group pt-3" style="margin-top:-30px;margin-left:30px;">  
                        <input type="submit"  value="Submit" class="btn btn-primary">
                        </div>
                  </div>
      </div>
  </form>

  <?php
  if (isset($_POST['supplier']) && isset($_POST['paid_amount']) && isset($_POST['balance_amount']) && isset($_POST['date'])) {
  $supplier = $_POST['supplier'];
  $paid_amt = $_POST['paid_amount'];
  $payment_date = date('Y-m-d', strtotime($_POST['date'])); // format and sanitize date
  $balance_amt = $_POST['balance_amount'];

  // Insert data into database
  $sql = "INSERT INTO `supplier_payment` (supplier, paid_amount, balance_amount, `date`) VALUES ( '$supplier','$paid_amt','$balance_amt','$payment_date')";
  if (mysqli_query($conn, $sql)) {
  
  } else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }
  }
  ?>
  <div class="card card-outline card-primary m-5">
  <div class="card-body">
		<div class="container-fluid">
        <div class="container-fluid">
<table class="table table-bordered table-stripped">
                    
                    <thead>
                        <tr>
                            <th>SR No</th>
                            <th>Date Created</th>
                            <th>Paid Amount</th>
                            <th>Balance Amount</th>
                        </tr>
                    </thead>
                    <tbody>

<?php
if (isset($_POST['submit'])) :
   
  $selected_value = $_POST['myselect'];
  $total_paid=0; 
  $sql2 = "SELECT * FROM supplier_payment WHERE supplier = '$selected_value'";
  $result = mysqli_query($conn, $sql2);
  $total=0;
  // Step 4: Add selected row in HTML table
  while($row2 = mysqli_fetch_assoc($result)):
         
    ?>
    <tr>
                                <td class="text-center"><?php echo ($row2['id']) ?></td>
                                <td><?php echo date("Y-m-d",strtotime($row2['date'])) ?></td>
                                <td> <?php echo ($row2['paid_amount'])?></td>
                                 <td><?php echo ($row2['balance_amount'])?></td>
                                
                            </tr>
                            <?php
      // Accumulate total
      $total_paid += $row2['paid_amount'];
    ?>
                           
                    </tbody>
                  
                    
                    <?php endwhile; ?>
                   <tfoot>
                        <tr>
                            <th class="text-right py-1 px-2" colspan="2">Total:</th>
                            <th class=" py-1 px-2 sub-total" id="total_paid"><?php echo $total_paid?></th>

              
                            <th class="text-right py-1 px-2"></th>
                        </tr>
                   </tfoot>
                   
                        <?php endif; ?>
                </table>
                </div>
       </div>
     </div>
  </div>
</div>
<script>
    function updateBalance() {
  var total_paid = parseFloat(document.getElementById("total_paid").textContent);
  var total_bill = parseFloat(document.getElementById("total_bill_amount").textContent);
  var paid = parseFloat(document.getElementById("paid_amount").value);

  var balance = total_bill - (total_paid + paid);
  document.getElementById("balance_amount").value = balance.toFixed(2);
}

</script>
   <?php
// Step 5: Close database connection
mysqli_close($conn);
?>