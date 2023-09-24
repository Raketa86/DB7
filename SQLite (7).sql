import mysql.connector

# Подключение к базе данных
mydb = mysql.connector.connect(
  host="localhost",
  user="yourusername",
  password="yourpassword",
  database="mydatabase"
)

# Создание таблицы Salespeople
mycursor = mydb.cursor()
mycursor.execute("CREATE TABLE Salespeople (id INT PRIMARY KEY, sname VARCHAR(255), city VARCHAR(255), comm DECIMAL(5,2))")

# Создание таблицы Customers
mycursor.execute("CREATE TABLE Customers (id INT PRIMARY KEY, cname VARCHAR(255), city VARCHAR(255), rating INT, id_sp INT, FOREIGN KEY (id_sp) REFERENCES Salespeople(id))")

# Добавление нового продавца
sql = "INSERT INTO Salespeople (id, sname, city, comm) VALUES (%s, %s, %s, %s)"
val = (1, "Иванов", "Москва", 10.5)
mycursor.execute(sql, val)
mydb.commit()
print(mycursor.rowcount, "запись добавлена")

# Обновление информации о продавце
sql = "UPDATE Salespeople SET comm = %s WHERE id = %s"
val = (12.5, 1)
mycursor.execute(sql, val)
mydb.commit()
print(mycursor.rowcount, "запись обновлена")

# Удаление продавца
sql = "DELETE FROM Salespeople WHERE id = %s"
val = (1,)
mycursor.execute(sql, val)
mydb.commit()
print(mycursor.rowcount, "запись удалена")

# Добавление нового заказчика
sql = "INSERT INTO Customers (id, cname, city, rating, id_sp) VALUES (%s, %s, %s, %s, %s)"
val = (1, "Петров", "Санкт-Петербург", 5, 2)
mycursor.execute(sql, val)
mydb.commit()
print(mycursor.rowcount, "запись добавлена")

# Обновление информации о заказчике
sql = "UPDATE Customers SET rating = %s WHERE id = %s"
val = (7, 1)
mycursor.execute(sql, val)
mydb.commit()
print(mycursor.rowcount, "запись обновлена")

# Удаление заказчика
sql = "DELETE FROM Customers WHERE id = %s"
val = (1,)
mycursor.execute(sql, val)
mydb.commit()
print(mycursor.rowcount, "запись удалена")