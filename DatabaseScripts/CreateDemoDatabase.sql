/*
Creates a Complete Demo Database with following contents:

-- Users

Username: admin
Password: Demo123!
Userrole: Admin

Username: demoUser1
Password: Demo123!
Userrole: User

Username: demoUser2
Password: Demo123!
Userrole: User

-- Resources

Name: DemoResource1

Name: DemoResource2

-- Reservation

Resource: DemoResource1
User: demoUser1
Begin: 16.8.2015
End: 16.8.2017

*/



SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'69a137b7-d376-4bc1-8b33-0ae4f59f7eae', N'none@none.com', 0, N'AIdPh04cCJjMSYNnnftVb+ON6nszy+1PbLN8vSIGRgVc06kVZOja5aW2HcfkT7rOPw==', N'c9e0c88b-d4a6-4371-9fef-8f4c08ed9717', NULL, 0, 0, NULL, 0, 0, N'demoUser1')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7c5e6adb-e642-4f2d-a71d-355e6afc9f43', N'none@none.com', 0, N'AEItcifz9R2hY2vy/QQ6zz8CV9GRs3lzcLg/fEtCl/DnLnMmYshF905zaC/DqcNXWg==', N'9bd8ae3b-1656-4864-bbe6-e4ac466d3885', NULL, 0, 0, NULL, 0, 0, N'admin')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'bf624a56-9357-46c7-81da-0ea8ffb972d1', N'none@none.com', 0, N'AAz1bRZtpk36KwhG9aEvu8WoiTVhgBOL2CzBZLde4g+pTe9u8aPIgEDUfbaQBsBIfw==', N'a8857d8c-4674-48d7-ad2b-cec813e312b5', NULL, 0, 0, NULL, 0, 0, N'demoUser2')
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 08/16/2015 17:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'2c3c46bb-941f-4952-bec2-fd9829386661', N'User', N'ApplicationRole')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [Discriminator]) VALUES (N'780f8ab2-5b92-4ffd-a395-974dab1539fb', N'Admin', N'ApplicationRole')
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 08/16/2015 17:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201508161512042_InitialCreate', N'IamUsingIt.Models.ApplicationDbContext', 0x1F8B0800000000000400ED5D5B6FDCB8157E2FD0FF20E869B7F0CEF8D2046930DE85E3CBD6686C071967D1378396E8B1105D66258ED746D15FD687FEA4FE85921275E14D2425CD48CE2E0204B6447EA40EBF73C873481EFFEF3FFF5DFCF41C85CE134CB320898FDD83D9BEEBC0D84BFC205E1DBB1BF4F0C33BF7A71FFFFCA7C5B91F3D3BBF94E58E48395C33CE8EDD4784D6EFE7F3CC7B8411C86651E0A549963CA099974473E027F3C3FDFDBFCD0F0EE61043B818CB71169F37310A2298FF827F3D4D620FAED1068457890FC38C3EC76F9639AA730D2298AD81078FDD4B107DC970EF2ED1AC28EC3A276100704796307C701D10C709020877F3FD970C2E519AC4ABE51A3F00E1EDCB1AE2720F20CC20EDFEFBBAB8E997EC1F922F99D7154B286F93A124B2043C38A2A299F3D53B09D8AD448785778E858C5EC857E7023C763FC30CA64F149D6FEFFD699892B21211CF1A15F79CFAF55EC5084C1CF26FCF39DD846893C2E3186E500AC23DE7D3E63E0CBC7FC097DBE42B8C8FE34D18363B89BB89DF310FF0A34F69B286297AF90C1FC4AE5FFAAE336721E63C468520AF4EBF33464787AE738DBB04EE435831A32193254A52F8338C610A10F43F0184608A07F6D287B96C858E88CD269BD483FA36DB713093D31A03931A8BDF75AEC0F34718AFD02356DCC377AE73113C43BF7C4271BFC401D6665C09A51B68DDEE07B80AE2B2D9332C825BACB5D628E7B16F8F710D9E82553E080A99BACE6718E605B2C7605DA87F93A87775C18B34893E2721CB83EAFDDD9216BB4D5A0ADD827405917937C99069BB581492778FBC6BED5A5E40D6ADC5BCD67C9D3DA0F896C620AF359E25A874AA831930D4C7E16C00F9BF4573F18F469A6BA11E2543B2E154A4A459AB8A9464EDC4C593F51AB323472CB4C286925CE59198D985916358F5F30804614BB3876FDE76A1A4AC15BCB27B08D208565FF921C1FC01B1759F3F812CFB2D49FDBF83EC71786DE21A5B426F93627A2E1188D65B6FEDD36312C3EB4D744F58BFBBB6061B9ADBDF920BE06123791E935ABDF13E26DED76483F0AA81AC16BE204F5C3C18020CD29D13CF83597681C90CFDD3043B2EFD97729A29C154FF3A2FA14E431044F2D981B3A47765D17A7E909710562A8A62B6CBA88F095E819A75B52CAAEE6A5142DB555ACCB6AB5633AF76E5D736E3324B43E3EE61183341D2926A39E605B4622C4A7559379B77B5515ADDDDAA90B6CB75C95EEBEA726948E072DEB7AD66AE2A7FFE245B5F43342B6BCF0ADC8B1463E2A9EFEB4C80DD738C2BD7CBA043D365D0D1C1FDC3D1BB376F817FF4F6AFF0E8CDEE9744DB5F9C8FE558E7C3471ADDFA8C9FB7F40B08374337D5491B72D33ABC36E4B0D3D786BC9BF8F153E013EB3FD7D7280B6378A3F2259F6D758EEBD9AED581F9CC5D37BE1B1BD0495DC85C34BCB610D4E92B8B9CCAF29010FEA02EAC1FCBFA97FD9D08E3B855908E74DAF04BC1AFFE2118E703C820951159FC099A61B1F235594D9272774561E562B22AA35B4BD6057B2D251BA8BDC665DB6352746E6E64D986B76AAFC3A2BD96F8E0D8E109A23E72F7AF39DE77B458ADAAE25B414925456CD4F324CB122FC87B253AFD75349DFDCEF3D8774C769F6AA562F669AF303303A2C7B83FC7EE5F04316AE0AB3802034FDB64B10F5C9EC337F1190C2182CE8957EC689F82CC03BE3896585E3EFB04D31EA644D880048133AC54418C441D09622F5883D0E00BB8BA967B43A48F556BFC9B33B886316186C138F5EF46D51A27429DC416F306FDDA59A988E2A988A30BE9D5D4117669B6C8206DFF24D496445E74FAD389A8ED1233E1484F8AB68BC4A403CAF5F51804A5B15B5302F081DCA911948B202B084A83213B21282BB11108CA8AE4B511B4760D0C2920F11394242DD6C3E6F3BCD6D39037256B667F363BE0973E9D95B808C49BEA0817919F9A0AB3DB006D5EE86E149811D708FACBC8E3B5A96F639FC874FC259B46C61415B5CAB0A9760536649C8598841D4913D7823D9836A8D7C2EE7C8E63127A3B2ECD8FD881A2AA8666F23A2A71E6551C69F3EC55B1A89DCC1A2DF184DD4F196A29ED80866A491879CCD208FE5688584476701D846BC0549C30CEEEC94BF88C24314AFC61344C99D13017CF0C02BE84487A26A40E2AC94CA6602105A87C301538F2D3203C088D9909008281D5E0087EB60C54E28C5BC096C7795A61A90B65014B4F8BB4A28AC16CD9786880A4200D4E4A49D23891DB28DA7672975718C36863F5353C47050D348C2FB28025537953CA7EBF816C54E7D144E998C4BC6CA25E8D0FA25AD3221A4D84AA8125D39CC1A554EA8E5E4AB2C08B4DE8A59794B83089424AE5C70C2DA5C6769F564E0AFFDF2E02A0F83E6A48CCE5263AFC4DE593A10D40298AAB6794C4CDB28803F4E213EB44D9887B000135B0F54252F8A3961E692F61895EE79605261E7F6D9FE24487D4CC25ED3BB5314EA84EC41DE420DBC41425A1F38E4CFD239D69307567062247B9B35AADBFAB778B7971D9973E58CC15B782175760BD0EE255E396307DE22C8B2BC2A73F2CED2FCF4605C6DC63E4CC7B0B554B2849C10A726F71D3B8A717419AA13380C03D20BBDEA77E2414937A1B8AE566D9A4C4A11007B25C8B9695C8CF94756D977A253E1A45B8C09F19112F2F3F682B572DB1B6436E6E8310A4EDD7704F937013C506177C3598D5662B07A8DC8455A395119126922A4AA246A1F7669B20F49139467E6BB689903F10EB2FE6DC50092EB4400B21BEC152CD94887491DF9B85AA18850105155577C395E29C4C13A778329931524D1B36E3C34706EC87498BA0922F3F4A76A3436F39321A543CB2C4685C9413C01AEFCC51D9BB8C4D4CF68D39227761B109C9BDB2E865F35A22D3C9E68B4E780A89CA4B98B7205E446CA28B6FCD912557129BD092D71DB0257DE6DF99A34A6E2D368125AFEDE648D1F6D54F2763FF24B1967EC6508C68DA9B43038CED18C46196368D9B4B4DA0C6634B2C7A374900A3CF27492665D4AC2B998A38763F322930D47687B9F2C39A9DD67B4A6A4CE61E0F63DADBEE31A9F1EC283B0162A8623A2DBCC8C8CF370FDFB51384007FDF9320B2F8E550B257AEB8E9C61EB3DA566CF6F51FC1BEAB5BB984BE31213B79C2353FC8B7E2732BABB802D4843B0B322F0DA22006F8DB2731747AA1FF0EC64DDCB5DCE9A0758D1DD85B49DDDDA61EA36F37F2C66BB0361D9BA07EE9A7A1BE53D096E43C7268A6B3DD7A25AC658F334CCABAB09B0CAC8951EFF55A2E07682DDBA9836CAAF02EB9661757949FD150E610F2B3538D3EF4E89EF20CD9104BF6DEF362EB57D66CBECCC875C4EA2AA28100F94DACBE146C6E105B70B0596D78128A9BCA1D59C8E30E4F4871C3FA9B65A45E987A720A1BAD7C91CA3A571BAEDCC6EA826E72EA73320BBB9E4511D729DDFE6377F9922118CD4881D9F2D7F0340C20093A9605AE401C3CC00C1597ADDDC3FDFD775C5EE7E9E4589E6799CFE4876C4FB4CC8EDB68C98E03226E6DB624DB4416423ED5BC19E1D8EC65ECC3E763F75F79B5F7CEE53FEFEA9A7BCE4D8A19F0DED977FEDD33774BFC0452EF11C892878A3D28AAB2ADF377EBFBA44BF6B18851CF74C98618F6097FBB9172C0BCBB5BA163B1C667B9F05D049EBF6F22F5C864D5BA93B98B1C1035C17B329549012B45CDB33CB4494D012AA415BD0FD020D95E2D065404946674ED8528C9DA3A14DE2022546565ED82A5CCC82AB34F261F2BCFD0DAA56BCAECACB981E9999BD57C3E296BE68FF7F0DAEE4B1CFCBAC12F6EB134B89985D3ACA1728549F612776192B662C8A735AD0BC91A7B29BA9890711B53956663F09BCC5738D8EC2849473818F698D4EE9E83B0037994774BB795BF6F6C33517E4587DE145507ED0D179D1D98C555CCACE3C7DE997FAD894D95054C3AF44C84E9DE496B5DEBAA6713F128BAAD9BC8470FB76EDAAE166C2F299C3497C2F653B449AFBF744FE9D03571C25079D5BA644CF83DA4739B40721DC94DF0F193B6ED322B42DB81D189A5E530B921FC6AC846F3038C9F806DD764531D289D36D914D7AC1537148D93BF68F2318987A8C6CDDDB26BAE18B7D972D46004C3243945F66AECD258341BD92A19336D4A46C93E79DC80B9E2FE208D3969CCCEA0EC8040C669F5A667A4C6F304476099AD2338AA55EA982E6F2A19F2FE585C69DA541F27DB510A3C3177053FA6F4E0A1E4909326B55D711EECD8F5EF133CFE4584AD2D378B32F95D6BEE3B452B8A5C647C1382BD155A124AC81A2CFEF4883C570CDFA424F021342A29D3DEAC22A9585BDBD40F6E6D9B96696F5B91AAABADED42ED5B9BA627B05B5B96E7A15135AC6954D7A0BCB11DE7F693663B926681544FF06C65652ACA29A7ED633E4278D72208A5F2296E690F2F94ED65E91B44288C5550DC361E5C288D2B178324E59369BC788FC654244A94FAE5E02CA1C666F0C47B8370640C8134CCFD5612EDBD1AC10C9C506F2831EC6686D97216BD69D90A8BAC79E2A50DEC286C62724AB3F8ED0C66C1AA8620375262E8312E4255E6327E484A4F85EB515984DB70BF8208F8D87F384951F0003C845F93039AF9DF90A3370ACFA37BE85FC6371BB4DE20FCC930BA0F99D362C4E3696B3F4F0DC8F67971B3CE1D89213E01773320075B6FE20F9B20F4AB7E5F488E042820882B458F4392B144E458E4EAA542BA4E6243202ABECA03BC85D13AC460D94DBC044FB04BDF30FD3EC215F05EEAE3732A10FD40B0625F9C0560958228A318757DFC2BE6B01F3DFFF87FA2F8B71E758E0000, N'6.1.3-40302')
/****** Object:  Table [dbo].[Resources]    Script Date: 08/16/2015 17:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resources](
	[ResourceId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Resources] PRIMARY KEY CLUSTERED 
(
	[ResourceId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Resources] ON
INSERT [dbo].[Resources] ([ResourceId], [Name]) VALUES (1, N'DemoResource1')
INSERT [dbo].[Resources] ([ResourceId], [Name]) VALUES (2, N'DemoResource2')
SET IDENTITY_INSERT [dbo].[Resources] OFF
/****** Object:  Table [dbo].[Reservations]    Script Date: 08/16/2015 17:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[ReservationId] [int] IDENTITY(1,1) NOT NULL,
	[ResourceId] [int] NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[Begin] [datetime] NOT NULL,
	[End] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Reservations] PRIMARY KEY CLUSTERED 
(
	[ReservationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Reservations] ON
INSERT [dbo].[Reservations] ([ReservationId], [ResourceId], [UserId], [Begin], [End]) VALUES (1, 1, N'69a137b7-d376-4bc1-8b33-0ae4f59f7eae', CAST(0x0000A4F6011B77E3 AS DateTime), CAST(0x0000A7D1011B77E3 AS DateTime))
SET IDENTITY_INSERT [dbo].[Reservations] OFF
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 08/16/2015 17:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
	[Role_Id] [nvarchar](128) NULL,
	[ApplicationUser_Id] [nvarchar](128) NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Discriminator], [Role_Id], [ApplicationUser_Id]) VALUES (N'69a137b7-d376-4bc1-8b33-0ae4f59f7eae', N'2c3c46bb-941f-4952-bec2-fd9829386661', N'IdentityUserRole', NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Discriminator], [Role_Id], [ApplicationUser_Id]) VALUES (N'7c5e6adb-e642-4f2d-a71d-355e6afc9f43', N'780f8ab2-5b92-4ffd-a395-974dab1539fb', N'IdentityUserRole', NULL, NULL)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId], [Discriminator], [Role_Id], [ApplicationUser_Id]) VALUES (N'bf624a56-9357-46c7-81da-0ea8ffb972d1', N'2c3c46bb-941f-4952-bec2-fd9829386661', N'IdentityUserRole', NULL, NULL)
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 08/16/2015 17:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 08/16/2015 17:32:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]    Script Date: 08/16/2015 17:32:32 ******/
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]    Script Date: 08/16/2015 17:32:32 ******/
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_Role_Id]    Script Date: 08/16/2015 17:32:32 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_Role_Id] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[AspNetRoles] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_Role_Id]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]    Script Date: 08/16/2015 17:32:32 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_ApplicationUser_Id]    Script Date: 08/16/2015 17:32:32 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_ApplicationUser_Id] FOREIGN KEY([ApplicationUser_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_ApplicationUser_Id]
GO
/****** Object:  ForeignKey [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]    Script Date: 08/16/2015 17:32:32 ******/
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.Reservations_dbo.AspNetUsers_UserId]    Script Date: 08/16/2015 17:32:32 ******/
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Reservations_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_dbo.Reservations_dbo.AspNetUsers_UserId]
GO
/****** Object:  ForeignKey [FK_dbo.Reservations_dbo.Resources_ResourceId]    Script Date: 08/16/2015 17:32:32 ******/
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Reservations_dbo.Resources_ResourceId] FOREIGN KEY([ResourceId])
REFERENCES [dbo].[Resources] ([ResourceId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_dbo.Reservations_dbo.Resources_ResourceId]
GO
