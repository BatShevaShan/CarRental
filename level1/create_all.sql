CREATE TABLE report
(
  report_id NUMERIC(8) NOT NULL,
  report_returnMode VARCHAR(20) NOT NULL,
  report_isPaid VARCHAR(4) NOT NULL,
  rent_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (report_id),
  PRIMARY KEY (rent_id)
);

CREATE TABLE department
(
  department_id NUMERIC(5) NOT NULL,
  department_name VARCHAR(15) NOT NULL,
  PRIMARY KEY (department_id)
);

CREATE TABLE brand
(
  brand_id NUMERIC(8) NOT NULL,
  brand_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (brand_id)
);

CREATE TABLE area
(
  area_id NUMERIC(3) NOT NULL,
  area_name VARCHAR(20) NOT NULL,
  PRIMARY KEY (area_id)
);

CREATE TABLE Model
(
  model_id NUMERIC(5) NOT NULL,
  model_seats NUMERIC(2) NOT NULL,
  model_color VARCHAR(6) NOT NULL,
  model_price NUMERIC(8,2) NOT NULL,
  model_hasBooster VARCHAR(4) NOT NULL,
  brand_id NUMERIC(8) NOT NULL,
  PRIMARY KEY (model_id),
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

CREATE TABLE city
(
  city_name VARCHAR(20) NOT NULL,
  city_id NUMERIC(3) NOT NULL,
  area_id NUMERIC(3) NOT NULL,
  PRIMARY KEY (city_id),
  FOREIGN KEY (area_id) REFERENCES area(area_id)
);

CREATE TABLE client
(
  client_phonenr VARCHAR(10) NOT NULL,
  client_id NUMERIC(5) NOT NULL,
  client_name VARCHAR(20),
  client_address VARCHAR(25) NOT NULL,
  city_id NUMERIC(3) NOT NULL,
  PRIMARY KEY (client_id),
  FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE agent_rating
(
  agent_id NUMERIC(5) NOT NULL,
  agent_name VARCHAR(20) NOT NULL,
  agent_hireyear NUMERIC(4) NOT NULL,
  agent_salary NUMERIC(8,2) NOT NULL,
  department_id NUMERIC(5) NOT NULL,
  city_id NUMERIC(3) NOT NULL,
  PRIMARY KEY (agent_id),
  FOREIGN KEY (department_id) REFERENCES department(department_id),
  FOREIGN KEY (city_id) REFERENCES city(city_id)
);

CREATE TABLE vehicle
(
  vehicle_licenseNumber NUMERIC(8) NOT NULL,
  model_id NUMERIC(5) NOT NULL,
  PRIMARY KEY (vehicle_licenseNumber),
  FOREIGN KEY (model_id) REFERENCES Model(model_id)
);

CREATE TABLE rent
(
  rent_id NUMERIC(5) NOT NULL,
  rent_beginDate DATE NOT NULL,
  rent_endDate DATE NOT NULL,
  client_id NUMERIC(5) NOT NULL,
  agent_id NUMERIC(5) NOT NULL,
  vehicle_licenseNumber NUMERIC(8) NOT NULL,
  FOREIGN KEY (client_id) REFERENCES client(client_id),
  FOREIGN KEY (agent_id) REFERENCES agent_rating(agent_id),
  FOREIGN KEY (report_id) REFERENCES report(report_id),
  FOREIGN KEY (vehicle_licenseNumber) REFERENCES vehicle(vehicle_licenseNumber)
);
