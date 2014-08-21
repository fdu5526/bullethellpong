public class GameCharacter extends GameObject
{
	public GameCharacter()
	{
		super();
	}


	public void display()
	{
		stroke(0);
		ellipse(pY, pY, 100, 100);
	}
}