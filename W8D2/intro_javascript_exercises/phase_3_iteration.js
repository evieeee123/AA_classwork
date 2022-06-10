Array.prototype.bubbleSort = function () {
    let sorted = false;
    while (!sorted) {
        sorted = true
        for(let i = 0; i < this.length - 1; i++) {
            if (this[i] > this[i + 1]) {
                [this[i], this[i + 1]] = [this[i + 1], this[i]];
                sorted = false;
            }
        }
    }
    return this;
}

// console.log([3, 8, 5, 6, 0, 1, 2].bubbleSort());


String.prototype.subStrings = function (){
    let newArr = [];

    for(let i = 0; i < this.length; i++) {
        for(let j = i + 1; j < this.length + 1; j++) {
            newArr.push(this.slice(i, j));
        }
    }
    return newArr;
}

console.log("abc".subStrings());