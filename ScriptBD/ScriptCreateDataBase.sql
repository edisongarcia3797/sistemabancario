USE [SISTEMABANCARIO]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 15/09/2023 10:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[identificacionCliente] [bigint] NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[id_TipoCliente] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClienteProducto]    Script Date: 15/09/2023 10:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteProducto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numeroProducto] [bigint] NOT NULL,
	[identificacionCliente] [bigint] NOT NULL,
	[id_TipoProducto] [int] NOT NULL,
	[porcentajeInteres] [numeric](2, 1) NOT NULL,
	[saldo] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_ClienteProducto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepresentanteLegal]    Script Date: 15/09/2023 10:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RepresentanteLegal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[identificacionRepresentante] [bigint] NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[celular] [varchar](50) NOT NULL,
	[identificacionCliente] [bigint] NOT NULL,
 CONSTRAINT [PK_RepresentanteLegal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoCliente]    Script Date: 15/09/2023 10:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoCliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_TipoCliente] [int] NOT NULL,
	[Tipo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TipoCliente] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 15/09/2023 10:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoMovimiento](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_TipoMovimiento] [int] NOT NULL,
	[Movimiento] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TipoMovimiento] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 15/09/2023 10:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoProducto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_TipoProducto] [int] NOT NULL,
	[producto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_ProductoFinanciero] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaccion]    Script Date: 15/09/2023 10:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaccion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numeroProducto] [bigint] NOT NULL,
	[fechaTrasaccion] [datetime] NOT NULL,
	[id_TipoMovimiento] [int] NOT NULL,
	[porcentajeInteres] [numeric](2, 1) NOT NULL,
	[valor] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_Transaccion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (1, 15373797, N'Edison García', 1)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (2, 85452157, N'Violeta Parra', 1)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (3, 14587245, N'Facundo Cabral', 2)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (4, 78454785, N'Silvio Rodriguez', 1)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (5, 96584575, N'Mercedes Sosa', 1)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (6, 95442127, N'Pablo Milanés', 2)
INSERT [dbo].[Cliente] ([id], [identificacionCliente], [nombre], [id_TipoCliente]) VALUES (8, 95211211, N'Victor Jara', 2)
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[ClienteProducto] ON 

INSERT [dbo].[ClienteProducto] ([id], [numeroProducto], [identificacionCliente], [id_TipoProducto], [porcentajeInteres], [saldo]) VALUES (21, 1111111, 15373797, 1, CAST(0.4 AS Numeric(2, 1)), CAST(3835620 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[ClienteProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[RepresentanteLegal] ON 

INSERT [dbo].[RepresentanteLegal] ([id], [identificacionRepresentante], [nombre], [celular], [identificacionCliente]) VALUES (1, 11111222, N'Carlos Cantor Colombiano', N'3125485212', 14587245)
INSERT [dbo].[RepresentanteLegal] ([id], [identificacionRepresentante], [nombre], [celular], [identificacionCliente]) VALUES (2, 22222331, N'María Cantora Chilena', N'3152414141', 95442127)
INSERT [dbo].[RepresentanteLegal] ([id], [identificacionRepresentante], [nombre], [celular], [identificacionCliente]) VALUES (3, 54545452, N'Darío Poeta Ecuatoriano', N'3165847845', 95211211)
SET IDENTITY_INSERT [dbo].[RepresentanteLegal] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoCliente] ON 

INSERT [dbo].[TipoCliente] ([id], [id_TipoCliente], [Tipo]) VALUES (1, 1, N'Persona')
INSERT [dbo].[TipoCliente] ([id], [id_TipoCliente], [Tipo]) VALUES (5, 2, N'Empresarial')
SET IDENTITY_INSERT [dbo].[TipoCliente] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoMovimiento] ON 

INSERT [dbo].[TipoMovimiento] ([id], [id_TipoMovimiento], [Movimiento]) VALUES (1, 1, N'Depósito')
INSERT [dbo].[TipoMovimiento] ([id], [id_TipoMovimiento], [Movimiento]) VALUES (3, 2, N'Retiro')
INSERT [dbo].[TipoMovimiento] ([id], [id_TipoMovimiento], [Movimiento]) VALUES (4, 3, N'Cancelación')
INSERT [dbo].[TipoMovimiento] ([id], [id_TipoMovimiento], [Movimiento]) VALUES (5, 4, N'Abono interés')
SET IDENTITY_INSERT [dbo].[TipoMovimiento] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoProducto] ON 

