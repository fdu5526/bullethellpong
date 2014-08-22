public class GameDrawing extends GameObject
{	
	private int lifespan;

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

	public void update()
	{
		if(lifespan > 0)
			lifespan--;
	}

	public boolean isActive()
	{
		return (lifespan != 0);
	}

	public void display()
	{
		if(!this.isActive())
			return;
		

		fill(0);
		ellipse(pX, pY, lifespan, lifespan);
	}
}