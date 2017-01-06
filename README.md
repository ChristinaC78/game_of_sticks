# Pick Up Sticks

The program entitled 'game_of_sticks.rb' is a basic program that allows two players to play a game of pick up sticks.  In the beginning, the user is prompted to enter the initial amount of sticks that which the entire game will use in gameplay. Afterwards, players will take turns picking up sticks until there are no sticks left on the table. When there are no sticks remaining, the player who is unable to pick up a stick loses and the player who picked up the last stick wins! Users may play again by entering the appropriate value.

## Getting Started

The instructions below will help you retrieve a copy of the project to run on your local machine through the Terminal application. Please see deployment for notes on how to deploy the project on a live system.  The instructions provided are for macbook users.

### Prerequisites

Find Terminal - to run program
  1. Open Finder. Finder is available in the Dock.
  2. Select Applications from the side bar menu.  Then unfold the Utilities folder.
  3. Double click on Terminal to initialize.

Install Homebrew - to store program files properly
  1. Open up Terminal.
  2. Run `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
  3. Run `brew doctor`

Install rbenv & ruby-build - to install and compile different versions of Ruby code language
  1. Open up Terminal
  2. Run `brew install ruby-build rbenv`
  3. Run `echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile`

Install ruby 2.3.1 - the latest version of Ruby
  1. Close and reopen Terminal, then run `rbenv install 2.3.1`
  2. After quite some time, run: `rbenv global 2.3.1`
  
Once you have completed the above installation processes your system is ready to launch the program!

## Deployment

Please complete the following procedure to run the program on a live system:
  1. Open Terminal.
  2. Change your directory to the one that which you want to save this project.`cd folder_name`
  3. Then run the commands `$ git clone https://github.com/kteich88/game_of_sticks.git` and 
  `$ cd game_of_sticks` to access the folder/files. 
  4. Type `game_of_sticks.rb` to run the program.
  5. READ all instructions BEFORE adding input.

## Built With

* Atom

## Authors

* **Kristine Teichmann**

## Acknowledgments

* The Iron Yard - Durham
