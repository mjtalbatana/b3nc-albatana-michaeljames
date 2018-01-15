﻿<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0"> -->
  <meta http-equiv="x-ua-compatible" content="ie=edge">
  <title>PHP Programming - Expressions, Control Statements, and Loops</title>
  <link rel="icon" href="https://raw.githubusercontent.com/mjtalbatana/profile-logo/master/mjta-v01.ico" type="image/x-icon">
  <!-- <link rel="stylesheet" href="css/style.css" type="text/css"> -->
</head><!-- END of <head> section ======================================================================================= -->

<body>
<h1>LOOPS</h1>
<input type="number" value="0" name="weight" placeholder="enter weight (in kilograms)">
<input type="number" value="0" name="height" placeholder="enter height (in meters)">
<?php
  echo '<h2>IF ELSEIF ELSE statement:</h2>';
  $mass = 600; //in kilograms
  $height = 1.7; //in meters
  $bmi = round(($mass / ($height * $height)), 2);
  $echomsg = '';
  if($bmi < 16){
    $echomsg = 'severe thinness';
  } elseif(($bmi >= 16) AND ($bmi < 17)){
    $echomsg = 'moderate thinness';
  } elseif(($bmi >= 17) AND ($bmi < 18.5)){
    $echomsg = 'mild thinness';
  } elseif(($bmi >= 18.5) AND ($bmi < 25)){
    $echomsg = 'normal';
  } elseif(($bmi >= 25) AND ($bmi < 30)){
    $echomsg = 'overweight';
  } elseif(($bmi >= 30) AND ($bmi < 35)){
    $echomsg = 'obese class 1';
  } elseif(($bmi >= 35) AND ($bmi < 40)){
    $echomsg = 'obese class 2';
  } elseif(($bmi >= 40)){
    $echomsg = 'obsee class 3';
  } else{
    $echomsg = 'invalid input';
  }
  echo "Your weight is: $mass kg, and your height is: $height meters" . '<br>';
  echo "Your BMI is: $bmi and it is a <strong>$echomsg</strong> condition" . '<br>';
  ?>

<?php
  echo '<h2>SWITCH statement:</h2>';
  $echomsg = '';
  switch ($bmi){
    case ($bmi < 16):
    $echomsg = 'severe thinness';
    break;
    case (($bmi >= 16) AND ($bmi < 17)):
    $echomsg = 'moderate thinness';
    break;
    case (($bmi >= 17) AND ($bmi < 18.5)):
    $echomsg = 'mild thinness';
    break;
    case (($bmi >= 18.5) AND ($bmi < 25)):
    $echomsg = 'normal';
    break;
    case (($bmi >= 25) AND ($bmi < 30)):
    $echomsg = 'overweight';
    break;
    case (($bmi >= 30) AND ($bmi < 35)):
    $echomsg = 'obese class 1';
    break;
    case (($bmi >= 35) AND ($bmi < 40)):
    $echomsg = 'obese class 2';
    break;
    case ($bmi >= 40):
    $echomsg = 'obsee class 3';
    break;
    default:
    $echomsg = 'invalid input';
  }
  echo "Your weight is: $mass kg, and your height is: $height meters" . '<br>';
  echo "Your BMI is: $bmi and it is a <strong>$echomsg</strong> condition" . '<br>';
  ?>

<?php
  echo '<h2>WHILE statement:</h2>';
  $arraypoints1 = array(0, 16, 17, 18.5, 25, 30, 35, 40, 999);
  $arraypoints2 = array('severe thinness', 'moderate thinness', 'mild thinness', 'normal', 'overweight', 'obese class 1', 'obese class 2', 'obese class 3');
  $i = 1;
  while($i <= 9){
    if(($bmi >= $arraypoints1[$i-1]) AND ($bmi < $arraypoints1[$i])){
      echo "Your weight is: $mass kg, and your height is: $height meters" . '<br>';
      echo "Your BMI is: $bmi and it is a <strong>" .  $arraypoints2[$i - 1] . "</strong> condition" . '<br>';
      break;
    }
    $i++;
  }


?>
</body>

</html>
<!-- HTML5 Template version 1.5 20171225 ===================-->
<!-- Developer: Michael James Turiano Albatana              -->
<!-- Email: mjtalbatana@gmail.com                           -->
<!-- Github: https://github.com/mjtalbatana                 -->
<!-- LinkedIn: https://www.linkedin.com/in/mjtalbatana      -->
<!-- END OF HTML FILE ======================================-->