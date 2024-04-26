defmodule ForumPhxWeb.PageController do
  use ForumPhxWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    # The users page is often custom made,
    # so skip the default app layout.
    #render(conn, :users, layout: false)
    IO.puts("Users function hit!")
    users = [
      %{id: 1, name: "Alice", email: "alice@email.com", age: 30},
      %{id: 2, name: "Bob", email: "bob@email.com", age: 35}
    ]
    render(conn, :users, users: users, layout: false)
  end
end
