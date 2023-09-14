using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Satrack.Integracion.SistemaBancario.Models.Services.SistemaBancario
{
    public class RequestData
    {
        [JsonProperty("identificacionCliente")] public long IdentificacionCliente { get; set; }
    }

    public class ResponseQueryProducts
    {
        [JsonProperty("nombre", Order = 1)] public string NombreCliente { get; set; }
        [JsonProperty("numeroProducto", Order = 2)] public long NumeroProducto { get; set; }
        [JsonProperty("producto", Order = 3)] public string NombreProducto { get; set; }
        [JsonProperty("saldo", Order = 3)] public double Saldo { get; set; }
    }

    public class RequestOpenProduct : RequestData
    {
        [JsonProperty("numeroProducto", Order = 2)] public long NumeroProducto { get; set; }
        [JsonProperty("tipoProducto", Order = 3)] public int TipoProducto { get; set; }
        [JsonProperty("saldo", Order = 4)] public double Saldo { get; set; }
    }
}

namespace Satrack.Integracion.SistemaBancario.Models.Services.DataBase
{
    [Keyless]
    public class Parametros
    {
        [Column("identificacionCliente", TypeName = "bigint")] public long IdentificacionCliente { get; set; }
    }

    [Keyless]
    public class ClienteProductos
    {
        [Column("nombre", TypeName = "string")] public string NombreCliente { get; set; }
        [Column("numeroProducto", TypeName = "bigint")] public long NumeroProducto { get; set; }
        [Column("producto", TypeName = "string")] public string NombreProducto { get; set; }
        [Column("saldo", TypeName = "numeric")] public double Saldo { get; set; }
    }

    public class ClienteProducto
    {
        [Key][Column("id", TypeName = "int")] public int Id { get; set; }
        [Column("numeroProducto", TypeName = "bigint")] public long NumeroProducto { get; set; }
        [Column("identificacionCliente", TypeName = "bigint")] public long IdentificacionCliente { get; set; }
        [Column("id_TipoProducto", TypeName = "int")] public int IdTipoProducto { get; set; }
        [Column("saldo", TypeName = "numeric")] public double Saldo { get; set; }
    }
}