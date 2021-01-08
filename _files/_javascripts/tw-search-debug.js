$(document).keyup(function(e) {
    if(e.key === 'Enter') {
        console.log("pressed Enter")
    }
});

$("form").keypress(function(e) {
  //Enter key
  if (e.which == 13) {
    //console.log("pressed Enter in form")
    return false;
  }
});

function twSearch() {
  console.log('loaded');
}
