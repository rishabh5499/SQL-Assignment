WITH RankedProducts AS (
    SELECT
        c.CategoryName,
        p.ProductName,
        p.Price,
        ROW_NUMBER() OVER (
            PARTITION BY c.CategoryName
            ORDER BY p.Price DESC
        ) AS rank_num
    FROM Products p
    JOIN Categories c
    ON p.CategoryID = c.CategoryID
)

SELECT CategoryName, ProductName, Price
FROM RankedProducts
WHERE rank_num <= 2;