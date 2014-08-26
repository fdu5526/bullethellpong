import java.lang.management.ManagementFactory;


public long currentTime()
{
	return ManagementFactory.getRuntimeMXBean().getUptime();
}