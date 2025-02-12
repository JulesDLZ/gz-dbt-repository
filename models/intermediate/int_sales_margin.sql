WITH sales_data AS (
    SELECT
        orders_id,
        date_date,
        products_id,
        revenue,
        quantity,
        purchase_price
    FROM {{ ref('stg_gz_raw_data__raw_gz_sales') }}
    LEFT JOIN {{ ref('stg_gz_raw_data__raw_gz_product') }}
    USING (products_id)
)
SELECT
    orders_id,
    date_date,
    products_id,
    revenue,
    quantity,
    purchase_price,
    ROUND((quantity * purchase_price), 2) AS purchase_cost,
    ROUND((revenue - (quantity * purchase_price)), 2) AS margin
FROM sales_data
