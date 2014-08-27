public class GameCharacterTurrets
{
	private GameTurret[] turrets;

	public GameCharacterTurrets(GameCharacterBullets characterBullets, int numberOfTurrets)
	{
		turrets = new GameTurret[numberOfTurrets];
		for(int i = 0; i < turrets.length; i++)
			turrets[i] = new GameTurret(characterBullets);
			
	}


	//TODO delete me
	public void hardcodeTurret()
	{	
		turrets[0].setPositionX(500);
		turrets[0].setPositionY(0);
		turrets[0].setIsVisible(true);
		turrets[1].setPositionX(750);
		turrets[1].setPositionY(100);
		turrets[1].setIsVisible(true);
		turrets[2].setPositionX(250);
		turrets[2].setPositionY(200);
		turrets[2].setIsVisible(true);
	}

	public void update()
	{
		for(int i = 0; i < turrets.length; i++)
			turrets[i].update();
	}


	public void display()
	{
		for(int i = 0; i < turrets.length; i++)
			turrets[i].display();
	}
}