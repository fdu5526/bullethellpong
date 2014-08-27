public class GameCharacterDrawings
{
	private GameDrawing[] drawings;		// array of drawings
	private float maxLifeSpan;				// how long a drawing last for this character
	private int drawingIndex;					// keep track most recently drawn drawing
	private boolean isDrawing;				// whether we are currently drawing

	public GameCharacterDrawings(float maxLifeSpan)
	{
		this.maxLifeSpan = maxLifeSpan;
		drawingIndex = 0;

		// initialize all the drawings
		drawings = new GameDrawing[500];
		for(int i = 0; i < drawings.length; i++)
			drawings[i] = new GameDrawing();

		isDrawing = false;
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
	public void addDrawing(float x, float y)
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

	public void setIsDrawing(boolean b) { isDrawing = b; }
	public boolean getIsDrawing() { return isDrawing; }

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