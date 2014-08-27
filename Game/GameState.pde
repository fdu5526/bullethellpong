public class GameState
{
	private GameCharacter[] characters;									// characters
	private GameCharacterBullets[] characterBullets;		// bullets of each character
	private GameCharacterDrawings[] characterDrawings;	// drawings of each character
	private GameCharacterTurrets[] characterTurrets;		// turrets of each character

	private final int numberOfPlayers = 2;							// number of players in the game

	public GameState()
	{
		characters = new GameCharacter[numberOfPlayers];
		characterBullets = new GameCharacterBullets[numberOfPlayers];
		characterDrawings = new GameCharacterDrawings[numberOfPlayers];
		characterTurrets = new GameCharacterTurrets[numberOfPlayers];

		// create character
		// TODO put legit positions onto characters
		for(int i = 0; i < characters.length; i++)
		{
			characters[i] = new GameCharacter(10, 10);
			characters[i].setPositionX(100 * (i+1));
			characters[i].setPositionY(100 * (i+1));
			characters[i].setIsVisible(true);
		}

		// create characters' drawings
		for(int i = 0; i < characterDrawings.length; i++)
			characterDrawings[i] = new GameCharacterDrawings(20f);

		// create characters' bullets
		for(int i = 0; i < characterBullets.length; i++)
			characterBullets[i] = new GameCharacterBullets();


		// TODO delete me
		characterDrawings[0] = new GameCharacterDrawings(20f, 49, 49, 213);
		characterBullets[0] = new GameCharacterBullets(49, 49, 213);
		characterBullets[1] = new GameCharacterBullets(213, 49, 49);



		// create characters' turrets
		for(int i = 0; i < characterTurrets.length; i++)
			characterTurrets[i] = new GameCharacterTurrets(characterBullets[i], 3);



		// TODO delete me
		characterTurrets[1].hardcodeTurret();
	}


	/**
	 * get the main character of the game state
	 */
	public GameCharacter getCharacterAtIndex(int i) { return characters[i]; }
	public GameCharacterDrawings getCharacterDrawingsAtIndex(int i) { return characterDrawings[i]; }
	public GameCharacterBullets getCharacterBulletsAtIndex(int i) { return characterBullets[i]; }


	/**
	 * loop through drawings and bullets, kill characters accordingly
	 */
	private void checkBulletCollideWithCharacter()
	{
				// check bullet collision with character
		for(int c = 0; c < characters.length; c++)
		{
			GameCharacter character = characters[c];

			// loop through each character's bullets
			for(int cb = 0; cb < characterBullets.length; cb++)
			{
				// it is this character's bullets, we skip it
				if(c == cb)
					continue;

				// loop through bullets
				GameBullet[] bullets = characterBullets[cb].getBullets();
				for(GameBullet bullet : bullets)
				{
					// skip if bullet is not active
					if(!bullet.getIsVisible())
						continue;

					// collision
					// TODO kill character here
					if(collisionCircleWithCircle(character.getPositionX(), character.getPositionY(), character.getRadius(),
																			 bullet.getPositionX(), bullet.getPositionY(), bullet.getRadius()))
						println(currentTime() + " player " + c + "   hit!!!!");
					
				}
			}
		}
	}

	/**
	 * loop through drawings and bullets, deflect bullets accordingly
	 */
	private void checkBulletCollideWithDrawing()
	{
		// check bullet collision with drawings
		for(int d = 0; d < characterDrawings.length; d++)
		{
			GameDrawing[] ds = characterDrawings[d].getDrawings();
			GameDrawing prevDrawing = null;
			for(GameDrawing drawing : ds)
			{
				// skip if drawing is not active
					if(!drawing.getIsVisible())
						continue;

				// loop through each character's bullets
				for(int cb = 0; cb < characterBullets.length; cb++)
				{
					// it is this character's bullets, we skip it
					if(d == cb)
						continue;

					// loop through bullets
					GameBullet[] bullets = characterBullets[cb].getBullets();
					for(GameBullet bullet : bullets)
					{
						// skip if bullet is not active
						if(!bullet.getIsVisible())
							continue;
						
						// there is a collision, deflect bullet in some fashion
						if(prevDrawing != null && 
							 collisionCircleWithLine(bullet.getPositionX(), bullet.getPositionY(), bullet.getRadius(),
																			 drawing.getPositionX(), drawing.getPositionY(),
																			 prevDrawing.getPositionX(), prevDrawing.getPositionY(),
																			 drawing.getLifespan()))
						{
							// TODO make this more legit
							bullet.setIsVisible(false);
							characterBullets[d].addBullet(bullet.getPositionX(),
																						bullet.getPositionY(),
																						-bullet.getVelocityX() * 2.0,
																						-bullet.getVelocityY() * 2.0,
																						-bullet.getAccelerationX() * 2.0,
																						-bullet.getAccelerationY() * 2.0);
							characterBullets[d].addBullet(bullet.getPositionX(),
																						bullet.getPositionY(),
																						bullet.getVelocityX() * 1.5 - 5,
																						-bullet.getVelocityY() * 1.5,
																						bullet.getAccelerationX() * 1.5,
																						-bullet.getAccelerationY() * 1.5);
							characterBullets[d].addBullet(bullet.getPositionX(),
																						bullet.getPositionY(),
																						-bullet.getVelocityX() * 1.5 + 5,
																						-bullet.getVelocityY() * 1.5,
																						-bullet.getAccelerationX() * 1.5,
																						-bullet.getAccelerationY() * 1.5);
						}
					}
				}

				prevDrawing = drawing;
			}
		}
	}

	/**
	 * check collision of all objects
	 */
	private void checkCollision()
	{
		checkBulletCollideWithCharacter();
		checkBulletCollideWithDrawing();
	}

	/**
	 * updates all objects in the state of the game
	 */
	public void update()
	{
		// check for collisions in the beginning
		checkCollision();
		
		for(GameCharacter c : characters)
			c.update();
		
		for(GameCharacterBullets b : characterBullets)
			b.update();
		
		// if a character is drawing, draw their drawings
		for(int d = 0; d < characterDrawings.length; d++)
		{
			GameCharacterDrawings gcd = characterDrawings[d];
			
			if(gcd.getIsDrawing())
				gcd.addDrawing(characters[d].getPositionX(),
											 characters[d].getPositionY());
			else
				gcd.addBreak();

			gcd.update();
		}

		for(GameCharacterTurrets t : characterTurrets)
			t.update();
	}

	/**
	 * displays all objects in the state of the game
	 */
	public void display()
	{
		
		for(GameCharacterDrawings d : characterDrawings)
			d.display();

		for(GameCharacter c : characters)
			c.display();

		for(GameCharacterBullets b : characterBullets)
			b.display();
		
		for(GameCharacterTurrets t : characterTurrets)
			t.display();

	}
}