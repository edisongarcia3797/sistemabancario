using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Satrack.Integracion.SistemaBancario
{
	public class DataBaseAdapter
	{
		private readonly ILogger logger;
		private readonly SistemaBancarioContext sistemaBancarioContext;

		public DataBaseAdapter(SistemaBancarioContext sistemaBancarioContext, ILogger logger)
		{
			this.sistemaBancarioContext = sistemaBancarioContext;
			this.logger = logger;
		}

		public async Task<List<Models.Services.DataBase.ClienteProductos>> QueryProducts(long identificacionCliente)
		{
			List<Models.Services.DataBase.ClienteProductos> responseData = new();

			try
			{
				SqlParameter type = new("@identificacionCliente", identificacionCliente);

				string sqlString = "ConsultarProductos @identificacionCliente";
				responseData = await sistemaBancarioContext.ClienteProductos.FromSqlRaw(sqlString, type).AsNoTracking().ToListAsync();
			}
			catch (Exception ex)
			{
				logger.LogError(ex, "[SistemaBancario] Cannot query database, message: {ex.Message}", ex.Message);
			}
			return responseData;
		}

        public async Task<(bool response, string message)> OpenProducts(Models.Services.DataBase.ClienteProducto requestData)
        {
            bool response = false;
            string message = string.Empty;
            try
            {
                SqlParameter numeroProducto = new("@numeroProducto", requestData.NumeroProducto);
                SqlParameter identificacionCliente = new("@identificacionCliente", requestData.IdentificacionCliente);
                SqlParameter id_TipoProducto = new("@id_TipoProducto", requestData.IdTipoProducto);
                SqlParameter porcentajeInteres = new("@porcentajeInteres", requestData.PorcentajeInteres);
                SqlParameter saldo = new("@saldo", requestData.Saldo);
                SqlParameter result = new()
                {
                    ParameterName = "@result",
                    DbType = System.Data.DbType.Int32,
                    Direction = System.Data.ParameterDirection.Output
                };
                SqlParameter messageError = new()
                {
                    ParameterName = "@messageError",
                    DbType = System.Data.DbType.String,
                    Direction = System.Data.ParameterDirection.Output,
                    Size = 2000
                };

                string sqlString = "InsertClienteProducto @numeroProducto,@identificacionCliente,@id_TipoProducto,@porcentajeInteres,@saldo,@result OUTPUT,@messageError OUTPUT";
                await sistemaBancarioContext.Database.ExecuteSqlRawAsync(sqlString, numeroProducto, identificacionCliente, id_TipoProducto, porcentajeInteres, saldo, result, messageError);
                if (int.Parse(result.Value.ToString()) > 0) response = true;
                message = messageError.Value.ToString();
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "[SistemaBancario] Cannot update database message: {ex.Message}", ex.Message);
                response = false;
            }

            return (response, message);
        }

        public async Task<(bool response, string message)> Transaction(Models.Services.DataBase.Transaccion requestData)
        {
            bool response = false;
            string message = string.Empty;
            try
            {
                SqlParameter numeroProducto = new("@numeroProducto", requestData.NumeroProducto);
                SqlParameter fechaTrasaccion = new("@fechaTrasaccion", requestData.FechaTrasaccion);
                SqlParameter id_TipoMovimiento = new("@id_TipoMovimiento", requestData.IdTipoMovimiento);
                SqlParameter porcentajeInteres = new("@porcentajeInteres", requestData.PorcentajeInteres);
                SqlParameter valor = new("@valor", requestData.Valor);
                SqlParameter result = new()
                {
                    ParameterName = "@result",
                    DbType = System.Data.DbType.Int32,
                    Direction = System.Data.ParameterDirection.Output
                };
                SqlParameter messageError = new()
                {
                    ParameterName = "@messageError",
                    DbType = System.Data.DbType.String,
                    Direction = System.Data.ParameterDirection.Output,
                    Size = 2000
                };

                string sqlString = "InsertTransaccion @numeroProducto,@fechaTrasaccion,@id_TipoMovimiento,@porcentajeInteres,@valor,@result OUTPUT,@messageError OUTPUT";
                await sistemaBancarioContext.Database.ExecuteSqlRawAsync(sqlString, numeroProducto, fechaTrasaccion, id_TipoMovimiento, porcentajeInteres, valor, result, messageError);
                if (int.Parse(result.Value.ToString()) > 0) response = true;
                message = messageError.Value.ToString();
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "[SistemaBancario] Cannot update database message: {ex.Message}", ex.Message);
                response = false;
            }

            return (response,message);
        }
    }
}