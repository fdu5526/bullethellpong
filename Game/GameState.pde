public class GameState
{
	private GameCharacter[] characters;									// characters
	private GameBullets[] bullets;											// bullets of each type
	private GameCharacterDrawings[] characterDrawings;	// drawings of each character
	private GameTurret[] turrets;												// turrets

	private final int numberOfPlayers = 2;							// number of players in the game
	private final int numberOfTurrets = 3;							// number of turrets in the game

	public GameState()
	{
		characters = new GameCharacter[numberOfPlayers];
		characterDrawings = new GameCharacterDrawings[numberOfPlayers];
		bullets = new GameBullets[numberOfTurrets + numberOfPlayers];
		turrets = new GameTurret[numberOfTurrets];

		// create character
		// TODO put legit positions onto characters
		for(int i = 0; i < characters.length; i++)
		{
			if(i == 0)
				characters[i] = new GameCharacter(10, 10, 150, loadImage("resources/blue.png"));
			else
				characters[i] = new GameCharacter(10, 10, 150, loadImage("resources/red.png"));
			characters[i].setPositionX(width/2);
			characters[i].setPositionY(height - (height/5 + (3*height/5)*i));
			characters[i].setIsVisible(true);
		}

		// create characters' drawings
		for(int i = 0; i < characterDrawings.length; i++)
			characterDrawings[i] = new GameCharacterDrawings(40f);

		// create characters' bullets
		for(int i = 0; i < bullets.length; i++)
			bullets[i] = new GameBullets(255,255,255, 25);


		// TODO delete me
		characterDrawings[0] = new GameCharacterDrawings(20f, 49, 49, 213);
		characterDrawings[1] = new GameCharacterDrawings(20f, 213, 49, 49);
		bullets[0] = new GameBullets(49, 213, 49, 25);
		bullets[1] = new GameBullets(49, 213, 49, 20);
		bullets[2] = new GameBullets(49, 213, 49, 35);
		bullets[3] = new GameBullets(49, 49, 213, 25);
		bullets[4] = new GameBullets(213, 49, 49, 25);



		// create characters' turrets
		for(int i = 0; i < turrets.length; i++)
			turrets[i] = new GameTurret(bullets[i], 255, 255, 255, 750);



		// TODO delete me
		turrets[0] = new GameTurret(bullets[0], 49, 213, 49, 750);
		turrets[1] = new GameTurret(bullets[1], 49, 213, 49, 500);
		turrets[2] = new GameTurret(bullets[2], 49, 213, 49, 1000);
		setTurretsStartPosition();
		
		
	}

	public void setTurretsStartPosition()
	{
		turrets[0].placeTurret(300, 500);
		turrets[1].placeTurret(700, 200);
		turrets[2].placeTurret(1100, 700);
	}


	/**
	 * get the main character of the game state
	 */
	public GameCharacter getCharacterAtIndex(int i) { return characters[i]; }
	public GameCharacterDrawings getCharacterDrawingsAtIndex(int i) { return characterDrawings[i]; }
	public GameBullets getBulletsAtIndex(int i) { return bullets[i]; }
	public GameTurret getTurretAtIndex(int i) { return turrets[i]; }

	public void characterAtIndexInteractWithTurret(int i)
	{
		GameCharacter character = characters[i];
		if(character.hasTurret())
		{
			character.placeTurret();
		}
		else
		{
			// loop through turrets
			for(int t = 0; t < turrets.length; t++)
			{
				GameTurret turret = turrets[t];

				if(!turret.getIsVisible())
					continue;

				
				if(collisionCircleWithCircle(character.getPositionX(), character.getPositionY(), character.getRadius(),
																		 turret.getPositionX(), turret.getPositionY(), turret.getRadius()*2))
				{
					character.getTurret(turret);
					break;
				}

			}
		}
	}

	/**
	 * loop through drawings and bullets, kill characters accordingly
	 */
	private void checkBulletCollideWithCharacter()
	{
				// check bullet collision with character
		for(int c = 0; c < characters.length; c++)
		{
			GameCharacter character = characters[c];

			// loop through each type of bullets
			for(int b = 0; b < bullets.length; b++)
			{
				// skip if bullet is of this character's
				if(b == c + numberOfTurrets)
					continue;

				// loop through bullets
				GameBullet[] bl = bullets[b].getBullets();
				for(GameBullet bullet : bl)
				{
					// skip if bullet is not active
					if(!bullet.getIsVisible())
						continue;

					// collision
					// TODO kill character here
					if(collisionCircleWithCircle(character.getPositionX(), character.getPositionY(), character.getRadius(),
																			 bullet.getPositionX(), bullet.getPositionY(), bullet.getRadius()))
						//println(currentTime() + " player " + c + "   hit!!!!");
						character.setNumberOfLives(character.getNumberOfLives() - 1);
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

				// loop through each type of bullets
				for(int b = 0; b < bullets.length; b++)
				{
					// cannot reflect your own bullet
					if(b == d + numberOfTurrets)
						continue;
					
					// loop through bullets
					GameBullet[] bl = bullets[b].getBullets();
					for(GameBullet bullet : bl)
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
							int r = bullet.getRadius();
							if(r >= 4)
							{
								int rp = r / 2;
								bullets[d + numberOfTurrets].addBullet(bullet.getPositionX(),
																						bullet.getPositionY(),
																						bullet.getVelocityX() * -3.0,
																						bullet.getVelocityY() * -3.0,
																						bullet.getAccelerationX() * -3.0,
																						bullet.getAccelerationY() * -3.0,
																						rp);
								bullets[d + numberOfTurrets].addBullet(bullet.getPositionX(),
																							bullet.getPositionY(),
																							bullet.getVelocityX() * -2.0,
																							bullet.getVelocityY() * -2.0,
																							bullet.getAccelerationX() * -2.0,
																							bullet.getAccelerationY() * -2.0,
																							rp);
								bullets[d + numberOfTurrets].addBullet(bullet.getPositionX(),
																							bullet.getPositionY(),
																							bullet.getVelocityX() * 2.0,
																							bullet.getVelocityY() * -2.0,
																							bullet.getAccelerationX() * 2.0,
																							bullet.getAccelerationY() * -2.0,
																							rp);
							}
							
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
		
		for(GameBullets b : bullets)
			b.update();
		
		// if a character is drawing, draw their drawings
		for(int d = 0; d < characterDrawings.length; d++)
		{
			GameCharacterDrawings gcd = characterDrawings[d];
			
			if(gcd.getIsDrawing() && characters[d].hasInk())
			{
				gcd.addDrawing(characters[d].getPositionX(),
											 characters[d].getPositionY());
				characters[d].setInkLevel(characters[d].getInkLevel() - 1);
			}
			else
				gcd.addBreak();

			gcd.update();
		}

		for(GameTurret t : turrets)
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

		for(GameBullets b : bullets)
			b.display();

		for(GameTurret t : turrets)
			t.display();

	}
}