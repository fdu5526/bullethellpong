/**
 * an object in game, has physics properties to it
 * Written by: Dave Yan
 * Date: 8/19/2014
 */
public abstract class GameObject
{
	protected float pX, pY;				// position X & Y
	protected float vX, vY; 			// velocity X & Y
	protected float aX, aY;				// acceleration X & Y
	protected boolean isVisible;	// whether to draw current object

	public GameObject()
	{
		pX = pY = 0f;
		vX = vY = aX = aY = 0f;
		isVisible = false;
	}

	// set functions
	public void setPositionX(float x) { pX = x; }
	public void setPositionY(float y) { pY = y; }
	public void setVelocityX(float x) { vX = x; }
	public void setVelocityY(float y) { vY = y; }
	public void setAccelerationX(float x) { aX = x; }
	public void setAccelerationY(float y) { aY = y; }
	public void setIsVisible(boolean b) { isVisible = b; }

	// get functions
	public float getPositionX() { return pX; }
	public float getPositionY() { return pY; }
	public float getVelocityX() { return vX; }
	public float getVelocityY() { return vY; }
	public float getAccelerationX() { return aX; }
	public float getAccelerationY() { return aY; }
	public boolean getIsVisible() {return isVisible; }

	/**
	 * updates position of the object
	 */
	public void update()
	{
		// uses euler integration
		vX += aX;
		vY += aY;
		pX += vX;
		pY += vY;
	}

	/**
	 * displays the object
	 */
	public abstract void display();

}