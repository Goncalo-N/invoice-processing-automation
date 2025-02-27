USE [sweet]
GO
/****** Object:  Table [dbo].[supplierOrderItems]    Script Date: 01/04/2024 16:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplierOrderItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[ref] [char](8) NOT NULL,
	[subType] [char](2) NOT NULL,
	[qntOrder] [int] NOT NULL,
	[qntOrderBonus] [int] NOT NULL,
	[qntDelivery] [int] NOT NULL,
	[qntDeliveryBonus] [int] NOT NULL,
	[deliveryDate] [smalldatetime] NULL,
	[priceNoBonus] [money] NOT NULL,
	[priceWithBonus] [money] NOT NULL,
	[isStockUpdated] [bit] NOT NULL,
	[supplierInvoiceNumber] [varchar](15) NULL,
	[isFactUpdated] [bit] NOT NULL,
	[obs] [nvarchar](max) NULL,
 CONSTRAINT [PK_supplierOrderItems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplierOrders]    Script Date: 01/04/2024 16:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplierOrders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [smalldatetime] NOT NULL,
	[supplierId] [int] NOT NULL,
	[deliveryDate] [smalldatetime] NULL,
	[isDeliveryClosed] [bit] NOT NULL,
	[isClosed] [bit] NOT NULL,
	[orderType] [tinyint] NOT NULL,
	[obs] [nvarchar](max) NULL,
	[deliveryDateConfirmation] [smalldatetime] NULL,
	[firstAccessConfirmation] [smalldatetime] NULL,
	[dataSubmissionConfirmation] [smalldatetime] NULL,
	[supplierOrderNumber] [varchar](30) NULL,
 CONSTRAINT [PK_supplierOrders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[supplierRegex]    Script Date: 01/04/2024 16:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[supplierRegex](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome_empresa] [varchar](255) NOT NULL,
	[padrao_regex_nome_fornecedor] [varchar](255) NULL,
	[padrao_regex_data_fatura] [varchar](255) NULL,
	[padrao_regex_numero_encomenda] [varchar](255) NULL,
	[padrao_regex_numero_fatura] [varchar](255) NULL,
	[padrao_regex_data_vencimento_fatura] [varchar](255) NULL,
	[padrao_regex_total_sem_iva] [varchar](255) NULL,
	[padrao_regex_totais_por_iva] [varchar](255) NULL,
	[padrao_regex_valor_iva] [varchar](255) NULL,
	[padrao_regex_desconto_pronto_pagamento] [varchar](255) NULL,
	[padrao_regex_total_a_pagar] [varchar](255) NULL,
	[padrao_regex_produto] [varchar](255) NULL,
	[padrao_regex_taxa_iva] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[suppliersName]    Script Date: 01/04/2024 16:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[suppliersName](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[supplierName] [varchar](25) NOT NULL,
	[supplierContactName] [nvarchar](200) NULL,
	[supplierContactEmail] [nvarchar](200) NULL,
	[supplierContactPhone] [varchar](50) NULL,
	[supplierContactLang] [char](2) NULL,
	[supplierLeavePending] [bit] NOT NULL,
	[supplierReturnsContactName] [nvarchar](200) NULL,
	[supplierReturnsContactEmail] [nvarchar](200) NULL,
	[workdaysToDeliver] [smallint] NULL,
	[discountPP] [decimal](3, 1) NOT NULL,
	[discountAffectIva] [bit] NOT NULL,
	[cobraIva] [bit] NOT NULL,
	[daysToPay] [int] NOT NULL,
	[contributeToLeadTime] [bit] NULL,
	[isActive] [bit] NOT NULL,
	[obsPrivate] [nvarchar](max) NULL,
	[obsShared] [nvarchar](max) NULL,
 CONSTRAINT [PK_suppliersName] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[supplierOrderItems] ON 

INSERT [dbo].[supplierOrderItems] ([id], [orderId], [ref], [subType], [qntOrder], [qntOrderBonus], [qntDelivery], [qntDeliveryBonus], [deliveryDate], [priceNoBonus], [priceWithBonus], [isStockUpdated], [supplierInvoiceNumber], [isFactUpdated], [obs]) VALUES (1, 1, N'REF123  ', N'A ', 10, 2, 8, 1, CAST(N'2024-03-10T00:00:00' AS SmallDateTime), 20.0000, 18.0000, 1, N'INV12345', 0, N'Item observation 1')
INSERT [dbo].[supplierOrderItems] ([id], [orderId], [ref], [subType], [qntOrder], [qntOrderBonus], [qntDelivery], [qntDeliveryBonus], [deliveryDate], [priceNoBonus], [priceWithBonus], [isStockUpdated], [supplierInvoiceNumber], [isFactUpdated], [obs]) VALUES (2, 2, N'REF456  ', N'B ', 20, 5, 15, 3, CAST(N'2024-03-15T00:00:00' AS SmallDateTime), 30.0000, 25.5000, 0, N'INV67890', 1, N'Item observation 2')
INSERT [dbo].[supplierOrderItems] ([id], [orderId], [ref], [subType], [qntOrder], [qntOrderBonus], [qntDelivery], [qntDeliveryBonus], [deliveryDate], [priceNoBonus], [priceWithBonus], [isStockUpdated], [supplierInvoiceNumber], [isFactUpdated], [obs]) VALUES (6, 1, N'8703987 ', N'oo', 6, 0, 6, 0, CAST(N'2024-03-22T00:00:00' AS SmallDateTime), 15.5000, 13.3300, 1, N'220057334', 1, N'STELATOPIA PLUS CR RELIP 300ML')
INSERT [dbo].[supplierOrderItems] ([id], [orderId], [ref], [subType], [qntOrder], [qntOrderBonus], [qntDelivery], [qntDeliveryBonus], [deliveryDate], [priceNoBonus], [priceWithBonus], [isStockUpdated], [supplierInvoiceNumber], [isFactUpdated], [obs]) VALUES (7, 2, N'7295378 ', N'oo', 3, 0, 3, 0, CAST(N'2024-01-02T00:00:00' AS SmallDateTime), 8.2600, 7.1000, 1, N'220052765', 1, N'CCREAM ROSTO DUO 40 POUPE8')
SET IDENTITY_INSERT [dbo].[supplierOrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[supplierOrders] ON 

INSERT [dbo].[supplierOrders] ([id], [orderDate], [supplierId], [deliveryDate], [isDeliveryClosed], [isClosed], [orderType], [obs], [deliveryDateConfirmation], [firstAccessConfirmation], [dataSubmissionConfirmation], [supplierOrderNumber]) VALUES (1, CAST(N'2024-02-28T00:00:00' AS SmallDateTime), 1, CAST(N'2024-03-10T00:00:00' AS SmallDateTime), 0, 0, 1, N'Order observation 1', CAST(N'2024-03-01T00:00:00' AS SmallDateTime), CAST(N'2024-03-02T00:00:00' AS SmallDateTime), CAST(N'2024-03-03T00:00:00' AS SmallDateTime), N'SO123456')
INSERT [dbo].[supplierOrders] ([id], [orderDate], [supplierId], [deliveryDate], [isDeliveryClosed], [isClosed], [orderType], [obs], [deliveryDateConfirmation], [firstAccessConfirmation], [dataSubmissionConfirmation], [supplierOrderNumber]) VALUES (2, CAST(N'2024-02-28T00:00:00' AS SmallDateTime), 2, CAST(N'2024-03-15T00:00:00' AS SmallDateTime), 1, 0, 2, N'Order observation 2', CAST(N'2024-03-01T00:00:00' AS SmallDateTime), CAST(N'2024-03-02T00:00:00' AS SmallDateTime), CAST(N'2024-03-03T00:00:00' AS SmallDateTime), N'SO789012')
INSERT [dbo].[supplierOrders] ([id], [orderDate], [supplierId], [deliveryDate], [isDeliveryClosed], [isClosed], [orderType], [obs], [deliveryDateConfirmation], [firstAccessConfirmation], [dataSubmissionConfirmation], [supplierOrderNumber]) VALUES (6, CAST(N'2024-03-07T00:00:00' AS SmallDateTime), 5, CAST(N'2024-03-22T00:00:00' AS SmallDateTime), 1, 1, 0, N'ObsPlaceholder', CAST(N'2024-03-22T00:00:00' AS SmallDateTime), CAST(N'2024-03-08T00:00:00' AS SmallDateTime), CAST(N'2024-03-09T00:00:00' AS SmallDateTime), N'1000360426')
INSERT [dbo].[supplierOrders] ([id], [orderDate], [supplierId], [deliveryDate], [isDeliveryClosed], [isClosed], [orderType], [obs], [deliveryDateConfirmation], [firstAccessConfirmation], [dataSubmissionConfirmation], [supplierOrderNumber]) VALUES (7, CAST(N'2023-12-18T00:00:00' AS SmallDateTime), 5, CAST(N'2024-01-02T00:00:00' AS SmallDateTime), 1, 1, 0, N'ObsPlaceholder', CAST(N'2024-01-02T00:00:00' AS SmallDateTime), CAST(N'2023-12-19T00:00:00' AS SmallDateTime), CAST(N'2023-12-20T00:00:00' AS SmallDateTime), N'1000345369')
SET IDENTITY_INSERT [dbo].[supplierOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[supplierRegex] ON 

INSERT [dbo].[supplierRegex] ([id], [nome_empresa], [padrao_regex_nome_fornecedor], [padrao_regex_data_fatura], [padrao_regex_numero_encomenda], [padrao_regex_numero_fatura], [padrao_regex_data_vencimento_fatura], [padrao_regex_total_sem_iva], [padrao_regex_totais_por_iva], [padrao_regex_valor_iva], [padrao_regex_desconto_pronto_pagamento], [padrao_regex_total_a_pagar], [padrao_regex_produto], [padrao_regex_taxa_iva]) VALUES (4, N'Roger & Gallet', N'\bRoger\s*&\s*Gallet\b', N'\b\d{2}[/-]\d{2}[/-]\d{4}|\d{4}[/-]\d{2}[/-]\d{2}\b', N'\b[A-Za-z]+\d+CRM\d+\b', N'\b[A-Za-z]+\d+FAC\d+\b', N'\b\d{2}[/-]\d{2}[/-]\d{4}|\d{4}[/-]\d{2}[/-]\d{2}\b', N'Total sem IVA\s*([\d,]+)\s*', N'Padrão Regex para Totais por IVA', N'IVA\s*%?\s*(d+(?:\.\d+)?)s+\d+(?:\.\d+)?', N'Padrão Regex para Desconto Pronto Pagamento', N'Total com IVA\s*([\d,]+)\s*EUR', N'(?<Article>\w+)\s+(?<Barcode>\d+)\s+(?<Description>.+?)\s+(?<Quantity>\d+)\s+(?<GrossPrice>[\d,]+)\s+(?<Discount>[\d,]+)\s+(?<PrecoSemIVA>[\d,]+)\s+(?<PrecoComIVA>[\d,]+)', N'(\d+,\d{2})\s+%\s+(\d+,\d{2})\s+€')
INSERT [dbo].[supplierRegex] ([id], [nome_empresa], [padrao_regex_nome_fornecedor], [padrao_regex_data_fatura], [padrao_regex_numero_encomenda], [padrao_regex_numero_fatura], [padrao_regex_data_vencimento_fatura], [padrao_regex_total_sem_iva], [padrao_regex_totais_por_iva], [padrao_regex_valor_iva], [padrao_regex_desconto_pronto_pagamento], [padrao_regex_total_a_pagar], [padrao_regex_produto], [padrao_regex_taxa_iva]) VALUES (5, N'MORENO II', N'\bMORENO\s*+II\b', N'\b\d{2}[.-]\d{2}[.-]\d{4}|\d{4}[/-]\d{2}[/-]\d{2}\b', N'Sweetcare\s+Nº\s*:\s*(\d+)', N'(?<=Fatura Nº\s)\d+', N'Vencimento:\s*\b\d{2}[\/\.-]\d{2}[\/\.-]\d{4}|\d{4}[\/\.-]\d{2}[\/\.-]\d{2}\b', N'(?<=Base de Incidência:\s*)([\d,]+)', N'Padrão Regex para Totais por IVA', N'IVA\s*%?\s*(d+(?:\.\d+)?)s+\d+(?:\.\d+)?', N'Padrão Regex para Desconto Pronto Pagamento', N'([\d,]+)\s*TOTAL', N'(?<Article>\w+)\s+(?<Barcode>\d+)\s+(?<Description>.+?)\s+(?<Quantity>\d+)\s+(?<GrossPrice>[\d,]+)\s+(?<Discount>[\d,]+)\s+(?<PrecoSemIVA>[\d,]+)\s+(?<PrecoComIVA>[\d,]+)', N'Padrão Regex para Taxa de IVA')
INSERT [dbo].[supplierRegex] ([id], [nome_empresa], [padrao_regex_nome_fornecedor], [padrao_regex_data_fatura], [padrao_regex_numero_encomenda], [padrao_regex_numero_fatura], [padrao_regex_data_vencimento_fatura], [padrao_regex_total_sem_iva], [padrao_regex_totais_por_iva], [padrao_regex_valor_iva], [padrao_regex_desconto_pronto_pagamento], [padrao_regex_total_a_pagar], [padrao_regex_produto], [padrao_regex_taxa_iva]) VALUES (6, N'LABORATORIOS EXPANSCIENCE', N'LABORATORIOS EXPANSCIENCE', N'\b\d{2}[.-]\d{2}[.-]\d{4}|\d{4}[/-]\d{2}[/-]\d{2}', N'(?<=N\s+encomen\s+\w+\s+\w+\s+\w+\s+\w+\s+\w+\s+\w+\s)(\d+)', N'(?<=FT S/)(\d+)', N'Vencimento:\s*\b\d{2}[\/\.-]\d{2}[\/\.-]\d{4}|\d{4}[\/\.-]\d{2}[\/\.-]\d{2}\b', N'Total líquido\s+([\d\.,]+)', N'Padrão Regex para Totais por IVA', N'IVA\s*%?\s*(d+(?:\.\d+)?)s+\d+(?:\.\d+)?', N'Padrão Regex para Desconto Pronto Pagamento', N'Total fatura\s+([\d\.,]+) EUR', N'(\bPT?\d+|\b\d+)\s+(.+?)\s+(\d+)\s*([-\w]*)\s+(\d+\sUN)\s+(\d+\.\d{2})\s+(\d+\.\d{2})\s+(\d+\.\d{2})\s+(\d+)', N'\b(0\.00|6\.00|13\.00|23\.00)\s+(\d+\.\d{2})')
SET IDENTITY_INSERT [dbo].[supplierRegex] OFF
GO
SET IDENTITY_INSERT [dbo].[suppliersName] ON 

INSERT [dbo].[suppliersName] ([ID], [supplierName], [supplierContactName], [supplierContactEmail], [supplierContactPhone], [supplierContactLang], [supplierLeavePending], [supplierReturnsContactName], [supplierReturnsContactEmail], [workdaysToDeliver], [discountPP], [discountAffectIva], [cobraIva], [daysToPay], [contributeToLeadTime], [isActive], [obsPrivate], [obsShared]) VALUES (1, N'Supplier 1', N'John Doe', N'john@example.com', N'123-456-7890', N'EN', 0, N'Returns Contact 1', N'returns1@example.com', 5, CAST(10.0 AS Decimal(3, 1)), 1, 0, 30, 1, 1, N'Private observation for Supplier 1', N'Shared observation for Supplier 1')
INSERT [dbo].[suppliersName] ([ID], [supplierName], [supplierContactName], [supplierContactEmail], [supplierContactPhone], [supplierContactLang], [supplierLeavePending], [supplierReturnsContactName], [supplierReturnsContactEmail], [workdaysToDeliver], [discountPP], [discountAffectIva], [cobraIva], [daysToPay], [contributeToLeadTime], [isActive], [obsPrivate], [obsShared]) VALUES (2, N'Supplier 2', N'Jane Smith', N'jane@example.com', N'987-654-3210', N'ES', 1, N'Returns Contact 2', N'returns2@example.com', 7, CAST(15.0 AS Decimal(3, 1)), 0, 1, 45, 1, 1, N'Private observation for Supplier 2', N'Shared observation for Supplier 2')
INSERT [dbo].[suppliersName] ([ID], [supplierName], [supplierContactName], [supplierContactEmail], [supplierContactPhone], [supplierContactLang], [supplierLeavePending], [supplierReturnsContactName], [supplierReturnsContactEmail], [workdaysToDeliver], [discountPP], [discountAffectIva], [cobraIva], [daysToPay], [contributeToLeadTime], [isActive], [obsPrivate], [obsShared]) VALUES (3, N'Roger & Gallet', N'John Doe', N'johndoe@example.com', N'123-456-7890', N'EN', 0, N'Jane Doe', N'janedoe@example.com', 5, CAST(10.0 AS Decimal(3, 1)), 1, 1, 30, 1, 1, N'Private note', N'Shared note')
INSERT [dbo].[suppliersName] ([ID], [supplierName], [supplierContactName], [supplierContactEmail], [supplierContactPhone], [supplierContactLang], [supplierLeavePending], [supplierReturnsContactName], [supplierReturnsContactEmail], [workdaysToDeliver], [discountPP], [discountAffectIva], [cobraIva], [daysToPay], [contributeToLeadTime], [isActive], [obsPrivate], [obsShared]) VALUES (4, N'MORENO II', N'Carlos Moreno', N'carlosmoreno@example.com', N'987-654-3210', N'ES', 0, N'Maria Moreno', N'mariamoreno@example.com', 4, CAST(15.0 AS Decimal(3, 1)), 0, 1, 45, 1, 1, N'Private note', N'Shared note')
INSERT [dbo].[suppliersName] ([ID], [supplierName], [supplierContactName], [supplierContactEmail], [supplierContactPhone], [supplierContactLang], [supplierLeavePending], [supplierReturnsContactName], [supplierReturnsContactEmail], [workdaysToDeliver], [discountPP], [discountAffectIva], [cobraIva], [daysToPay], [contributeToLeadTime], [isActive], [obsPrivate], [obsShared]) VALUES (5, N'LABORATORIOS EXPANSCIENCE', N'Alex Durand', N'alexdurand@example.com', N'456-123-7890', N'FR', 0, N'Sophie Durand', N'sophiedurand@example.com', 3, CAST(20.0 AS Decimal(3, 1)), 1, 0, 60, 1, 1, N'Private note', N'Shared note')
SET IDENTITY_INSERT [dbo].[suppliersName] OFF
GO
ALTER TABLE [dbo].[supplierOrderItems] ADD  CONSTRAINT [DF_supplierOrderItems_qntOrderBonus]  DEFAULT ((0)) FOR [qntOrderBonus]
GO
ALTER TABLE [dbo].[supplierOrderItems] ADD  CONSTRAINT [DF_supplierOrderItems_quantityDelivery]  DEFAULT ((0)) FOR [qntDelivery]
GO
ALTER TABLE [dbo].[supplierOrderItems] ADD  CONSTRAINT [DF_supplierOrderItems_quantityBonus_1]  DEFAULT ((0)) FOR [qntDeliveryBonus]
GO
ALTER TABLE [dbo].[supplierOrderItems] ADD  CONSTRAINT [DF_supplierOrderItems_isStockUpdated]  DEFAULT ((-1)) FOR [isStockUpdated]
GO
ALTER TABLE [dbo].[supplierOrderItems] ADD  CONSTRAINT [DF_supplierOrderItems_isFactUpdated_1]  DEFAULT ((0)) FOR [isFactUpdated]
GO
ALTER TABLE [dbo].[supplierOrders] ADD  CONSTRAINT [DF_supplierOrders_isDeliveryClosed_1]  DEFAULT ((0)) FOR [isDeliveryClosed]
GO
ALTER TABLE [dbo].[supplierOrders] ADD  CONSTRAINT [DF_supplierOrders_isClosed_1]  DEFAULT ((0)) FOR [isClosed]
GO
ALTER TABLE [dbo].[supplierOrders] ADD  CONSTRAINT [DF_supplierOrders_orderType]  DEFAULT ((1)) FOR [orderType]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_nome_fornecedor]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_data_fatura]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_numero_encomenda]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_numero_fatura]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_data_vencimento_fatura]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_total_sem_iva]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_totais_por_iva]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_valor_iva]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_desconto_pronto_pagamento]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_total_a_pagar]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_produto]
GO
ALTER TABLE [dbo].[supplierRegex] ADD  DEFAULT (NULL) FOR [padrao_regex_taxa_iva]
GO
ALTER TABLE [dbo].[suppliersName] ADD  CONSTRAINT [DF_suppliersName_workdaysToDeliver]  DEFAULT ((0)) FOR [workdaysToDeliver]
GO
ALTER TABLE [dbo].[suppliersName] ADD  CONSTRAINT [DF_suppliersName_discountPP]  DEFAULT ((0)) FOR [discountPP]
GO
ALTER TABLE [dbo].[suppliersName] ADD  CONSTRAINT [DF_suppliersName_discountAffectIva]  DEFAULT ((0)) FOR [discountAffectIva]
GO
ALTER TABLE [dbo].[suppliersName] ADD  CONSTRAINT [DF_suppliersName_defaultIVA]  DEFAULT ((0)) FOR [cobraIva]
GO
ALTER TABLE [dbo].[suppliersName] ADD  CONSTRAINT [DF_suppliersName_daysToPay]  DEFAULT ((0)) FOR [daysToPay]
GO
ALTER TABLE [dbo].[suppliersName] ADD  CONSTRAINT [DF_suppliersName_contributeToLeadTime]  DEFAULT ((1)) FOR [contributeToLeadTime]
GO
ALTER TABLE [dbo].[suppliersName] ADD  CONSTRAINT [DF_suppliersName_isActive]  DEFAULT ((1)) FOR [isActive]
GO
ALTER TABLE [dbo].[supplierOrderItems]  WITH CHECK ADD  CONSTRAINT [FK_supplierOrderItems_supplierOrders] FOREIGN KEY([orderId])
REFERENCES [dbo].[supplierOrders] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[supplierOrderItems] CHECK CONSTRAINT [FK_supplierOrderItems_supplierOrders]
GO
ALTER TABLE [dbo].[supplierOrders]  WITH CHECK ADD  CONSTRAINT [FK_supplierOrders_supplierOrders] FOREIGN KEY([supplierId])
REFERENCES [dbo].[suppliersName] ([ID])
GO
ALTER TABLE [dbo].[supplierOrders] CHECK CONSTRAINT [FK_supplierOrders_supplierOrders]
GO
