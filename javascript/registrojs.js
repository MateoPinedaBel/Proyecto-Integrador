function validarFormulario() {
    const numeroID = document.getElementById("numeroID").value;
    const telefono = document.getElementById("telefono").value;

    if (!/^\d{10}$/.test(numeroID)) {
        alert("El número de identificación debe tener 10 dígitos numéricos.");
        return false;
    }

    if (!/^\d{10}$/.test(telefono)) {
        alert("El número de teléfono debe tener 10 dígitos numéricos.");
        return false;
    }

    return true;
}
