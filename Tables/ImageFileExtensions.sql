CREATE TABLE ImageFileExtensions
(
	Id BIGINT IDENTITY(1,1) NOT NULL,
	[Guid] UNIQUEIDENTIFIER NOT NULL DEFAULT(NEWID()),
	ImageType BIGINT NOT NULL, 
	FileExtension NVARCHAR(4) NOT NULL,

	CreatedBy BIGINT NOT NULL,
	CreatedOn DATETIME2(0) NOT NULL,
	ModifiedBy BIGINT NULL,
	ModifiedOn DATETIME2(0) NULL,

	IsTest BIT NOT NULL DEFAULT(0),

	CONSTRAINT PK_ImageFileExtensions PRIMARY KEY CLUSTERED (Id ASC),
	CONSTRAINT UQ_ImageFileExtensions_Guid UNIQUE ([Guid] ASC),
	CONSTRAINT FK_ImageFileExtensions_CreatedBy FOREIGN KEY(CreatedBy) REFERENCES Users (Id),
	CONSTRAINT FK_ImageFileExtensions_ModifiedBy FOREIGN KEY(ModifiedBy) REFERENCES Users (Id),
	CONSTRAINT FK_ImageFileExtensions_ImageType FOREIGN KEY(ImageType) REFERENCES ImageTypes (Id)
)