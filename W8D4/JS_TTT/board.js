function Board() {
    this.grid = new Array(3).fill(0).map(() => new Array(3));
}

Board.prototype.won = function() {
    for(let i = 0; i < this.grid.length; i++) {
        if (this.grid[i][0] === this.grid[i][1] && this.grid[i][1] === this.grid[i][2]) {
            return true;
        } else if (this.grid[0][i] === this.grid[1][i] && this.grid[1][i] === this.grid[2][i]){
            return true;
        } 
    }
    if (this.grid[0][0] === this.grid[1][1] && this.grid[1][1] === this.grid[2][2]) {
        return true;
    }

    if (this.grid[0][2] === this.grid[1][1] && this.grid[1][1] === this.grid[2][0]) {
        return true;
    }

    return false;

}

Board.prototype.winner = function() {
    if (this.won) {
        return true;
    } else {
        return false;
    }
}

Board.prototype.validPos = function(pos) {
    let [row, col] = pos;
    if ((row > this.grid.length || row < 0) && (col > this.grid.length || col < 0)) {
        return false;
    } else {
        return true;
    }
}
Board.prototype.empty = function(pos) {
    let [row,col] = pos;
    if (this.grid[row][col] !== undefined) {
        return false;
    }
    return true;
}

Board.prototype.place_mark = function(pos, mark) {
    let [row, col] = pos;
    if (this.empty(pos) && this.validPos(pos)) {
        this.grid[row][col] = mark;
    } else {
        throw new Error('not a valid position');
    }
}