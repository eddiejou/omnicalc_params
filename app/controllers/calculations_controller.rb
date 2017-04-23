class CalculationsController <ApplicationController

  def flex_square
    @user_number = params["num"].to_i
    @square = @user_number**2
    render("calculations/flex_square.html.erb")
  end

  def flex_square_root
    user_number = params["num"].to_f
    @square_root = Math.sqrt(user_number)
    @display_user_number = user_number.to_i
    render("calculations/square_root.html.erb")
  end

  def flex_payment
    int = params["int"].to_f
    @int_display = (int/100)
    @yr = params["yr"].to_i
    @prin = params["prin"].to_i
    mo_int = int/120000
    months = @yr*12
    monthly_payment_float = @prin*((mo_int*(1+mo_int)**months)/((1+mo_int)**months-1))
    @monthly_payment = monthly_payment_float

    render("calculations/flex_payment.html.erb")
  end

  def rand_num
    @num_1 = params["num_1"].to_i
    @num_2 = params["num_2"].to_i
    if @num_2 < @num_1
      @rand_num = " "
    elsif @num_2 == @num_1
      @rand_num = @num_1
    else
      difference = @num_2-@num_1
      @rand_num = @num_1+rand(difference).to_i
    end
    render("calculations/rand_num.html.erb")
  end

  def square_form
    @user_number = params["num"].to_f
    render("calculations/square_form.html.erb")
  end
  #only thing wrong is 0 squared rounding

  def square_results
    @user_number = params[:user_number].to_f
    @squared = @user_number**2
    render("calculations/square_results.html.erb")
  end

  def square_root_form
    @user_number = params["num"].to_f
    render("calculations/square_root_form.html.erb")
  end

  def square_root_results
    require "cmath"
    @user_number = params[:user_number].to_f
    if @user_number < 0
      @root = CMath.sqrt(@user_number)
    else
      @root = Math.sqrt(@user_number)
    end
    render("calculations/square_root_results.html.erb")
  end

  #only thing write is 0 instead of 0.0 in from of complex square root

  def payment_form
    @int = params["int"].to_f
    @yr = params["yr"].to_f
    @prin = params["prin"].to_f
    render("calculations/payment_form.html.erb")
  end

  def payment_results
    @int = params[:int].to_f
    @yr = params[:yr].to_f
    @prin = params[:prin].to_f
    mo_int = @int/1200
    months = @yr*12
    monthly_payment_float = @prin*((mo_int*(1+mo_int)**months)/((1+mo_int)**months-1))
    @monthly_payment = monthly_payment_float
    render("calculations/payment_results.html.erb")
  end

  #need to add bolds

  def random_form
    @num_1 = params["num_1"].to_f
    @num_2 = params["num_2"].to_f
    render("calculations/random_form.html.erb")
  end

  def random_results
    @num_1 = params[:num_1].to_f
    @num_2 = params[:num_2].to_f
    if @num_2 < @num_1
      @rand_num = " "
    elsif @num_2 == @num_1
      @rand_num = @num_1
    else
      @difference = @num_2-@num_1
      @rand_num = @num_1+rand(@difference)+rand()
    end
    render("calculations/random_results.html.erb")
  end

  #just need to fix bolds

  def word_count_form
    @user_text = params["user_text"]
    @user_word = params["user_word"]
    render("calculations/word_count_form.html.erb")
  end

#format is for the future

  def word_count_results
    @text = params[:user_text]
    @special_word = params[:user_word]

    @word_count = @text.split.length
    @character_count_with_spaces = @text.length
    text_without_spaces = @text.gsub(" ","")
    text_without_linefeed = text_without_spaces.gsub("\n","")
    text_without_cr = text_without_linefeed.gsub("\r","")
    text_without_tabs = text_without_cr.gsub("\t","")

    @character_count_without_spaces = text_without_tabs.length

    lower_case_special = @special_word.downcase
    sentence_array = @text.gsub(/[^a-z0-9\s]/i, "")
    lower_case_sentence = sentence_array.downcase
    no_character_array = lower_case_sentence.split
    @occurrences = no_character_array.count(lower_case_special)

    render("calculations/word_count_results.html.erb")
  end

  def descriptive_statistics_form
    @numbers = params["list_of_numbers"]
    render("calculations/descriptive_statistics_form.html.erb")
  end

  def descriptive_statistics_results
    @numbers = params[:list_of_numbers].gsub(',',' ').split.map(&:to_f)

    min_num = @numbers.min
    max_num = @numbers.max
    sum_num = @numbers.sum
    count_num = @numbers.count
    sorted_num = @numbers.sort
    mean_num = sum_num/count_num
    var_num = [ ]
    entered_numbers = [ ]
    freq = [ ]

    @numbers.each do |element|
      ar = (element-mean_num)**2
      var_num.push(ar)
    end

    variance = (var_num.sum)/count_num

    @numbers.each do |elephant|
      number = elephant
      count = @numbers.count(elephant)
      entered_numbers.push(number)
      freq.push(count)
    end

    mode = entered_numbers[freq.index(freq.max)]

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = min_num

    @maximum = max_num

    @range = max_num-min_num

    @median = (sorted_num[(count_num-1)/2]+sorted_num[(count_num/2)])/2

    @sum = sum_num

    @mean = sum_num/count_num

    @variance = variance

    @standard_deviation = Math.sqrt(variance)

    @mode = mode

    render("calculations/descriptive_statistics_results.html.erb")
  end


end
