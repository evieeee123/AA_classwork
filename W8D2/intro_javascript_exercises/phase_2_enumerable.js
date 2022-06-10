Array.prototype.myEach = function (func) {
    for(let i = 0; i < this.length; i++) {
        func(this[i]);
    }
}

// let num = [1,2,3,4];
// num.myEach((num) => console.log(num));


Array.prototype.myMap = function (func) {
    let newArr = [];
    this.myEach(el => newArr.push(func(el)));
    return newArr;
}

// let num = [1,2,3,4];
// console.log(num.myMap(num => num));



Array.prototype.myReduce = function (func, initialValue) {
    
}