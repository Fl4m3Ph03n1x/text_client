defmodule TextClient.Interact do

  alias Hangman
  alias TextClient.{Player, State}

  @spec start :: State.t
  def start, do:
    Hangman.new_game()
    |> setup_state()
    |> Player.play()

  defp setup_state(game), do:
    %State{
      game_service: game,
      tally: Hangman.tally(game)
    }

end
