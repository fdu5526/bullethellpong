public class GameTurret extends GameObject
{
	private long previousTimestamp;
	private GameCharacterBullets characterBullets;

	public GameTurret(GameCharacterBullets characterBullets)
	{
		super();
		previousTimestamp = currentTime();
		this.characterBullets = characterBullets;
	}

	public void update()
	{
		if(!isVisible)
			return;
		
		if(currentTime() - previousTimestamp > 500L)
		{
			characterBullets.addBullet(pX, pY, 0, 0.5, 0, 0.05);
			characterBullets.addBullet(pX, pY, -0.3, -0.4, -0.03, 0.04);
			characterBullets.addBullet(pX, pY, 0.3, -0.4, 0.03, 0.04);
			previousTimestamp = currentTime();
		}
	}

	
	public void display()
	{
		if(!isVisible)
			return;
		
		ellipse(pX, pY, 50, 50);
	}
}