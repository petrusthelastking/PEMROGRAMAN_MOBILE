// sebelum perbaikan
// var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
// print(nav2);

// sesudah perbaikan
void main() {
  String login;

  // login = 'Manager'  -> 'Inventory' muncul
  login = 'Manager';
  var nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  print("login='Manager' -> $nav2"); // [Home, Furniture, Plants, Inventory]

  // login = 'Staff'    -> tidak muncul
  login = 'Staff';
  nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  print("login='Staff'   -> $nav2"); // [Home, Furniture, Plants]

  // login = 'Admin'    -> tidak muncul
  login = 'Admin';
  nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  print("login='Admin'   -> $nav2"); // [Home, Furniture, Plants]
}
