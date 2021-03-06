class CalculationsController < ApplicationController

  def word_count
    @text = params[:user_text]
    @special_word = params[:user_word]
    my_words = @text.split(" ")
    matched_words = [ ]
    my_words.each do |word|
    if word == @special_word
         matched_words.push ("a")
    end
  end

    # ================================================================================
    # Your code goes below.
    # The text the user input is in the string @text.
    # The special word the user input is in the string @special_word.
    # ================================================================================


    @character_count_with_spaces = @text.length

    @character_count_without_spaces = @text.length - @text.count(' ')

    @word_count = @text.split.size

    @occurrences = matched_words.count
  end

  def loan_payment
    @apr = params[:annual_percentage_rate].to_f
    @years = params[:number_of_years].to_i
    @principal = params[:principal_value].to_f

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================
#rate*PV / (1-(1+rate)^-n)
    @monthly_payment = (@apr/100/12*@principal)/(1-((1+@apr/100/12)**(@years*-12)))
  end

  def time_between
    @starting = Chronic.parse(params[:starting_time])
    @ending = Chronic.parse(params[:ending_time])

    # ================================================================================
    # Your code goes below.
    # The start time is in the Time @starting.
    # The end time is in the Time @ending.
    # Note: Ruby stores Times in terms of seconds since Jan 1, 1970.
    #   So if you subtract one time from another, you will get an integer
    #   number of seconds as a result.
    # ================================================================================

    @seconds = @ending-@starting
    @minutes = @seconds/ 60
    @hours = @minutes/60
    @days = @hours/24
    @weeks = @days/7
    @years = @weeks/52
  end

    def descriptive_statistics
    @numbers = params[:list_of_numbers].gsub(',', '').split.map(&:to_f)
        @sorted=[]
            sorted = @sorted_numbers
            len= @sorted.length
            @median =((sorted[(len - 1) / 2] + sorted[len / 2]) / 2.0)

        @var_ary=[]
            variance=@numbers
            var_ary.push((sq_mean - @mean) ** 2)
            sum_variance= var_ary.sum
            @variance= (@sum_variance/@count)

        @mode= []
            mode= @numbers
            count=Hash.new(0)
            numbers.each {|number| count[number] +=1}
            count.sort_by { |k,v| v }.last

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @sorted_numbers[0]

    @maximum = @sorted_numbers.reverse[0]

    @range = @sorted_numbers.reverse[0]-@sorted_numbers[0]

    @median = @sorted

    @sum = @sorted_numbers.sum

    @mean = @sum/@count

    @variance = @var_ary

    @standard_deviation = @variance**1/2

    @mode = "Replace this string with your answer."
  end
end
