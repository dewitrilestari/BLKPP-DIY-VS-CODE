--1. Tampilkan 10 Global_Sales teratas berdasarkan name, genre, platform
SELECT "Name", "Genre", "Publisher", 
	SUM("Global_Sales (millions_copy)") AS Total_Global_Sales
FROM public.vgsales_clean
GROUP BY "Name", "Genre", "Publisher"
ORDER BY Total_Global_Sales DESC
LIMIT 10;

--2. Tampilkan 10 platfrom yang paling banyak digunakan
SELECT 
    "Platform", 
    COUNT(DISTINCT "Name") AS "Jumlah_Video_Game",
    SUM("Global_Sales (millions_copy)") AS "Total_Global_Sales"
FROM public.vgsales_clean
GROUP BY "Platform"
ORDER BY "Total_Global_Sales" DESC
LIMIT 10;

--3. Tampilkan berapa banyak video game di setiap genre
SELECT 
    "Genre", 
    COUNT(DISTINCT "Name") AS jumlah_judul_game
FROM public.vgsales_clean
GROUP BY "Genre"
ORDER BY jumlah_judul_game DESC;

--4. Tampilkan 10 video game yang terbanyak terjual di wilayah Amerika Utara berdasarkan nama dan genre
SELECT 
    "Name", "Genre", 
    SUM("NA_Sales (millions_copy)") AS total_na_sales
FROM public.vgsales_clean
GROUP BY "Name", "Genre"
ORDER BY total_na_sales DESC
LIMIT 10;

--5. Tampilkan 10 video game yang terbanyak terjual di wilayah Eropa berdasarkan nama dan genre
SELECT 
    "Name", "Genre", 
    SUM("EU_Sales (millions_copy)") AS total_eu_sales
FROM public.vgsales_clean
GROUP BY "Name", "Genre"
ORDER BY total_eu_sales DESC
LIMIT 10;

--6. Tampilkan 10 video game yang terbanyak terjual di wilayah Jepang berdasarkan nama dan genre
SELECT 
    "Name", "Genre", 
    SUM("JP_Sales (millions_copy)") AS total_jp_sales
FROM public.vgsales_clean
GROUP BY "Name", "Genre"
ORDER BY total_jp_sales DESC
LIMIT 10;

--7. Tampilkan 10 teratas dari total video game yang dikeluarkan publisher
SELECT 
    "Publisher", 
    COUNT(DISTINCT "Name") AS total_judul_game
FROM public.vgsales_clean
GROUP BY "Publisher"
ORDER BY total_judul_game DESC
LIMIT 10;

--8. Tampilkan 10 teratas dari penjualan video game di Amerika Utara, Eropa, dan Jepang
SELECT 
    "Name", 
    SUM(
        "Global_Sales (millions_copy)" -
        "Other_Sales (millions_copy)"
    ) AS total_sales_3_region
FROM public.vgsales_clean
GROUP BY "Name"
ORDER BY total_sales_3_region DESC
LIMIT 10;

--9. Tampilkan Global_Sales setiap tahunnya
SELECT 
    "Year", 
    SUM("Global_Sales (millions_copy)") AS total_global_sales
FROM public.vgsales_clean
WHERE "Year" IS NOT NULL
GROUP BY "Year"
ORDER BY total_global_sales DESC;

--10. Tampilkan jumlah video game di setiap genre pada tahun 2008
SELECT 
    "Genre", 
    COUNT(DISTINCT "Name") AS jumlah_judul_game
FROM public.vgsales_clean
WHERE "Year" = 2008
GROUP BY "Genre"
ORDER BY jumlah_judul_game DESC;

--TAMBAHAN MANDIRI
--11. Tampilkan persentase penjualan tiap wilayah terhadap penjualan global
SELECT 
    (SUM("NA_Sales (millions_copy)") * 100.0) / SUM("Global_Sales (millions_copy)") AS persentase_na,
    (SUM("EU_Sales (millions_copy)") * 100.0) / SUM("Global_Sales (millions_copy)") AS persentase_eu,
    (SUM("JP_Sales (millions_copy)") * 100.0) / SUM("Global_Sales (millions_copy)") AS persentase_jp,
    (SUM("Other_Sales (millions_copy)") * 100.0) / SUM("Global_Sales (millions_copy)") AS persentase_other
FROM public.vgsales_clean;

--12. Tampilkan rentang tahun platform tersebut digunakan
SELECT 
    "Platform", 
    MIN("Year") AS tahun_mulai, 
    MAX("Year") AS tahun_berakhir
FROM public.vgsales_clean
WHERE "Year" IS NOT NULL
GROUP BY "Platform"
order BY "tahun_mulai" ASC;
