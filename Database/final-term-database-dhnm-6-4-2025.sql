-- Tạo cơ sở dữ liệu
CREATE DATABASE FinalTerm;

-- Bảng owners
CREATE TABLE owners (
    ownerid SERIAL PRIMARY KEY,
    ownerfirstname VARCHAR(50) NOT NULL,
    ownerlastname VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    pass_hash VARCHAR(255) NOT NULL,
    dob DATE,
    cccd VARCHAR(20),
    CONSTRAINT uk_owners_email UNIQUE (email),
    CONSTRAINT uk_owners_phone UNIQUE (phone),
    CONSTRAINT uk_owners_cccd UNIQUE (cccd)
);

-- Bảng restaurants
CREATE TABLE restaurants (
    restid SERIAL PRIMARY KEY,
    restname VARCHAR(50) NOT NULL,
    restaddress VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    restdescription TEXT,
    ownerid INT NOT NULL,
    CONSTRAINT uk_restaurants_email UNIQUE (email),
    CONSTRAINT uk_restaurants_phone UNIQUE (phone),
    CONSTRAINT fk_restaurants_owner FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

-- Bảng menuitem
CREATE TABLE menuitem (
    itemid SERIAL PRIMARY KEY,
    itemname VARCHAR(50) NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    isavailable BOOLEAN NOT NULL DEFAULT TRUE,
    restid INT NOT NULL,
    CONSTRAINT ck_menuitem_price CHECK (price > 0),
    CONSTRAINT fk_menuitem_restaurant FOREIGN KEY (restid) REFERENCES restaurants(restid)
);

-- Bảng customers
CREATE TABLE customers (
    custid SERIAL PRIMARY KEY,
    custfirstname VARCHAR(50) NOT NULL,
    custlastname VARCHAR(50) NOT NULL,
    custaddress VARCHAR(100),
    email VARCHAR(50) NOT NULL,
    gender CHAR(1),
    phone VARCHAR(20) NOT NULL,
    dob DATE,
    pass_hash VARCHAR(255),
    CONSTRAINT uk_customers_email UNIQUE (email),
    CONSTRAINT uk_customers_phone UNIQUE (phone),
    CONSTRAINT ck_customers_gender CHECK (gender IN ('M', 'F', 'O'))
);

-- Bảng staffs
CREATE TABLE staffs (
    staffid SERIAL PRIMARY KEY,
    stafffirstname VARCHAR(50) NOT NULL,
    stafflastname VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    cccd VARCHAR(20) NOT NULL,
    dob DATE NOT NULL,
    phone VARCHAR(20) NOT NULL,
    restid INT NOT NULL,
    pass_hash VARCHAR(255) NOT NULL,
    CONSTRAINT uk_staffs_cccd UNIQUE (cccd),
    CONSTRAINT uk_staffs_phone UNIQUE (phone),
    CONSTRAINT ck_staffs_gender CHECK (gender IN ('M', 'F', 'O')),
    CONSTRAINT fk_staffs_restaurant FOREIGN KEY (restid) REFERENCES restaurants(restid)
);

-- Bảng shippers
CREATE TABLE shippers (
    shipid SERIAL PRIMARY KEY,
    shipfirstname VARCHAR(50) NOT NULL,
    shiplastname VARCHAR(50) NOT NULL,
    gender CHAR(1) NOT NULL,
    cccd VARCHAR(20) NOT NULL,
    dob DATE NOT NULL,
    phone VARCHAR(20) NOT NULL,
    restid INT NOT NULL,
    pass_hash VARCHAR(255) NOT NULL,
    CONSTRAINT uk_shippers_cccd UNIQUE (cccd),
    CONSTRAINT uk_shippers_phone UNIQUE (phone),
    CONSTRAINT ck_shippers_gender CHECK (gender IN ('M', 'F', 'O')),
    CONSTRAINT fk_shippers_restaurant FOREIGN KEY (restid) REFERENCES restaurants(restid)
);

-- Bảng orders
CREATE TABLE orders (
    orderid SERIAL PRIMARY KEY,
    order_timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    totalamount NUMERIC(10,2) NOT NULL,
    finalTotal NUMERIC(10,2),
    destination VARCHAR(100) NOT NULL,
    custid INT NOT NULL,
    staffid INT NOT NULL,
    shipid INT,
    status VARCHAR(20),
    order_type CHAR(7),
    CONSTRAINT ck_orders_totalamount CHECK (totalamount > 0),
    CONSTRAINT ck_orders_finalTotal CHECK (finalTotal >= 0),
    CONSTRAINT ck_orders_status CHECK (status IN ('pending', 'processing', 'waiting_for_delivery', 'shipped', 'delivered', 'cancelled', 'failed', 'offline') OR status IS NULL),
    CONSTRAINT ck_orders_type CHECK (order_type IN ('online', 'offline')),
    CONSTRAINT fk_orders_customer FOREIGN KEY (custid) REFERENCES customers(custid),
    CONSTRAINT fk_orders_staff FOREIGN KEY (staffid) REFERENCES staffs(staffid),
    CONSTRAINT fk_orders_shipper FOREIGN KEY (shipid) REFERENCES shippers(shipid)
);

-- Bảng payments
CREATE TABLE payments (
    payid SERIAL PRIMARY KEY,
    orderid INT NOT NULL,
    paytime TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    method VARCHAR(50) NOT NULL,
    amount NUMERIC(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    transaction_id VARCHAR(100),
    CONSTRAINT ck_payments_amount CHECK (amount > 0),
    CONSTRAINT ck_payments_status CHECK (status IN ('pending', 'completed', 'failed', 'refunded')),
    CONSTRAINT fk_payments_order FOREIGN KEY (orderid) REFERENCES orders(orderid)
);

-- Bảng orderlines
CREATE TABLE orderlines (
    orlid SERIAL PRIMARY KEY,
    orderid INT NOT NULL,
    itemid INT NOT NULL,
    quantity INT NOT NULL,
    price_at_purchase NUMERIC(10,2) NOT NULL,
    CONSTRAINT ck_orderlines_quantity CHECK (quantity > 0),
    CONSTRAINT ck_orderlines_price CHECK (price_at_purchase > 0),
    CONSTRAINT fk_orderlines_order FOREIGN KEY (orderid) REFERENCES orders(orderid),
    CONSTRAINT fk_orderlines_item FOREIGN KEY (itemid) REFERENCES menuitem(itemid),
    CONSTRAINT uk_orderlines_order_item UNIQUE (orderid, itemid)
);

-- Bảng vouchers
CREATE TABLE vouchers (
    voucherid SERIAL PRIMARY KEY,
    code VARCHAR(20) NOT NULL,
    discount NUMERIC(5,2) NOT NULL,
    startdate TIMESTAMP NOT NULL,
    enddate TIMESTAMP NOT NULL,
    max_usage INT,
    current_usage INT DEFAULT 0,
    min_order_value NUMERIC(10,2) DEFAULT 0,
    CONSTRAINT uk_vouchers_code UNIQUE (code),
    CONSTRAINT ck_vouchers_discount CHECK (discount > 0 AND discount <= 100),
    CONSTRAINT ck_vouchers_dates CHECK (enddate > startdate)
);

-- Bảng voucher_usage
CREATE TABLE voucher_usage (
    usageid SERIAL PRIMARY KEY,
    voucherid INT NOT NULL,
    orderid INT NOT NULL,
    discount_applied NUMERIC(10,2) NOT NULL,
    CONSTRAINT fk_voucher_usage_voucher FOREIGN KEY (voucherid) REFERENCES vouchers(voucherid),
    CONSTRAINT fk_voucher_usage_order FOREIGN KEY (orderid) REFERENCES orders(orderid)
);

-- Bảng reviews
CREATE TABLE reviews (
    reviewid SERIAL PRIMARY KEY,
    orderid INT NOT NULL,
    itemid INT NOT NULL,
    custid INT NOT NULL,
    rating INT NOT NULL,
    comment TEXT,
    review_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT ck_reviews_rating CHECK (rating BETWEEN 1 AND 5),
    CONSTRAINT fk_reviews_order FOREIGN KEY (orderid) REFERENCES orders(orderid),
    CONSTRAINT fk_reviews_item FOREIGN KEY (itemid) REFERENCES menuitem(itemid),
    CONSTRAINT fk_reviews_customer FOREIGN KEY (custid) REFERENCES customers(custid),
    CONSTRAINT uk_reviews_order_item_customer UNIQUE (orderid, itemid, custid)
);

-- Bảng order_status_history
CREATE TABLE order_status_history (
    historyid SERIAL PRIMARY KEY,
    orderid INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    changed_by INT,
    CONSTRAINT fk_order_status_history_order FOREIGN KEY (orderid) REFERENCES orders(orderid),
    CONSTRAINT fk_order_status_history_staff FOREIGN KEY (changed_by) REFERENCES staffs(staffid)
);



-- Tạo các index để tối ưu hóa hiệu suất
CREATE INDEX idx_restaurants_restname ON restaurants (restname);
CREATE INDEX idx_restaurants_restaddress ON restaurants (restaddress);
CREATE INDEX idx_menuitem_restid ON menuitem (restid);
CREATE INDEX idx_menuitem_price ON menuitem (price);
CREATE INDEX idx_orders_custid ON orders (custid);
CREATE INDEX idx_orders_status ON orders (status);
CREATE INDEX idx_orders_order_timestamp ON orders (order_timestamp);
CREATE INDEX idx_orderlines_itemid ON orderlines (itemid);
CREATE INDEX idx_payments_paytime ON payments (paytime);
CREATE INDEX idx_payments_status ON payments (status);
CREATE INDEX idx_reviews_custid ON reviews (custid);
CREATE INDEX idx_reviews_rating ON reviews (rating);
CREATE INDEX idx_order_status_history_status ON order_status_history (status);
CREATE INDEX idx_order_status_history_changed_at ON order_status_history (changed_at);
CREATE INDEX idx_vouchers_code ON vouchers (code);


-- Trigger để tự động gán finalTotal = totalamount nếu không có voucher
CREATE OR REPLACE FUNCTION set_final_total()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM voucher_usage WHERE orderid = NEW.orderid) THEN
        NEW.finalTotal = NEW.totalamount;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_set_final_total
BEFORE INSERT OR UPDATE ON orders
FOR EACH ROW
EXECUTE FUNCTION set_final_total();