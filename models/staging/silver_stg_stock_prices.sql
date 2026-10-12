SELECT
    symbol,
    trading_date,
    open_price,
    high_price,
    low_price,
    close_price,
    volume,

    ROUND(high_price - low_price, 2) AS price_range

FROM {{ source('stock_data', 'bronze_stock_prices') }}