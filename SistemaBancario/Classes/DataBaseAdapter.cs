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

		public async Task<bool> OpenProducts(Models.Services.DataBase.ClienteProducto requestData)
		{
			bool response = false;
			try
			{
				SqlParameter numeroProducto = new("@numeroProducto", requestData.NumeroProducto);
				SqlParameter identificacionCliente = new("@identificacionCliente", requestData.IdentificacionCliente);
                SqlParameter id_TipoProducto = new("@id_TipoProducto", requestData.IdTipoProducto);
                SqlParameter saldo = new("@saldo", requestData.Saldo);
                SqlParameter result = new()
				{
					ParameterName = "@result",
					DbType = System.Data.DbType.Int32,
					Direction = System.Data.ParameterDirection.Output
				};

				string sqlString = "InsertClienteProducto @numeroProducto,@identificacionCliente,@id_TipoProducto,@saldo,@result OUTPUT";
				await sistemaBancarioContext.Database.ExecuteSqlRawAsync(sqlString, numeroProducto, identificacionCliente, id_TipoProducto, saldo, result);
				if (int.Parse(result.Value.ToString()) > 0) response = true;
			}
			catch (Exception ex)
			{
				logger.LogError(ex, "[SistemaBancario] Cannot update database message: {ex.Message}", ex.Message);
				response = false;
			}

			return response;
		}

		public async Task<List<Models.Services.DataBase.ClienteProductos>> QueryProducts(Models.Services.DataBase.Parametros requestData)
		{
			List<Models.Services.DataBase.ClienteProductos> responseData = new();

			try
			{
				SqlParameter type = new("@identificacionCliente", requestData.IdentificacionCliente);

				string sqlString = "ConsultarProductos @identificacionCliente";
				responseData = await sistemaBancarioContext.ClienteProductos.FromSqlRaw(sqlString, type).AsNoTracking().ToListAsync();
			}
			catch (Exception ex)
			{
				logger.LogError(ex, "[SistemaBancario] Cannot query database, message: {ex.Message}", ex.Message);
			}
			return responseData;
		}
	}
}