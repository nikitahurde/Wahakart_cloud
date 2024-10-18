<?php
  

   $sub_sql='';
   $from='';
   $to='';
  
   if(isset($_GET['from'])){
   	$from=get_safe_value($_GET['from']);
   }
   if(isset($_GET['to'])){
   	$to=get_safe_value($_GET['to']);
   }
   
   if($from!=='' && $to!=''){
   	$sub_sql.=" and expense.expense_date between '$from' and '$to' ";
   }
   $res=mysqli_query($conn,"SELECT * from `expense` where expense.expense_date between '$from' and '$to'");
  
 ?>
<script>
   setTitle("Reports");
   selectLink('reports_link');
</script>
<div class="main-content">
   <div class="section__content section__content--p30">
      <div class="container-fluid">
         <div class="row">
            <div class="col-lg-12">
               <div class="filter_form">
                  <form method="get">
                     From <input type="date" name="from" value="<?php echo $from?>" max="<?php echo date('Y-m-d')?>" onchange="set_to_date()" id="from_date" class="form-control w250">
                     &nbsp;&nbsp;&nbsp;
                     To <input type="date" name="to"  value="<?php echo $to?>"  max="<?php echo date('Y-m-d')?>"  id="to_date" class="form-control w250">
                     
                     <button class="btn btn-lg btn-info btn-block">Submit</button>
                     <a href="expense.php">Reset</a>
                  </form>
               </div>
              
               <br/><br/>
               <div class="table-responsive table--no-card m-b-30">
                  <table class="table table-borderless table-striped table-earning">
                     <tr>
                        <th>Discription</th>
                        <th>item</th>
                        <th>Price</th>
                     </tr>
                     <tbody>
                     <?php 
                    $final_price=0;
                    while($row=mysqli_fetch_assoc($res)){
                    $final_price=$final_price+$row['price'];
                    	
                    ?>
                        <tr>
                           <td><?php echo $row['details']?></td>
                           <td><?php echo $row['item']?></td>
                           <td><?php echo $row['price']?></td>
                        </tr>
                        <?php } ?>
                        <tr>
                           <th>Total</th>
                           <th></th>
                           <th><?php echo $final_price?></th>
                        </tr>
                        
                     </tbody>
                  </table> 
                 
                
               </div>
              
            </div>
         </div>
      </div>
   </div>
</div>
<script>
   function set_to_date(){
		var from_date=document.getElementById('from_date').value;
		document.getElementById('to_date').setAttribute("min",from_date);
	}
   
   function get_safe_value($data){
      global $conn;
	if($data){
		return mysqli_real_escape_string($conn,$data);
	}
}
</script>
