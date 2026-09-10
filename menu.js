document.addEventListener('DOMContentLoaded', function () {
  var toggle = document.getElementById('layout-menu-toggle');
  var menu = document.getElementById('layout-menu');
  var backdrop = document.getElementById('layout-menu-backdrop');
  if (!toggle || !menu) return;

  function openMenu() {
    menu.classList.add('open');
    if (backdrop) backdrop.classList.add('open');
    toggle.setAttribute('aria-expanded', 'true');
  }

  function closeMenu() {
    menu.classList.remove('open');
    if (backdrop) backdrop.classList.remove('open');
    toggle.setAttribute('aria-expanded', 'false');
  }

  toggle.addEventListener('click', function () {
    if (menu.classList.contains('open')) {
      closeMenu();
    } else {
      openMenu();
    }
  });

  if (backdrop) backdrop.addEventListener('click', closeMenu);

  var links = menu.querySelectorAll('a');
  for (var i = 0; i < links.length; i++) {
    links[i].addEventListener('click', closeMenu);
  }
});
