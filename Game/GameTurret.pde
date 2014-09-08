public class GameTurret extends GameObject
{
	private long lastTimeshot;													// the last time the turret shot a bullet
	private GameBullets bullets;												// the bullets that this turret shoots
	int r, g, b;																				// color of turret
	int cooldown;																				// how long between a wave of bullet

	public GameTurret(GameBullets bullets, int r, int g, int b, int cooldown)
	{
		super();
		lastTimeshot = currentTime();
		this.bullets = bullets;
		this.r = r;
		this.g = g;
		this.b = b;
		this.cooldown = cooldown;
	}

	/**
	 * places turret at location
	 */
	public void placeTurret(float x, float y)
	{
		this.setPositionX(x);
		this.setPositionY(y);
		this.setIsVisible(true);
		lastTimeshot = currentTime() + cooldown/2;
	}


	public int getRadius()
	{
		return 50;
	}

	/**
	 * updates the turret, shoot bullets if it is off of cooldown
	 */
	public void update()
	{
		if(!isVisible)
			return;

		if(currentTime() - lastTimeshot > cooldown)
		{
			float x = cos(currentTime()/cooldown) * 1.5;
			float y = sin(currentTime()/cooldown) * 1.5;
			bullets.addBullet(pX, pY, x, y, x/100.0, y/100.0, bullets.getBulletSize());
			bullets.addBullet(pX, pY, -x, -y, x/-100.0, y/-100.0, bullets.getBulletSize());
			lastTimeshot = currentTime();
		}
	}

	/**
	 * displays the turret
	 */
	public void display()
	{
		if(!isVisible)
			return;
		
		noStroke();
		fill(r,g,b);
		ellipse(pX, pY, 50, 50);
	}
}