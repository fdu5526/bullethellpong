

GameState gameState;

void setup()
{
	size(1600, 900);
  frameRate(24);

  imageMode(CENTER);
  noStroke();

  gameState = new GameState();
}



void draw()
{
	background(200);
	gameState.update();
	gameState.display();
}


void keyPressed()
{
	switch(key)
	{
		case 'a':
			gameState.getMainCharacter().setVelocityX(-30);
			break;
		case 'd':
			gameState.getMainCharacter().setVelocityX(30);
			break;
		case 'w':
			gameState.getMainCharacter().setVelocityY(-30);
			break;
		case 's':
			gameState.getMainCharacter().setVelocityY(30);
			break;
		default:
			break;	

	}
}

void keyReleased()
{
	switch(key)
	{
		case 'a':
			if(gameState.getMainCharacter().getVelocityX() == -30)
				gameState.getMainCharacter().setVelocityX(0);
			break;
		case 'd':
			if(gameState.getMainCharacter().getVelocityX() == 30)
				gameState.getMainCharacter().setVelocityX(0);
			break;
		case 'w':
			if(gameState.getMainCharacter().getVelocityY() == -30)
					gameState.getMainCharacter().setVelocityY(0);
			break;
		case 's':
			if(gameState.getMainCharacter().getVelocityY() == 30)
					gameState.getMainCharacter().setVelocityY(0);
			break;
		default:
			break;
	}
}