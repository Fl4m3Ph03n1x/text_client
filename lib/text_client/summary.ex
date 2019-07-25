defmodule TextClient.Summary do

  alias TextClient.State

  @spec display(State.t) :: State.t
  def display(game = %State{tally: tally}) do
    IO.puts("""
    Word so far:  #{Enum.join(tally.letters, " ")}
    Guesses left: #{tally.turns_left}
    Letters used: #{Enum.join(tally.guesses, " ")}
    """)
    game
  end
end
