#You are given the following information, but you may prefer to do some research for yourself.

#1 Jan 1900 was a Monday.
#Thirty days has September,
#April, June and November.
#All the rest have thirty-one,
#Saving February alone,
#Which has twenty-eight, rain or shine.
#And on leap years, twenty-nine.
#A leap year occurs on any year evenly divisible by 4, but not on a century unless it is divisible by 400.
#How many Sundays fell on the first of the month during the twentieth century (1 Jan 1901 to 31 Dec 2000)?

#This function returns true if its input is a leap year. False otherwise
function isLeapYear(year::Int)
  if (year%4 != 0)
    return false
  elseif (year%100 != 0)
    return true
  elseif (year%400 != 0)
    return false
  else
    return true
  end 
end

function solve019()

	#This will hold our calendar
	days=Array(Int,366*101,4)

	#We fill the calendar from Monday 1st January 1900
	#Days are 1 for Monday, ..., 6 for Saturday, 0 for Sunday
	days[1,2]=1
	days[1,3]=1
	for i in 1:size(days)[1]
		days[i,1] = i%7
	end

	#We populate the years
	dayCounter=1
	for i in 1900:2000
		for j in 1:(isLeapYear(i)?366:365)
			days[dayCounter,4] = i
			dayCounter+=1
		end
	end

	#We populate day in month and months
	#1 is for January, 2 is February, ..., 11 is November, 0 is December
	for dayCounter in 2:size(days)[1]
		if days[dayCounter-1,2] < (isLeapYear(days[dayCounter-1,4])?29:28)
			days[dayCounter,2] = days[dayCounter-1,2]+1
			days[dayCounter,3] = days[dayCounter-1,3]
		elseif (days[dayCounter-1,2] < 30 && (days[dayCounter-1,3]!=2))
			days[dayCounter,2] = days[dayCounter-1,2]+1
			days[dayCounter,3] = days[dayCounter-1,3]
		elseif ((days[dayCounter-1,2] < 31) && (in(days[dayCounter-1,3],[1,3,5,7,8,10,0])))
			days[dayCounter,2] = days[dayCounter-1,2]+1
			days[dayCounter,3] = days[dayCounter-1,3]
		else
			days[dayCounter,2] = 1
			days[dayCounter,3] = (days[dayCounter-1,3]+1)%12
		end
	end

	#We have our calendar for 20th century
	#We can now count Sundays on the 1st of the month

	counter=0
	for dayCounter in 1:size(days)[1]
		if ( (days[dayCounter,4]>=1901) && (days[dayCounter,4]<=2000) && (days[dayCounter,2]==1) && (days[dayCounter,1]==0))
			counter+=1
		end
	end

	counter
	
end

solve019()

#171