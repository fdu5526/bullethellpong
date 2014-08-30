/**
 * keystroke down handler
 */
void keyPressed()
{
	if(key == CODED)
	{
		switch(keyCode)
		{
			case LEFT:
				gameState.getCharacterAtIndex(0).startMovingLeft();
				break;
			case RIGHT:
				gameState.getCharacterAtIndex(0).startMovingRight();
				break;
			case UP:
				gameState.getCharacterAtIndex(0).startMovingUp();
				break;
			case DOWN:
				gameState.getCharacterAtIndex(0).startMovingDown();
				break;
			default:
				break;
		}
	}
	else
	{
		switch(key)
		{
			case 'z':
				gameState.getCharacterDrawingsAtIndex(0).setIsDrawing(true);
				break;
			case 'x':
			/*
				gameState.getTurretAtIndex(0).placeTurret(gameState.getCharacterAtIndex(0).getPositionX(),
																								  gameState.getCharacterAtIndex(0).getPositionY());
	  	*/
				break;

			// TODO delete me
			case 'd':
				gameState.getCharacterAtIndex(1).startMovingLeft();
				break;
			case 'a':
				gameState.getCharacterAtIndex(1).startMovingRight();
				break;
			case 's':
				gameState.getCharacterAtIndex(1).startMovingUp();
				break;
			case 'w':
				gameState.getCharacterAtIndex(1).startMovingDown();
				break;
			case 'j':
				gameState.getCharacterDrawingsAtIndex(1).setIsDrawing(true);
				break;
			case 'k':
			/*
				gameState.getTurretAtIndex(1).placeTurret(gameState.getCharacterAtIndex(1).getPositionX(),
																							    gameState.getCharacterAtIndex(1).getPositionY());
				break;
			*/
			// TODO delete me


			default:
				break;
		}
	}
}


/**
 * keystroke up handler
 */
void keyReleased()
{
	if(key == CODED)
	{
		switch(keyCode)
		{
			case LEFT:
				gameState.getCharacterAtIndex(0).stopMovingLeft();
				break;
			case RIGHT:
				gameState.getCharacterAtIndex(0).stopMovingRight();
				break;
			case UP:
				gameState.getCharacterAtIndex(0).stopMovingUp();
				break;
			case DOWN:
				gameState.getCharacterAtIndex(0).stopMovingDown();
				break;
			default:
				break;
		}
	}
	else
	{
		switch(key)
		{
			case 'z':
				gameState.getCharacterDrawingsAtIndex(0).setIsDrawing(false);
				break;

			// TODO delete me
			case 'd':
				gameState.getCharacterAtIndex(1).stopMovingLeft();
				break;
			case 'a':
				gameState.getCharacterAtIndex(1).stopMovingRight();
				break;
			case 's':
				gameState.getCharacterAtIndex(1).stopMovingUp();
				break;
			case 'w':
				gameState.getCharacterAtIndex(1).stopMovingDown();
				break;
			case 'j':
				gameState.getCharacterDrawingsAtIndex(1).setIsDrawing(false);
				break;
			// TODO delete me


			default:
				break;
		}
	}
}
