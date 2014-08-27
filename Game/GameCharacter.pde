public class GameCharacter extends GameObject
{
	private float maxSpeed;			// the speed of this character
	private float radius;				// the size of the character

	public GameCharacter(float maxSpeed, float radius)
	{
		super();
		this.maxSpeed = maxSpeed;
		this.radius = radius;
	}

	// moves the character, wrapper for GameObject set and get methods
	public void startMovingLeft() { this.setVelocityX(-maxSpeed); }
	public void startMovingRight() { this.setVelocityX(maxSpeed); }
	public void startMovingUp() { this.setVelocityY(-maxSpeed); }
	public void startMovingDown() { this.setVelocityY(maxSpeed); }
	public void stopMovingLeft() { if(this.getVelocityX() == -maxSpeed) this.setVelocityX(0f); }
	public void stopMovingRight() { if(this.getVelocityX() == maxSpeed) this.setVelocityX(0f); }
	public void stopMovingUp() { if(this.getVelocityY() == -maxSpeed) this.setVelocityY(0f); }
	public void stopMovingDown() { if(this.getVelocityY() == maxSpeed) this.setVelocityY(0f); }

	/**
	 * get the radius of the character
	 */
	public float getRadius() { return radius; }

	/**
	 * updates position of the character, prevents moving out of bounds
	 */
	public void update()
	{
		// uses euler integration
		float tempX = pX + vX;
		float tempY = pY + vY;

		// check out of bounds
		if(0f <= tempX && tempX < width)
			pX = tempX;
		if(0f <= tempY && tempY < height)
			pY = tempY;
	}
	
	/**
	 * draw the character
	 */
	public void display()
	{
		if(!isVisible)
			return;

		stroke(0);
		fill(255);
		ellipse(pX, pY, radius, radius);
	}
}