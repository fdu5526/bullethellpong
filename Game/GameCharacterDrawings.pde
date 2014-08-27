public class GameCharacterDrawings
{
	private GameDrawing[] drawings;		// array of drawings
	private int maxLifeSpan;					// how long a drawing last for this character
	private int drawingIndex;					// keep track most recently drawn drawing

	public GameCharacterDrawings(int maxLifeSpan)
	{
		this.maxLifeSpan = maxLifeSpan;
		drawingIndex = 0;

		// initialize all the drawings
		drawings = new GameDrawing[500];
		for(int i = 0; i < drawings.length; i++)
			drawings[i] = new GameDrawing();
	}

	/**
	 * move to the next drawing index
	 */
	private void increaseDrawingIndex()
	{
		// move to next drawing
		drawingIndex++;
		if(drawingIndex >= drawings.length)
			drawingIndex = 0;
	}

	/**
	 * add an active drawing
	 */
	public void addDrawing(int x, int y)
	{
		// reset lifespan, set to new location
		drawings[drawingIndex].setPositionX(x);
		drawings[drawingIndex].setPositionY(y);
		drawings[drawingIndex].resetLifespan(maxLifeSpan);

		increaseDrawingIndex();
	}

	/**
	 * add an inactive drawing, this way we can differentiate between strokes
	 */
	public void addBreak()
	{
		drawings[drawingIndex].setPositionX(0);
		drawings[drawingIndex].setPositionY(0);
		drawings[drawingIndex].removeLifespan();

		increaseDrawingIndex();
	}


	/**
	 * return the drawings so we can iterate over them
	 */
	public GameDrawing[] getDrawings()
	{
		return drawings;
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
		// loop through drawings
		for(int i = 0; i < drawings.length; i++)
		{
			//drawings[i].display();
			
			// draw a line between pairs of active drawings
			if(i > 0 && drawings[i].getIsVisible() && 
				 drawings[i - 1].getIsVisible())
			{
				strokeWeight(drawings[i].getLifespan());

				line(drawings[i].getPositionX(), drawings[i].getPositionY(),
						 drawings[i - 1].getPositionX(), drawings[i - 1].getPositionY());
			}
		}

		strokeWeight(1);
	}
}