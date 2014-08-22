

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
			gameState.getMainCharacter().startMovingLeft();
			break;
		case 'd':
			gameState.getMainCharacter().startMovingRight();
			break;
		case 'w':
			gameState.getMainCharacter().startMovingUp();
			break;
		case 's':
			gameState.getMainCharacter().startMovingDown();
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
			gameState.getMainCharacter().stopMovingLeft();
			break;
		case 'd':
			gameState.getMainCharacter().stopMovingRight();
			break;
		case 'w':
			gameState.getMainCharacter().stopMovingUp();
			break;
		case 's':
			gameState.getMainCharacter().stopMovingDown();
			break;
		default:
			break;
	}
}