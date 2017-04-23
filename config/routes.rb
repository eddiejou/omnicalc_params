Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get("/flexible/square/:num",{:controller => "calculations", :action => "flex_square"})

  get("/flexible/square_root/:num",{:controller => "calculations", :action => "flex_square_root"})

  get("/flexible/payment/:int/:yr/:prin",{:controller => "calculations", :action => "flex_payment"})

  get("/flexible/random/:num_1/:num_2",{:controller => "calculations", :action => "rand_num"})

  get("/square/new",{:controller => "calculations", :action => "square_form"})
  get("/square/results",{:controller => "calculations", :action => "square_results"})

  get("/square_root/new",{:controller => "calculations", :action => "square_root_form"})
  get("/square_root/results",{:controller => "calculations", :action => "square_root_results"})

  get("/payment/new",{:controller => "calculations", :action => "payment_form"})
  get("/payment/results",{:controller => "calculations", :action => "payment_results"})

  get("/random/new",{:controller => "calculations", :action => "random_form"})
  get("/random/results",{:controller => "calculations", :action => "random_results"})

  get("/word_count/new",{:controller => "calculations", :action => "word_count_form"})
  get("/word_count/results",{:controller => "calculations", :action => "word_count_results"})

  get("/descriptive_statistics/new",{:controller => "calculations", :action => "descriptive_statistics_form"})
  get("/descriptive_statistics/results",{:controller => "calculations", :action => "descriptive_statistics_results"})
end
