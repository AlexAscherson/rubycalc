require 'sinatra'
require 'sinatra/contrib/all'
require 'pry'

get '/' do 
  "Hello World"
  binding.pry

  @operator = params[:operator]
  if @operator
 # the if wont run if it gets a falsy value, like nil, which is what we want if operator is empter
    @first = params[:first].to_f
    @second = params[:second].to_f
    # if @first && @second && @operator
      # we cut this if out as we moved it up
    @result = case @operator
      when '+' then @first + @second
      when '-' then @first - @second
      when '*' then @first * @second
      when '/' then @first / @second
      
    end
    
  end
  erb :home

end

get '/power' do 
  @first = params[:first].to_f
  @second = params[:second].to_f
  @result = @first ** @second
  erb :power
end


get '/sqrt' do 
  @first = params[:first].to_f
  @result = Math.sqrt(@first)
  erb :sqrt
end

get '/bmi' do 
  @height = params[:height].to_f
  @weight = params[:weight].to_f
  @measurement = params[:measurement].to_s
   case @measurement
      when 'i' then @result = (@weight/(@height**2))*703
        
      when 'm' then @result = (@weight/(@height**2))
    end
    
  erb :bmi
end

get '/mort_calc' do 
  
  @principal = params[:principal].to_f
  @yearlyinterestrate = params[:yearlyinterestrate].to_f
  @yearlyinterestrate /= 100
  @yearlyinterestrate /= 12 
  @numberofpayments = params[:numberofpayments].to_f
  x = (1+@yearlyinterestrate)**@numberofpayments
  @result = @principal*@yearlyinterestrate*x/(x-1)
  erb :mort_calc

end


get '/trip_calc' do 

  @distance = params[:distance].to_f
  @mpg = params[:mpg].to_f
  @fuelcost = params[:fuelcost].to_f
  @speed = params[:speed].to_f
  # @mpg = mpg_utility(@speed, @mpg)
  @result1 = @distance/@speed
  @result2 = (@distance/@mpg)*@fuelcost
  erb :trip_calc
end





