# CodeCamp3# Báo cáo Code Camp (Trung Anh, Chương, Hoàng)
- - - -
Hãy thiết kế CSDL quan hệ trên Postgresql để mô hình hoá đủ các thông tin cần thiết để xây dựng web site, web service cung cấp thông tin dạng REST cho ứng dụng di động hiển thị:

1. Danh mục phân loại chủng loại hàng chung: [Quần áo – thời trang, Đồ chơi, Thực phẩm – đồ uống, Đồ gia dụng, Điện tử gia dụng, Di động – tablet, Máy tính – linh kiện – mạng]

2. Danh mục phân loại chủng loại hàng chi tiết: [Quần áo – thời trang: Nam, Nữ, Trẻ con], [Đồ chơi: bé trai, gái, thiếu nhi], [Thực phẩm – đồ uống: ….]….

3. Do có nhiều mặt hàng cùng một loại, có nhiều tính chất chung nhau như:
Tivi các hãng sẽ có thuộc tính: [công nghệ: LED, Plasma, OLED], [màn hình: phẳng, cong], [smart: có kết nối Internet, không], [cổng giao tiếp: HDMI, USB, DNA, Bluetooth, Ethernet, Wifi] Xe máy sẽ có thuộc tính: [loại động cơ: 4 thì, 2 thì], [chuyển động: ga, số, côn tay], [dung tích: xy lanh], [màu sơn: …],….

Tất cả các mặt hàng đều có một số thuộc tính chung: Tên, mã SKU (mã để quản lý trong kho: Stock Keeping Unit, phải là duy nhất để gán mã vạch), mô tả chi tiết, nhà sản xuất, công ty phân phối, ngày sản xuất, thời gian bảo hành, hạn sử dụng, giá gốc nhập, giá bán hiện tại, bảo hành ~ hạn sử dụng.

Cần thiết kế hệ thống bảng để lưu được thông tin chung của mặt hàng và các thông tin đặc thù từng loại mặt hàng.
Các hàng cùng loại có thể so sánh được với nhau. Ví dụ khách hàng muốn so sánh xe Airblade 2014 với Exciter 150.

Cùng loại mặt hàng rõ ràng, nhưng khác một tính chất như màu sắc thì khác giá tiền. Lúc này phải tách ra thành các mã SKU độc lập. Ví dụ iPhone 6 có dung lượng khác nhau: 16G, 32G, 64G. Hoặc Exciter 150 có các màu sơn, tem khác nhau…

4. Nhà sản xuất (khác với nhà phân phối): Honda, Yamaha, Nike, Adidas, Apple, Microsoft, Sony, LG, Samsung….
Nên thiết kế một bảng riêng.
Ở mỗi phân loại chủng loại hàng chung, thường có danh mục các hãng sản xuất phù hợp. Ví dụ: mục quần áo – thời trang nên có Nike, Adidas, Northface… nhưng có thể không có Apple, Microsoft, Sony, LG, Samsung.

5. Ứng dụng có một text box để search. Trong scope của code camp này, giả sử người dùng chỉ tìm kiếm theo tên sản phẩm. Thực tế người dùng sẽ gõ từ khoá tìm kiếm phức tạp dị hơn nhiều. Do đó không thể xài SQL query để truy vấn được đâu.

Một số lưu ý

1. Không phải thuộc tính nào (column) cũng phải có. Sẽ có nhiều thuộc tính là null.
2. Phải thiết kế hệ thống bảng – quan hệ đủ mềm dẻo để việc bảo trì, chỉnh sửa cấu trúc bảng là thấp nhất. Trong Postgresql 9.4 có kiểu dữ liệu JSONB giúp record có thể lưu động các loại thông tin không cần tuân thủ cấu trúc cột (column) cổ điển.
3. Do đề tài codecamp phức tạp, nên hai học viên sẽ cùng làm một bài. Techmaster sẽ cử một lập trình CSDL để trả lời các câu hỏi của các bạn qua chat.
4. Tham khảo tuyển tập các loại Database schema cho nhiều ngành ở đây http://www.databaseanswers.org/data_models/
5. Nên bắt đầu làm càng sớm tốt. Làm trước 1-2 ngày sẽ không kịp đâu.
6. Lịch code camp ngày 25/1/2015 tại số 14 ngõ 4, Nguyễn Đình Chiểu. Thực hành ở phòng lab tầng 1 và tầng 4. Đủ chỗ cho anh em.

Gợi ý các bước làm

1. Thu thập tập dữ liệu mẫu từ các web site thương mại điện tử nổi tiếng để học hỏi họ tổ chức thông tin như thế nào?
2. Vẽ khối lương các bảng đừng quan tâm các trường (cột) chi tiết vội. Chỉ cần xác định được khoá chính (primary key) là ok rồi.
3. Hình dung quan hệ phù hợp giữa các bảng: 1-1, kế thừa, một – nhiều, nhiều – nhiều.
4. Cùng bàn bạc với đồng đội sẽ có chỗ nào chưa ổn.
5. Tạo bảng trên Postgresql viết ra một file schema.sql để còn nộp bài. Mỗi lần sửa thì sửa trên schema.sql sau đó lưu lại. Nhớ DROP TABLE trước CREATE TABLE
6. Tạo dữ liệu mẫu, viết vào một file data.sql. Nên tạo nhiều record đa dạng để sớm phát hiện sai sót, bất cập trong thiết kể bảng. Nhớ nguyên tắc Fail Fast khi làm sản phẩm không các men.
7. Đặt nhiều câu hỏi dạng : What – If, nếu – thì để xem cấu trúc CSDL có bền không. Chỉnh lại schema.sql và data.sql cho đến khi các dữ liệu – quan hệ phù hợp.
8. Viết báo cáo bằng MkDocs
- - - -
## Mô tả phương pháp xử lý chung

