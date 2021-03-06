USE [MrFixIt]
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'979e5c19-f184-4d23-a2dc-028c2e32c3da', 0, N'3ef13501-cb5b-4c7b-b568-6d2c1ff4bfc2', NULL, 0, 1, NULL, NULL, N'CATDOG@GMAIL.COM', N'AQAAAAEAACcQAAAAEElg/C43BiqSyUhXJVDvLAdBvNdSAl3KWMX5crixziVX9/1i4trzLHXcxp8GNKT6SA==', NULL, 0, N'a61d3704-88b2-46c1-b541-d99ce609aa7c', 0, N'catdog@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'9dcff855-69f8-4a4c-b211-3c8f255598c8', 0, N'b043ad73-4555-4843-a49d-9565743c959e', NULL, 0, 1, NULL, NULL, N'MOOCOW@GMAIL.COM', N'AQAAAAEAACcQAAAAEKU0kbpSMhA0QwuLN3yApVSos9Z9raFb70GEHObKXiEnD2hip9at/V+FoU0Z2m4/Aw==', NULL, 0, N'2647d936-9f33-4247-b03e-bd8ebbe3178c', 0, N'moocow@gmail.com')
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'a937e634-44de-4098-82cd-383c61455154', 0, N'8c0425bc-3ff8-4e3d-981d-f0987583ecd9', NULL, 0, 1, NULL, NULL, N'MRMEESEEKS@GMAIL.COM', N'AQAAAAEAACcQAAAAEHh7WwoDDTCQdd8Kd+lJt/YR+g4QAG+FGhYXS1rD/EA9EqxjcAoHtiKlIPrH8pmMVw==', NULL, 0, N'5190de23-3a98-4b55-8be6-ec6ea8868755', 0, N'mrmeeseeks@gmail.com')
SET IDENTITY_INSERT [dbo].[Workers] ON 

INSERT [dbo].[Workers] ([WorkerId], [Avaliable], [FirstName], [LastName], [UserName]) VALUES (1, 1, N'Moo', N'Cow', N'moocow@gmail.com')
INSERT [dbo].[Workers] ([WorkerId], [Avaliable], [FirstName], [LastName], [UserName]) VALUES (2, 0, N'Mr', N'Meeseeks', N'mrmeeseeks@gmail.com')
INSERT [dbo].[Workers] ([WorkerId], [Avaliable], [FirstName], [LastName], [UserName]) VALUES (1002, 1, N'Cat', N'Dog', N'catdog@gmail.com')
SET IDENTITY_INSERT [dbo].[Workers] OFF
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([JobId], [Completed], [Description], [Pending], [Title], [WorkerId], [PosterId]) VALUES (1009, 0, N'Need help with this guy named Jerry.', 0, N'Meeseek seeking Meeseeks', 1, N'a937e634-44de-4098-82cd-383c61455154')
INSERT [dbo].[Jobs] ([JobId], [Completed], [Description], [Pending], [Title], [WorkerId], [PosterId]) VALUES (2011, 0, N'We need someone to shave our handsome cows.', 0, N'Shave Cows', 2, N'9dcff855-69f8-4a4c-b211-3c8f255598c8')
INSERT [dbo].[Jobs] ([JobId], [Completed], [Description], [Pending], [Title], [WorkerId], [PosterId]) VALUES (2012, 0, N'We need someone to milk our handsome cows.', 0, N'Milk Cows', 2, N'9dcff855-69f8-4a4c-b211-3c8f255598c8')
INSERT [dbo].[Jobs] ([JobId], [Completed], [Description], [Pending], [Title], [WorkerId], [PosterId]) VALUES (2013, 0, N'We need someone to shovel cow manure.', 0, N'Poo', 2, N'9dcff855-69f8-4a4c-b211-3c8f255598c8')
INSERT [dbo].[Jobs] ([JobId], [Completed], [Description], [Pending], [Title], [WorkerId], [PosterId]) VALUES (2014, 0, N'We need someone to get a Russian domesticated red fox for us.', 0, N'Get a pet fox', NULL, N'9dcff855-69f8-4a4c-b211-3c8f255598c8')
INSERT [dbo].[Jobs] ([JobId], [Completed], [Description], [Pending], [Title], [WorkerId], [PosterId]) VALUES (3011, 0, N'Find our poor lost serval! He disappeared from our backyard two nights ago!!', 0, N'Find our serval!', NULL, N'979e5c19-f184-4d23-a2dc-028c2e32c3da')
INSERT [dbo].[Jobs] ([JobId], [Completed], [Description], [Pending], [Title], [WorkerId], [PosterId]) VALUES (3012, 0, N'We need someone to build a house on our empty lot.', 0, N'Build a house', NULL, N'979e5c19-f184-4d23-a2dc-028c2e32c3da')
INSERT [dbo].[Jobs] ([JobId], [Completed], [Description], [Pending], [Title], [WorkerId], [PosterId]) VALUES (3013, 0, N'We need someone to herd our cute Pikachus', 0, N'Herd Pikachus', NULL, N'979e5c19-f184-4d23-a2dc-028c2e32c3da')
SET IDENTITY_INSERT [dbo].[Jobs] OFF
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20161206233149_Initial', N'1.0.0-rtm-21431')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170224200632_AddPosterToJobModel', N'1.0.0-rtm-21431')
