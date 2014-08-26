public class GameState
{
	private GameCharacter[] characters;
	private GameCharacterBullets[] characterBullets;
	private GameCharacterDrawings[] characterDrawings;
	private GameCharacterTurrets[] characterTurrets;

	private final int numberOfPlayers = 1;

	public GameState()
	{
		characters = new GameCharacter[numberOfPlayers];
		characterBullets = new GameCharacterBullets[numberOfPlayers];
		characterDrawings = new GameCharacterDrawings[numberOfPlayers];
		characterTurrets = new GameCharacterTurrets[numberOfPlayers];

		// create character
		for(int i = 0; i < characters.length; i++)
		{
			characters[i] = new GameCharacter(10);
			characters[i].setPositionX(100);
			characters[i].setPositionY(100);
			characters[i].setIsVisible(true);
		}

		// create characters' drawings
		for(int i = 0; i < characterDrawings.length; i++)
			characterDrawings[i] = new GameCharacterDrawings(20);

		// create characters' bullets
		for(int i = 0; i < characterBullets.length; i++)
			characterBullets[i] = new GameCharacterBullets();

		// create characters' turrets
		for(int i = 0; i < characterTurrets.length; i++)
			characterTurrets[i] = new GameCharacterTurrets(characterBullets[i]);
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
		for(GameCharacterTurrets t : characterTurrets)
			t.update();
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
		for(GameCharacterTurrets t : characterTurrets)
			t.display();
	}
}