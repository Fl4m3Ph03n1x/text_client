# TextClient

This is a text client for the Hangman application course provided by Dave Thomas,
aka, PragDave.

This is a terminal client to the Hangman server. You can have several text
clients connected to the same server so multiple people can play at the same
time.

# Usage

First create a hangman server on the local machine:

`iex --sname hangman -S mix`

Once the hangman server node is running, you can create as many clients as you
want.

`iex --sname client1 -S mix`

Once in the client, create a game. The client will connect automatically to the
server and start the game:

`TextClient.start`

Enjoy!
