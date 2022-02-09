// timer.js



// Set the date we're counting down to

var countDownDate = new Date("March 15, 2019 15:30:00").getTime();

var countdown = document.getElementById("tiles");

// Update the count down every 1 second

var x = setInterval(function() {



  // Get todays date and time

  var now = new Date().getTime();

    

  // Find the distance between now and the count down date

  var distance = countDownDate - now;

    

  // Time calculations for days, hours, minutes and seconds

  var days = Math.floor(distance / (1000 * 60 * 60 * 24));

  var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));

  var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));

  var seconds = Math.floor((distance % (1000 * 60)) / 1000);

    

    

  // HTML쪽으로 변수로 가져와서 사용하는 부분! 

  countdown.innerHTML = "<span>" + days + "</span><span>" + hours + "</span><span>" + minutes + "</span><span>" + seconds + "</span>"; 



  // 각각의 변수 id로 원하는 것만 가져와서 사용할 수 있다

  // document.getElementById("days").innerHTML = days;

  // document.getElementById("hours").innerHTML = hours;

  // document.getElementById("minutes").innerHTML = minutes;

  // document.getElementById("seconds").innerHTML = seconds;

    

  // If the count down is over, write some text 

  if (distance < 0) {

    clearInterval(x);

    document.getElementById("demo").innerHTML = "EXPIRED";

  }

}, 1000);