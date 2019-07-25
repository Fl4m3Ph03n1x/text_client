defmodule TextClient.Player do

  alias TextClient.{Mover, Player, Prompter, State, Summary}

  def play(%State{tally: %{game_state: :won}}), do:
    exit_with_msg("You've won!")

  def play(%State{tally: %{game_state: :lost}}), do:
    exit_with_msg("You've lost. Better luck next time!")

  def play(game = %State{tally: %{game_state: :good_guess}}), do:
    continue_with_msg(game, "Correct!")

  def play(game = %State{tally: %{game_state: :bad_guess}}), do:
    continue_with_msg(game, "Wrong guess, try again!")

  def play(game = %State{tally: %{game_state: :already_used}}), do:
    continue_with_msg(game, "You've already used that letter.")

  def play(game), do: continue(game)

  defp exit_with_msg(msg) do
    IO.puts(msg)
    exit(:normal)
  end

  defp continue_with_msg(game, msg) do
    IO.puts(msg)
    continue(game)
  end

  defp continue(game), do:
    game
    |> Summary.display()
    |> Prompter.accept_move()
    |> Mover.make_move()
    |>play()

end
