GameState gameState;


final float maxVelocity = 30;

/**
 * initial setup method
 */
void setup()
{
	size(1600, 960);
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

	fill(0);
	rect(50, 900, gameState.getCharacterAtIndex(0).getMaxInkLevel() / 2, 30);
	fill(49, 49, 213);
	text(gameState.getCharacterAtIndex(0).getNumberOfLives(), 50, 900);
	rect(50, 900, gameState.getCharacterAtIndex(0).getInkLevel() / 2, 30);
	
	pushMatrix();
	rotate(PI);
	fill(0);
	rect(-300, -50, gameState.getCharacterAtIndex(1).getMaxInkLevel() / 2, 30);
	fill(213, 49, 49);
	text(gameState.getCharacterAtIndex(1).getNumberOfLives(), -300, -50);
	rect(-300, -50, gameState.getCharacterAtIndex(1).getInkLevel() / 2, 30);
	popMatrix();
}