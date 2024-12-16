# Yushkin Ilya EFBO-04-22 8 pract

Серверный файл реализован с использованием языка программирования Go. Его можно найти по ссылке: https://github.com/ikenchik/rest_api_pks
Соединение с базой данных реализовано при помощи бибилиотеки pgx.

SQL запрос на создание БД:

CREATE DATABASE product_db;

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    image_url TEXT,
    name VARCHAR(255) NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    description TEXT,
    specifications TEXT,
    quantity INT DEFAULT 0,
    is_favorite BOOLEAN DEFAULT FALSE,
    in_cart BOOLEAN DEFAULT FALSE
);

INSERT INTO products (title, image_url, name, price, description, specifications, quantity) VALUES
('RTX 4060Ti Windforce OC 8G', 'https://cdn1.ozone.ru/s3/multimedia-e/6660780194.jpg', 'RTX 4060Ti Windforce OC 8G', 41540, 'Видеокарта Gigabyte RTX4060 WINDFORCE OC 8GB GDDR6 128-bit DPx2 HDMIx2 2FAN RTL Прогрессивная микроархитектура Ada Lovelace, фирменная технология NVIDIA DLSS 3 и полноценная реализация трасировки лучей Тензорные ядра 4-поколения: прирост производительности с DLSS 3 до 4x (по сравнению с типовой процедурой рендеринга сцены) RT-ядра 3-поколения: 2-кратный прирост производительности на операциях трассировки лучей Графический процессор GeForce RTX 4060 ВидеоОЗУ GDDR6 8 Гбайт, 128-разрядная шина памяти Система охлаждения WINDFORCE Защитная пластина на тыльной стороне печатной платы.', '1', 0),
('RTX 4070 EAGLE OC 12G', 'https://cdn1.ozone.ru/s3/multimedia-1-f/7036023075.jpg', 'RTX 4070 EAGLE OC 12G', 84480, 'Видеокарта GIGABYTE GeForce RTX 4070 Ti EAGLE OC 12GB - это продукт от известного производителя GIGABYTE, который зарекомендовал себя на рынке компьютерной техники. Видеокарта оснащена видеопроцессором NVIDIA GeForce RTX 4070 Ti, который обеспечивает высокую производительность и реалистичное изображение. Техпроцесс составляет 4 нм, что гарантирует высокую скорость обработки данных и низкое энергопотребление. Объем видеопамяти составляет 12 ГБ, что позволяет работать с тяжелыми графическими приложениями и играми. Тип памяти GDDR6X обеспечивает высокую скорость передачи данных и стабильность работы.', '1', 0),
('RTX 4090 Windforce 24G', 'https://avatars.mds.yandex.net/get-mpic/10229228/2a00000190e682a74ff9549f8bf50a7612b6/orig', 'RTX 4090 Windforce 24G', 304920, 'Видеокарта GIGABYTE GeForce RTX 4090 WINDFORCE V2 [GV-N4090WF3V2-24GD] на основе архитектуры NVIDIA Ada Lovelace обеспечивает высокую графическую производительность для работы с программами и запуска игр на ПК. Процессор функционирует с частотой 2230 МГц, которая способна повышаться до значения 2520 МГц в режиме разгона. Видеокарта оснащена 24 ГБ памяти стандарта GDDR6X с пропускной способностью 1008 Гбайт/сек, что обеспечивает быстродействие обработки графических данных.', '1', 0),
('Видеокарта Gigabyte Radeon RX 7600 GAMING OC 8G', 'https://avatars.mds.yandex.net/get-mpic/11225627/2a0000018af87c2c8e082045cc24dd2cdac3/180x240', 'Видеокарта Gigabyte Radeon RX 7600 GAMING OC 8G', 33227, 'Бренд: GIGABYTE Тип поставки: Ret Количество вентиляторов: 3 Цвет: черный Для геймеров: ДА PartNumber/Артикул Производителя: GV-R76GAMING OC-8GD Тип: Видеокарта Длина упаковки (ед): 0.41', 'Бренд: GIGABYTE Тип поставки: Ret Количество вентиляторов: 3 Цвет: черный Для геймеров: ДА PartNumber/Артикул Производителя: GV-R76GAMING OC-8GD Тип: Видеокарта Длина упаковки (ед): 0.41', 0),
('Видеокарта Acer RX7700XT NITRO OC 12GB GDDR6 192bit 3xDP HDMI 2FAN RTL', 'https://avatars.mds.yandex.net/get-mpic/5245452/2a00000192b631bf90280871d2e4c4d9695b/74x100', 'Видеокарта Acer RX7700XT NITRO OC 12GB GDDR6 192bit 3xDP HDMI 2FAN RTL', 47767, 'Эта видеокарта может обеспечить высокую производительность в современных играх и других графических приложениях. Она имеет достаточный объём видеопамяти и широкий интерфейс для подключения нескольких мониторов одновременно. Охлаждение с помощью двух вентиляторов обеспечивает стабильную работу при высоких нагрузках.', '* **Графический процессор:** AMD Radeon RX 7700 XT. * **Объём видеопамяти:** 12 ГБ GDDR6. * **Ширина шины памяти:** 192 бита.', 0);


https://github.com/user-attachments/assets/0890b5e3-3ef2-4eee-9137-6d27ea2f0b4f


https://github.com/user-attachments/assets/cb283470-630a-4997-83bf-9564ee84b0cb




