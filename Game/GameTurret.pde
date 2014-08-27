public class GameTurret extends GameObject
{
	private long lastTimeshot;													// the last time the turret shot a bullet
	private GameCharacterBullets characterBullets;			// the bullets that this turret shoots

	public GameTurret(GameCharacterBullets characterBullets)
	{
		super();
		lastTimeshot = currentTime();
		this.characterBullets = characterBullets;
	}

	/**
	 * updates the turret, shoot bullets if it is off of cooldown
	 */
	public void update()
	{
		if(!isVisible)
			return;
		
		if(currentTime() - lastTimeshot > 500L)
		{
			characterBullets.addBullet(pX, pY, 0, 0.5, 0, 0.05);
			characterBullets.addBullet(pX, pY, -0.3, -0.4, -0.03, 0.04);
			characterBullets.addBullet(pX, pY, 0.3, -0.4, 0.03, 0.04);
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
		
		ellipse(pX, pY, 50, 50);
	}
}