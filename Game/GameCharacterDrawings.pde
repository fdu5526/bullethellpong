public class GameCharacterDrawings
{
	private GameDrawing[] drawings;
	private int maxLifeSpan;
	private int drawingCounter;

	public GameCharacterDrawings(int maxLifeSpan)
	{
		this.maxLifeSpan = maxLifeSpan;
		drawingCounter = 0;

		// initialize all the drawings
		drawings = new GameDrawing[500];
		for(int i = 0; i < drawings.length; i++)
			drawings[i] = new GameDrawing();
	}

	private void increaseDrawingCounter()
	{
		// move to next drawing
		drawingCounter++;
		if(drawingCounter >= drawings.length)
			drawingCounter = 0;
	}

	public void addDrawing(int x, int y)
	{
		// reset lifespan, set to new location
		drawings[drawingCounter].setPositionX(x);
		drawings[drawingCounter].setPositionY(y);
		drawings[drawingCounter].resetLifespan(maxLifeSpan);

		increaseDrawingCounter();
	}

	public void addBreak()
	{
		drawings[drawingCounter].setPositionX(0);
		drawings[drawingCounter].setPositionY(0);
		drawings[drawingCounter].removeLifespan();

		increaseDrawingCounter();
	}

	// update all the drawings
	public void update()
	{
		for(int i = 0; i < drawings.length; i++)
			drawings[i].update();
	}

	// display all the drawings
	public void display()
	{
		for(int i = 0; i < drawings.length; i++)
		{
			drawings[i].display();
			
			if(i > 0 && drawings[i].isActive() && 
				 drawings[i - 1].isActive())
				line(drawings[i].getPositionX(), drawings[i].getPositionY(),
						 drawings[i - 1].getPositionX(), drawings[i - 1].getPositionY());

		}
	}
}