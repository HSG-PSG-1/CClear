USE [CPM]
GO
/****** Object:  Table [dbo].[BrandVendor]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrandVendor](
	[Brand] [nvarchar](200) NULL,
	[VendorNo] [nvarchar](200) NULL,
	[VendorName] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_ClaimDetail_Item_Defect]    Script Date: 01/22/2013 06:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ClaimDetail_Item_Defect]
AS
SELECT cd.ID, cd.ClaimID, cd.ItemID, cd.Description, cd.Note, cd.Serial, cd.DOT, cd.TDRemaining, cd.TDOriginal, cd.RemainingTread, cd.NatureOfDefect, 
               cd.CurrentPrice, cd.CreditAmt, cd.CurrentCost, cd.InvoiceAmt, cd.Size, cd.Ply, cd.Type, cd.LastModifiedBy, cd.LastModifiedDate, 
               i.ItemNo AS ItemCode, d.Title AS Defect
FROM  dbo.ClaimDetail AS cd INNER JOIN
               dbo.MasterInventory AS i ON cd.ItemID = i.ID INNER JOIN
               dbo.MasterDefect AS d ON cd.NatureOfDefect = d.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "cd"
            Begin Extent = 
               Top = 6
               Left = 44
               Bottom = 133
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 10
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 89
               Left = 282
               Bottom = 216
               Right = 468
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "d"
            Begin Extent = 
               Top = 1
               Left = 561
               Bottom = 128
               Right = 747
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1309
         Width = 1309
         Width = 1309
         Width = 1309
         Width = 1309
         Width = 1309
         Width = 1309
         Width = 1309
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 903
         Table = 1165
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1348
         SortOrder = 1414
         GroupBy = 1350
         Filter = 1348
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_ClaimDetail_Item_Defect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_ClaimDetail_Item_Defect'
GO
/****** Object:  Table [dbo].[MasterOrgType]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterOrgType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MasterOrgType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ERPCustomerOrg]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ERPCustomerOrg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[Address3] [nvarchar](50) NULL,
	[Zip] [nvarchar](10) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[SalespersonCode] [nvarchar](6) NULL,
	[SalespersonId] [int] NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ERPCustomerOrg] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ERPSalesPerson]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ERPSalesPerson](
	[SalespersonCode] [nvarchar](6) NULL,
	[SalespersonName] [nvarchar](30) NULL,
	[AddressLine1] [nvarchar](30) NULL,
	[AddressLine2] [nvarchar](30) NULL,
	[AddressLine3] [nvarchar](30) NULL,
	[City] [nvarchar](20) NULL,
	[State] [nvarchar](2) NULL,
	[ZipCode] [nvarchar](10) NULL,
	[CountryCode] [nvarchar](3) NULL,
	[TelephoneNo] [nvarchar](17) NULL,
	[TelephoneExt] [nvarchar](5) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[TimeCreated] [nvarchar](8) NULL,
	[DateUpdated] [datetime] NULL,
	[TimeUpdated] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterBrand]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterBrand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[VendorID] [int] NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MasterBrand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ERPMasterBrand]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ERPMasterBrand](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ERPMasterBrand] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[csp_ImportMasterInventory]    Script Date: 01/22/2013 06:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 22-Nov-11
-- Description:	Import Master Inventory from ERP tables to production
-- =============================================
CREATE PROCEDURE [dbo].[csp_ImportMasterInventory]
@UpdateCount INT OUTPUT,
@InsertCount INT OUTPUT
AS
BEGIN
SET NOCOUNT ON;
   
-- IMPORT: MasterInventory
-- Make sure MasterBrand import is done
 
DECLARE @tblIDs table (Code nvarchar(50)); 

 -- ======================= Execute Lookup
UPDATE ERPMasterInventory SET
ERPMasterInventory.BrandId = b.ID
FROM ERPMasterInventory as e
INNER JOIN MasterBrand as b ON lower(rtrim(ltrim(e.Brand))) = lower(rtrim(ltrim(b.Title)))
;
 -- ======================= Execute UPDATE
UPDATE MasterInventory 
	 SET [ItemNo] = s.ItemNo
      ,[Description] = s.Description
      ,[BrandId] = s.BrandId
      ,[Brand] = s.Brand
      ,[Size] = s.[Size]
      ,[Ply] = s.Ply
      ,[Type] = s.[Type]
      ,[TDOriginal] = s.TDOriginal
      ,[CurrentCost] = s.CurrentCost
      ,[CurrentPrice] = s.CurrentPrice
      ,[LastModifiedBy] = -1
      ,[LastModifiedDate] = getdate()
OUTPUT inserted.ItemNo INTO  @tblIDs
FROM MasterInventory d INNER JOIN
ERPMasterInventory s ON lower(rtrim(ltrim(d.ItemNo))) = lower(rtrim(ltrim(s.ItemNo)))
WHERE s.BrandId > 0
;
SET @UpdateCount = @@ROWCOUNT;
 -- ======================= Execute INSERT

INSERT INTO MasterInventory
           ([ItemNo]
           ,[Description]
           ,[BrandId]
		   ,[Brand]
           ,[Size]
           ,[Ply]
           ,[Type]
           ,[TDOriginal]
           ,[CurrentCost]
		   ,[CurrentPrice]
           ,[LastModifiedBy]
           ,[LastModifiedDate])
SELECT ItemNo,Description, BrandId, Brand, [Size], Ply, [Type], TDOriginal, CurrentCost, CurrentPrice
           ,-2 --LastModifiedBy
           ,getdate()
FROM ERPMasterInventory
WHERE ItemNo NOT IN (SELECT Code from @tblIDs) AND BrandId > 0
;
SET @InsertCount = @@ROWCOUNT;
END
GO
/****** Object:  Table [dbo].[MasterDefect]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterDefect](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[CanDelete] [bit] NOT NULL,
 CONSTRAINT [PK_MasterDefect] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ERPCustomerLocation]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ERPCustomerLocation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[CustomerId] [int] NULL,
	[CustomerNo] [nvarchar](20) NULL,
	[Name] [nvarchar](80) NOT NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[Address3] [nvarchar](50) NULL,
	[Zip] [nvarchar](10) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ERPCustomerLocation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterActivity]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterActivity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[CanDelete] [bit] NOT NULL,
 CONSTRAINT [PK_MasterActivity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterRole]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[OrgTypeId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[ManageRole] [bit] NOT NULL,
	[ManageMaster] [bit] NOT NULL,
	[ManageUser] [bit] NOT NULL,
	[DeleteClaim] [bit] NOT NULL,
	[ViewActivity] [bit] NOT NULL,
	[ManageSetting] [bit] NOT NULL,
	[ArchiveClaim] [bit] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[CanDelete] [bit] NOT NULL,
 CONSTRAINT [PK_MasterRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterSetting]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterSetting](
	[ID] [int] NOT NULL,
	[Setting] [nvarchar](80) NOT NULL,
	[Value] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_MasterSetting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterClaimStatus]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterClaimStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[CanDelete] [bit] NOT NULL,
 CONSTRAINT [PK_MasterClaimStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ERPMasterInventory]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ERPMasterInventory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemNo] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[BrandID] [int] NULL,
	[Brand] [nvarchar](50) NULL,
	[Size] [nvarchar](20) NOT NULL,
	[Ply] [nvarchar](20) NOT NULL,
	[Type] [nvarchar](20) NULL,
	[TDOriginal] [decimal](8, 2) NOT NULL,
	[CurrentCost] [decimal](18, 6) NOT NULL,
	[CurrentPrice] [decimal](18, 6) NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ERPMasterInventory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterFileTypeDetail]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterFileTypeDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[CanDelete] [bit] NOT NULL,
 CONSTRAINT [PK_MasterFileTypeDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterFileTypeHeader]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterFileTypeHeader](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[CanDelete] [bit] NOT NULL,
 CONSTRAINT [PK_MasterFileTypeHeader] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterInventory]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterInventory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ItemNo] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[BrandId] [int] NULL,
	[Brand] [nvarchar](50) NULL,
	[Size] [nvarchar](20) NOT NULL,
	[Ply] [nvarchar](20) NOT NULL,
	[Type] [nvarchar](20) NULL,
	[TDOriginal] [decimal](8, 2) NOT NULL,
	[CurrentCost] [decimal](18, 6) NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
	[CurrentPrice] [decimal](18, 6) NULL,
 CONSTRAINT [PK_MasterInventory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MasterOrg]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MasterOrg](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
	[OrgTypeId] [int] NOT NULL,
	[SalespersonId] [int] NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[Address3] [nvarchar](50) NULL,
	[Zip] [nvarchar](10) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CustomerOrg] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Claim]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Claim](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustID] [int] NOT NULL,
	[ClaimNo]  AS ([ID]),
	[CustRefNo] [nvarchar](30) NULL,
	[StatusID] [int] NOT NULL,
	[ShipToLocationID] [int] NOT NULL,
	[ClaimDate] [datetime] NOT NULL,
	[BrandID] [int] NOT NULL,
	[SalespersonID] [int] NOT NULL,
	[AssignedTo] [int] NOT NULL,
	[Archived] [bit] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Claims] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerLocation]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerLocation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Name] [nvarchar](80) NOT NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[Address3] [nvarchar](50) NULL,
	[Zip] [nvarchar](10) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClaimDetail]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClaimDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimID] [int] NOT NULL,
	[ItemID] [int] NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Note] [nvarchar](250) NULL,
	[Serial] [nvarchar](20) NULL,
	[DOT] [nvarchar](20) NULL,
	[TDRemaining] [decimal](18, 2) NOT NULL,
	[TDOriginal] [decimal](18, 2) NOT NULL,
	[RemainingTread]  AS (case when [TDOriginal]>(0) then ([TDRemaining]*(100))/[TDOriginal] else (0) end),
	[NatureOfDefect] [int] NOT NULL,
	[CurrentPrice] [decimal](18, 2) NOT NULL,
	[CreditAmt]  AS ((case when [TDOriginal]>(0) then ([TDRemaining]*(100))/[TDOriginal] else (0) end*[CurrentPrice])/(100)),
	[CurrentCost] [decimal](18, 2) NOT NULL,
	[InvoiceAmt]  AS ((case when [TDOriginal]>(0) then ([TDRemaining]*(100))/[TDOriginal] else (0) end*[CurrentCost])/(100)),
	[Size] [nvarchar](20) NULL,
	[Ply] [nvarchar](20) NULL,
	[Type] [nvarchar](20) NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ClaimDetails] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NOT NULL,
	[OrgID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](80) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[SalespersonCode] [nvarchar](6) NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Customer = 1,Internal=2,Vendor=3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Users', @level2type=N'COLUMN',@level2name=N'OrgID'
GO
/****** Object:  Table [dbo].[UserLocation]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLocation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LocID] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserLocation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActivityHistory]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ActivityID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[UserText] [nvarchar](80) NULL,
	[ActDateTime] [datetime] NOT NULL,
	[ClaimID] [int] NULL,
	[ClaimDetailID] [int] NULL,
	[ClaimText] [nvarchar](50) NULL,
	[FileName] [nvarchar](100) NULL,
 CONSTRAINT [PK_ActivityHistoryClaims] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileHeader]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileHeader](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[FileName] [nvarchar](80) NOT NULL,
	[FileType] [int] NOT NULL,
	[UploadedOn] [datetime] NOT NULL,
	[Comment] [nvarchar](250) NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_FilesHeader] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusHistory]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimID] [int] NOT NULL,
	[OldStatusID] [int] NULL,
	[NewStatusID] [int] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_StatusHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[PostedOn] [datetime] NOT NULL,
	[Comment] [ntext] NOT NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileDetail]    Script Date: 01/22/2013 06:00:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClaimID] [int] NOT NULL,
	[ClaimDetailID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[FileName] [nvarchar](80) NOT NULL,
	[FileType] [int] NOT NULL,
	[UploadedOn] [datetime] NOT NULL,
	[Comment] [nvarchar](250) NULL,
	[LastModifiedBy] [int] NOT NULL,
	[LastModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_FilesDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_Claim_Dashboard]    Script Date: 01/22/2013 06:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Claim_Dashboard]
AS
SELECT DISTINCT 
                      c.ID, (CASE cc.ID / cc.ID WHEN 1 THEN 1 ELSE 0 END) AS CommentsExist, (CASE fh.ID / fh.ID WHEN 1 THEN 1 ELSE 0 END) AS FilesHExist, c.CustID, 
                      o.Name AS CustOrg, c.ClaimNo, c.CustRefNo, c.StatusID, s.Title AS Status, c.ClaimDate, CONVERT(VARCHAR(10), c.ClaimDate, 101) AS ClaimDateOnly, 
                      c.AssignedTo, c.LastModifiedBy, c.LastModifiedDate, c.SalespersonID, c.BrandID, c.Archived, b.Title AS BrandName, b.VendorID, c.ShipToLocationID, 
                      l.Name AS ShipToLoc, l.Code AS ShipToCode, u1.Name AS Salesperson, u2.Name AS AssignToName
FROM         dbo.Claim AS c LEFT OUTER JOIN
                      dbo.MasterBrand AS b ON c.BrandID = b.ID LEFT OUTER JOIN
                      dbo.MasterClaimStatus AS s ON c.StatusID = s.ID LEFT OUTER JOIN
                      dbo.MasterOrg AS o ON c.CustID = o.ID AND o.OrgTypeId = 1 LEFT OUTER JOIN
                      dbo.Users AS u1 ON c.SalespersonID = u1.ID LEFT OUTER JOIN
                      dbo.Users AS u2 ON c.AssignedTo = u2.ID LEFT OUTER JOIN
                      dbo.CustomerLocation AS l ON c.ShipToLocationID = l.ID LEFT OUTER JOIN
                      dbo.Comment AS cc ON cc.ClaimID = c.ID LEFT OUTER JOIN
                      dbo.FileHeader AS fh ON fh.ClaimID = c.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[46] 4[12] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[29] 2[35] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = -217
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 47
               Left = 30
               Bottom = 280
               Right = 194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 22
               Left = 498
               Bottom = 137
               Right = 662
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 9
               Left = 279
               Bottom = 124
               Right = 443
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 224
               Left = 708
               Bottom = 365
               Right = 900
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u1"
            Begin Extent = 
               Top = 180
               Left = 496
               Bottom = 295
               Right = 660
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u2"
            Begin Extent = 
               Top = 126
               Left = 242
               Bottom = 267
               Right = 434
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 33
               Left = 753
               Bottom = 148
               Right = 917
            End
            DisplayFlags = 280
            Top' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Claim_Dashboard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'Column = 0
         End
         Begin Table = "cc"
            Begin Extent = 
               Top = 270
               Left = 238
               Bottom = 397
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "fh"
            Begin Extent = 
               Top = 282
               Left = 44
               Bottom = 409
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 22
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Claim_Dashboard'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Claim_Dashboard'
GO
/****** Object:  View [dbo].[vw_Claim_Master_User_Loc]    Script Date: 01/22/2013 06:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Claim_Master_User_Loc]
AS
SELECT     c.ID, c.CustID, c.ClaimNo, c.CustRefNo, c.StatusID, c.ShipToLocationID, l.Name AS Location, l.Code AS LocationCode, c.ClaimDate, c.BrandID, 
                      b.Title AS Brand, c.SalespersonID, c.AssignedTo, u.Name AS AssignedToVal, c.LastModifiedBy, c.LastModifiedDate, o.Name AS CustOrg, 
                      u1.Name AS SalespersonName, s.Title AS Status, b.VendorID, v.Name AS VendorName, c.Archived
FROM         dbo.Claim AS c LEFT OUTER JOIN
                      dbo.MasterClaimStatus AS s ON c.StatusID = s.ID LEFT OUTER JOIN
                      dbo.MasterOrg AS o ON c.CustID = o.ID AND o.OrgTypeId = 1 LEFT OUTER JOIN
                      dbo.Users AS u ON c.AssignedTo = u.ID LEFT OUTER JOIN
                      dbo.Users AS u1 ON c.SalespersonID = u1.ID LEFT OUTER JOIN
                      dbo.CustomerLocation AS l ON c.ShipToLocationID = l.ID LEFT OUTER JOIN
                      dbo.MasterBrand AS b ON c.BrandID = b.ID LEFT OUTER JOIN
                      dbo.MasterOrg AS v ON b.VendorID = v.ID AND v.OrgTypeId = 3
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[29] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[35] 2[42] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2[66] 3) )"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 5
   End
   Begin DiagramPane = 
      PaneHidden = 
      Begin Origin = 
         Top = -110
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 42
               Left = 358
               Bottom = 169
               Right = 547
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 161
               Left = 33
               Bottom = 288
               Right = 219
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 173
               Left = 267
               Bottom = 314
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 170
               Left = 497
               Bottom = 278
               Right = 660
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u1"
            Begin Extent = 
               Top = 23
               Left = 32
               Bottom = 150
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 7
               Left = 687
               Bottom = 134
               Right = 873
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 142
               Left = 686
               Bottom = 269
               Right = 872
            End
            DisplayFlags = 280
            TopCo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Claim_Master_User_Loc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'lumn = 0
         End
         Begin Table = "v"
            Begin Extent = 
               Top = 290
               Left = 38
               Bottom = 398
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 20
         Width = 284
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1545
         Width = 1305
         Width = 1305
         Width = 1305
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Claim_Master_User_Loc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Claim_Master_User_Loc'
GO
/****** Object:  View [dbo].[vw_Brand_Items]    Script Date: 01/22/2013 06:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Brand_Items]
AS
SELECT     b.ID, b.Title, b.SortOrder, COUNT(i.ID) AS Items, b.VendorID
FROM         dbo.MasterBrand AS b LEFT OUTER JOIN
                      dbo.MasterInventory AS i ON b.ID = i.BrandId
GROUP BY b.ID, b.Title, b.SortOrder, b.VendorID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[24] 2[15] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 131
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 131
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Brand_Items'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Brand_Items'
GO
/****** Object:  StoredProcedure [dbo].[csp_ImportCustomerOrg]    Script Date: 01/22/2013 06:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 22-Nov-11
-- Description:	Import Customer Org from ERP tables to production
-- LastModified: 24-Nov-2011 (param added)
-- =============================================
CREATE PROCEDURE [dbo].[csp_ImportCustomerOrg]
@OrgTypeId INT,
@UpdateCount INT OUTPUT,
@InsertCount INT OUTPUT
AS
BEGIN
SET NOCOUNT ON;
   
-- IMPORT: CustomerOrg

 -- SET IDENTITY_INSERT dbo.CustomerOrg OFF;  
DECLARE @tblIDs table (Code nvarchar(50)); 

 -- ======================= Execute Lookup
UPDATE ERPCustomerOrg SET
ERPCustomerOrg.SalespersonId = u.ID
FROM ERPCustomerOrg as c
INNER JOIN Users as u ON lower(rtrim(ltrim(c.SalespersonCode))) = lower(rtrim(ltrim(u.SalespersonCode)))
;

 -- ======================= Execute UPDATE
UPDATE MasterOrg SET 
	   [Code] = s.Code
      ,[Name] = s.[Name]
      ,[OrgTypeId] =  @OrgTypeId
	  ,[SalespersonId] = s.SalespersonId
      ,[Address1] = s.Address1
      ,[Address2] = s.Address2
      ,[Address3] = s.Address3
      ,[Zip] = s.Zip
      ,[City] = s.City
      ,[State] = s.State
      ,[Country] = s.Country
      ,[LastModifiedBy] = -1
      ,[LastModifiedDate] = getdate()
OUTPUT inserted.Code INTO  @tblIDs
FROM MasterOrg d INNER JOIN
ERPCustomerOrg s ON lower(rtrim(ltrim(d.Code))) = lower(rtrim(ltrim(s.Code)))
;
SET @UpdateCount = @@ROWCOUNT;
 -- ======================= Execute INSERT

INSERT INTO MasterOrg
           ([Code]
           ,[Name]
           ,[OrgTypeId]
		   ,[SalespersonId]
           ,[Address1]
           ,[Address2]
           ,[Address3]
           ,[Zip]
           ,[City]
           ,[State]
           ,[Country]
           ,[LastModifiedBy]
           ,[LastModifiedDate])
SELECT Code,[Name],@OrgTypeId, SalespersonId, Address1, Address2, Address3, Zip, City, State, Country
           ,-2 --LastModifiedBy
           ,getdate()
FROM ERPCustomerOrg
WHERE Code NOT IN (SELECT Code from @tblIDs)  -- AND UserID > 0
;
SET @InsertCount = @@ROWCOUNT;
END
GO
/****** Object:  View [dbo].[vw_CustOrg_SalesUser]    Script Date: 01/22/2013 06:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_CustOrg_SalesUser]
AS
SELECT     o.ID, o.Name, o.SalespersonId, o.OrgTypeId, u.ID AS UserId, u.RoleID, u.Email, u.Name AS UserName
FROM         dbo.MasterOrg AS o LEFT OUTER JOIN
                      dbo.Users AS u ON o.SalespersonId = u.ID
WHERE     (o.OrgTypeId = 1)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[32] 2[29] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 131
               Right = 206
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 244
               Bottom = 131
               Right = 412
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CustOrg_SalesUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CustOrg_SalesUser'
GO
/****** Object:  StoredProcedure [dbo].[csp_FindObsoleteRecrodsAsPerMAS]    Script Date: 01/22/2013 06:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hemant
-- Create date: 22 May 2012
-- Description:	Find obsolete records which are not present in MAS and also not being reerred in any of the existing tables
-- =============================================
CREATE PROCEDURE [dbo].[csp_FindObsoleteRecrodsAsPerMAS]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- Obsolete Customers in MasterOrg
DECLARE @CustomerOrgTypeId INT
SET @CustomerOrgTypeId = 1

SELECT l.* FROM MasterOrg as l WHERE 
l.OrgTypeId = @CustomerOrgTypeId AND
lower(rtrim(ltrim(l.Code))) NOT IN (SELECT lower(rtrim(ltrim(e.Code))) FROM ERPCustomerOrg e)
AND l.ID NOT IN (SELECT CustID FROM Claim)
AND l.ID NOT IN (SELECT CustomerId FROM CustomerLocation)
AND 1= 0

-- Obsolete CustomerLocation
SELECT l.*
FROM CustomerLocation l WHERE lower(rtrim(ltrim(l.Code)))
NOT IN (SELECT lower(rtrim(ltrim(e.Code))) FROM ERPCustomerLocation e WHERE e.CustomerId > 0)
AND l.ID NOT IN (SELECT ShipToLocationID FROM Claim)
AND l.ID NOT IN (SELECT LocID FROM UserLocation)

-- Obsolete Brand
SELECT l.*
FROM MasterBrand l WHERE 
lower(rtrim(ltrim(l.Title))) NOT IN (SELECT lower(rtrim(ltrim(e.Title))) FROM ERPMasterBrand e)
AND l.ID NOT IN (SELECT BrandId FROM MasterInventory)

-- Obsolete Item
SELECT l.*
FROM MasterInventory l WHERE 
lower(rtrim(ltrim(l.ItemNo))) NOT IN (SELECT lower(rtrim(ltrim(e.ItemNo))) FROM ERPMasterInventory e)
AND l.ID NOT IN (SELECT ItemId FROM ClaimDetail)

END
GO
/****** Object:  StoredProcedure [dbo].[csp_CheckDBconsistancy]    Script Date: 01/22/2013 06:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hemant
-- Create date: 14-Mar-2012
-- Description:	Check db consistancy
-- =============================================
CREATE PROCEDURE [dbo].[csp_CheckDBconsistancy] 
AS
BEGIN
Select cd.Id, cd.ItemID as New_ItemId_ClaimDet From ClaimDetail as cd Where cd.ItemID not in (Select id From MasterInventory)

Select c.Id,c.ShipToLocationID as New_ShipToLocID_Claim From Claim as c Where c.ShipToLocationID > 0 and c.ShipToLocationID not in (Select id From CustomerLocation)
Select c.Id,c.BrandID as New_BrandID_Claim From Claim as c Where c.BrandID > 0 and c.BrandID not in (Select id From MasterBrand)
Select c.Id,c.SalespersonID as New_SalespersonID_Claim From Claim as c Where c.SalespersonID > 0 and c.SalespersonID not in (Select id From Users Where RoleID = 4)
Select c.Id,c.AssignedTo as New_AssignedTo_Claim From Claim as c Where c.AssignedTo > 0 and c.AssignedTo not in (Select id From Users)
Select c.Id,c.VendorID as New_VendorID_Claim From Claim as c Where c.VendorID > 0 and c.VendorID not in (Select id From MasterOrg Where OrgTypeId = 3)

Select cl.Id,cl.CustomerId as New_CustomerId_CustLoc From CustomerLocation as cl Where cl.CustomerId not in (Select id From MasterOrg Where OrgTypeId = 1)

Select u.Id, u.OrgID as New_OrgId_Users From Users as u Where u.OrgID not in (Select id From MasterOrg)

Select c.Id, c.UserId as New_UserId_Comment From Comment as c Where c.UserId not in (Select id From Users)
Select f.Id, f.UserId as New_UserId_FileDetail From FileDetail as f Where f.UserId not in (Select id From Users)
Select f.Id, f.UserId as New_UserId_FileHdr From FileHeader as f Where f.UserId not in (Select id From Users)

Select u.OrgTypeId as New_OrgTypeId_MasterRole From MasterRole as u Where u.OrgTypeId not in (Select id From MasterOrgType)


END
GO
/****** Object:  View [dbo].[vw_MasterOrg_Role]    Script Date: 01/22/2013 06:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_MasterOrg_Role]
AS
SELECT o.ID, o.Code, o.Name, o.OrgTypeId, r.ID AS RoleId
FROM  dbo.MasterOrg AS o INNER JOIN
               dbo.MasterRole AS r ON o.OrgTypeId = r.OrgTypeId
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[32] 2[20] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 240
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 7
               Left = 288
               Bottom = 148
               Right = 480
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_MasterOrg_Role'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_MasterOrg_Role'
GO
/****** Object:  View [dbo].[vw_Users_Role_Org]    Script Date: 01/22/2013 06:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Users_Role_Org]
AS
SELECT u.ID, u.RoleID, u.OrgID, u.SalespersonCode, u.Name AS UserName, u.Email, u.Password, r.Title AS RoleName, o.OrgTypeId, 
               CASE o.OrgTypeId WHEN 1 THEN 'Customer' WHEN 2 THEN 'Internal' WHEN 3 THEN 'Vendor' END AS OrgType, o.Name AS OrgName, o.Country, u.LastModifiedBy, 
               u.LastModifiedDate, u1.Name AS LastModifiedByName
FROM  dbo.Users AS u INNER JOIN
               dbo.MasterRole AS r ON u.RoleID = r.ID LEFT OUTER JOIN
               dbo.Users AS u1 ON u1.ID = u.LastModifiedBy LEFT OUTER JOIN
               dbo.MasterOrg AS o ON u.OrgID = o.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[12] 2[23] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[51] 2[18] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 44
               Bottom = 133
               Right = 230
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "r"
            Begin Extent = 
               Top = 6
               Left = 274
               Bottom = 133
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u1"
            Begin Extent = 
               Top = 138
               Left = 274
               Bottom = 265
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 7
               Left = 508
               Bottom = 148
               Right = 700
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 17
         Width = 284
         Width = 1308
         Width = 1308
         Width = 1308
         Width = 1308
         Width = 1308
         Width = 1308
         Width = 1308
         Width = 1308
         Width = 1308
         Width = 1308
         Width = 912
         Width = 1308
         Width = 1308
         Width = 1308
         Width = 1200
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Users_Role_Org'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Users_Role_Org'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Users_Role_Org'
GO
/****** Object:  StoredProcedure [dbo].[csp_PostImportCountCheck]    Script Date: 01/22/2013 06:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Hemant
-- Create date: 13-Jul-12
-- Description:	Check the count of records imported to make sure that all the data is being imported successfully
-- =============================================
CREATE PROCEDURE [dbo].[csp_PostImportCountCheck]
AS
BEGIN

SELECT Count(*) as CustOrgs FROM MasterOrg Where [LastModifiedBy] < 0 AND [OrgTypeId] = 1
SELECT Count(*) as Locations FROM CustomerLocation Where [LastModifiedBy] < 0
SELECT Count(*) as Brands FROM MasterBrand
SELECT Count(*) as Items FROM MasterInventory
-- Create more SELECt for linked records

SELECT [Name], [Email] FROM Users Where [RoleID] = 4 order by [Name] -- [LastModifiedBy] < 0
-- Sales user might have been updated from within the app 

Select c.Code as CustomerNo, c.[Name] as CustomerName, Count(cl.Id) as CustLocations From MasterOrg as c 
LEFT OUTER JOIN CustomerLocation as cl ON cl.CustomerId = c.Id Where c.[OrgTypeId] = 1
Group by c.Code, c.[Name] Order by c.Code, c.[Name]

Select b.[Title] as Brand, Count(i.Id) as BrandItems From MasterBrand as b 
LEFT OUTER JOIN MasterInventory as i ON i.BrandId = b.Id
 Group by b.[Title] Order by b.[Title]

END
GO
/****** Object:  View [dbo].[vw_CustLoc_User_UserLoc]    Script Date: 01/22/2013 06:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_CustLoc_User_UserLoc]
AS
SELECT DISTINCT l.ID, l.Code, l.Name, u.OrgID, u.ID AS UserID, ul.ID AS UsrLocID
FROM  dbo.CustomerLocation AS l INNER JOIN
               dbo.Users AS u ON l.CustomerId = u.OrgID LEFT OUTER JOIN
               dbo.UserLocation AS ul ON l.ID = ul.LocID AND u.ID = ul.UserID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[12] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[32] 2[13] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "l"
            Begin Extent = 
               Top = 30
               Left = 18
               Bottom = 171
               Right = 210
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 5
               Left = 366
               Bottom = 146
               Right = 558
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ul"
            Begin Extent = 
               Top = 59
               Left = 643
               Bottom = 200
               Right = 835
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1200
         Width = 1200
         Width = 2028
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
         Width = 1200
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CustLoc_User_UserLoc'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CustLoc_User_UserLoc'
GO
/****** Object:  StoredProcedure [dbo].[csp_ImportSalesUsers]    Script Date: 01/22/2013 06:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 07-Mar-12
-- Description:	Import Sales Users from ERP tables to production
-- =============================================
CREATE PROCEDURE [dbo].[csp_ImportSalesUsers]
@UpdateCount INT OUTPUT,
@InsertCount INT OUTPUT
AS
BEGIN
SET NOCOUNT ON;
   
-- IMPORT: Users
-- Which Org table to look for OrgCode lookup from ERPUsers ? for now using InternalOrg

 -- SET IDENTITY_INSERT dbo.Users OFF;  
DECLARE @tblIDs table (Code nvarchar(50));
DECLARE @@RoleIDInternalSales int
DECLARE @@OrgIDInternal int


SET @@RoleIDInternalSales = 4 -- *=======* Make sure this is set as per MasterRole table or passed to SP
SET @@OrgIDInternal = 1500 -- *=======* Make sure this is set as per Users table or passed to SP

 -- ======================= Execute Lookup

 -- ======================= Execute UPDATE
UPDATE Users SET 
	  -- [RoleID] = @@RoleIDInternalSales (DO NOT reset Role data)
      --,[OrgID] = @@OrgIDInternal
      [Name] = s.SalespersonName
      --,[LastName] = 
      ,[Email] = s.EmailAddress
      --,[Password] = s.Password
	  ,[SalespersonCode] = s.SalespersonCode
      ,[LastModifiedBy] = -1
      ,[LastModifiedDate] = getdate()
OUTPUT Inserted.SalespersonCode INTO  @tblIDs
FROM Users d INNER JOIN
ERPSalesPerson s ON lower(rtrim(ltrim(d.SalespersonCode))) = lower(rtrim(ltrim(s.SalespersonCode)))
WHERE s.EmailAddress  is not null
;
SET @UpdateCount = @@ROWCOUNT;
 -- ======================= Execute INSERT

INSERT INTO [CPM].[dbo].[Users]
           ([RoleID]
           ,[OrgID]
           ,[Name]           
           ,[Email]
           ,[Password]
		   ,[SalespersonCode]
           ,[LastModifiedBy]
           ,[LastModifiedDate])     
SELECT @@RoleIDInternalSales,@@OrgIDInternal, SalespersonName, EmailAddress, 'password', SalespersonCode
           ,-2 --LastModifiedBy
           ,getdate()
FROM ERPSalesPerson
WHERE SalespersonCode NOT IN (SELECT Code from @tblIDs)
AND EmailAddress  is not null
;
SET @InsertCount = @@ROWCOUNT;
END
GO
/****** Object:  StoredProcedure [dbo].[csp_ImportMasterBrand]    Script Date: 01/22/2013 06:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 22-Nov-11
-- Description:	Import Master Brand from ERP tables to production
-- LastModified: 24-Nov-2011 (param added)
-- =============================================
CREATE PROCEDURE [dbo].[csp_ImportMasterBrand]
@UpdateCount INT OUTPUT,
@InsertCount INT OUTPUT
AS
BEGIN
SET NOCOUNT ON;
   
-- IMPORT: MasterBrand

DECLARE @tblIDs table (Code nvarchar(50)); 

 -- ======================= Execute Lookup and set Required fields
UPDATE ERPMasterBrand SET
SortOrder = 0 WHERE SortOrder is null
;

 -- ======================= Execute UPDATE
UPDATE [CPM].[dbo].[MasterBrand]
   SET [Title] = s.Title
      ,[SortOrder] = s.SortOrder
      ,[LastModifiedBy] = -1
      ,[LastModifiedDate] = getdate()
OUTPUT inserted.Title INTO  @tblIDs
FROM MasterBrand d INNER JOIN
ERPMasterBrand s ON lower(rtrim(ltrim(d.Title)))= lower(rtrim(ltrim(s.Title)))
;
SET @UpdateCount = @@ROWCOUNT;
 -- ======================= Execute INSERT

INSERT INTO [CPM].[dbo].[MasterBrand]
           ([Title]
           ,[SortOrder]
           ,[LastModifiedBy]
           ,[LastModifiedDate])     
SELECT Title,[SortOrder]
           ,-2 --LastModifiedBy
           ,getdate()
FROM ERPMasterBrand
WHERE Title NOT IN (SELECT Code from @tblIDs)  -- AND UserID > 0
;
SET @InsertCount = @@ROWCOUNT;

END
GO
/****** Object:  View [dbo].[vw_CustOrg_Locs]    Script Date: 01/22/2013 06:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_CustOrg_Locs]
AS
SELECT     TOP (100) PERCENT o.ID, o.Name, COUNT(l.ID) AS Locs
FROM         dbo.MasterOrg AS o LEFT OUTER JOIN
                      dbo.CustomerLocation AS l ON o.ID = l.CustomerId AND o.OrgTypeId = 1
GROUP BY o.ID, o.Name
ORDER BY o.Name
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 7
               Left = 48
               Bottom = 148
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l"
            Begin Extent = 
               Top = 6
               Left = 260
               Bottom = 131
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CustOrg_Locs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_CustOrg_Locs'
GO
/****** Object:  StoredProcedure [dbo].[csp_ImportCustomerLocation]    Script Date: 01/22/2013 06:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 22-Nov-11
-- Description:	Import Customer Location from ERP tables to production
-- LastModified: 24-Nov-2011 (param added)
-- =============================================
CREATE PROCEDURE [dbo].[csp_ImportCustomerLocation]
@UpdateCount INT OUTPUT,
@InsertCount INT OUTPUT
AS
BEGIN
SET NOCOUNT ON;
   
DECLARE @tblIDs table (Code nvarchar(50) NULL);

 -- ======================= Execute Lookup
UPDATE ERPCustomerLocation SET
ERPCustomerLocation.CustomerId = c.ID
FROM ERPCustomerLocation as e
INNER JOIN MasterOrg as c ON lower(rtrim(ltrim(e.CustomerNo))) = lower(rtrim(ltrim(c.Code))) AND c.OrgTypeId = 1
;

 -- ======================= Execute UPDATE
UPDATE CustomerLocation SET 
	   [Code] = s.Code
	  ,[CustomerId] = s.[CustomerId]
      ,[Name] = s.[Name]
      ,[Address1] = s.Address1
      ,[Address2] = s.Address2
      ,[Address3] = s.Address3
      ,[Zip] = s.Zip
      ,[City] = s.City
      ,[State] = s.State
      ,[Country] = s.Country
	,[LastModifiedBy] = -1
      ,[LastModifiedDate] = getdate()
OUTPUT inserted.Code INTO  @tblIDs
FROM CustomerLocation d INNER JOIN
ERPCustomerLocation as s ON lower(rtrim(ltrim(d.Code))) = lower(rtrim(ltrim(s.Code)))
WHERE s.CustomerId > 0
;
SET @UpdateCount = @@ROWCOUNT;
 -- ======================= Execute INSERT

INSERT INTO CustomerLocation
           ([Code]
           ,[CustomerId]
           ,[Name]
           ,[Address1]
           ,[Address2]
           ,[Address3]
           ,[Zip]
           ,[City]
           ,[State]
           ,[Country]
           ,[LastModifiedBy]
           ,[LastModifiedDate])
SELECT Code,[CustomerId],[Name], Address1, Address2, Address3, Zip, City, State, Country
           ,-2 --LastModifiedBy
           ,getdate()
FROM ERPCustomerLocation
WHERE Code NOT IN (SELECT Code from @tblIDs) AND CustomerId > 0
;
SET @InsertCount = @@ROWCOUNT;
END
GO
/****** Object:  View [dbo].[vw_ActivityLog]    Script Date: 01/22/2013 06:00:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_ActivityLog]
AS
SELECT ah.ID, ah.ActivityID, ah.UserID, ah.UserText, ah.ActDateTime, ah.ClaimID, ah.ClaimDetailID, ah.ClaimText, ah.FileName, a.Title AS Activity
FROM  dbo.ActivityHistory AS ah INNER JOIN
               dbo.MasterActivity AS a ON ah.ActivityID = a.ID
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ah"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 131
               Right = 194
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 63
               Left = 412
               Bottom = 188
               Right = 580
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_ActivityLog'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_ActivityLog'
GO
/****** Object:  View [dbo].[vw_StatusHistory_Usr]    Script Date: 01/22/2013 06:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_StatusHistory_Usr]
AS
SELECT TOP (100) PERCENT h.ID, h.ClaimID, h.OldStatusID, h.NewStatusID, h.LastModifiedBy, h.LastModifiedDate, s2.Title AS OldStatus, s1.Title AS NewStatus, 
               u.Name AS UserName
FROM  dbo.StatusHistory AS h INNER JOIN
               dbo.Users AS u ON h.LastModifiedBy = u.ID LEFT OUTER JOIN
               dbo.MasterClaimStatus AS s1 ON h.NewStatusID = s1.ID LEFT OUTER JOIN
               dbo.MasterClaimStatus AS s2 ON h.OldStatusID = s2.ID
ORDER BY h.LastModifiedDate
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[31] 2[29] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "h"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 202
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "u"
            Begin Extent = 
               Top = 6
               Left = 644
               Bottom = 121
               Right = 808
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s1"
            Begin Extent = 
               Top = 6
               Left = 240
               Bottom = 121
               Right = 404
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s2"
            Begin Extent = 
               Top = 6
               Left = 442
               Bottom = 121
               Right = 606
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 10
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1176
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1356
         SortOrder = 1416
         GroupBy = 1350
         Filter = 1356
         Or = 1350
         Or = 1350
         Or = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_StatusHistory_Usr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_StatusHistory_Usr'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_StatusHistory_Usr'
GO
/****** Object:  StoredProcedure [dbo].[csp_ERPDataImport]    Script Date: 01/22/2013 06:00:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 24-Nov-11
-- Description:	Import Customer Location from ERP tables to production
-- =============================================
CREATE PROCEDURE [dbo].[csp_ERPDataImport]	
AS
BEGIN
-- Sales User Import
DECLARE @SPuser_UpdateCount INT
DECLARE @SPuser_InsertCount INT	

EXEC csp_ImportSalesUsers @SPuser_UpdateCount OUTPUT , @SPuser_InsertCount OUTPUT
SELECT @SPuser_UpdateCount as SPuser_UpdateCount, @SPuser_InsertCount as SPuser_InsertCount


-- Customer Org Import
DECLARE @CustOrg_UpdateCount INT
DECLARE @CustOrg_InsertCount INT	
DECLARE @CustomerOrgTypeId INT	
SET @CustomerOrgTypeId = 1 -- Make sure its set as per OrgType

EXEC csp_ImportCustomerOrg @CustomerOrgTypeId, @CustOrg_UpdateCount OUTPUT , @CustOrg_InsertCount OUTPUT
SELECT @CustOrg_UpdateCount as CustOrg_UpdateCount, @CustOrg_InsertCount as CustOrg_InsertCount

-- Customer Location Import
DECLARE @CustLoc_UpdateCount INT
DECLARE @CustLoc_InsertCount INT	
EXEC csp_ImportCustomerLocation	@CustLoc_UpdateCount OUTPUT , @CustLoc_InsertCount OUTPUT
SELECT @CustLoc_UpdateCount as CustLoc_UpdateCount, @CustLoc_InsertCount as CustLoc_InsertCount

-- Master Brand Import
DECLARE @MasterBrand_UpdateCount INT
DECLARE @MasterBrand_InsertCount INT	
EXEC csp_ImportMasterBrand @MasterBrand_UpdateCount OUTPUT , @MasterBrand_InsertCount OUTPUT
SELECT @MasterBrand_UpdateCount as MasterBrand_UpdateCount, @MasterBrand_InsertCount as MasterBrand_InsertCount

-- Master Inventory Import
DECLARE @MasterInv_UpdateCount INT
DECLARE @MasterInv_InsertCount INT	
EXEC csp_ImportMasterInventory @MasterInv_UpdateCount OUTPUT , @MasterInv_InsertCount OUTPUT
SELECT @MasterInv_UpdateCount as MasterInv_UpdateCount, @MasterInv_InsertCount as MasterInv_InsertCount

END
GO
/****** Object:  Default [DF_ActivityHistoryClaims_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[ActivityHistory] ADD  CONSTRAINT [DF_ActivityHistoryClaims_LastModifiedDate]  DEFAULT (getdate()) FOR [ActDateTime]
GO
/****** Object:  Default [DF_ClaimDate_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[Claim] ADD  CONSTRAINT [DF_ClaimDate_LastModifiedDate]  DEFAULT (getdate()) FOR [ClaimDate]
GO
/****** Object:  Default [DF_Claim_Archived]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[Claim] ADD  CONSTRAINT [DF_Claim_Archived]  DEFAULT ((0)) FOR [Archived]
GO
/****** Object:  Default [DF_Claims_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[Claim] ADD  CONSTRAINT [DF_Claims_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_ClaimDetails_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[ClaimDetail] ADD  CONSTRAINT [DF_ClaimDetails_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_PostedOn_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_PostedOn_LastModifiedDate]  DEFAULT (getdate()) FOR [PostedOn]
GO
/****** Object:  Default [DF_Comments_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[Comment] ADD  CONSTRAINT [DF_Comments_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_Locations_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[CustomerLocation] ADD  CONSTRAINT [DF_Locations_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_ERPCustomerLocation_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[ERPCustomerLocation] ADD  CONSTRAINT [DF_ERPCustomerLocation_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_ERPCustomerOrg_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[ERPCustomerOrg] ADD  CONSTRAINT [DF_ERPCustomerOrg_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_ERPMasterBrand_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[ERPMasterBrand] ADD  CONSTRAINT [DF_ERPMasterBrand_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_ERPMasterInventory_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[ERPMasterInventory] ADD  CONSTRAINT [DF_ERPMasterInventory_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_FilesDetail_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[FileDetail] ADD  CONSTRAINT [DF_FilesDetail_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_FilesHeader_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[FileHeader] ADD  CONSTRAINT [DF_FilesHeader_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_MasterActivity_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterActivity] ADD  CONSTRAINT [DF_MasterActivity_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_MasterActivity_CanDelete]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterActivity] ADD  CONSTRAINT [DF_MasterActivity_CanDelete]  DEFAULT ((1)) FOR [CanDelete]
GO
/****** Object:  Default [DF_MasterBrand_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterBrand] ADD  CONSTRAINT [DF_MasterBrand_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_MasterClaimStatus_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterClaimStatus] ADD  CONSTRAINT [DF_MasterClaimStatus_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_MasterClaimStatus_CanDelete]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterClaimStatus] ADD  CONSTRAINT [DF_MasterClaimStatus_CanDelete]  DEFAULT ((1)) FOR [CanDelete]
GO
/****** Object:  Default [DF_MasterDefect_SortOrder]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterDefect] ADD  CONSTRAINT [DF_MasterDefect_SortOrder]  DEFAULT ((1)) FOR [SortOrder]
GO
/****** Object:  Default [DF_MasterNatureOfDefect_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterDefect] ADD  CONSTRAINT [DF_MasterNatureOfDefect_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_MasterDefect_CanDelete]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterDefect] ADD  CONSTRAINT [DF_MasterDefect_CanDelete]  DEFAULT ((1)) FOR [CanDelete]
GO
/****** Object:  Default [DF_MasterFileTypeDetail_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterFileTypeDetail] ADD  CONSTRAINT [DF_MasterFileTypeDetail_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_MasterFileTypeDetail_CanDelete]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterFileTypeDetail] ADD  CONSTRAINT [DF_MasterFileTypeDetail_CanDelete]  DEFAULT ((1)) FOR [CanDelete]
GO
/****** Object:  Default [DF_MasterFileTypeHeader_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterFileTypeHeader] ADD  CONSTRAINT [DF_MasterFileTypeHeader_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_MasterFileTypeHeader_CanDelete]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterFileTypeHeader] ADD  CONSTRAINT [DF_MasterFileTypeHeader_CanDelete]  DEFAULT ((1)) FOR [CanDelete]
GO
/****** Object:  Default [DF_MasterInventory_Ply]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterInventory] ADD  CONSTRAINT [DF_MasterInventory_Ply]  DEFAULT ((0)) FOR [Ply]
GO
/****** Object:  Default [DF_MasterInventory_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterInventory] ADD  CONSTRAINT [DF_MasterInventory_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_CustomerOrg_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterOrg] ADD  CONSTRAINT [DF_CustomerOrg_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_MasterOrgType_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterOrgType] ADD  CONSTRAINT [DF_MasterOrgType_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_MasterRole_SecurityManage]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterRole] ADD  CONSTRAINT [DF_MasterRole_SecurityManage]  DEFAULT ((0)) FOR [ManageRole]
GO
/****** Object:  Default [DF_MasterRole_MasterManage]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterRole] ADD  CONSTRAINT [DF_MasterRole_MasterManage]  DEFAULT ((0)) FOR [ManageMaster]
GO
/****** Object:  Default [DF_MasterRole_UserManage]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterRole] ADD  CONSTRAINT [DF_MasterRole_UserManage]  DEFAULT ((0)) FOR [ManageUser]
GO
/****** Object:  Default [DF_MasterRole_ClaimDelete]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterRole] ADD  CONSTRAINT [DF_MasterRole_ClaimDelete]  DEFAULT ((0)) FOR [DeleteClaim]
GO
/****** Object:  Default [DF_MasterRole_ViewActivity]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterRole] ADD  CONSTRAINT [DF_MasterRole_ViewActivity]  DEFAULT ((0)) FOR [ViewActivity]
GO
/****** Object:  Default [DF_MasterRole_ManageSetting]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterRole] ADD  CONSTRAINT [DF_MasterRole_ManageSetting]  DEFAULT ((0)) FOR [ManageSetting]
GO
/****** Object:  Default [DF_MasterRole_ArchiveClaim]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterRole] ADD  CONSTRAINT [DF_MasterRole_ArchiveClaim]  DEFAULT ((0)) FOR [ArchiveClaim]
GO
/****** Object:  Default [DF_MasterRoles_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterRole] ADD  CONSTRAINT [DF_MasterRoles_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_MasterRole_CanDelete]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterRole] ADD  CONSTRAINT [DF_MasterRole_CanDelete]  DEFAULT ((1)) FOR [CanDelete]
GO
/****** Object:  Default [DF_MasterSetting_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterSetting] ADD  CONSTRAINT [DF_MasterSetting_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_StatusHistory_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[StatusHistory] ADD  CONSTRAINT [DF_StatusHistory_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_UserLocation_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[UserLocation] ADD  CONSTRAINT [DF_UserLocation_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  Default [DF_Users_LastModifiedDate]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_LastModifiedDate]  DEFAULT (getdate()) FOR [LastModifiedDate]
GO
/****** Object:  ForeignKey [FK_ActivityHistory_MasterActivity]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[ActivityHistory]  WITH CHECK ADD  CONSTRAINT [FK_ActivityHistory_MasterActivity] FOREIGN KEY([ActivityID])
REFERENCES [dbo].[MasterActivity] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActivityHistory] CHECK CONSTRAINT [FK_ActivityHistory_MasterActivity]
GO
/****** Object:  ForeignKey [FK_ActivityHistory_Users]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[ActivityHistory]  WITH CHECK ADD  CONSTRAINT [FK_ActivityHistory_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActivityHistory] CHECK CONSTRAINT [FK_ActivityHistory_Users]
GO
/****** Object:  ForeignKey [FK_Claim_MasterOrg]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[Claim]  WITH CHECK ADD  CONSTRAINT [FK_Claim_MasterOrg] FOREIGN KEY([CustID])
REFERENCES [dbo].[MasterOrg] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Claim] CHECK CONSTRAINT [FK_Claim_MasterOrg]
GO
/****** Object:  ForeignKey [FK_ClaimDetail_MasterDefect]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[ClaimDetail]  WITH CHECK ADD  CONSTRAINT [FK_ClaimDetail_MasterDefect] FOREIGN KEY([NatureOfDefect])
REFERENCES [dbo].[MasterDefect] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClaimDetail] CHECK CONSTRAINT [FK_ClaimDetail_MasterDefect]
GO
/****** Object:  ForeignKey [FK_ClaimDetails_Claims]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[ClaimDetail]  WITH CHECK ADD  CONSTRAINT [FK_ClaimDetails_Claims] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[Claim] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ClaimDetail] CHECK CONSTRAINT [FK_ClaimDetails_Claims]
GO
/****** Object:  ForeignKey [FK_Comments_Claims]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Claims] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[Claim] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comments_Claims]
GO
/****** Object:  ForeignKey [FK_CustomerLocation_MasterOrg]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[CustomerLocation]  WITH CHECK ADD  CONSTRAINT [FK_CustomerLocation_MasterOrg] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[MasterOrg] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomerLocation] CHECK CONSTRAINT [FK_CustomerLocation_MasterOrg]
GO
/****** Object:  ForeignKey [FK_FileDetail_ClaimDetail]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[FileDetail]  WITH CHECK ADD  CONSTRAINT [FK_FileDetail_ClaimDetail] FOREIGN KEY([ClaimDetailID])
REFERENCES [dbo].[ClaimDetail] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FileDetail] CHECK CONSTRAINT [FK_FileDetail_ClaimDetail]
GO
/****** Object:  ForeignKey [FK_FilesDetail_MasterFileTypeDetail]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[FileDetail]  WITH CHECK ADD  CONSTRAINT [FK_FilesDetail_MasterFileTypeDetail] FOREIGN KEY([FileType])
REFERENCES [dbo].[MasterFileTypeDetail] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FileDetail] CHECK CONSTRAINT [FK_FilesDetail_MasterFileTypeDetail]
GO
/****** Object:  ForeignKey [FK_FilesHeader_Claims]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[FileHeader]  WITH CHECK ADD  CONSTRAINT [FK_FilesHeader_Claims] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[Claim] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FileHeader] CHECK CONSTRAINT [FK_FilesHeader_Claims]
GO
/****** Object:  ForeignKey [FK_FilesHeader_MasterFileTypeHeader]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[FileHeader]  WITH CHECK ADD  CONSTRAINT [FK_FilesHeader_MasterFileTypeHeader] FOREIGN KEY([FileType])
REFERENCES [dbo].[MasterFileTypeHeader] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FileHeader] CHECK CONSTRAINT [FK_FilesHeader_MasterFileTypeHeader]
GO
/****** Object:  ForeignKey [FK_MasterInventory_MasterBrand]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterInventory]  WITH NOCHECK ADD  CONSTRAINT [FK_MasterInventory_MasterBrand] FOREIGN KEY([BrandId])
REFERENCES [dbo].[MasterBrand] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterInventory] CHECK CONSTRAINT [FK_MasterInventory_MasterBrand]
GO
/****** Object:  ForeignKey [FK_MasterOrg_MasterOrgType]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[MasterOrg]  WITH CHECK ADD  CONSTRAINT [FK_MasterOrg_MasterOrgType] FOREIGN KEY([OrgTypeId])
REFERENCES [dbo].[MasterOrgType] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MasterOrg] CHECK CONSTRAINT [FK_MasterOrg_MasterOrgType]
GO
/****** Object:  ForeignKey [FK_StatusHistory_Claim]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[StatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_StatusHistory_Claim] FOREIGN KEY([ClaimID])
REFERENCES [dbo].[Claim] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StatusHistory] CHECK CONSTRAINT [FK_StatusHistory_Claim]
GO
/****** Object:  ForeignKey [FK_StatusHistory_MasterClaimStatus]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[StatusHistory]  WITH CHECK ADD  CONSTRAINT [FK_StatusHistory_MasterClaimStatus] FOREIGN KEY([NewStatusID])
REFERENCES [dbo].[MasterClaimStatus] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StatusHistory] CHECK CONSTRAINT [FK_StatusHistory_MasterClaimStatus]
GO
/****** Object:  ForeignKey [FK_UserLocation_Locations]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[UserLocation]  WITH CHECK ADD  CONSTRAINT [FK_UserLocation_Locations] FOREIGN KEY([LocID])
REFERENCES [dbo].[CustomerLocation] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLocation] CHECK CONSTRAINT [FK_UserLocation_Locations]
GO
/****** Object:  ForeignKey [FK_UserLocation_Users]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[UserLocation]  WITH CHECK ADD  CONSTRAINT [FK_UserLocation_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserLocation] CHECK CONSTRAINT [FK_UserLocation_Users]
GO
/****** Object:  ForeignKey [FK_Users_MasterRoles]    Script Date: 01/22/2013 06:00:27 ******/
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_MasterRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[MasterRole] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_MasterRoles]
GO
