defmodule TextClient.Prompter do

  alias TextClient.State

  @spec accept_move(State.t) :: State.t | no_return
  def accept_move(game = %State{}), do:
    IO.gets("Your guess: ")
    |> check_input(game)

  defp check_input({:error, reason}, _) do
    IO.puts("Error reading input, game ended: #{inspect reason}")
    exit(:normal)
  end

  defp check_input(:eof, _) do
    IO.puts("Getting snarky aren't we? GAME OVER")
    exit(:normal)
  end

  defp check_input(input, game) do
    input = String.trim(input)

    cond do
      lowercase_letter?(input) and single_letter?(input) ->
        Map.put(game, :guess, input)

      true ->
        IO.puts("Please enter a single lowercase letter")
        accept_move(game)
    end
  end

  defp lowercase_letter?(input), do: input =~ ~r/\A[a-z]/

  defp single_letter?(input), do: String.length(input) === 1
end
