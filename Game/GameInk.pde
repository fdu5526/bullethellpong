public class GameInk extends GameObject
{
	private int radius;

	public GameInk()
	{
		super();
		this.radius = 0;
	}

	public int getRadius() { return radius; }
	public void setRadius(int radius) { this.radius = radius; }
	public boolean getIsVisible() { return radius > 0; }

	public void update()
	{
		// uses euler integration
		float tempX = pX + vX;
		float tempY = pY + vY;
		
		// check out of bounds
		if(30f <= tempX && tempX < width - 30f)
			pX = tempX;
		else
		{
			aX *= -random(0.75, 1.25);
			vX *= -random(0.75, 1.25);
			pX += vX;
		}
		if(30f <= tempY && tempY < height - 30f)
			pY = tempY;
		else
		{
			aY *= -random(0.75, 1.25);
			vY *= -random(0.75, 1.25);
			pY += vY;
		}
	}


	public void display()
	{
		if(radius <= 0)
			return;

		stroke(0);
		strokeWeight(2);
		fill(255);
		rect(pX - radius/2, pY - radius/2, radius, radius);
	}
}