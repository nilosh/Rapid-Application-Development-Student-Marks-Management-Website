USE [master]
GO
/****** Object:  Database [Assignment_2_CSI2441]    Script Date: 11/3/2019 12:44:39 PM ******/
CREATE DATABASE [Assignment_2_CSI2441]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment_2_CSI2441', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Assignment_2_CSI2441.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Assignment_2_CSI2441_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Assignment_2_CSI2441_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Assignment_2_CSI2441] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment_2_CSI2441].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment_2_CSI2441] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment_2_CSI2441] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Assignment_2_CSI2441] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Assignment_2_CSI2441]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 11/3/2019 12:44:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[UserID] [int] NOT NULL,
	[UserEmail] [varchar](50) NOT NULL,
	[UserPassword] [varchar](50) NOT NULL,
	[UserType] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 11/3/2019 12:44:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [char](8) NOT NULL,
	[StudentName] [varchar](50) NOT NULL,
	[StudentPhoto] [varchar](max) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Unit_Enrolment]    Script Date: 11/3/2019 12:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Unit_Enrolment](
	[UnitCode] [char](7) NOT NULL,
	[Year] [int] NOT NULL,
	[Semester] [int] NOT NULL,
	[Assessment_1] [int] NOT NULL,
	[Assessment_2] [int] NOT NULL,
	[Final_Exam] [int] NOT NULL,
	[Enrolment_ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [char](8) NOT NULL,
 CONSTRAINT [PK_Unit_Enrolment] PRIMARY KEY CLUSTERED 
(
	[Enrolment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Units]    Script Date: 11/3/2019 12:44:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Units](
	[UnitCode] [char](7) NOT NULL,
	[UnitTitle] [varchar](50) NOT NULL,
	[UnitCoordinator] [varchar](50) NOT NULL,
	[UnitOuttlinePdf] [varchar](max) NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[UnitCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Unit_Enrolment]  WITH CHECK ADD  CONSTRAINT [FK_Unit_Enrolment_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[Unit_Enrolment] CHECK CONSTRAINT [FK_Unit_Enrolment_Student]
GO
ALTER TABLE [dbo].[Unit_Enrolment]  WITH CHECK ADD  CONSTRAINT [FK_Unit_Enrolment_Units] FOREIGN KEY([UnitCode])
REFERENCES [dbo].[Units] ([UnitCode])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Unit_Enrolment] CHECK CONSTRAINT [FK_Unit_Enrolment_Units]
GO
USE [master]
GO
ALTER DATABASE [Assignment_2_CSI2441] SET  READ_WRITE 
GO
