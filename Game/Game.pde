GameState gameState;

/**
 * initial setup method
 */
void setup()
{
	size(1600, 900);
  frameRate(24);

  stroke(0);
  fill(0);

  imageMode(CENTER);
  noStroke();

  gameState = new GameState();
}


/**
 * update at frame rate
 */
void draw()
{
	background(200);
	gameState.update();
	gameState.display();
}