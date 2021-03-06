USE [master]
GO
/****** Object:  Database [ProgramTest]    Script Date: 18/10/2021 4:39:20 pm ******/
CREATE DATABASE [ProgramTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CodigoProgramTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CodigoProgramTest.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CodigoProgramTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CodigoProgramTest_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProgramTest] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProgramTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProgramTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProgramTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProgramTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProgramTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProgramTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProgramTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProgramTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProgramTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProgramTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProgramTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProgramTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProgramTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProgramTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProgramTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProgramTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProgramTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProgramTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProgramTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProgramTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProgramTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProgramTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProgramTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProgramTest] SET RECOVERY FULL 
GO
ALTER DATABASE [ProgramTest] SET  MULTI_USER 
GO
ALTER DATABASE [ProgramTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProgramTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProgramTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProgramTest] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ProgramTest] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ProgramTest', N'ON'
GO
USE [ProgramTest]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18/10/2021 4:39:20 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_BuyType]    Script Date: 18/10/2021 4:39:20 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_BuyType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_BuyType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_eVoucher]    Script Date: 18/10/2021 4:39:20 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_eVoucher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[Image] [nvarchar](50) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[PaymentMethodID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[BuyTypeID] [int] NOT NULL,
	[InActive] [bit] NULL CONSTRAINT [DF_Tbl_eVoucher_InActive]  DEFAULT ((0)),
	[CreatedDate] [datetime] NULL CONSTRAINT [DF_Tbl_eVoucher_CreatedDate]  DEFAULT (getdate()),
 CONSTRAINT [PK_Tbl_eVoucher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tbl_FileUpload]    Script Date: 18/10/2021 4:39:20 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_FileUpload](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileNames] [varchar](250) NULL,
	[Filepic] [varbinary](max) NULL,
	[UploadDate] [datetime] NULL,
 CONSTRAINT [PK_Tbl_FileUpload] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_PaymentMethod]    Script Date: 18/10/2021 4:39:20 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_PaymentMethod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MethodName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tbl_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserInfo]    Script Date: 18/10/2021 4:39:20 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](30) NOT NULL,
	[LastName] [varchar](30) NOT NULL,
	[UserName] [varchar](30) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL,
	[CreatedDate] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Tbl_BuyType] ON 

INSERT [dbo].[Tbl_BuyType] ([ID], [TypeName]) VALUES (1, N'only me usage')
INSERT [dbo].[Tbl_BuyType] ([ID], [TypeName]) VALUES (2, N'gift to others')
SET IDENTITY_INSERT [dbo].[Tbl_BuyType] OFF
SET IDENTITY_INSERT [dbo].[Tbl_eVoucher] ON 

INSERT [dbo].[Tbl_eVoucher] ([ID], [Title], [Description], [ExpiryDate], [Image], [Amount], [PaymentMethodID], [Quantity], [BuyTypeID], [InActive], [CreatedDate]) VALUES (3, N'a', N'aaa', CAST(N'2021-10-28 12:27:00.000' AS DateTime), N'a.jpg', CAST(900 AS Decimal(18, 0)), 2, 1, 2, 1, NULL)
INSERT [dbo].[Tbl_eVoucher] ([ID], [Title], [Description], [ExpiryDate], [Image], [Amount], [PaymentMethodID], [Quantity], [BuyTypeID], [InActive], [CreatedDate]) VALUES (4, N'a', N'aa', CAST(N'2021-10-30 13:30:00.000' AS DateTime), N'Untitled.png', CAST(100 AS Decimal(18, 0)), 1, 1, 1, 0, CAST(N'2021-04-09 12:04:09.153' AS DateTime))
SET IDENTITY_INSERT [dbo].[Tbl_eVoucher] OFF
SET IDENTITY_INSERT [dbo].[Tbl_PaymentMethod] ON 

INSERT [dbo].[Tbl_PaymentMethod] ([ID], [MethodName]) VALUES (1, N'VISA')
INSERT [dbo].[Tbl_PaymentMethod] ([ID], [MethodName]) VALUES (2, N'Debit Card')
SET IDENTITY_INSERT [dbo].[Tbl_PaymentMethod] OFF
SET IDENTITY_INSERT [dbo].[UserInfo] ON 

INSERT [dbo].[UserInfo] ([UserId], [FirstName], [LastName], [UserName], [Email], [Password], [CreatedDate]) VALUES (1, N'Inventory', N'Admin', N'InventoryAdmin', N'InventoryAdmin@abc.com', N'$admin@2017', CAST(N'2021-10-15 13:40:06.873' AS DateTime))
SET IDENTITY_INSERT [dbo].[UserInfo] OFF
ALTER TABLE [dbo].[Tbl_eVoucher]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_eVoucher_Tbl_BuyType] FOREIGN KEY([BuyTypeID])
REFERENCES [dbo].[Tbl_BuyType] ([ID])
GO
ALTER TABLE [dbo].[Tbl_eVoucher] CHECK CONSTRAINT [FK_Tbl_eVoucher_Tbl_BuyType]
GO
ALTER TABLE [dbo].[Tbl_eVoucher]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_eVoucher_Tbl_PaymentMethod] FOREIGN KEY([PaymentMethodID])
REFERENCES [dbo].[Tbl_PaymentMethod] ([ID])
GO
ALTER TABLE [dbo].[Tbl_eVoucher] CHECK CONSTRAINT [FK_Tbl_eVoucher_Tbl_PaymentMethod]
GO
USE [master]
GO
ALTER DATABASE [ProgramTest] SET  READ_WRITE 
GO
