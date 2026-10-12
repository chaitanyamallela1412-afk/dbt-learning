SELECT
    symbol,
    trading_date,
    open_price,
    close_price,
    volume,

    ROUND(close_price - open_price, 2) AS price_change,

    ROUND(
        SAFE_DIVIDE(close_price - open_price, open_price) * 100,
        2
    ) AS price_change_pct,

    CASE
        WHEN close_price > open_price THEN 'UP'
        WHEN close_price < open_price THEN 'DOWN'
        ELSE 'NO CHANGE'
    END AS market_trend
FROM {{ ref('silver_stg_stock_prices') }}