#!/bin/bash
 
num1=$1
num2=$2
operator=$3
 
firstCalculationVariant() {
 
    if [ "$operator" = "+" ]; then
        echo $(($num1 + $num2))
    elif [ "$operator" = "-" ]; then
        echo $(($num1 - $num2))
    elif [ "$operator" = "x" ]; then
        echo $(($num1 * $num2))
    elif [ "$operator" = "/" ]; then
        if [ $num2 -eq 0 ]; then
            echo "Error: Division by zero is not allowed!"
        else
            echo "scale=2; $num1 / $num2" | bc -l
        fi
    else
        echo "This is not a correct calculation!"
    fi
}
 
secondCalculationVariant() {
 
    case $operator in
            "+")        echo $(($num1 + $num2));;
            "-")        echo $(($num1 - $num2));;
            "x")        echo $(($num1 * $num2));;
            "/")
                        if [ $num2 -eq 0 ]; then
                                echo "Error: Division by zero is not allowed!"
                        else
                                echo "scale=2; $num1 / $num2" | bc -l
                        fi
                        ;;
            *)          echo "This is not a correct calculation!";;
    esac
}
 
thirdCalculationVariant() {
 
result=${allArguments[0]}
 
if [ ${#allArguments[@]} -lt 3 ]; then  # das -lt steht für less than
   echo "This is not a correct calculation!"
   exit 1
fi
 
for (( i=1; i<${#allArguments[@]}-1; i++ ))
do
    if [ "${allArguments[${#allArguments[@]}-1]}" = "+" ]; then
        result=$((result + allArguments[i]))
 
    elif [ "${allArguments[${#allArguments[@]}-1]}" = "-" ]; then
        result=$((result - allArguments[i]))
 
    elif [ "${allArguments[${#allArguments[@]}-1]}" = "x" ]; then
        result=$((result * allArguments[i]))
 
    elif [ "${allArguments[${#allArguments[@]}-1]}" = "/" ]; then
        if [ ${allArguments[i]} -eq 0 ]; then
            echo "Error: Division by zero is not allowed!"
        else
            result=$(echo "scale=2; $result / ${allArguments[i]}" | bc -l)
        fi
    else
            result="This is not a correct calculation!"
    fi
done
 
echo "$result"
}
 
main1() {
 
while true; do
 
    read -p "What is your calculation? (e.g. 7 3 +, -, x, / or 'q' to finish): " num1 num2 operator
 
 
    if [[ $num1 = "q" || $num2 = "q" || $operator = "q" ]]; then
        echo "Script is terminated..."
        break
    fi
 
    result=$(firstCalculationVariant $num1 $num2 $operator)
    #result=$(secondCalculationVariant $num1 $num2 $operator)
 
    if [[ $result = "Error:"* ]]; then
        echo $result
    else
        echo "Result: $result"
    fi
 
done
}
 
main2() {
 
while true; do
    read -p "What is your calculation? (e.g. 7 3 +, -, x, / or 'q' to finish): " -a allArguments
 
    if [[ " ${allArguments[@]} " =~ " q " ]]; then
        echo "Script is terminated..."
        break
    fi
 
    result=$(thirdCalculationVariant "${allArguments[@]}")
 
    if [[ $result = "Error:"* ]]; then
        echo $result
    else
        echo "Result: $result"
    fi
done
}