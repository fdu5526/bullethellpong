public class GameCharacter extends GameObject
{

	private float maxVelocity;

	public GameCharacter(float maxVelocity)
	{
		super();

		this.maxVelocity = maxVelocity;
	}

	// moves the character, wrapper for GameObject set and get methods
	public void startMovingLeft() { this.setVelocityX(-maxVelocity); }
	public void startMovingRight() { this.setVelocityX(maxVelocity); }
	public void startMovingUp() { this.setVelocityY(-maxVelocity); }
	public void startMovingDown() { this.setVelocityY(maxVelocity); }
	public void stopMovingLeft() { if(this.getVelocityX() == -maxVelocity) this.setVelocityX(0f); }
	public void stopMovingRight() { if(this.getVelocityX() == maxVelocity) this.setVelocityX(0f); }
	public void stopMovingUp() { if(this.getVelocityY() == -maxVelocity) this.setVelocityY(0f); }
	public void stopMovingDown() { if(this.getVelocityY() == maxVelocity) this.setVelocityY(0f); }


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