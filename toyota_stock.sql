CREATE TABLE toyota_stock (
    Date DATE,
    Close DECIMAL(10,6),
    High DECIMAL(10,6),
    Low DECIMAL(10,6),
    Open DECIMAL(10,6),
    Volume BIGINT,
    Return DECIMAL(10,6),
    MA_10 DECIMAL(10,6),
    MA_50 DECIMAL(10,6),
    Volatility_10 DECIMAL(10,6),
    Volatility_30 DECIMAL(10,6),
    RSI DECIMAL(10,6),
    MACD DECIMAL(10,6),
    MACD_Signal DECIMAL(10,6)
);

SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';

-- View data
-- Latest 10 records
SELECT * FROM toyota_stock ORDER BY date DESC LIMIT 10;

-- Only important columns
SELECT date, close, volume FROM toyota_stock LIMIT 10;

-- Filter data
SELECT * FROM toyota_stock WHERE close > 150 LIMIT 10;

-- Check structure
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'toyota_stock';

-- Summary stats
SELECT 
    AVG(close), MIN(close), MAX(close),
    AVG(volume)
FROM toyota_stock;
--
-- Remove NULL values
DELETE FROM toyota_stock
WHERE close IS NULL OR volume IS NULL;

-- Remove duplicates
DELETE FROM toyota_stock a
USING toyota_stock b
WHERE a.ctid < b.ctid
AND a.date = b.date;

-- Convert text to proper types (if needed)
ALTER TABLE toyota_stock
ALTER COLUMN close TYPE DECIMAL USING close::DECIMAL;

--
-- Daily return trend
SELECT date, return
FROM toyota_stock
ORDER BY date;

-- Moving average comparison
SELECT date, ma_10, ma_50
FROM toyota_stock;

-- High volatility days
SELECT date, volatility_30
FROM toyota_stock
ORDER BY volatility_30 DESC
LIMIT 10;

--

-- Data for line chart
SELECT date, close FROM toyota_stock ORDER BY date;

-- Data for RSI chart
SELECT date, rsi FROM toyota_stock;

--

-- Feature selection
SELECT close, volume, ma_10, ma_50, rsi
FROM toyota_stock;
--
SELECT date, close
FROM toyota_stock
ORDER BY close DESC
LIMIT 5;
--

