public class GameBullet extends GameObject
{
	private int r, g, b, radius;

	public GameBullet(int r, int g, int b, int radius)
	{
		super();
		this.r = r;
		this.g = g;
		this.b = b;
		this.radius = radius;
	}

	public int getRadius() { return radius; }

	public void display()
	{
		if(!isVisible)
			return;

		stroke(r,g,b);
		strokeWeight(5);
		fill(255);
		ellipse(pX, pY, radius, radius);
	}
}