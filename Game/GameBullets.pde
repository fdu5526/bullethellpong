public class GameBullets
{
	private GameBullet[] bullets;		// array of bullets
	private int bulletIndex;				// keep track most recently drawn drawing
	private int size;								// size of bullet

	public GameBullets(int r, int g, int b, int s)
	{
		bulletIndex = 0;

		// initialize all the bullets
		bullets = new GameBullet[1000];
		for(int i = 0; i < bullets.length; i++)
		{
			bullets[i] = new GameBullet(r, g, b, s);
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