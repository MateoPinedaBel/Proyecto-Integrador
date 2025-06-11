document.addEventListener("DOMContentLoaded", () => {
    const form = document.querySelector("form");
    form.addEventListener("submit", function (e) {
        e.preventDefault();
        alert("¡Bienvenido al módulo marciano! Tu viaje está a punto de comenzar... 🪐");
    });
});