INSERT [dbo].[TipoProducto] ([id], [id_TipoProducto], [producto]) VALUES (1, 1, N'Cuenta de ahorros')
INSERT [dbo].[TipoProducto] ([id], [id_TipoProducto], [producto]) VALUES (2, 2, N'Cuenta corriente')
INSERT [dbo].[TipoProducto] ([id], [id_TipoProducto], [producto]) VALUES (3, 3, N'CDT')
SET IDENTITY_INSERT [dbo].[TipoProducto] OFF
GO
SET IDENTITY_INSERT [dbo].[Transaccion] ON 

INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (77, 1111111, CAST(N'2023-09-15T08:54:28.680' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(100 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (78, 1111111, CAST(N'2023-09-15T08:54:29.573' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(100 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (79, 1111111, CAST(N'2023-09-15T08:54:30.530' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(100 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (80, 1111111, CAST(N'2023-09-15T08:54:34.303' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(300 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (81, 1111111, CAST(N'2023-09-15T08:54:39.790' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(20 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (82, 1111111, CAST(N'2023-09-15T08:54:45.903' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(500000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (83, 1111111, CAST(N'2023-09-15T08:54:47.160' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(500000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (84, 1111111, CAST(N'2023-09-15T08:54:51.323' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (85, 1111111, CAST(N'2023-09-15T08:54:53.863' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (86, 1111111, CAST(N'2023-09-15T08:54:54.647' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (87, 1111111, CAST(N'2023-09-15T08:54:55.457' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (88, 1111111, CAST(N'2023-09-15T08:54:56.253' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (89, 1111111, CAST(N'2023-09-15T08:54:57.043' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (90, 1111111, CAST(N'2023-09-15T08:54:57.870' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (91, 1111111, CAST(N'2023-09-15T08:54:58.670' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (92, 1111111, CAST(N'2023-09-15T08:54:59.427' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (93, 1111111, CAST(N'2023-09-15T08:55:00.177' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (94, 1111111, CAST(N'2023-09-15T08:55:00.903' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (95, 1111111, CAST(N'2023-09-15T08:55:01.643' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (96, 1111111, CAST(N'2023-09-15T08:55:02.323' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(200000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (97, 1111111, CAST(N'2023-09-15T08:55:07.710' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(80000 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor]) VALUES (98, 1111111, CAST(N'2023-09-15T08:55:12.637' AS DateTime), 1, CAST(0.4 AS Numeric(2, 1)), CAST(95000 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[Transaccion] OFF
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_TipoCliente] FOREIGN KEY([id_TipoCliente])
REFERENCES [dbo].[TipoCliente] ([id_TipoCliente])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_TipoCliente]
GO
ALTER TABLE [dbo].[ClienteProducto]  WITH CHECK ADD  CONSTRAINT [FK_ClienteProducto_Cliente] FOREIGN KEY([identificacionCliente])
REFERENCES [dbo].[Cliente] ([identificacionCliente])
GO
ALTER TABLE [dbo].[ClienteProducto] CHECK CONSTRAINT [FK_ClienteProducto_Cliente]
GO
ALTER TABLE [dbo].[ClienteProducto]  WITH CHECK ADD  CONSTRAINT [FK_ClienteProducto_TipoProducto] FOREIGN KEY([id_TipoProducto])
REFERENCES [dbo].[TipoProducto] ([id_TipoProducto])
GO
ALTER TABLE [dbo].[ClienteProducto] CHECK CONSTRAINT [FK_ClienteProducto_TipoProducto]
GO
ALTER TABLE [dbo].[RepresentanteLegal]  WITH CHECK ADD  CONSTRAINT [FK_RepresentanteLegal_Cliente] FOREIGN KEY([identificacionCliente])
REFERENCES [dbo].[Cliente] ([identificacionCliente])
GO
ALTER TABLE [dbo].[RepresentanteLegal] CHECK CONSTRAINT [FK_RepresentanteLegal_Cliente]
GO
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_Transaccion_TipoMovimiento] FOREIGN KEY([id_TipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([id_TipoMovimiento])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_Transaccion_TipoMovimiento]
GO
/****** Object:  StoredProcedure [dbo].[CalcularPromedioInteres]    Script Date: 15/09/2023 10:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalcularPromedioInteres]
(
	   @numeroProducto bigint,
	   @fechaInicial datetime,
	   @fechaFinal datetime
)
AS
BEGIN
    SET NOCOUNT ON
	DECLARE @saldoActual numeric(18,0);

	SET @saldoActual = (select saldo from ClienteProducto where numeroProducto = @numeroProducto);

	SELECT (SUM([porcentajeInteres]) / COUNT(*)) * @saldoActual as 'promedio'
	FROM [SISTEMABANCARIO].[dbo].[Transaccion]
	WHERE numeroProducto = @numeroProducto and fechaTrasaccion BETWEEN @fechaInicial AND @fechaFinal;

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProductos]    Script Date: 15/09/2023 10:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConsultarProductos]
(
	@identificacionCliente bigint
)
AS
BEGIN
    SET NOCOUNT ON
	SELECT  Cliente.nombre,
			TipoCliente.Tipo as tipoCliente, 
			ClienteProducto.numeroProducto, 
			TipoProducto.producto,
            ClienteProducto.porcentajeInteres, 
			ClienteProducto.saldo
	FROM  ClienteProducto INNER JOIN
	TipoProducto ON ClienteProducto.id_TipoProducto = TipoProducto.id_TipoProducto INNER JOIN
	Cliente ON ClienteProducto.identificacionCliente = Cliente.identificacionCliente INNER JOIN
	TipoCliente ON Cliente.id_TipoCliente = TipoCliente.id_TipoCliente
    WHERE ClienteProducto.identificacionCliente = @identificacionCliente;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertClienteProducto]    Script Date: 15/09/2023 10:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertClienteProducto]
(
    @numeroProducto bigint,
	@identificacionCliente bigint,
	@id_TipoProducto int,
    @porcentajeInteres numeric(2,1),
	@saldo numeric(18,0),
	@result int OUTPUT,
    @messageError nvarchar(2000) OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON
	BEGIN TRY
	IF (@id_TipoProducto = 3 and @saldo = 0)
    BEGIN
        SET @messageError = 'No es posible crear un producto CDT con saldo igual a cero(0). Por favor verifique';
		SET @result = -1;
    END
    ELSE
	 BEGIN
		INSERT INTO [dbo].[ClienteProducto]
			   ([numeroProducto]
			   ,[identificacionCliente]
			   ,[id_TipoProducto]
			   ,[porcentajeInteres]
			   ,[saldo])
		 VALUES
			   (@numeroProducto
			   ,@identificacionCliente
			   ,@id_TipoProducto
               ,@porcentajeInteres
			   ,@saldo)
				SET @result = 1;
	  END;
	END TRY
	BEGIN CATCH
		SET @messageError =  SUBSTRING(ERROR_MESSAGE(), 1,1999) ;
		SET @result = -1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[InsertTransaccion]    Script Date: 15/09/2023 10:47:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertTransaccion]
(
    @numeroProducto bigint,
    @fechaTrasaccion datetime,
	@id_TipoMovimiento int,
	@porcentajeInteres numeric(2,1),
	@valor numeric(18,0),
	@result int OUTPUT,
    @messageError nvarchar(2000) OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @saldoActual numeric(18,0);
    DECLARE @identificacionCliente bigint;
    DECLARE @id int;
    DECLARE @porcentajeInteresActual numeric(2,1);
    DECLARE @id_TipoProducto int;
	BEGIN TRY

	INSERT INTO [dbo].[Transaccion]
		([numeroProducto]
		,[fechaTrasaccion]
		,[id_TipoMovimiento]
		,[porcentajeInteres]
		,[valor])
	VALUES
		(@numeroProducto
		,@fechaTrasaccion
		,@id_TipoMovimiento
		,@porcentajeInteres 
		,@valor);
        
        SET @id = (Select IDENT_CURRENT('[dbo].[Transaccion]'));
        SET @identificacionCliente = (select identificacionCliente from ClienteProducto where numeroProducto = @numeroProducto);           
		SET @saldoActual = (select saldo from ClienteProducto where numeroProducto = @numeroProducto);
        SET @porcentajeInteresActual = (select porcentajeInteres from ClienteProducto where numeroProducto = @numeroProducto);
        SET @id_TipoProducto = (select id_TipoProducto from ClienteProducto where numeroProducto = @numeroProducto);

		IF (@id_TipoMovimiento = 1)
		BEGIN
            IF (@valor > 0)
            BEGIN
                iF ( @id_TipoProducto <> 3)
				BEGIN
					UPDATE [dbo].[ClienteProducto]
					SET [saldo] =  @saldoActual + @valor
					WHERE [numeroProducto] = @numeroProducto;
					SET @result = 1;
				END
				ELSE
				BEGIN
					SET @messageError = 'No es posible depositar en un CDT. Por favor verifique.';
					SET @result = -1;
				END
            END
            ELSE
			BEGIN
				SET @messageError = 'El valor a depositar debe ser mayor a cero(0). Por favor verifique.';
				SET @result = -1;
			END
		END;

		IF (@id_TipoMovimiento = 2)
		BEGIN
			IF (@valor < @saldoActual)
			BEGIN
				iF (@id_TipoProducto <> 3)
				BEGIN
					UPDATE [dbo].[ClienteProducto]
					SET [saldo] =  @saldoActual - @valor
					WHERE [numeroProducto] = @numeroProducto;
					SET @result = 1;
				END
				ELSE
				BEGIN
					SET @messageError = 'No es posible retirar en un CDT. Por favor verifique.';
					SET @result = -1;
				END
			END
			ELSE
			BEGIN
				SET @messageError = 'El valor a retirar supera el saldo del producto. Por favor verifique.';
				SET @result = -1;
			END
		END;

		IF (@id_TipoMovimiento = 3)
		BEGIN
         IF(@id_TipoProducto = 3)
			BEGIN
				IF (SELECT COUNT(*) FROM ClienteProducto WHERE id_TipoProducto = 1 and identificacionCliente = @identificacionCliente) > 0
				BEGIN
					UPDATE [dbo].[ClienteProducto]
					SET [saldo] = 0
					WHERE [numeroProducto] =@numeroProducto;

					UPDATE [dbo].[ClienteProducto]
					SET [saldo] = @saldoActual + (SELECT saldo FROM ClienteProducto WHERE id_TipoProducto = 1 and identificacionCliente = @identificacionCliente)
					WHERE [numeroProducto] = (SELECT numeroProducto FROM ClienteProducto WHERE id_TipoProducto = 1 and identificacionCliente = @identificacionCliente);
					SET @result = 1;
				END
				ELSE
				BEGIN
					SET @messageError = 'EL cliente no tiene cuenta de ahorros. Para cancelar el producto, debe crear una.';
					SET @result = -1;
				END
            END
            ELSE
            BEGIN
				SET @messageError = 'Solo es permitido cancelar productos tipo CDT. Por favor verifique.';
				SET @result = -1;
            END
		END;

        UPDATE [dbo].[Transaccion] 
        SET [porcentajeInteres] = @porcentajeInteresActual
		WHERE [id] = @id;

	END TRY
	BEGIN CATCH
    	SET @messageError =  SUBSTRING(ERROR_MESSAGE(), 1,1999) ;
		SET @result = -1;
	END CATCH
END




GO
