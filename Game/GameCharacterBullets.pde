public class GameCharacterBullets
{
	private GameBullet[] bullets;

	public GameCharacterBullets()
	{
		// initialize all the bullets
		bullets = new GameBullet[1000];
		for(int i = 0; i < bullets.length; i++)
			bullets[i] = new GameBullet();
	}

	public void addBullet()
	{
		
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