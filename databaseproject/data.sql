USE pizzadb;

/*
INSERT INTO pizza (name) VALUES ('Prosciutto e funghi');
INSERT INTO pizza (name) VALUES ('Detroit-Style');
INSERT INTO pizza (name) VALUES ('Capricciosa');
INSERT INTO pizza (name) VALUES ('Quattro fromaggi'); # Vegetarian
INSERT INTO pizza (name) VALUES ('Caprese'); # Vegetarian
INSERT INTO pizza (name) VALUES ('Calzone');
INSERT INTO pizza (name) VALUES ('Margherita'); # Vegetarian
INSERT INTO pizza (name) VALUES ('Napoletana'); # Vegetarian
INSERT INTO pizza (name) VALUES ('Diavola');
INSERT INTO pizza (name) VALUES ('Melanzane'); # Vegetarian
INSERT INTO pizza (name) VALUES ('Hawaii');
INSERT INTO pizza (name) VALUES ('Frutti di Mare');
INSERT INTO pizza (name) VALUES ('Tonno');
INSERT INTO pizza (name) VALUES ('Prosciutto');
INSERT INTO pizza (name) VALUES ('Al Pesto');

INSERT INTO drink (name) VALUES ('Fanta');
INSERT INTO drink (name) VALUES ('Cola');
INSERT INTO drink (name) VALUES ('Mineral water');
INSERT INTO drink (name) VALUES ('Jupiler');
INSERT INTO drink (name) VALUES ('Sparkling water');

INSERT INTO dessert (name) VALUES ('Vanilla Ice Cream');
INSERT INTO dessert (name) VALUES ('Chocolate Ice Cream');
INSERT INTO dessert (name) VALUES ('Tiramisu');
INSERT INTO dessert (name) VALUES ('Chocolate Mousse');


INSERT INTO toppings (name, vegetarian, price) VALUES ('Mozzarella', TRUE, 2.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Tomato Sauce', TRUE, 1.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Mushrooms', TRUE, 3.49);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Prosciutto', FALSE, 3.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Cherry Tomatoes', TRUE, 2.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Basilicum', TRUE, 0.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Salami', FALSE, 3.49);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Pork Rinds', FALSE, 3.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Spicy Salami', FALSE, 3.49);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Pepperoncini', TRUE, 1.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Olives', TRUE, 0.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Eggplant', TRUE, 1.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Pineapple', TRUE, 1.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Ham', FALSE, 3.49);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Shrimp', FALSE, 4.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Squid', FALSE, 4.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Mussels', FALSE, 5.49);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Tuna', FALSE, 3.49);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Pesto Genovese', TRUE, 1.99);
*/
INSERT INTO toppings (name, vegetarian, price) VALUES ('Artichoke', TRUE, 2.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Fontina', TRUE, 2.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Grana Padano', TRUE, 1.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Gorgonzola', TRUE, 3.99);
INSERT INTO toppings (name, vegetarian, price) VALUES ('Ricotta', TRUE, 1.99);

INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (16, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (16, 4);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (16, 3);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (16, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (17, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (17, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (17, 7);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (18, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (18, 4);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (18, 3);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (18, 20);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (18, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (18, 11);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (19, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (19, 21);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (19, 22);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (19, 23);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (19, 24);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (19, 5);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (19, 6);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (20, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (20, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (20, 5);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (20, 6);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (21, 5);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (21, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (21, 7);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (21, 24);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (21, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (21, 8);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (22, 5);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (22, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (22, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (22, 6);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (22, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (23, 5);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (23, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (23, 6);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (24, 5);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (24, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (24, 9);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (24, 10);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (24, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (24, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (25, 12);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (25, 6);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (26, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (26, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (26, 13);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (26, 14);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (27, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (27, 15);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (27, 16);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (27, 17);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (28, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (28, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (28, 18);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (29, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (29, 2);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (29, 4);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (29, 6);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (30, 1);
INSERT INTO toppings_to_pizza (pizza_id, toppings_id) VALUES (30, 19);
