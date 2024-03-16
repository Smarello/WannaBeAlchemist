defmodule ForumPhx.Repo do
  use Ecto.Repo,
    otp_app: :forum_phx,
    adapter: Ecto.Adapters.SQLite3
end
