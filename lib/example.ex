defmodule Example do
  use Application
  @x 5 #define a constant

  alias UUID

  def start(_type, _args) do
    # Example.main()
    Example.caseExample()
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

end
