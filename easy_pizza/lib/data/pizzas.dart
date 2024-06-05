import 'package:easy_pizza/models/pizza.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

final List<Pizza> pizzas = [
  Pizza(id: uuid.v1(), name: "Margherita", price: 6, ingredients: ["Sauce tomate", "Mozzarella", "Basilic frais", "Huile d'olive"], category: Category.veggie),
  Pizza(id: uuid.v1(), name: "Quattro Stagioni", price: 12, ingredients: ["Sauce tomate", "Mozzarella", "Champignons", "Artichauts", "Jambon cuit", "Olives noires"], category: Category.rossa),
  Pizza(id: uuid.v1(), name: "Capricciosa", price: 11, ingredients: ["Sauce tomate", "Mozzarella", "Jambon cuit", "Champignons", "Artichauts", "Olives noires", "Oeuf"], category: Category.rossa),
  Pizza(id: uuid.v1(), name: "Marinara", price: 5, ingredients: ["Sauce tomate", "Aïl", "Origan", "Huile d'olive", "Basilic"], category: Category.veggie),
  Pizza(id: uuid.v1(), name: "Regina", price: 10, ingredients: ["Sauce tomate", "Mozzarella", "Jambon cuit", "Champignons", "Origan", "Huile d'olive"], category: Category.rossa),
  Pizza(id: uuid.v1(), name: "Diavola", price: 10, ingredients: ["Sauce tomate", "Mozzarella", "Salami piquant", "Piments", "Huile pimentée"], category: Category.rossa),
  Pizza(id: uuid.v1(), name: "Quattro Formaggi", price: 12, ingredients: ["Sauce tomate", "Mozzarella", "Gorgonzola", "Parmigiano Reggiano", "Ricotta"], category: Category.veggie),
  Pizza(id: uuid.v1(), name: "Parma", price: 13, ingredients: ["Sauce tomate", "Mozzarella", "Jambon de Parme", "Roquette", "Copeaux de Parmigiano Reggiano", "Huile d'olive"], category: Category.rossa),
  Pizza(id: uuid.v1(), name: "Bianca", price: 10, ingredients: ["Crème fraîce", "Mozzarella", "Ricotta", "Parmigiano Reggiano", "Huile d'olive", "Romarin"], category: Category.bianca),
  Pizza(id: uuid.v1(), name: "Ortolana", price: 6, ingredients: ["Sauce tomate", "Mozzarella", "Aubergines", "Courgettes", "Poivrons", "Oignons"], category: Category.veggie),
];