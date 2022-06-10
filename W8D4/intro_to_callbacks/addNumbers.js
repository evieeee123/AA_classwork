const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    if (numsLeft > 0) {
        reader.question('Type a number: ', function (number) {
            const num = parseInt(number);
            sum += num;
            numsLeft -= 1;
            console.log(sum);
            addNumbers(sum, numsLeft, completionCallback);
        });
    } else if (numsLeft === 0) {
        reader.close();
        completionCallback(sum);
    }

}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));