using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Satrack.Integracion.SistemaBancario.Models.Services.DataBase
{
	public class TransactionType
	{
		[Key][Column("id", TypeName = "bigint")] public ulong Id { get; set; }
		[Column("traceId", TypeName = "nvarchar")] public string TraceId { get; set; }
	}
}