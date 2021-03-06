USE [master]
GO
/****** Object:  Database [Photographer]    Script Date: 4/5/2020 1:39:46 AM ******/
CREATE DATABASE [Photographer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Photographer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Photographer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Photographer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Photographer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Photographer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Photographer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Photographer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Photographer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Photographer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Photographer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Photographer] SET ARITHABORT OFF 
GO
ALTER DATABASE [Photographer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Photographer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Photographer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Photographer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Photographer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Photographer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Photographer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Photographer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Photographer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Photographer] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Photographer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Photographer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Photographer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Photographer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Photographer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Photographer] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Photographer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Photographer] SET RECOVERY FULL 
GO
ALTER DATABASE [Photographer] SET  MULTI_USER 
GO
ALTER DATABASE [Photographer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Photographer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Photographer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Photographer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Photographer] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Photographer', N'ON'
GO
ALTER DATABASE [Photographer] SET QUERY_STORE = OFF
GO
USE [Photographer]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 4/5/2020 1:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[name] [nvarchar](150) NULL,
	[address] [nvarchar](150) NULL,
	[city] [nvarchar](150) NULL,
	[country] [nvarchar](150) NULL,
	[telephone] [nvarchar](150) NULL,
	[email] [nvarchar](150) NULL,
	[photo] [nvarchar](150) NULL,
	[titlePhoto] [nvarchar](150) NULL,
	[about] [nvarchar](550) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeltailGallery]    Script Date: 4/5/2020 1:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeltailGallery](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idGallery] [int] NULL,
	[imageDetail] [nvarchar](50) NULL,
 CONSTRAINT [PK_DeltailGallery] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 4/5/2020 1:39:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[idGallery] [int] IDENTITY(1,1) NOT NULL,
	[nameGallery] [nvarchar](50) NULL,
	[shortDes] [nvarchar](250) NULL,
	[imageDescript] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[idGallery] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Contact] ([name], [address], [city], [country], [telephone], [email], [photo], [titlePhoto], [about]) VALUES (N'Photographer', N'Yen My', N'Ha Noi', N'Viet Nam', N'0983823928', N'thangntqhe130591@fpt.edu.vn', N'img5.jpg', N'angels and demons', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum')
SET IDENTITY_INSERT [dbo].[DeltailGallery] ON 

INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (1, 2, N'img6.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (2, 2, N'img4.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (3, 2, N'img5.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (4, 2, N'img3.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (5, 2, N'img7.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (6, 2, N'img8.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (7, 2, N'img1.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (8, 2, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (9, 3, N'img8.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (10, 3, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (11, 3, N'img3.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (12, 3, N'img4.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (13, 3, N'img5.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (14, 3, N'img6.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (15, 3, N'img7.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (16, 3, N'img1.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (18, 4, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (19, 4, N'img1.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (20, 4, N'img3.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (21, 4, N'img4.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (22, 4, N'img5.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (23, 4, N'img6.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (25, 4, N'img8.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (28, 2, N'img3.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (29, 2, N'img4.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (30, 2, N'img5.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (31, 2, N'img6.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (32, 2, N'img7.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (33, 2, N'img8.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (34, 2, N'img1.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (35, 2, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (36, 3, N'img1.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (37, 3, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (38, 3, N'img3.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (39, 3, N'img4.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (40, 3, N'img5.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (41, 3, N'img6.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (42, 3, N'img7.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (43, 3, N'img8.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (44, 1, N'img3.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (45, 1, N'img4.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (46, 1, N'img5.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (47, 1, N'img6.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (48, 1, N'img7.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (49, 1, N'img8.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (50, 1, N'img1.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (51, 1, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (52, 1, N'img3.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (53, 1, N'img4.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (54, 1, N'img5.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (55, 1, N'img6.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (56, 1, N'img7.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (57, 1, N'img8.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (58, 1, N'img1.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (60, 5, N'img4.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (61, 6, N'img3.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (62, 7, N'img1.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (63, 5, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (64, 6, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (65, 7, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (66, 5, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (67, 6, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (69, 5, N'img2.jpg')
INSERT [dbo].[DeltailGallery] ([id], [idGallery], [imageDetail]) VALUES (70, 6, N'img2.jpg')
SET IDENTITY_INSERT [dbo].[DeltailGallery] OFF
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([idGallery], [nameGallery], [shortDes], [imageDescript]) VALUES (1, N'Gallery 1', N' dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci ta  dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation tion', N'img3.jpg')
INSERT [dbo].[Gallery] ([idGallery], [nameGallery], [shortDes], [imageDescript]) VALUES (2, N'Gallery 2', N'Ut wisi enim ad minim veniam, quis nostrud exerci tati Ut wisi enim ad minim veniam, quis nostrud exerci tation ullam on ullam', N'img6.jpg')
INSERT [dbo].[Gallery] ([idGallery], [nameGallery], [shortDes], [imageDescript]) VALUES (3, N'Gallery 3', N' dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation', N'img8.jpg')
INSERT [dbo].[Gallery] ([idGallery], [nameGallery], [shortDes], [imageDescript]) VALUES (4, N'Gallery 4', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullam', N'img2.jpg')
INSERT [dbo].[Gallery] ([idGallery], [nameGallery], [shortDes], [imageDescript]) VALUES (5, N'Gallery 5', N' dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation', N'img4.jpg')
INSERT [dbo].[Gallery] ([idGallery], [nameGallery], [shortDes], [imageDescript]) VALUES (6, N'Gallery 6', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullam', N'img3.jpg')
INSERT [dbo].[Gallery] ([idGallery], [nameGallery], [shortDes], [imageDescript]) VALUES (7, N'Gallery 7', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullam', N'img1.jpg')
SET IDENTITY_INSERT [dbo].[Gallery] OFF
ALTER TABLE [dbo].[DeltailGallery]  WITH CHECK ADD  CONSTRAINT [FK_DeltailGallery_Gallery] FOREIGN KEY([idGallery])
REFERENCES [dbo].[Gallery] ([idGallery])
GO
ALTER TABLE [dbo].[DeltailGallery] CHECK CONSTRAINT [FK_DeltailGallery_Gallery]
GO
USE [master]
GO
ALTER DATABASE [Photographer] SET  READ_WRITE 
GO
