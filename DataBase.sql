USE [master]
GO
/****** Object:  Database [beautysalon]    Script Date: 29.01.2021 10:30:26 ******/
CREATE DATABASE [beautysalon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'beautysalon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\beautysalon.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'beautysalon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\beautysalon_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [beautysalon] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [beautysalon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [beautysalon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [beautysalon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [beautysalon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [beautysalon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [beautysalon] SET ARITHABORT OFF 
GO
ALTER DATABASE [beautysalon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [beautysalon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [beautysalon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [beautysalon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [beautysalon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [beautysalon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [beautysalon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [beautysalon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [beautysalon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [beautysalon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [beautysalon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [beautysalon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [beautysalon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [beautysalon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [beautysalon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [beautysalon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [beautysalon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [beautysalon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [beautysalon] SET  MULTI_USER 
GO
ALTER DATABASE [beautysalon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [beautysalon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [beautysalon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [beautysalon] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [beautysalon] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [beautysalon] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [beautysalon] SET QUERY_STORE = OFF
GO
USE [beautysalon]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 29.01.2021 10:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[Id] [int] NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 29.01.2021 10:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] NOT NULL,
	[Фамилия] [nvarchar](max) NOT NULL,
	[Имя] [nvarchar](max) NOT NULL,
	[Отчество] [nvarchar](max) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Телефон] [float] NOT NULL,
	[Почта] [nvarchar](max) NOT NULL,
	[Возраст] [float] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 29.01.2021 10:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] NOT NULL,
	[Наименование] [nvarchar](max) NOT NULL,
	[ServicesId] [int] NULL,
	[UsersId] [int] NULL,
	[CustomerId] [int] NULL,
	[Adminid] [int] NULL,
	[ДатаЗаписи] [datetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 29.01.2021 10:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[Id] [int] NOT NULL,
	[Наиманование] [nvarchar](max) NOT NULL,
	[ВидУслуги] [nvarchar](max) NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29.01.2021 10:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[Фамилия] [nvarchar](max) NOT NULL,
	[Имя] [nvarchar](max) NOT NULL,
	[Отчество] [nvarchar](max) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Телефон] [float] NOT NULL,
	[Почта] [nvarchar](max) NOT NULL,
	[Adminid] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Admin] FOREIGN KEY([Adminid])
REFERENCES [dbo].[Admin] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Admin]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Services] FOREIGN KEY([ServicesId])
REFERENCES [dbo].[Services] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Services]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Users] FOREIGN KEY([UsersId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Admin] FOREIGN KEY([Adminid])
REFERENCES [dbo].[Admin] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Admin]
GO
USE [master]
GO
ALTER DATABASE [beautysalon] SET  READ_WRITE 
GO
