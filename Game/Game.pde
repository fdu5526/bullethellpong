

GameState gameState;

void setup()
{
	size(1600, 900);
  frameRate(24);

  imageMode(CENTER);
  noStroke();

  gameState = new GameState();

  background(255);
}



void draw()
{
	gameState.display();
}