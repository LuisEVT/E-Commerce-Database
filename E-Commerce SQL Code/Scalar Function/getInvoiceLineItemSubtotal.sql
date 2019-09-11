SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Function [getInvoiceLineItemSubtotal](@ID int)

--SYNTAX TO CREATE
Returns float

AS

BEGIN

	declare @total float
	Set @total =
	(
		SELECT SUM([Quantity] * [UnitPrice]) AS [Total]
		FROM [InvoiceLineItemDetail]
		WHERE [InvoiceCartID] = @ID
	)

	IF @total is NUll BEGIN

		SET @total = 0
	END

	return @total
	
END