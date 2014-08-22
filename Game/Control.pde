/**
 * keystroke down handler
 */
void keyPressed()
{
	switch(key)
	{
		case 'a':
			gameState.getCharacterAtIndex(0).startMovingLeft();
			break;
		case 'd':
			gameState.getCharacterAtIndex(0).startMovingRight();
			break;
		case 'w':
			gameState.getCharacterAtIndex(0).startMovingUp();
			break;
		case 's':
			gameState.getCharacterAtIndex(0).startMovingDown();
			break;
		default:
			break;	

	}
}


/**
 * keystroke up handler
 */
void keyReleased()
{
	switch(key)
	{
		case 'a':
			gameState.getCharacterAtIndex(0).stopMovingLeft();
			break;
		case 'd':
			gameState.getCharacterAtIndex(0).stopMovingRight();
			break;
		case 'w':
			gameState.getCharacterAtIndex(0).stopMovingUp();
			break;
		case 's':
			gameState.getCharacterAtIndex(0).stopMovingDown();
			break;
		default:
			break;
	}
}


/**
 * mouse dragging handler
 */
public void mouseDragged()
{
	gameState.getCharacterDrawingsAtIndex(0).addDrawing(mouseX, mouseY);
}

/**
 * mouse released handler
 */
public void mouseReleased()
{
	gameState.getCharacterDrawingsAtIndex(0).addBreak();
}

