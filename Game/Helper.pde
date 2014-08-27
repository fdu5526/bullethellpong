import java.lang.management.ManagementFactory;

/**
 * how long the game has been running
 */
public long currentTime()
{
	return ManagementFactory.getRuntimeMXBean().getUptime();
}