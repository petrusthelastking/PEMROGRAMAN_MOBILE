// sebelum di perbaiki
// var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
// print(nav);


// sesudah di perbaiki
void main() {
  bool promoActive;

  // Kasus TRUE
  promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print('promoActive=true  -> $nav');   // [Home, Furniture, Plants, Outlet]

  // Kasus FALSE
  promoActive = false;
  nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print('promoActive=false -> $nav');   // [Home, Furniture, Plants]
}
