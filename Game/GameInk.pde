public class GameInk extends GameObject
{
	private int amount;

	public GameInk()
	{
		super();
		this.amount = 0;
	}

	public int getRadius() { return Math.min(60, Math.max(30, amount)); }
	public void setAmount(int amount) { this.amount = amount; }
	public int getAmount() { return amount; }
	public boolean getIsVisible() { return amount > 0; }
	public float getPositionX(){ return pX - this.pX/this.getRadius()/2; }
	public float getPositionY(){ return pY - this.pY/this.getRadius()/2; }
	public void update()
	{
		// uses euler integration
		vX += aX;
		vY += aY;
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
		if(amount <= 0)
			return;

		int r = this.getRadius();
		stroke(0);
		strokeWeight(2);
		fill(255);
		rect(pX - r/2, pY - r/2, r, r);
	}
}