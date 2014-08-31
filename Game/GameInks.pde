public class GameInks
{
	private GameInk[] inks;					// array of inks
	private int inkIndex;						// keep track most recently dispersed ink

	public GameInks()
	{
		inkIndex = 0;

		// initialize all the inks
		inks = new GameInk[100];
		for(int i = 0; i < inks.length; i++)
		{
			inks[i] = new GameInk();
		}
	}

	/**
	 * move to the next ink index
	 */
	private void increaseInkIndex()
	{
		// move to next ink
		inkIndex++;
		if(inkIndex >= inks.length)
			inkIndex = 0;
	}

	/**
	 * add an active ink
	 */
	public void addInk(float px, float py, int amount)
	{
		// reset lifespan, set to new location
		inks[inkIndex].setPositionX(px);
		inks[inkIndex].setPositionY(py);
		inks[inkIndex].setVelocityX(random(-10, 10));
		inks[inkIndex].setVelocityY(random(-10, 10));
		inks[inkIndex].setAccelerationX(inks[inkIndex].getVelocityX()/-750.0);
		inks[inkIndex].setAccelerationY(inks[inkIndex].getVelocityY()/-750.0);
		inks[inkIndex].setIsVisible(true);
		inks[inkIndex].setAmount(amount);

		increaseInkIndex();
	}

	public int getAndRemoveInkAtIndex(int i)
	{
		inks[i].setIsVisible(false);
		return inks[i].getAmount();
	}

	/**
	 * return the inks so we can iterate over them
	 */
	public GameInk[] getInks()
	{
		return inks;
	}

	// update all the inks
	public void update()
	{
		for(int i = 0; i < inks.length; i++)
			inks[i].update();
	}

	// display all the inks
	public void display()
	{
		for(int i = 0; i < inks.length; i++)
			inks[i].display();
	}
}