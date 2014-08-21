public class GameState
{
	private GameCharacter mainCharacter;
	
	
	public GameState()
	{
		mainCharacter = new GameCharacter();
		mainCharacter.setPositionX(100);
		mainCharacter.setPositionY(100);
	}



	public GameCharacter getMainCharacter() { return mainCharacter; }


	public void update()
	{
		mainCharacter.update();
	}


	public void display()
	{
		mainCharacter.display();
	}
}