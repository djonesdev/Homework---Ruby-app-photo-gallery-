// Two-player rps

alert('Would you like to play rock, paper, scissors?');

var userChoice = prompt("Do you choose rock, paper or scissors?");
var userChoice2 = prompt('Player 2, do you choose rock, paper or scissors?');

 var compare = function(userChoice,userChoice2) {
    
    if (userChoice===userChoice2) {
        return "The result is a tie!";
    }
    if (userChoice==="rock") {
        if (userChoice2==="scissors") {
            return "Player 1 wins";
        }
        else {
            return "Player 2 wins";
        }
    }
    if (userChoice==="paper") {
        if (userChoice2==="rock") {
            return "Player 1 wins";
        }
        else{
            return "Player 2 wins";
        }
    }

    if(userChoice==="scissors") {
        if(userChoice2==="rock") {
            return "player 2 wins";
        }
        else{
            return "Player 1 wins";
        }
    }
}
 alert(compare(userChoice,userChoice2));



// Single player rps

