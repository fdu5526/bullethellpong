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
			default:
				break;
		}
	}
}
