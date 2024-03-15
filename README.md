# Example

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `example` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:example, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/example>.

## Install elixir on Windows

Install Elixir with [chocolatey](https://chocolatey.org/)

```sh
choco install elixir
```

Add the folder `C:\ProgramData\chocolatey\lib\Elixir\tools\bin` to the PATH

The installation will add Erlang, Elixir and the interactive Elixir tool that you can access by running `iex`.

> ⚠️ `iex` is also the default PowerShell alias for `Invoke-Expression`, you can either remove the alias by running `Remove-Alias -Name iex` in PowerShell or specify `iex.bat` when launching the interactive Elixir tool

You can run `iex` (or `iex.bat`) to verify the interactive elixir installation

```sh
> iex
Erlang/OTP 26 [erts-14.2.2] [source] [64-bit] [smp:24:24] [ds:24:24:10] [async-threads:1] [jit:ns]

Interactive Elixir (1.16.1) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)>
```

You can exit the interactive session by double pressing `Ctrl^C`.
