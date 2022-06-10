Array.prototype.uniq = function () {
    let newArr = [];
    for (let i = 0; i < this.length; i++) {
        if (!newArr.includes(this[i])) {
            newArr.push(this[i]);
        }
    }
    return newArr
}

// let array = [1,3,2,3,4,1,4];
// let uniq_arr = array.uniq();
// console.log(uniq_arr);
// console.log(array);


Array.prototype.twoSum = function () {
    let pairs = [];
    for (let i = 0; i < this.length - 1; i++) {
        for (let j = i + 1; j < this.length - 1; j++) {
            if (this[i] + this[j] === 0) {
                pairs.push([i, j]);
            }
        }
    }
    return pairs;
}

// let array = [1, 2, 4, -4, -1, 0];
// console.log(array.twoSum());


Array.prototype.transpose = function() {
    let newArr = [];
    let len = this.length
    for(let i = 0; i < this.length; i++) {
        let subArr = [];
        for(let j = 0; j < this[i].length; j++) {
            subArr.push(this[j][i]);
        }
        newArr.push(subArr);
    }
    return newArr
}

// console.log([[0, 1, 2], [3, 4, 5], [6, 7, 8]].transpose());
