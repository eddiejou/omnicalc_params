class AnumController <ApplicationController

  def flex_square
    @user_number = params["num"].to_f
    @square = @user_number**2
    render("calculations/flex_square_5.html.erb")
  end

  def flex_square_root
    @interest = params["num"].to_f
    @square_root = Math.sqrt(@user_number)
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
    @monthly_pay = monthly_payment_float.to_i

    render("calculations/flex_payment.html.erb")
  end


  def square_form
    @user_number = params["num"].to_f
    render("calculations/square_form.html.erb")
  end

  def square_results
    @user_number = params[:user_number].to_f
    @squared = @user_number**2
    render("calculations/square_results.html.erb")
  end


end
