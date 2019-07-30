defmodule TextClient.Interact do

  alias Hangman
  alias TextClient.{Player, State}

  @hangman_server :"hangman@admanmedia-Aspire-E1-572G"

  @spec start :: State.t
  def start, do:
    new_game()
    |> setup_state()
    |> Player.play()

  defp setup_state(game), do:
    %State{
      game_service: game,
      tally: Hangman.tally(game)
    }

  defp new_game do
    Node.connect(@hangman_server)
    :rpc.call(@hangman_server, Hangman, :new_game, [])
  end
end
