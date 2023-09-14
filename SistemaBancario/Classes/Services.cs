using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Satrack.Integracion.SistemaBancario
{
    public interface IServiciosSistemaBancario
    {
        Task<List<Models.Services.SistemaBancario.RespuestaClienteProductos>> ConsultarProductos(Models.Services.SistemaBancario.RequestData requestData);
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

        public async Task<List<Models.Services.SistemaBancario.RespuestaClienteProductos>> ConsultarProductos(Models.Services.SistemaBancario.RequestData requestData)
        {
            List<Models.Services.SistemaBancario.RespuestaClienteProductos> responseData = new();

            DataBaseAdapter dataBaseAdapter = new(new SistemaBancarioContext(dbContextOptions), logger);
            var listaProductos = await dataBaseAdapter.ConsultarProductos(new Models.Services.DataBase.Parametros { IdentificacionCliente = (long)requestData.IdentificacionCliente });

            foreach (var item in listaProductos)
            {
                responseData.Add(new Models.Services.SistemaBancario.RespuestaClienteProductos
                {
                    NombreCliente = item.NombreCliente,
                    NumeroProducto = item.NumeroProducto,
                    NombreProducto = item.NombreProducto,
                    Saldo = item.Saldo,
                });
            }
            return responseData;
        }
    }
}