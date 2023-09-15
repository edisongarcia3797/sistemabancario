using Azure;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Satrack.Integracion.SistemaBancario
{
    public interface IServiciosSistemaBancario
    {
        Task<List<Models.Services.SistemaBancario.ResponseQueryProducts>> QueryProducts(Models.Services.SistemaBancario.RequestData requestData);
        Task<(bool response, string message)> OpenProducts(Models.Services.SistemaBancario.RequestOpenProduct requestOpenProducts);
        Task<(bool response, string message)> Transaction(Models.Services.SistemaBancario.RequestTransaction requestTransaction);
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

        public async Task<List<Models.Services.SistemaBancario.ResponseQueryProducts>> QueryProducts(Models.Services.SistemaBancario.RequestData requestData)
        {
            List<Models.Services.SistemaBancario.ResponseQueryProducts> responseData = new();

            DataBaseAdapter dataBaseAdapter = new(new SistemaBancarioContext(dbContextOptions), logger);
            var listaProductos = await dataBaseAdapter.QueryProducts((long)requestData.IdentificacionCliente);

            foreach (var item in listaProductos)
            {
                responseData.Add(new Models.Services.SistemaBancario.ResponseQueryProducts
                {
                    NombreCliente = item.NombreCliente,
                    TipoCliente = item.TipoCliente,
                    NumeroProducto = item.NumeroProducto,
                    NombreProducto = item.NombreProducto,
                    PorcentajeInteres = item.PorcentajeInteres,
                    Saldo = item.Saldo,
                    IdentificacionCliente = null
                });
            }
            return responseData;
        }

        public async Task<(bool response, string message)> OpenProducts(Models.Services.SistemaBancario.RequestOpenProduct requestOpenProducts)
        {
            DataBaseAdapter dataBaseAdapter = new(new SistemaBancarioContext(dbContextOptions), logger);

            Models.Services.DataBase.ClienteProducto clienteProducto = new()
            {
                IdentificacionCliente = (long)requestOpenProducts.IdentificacionCliente,
                NumeroProducto = requestOpenProducts.NumeroProducto,
                IdTipoProducto = requestOpenProducts.TipoProducto,
                PorcentajeInteres = requestOpenProducts.TipoProducto.Equals(1) ? this.serviceSettings.Interes.porcentajeAhorro : requestOpenProducts.TipoProducto.Equals(3) ? this.serviceSettings.Interes.porcentajeCDT : 0,
                Saldo = requestOpenProducts.Saldo,
            };
            return await dataBaseAdapter.OpenProducts(clienteProducto);
        }

        public async Task<(bool response, string message)> Transaction(Models.Services.SistemaBancario.RequestTransaction requestTransaction)
        {
            DataBaseAdapter dataBaseAdapter = new(new SistemaBancarioContext(dbContextOptions), logger);

            Models.Services.DataBase.Transaccion transaccion = new()
            {
                NumeroProducto = requestTransaction.NumeroProducto,
                FechaTrasaccion = DateTime.Now,
                IdTipoMovimiento = requestTransaction.TipoMovimiento,
                PorcentajeInteres = 0,
                Valor = requestTransaction.Valor,
            };
            return await dataBaseAdapter.Transaction(transaccion);
        }
    }
}