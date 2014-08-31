public class GameCharacterDrawings
{
	private GameDrawing[] drawings;		// array of drawings
	private float maxLifeSpan;				// how long a drawing last for this character
	private int drawingIndex;					// keep track most recently drawn drawing
	private boolean isDrawing;				// whether we are currently drawing
	private int r, g, b;							// color of the drawing
	private int currentStreakLength;	// how many drawings the current streak is


	public GameCharacterDrawings(float maxLifeSpan)
	{
		this.maxLifeSpan = maxLifeSpan;
		drawingIndex = 0;

		// initialize all the drawings
		drawings = new GameDrawing[500];
		for(int i = 0; i < drawings.length; i++)
			drawings[i] = new GameDrawing();

		isDrawing = false;

		r = g = b = 0;
	}

	public GameCharacterDrawings(float maxLifeSpan, int r, int g, int b)
	{
		this.maxLifeSpan = maxLifeSpan;
		drawingIndex = 0;

		// initialize all the drawings
		drawings = new GameDrawing[500];
		for(int i = 0; i < drawings.length; i++)
			drawings[i] = new GameDrawing();

		isDrawing = false;

		this.r = r;
		this.g = g;
		this.b = b;
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

		currentStreakLength++;
		increaseDrawingIndex();
	}

	public int getCurrentStreakLength() { return currentStreakLength; }

	/**
	 * add an inactive drawing, this way we can differentiate between strokes
	 */
	public void addBreak()
	{
		drawings[drawingIndex].setPositionX(0);
		drawings[drawingIndex].setPositionY(0);
		drawings[drawingIndex].removeLifespan();

		increaseDrawingIndex();
		currentStreakLength = 0;
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
		stroke(r,g,b);

		// loop through drawings
		for(int i = 0; i < drawings.length; i++)
		{			
			// draw a line between pairs of active drawings
			if(i > 0 && drawings[i].getIsVisible() && 
				 drawings[i - 1].getIsVisible())
			{
				strokeWeight(Math.min(30, drawings[i].getLifespan()) + random(5, 10));
				line(drawings[i].getPositionX(), drawings[i].getPositionY(),
						 drawings[i - 1].getPositionX(), drawings[i - 1].getPositionY());
			}
		}

		stroke(r * 3, g * 3, b * 3);
		// loop through drawings
		for(int i = 0; i < drawings.length; i++)
		{			
			// draw a line between pairs of active drawings
			if(i > 0 && drawings[i].getIsVisible() && 
				 drawings[i - 1].getIsVisible())
			{
				strokeWeight(Math.min(30, drawings[i].getLifespan()) / 2 + random(2, 5));
				line(drawings[i].getPositionX(), drawings[i].getPositionY(),
						 drawings[i - 1].getPositionX(), drawings[i - 1].getPositionY());
			}
		}

		strokeWeight(1);
	}
}