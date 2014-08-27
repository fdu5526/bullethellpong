public class GameTurret extends GameObject
{
	private long lastTimeshot;													// the last time the turret shot a bullet
	private GameCharacterBullets characterBullets;			// the bullets that this turret shoots
	int r, g, b;																				// color of turret
	private boolean isAimingUp;													// whether we are currently aiming up

	public GameTurret(GameCharacterBullets characterBullets, int r, int g, int b, boolean isAimingUp)
	{
		super();
		lastTimeshot = currentTime();
		this.characterBullets = characterBullets;
		this.isAimingUp = isAimingUp;
		this.r = r;
		this.g = g;
		this.b = b;
	}

	/**
	 * updates the turret, shoot bullets if it is off of cooldown
	 */
	public void update()
	{
		if(!isVisible)
			return;
		
		float dy = 1.0;
		if(isAimingUp)
			dy = -1.0;

		if(currentTime() - lastTimeshot > 500L)
		{
			characterBullets.addBullet(pX, pY, 0, dy*0.5, 0, dy*0.05);
			characterBullets.addBullet(pX, pY, -0.3, dy*0.4, -0.03, dy*0.04);
			characterBullets.addBullet(pX, pY, 0.3, dy*0.4, 0.03, dy*0.04);
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