using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Satrack.Integracion.SistemaBancario
{
	public class Program
	{
		public static void Main(string[] args) { CreateHostBuilder(args).Build().Run(); }

		public static IHostBuilder CreateHostBuilder(string[] args) =>
				Host.CreateDefaultBuilder(args)
						.ConfigureAppConfiguration(c =>
						{
							c.AddJsonFile("settings/appsettings.json", optional: true, reloadOnChange: true);
							System.Environment.SetEnvironmentVariable("Log4NetFilename", System.Net.Dns.GetHostName());
						})
						.ConfigureLogging(LogginConfigure)
						.ConfigureWebHostDefaults(webBuilder => { webBuilder.UseStartup<Startup>(); });

		public static void LogginConfigure(ILoggingBuilder loggingBuilder)
		{
			loggingBuilder.ClearProviders();
			loggingBuilder.SetMinimumLevel(LogLevel.Trace);
			loggingBuilder.AddLog4Net("Logger.config");
		}
	}
}
