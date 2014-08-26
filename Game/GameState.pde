public class GameState
{
	private GameCharacter[] characters;									// characters
	private GameCharacterBullets[] characterBullets;		// bullets of each character
	private GameCharacterDrawings[] characterDrawings;	// drawings of each character
	private GameCharacterTurrets[] characterTurrets;		// turrets of each character

	private final int numberOfPlayers = 1;							// number of players in the game

	public GameState()
	{
		characters = new GameCharacter[numberOfPlayers];
		characterBullets = new GameCharacterBullets[numberOfPlayers];
		characterDrawings = new GameCharacterDrawings[numberOfPlayers];
		characterTurrets = new GameCharacterTurrets[numberOfPlayers];

		// create character
		for(int i = 0; i < characters.length; i++)
		{
			characters[i] = new GameCharacter(10, 30);
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
			characterTurrets[i] = new GameCharacterTurrets(characterBullets[i], 3);
	}


	/**
	 * get the main character of the game state
	 */
	public GameCharacter getCharacterAtIndex(int i) { return characters[i]; }
	public GameCharacterDrawings getCharacterDrawingsAtIndex(int i) { return characterDrawings[i]; }
	public GameCharacterBullets getCharacterBulletsAtIndex(int i) { return characterBullets[i]; }


	/**
	 * check collision of all objects
	 */
	private void checkCollision()
	{
		// check collision for character
		for(int c = 0; c < characters.length; c++)
		{
			// loop through bullets
			for(int cb = 0; cb < characterBullets.length; cb++)
			{
				// it is this character's bullets, we skip it
				if(c == cb)
					continue;

				GameBullet[] bullets = characterBullets[cb].getBullets();
				for(GameBullet bullet : bullets)
				{
					GameCharacter character = characters[c];
					float dx = character.getPositionX() - bullet.getPositionX();
					float dy = character.getPositionY() - bullet.getPositionY();
					
					// there is a collision
					if(sqrt(dx * dx + dy * dy) < character.getRadius())
					{
						// TODO do things if there is collision
					}
			}
		}
	}

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

		checkCollision();
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