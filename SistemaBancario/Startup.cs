using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging.Extensions;
using System;

namespace Satrack.Integracion.SistemaBancario
{
	public class Startup
	{
		public IConfiguration Configuration { get; }
		private readonly ILogger<Startup> logger;

		public Startup(IConfiguration configuration)
		{
			Configuration = configuration;
			ILoggerFactory loggerFactory = LoggerFactory.Create(Program.LogginConfigure);
			logger = loggerFactory.CreateLogger<Startup>();
		}

		public Startup(IWebHostEnvironment env)
		{
			var builder = new ConfigurationBuilder()
						.SetBasePath(env.ContentRootPath)
						.AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
						.AddEnvironmentVariables();

            Configuration = builder.Build();
        }

		public void ConfigureServices(IServiceCollection services)
		{
			services.Configure<ProxySettings>(Configuration.GetSection("ProxySettings"));
            services.Configure<ServiceSettings>(Configuration.GetSection("ServiceSettings"));
            
            string sqlServerConn = Configuration["DataBaseSettings:SqlServer"];
            services.AddDbContext<SistemaBancarioContext>(options => options.UseSqlServer(sqlServerConn));

            IServiceSettings serviceSettings = new ServiceSettings();
            Configuration.Bind("ServiceSettings", serviceSettings);
            services.AddSingleton(serviceSettings);

            services.AddControllers().AddNewtonsoftJson(options => options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);
			services.AddOptions();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			if (env.IsDevelopment()) { app.UseDeveloperExceptionPage(); }
			app.UseRouting();
			app.UseAuthorization();
				
			app.UseEndpoints(endpoints =>
			{
				endpoints.MapGet("/version", async context =>
				{
					Version ver;
					string version = Environment.GetEnvironmentVariable("VERSION");

					if (!string.IsNullOrEmpty(version)) ver = Version.Parse(version.Replace("v", string.Empty));
					else ver = typeof(Program).Assembly.GetName().Version;

					await context.Response.WriteAsync(string.Format("{0}.{1}.{2}", ver.Major, ver.Minor, ver.Build));
				});
				endpoints.MapControllers();
			});
		}
	}
}
