defmodule TextClient.Mover do
  alias Hangman
  alias TextClient.State

  @spec make_move(State.t) :: State.t
  def make_move(game = %State{}) do
    {gs, tally} = Hangman.make_move(game.game_service, game.guess)
    %State{game |
      game_service: gs,
      tally: tally
    }
  end
end
