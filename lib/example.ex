defmodule Example do
  use Application
  @x 5 #define a constant

  alias UUID

  def start(_type, _args) do
    # Example.main()
    # Example.caseExample()
    # Example.stringsExample()
    Example.numbersExample()
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    name = "John"
    status = Enum.random([:gold, :silver, :bronze])
    if (status === :gold) do
      IO.puts("Hello #{name}, welcolme to the club")
    else
      IO.puts("Get lost #{name}, you are not welcome here")
    end

  end

  def caseExample do
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
    IO.puts("Hello\nwelcolme\nto\nthe\nclub\n")
    IO.puts("Interpolation looks like this: \#{}")
    IO.puts(?a) #numeric unicode value of character a
  end

  def numbersExample do
    a = 10
    b = 2.0
    IO.puts("a + b = #{a + b}")
    :io.format("~.20f\n", [a / 100])
    IO.puts(Float.ceil(0.5))
    IO.puts(Float.ceil(0.1, 1)) # 0.1 is 0.10000000000000000555, which is ceiled at 0.2
    IO.puts(Integer.gcd(10, 15)) # prints the greatest common divisor of 10 and 15

  end

end
