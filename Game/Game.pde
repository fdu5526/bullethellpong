GameState gameState;

/**
 * initial setup method
 */
void setup()
{
	size(1024, 1080);
  frameRate(24);

  imageMode(CENTER);
  gameState = new GameState();
}


/**
 * update at frame rate
 */
void draw()
{
	background(50);
	gameState.update();
	gameState.display();
}