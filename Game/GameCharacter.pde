public class GameCharacter extends GameObject
{
	public GameCharacter()
	{
		super();
	}


	public void stopMovement()
	{
		vX = vY = aX = aY = 0f;
	}

	public void display()
	{
		stroke(0);
		ellipse(pX, pY, 100, 100);
	}
}