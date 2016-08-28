# A company has six hiring positions with more people wanting jobs than the
# number of available positions.  The company managers decide in order to give
# more people an opportunity to make money; they will allow people to work in
# three-month intervals. The first six people on the waiting list will be hired
# in the order that they are on the waiting list.  The first six people will
# keep these positions for three months.  At the end of three months, the
# manager will roll a dice to determine the number of people who will lose their
# jobs. The company will use the policy of last-hired-first-fired.  For example,
# if the dice roll is 3, the last 3 people hired will lose their jobs to the
# first 3 people on the waiting list. People losing their jobs will be placed on
# the back of the waiting list in the order that they are fired. This process
# will continue for every three-month interval.

require './Stack.rb'
require './Queue.rb'
require 'awesome_print'

class Company
  attr :waiting_list, :working_people, :dice, :quarter, :year
  #
  def initialize
      @quarter = 1
      @year = 1
      @waiting_list = Queue.new
      @working_people = Stack.new

      first_hires = ["Abby", "Betty", "Carol", "Donna", "Edith", "Fran"]

      first_hires.each do |person|
        @working_people.push(person)
        end

      extra_people = ["Georgia", "Hannah", "Ida", "Joan", "Kate", "Linda", "Martha"]

      extra_people.each do |person|
         @waiting_list.enqueue(person)
         end

      show_lists
  end

  def show_lists
    puts "\nYEAR #{@year}, QUARTER #{@quarter}"
    puts "\nThe working people are:"
    ap @working_people
    puts "\nThe people on the waiting list are:"
    ap @waiting_list
  end

  def three_months_pass
    time_passes

    dice = rand(1..6)

    puts "\nThree months pass... \nThe boss rolled a #{dice}, so #{dice} people will lose their jobs and move to the back of the waiting list."

     dice.times do
       @waiting_list.enqueue(@working_people.pop)
      end

     dice.times do
       @working_people.push(@waiting_list.dequeue)
     end

    show_lists

    until year == 2 #<--- continues to call the method until we have a year's worth of examples, could increase this to show more quarters; but, come on, how sustainable could this hiring practice be?
    three_months_pass
    end

  end

  def time_passes
    @quarter += 1
    if @quarter > 4 # if 4 quarters pass
      @quarter = 1 #the quarter count resets
      @year += 1 #the year count increases
    end
  end

end#of class Company

company1 = Company.new
company1.three_months_pass
