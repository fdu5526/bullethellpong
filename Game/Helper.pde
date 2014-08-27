import java.lang.management.ManagementFactory;


public static long currentTime()
{
	return ManagementFactory.getRuntimeMXBean().getUptime();
}

/**
 * check if 2 circles collides
 */
public static boolean collisionCircleWithCircle(float x1, float y1, float r1,
																								float x2, float y2, float r2)
{
	float dx = x1 - x2;
	float dy = y1 - y2;
	float di = r1 - r2;
	return (dx * dx + dy * dy < di * di / 2);
}


/**
 * check if a circle and a line segment collides
 * source adapted from http://stackoverflow.com/a/17303523
 */
public static boolean collisionCircleWithLine(float x1, float y1, float r1,
																						  float px1, float py1, float px2, float py2, float thickness)
{
	float di = r1 + thickness;

	float vx = px1 - x1;
	float vy = py1 - y1;
	float ux = px2 - px1;
	float uy = py2 - py1;

	float len = ux * ux + uy * uy;
	float det = (-vx * ux) + (-vy * uy); // if this is < 0 or > len then its outside the line segment
	
	if(det < 0)
	  return ((px1 - x1) * (px1 - x1) + (py1 - y1) * (py1 - y1) * 2.0 < di * di / 2);
	else if(det > len)
		return ((px2 - x1) * (px2 - x1) + (py2 - y1) * (py2 - y1) < di * di / 2);
	else
	{
		det = ux * vy - uy * vx;
		return (det * det / len < di * di / 2);
	}
}