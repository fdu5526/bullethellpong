public class GameCharacter extends GameObject
{
	private float maxSpeed;							// the speed of this character
	private float radius;								// the size of the character
	private PImage sprite;							// sprite of character
	private int numberOfLives;					// number of lives of this character
	private int inkLevel, maxInkLevel;	// level of ink
	private boolean isFacingUp;					// whether this character is facing up or not
	private GameTurret turret;					// the turret if the player is holding onto a turret

	public GameCharacter(float maxSpeed, float radius, boolean isFacingUp, PImage sprite)
	{
		super();
		this.maxSpeed = maxSpeed;
		this.radius = radius;
		this.sprite = sprite;
		this.isFacingUp = isFacingUp;
		this.turret = null;
		numberOfLives = 5;
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

	public void setNumberOfLives(int l) { numberOfLives = l; }
	public int getNumberOfLives() { return numberOfLives; }
	public boolean hasTurret(){return turret != null; }
	/**
	 * get the radius of the character
	 */
	public float getRadius() { return radius; }

	public void setInkLevel(int level) { inkLevel = Math.min(maxInkLevel, level); }
	public int getInkLevel() { return inkLevel; }

	public void getTurret(GameTurret turret) 
	{ 
		if(this.turret == null)
		{
			this.turret = turret;
			this.turret.setIsVisible(false);
		}
	}
	public void placeTurret()
	{
		if(this.turret != null)
		{
			this.turret.placeTurret(this.getPositionX(), this.getPositionY());
			this.turret = null;
		}
	}


	/**
	 * updates position of the character, prevents moving out of bounds
	 */
	public void update()
	{
		// uses euler integration
		float tempX = pX + vX;
		float tempY = pY + vY;
		
		// check out of bounds
		if(30f <= tempX && tempX < width - 30f)
			pX = tempX;
		if(30f <= tempY && tempY < height - 30f)
			pY = tempY;
		
	}
	
	/**
	 * draw the character
	 */
	public void display()
	{
		if(!isVisible)
			return;

		if(this.hasTurret())
		{
			strokeWeight(2);
			stroke(49, 213, 49);
			noFill();
			ellipse(pX, pY, turret.getRadius(), turret.getRadius());
		}


		stroke(0);
		fill(255);
		image(sprite, pX, pY);
		ellipse(pX, pY, radius, radius);

	}
}