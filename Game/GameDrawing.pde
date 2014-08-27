public class GameDrawing extends GameObject
{	
	private float lifespan;		// how many frames this drawing has left

	public GameDrawing()
	{
		super();
		lifespan = 0f;
	}

	/**
	 * when this is just drawn
	 */
	public void resetLifespan(float maxLifeSpan)
	{
		lifespan = maxLifeSpan;
	}

	/**
	 * disables this drawing
	 */
	public void removeLifespan()
	{
		lifespan = 0f;
	}

	public float getLifespan()
	{
		return lifespan;
	}

	/**
	 * check if the drawing is currently active
	 */
	public boolean getIsVisible()
	{
		return (lifespan >= 0f);
	}

	/**
	 * decreaes the lifespan
	 */
	public void update()
	{
		if(lifespan >= 0f)
			lifespan -= 0.5;
	}

	/**
	 * display the drawing
	 */
	public void display()
	{
	}
}