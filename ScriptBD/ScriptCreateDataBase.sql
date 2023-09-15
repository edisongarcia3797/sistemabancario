USE [SISTEMABANCARIO]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 14/09/2023 11:38:13 p. m. ******/
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
/****** Object:  Table [dbo].[ClienteProducto]    Script Date: 14/09/2023 11:38:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClienteProducto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numeroProducto] [bigint] NOT NULL,
	[identificacionCliente] [bigint] NOT NULL,
	[id_TipoProducto] [int] NOT NULL,
	[saldo] [numeric](18, 0) NULL,
 CONSTRAINT [PK_ClienteProducto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RepresentanteLegal]    Script Date: 14/09/2023 11:38:13 p. m. ******/
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
/****** Object:  Table [dbo].[TipoCliente]    Script Date: 14/09/2023 11:38:13 p. m. ******/
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
/****** Object:  Table [dbo].[TipoMovimiento]    Script Date: 14/09/2023 11:38:13 p. m. ******/
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
/****** Object:  Table [dbo].[TipoProducto]    Script Date: 14/09/2023 11:38:13 p. m. ******/
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
/****** Object:  Table [dbo].[Transaccion]    Script Date: 14/09/2023 11:38:13 p. m. ******/
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
	[saldo] [numeric](18, 0) NOT NULL,
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

INSERT [dbo].[ClienteProducto] ([id], [numeroProducto], [identificacionCliente], [id_TipoProducto], [saldo]) VALUES (49, 1111111, 15373797, 1, CAST(500 AS Numeric(18, 0)))
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

INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor], [saldo]) VALUES (34, 1111111, CAST(N'2023-09-14T23:31:18.770' AS DateTime), 1, CAST(0.0 AS Numeric(2, 1)), CAST(500 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor], [saldo]) VALUES (35, 1111111, CAST(N'2023-09-14T23:31:23.213' AS DateTime), 1, CAST(0.0 AS Numeric(2, 1)), CAST(0 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor], [saldo]) VALUES (36, 1111111, CAST(N'2023-09-14T23:31:37.700' AS DateTime), 1, CAST(0.0 AS Numeric(2, 1)), CAST(100 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor], [saldo]) VALUES (37, 1111111, CAST(N'2023-09-14T23:31:56.577' AS DateTime), 2, CAST(0.0 AS Numeric(2, 1)), CAST(1400 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor], [saldo]) VALUES (38, 1111111, CAST(N'2023-09-14T23:33:07.353' AS DateTime), 2, CAST(0.0 AS Numeric(2, 1)), CAST(200 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor], [saldo]) VALUES (39, 1111111, CAST(N'2023-09-14T23:33:13.237' AS DateTime), 2, CAST(0.0 AS Numeric(2, 1)), CAST(1 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor], [saldo]) VALUES (40, 1111111, CAST(N'2023-09-14T23:34:47.247' AS DateTime), 2, CAST(0.0 AS Numeric(2, 1)), CAST(800 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor], [saldo]) VALUES (41, 1111111, CAST(N'2023-09-14T23:35:05.103' AS DateTime), 2, CAST(0.0 AS Numeric(2, 1)), CAST(800 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
INSERT [dbo].[Transaccion] ([id], [numeroProducto], [fechaTrasaccion], [id_TipoMovimiento], [porcentajeInteres], [valor], [saldo]) VALUES (42, 1111111, CAST(N'2023-09-14T23:35:11.903' AS DateTime), 2, CAST(0.0 AS Numeric(2, 1)), CAST(100 AS Numeric(18, 0)), CAST(0 AS Numeric(18, 0)))
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
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_Transaccion_ClienteProducto] FOREIGN KEY([numeroProducto])
REFERENCES [dbo].[ClienteProducto] ([numeroProducto])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_Transaccion_ClienteProducto]
GO
ALTER TABLE [dbo].[Transaccion]  WITH CHECK ADD  CONSTRAINT [FK_Transaccion_TipoMovimiento] FOREIGN KEY([id_TipoMovimiento])
REFERENCES [dbo].[TipoMovimiento] ([id_TipoMovimiento])
GO
ALTER TABLE [dbo].[Transaccion] CHECK CONSTRAINT [FK_Transaccion_TipoMovimiento]
GO
/****** Object:  StoredProcedure [dbo].[ConsultarProductos]    Script Date: 14/09/2023 11:38:13 p. m. ******/
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
			ClienteProducto.saldo
	FROM  ClienteProducto INNER JOIN
	TipoProducto ON ClienteProducto.id_TipoProducto = TipoProducto.id_TipoProducto INNER JOIN
	Cliente ON ClienteProducto.identificacionCliente = Cliente.identificacionCliente INNER JOIN
	TipoCliente ON Cliente.id_TipoCliente = TipoCliente.id_TipoCliente
    WHERE ClienteProducto.identificacionCliente = @identificacionCliente;
END
GO
/****** Object:  StoredProcedure [dbo].[InsertClienteProducto]    Script Date: 14/09/2023 11:38:13 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertClienteProducto]
(
    @numeroProducto bigint,
	@identificacionCliente bigint,
	@id_TipoProducto int,
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
			   ,[saldo])
		 VALUES
			   (@numeroProducto
			   ,@identificacionCliente
			   ,@id_TipoProducto
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
/****** Object:  StoredProcedure [dbo].[InsertTransaccion]    Script Date: 14/09/2023 11:38:13 p. m. ******/
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
	@saldo numeric(18,0),
	@result int OUTPUT,
    @messageError nvarchar(2000) OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @saldoActual numeric(18,0);
    DECLARE @identificacionCliente bigint;
	BEGIN TRY

	INSERT INTO [dbo].[Transaccion]
		([numeroProducto]
		,[fechaTrasaccion]
		,[id_TipoMovimiento]
		,[porcentajeInteres]
		,[valor]
		,[saldo])
	VALUES
		(@numeroProducto
		,@fechaTrasaccion
		,@id_TipoMovimiento
		,@porcentajeInteres 
		,@valor
		,@saldo);
        
        SET @identificacionCliente = (select identificacionCliente from ClienteProducto where numeroProducto = @numeroProducto);           
		SET @saldoActual = (select saldo from ClienteProducto where numeroProducto = @numeroProducto);

		IF (@id_TipoMovimiento = 1)
		BEGIN
            IF (@valor > 0)
            BEGIN
				UPDATE [dbo].[ClienteProducto]
				SET [saldo] =  @saldoActual + @valor
				WHERE [numeroProducto] = @numeroProducto;
				SET @result = 1;
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
				UPDATE [dbo].[ClienteProducto]
				SET [saldo] =  @saldoActual - @valor
				WHERE [numeroProducto] = @numeroProducto;
				SET @result = 1;
			END
			ELSE
			BEGIN
				SET @messageError = 'El valor a retirar supera el saldo del producto. Por favor verifique.';
				SET @result = -1;
			END
		END;

		IF (@id_TipoMovimiento = 3)
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
		END;
	END TRY
	BEGIN CATCH
    	SET @messageError =  SUBSTRING(ERROR_MESSAGE(), 1,1999) ;
		SET @result = -1;
	END CATCH
END




GO
