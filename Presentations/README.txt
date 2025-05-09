Mayor Cat Adventure

Mayor Cat Adventure is a game where you play as a cat mayor of the town, helping the local villagers with tasks. As mayor your goal is to make the town a welcoming and safe place fit for more citizens. The town is a place of diversity with multiple different animal species. Your job is to help them adjust to the town! Throughout the game you will travel between different maps, interact with town citizens, play educational minigames, and complete quests.

This file will go further into detail pertaining each script involved in our project.

Date: 5/9/2025

Contacts:

Melissa Fowler: maf22@hood.edu
Ghazal Hami: gh8@hood.edu
Kayla Meistrell: km38@hood.edu
GitHub Repository:

https://github.com/Fowlerma32/cat-adventure

Tech Stack:

Game Engine: Godot v4.3
Programming Language: GDScript
Art: LibreSprite v1.2
Music: Soundtrap v4.0

Folder Structure:

/assets

Contains any graphic .ase and .png files that are used to create the map tilesheet, decorations, UI, NPC's, and the player. This folder also contains the /Music folder that contains the .mp3 file for the background music.

/scenes

Contains all Godot scenes which include the visual aspects of the game and game elements.

/game_manager.tscn handles the graphical UI for the quest log as well as holds the element for the background music.
/pause_menu.tscn handles the graphical UI for the pause menu after the user inputs the ESC button.
/TitleScreen.tscn handles the UP for the title screen that appears once the user runs the game. In this scene there will be two buttons to 'start' or 'exit'.
/mini_map.tscn handles the graphical UI for the mini map and the bottom right hand corner. This updates while the player navigates the maps as well as updates the UI within the map.
/player.tscn handles the animated sprite for the main character.
/npc.tscn handles the messenger graphics as well as the other NPC characters throughout the main map.
/main_map.tscn handles the graphics for the main map as well as the collision boxes.
/forest_map.tscn handles the graphics for the forest map. This scene also holds and is connected to the scenes involved with the sort quest.
/mini_game.tscn, /barrel.tscn, and /plant.tscn handles the graphical elements for the sort quest minigame.
/mountain_map.tscn handles the graphics for the mountain map.

/scripts 

Contains the scripts necessary to combine and handle elements and features of the game.

/game_manager.gd connects to it's respective scene. This script holds code that dictate whether the quest log UI appears.
/Global.gd holds any global variables that will be accessed by any script.
/pause_menu.gd handles the variables and functions for the pause menu to initiate once the correct input is pressed by the user.
/mini_map.gd handles all the variables necessary for the correct function of the mini map. This also holds functions to correctly place markers on the mini map.
/title_screen.gd handles the functionality of the start and exit buttons.
/main_map.gd holds code that handles map transitions.
/forest_map.gd holds code that handles map transitions as well as the minigame that is connected to the sort quest.
/mountain_map.gd holds code that handles map transitions.
/quest_manager.gd handles the quest status.
/quest.gd, /search_quest.gd, and /bearQuest.gd contain the necessary functions to initiate, progress, and finish the quest tasks.
/mini_game.gd along with plant and barrel scripts handles the mini game feature. Once entered by the player the game initiates and the player will be able to drag and drop the correct plants into the barrels.
/diorite_stone.gd, /quartz_stone.gd, /RoseQuartzStone.gd, and /marble_stone hold functions that call once the mountain map quest is started. This will dictate where the UI is placed and how the user can interact with each rock script.
/bear_npc.gd, /penguin_npc.gd, /penguin_interact.gd, and /messenger_2d_cast.gd handles the 2DRaycast that upon entered by the player and correctly inputting the key of 'e' the dialogue properly starts and connects with the quest scripts.

/Dialogues 

Contains the dialogue for NPCs and quests. For example:

/Messenger_Intro.dialogue handles the proper dialogue balloons upon interacting with the messenger NPC.
/penguin_meet.dialogue handles the penguin quest dialogue for the search quest.
/Meeting_bears.dialogue handles the bear quest dialogue for the search quest.
/Diorite_info.dialogue, /Granite_info.dialogue, /RoseQuartz_info.dialogue, and /Quartz_info.dialogue handles the dialogue for the rock trivia that is connected and a key asset of the search quest.


/Executables Folder containing the executable version of the game.

How to download: There are two options for downloading and playing the game. To download only the game itself without any of the source code:

Download the executables folder in the GitHub repository
Extract the files
Run Cat Adventure Game.exe
To download everything:

Download Godot v4.3
Clone the GitHub repository
Import the project into Godot
Run the game
How to Play:

Use WASD or the arrow keys to move
Press E to interact with NPCs
Press ESC to open the pause menu
Use the left mouse button to interact with buttons in-game, play the minigames, and advance the dialogue.
