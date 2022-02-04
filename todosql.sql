USE [master]
GO

/****** Object:  Database [ToDoList]    Script Date: 2/2/2022 10:34:56 PM ******/
CREATE DATABASE [ToDoList]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ToDoList', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NAPPY\MSSQL\DATA\ToDoList.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ToDoList_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.NAPPY\MSSQL\DATA\ToDoList_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ToDoList].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ToDoList] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [ToDoList] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [ToDoList] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [ToDoList] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [ToDoList] SET ARITHABORT OFF 
GO

ALTER DATABASE [ToDoList] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [ToDoList] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [ToDoList] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [ToDoList] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [ToDoList] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [ToDoList] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [ToDoList] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [ToDoList] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [ToDoList] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [ToDoList] SET  DISABLE_BROKER 
GO

ALTER DATABASE [ToDoList] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [ToDoList] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [ToDoList] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [ToDoList] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [ToDoList] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [ToDoList] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [ToDoList] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [ToDoList] SET RECOVERY FULL 
GO

ALTER DATABASE [ToDoList] SET  MULTI_USER 
GO

ALTER DATABASE [ToDoList] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [ToDoList] SET DB_CHAINING OFF 
GO

ALTER DATABASE [ToDoList] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [ToDoList] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [ToDoList] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [ToDoList] SET QUERY_STORE = OFF
GO

ALTER DATABASE [ToDoList] SET  READ_WRITE 
GO

USE [ToDoList]
GO

/****** Object:  Table [dbo].[ToDoList]    Script Date: 2/2/2022 10:35:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ToDoList](
	[ToDoID] [bigint] IDENTITY(1,1) NOT NULL,
	[ToDoName] [varchar](50) NOT NULL,
	[ToDoDescription] [nvarchar](200) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Priority] [nvarchar](10) NOT NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_ToDoLists] PRIMARY KEY CLUSTERED 
(
	[ToDoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

