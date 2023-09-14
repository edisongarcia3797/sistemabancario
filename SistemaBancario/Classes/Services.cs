using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Threading.Tasks;

namespace Satrack.Integracion.SistemaBancario
{
    public interface IServiciosSistemaBancario
    {
        Task<Models.Services.SistemaBancario.ResponseData> ConsultarProductos(Models.Services.SistemaBancario.RequestData requestData);
    }

    public class ServiciosSistemaBancario : IServiciosSistemaBancario
    {
        private readonly IServiceSettings serviceSettings;
        private readonly DbContextOptions<SistemaBancarioContext> dbContextOptions;
        private readonly ILogger logger;

        public ServiciosSistemaBancario(IServiceSettings serviceSettings, DbContextOptions<SistemaBancarioContext> dbContextOptions, ILogger logger)
        {
            this.serviceSettings = serviceSettings;
            this.dbContextOptions = dbContextOptions;
            this.logger = logger;
        }

        public async Task<Models.Services.SistemaBancario.ResponseData> ConsultarProductos(Models.Services.SistemaBancario.RequestData requestData)
        {
            DataBaseAdapter dataBaseAdapter = new(new SistemaBancarioContext(dbContextOptions), logger);
      
            var result = await dataBaseAdapter.ConsultarProductos(new Models.Services.DataBase.Parametros { IdentificacionCliente = 15373797});
            return new Models.Services.SistemaBancario.ResponseData();
        }
    }
}