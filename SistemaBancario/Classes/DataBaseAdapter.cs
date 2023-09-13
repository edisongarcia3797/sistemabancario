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

		public async Task<bool> InsertTransactionAsync(Models.Services.DataBase.TransactionType requestData)
		{
			bool response = false;
			try
			{
				SqlParameter traceId = new("@traceId", requestData.TraceId);
				SqlParameter type = new("@type", "accumulation");

				SqlParameter result = new()
				{
					ParameterName = "@result",
					DbType = System.Data.DbType.Int32,
					Direction = System.Data.ParameterDirection.Output
				};

				string sqlString = "InsertTransactions @traceId,@type,@service,@payLoad,@startDate,@endDate,@retryDate,@enableRetry,@retryNumber,@result OUTPUT";
				await sistemaBancarioContext.Database.ExecuteSqlRawAsync(sqlString, traceId, type,result);
				if (int.Parse(result.Value.ToString()) > 0) response = true;
			}
			catch (Exception ex)
			{
				logger.LogError(ex, "[AccumDequeue] Cannot update database message: {ex.Message}", ex.Message);
				response = false;
			}

			return response;
		}

		public async Task<List<Models.Services.DataBase.TransactionType>> GetTransactionsAsync(Models.Services.DataBase.TransactionType requestData)
		{
			List<Models.Services.DataBase.TransactionType> responseData = new();
			string TraceId = Guid.NewGuid().ToString();

			try
			{
				SqlParameter type = new("@type", "accumulation");

				string sqlString = "GetTransactions @type,@service";
				responseData = await sistemaBancarioContext.Transactions.FromSqlRaw(sqlString, type).AsNoTracking().ToListAsync();
			}
			catch (Exception ex)
			{
				logger.LogError(ex, "[AccumDequeue] Cannot query database, message: {ex.Message}", ex.Message);
			}
			return responseData;
		}
	}
}