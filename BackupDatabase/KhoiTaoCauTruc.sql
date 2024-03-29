USE [COBAO]
GO
/****** Object:  Table [dbo].[Tram]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tram](
	[MaTram] [uniqueidentifier] NOT NULL,
	[TenTram] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Tram] PRIMARY KEY CLUSTERED 
(
	[MaTram] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [uniqueidentifier] NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[UserName] [varchar](10) NOT NULL,
	[Pass] [varchar](10) NOT NULL,
	[DienThoai] [varchar](12) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CongTy]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CongTy](
	[MaCT] [uniqueidentifier] NOT NULL,
	[TenCT] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_CongTy] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiDauMay]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiDauMay](
	[MaLoai] [uniqueidentifier] NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
	[TanSoThap] [float] NULL,
	[Trongluong] [float] NULL,
 CONSTRAINT [PK_LoaiDauMay] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ga]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ga](
	[MaGa] [varchar](5) NOT NULL,
	[TenGa] [nvarchar](50) NOT NULL,
	[Km] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Ga] PRIMARY KEY CLUSTERED 
(
	[MaGa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DonGiaLuongXL]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonGiaLuongXL](
	[MaLuongXL] [uniqueidentifier] NOT NULL,
	[MoTa] [nvarchar](50) NOT NULL,
	[LoaiA] [money] NOT NULL,
	[LoaiB] [money] NOT NULL,
	[LoaiC] [money] NOT NULL,
	[BBH] [money] NOT NULL,
 CONSTRAINT [PK_DonGiaLuongXL] PRIMARY KEY CLUSTERED 
(
	[MaLuongXL] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonGiaLuongBoSung]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonGiaLuongBoSung](
	[MaDonGia] [uniqueidentifier] NOT NULL,
	[MoTa] [nvarchar](50) NOT NULL,
	[DonGia] [money] NOT NULL,
	[DonViTinh] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DonGiaLuongBoSung] PRIMARY KEY CLUSTERED 
(
	[MaDonGia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doi]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doi](
	[MaDoi] [uniqueidentifier] NOT NULL,
	[TenDoi] [nvarchar](50) NOT NULL,
	[MaTram] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Doi] PRIMARY KEY CLUSTERED 
(
	[MaDoi] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DauMay]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DauMay](
	[MaDM] [varchar](5) NOT NULL,
	[MaLoai] [uniqueidentifier] NOT NULL,
	[TenDM] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DauMay] PRIMARY KEY CLUSTERED 
(
	[MaDM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MacTau]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MacTau](
	[MaMacTau] [varchar](5) NOT NULL,
	[MaCT] [uniqueidentifier] NOT NULL,
	[MaLuongXL] [uniqueidentifier] NOT NULL,
	[TenMacTau] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MacTau] PRIMARY KEY CLUSTERED 
(
	[MaMacTau] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThuongTruc]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongTruc](
	[MaThuongTruc] [uniqueidentifier] NOT NULL,
	[MaTram] [uniqueidentifier] NOT NULL,
	[MaNV] [uniqueidentifier] NOT NULL,
	[NgayBatDau] [date] NOT NULL,
	[GioBatDau] [datetime] NOT NULL,
	[NgayKetThuc] [date] NOT NULL,
	[GioKetThuc] [datetime] NOT NULL,
 CONSTRAINT [PK_ThuongTruc] PRIMARY KEY CLUSTERED 
(
	[MaThuongTruc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[To]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[To](
	[MaTo] [uniqueidentifier] NOT NULL,
	[TenTo] [nvarchar](50) NOT NULL,
	[MaDoi] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_To] PRIMARY KEY CLUSTERED 
(
	[MaTo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CoBao]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CoBao](
	[SoCoBao] [varchar](8) NOT NULL,
	[MaNV] [uniqueidentifier] NOT NULL,
	[MaDM] [varchar](5) NOT NULL,
	[MaMacTau] [varchar](5) NOT NULL,
	[NgayNhanMay] [date] NOT NULL,
	[GioNhanMay] [datetime] NOT NULL,
	[NgayGiaoMay] [date] NOT NULL,
	[GioGiaoMay] [datetime] NOT NULL,
	[XepLoai] [varchar](5) NOT NULL,
	[LyDoXL] [nvarchar](50) NULL,
 CONSTRAINT [PK_Cobao] PRIMARY KEY CLUSTERED 
(
	[SoCoBao] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HanhTrinh]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HanhTrinh](
	[MaHanhTrinh] [uniqueidentifier] NOT NULL,
	[SoCoBao] [varchar](8) NOT NULL,
	[MaGa] [varchar](5) NOT NULL,
	[TrangThaiGa] [nvarchar](5) NOT NULL,
	[NgayGioDen] [datetime] NULL,
	[NgayGioDi] [datetime] NULL,
 CONSTRAINT [PK_HanhTrinh] PRIMARY KEY CLUSTERED 
(
	[MaHanhTrinh] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiXe]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiXe](
	[MaTaiXe] [varchar](5) NOT NULL,
	[TenTaiXe] [nvarchar](50) NOT NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [varchar](12) NOT NULL,
	[Tai] [bit] NOT NULL,
	[HeSoLuong] [float] NULL,
	[MaTo] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_TaiXe] PRIMARY KEY CLUSTERED 
(
	[MaTaiXe] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TheoTau]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TheoTau](
	[MaTheoTau] [uniqueidentifier] NOT NULL,
	[SoCoBao] [varchar](8) NOT NULL,
	[MaTaiXe] [varchar](5) NOT NULL,
	[Tai] [bit] NOT NULL,
	[GioTheoTau] [numeric](18, 0) NOT NULL,
	[GioLuuTru] [numeric](18, 0) NULL,
 CONSTRAINT [PK_TheoTau] PRIMARY KEY CLUSTERED 
(
	[MaTheoTau] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CoBaoLaiTau]    Script Date: 03/21/2012 11:55:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CoBaoLaiTau](
	[MaCoBaolai] [uniqueidentifier] NOT NULL,
	[SoCoBao] [varchar](8) NOT NULL,
	[MaTaiXe] [varchar](5) NOT NULL,
	[Tai] [bit] NOT NULL,
	[GioLuuTru] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_CoBaoLaiTau] PRIMARY KEY CLUSTERED 
(
	[MaCoBaolai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietThuongTruc]    Script Date: 03/21/2012 11:55:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChiTietThuongTruc](
	[MaChiTiet] [uniqueidentifier] NOT NULL,
	[MaThuongTruc] [uniqueidentifier] NOT NULL,
	[MaTai] [varchar](5) NOT NULL,
	[Tai] [bit] NOT NULL,
 CONSTRAINT [PK_ChiTietThuongTruc] PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  ForeignKey [FK_ChiTietThuongTruc_TaiXe]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[ChiTietThuongTruc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietThuongTruc_TaiXe] FOREIGN KEY([MaTai])
REFERENCES [dbo].[TaiXe] ([MaTaiXe])
GO
ALTER TABLE [dbo].[ChiTietThuongTruc] CHECK CONSTRAINT [FK_ChiTietThuongTruc_TaiXe]
GO
/****** Object:  ForeignKey [FK_ChiTietThuongTruc_ThuongTruc]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[ChiTietThuongTruc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietThuongTruc_ThuongTruc] FOREIGN KEY([MaThuongTruc])
REFERENCES [dbo].[ThuongTruc] ([MaThuongTruc])
GO
ALTER TABLE [dbo].[ChiTietThuongTruc] CHECK CONSTRAINT [FK_ChiTietThuongTruc_ThuongTruc]
GO
/****** Object:  ForeignKey [FK_Cobao_DauMay]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[CoBao]  WITH CHECK ADD  CONSTRAINT [FK_Cobao_DauMay] FOREIGN KEY([MaDM])
REFERENCES [dbo].[DauMay] ([MaDM])
GO
ALTER TABLE [dbo].[CoBao] CHECK CONSTRAINT [FK_Cobao_DauMay]
GO
/****** Object:  ForeignKey [FK_Cobao_MacTau]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[CoBao]  WITH CHECK ADD  CONSTRAINT [FK_Cobao_MacTau] FOREIGN KEY([MaMacTau])
REFERENCES [dbo].[MacTau] ([MaMacTau])
GO
ALTER TABLE [dbo].[CoBao] CHECK CONSTRAINT [FK_Cobao_MacTau]
GO
/****** Object:  ForeignKey [FK_Cobao_NhanVien]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[CoBao]  WITH CHECK ADD  CONSTRAINT [FK_Cobao_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[CoBao] CHECK CONSTRAINT [FK_Cobao_NhanVien]
GO
/****** Object:  ForeignKey [FK_CoBaoLaiTau_Cobao]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[CoBaoLaiTau]  WITH CHECK ADD  CONSTRAINT [FK_CoBaoLaiTau_Cobao] FOREIGN KEY([SoCoBao])
REFERENCES [dbo].[CoBao] ([SoCoBao])
GO
ALTER TABLE [dbo].[CoBaoLaiTau] CHECK CONSTRAINT [FK_CoBaoLaiTau_Cobao]
GO
/****** Object:  ForeignKey [FK_CoBaoLaiTau_TaiXe]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[CoBaoLaiTau]  WITH CHECK ADD  CONSTRAINT [FK_CoBaoLaiTau_TaiXe] FOREIGN KEY([MaTaiXe])
REFERENCES [dbo].[TaiXe] ([MaTaiXe])
GO
ALTER TABLE [dbo].[CoBaoLaiTau] CHECK CONSTRAINT [FK_CoBaoLaiTau_TaiXe]
GO
/****** Object:  ForeignKey [FK_DauMay_LoaiDauMay]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[DauMay]  WITH CHECK ADD  CONSTRAINT [FK_DauMay_LoaiDauMay] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiDauMay] ([MaLoai])
GO
ALTER TABLE [dbo].[DauMay] CHECK CONSTRAINT [FK_DauMay_LoaiDauMay]
GO
/****** Object:  ForeignKey [FK_Doi_Tram]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[Doi]  WITH CHECK ADD  CONSTRAINT [FK_Doi_Tram] FOREIGN KEY([MaTram])
REFERENCES [dbo].[Tram] ([MaTram])
GO
ALTER TABLE [dbo].[Doi] CHECK CONSTRAINT [FK_Doi_Tram]
GO
/****** Object:  ForeignKey [FK_HanhTrinh_CoBao]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[HanhTrinh]  WITH CHECK ADD  CONSTRAINT [FK_HanhTrinh_CoBao] FOREIGN KEY([SoCoBao])
REFERENCES [dbo].[CoBao] ([SoCoBao])
GO
ALTER TABLE [dbo].[HanhTrinh] CHECK CONSTRAINT [FK_HanhTrinh_CoBao]
GO
/****** Object:  ForeignKey [FK_HanhTrinh_Ga]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[HanhTrinh]  WITH CHECK ADD  CONSTRAINT [FK_HanhTrinh_Ga] FOREIGN KEY([MaGa])
REFERENCES [dbo].[Ga] ([MaGa])
GO
ALTER TABLE [dbo].[HanhTrinh] CHECK CONSTRAINT [FK_HanhTrinh_Ga]
GO
/****** Object:  ForeignKey [FK_MacTau_CongTy]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[MacTau]  WITH CHECK ADD  CONSTRAINT [FK_MacTau_CongTy] FOREIGN KEY([MaCT])
REFERENCES [dbo].[CongTy] ([MaCT])
GO
ALTER TABLE [dbo].[MacTau] CHECK CONSTRAINT [FK_MacTau_CongTy]
GO
/****** Object:  ForeignKey [FK_MacTau_DonGiaLuongXL]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[MacTau]  WITH CHECK ADD  CONSTRAINT [FK_MacTau_DonGiaLuongXL] FOREIGN KEY([MaLuongXL])
REFERENCES [dbo].[DonGiaLuongXL] ([MaLuongXL])
GO
ALTER TABLE [dbo].[MacTau] CHECK CONSTRAINT [FK_MacTau_DonGiaLuongXL]
GO
/****** Object:  ForeignKey [FK_TaiXe_To]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[TaiXe]  WITH CHECK ADD  CONSTRAINT [FK_TaiXe_To] FOREIGN KEY([MaTo])
REFERENCES [dbo].[To] ([MaTo])
GO
ALTER TABLE [dbo].[TaiXe] CHECK CONSTRAINT [FK_TaiXe_To]
GO
/****** Object:  ForeignKey [FK_TheoTau_CoBao]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[TheoTau]  WITH CHECK ADD  CONSTRAINT [FK_TheoTau_CoBao] FOREIGN KEY([SoCoBao])
REFERENCES [dbo].[CoBao] ([SoCoBao])
GO
ALTER TABLE [dbo].[TheoTau] CHECK CONSTRAINT [FK_TheoTau_CoBao]
GO
/****** Object:  ForeignKey [FK_TheoTau_TaiXe]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[TheoTau]  WITH CHECK ADD  CONSTRAINT [FK_TheoTau_TaiXe] FOREIGN KEY([MaTaiXe])
REFERENCES [dbo].[TaiXe] ([MaTaiXe])
GO
ALTER TABLE [dbo].[TheoTau] CHECK CONSTRAINT [FK_TheoTau_TaiXe]
GO
/****** Object:  ForeignKey [FK_ThuongTruc_NhanVien]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[ThuongTruc]  WITH CHECK ADD  CONSTRAINT [FK_ThuongTruc_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ThuongTruc] CHECK CONSTRAINT [FK_ThuongTruc_NhanVien]
GO
/****** Object:  ForeignKey [FK_ThuongTruc_Tram]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[ThuongTruc]  WITH CHECK ADD  CONSTRAINT [FK_ThuongTruc_Tram] FOREIGN KEY([MaTram])
REFERENCES [dbo].[Tram] ([MaTram])
GO
ALTER TABLE [dbo].[ThuongTruc] CHECK CONSTRAINT [FK_ThuongTruc_Tram]
GO
/****** Object:  ForeignKey [FK_To_Doi]    Script Date: 03/21/2012 11:55:49 ******/
ALTER TABLE [dbo].[To]  WITH CHECK ADD  CONSTRAINT [FK_To_Doi] FOREIGN KEY([MaDoi])
REFERENCES [dbo].[Doi] ([MaDoi])
GO
ALTER TABLE [dbo].[To] CHECK CONSTRAINT [FK_To_Doi]
GO
