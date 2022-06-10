const Board = require('./board');
const readline = require('readline');

reader = readline.creatInterface({
    input: process.stdin,
    output: process.stdout
})

class Game {
    constructor(){
        this.player1 = new HumanPlayer("X");
        this.player2 = new HumanPlayer("O");
        this.currentPlayer = this.player1;
        this.board = new Board;
    }

    switchTurn(){
        if (this.currentPlayer === this.player1) {
            this.currentPlayer = this.player2;
        }else {
            this.currentPlayer = this.player1;
        }
    }

    run(reader, completionCallback) {
        if (this.board.won) {
            completionCallback();
            console.log("You won!!!");
        } else {
            reader.question(`Select the row:`, function(rowNum){
                reader.question('select the col:', function(colNum){
                    const row = parseInt(rowNum);
                    const col = parseInt(colNum);
                });
            });
        }
    }
}
