# mariadb-unique-id

MariaDB 唯一字符串轉換函式<br>
MariaDB Function for Unique ID Conversion

適用於 MariaDB 10.3.39<br>
suitable for MariaDB 10.3.39

## 介紹 / Introduction

將整數 ID 轉換為唯一的字母數字字符串，長度根據輸入 ID 的大小變化。該函式使用預定義的字符集和各種數學運算，為每個輸入 ID 生成獨特且確定的字符串，字符串長度為 3 到 5 字符。適用於 ID 範圍從 1 到 60,466,175。<br>
Convert an integer ID into a unique alphanumeric string, with the length varying based on the input ID. The function uses a predefined character set and various mathematical operations to generate a distinctive and deterministic string for each input ID, with the string length ranging from 3 to 5 characters. Suitable for ID range from 1 to 60,466,175.

## 使用方法 / How to Use

如果想在 `INSERT` 語句中使用 `unique_id` 函數，可以看看下面的範例。這個範例會將新記錄插入到名為 `your_table` 的表格中，並在 `your_target_id` 欄位使用 `unique_id` 函數生成 ID：<br>
If you want to use the `unique_id` function in an `INSERT` statement, you can refer to the example below. This example inserts a new record into a table named `your_table` and uses the `unique_id` function to generate the ID for the `your_target_id` column:

```
INSERT INTO yout_table (your_target_id) 
VALUES (unique_id(LAST_INSERT_ID() + 1));
```
