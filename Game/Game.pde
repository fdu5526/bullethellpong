GameState gameState;

/**
 * initial setup method
 */
void setup()
{
	size(1024, 1080);
  frameRate(24);

  PFont f = createFont("Arial",16,true);
  textFont(f, 70);


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

	fill(255);
	text(gameState.getCharacterAtIndex(0).getNumberOfLives(), 50, 900);
	
	pushMatrix();
	rotate(PI);
	text(gameState.getCharacterAtIndex(1).getNumberOfLives(), -100, -50);
	popMatrix();
}