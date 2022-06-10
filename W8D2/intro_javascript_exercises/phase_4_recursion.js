function range(start, end) {
    if (start === end) {
        return [start];
    }

    let res = range(start, end - 1);
    res.push(end);
    return res;
}

// console.log(range(2, 6));



function sumRec(arr) {
    let sum = arr[arr.length - 1];

    if (arr.length === 0) return 0;

    let res = sumRec(arr.slice(0, arr.length - 1)) + sum;
    return res;
}

// console.log(sumRec([2, 5, 1, 7]));


function exponent1(base, exp) {
    if (exp === 0) return 1;
    let res = exponent1(base, exp - 1) * base;
    return res;
}

// console.log(exponent1(3, 3));
// console.log(exponent1(2, 5));

function exponent2(base, exp) {
    if (exp === 0) return 1;
    if (exp === 1) return base;

    if (exp % 2 === 0) {
        let res = exponent2(base, exp / 2) ** 2;
        return res;
    } else {
        let res = base * (exponent2(base, (exp - 1) / 2) ** 2);
        return res;
    }
}
// console.log(exponent2(3, 3));
// console.log(exponent2(2, 5));



function fibonacci(n){
    if (n === 0) return [];
    if (n === 1) return [0];
    if (n === 2) return [0, 1];
    let res = fibonacci(n - 1);

    while (res.length < n) {
        res.push(res[res.length - 1] + res[res.length- 2]);
    }
    return res;
}

// console.log(fibonacci(0)); //[]
// console.log(fibonacci(2)); //[0,1]
// console.log(fibonacci(4)); //[0,1,1,2]
// console.log(fibonacci(6)); //[0,1,1,2,3,5]



function deepDup(arr){
    let res = [];
    if (!(arr instanceof Array)) return arr;
    for (let i = 0; i < arr.length; i++){
        res.push(deepDup(arr[i]));
    }
    return res
    // return arr.map((el) => {
    //     return deepDup(el);
    // });
}

// console.log(deepDup([2, 3, [4, 5], [[[6]]]]));


function bsearch(arr, target){
    if (arr.length === 0) return -1;
    let index = Math.floor(arr.length / 2);
    let left = arr.slice(0, index);
    let right = arr.slice(index+1);
    if (arr[index] === target) {
        return index;
    } else if (arr[index] > target) {
        return bsearch(left, target);
    } else {
        let stack = bsearch(right, target);
        if (stack !== -1) {
            return bsearch(right, target) + left.length + 1;
        }else {
            return -1;
        }  
    }
}

console.log(`bsearch([1, 2, 3], 3) = ${bsearch([1, 2, 3], 3)}`);
console.log(`bsearch([1, 2, 3], 2.5) = ${bsearch([1, 2, 3], 2.5)}`);

