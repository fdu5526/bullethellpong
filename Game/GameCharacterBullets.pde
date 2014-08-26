public class GameCharacterBullets
{
	private GameBullet[] bullets;		// array of bullets
	private int bulletIndex;				// keep track most recently drawn drawing

	public GameCharacterBullets()
	{
		bulletIndex = 0;

		// initialize all the bullets
		bullets = new GameBullet[1000];
		for(int i = 0; i < bullets.length; i++)
		{
			bullets[i] = new GameBullet();
		}
	}

	/**
	 * move to the next bullet index
	 */
	private void increaseBulletIndex()
	{
		// move to next bullet
		bulletIndex++;
		if(bulletIndex >= bullets.length)
			bulletIndex = 0;
	}

	/**
	 * add an active bullet
	 */
	public void addBullet(float px, float py, float vx, float vy, float ax, float ay)
	{
		// reset lifespan, set to new location
		bullets[bulletIndex].setPositionX(px);
		bullets[bulletIndex].setPositionY(py);
		bullets[bulletIndex].setVelocityX(vx);
		bullets[bulletIndex].setVelocityY(vy);
		bullets[bulletIndex].setAccelerationX(ax);
		bullets[bulletIndex].setAccelerationY(ay);
		bullets[bulletIndex].setIsVisible(true);

		increaseBulletIndex();
	}

	/**
	 * add an inactive bullet, this way we can differentiate between strokes
	 */
	public void addBreak()
	{
		bullets[bulletIndex].setPositionX(0);
		bullets[bulletIndex].setPositionY(0);
		bullets[bulletIndex].setIsVisible(false);

		increaseBulletIndex();
	}

	/**
	 * return the bullets so we can iterate over them
	 */
	public GameBullet[] getBullets()
	{
		return bullets;
	}

	// update all the bullets
	public void update()
	{
		for(int i = 0; i < bullets.length; i++)
			bullets[i].update();
	}

	// display all the bullets
	public void display()
	{
		for(int i = 0; i < bullets.length; i++)
			bullets[i].display();
	}
}