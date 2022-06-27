function palindramic(str){

  let res = [];
  for(let i =0; i < str.length; i++){
    for(let j = i + 1; j < str.length; j++){
      if (isPalin(str.slice(i,j + 1))){
        res.push(str.slice(i,j + 1));
      }
    }
  }
  for(let i = 0; i < res.length; i++){
    let longest = res[0];
    let len = longest.length;
    if (res[i].length > len){
      longest = res[i]
    }
    return longest;
  }
}

function isPalin(str){
  let arr = str.split("");
  if (str === arr.reverse().join("")){
    return true;
  }else {
    return false;
  }
}

// let str = "babad";
// let str2 = "cbbd";

// console.log(palindramic(str));
// console.log(palindramic(str2));

function mFind(matrix, target) {
  let arr = matrix.flat();
  if (arr.length === 0) return false;
  let mid = Math.floor(arr.length / 2);
  let left = arr.slice(0, mid);
  let right = arr.slice(mid + 1);
  if(arr[mid] === target) {
    return true;
  }else if (arr[mid] > target) {
    return mFind(left, target);
  }else {
    let stack = mFind(right, target);
    if(stack) {
      return true;
    }else {
      return false
    }
  }
}

let matrix1 = [
  [1, 3, 5, 7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
];
let matrix2 = [
  [1, 3, 5, 7],
  [10, 11, 16, 20],
  [23, 30, 34, 50]
];
console.log(mFind(matrix1, 3));
console.log(mFind(matrix2, 13));