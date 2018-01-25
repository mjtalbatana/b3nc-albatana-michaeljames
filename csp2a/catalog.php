<?php
  require_once 'assets/php/phpfunctions.php';
  fn_pagecheck();
  fn_session_init();
  $_SESSION['webtitle'] = 'Whiskey Web App ';
  ?>
<!DOCTYPE html>
<html lang="en">
<?php require 'assets/php/head.php'?>
<body>
  <?php require 'assets/php/navheader.php'?>
  <main>
  <?php require 'assets/php/snackbar.php'?>
  <button onclick="window.location.href='formitem.php'">Add new item</button>
  <div id="thumbnail">
  <?php
  $fileopen = file_get_contents('items.json');
  $decodedarray = json_decode($fileopen, true);
  // var_dump($decodedarray);

  $j = count($decodedarray);
  for($i=1; $i<=$j; $i++){
    echo "<div class=\"containers\" id=\"container" . $i . "\">";
    echo "<div class=\"name\">" . $decodedarray[$i-1]['name'] . "</div>";
    echo "<img class=\"image\" src=\"" . $decodedarray[$i-1]['image'] . "\" onclick=\"window.location.href='item.php?id=$i'\">";
    echo "<div class=\"price\">" . $decodedarray[$i-1]['price'] . "</div>";
    echo "<div class=\"description\">" . $decodedarray[$i-1]['description'] . "</div>";
    echo "<button class=\"addtocart\">Add to cart</button><div class=\"category\">" . $decodedarray[$i-1]['category'] . "</div>";
    echo "</div>";
  }

  ?>
</div>
  </main>
  <?php require 'assets/php/footer.php'?>
</body>
</html>
<?php require 'assets/php/signature.php'?>