EAV hay là thiết kế cho mỗi chủng loại sản phẩm một bảng riêng hay cho thuộc tính đặc thù vào trường jsonb
- - - -
## Các bảng quan hệ

#### Quan hệ Product - Attribute - Value

![Screenshot](img/produc-attribute.png)
- - - -
## Mô tả schema.sql
#### Tạo bảng product_types
```
CREATE TABLE product_types(
  product_type_id SERIAL NOT NULL PRIMARY KEY,
  product_type_name VARCHAR(255)
);

```
#### Tạo bảng products 
```
CREATE TABLE products(
  product_id SERIAL NOT NULL PRIMARY KEY ,
  product_name VARCHAR(250),
  product_type_id INTEGER
);

```
#### Tạo bảng attributes
```
CREATE TABLE attributes(
  attribute_id SERIAL NOT NULL PRIMARY KEY ,
  attribute_name VARCHAR(255),
  attribute_type VARCHAR(255)
);
```
#### Tạo bảng product_type_attribute
```
CREATE TABLE product_type_attribute(
  product_type_id INTEGER,
  attribute_id INTEGER,
  PRIMARY KEY (product_type_id, attribute_id)
);
```
#### Tạo bảng attribute_items
```
CREATE TABLE attribute_items(
  attribute_item_id SERIAL NOT NULL PRIMARY KEY ,
  attribute_id INTEGER,
  attribute_value TEXT
);
```
#### Tạo bảng product_attribute_value
```
CREATE TABLE product_attribute_value(
  product_id INTEGER NOT NULL ,
  attribute_id INTEGER NOT NULL ,
  attribute_item_id INTEGER,
  value_text TEXT,
  PRIMARY KEY (product_id, attribute_id)
);
```
- - - -
## Tạo dữ liệu 
#### Tạo dữ liệu bảng product_types
```
INSERT INTO product_types (product_type_name) VALUES 
  ('Tivi'),
  ('Tu lanh'),
  ('Dien thoai'),
  ('Noi com dien'),
  ('Thoi trang'),
  ('Xe may');
```
#### Tạo dữ liệu bảng attributes
```
INSERT INTO attributes(attribute_name, attribute_type) VALUES 
  ('Size', 'dropdown'),
  ('Resolution', 'dropdown'),
  ('So canh tu', 'dropdown'),
  ('Features', 'text'),
  ('Technology', 'dropdown'),
  ('man hinh', 'dropdown'),
  ('internet', 'dropdown'),
  ('RAM', 'dropdown'),
  ('SKU', 'text'),
  ('NSX', 'text'),
  ('Price', 'text');
```
#### Tạo dữ liệu bảng attribute_items
```
INSERT INTO attribute_items(attribute_id, attribute_value) 
VALUES 
  (1,'32 inch'),
  (1,'40 inch'),
  (2,'720p'),
  (2,'1080p'),
  (3,'2 Canh'),
  (3,'3 Canh'),
  (5,''),
  (5,'plasma'),
  (5,'oled'),
  (6,'phang'),
  (6,'cong'),
  (7,'co'),
  (7,'ko'),
  (8,'16G'),
  (8,'32G'),
  (8,'64G'),
  (5,'Xe ga'),
  (5,'Xe so');  
```
#### Tạo dữ liệu bảng product_type_attribute
```
INSERT INTO product_type_attribute (product_type_id, attribute_id) 
  VALUES 
    (1,1),
    (1,2),
    (1,4),
    (6,5),
    (6,9),
    (6,10),
    (6,11);   
```
#### Tạo dữ liệu bảng products
```
INSERT INTO products (product_name, product_type_id)
    VALUES 
      ('Tivi Samsung', 1),
      ('Tivi LG', 1),
      ('Tivi Sony', 1),
      ('Tu lanh Panasonic', 2),
      ('Tu lanh Yanyo', 2),
      ('Dien thoai IPhone', 3),
      ('Dien thoai Nokio', 3),
      ('NoiComDien HappyCook', 4),
      ('NoiComDien Sony', 4),
      ('Thoi trang Boy', 5),
      ('Thoi trang Girl', 5),
      ('Tivi Sony', 6);
```
#### Tạo dữ liệu bảng product_attribute_value
```
INSERT INTO product_attribute_value 
  (product_id, attribute_id, attribute_item_id, value_text) 
    VALUES 
      (1,1,1,NULL ),
      (1,2,4,NULL ),
      (1,4,NULL ,'Noi dung o day' ),
      (12,5,20,NULL ),
      (12,9,NULL ,'101'),
      (12,10,NULL ,'Honda'),
      (12,11,NULL ,'50000');
```
- - - -

### Thử nghiệm 
- - - - 
Tốc độ

- - - -
## Người làm

Trung Anh, Chương, Hoàng

Copyright (c) 2011-2014 
