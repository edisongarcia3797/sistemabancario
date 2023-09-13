using Satrack.Integracion.SistemaBancario.Models.Common;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Satrack.Integracion.SistemaBancario.Models.Proxy
{
	public class RequestData
	{
		[Required][JsonProperty("documentNumber", Order = 1)] public ulong? DocumentNumber { get; set; }
		[Required][JsonProperty("traceId", Order = 17)] public string TraceId { get; set; }
	}

	public class ResponseData
	{
		[JsonProperty("response", Order = 1)] public bool Response { get; set; }
		[JsonProperty("message", Order = 2)] public string Message { get; set; }
		[JsonProperty("messageDetail", Order = 3)] public string MessageDetail { get; set; }
		[JsonProperty("traceId", Order = 10)] public string TraceId { get; set; }
	}
}