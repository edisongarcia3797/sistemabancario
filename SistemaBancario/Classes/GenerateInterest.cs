using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace Satrack.Integracion.SistemaBancario
{
	public class GenerateInterestHostedService : BackgroundService
	{
        private readonly IServiceSettings serviceSettings;
        private readonly ILogger<GenerateInterestHostedService> logger;
		public GenerateInterestHostedService(IServiceSettings serviceSettings,ILogger<GenerateInterestHostedService> logger)
		{
			this.serviceSettings = serviceSettings;
			this.logger = logger;
		}

		protected override async Task ExecuteAsync(CancellationToken stoppingToken)
		{
			await DoPcoWork(stoppingToken);
		}

		private async Task DoPcoWork(CancellationToken cancellationToken)
		{
			while (!cancellationToken.IsCancellationRequested)
			{
				try
				{
					Console.WriteLine("Proceso en segundo plano para generar interés mes a mes");
				}
				catch (Exception ex) 
				{ 
					logger.LogError(ex, "[SistemaBancario] Falló la generación de interés. Error:  {ex.Message}", ex.Message); 
				}
				Thread.Sleep(5000);
			}	
		}

		public override async Task StopAsync(CancellationToken cancellationToken)
		{
			await base.StopAsync(cancellationToken);
		}
	}
}