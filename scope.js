  var text = 'outside';
function logIt(){
    console.log(text);
    var text = 'inside';
};
logIt();

// text = 'outside';
// function logIt(){
//     console.log(text);
//     var text = 'inside';
// };
// logIt();