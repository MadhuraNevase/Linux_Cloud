#!/usr/bin/bash
<<comment
echo "logged in user name = $USER"
echo "HOme directory      = $HOME"

echo -n "Enter the choice: 1.Date 2.Cal 3.Ls 4.Pwd 5.Exit"
read choice

if [[   $choice -eq 1 ]]; then
	echo `date`
elif [[ $choice -eq 2 ]]; then
	echo `cal`
elif [[ $choice -eq 3 ]]; then
	echo `ls`
elif [[ $choice -eq 4 ]]; then
	echo `pwd`
elif [[ $choice -eq 5 ]]; then
	echo `exit`
fi


echo -n "Enter the path:"
read path

if [[ -d "$path" ]]; then
	echo "$path is a directory and its contents are:"
	ls "$path"

elif [[ -f "$path" ]]; then
	echo "$path is a file.Its size is:"
	du -h "$path" | cut -f1
else
	echo "$path does not exist or is a special file (like a link/device)."
fi
comment  
# check if number is prime or not

echo -n "Enter the number:"
read number

is_prime() {
	n=$1

	if [ $n -le 1]; then
		return 1
	fi
	limit=$(echo "sqrt($n)" | bc)

	while [ $i -le $limit ]; do
		if [ $((n%i)) -eq 0 ]; then
			return 1
		fi
		((i++))
	done
	return 0
}

is_prime $number



# 5. check greatest of three numbers

echo -n "Enter three numbers: "
read n1 n2 n3

echo "First: $n1, Second: $n2, Third: $n3"

if [[ $n1 > $n2 && $n1 > $n3 ]]; then
	echo "$n1 is greatest of three numberds"
elif [[ $n2 > $n1 && $n2 > $n3 ]]; then
	echo "$n2 is greatest of three numbers"
elif [[ $n3 > $n1 && $n3 > $n2 ]]; then
	echo " $n3 is greatest of three numbers"
fi
# 6. Write a Program to find whether a given year is a leap year or not

echo "Enter a year:"
read year

if [[ (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0) ]]; then
	echo "$year is a Leap Year"
else
	echo "$year is not a Leap Year"
fi


# 7.Write a Program to find whether a given number is positive or negative

echo -n "Enter a number:"
read number

if [[ $number -gt 0 ]]; then
	echo "number is positive"
elif [[ $number -lt 0 ]]; then 
	echo "number is negative"
elif [[ $number -eq 0 ]]; then
	echo "number is zero"
else
	echo "Invalid number"
fi
# 8. Write a program to print the table of a given number.

echo -n "Enter a number:"
read number

for (( i=1; i <=10 ; i++ ))
do 
	echo  $(( number * i))
done

# 9. Write a program to find the factorial of given number.
 echo "ENter a number:"
 read num

fact=1

if [[ num -lt 0 ]]; then
	 echo "Factorial denied for negative numbers"
else
	for (( i=1; i<+num; i++ ))
	do 
		fact=$((fact*i))
	done
	echo "Factorial of $num is $fact"
fi
 
# 10. Write a program to find given number of terms in the Fibonacci series.
echo "Enter number of terms to enter:"
read n

a=0
b=1

echo "Fibonacci Series:"

for (( i=1; i<=n; i++))
do 
	echo -n "$a"
	temp=$((a+b))
	a=$b
	b=$temp
done



#11. Write a program to calculate gross salary if the DA is 40%, HRA is 20% of basic salary.
#Accept basic salary form user and display gross salary (Result can be floating point value).

echo "Enter the basic salary:"
read base_salary

DA=(0.4 * base_salary)
HRA=(0.20 * base_salary)

gross_salary=$((base_salary+DA+HRA))

echo "gross salary = $gross_salary"





# 12. Write a shell script to accept a filename as argument and displays the last modification
# time if the file exists and a suitable message if it doesn’t exist

echo -n "Enter filename:"
read filename

echo $(( stat $filename))


# 13. 13. Write a shell script to display only hidden file of current directory.
touch .hidden_file.txt

echo `ls -d .*`

# 14. Write a shell script to display only executable files of current directory.
touch my_file.txt
chmod 700 my_file.txt
for file in *
do

	if [[ -x "$file" && -f "$file" ]]; then
           echo "$file is an executable file"
	else
		echo "$file is not an exe"
        fi
done


# 15. Accept the two file names from user and append the contents in reverse case of first file
# into second file.

echo "This is my file1">>file1
echo "This is my file2">>file2

echo "Enter two file names:"
read f1 f2

tr 'a-zA-Z' 'A-Za-z' < $f1 >> $f2 




