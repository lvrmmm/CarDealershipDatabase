--Вставка нового клиента 

EXEC AddNewCustomer @FirstName = 'Павел', @MiddleName = 'Михайлович', @LastName = 'Ленский', @Email='wusuusa@mail.ru', 
@Phone = '+7-937-321-53-77', @Passport = '6219-616272', @Address = 'г. Коломна, ул. Карла Маркса, д. 1';

-- Ошибка при вставке нового клиента

EXEC AddNewCustomer @FirstName = 'Павел', @MiddleName = 'Михайлович', @LastName = 'Ленский', @Email='wu112u1sa@mail.ru', 
@Phone = '+7-931-321-53-73', @Passport = '6219-616272', @Address = 'г. Бухарест, ул. Карла Маркса, д. 1';

--Получение всей информации из представления AvailableCarsForSale
SELECT * FROM AvailableCarsForSale;

--Сравнение характеристик двух машин

EXEC CompareCars @CarID1 = 39, @CarID2 = 31;
 
--Ошибка при сравнении

EXEC CompareCars @CarID1 = 39, @CarID2 = 39;

--Новая запись в Sales

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

--Получение данных из представления AvailableCarsForSale для купленной машины

SELECT  *
FROM AvailableCarsForSale
WHERE CarID = 31;

--Простой sql запрос для получения статуса покупки у заданной машины

SELECT PurchaseStatus
FROM Cars
WHERE CarID = 31;

--машина находится в одном филиале, а менеджер закреплен за другим филиалом

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

--Создание нового заказа и указание его деталей

DECLARE @NewOrderID INT;
EXEC @NewOrderID = CreateAutoPartOrderHeader @OrderDate = '2024-20-12', @ShipDate = '2024-25-12', @ShipMethod = 'Standart';

PRINT 'Создан новый заказ с OrderID: ' + CAST(@NewOrderID AS NVARCHAR);

EXEC AddAutoPartOrderDetail @OrderID = @NewOrderID, @AutoPartID = 10, @UnitPrice = 50.00, @Quantity = 2;
EXEC AddAutoPartOrderDetail @OrderID = @NewOrderID, @AutoPartID = 11, @UnitPrice = 50.00, @Quantity = 2;
EXEC AddAutoPartOrderDetail @OrderID = @NewOrderID, @AutoPartID = 4, @UnitPrice = 1000.0, @Quantity = 5;

--Получение всех данных из представления AutoPartOrderStatus

SELECT * 
FROM AutoPartOrderStatus

--Изменение даты доставки заказа через представление

UPDATE AutoPartOrderStatus
SET ShipDate = '2024-12-26'
WHERE OrderID = 2;