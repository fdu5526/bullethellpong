public class GameBullet extends GameObject
{

	PImage bulletImage;

	public GameBullet()
	{
		super();
		bulletImage = null;
	}

	public void display()
	{
		if(!isVisible)
			return;

		fill(213, 49, 49);
		ellipse(pX, pY, 10, 10);
	}
}