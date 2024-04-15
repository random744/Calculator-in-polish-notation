#!/bin/bash
 
calculate() {
 
    num1=$1
    num2=$2
    operator=$3
 
    if [ "$operator" = "+" ]; then
        echo $(($num1 + $num2))
    elif [ "$operator" = "-" ]; then
        echo $(($num1 - $num2))
    elif [ "$operator" = "x" ]; then
        echo $(($num1 * $num2))
    elif [ "$operator" = "/" ]; then
        echo $(($num1 / $num2))
    else
        echo "This is not a correct calculation!"
    fi
}
 
read -p "What is your calculation? (e.g. 7 3 +, -, x, /): " operator num1 num2
result=$(calculate $operator $num1 $num2)
echo "Result: $result"