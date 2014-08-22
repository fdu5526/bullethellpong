public class GameState
{
	private GameCharacter mainCharacter;


	public GameState()
	{
		mainCharacter = new GameCharacter(10);
		mainCharacter.setPositionX(100);
		mainCharacter.setPositionY(100);
		mainCharacter.setIsVisible(true);
	}


	/**
	 * get the main character of the game state
	 */
	public GameCharacter getMainCharacter() { return mainCharacter; }


	/**
	 * updates all objects in the state of the game
	 */
	public void update()
	{
		mainCharacter.update();
	}

	/**
	 * displays all objects in the state of the game
	 */
	public void display()
	{
		mainCharacter.display();
	}
}