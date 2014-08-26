public class GameDrawing extends GameObject
{	
	private int lifespan;		// how many frames this drawing has left

	public GameDrawing()
	{
		super();
		lifespan = 0;
	}

	/**
	 * when this is just drawn
	 */
	public void resetLifespan(int maxLifeSpan)
	{
		lifespan = maxLifeSpan;
	}

	/**
	 * disables this drawing
	 */
	public void removeLifespan()
	{
		lifespan = 0;
	}

	public int getLifespan()
	{
		return lifespan;
	}

	/**
	 * check if the drawing is currently active
	 */
	public boolean isActive()
	{
		return (lifespan != 0);
	}

	/**
	 * decreaes the lifespan
	 */
	public void update()
	{
		if(lifespan - 1 >= 0)
			lifespan -= 1;
	}

	/**
	 * display the drawing
	 */
	public void display()
	{
		if(!this.isActive())
			return;
		

		fill(0);
		ellipse(pX, pY, lifespan, lifespan);
	}
}