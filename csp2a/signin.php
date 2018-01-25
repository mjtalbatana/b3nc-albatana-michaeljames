<?php
  require_once 'assets/php/phpfunctions.php';
  fn_pagecheck();
  fn_session_init();
?>
<!DOCTYPE html>
<html lang="en">
<?php require 'assets/php/head.php'?>
<body>
<?php require 'assets/php/navheader.php'?>
  <main>
    <?php include 'assets/php/snackbar.php' ?>
    <form action="auth.php" method="post" id="signinform">
      <label for="username">Username: </label>
      <input type="text" name="username" placeholder="enter a registered username" id="username">
      <label for="password">Password: </label>
      <input type="password" name="password" placeholder="enter your password">
      <input type="submit" value="Sign In">
    </form>
    <!-- <?php var_dump($_SESSION)?> -->
  </main>
  <?php require 'assets/php/footer.php'?>
  <script language="javascript" defer>
    // document.getElementById("username").addEventListener("keypress", fn_ajax_validation);
    // function fn_ajax_validation(){
    // var username_entry = document.getElementById("username").value;
    // }

    function fn_runajax(){
      var ajax = new XMLHttpRequest();
      ajax.onreadstatechange = function(){
        if(this.readyState == 4 && this.status == 200){
          document.getElementById()
        }
      }
    }

    $('#username').on('input', function(){
      var usernameText = $(this).val();
      // console.log(usernameText);

      $.post('validation.php',
        { username: usernameText },
        function(data, status) {
          console.log('Processed: ' + data);
        });
    });
  </script>
</body>
</html>
<?php require 'assets/php/signature.php'?>
