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
        if [ $num2 -eq 0 ]; then
            echo "Error: Division by zero is not allowed"
        else
            echo "scale=2; $num1 / $num2" | bc
        fi
    else
        echo "Error: Invalid operator '$operator'"
    fi
}

while true; do
    read -p "What is your calculation? (e.g. 7 3 +, -, x, / or 'x' to finish): " num1 num2 operator

    if [[ $num1 = "x" || $num2 = "x" || $operator = "x" ]]; then
        echo "Script terminated..."
        break
    fi

    result=$(calculate $num1 $num2 $operator)
    if [[ $result = "Error:"* ]]; then
        echo $result
    else
        echo "Result: $result"
    fi
done
