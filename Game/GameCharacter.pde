public class GameCharacter extends GameObject
{

	private float maxSpeed;			// the speed of this character

	public GameCharacter(float maxSpeed)
	{
		super();
		this.maxSpeed = maxSpeed;
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
	 * updates position of the character, prevents moving out of bounds
	 */
	public void update()
	{
		// uses euler integration
		int tempX = pX + (int)vX;
		int tempY = pY + (int)vY;

		if(0 <= tempX && tempX < width)
			pX = tempX;
		if(0 <= tempY && tempY < height)
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
		ellipse(pX, pY, 30, 30);
	}
}