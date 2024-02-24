/*
About Dataset
*/
-- All infomation
SELECT * FROM PortfolioProjectDemo.dbo.telecom_customer_churn
-- Distincount of Customer status
SELECT [Customer Status],COUNT([Customer Status])
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
GROUP BY [Customer Status]
/*
DATA CLEANING
*/
--Fill null data for [Multiple Lines]
SELECT [Phone Service], [Multiple Lines]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Multiple Lines] is Null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Multiple Lines] = 'No'
WHERE [Multiple Lines] is Null AND [Phone Service] = 'No'

--Fill null data for [Avg Monthly Long Distance Charges]
SELECT [Avg Monthly Long Distance Charges], [Phone Service]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Avg Monthly Long Distance Charges] is null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Avg Monthly Long Distance Charges] = 0
WHERE [Avg Monthly Long Distance Charges] is Null AND [Phone Service] = 'No'

--Fill null data for [Internet Type]
SELECT [Internet Service], [Internet Type]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Internet Type] is null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Internet Type] = 'None'
WHERE [Internet Type] is Null AND [Internet Service] = 'No'

--Fill null data for [Avg Monthly GB Download]
SELECT [Internet Service], [Avg Monthly GB Download]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Avg Monthly GB Download] is null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Avg Monthly GB Download] = 0
WHERE [Avg Monthly GB Download] is Null AND [Internet Service] = 'No'

--Fill null data for [Online Security]
SELECT [Internet Service], [Online Security]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Online Security] is null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Online Security] = 'No'
WHERE [Online Security] is Null AND [Internet Service] = 'No'

----Fill null data for [Online Backup]
SELECT [Internet Service], [Online Backup]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Online Backup] is null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Online Backup] = 'No'
WHERE [Online Backup] is Null AND [Internet Service] = 'No'

--Fill null data for [Device Protection Plan]
SELECT [Internet Service], [Device Protection Plan]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Device Protection Plan] is null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Device Protection Plan] = 'No'
WHERE [Device Protection Plan] is Null AND [Internet Service] = 'No'

--Fill null data for [Premium Tech Support]
SELECT [Internet Service], [Premium Tech Support]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Premium Tech Support] is null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Premium Tech Support] = 'No'
WHERE [Premium Tech Support] is Null AND [Internet Service] = 'No'

--Fill null data for [Streaming TV]
SELECT [Internet Service], [Streaming TV]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Streaming TV] is null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Streaming TV] = 'No'
WHERE [Streaming TV] is Null AND [Internet Service] = 'No'

--Fill null data [Streaming Movies]
SELECT [Internet Service], [Streaming Movies]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Streaming Movies] is null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Streaming Movies] = 'No'
WHERE [Streaming Movies] is Null AND [Internet Service] = 'No'

--Fill null data [Streaming Music]
SELECT [Internet Service], [Streaming Music]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Streaming Music] is null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Streaming Music] = 'No'
WHERE [Streaming Music] is Null AND [Internet Service] = 'No'

--Fill null data [Unlimited Data]
SELECT [Internet Service], [Unlimited Data]
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
WHERE [Unlimited Data] is null

UPDATE PortfolioProjectDemo.dbo.telecom_customer_churn
SET [Unlimited Data] = 'No'
WHERE [Unlimited Data] is Null AND [Internet Service] = 'No'



--Number of Depend 
SELECT [Number of Dependents],COUNT([Number of Dependents]) as count
FROM PortfolioProjectDemo.dbo.telecom_customer_churn
GROUP BY [Number of Dependents]
ORDER BY [Number of Dependents]

WITH CTE_NumberOfDependents AS (
    SELECT 
        [Number of Dependents], 
        COUNT([Number of Dependents]) AS Quantity,
		COUNT(CASE WHEN [Customer Status] = 'Churned' THEN 1 END) as ChurnQuantity
    FROM 
        PortfolioProjectDemo.dbo.telecom_customer_churn 
    GROUP BY 
        [Number of Dependents]
)
SELECT *, (CAST(ChurnQuantity as Float)/CAST(Quantity as Float))*100 as ChurnPercentage
FROM CTE_NumberOfDependents
ORDER BY Quantity DESC




/*
Create view
*/
Create View ChurnCustomerData as
Select *
From PortfolioProjectDemo..telecom_customer_churn

