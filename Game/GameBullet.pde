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

		stroke(r,g,b, 200);
		strokeWeight(4);
		fill(r*4,g*4,b*4, 200);
		ellipse(pX, pY, radius, radius);
	}
}