defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

defmodule Example do
  use Application
  # define a constant
  @x 5

  alias UUID

  def start(_type, _args) do
    # Example.main()
    # Example.caseExample()
    # Example.stringsExample()
    # Example.numbersExample()
    # Example.datesExample()
    # Example.timeUntilNewYear()
    # Example.tupleExample()
    # Example.mapExample()
    # Example.structExample()
    # Example.guessingGame()
    # Example.listsExample()
    Example.functionalExample()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    name = "John"
    status = Enum.random([:gold, :silver, :bronze])

    if status === :gold do
      IO.puts("Hello #{name}, welcolme to the club")
    else
      IO.puts("Get lost #{name}, you are not welcome here")
    end
  end

  def caseExample do
    IO.puts("--- Case Example ---")
    name = "John"
    status = Enum.random([:gold, :silver, :bronze, :not_a_status])

    case status do
      :gold -> IO.puts("Hello #{name}, welcolme to the VIP club")
      :silver -> IO.puts("Hello #{name}, you are a silver member, you can enter the club but you can't access the VIP area")
      :bronze -> IO.puts("Get lost #{name}, you are not welcome here")
      _ -> IO.puts("Get lost #{name}, I don't even know you")
    end
  end

  def stringsExample do
    IO.puts("--- Strings Example ---")
    IO.puts("Hello\nwelcolme\nto\nthe\nclub\n")
    IO.puts("Interpolation looks like this: \#{}")
    IO.puts(?a) #numeric unicode value of character a
  end

  def numbersExample do
    IO.puts("--- Numbers Example ---")
    a = 10
    b = 2.0
    IO.puts("a + b = #{a + b}")
    :io.format("~.20f\n", [a / 100])
    IO.puts(Float.ceil(0.5))
    IO.puts(Float.ceil(0.1, 1)) # 0.1 is 0.10000000000000000555, which is ceiled at 0.2
    IO.puts(Integer.gcd(10, 15)) # prints the greatest common divisor of 10 and 15

  end

  def datesExample do
    IO.puts("--- Dates Example ---")
    time = Time.new!(16, 30, 0, 0)
    date = Date.new!(2021, 12, 25)
    datetime = DateTime.new!(date, time, "Etc/UTC")
    IO.inspect(time)
    IO.inspect(date)
    IO.inspect(datetime)
    IO.puts(datetime.day)
  end

  def timeUntilNewYear do
    IO.puts("--- Time Until New Year ---")
    now = DateTime.utc_now()
    firtsDayOfNextYear = Date.new!(now.year + 1, 1, 1)
    newYear = DateTime.new!(firtsDayOfNextYear, Time.new!(0, 0, 0), "Etc/UTC")
    time_till = DateTime.diff(newYear, now)
    days = div(time_till, 86_400)
    hours = div(rem(time_till, 86_400), 3600)
    minutes = div(rem(time_till, 3600), 60)
    seconds = rem(time_till, 60)
    IO.puts("#{days} days, #{hours} hours, #{minutes} minutes and #{seconds} seconds until new year")
  end

  def tupleExample do
    IO.puts("--- Tuple Example ---")
    memberships = {:gold, :silver}
    memberships = Tuple.append(memberships, :bronze)
    IO.inspect(memberships)
    prices = {30, 20, 10}
    avg = Tuple.sum(prices) / tuple_size(prices) # -_- very intuitive
    IO.puts(avg)

    IO.puts("Average price from #{elem(memberships,0)}, #{elem(memberships,1)} and #{elem(memberships,2)} is #{avg}")

    users = [
      {:John, :gold},
      {:Katy, :silver},
      {:Cody, :bronze},
      {:Tom, :bronze}
    ]

    Enum.each(users, fn {name, membership} ->
      IO.puts("#{name} has a #{membership} membership")
    end)
  end

  def mapExample do
    IO.puts("--- Map Example ---")

    memberships = %{
      gold: :gold,
      silver: :silver,
      bronze: :bronze,
      none: :none
    }

    prices = %{
      gold: 30,
      silver: 20,
      bronze: 10,
      none: 0
    }

    users = [
      {:"John", memberships.gold},
      {:"Katy", memberships.silver},
      {:"Cody", memberships.bronze},
      {:"Tom", memberships.none}
    ]

    Enum.each(users, fn {name, membership} ->
      IO.puts("#{name} has a #{memberships[membership]} membership and has to pay #{prices[membership]}$") # so atoms can be used as keys
     end)

  end

  def structExample do
    IO.puts("--- Struct Example ---")

    gold_membership = %Membership{type: :gold, price: 30}
    silver_membership = %Membership{type: :silver, price: 20}
    bronze_membership = %Membership{type: :bronze, price: 10}
    none_membership = %Membership{type: :none, price: 0}

    users = [
      %User{name: "Steve", membership: gold_membership},
      %User{name: "Jenna", membership: silver_membership},
      %User{name: "Luke", membership: bronze_membership},
      %User{name: "Donna", membership: none_membership}
    ]

    Enum.each(users, fn %User{name: name, membership: membership} -> # inner destructuring, not very easy to read
      IO.puts("#{name} has a #{membership.type} membership and has to pay #{membership.price}$")
    end)

  end

  def guessingGame do
    IO.puts("Guess the number between 0 and 10")
    correctNumber = :rand.uniform(11) - 1 # or  Enum.random(1..10)
    guess = IO.gets("Enter your guess between 0 and 10: ") |> String.trim() |> Integer.parse()
    IO.inspect(guess)

    case guess do
      # {number, ""} -> IO.puts("You entered #{number}")
      # {number, other} -> IO.puts("You entered #{number} and #{other}")
      {number, _} ->
        IO.puts("You entered #{number}")

        if number === correctNumber do
          IO.puts("You guessed the correct number")
        else
          IO.puts("You guessed the wrong number")
        end
      :error -> IO.puts("You entered an invalid number")
    end
  end

  def is_even(number) do
    rem(number, 2) == 0
  end

  def listsExample do
    IO.puts("--- Lists Example ---")
    grades = [25, 50, 75, 100]
    newGrades = for grade <- grades, do: grade + 5
    # append
    newGrades2 = newGrades ++ [125, 150]
    # prepend
    newGrades3 = [0 | newGrades2]
    IO.inspect(newGrades)
    IO.inspect(newGrades2)
    IO.inspect(newGrades3)

    # isEven = fn x -> rem(x, 2) == 0 end
    # evenGrades = for grade <- newGrades3, isEven.(grade), do: grade # I could use Integer.is_even/1
    # IO.inspect(evenGrades)

    # evenGrades = Enum.filter(newGrades3, isEven)
    # IO.inspect(evenGrades)

    # I could use Integer.is_even/1
    evenGrades = for grade <- newGrades3, rem(grade, 2) == 0, do: grade
    IO.inspect(evenGrades)

    # Other way to do iterate over a list
    # for grade <- grades  do
    #   IO.puts(grade + 5)
    # end
  end

  def sum_and_average(numbers) do
    sum = Enum.sum(numbers)
    # or Enum.count(numbers)
    avg = sum / length(numbers)
    {sum, avg}
  end

  def print_numbers(numbers) do
    numbers |> Enum.join(", ") |> IO.puts()
    numbers
  end

  def get_numbers_from_user do
    IO.puts("Enter a list of numbers separated by a space:")
    IO.gets("")
    |> String.trim()
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  def functionalExample do
    IO.puts("--- Functional Example ---")
    #numbersStrings = ["1", "2", "3", "4", "5"]

    #Enum.map(numbersStrings, &String.to_integer/1)
    get_numbers_from_user()
    |> print_numbers()
    |> sum_and_average()
    |> IO.inspect()
    |> fn {sum, avg} -> IO.puts("Sum: #{sum}, Average: #{avg}") end.()


    # IO.inspect(sum_and_average(numbers))

    # Enum.each(numbers, fn x -> IO.puts(x + 2) end)
  end
end
