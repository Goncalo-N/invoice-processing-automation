USE [sweet]
GO
/****** Object:  Table [dbo].[supplierRegex]    Script Date: 01/04/2024 16:52:04 ******/
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
SET IDENTITY_INSERT [dbo].[supplierRegex] ON 

INSERT [dbo].[supplierRegex] ([id], [nome_empresa], [padrao_regex_nome_fornecedor], [padrao_regex_data_fatura], [padrao_regex_numero_encomenda], [padrao_regex_numero_fatura], [padrao_regex_data_vencimento_fatura], [padrao_regex_total_sem_iva], [padrao_regex_totais_por_iva], [padrao_regex_valor_iva], [padrao_regex_desconto_pronto_pagamento], [padrao_regex_total_a_pagar], [padrao_regex_produto], [padrao_regex_taxa_iva]) VALUES (4, N'Roger & Gallet', N'\bRoger\s*&\s*Gallet\b', N'\b\d{2}[/-]\d{2}[/-]\d{4}|\d{4}[/-]\d{2}[/-]\d{2}\b', N'\b[A-Za-z]+\d+CRM\d+\b', N'\b[A-Za-z]+\d+FAC\d+\b', N'\b\d{2}[/-]\d{2}[/-]\d{4}|\d{4}[/-]\d{2}[/-]\d{2}\b', N'Total sem IVA\s*([\d,]+)\s*', N'Padrão Regex para Totais por IVA', N'IVA\s*%?\s*(d+(?:\.\d+)?)s+\d+(?:\.\d+)?', N'Padrão Regex para Desconto Pronto Pagamento', N'Total com IVA\s*([\d,]+)\s*EUR', N'(?<Article>\w+)\s+(?<Barcode>\d+)\s+(?<Description>.+?)\s+(?<Quantity>\d+)\s+(?<GrossPrice>[\d,]+)\s+(?<Discount>[\d,]+)\s+(?<PrecoSemIVA>[\d,]+)\s+(?<PrecoComIVA>[\d,]+)(?:\s*(?<IVA>\d+,\d+))(?:\s*\nCNP\s*:\s*(?<CNP>\d+))', N'(\d+,\d{2})\s+%\s+(\d+,\d{2})\s+€')
INSERT [dbo].[supplierRegex] ([id], [nome_empresa], [padrao_regex_nome_fornecedor], [padrao_regex_data_fatura], [padrao_regex_numero_encomenda], [padrao_regex_numero_fatura], [padrao_regex_data_vencimento_fatura], [padrao_regex_total_sem_iva], [padrao_regex_totais_por_iva], [padrao_regex_valor_iva], [padrao_regex_desconto_pronto_pagamento], [padrao_regex_total_a_pagar], [padrao_regex_produto], [padrao_regex_taxa_iva]) VALUES (5, N'MORENO II', N'\bMORENO\s*+II\b', N'\b\d{2}[.-]\d{2}[.-]\d{4}|\d{4}[/-]\d{2}[/-]\d{2}\b', N'Sweetcare\s+Nº\s*:\s*(\d+)', N'(?<=Fatura Nº\s)\d+', N'Vencimento:\s*\b\d{2}[\/\.-]\d{2}[\/\.-]\d{4}|\d{4}[\/\.-]\d{2}[\/\.-]\d{2}\b', N'(?<=Base de Incidência:\s*)([\d,]+)', N'Padrão Regex para Totais por IVA', N'IVA\s*%?\s*(d+(?:\.\d+)?)s+\d+(?:\.\d+)?', N'Padrão Regex para Desconto Pronto Pagamento', N'([\d,]+)\s*TOTAL', N'(?<Article>\w+)\s+(?<Barcode>\d+)\s+(?<Description>.+?)\s+(?<Quantity>\d+)\s+(?<GrossPrice>[\d,]+)\s+(?<Discount>[\d,]+)\s+(?<PrecoSemIVA>[\d,]+)\s+(?<PrecoComIVA>[\d,]+)', N'Padrão Regex para Taxa de IVA')
INSERT [dbo].[supplierRegex] ([id], [nome_empresa], [padrao_regex_nome_fornecedor], [padrao_regex_data_fatura], [padrao_regex_numero_encomenda], [padrao_regex_numero_fatura], [padrao_regex_data_vencimento_fatura], [padrao_regex_total_sem_iva], [padrao_regex_totais_por_iva], [padrao_regex_valor_iva], [padrao_regex_desconto_pronto_pagamento], [padrao_regex_total_a_pagar], [padrao_regex_produto], [padrao_regex_taxa_iva]) VALUES (6, N'LABORATORIOS EXPANSCIENCE', N'LABORATORIOS EXPANSCIENCE', N'\b\d{2}[.-]\d{2}[.-]\d{4}|\d{4}[/-]\d{2}[/-]\d{2}', N'(?<=N\s+encomen\s+\w+\s+\w+\s+\w+\s+\w+\s+\w+\s+\w+\s)(\d+)', N'(?<=FT S/)(\d+)', N'Vencimento:\s*\b\d{2}[\/\.-]\d{2}[\/\.-]\d{4}|\d{4}[\/\.-]\d{2}[\/\.-]\d{2}\b', N'Total líquido\s+([\d\.,]+)', N'Padrão Regex para Totais por IVA', N'IVA\s*%?\s*(d+(?:\.\d+)?)s+\d+(?:\.\d+)?', N'Padrão Regex para Desconto Pronto Pagamento', N'Total fatura\s+([\d\.,]+) EUR', N'(\bPT?\d+|\b\d+)\s+(.+?)\s+(\d+)\s*([-\w]*)\s+(\d+\sUN)\s+(\d+\.\d{2})\s+(\d+\.\d{2})\s+(\d+\.\d{2})\s+(\d+)', N'\b(0\.00|6\.00|13\.00|23\.00)\s+(\d+\.\d{2})')
SET IDENTITY_INSERT [dbo].[supplierRegex] OFF
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
