public class GameBullet extends GameObject
{

	private PImage bulletImage;
	private int r, g, b;

	public GameBullet()
	{
		super();
		bulletImage = null;

		r = 213;
		g = 49;
		b = 49;
	}

	public GameBullet(int r, int g, int b)
	{
		super();
		bulletImage = null;
		this.r = r;
		this.g = g;
		this.b = b;
	}

	public void display()
	{
		if(!isVisible)
			return;

		fill(r, g, b);
		ellipse(pX, pY, 10, 10);
	}
}