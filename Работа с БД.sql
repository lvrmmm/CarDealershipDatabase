--������� ������ ������� 

EXEC AddNewCustomer @FirstName = '�����', @MiddleName = '����������', @LastName = '�������', @Email='wusuusa@mail.ru', 
@Phone = '+7-937-321-53-77', @Passport = '6219-616272', @Address = '�. �������, ��. ����� ������, �. 1';

-- ������ ��� ������� ������ �������

EXEC AddNewCustomer @FirstName = '�����', @MiddleName = '����������', @LastName = '�������', @Email='wu112u1sa@mail.ru', 
@Phone = '+7-931-321-53-73', @Passport = '6219-616272', @Address = '�. ��������, ��. ����� ������, �. 1';

--��������� ���� ���������� �� ������������� AvailableCarsForSale
SELECT * FROM AvailableCarsForSale;

--��������� ������������� ���� �����

EXEC CompareCars @CarID1 = 39, @CarID2 = 31;
 
--������ ��� ���������

EXEC CompareCars @CarID1 = 39, @CarID2 = 39;

--����� ������ � Sales

DECLARE @Date1 DATETIME = GETDATE();
DECLARE @Date2 DATETIME = GETDATE()+1;
DECLARE @Date3 DATETIME = GETDATE()+4;
EXEC AddSale
    @CustomerID = 1,
    @ManagerID = 8, 
    @CarID = 31, 
    @SaleDate = @Date1, 
    @PaymentStatus = 1,
    @DateOfShipment = @Date2,
    @DateOfDelivery = @Date3;

--��������� ������ �� ������������� AvailableCarsForSale ��� ��������� ������

SELECT  *
FROM AvailableCarsForSale
WHERE CarID = 31;

--������� sql ������ ��� ��������� ������� ������� � �������� ������

SELECT PurchaseStatus
FROM Cars
WHERE CarID = 31;

--������ ��������� � ����� �������, � �������� ��������� �� ������ ��������

DECLARE @Date1 DATETIME = GETDATE();
DECLARE @Date2 DATETIME = GETDATE()+1;
DECLARE @Date3 DATETIME = GETDATE()+4;
EXEC AddSale
    @CustomerID = 5,
    @ManagerID = 1, 
    @CarID = 21, 
    @SaleDate = @Date1, 
    @PaymentStatus = 1,
    @DateOfShipment = @Date2,
    @DateOfDelivery = @Date3;

--�������� ������ ������ � �������� ��� �������

DECLARE @NewOrderID INT;
EXEC @NewOrderID = CreateAutoPartOrderHeader @OrderDate = '2024-20-12', @ShipDate = '2024-25-12', @ShipMethod = 'Standart';

PRINT '������ ����� ����� � OrderID: ' + CAST(@NewOrderID AS NVARCHAR);

EXEC AddAutoPartOrderDetail @OrderID = @NewOrderID, @AutoPartID = 10, @UnitPrice = 50.00, @Quantity = 2;
EXEC AddAutoPartOrderDetail @OrderID = @NewOrderID, @AutoPartID = 11, @UnitPrice = 50.00, @Quantity = 2;
EXEC AddAutoPartOrderDetail @OrderID = @NewOrderID, @AutoPartID = 4, @UnitPrice = 1000.0, @Quantity = 5;

--��������� ���� ������ �� ������������� AutoPartOrderStatus

SELECT * 
FROM AutoPartOrderStatus

--��������� ���� �������� ������ ����� �������������

UPDATE AutoPartOrderStatus
SET ShipDate = '2024-12-26'
WHERE OrderID = 2;