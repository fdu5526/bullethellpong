public class GameState
{
	private GameCharacter[] characters;
	private GameCharacterBullets[] characterBullets;
	private GameCharacterDrawings[] characterDrawings;

	private final int numberOfPlayers = 1;

	public GameState()
	{
		characters = new GameCharacter[numberOfPlayers];
		characterBullets = new GameCharacterBullets[numberOfPlayers];
		characterDrawings = new GameCharacterDrawings[numberOfPlayers];

		// create character
		characters[0] = new GameCharacter(10);
		characters[0].setPositionX(100);
		characters[0].setPositionY(100);
		characters[0].setIsVisible(true);

		// create characters' drawings
		characterDrawings[0] = new GameCharacterDrawings(20);

		// create characters' bullets
		characterBullets[0] = new GameCharacterBullets();
	}


	/**
	 * get the main character of the game state
	 */
	public GameCharacter getCharacterAtIndex(int i) { return characters[i]; }
	public GameCharacterDrawings getCharacterDrawingsAtIndex(int i) { return characterDrawings[i]; }
	public GameCharacterBullets getCharacterBulletsAtIndex(int i) { return characterBullets[i]; }


	/**
	 * updates all objects in the state of the game
	 */
	public void update()
	{
		for(GameCharacter c : characters)
			c.update();
		for(GameCharacterBullets b : characterBullets)
			b.update();
		for(GameCharacterDrawings d : characterDrawings)
			d.update();

	}

	/**
	 * displays all objects in the state of the game
	 */
	public void display()
	{
		for(GameCharacter c : characters)
			c.display();
		for(GameCharacterBullets b : characterBullets)
			b.display();
		for(GameCharacterDrawings d : characterDrawings)
			d.display();
	}
}