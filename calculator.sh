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

while true; do
    read -p "What is your calculation? (e.g. 7 3 +, -, x, / or 'q' to finish): " num1 num2 operator

    if [[ $num1 = "q" || $num2 = "q" || $operator = "q" ]]; then
        echo "Script is terminated..."
        break
    fi

    result=$(calculate $num1 $num2 $operator)
    echo "Result: $result"
done
