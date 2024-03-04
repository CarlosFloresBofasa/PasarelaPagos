function ValidadorTarjeta(e, obj) {
    key = (document.all) ? e.keyCode : e.which;
    if (key < 48 || key > 57) {
        if (key == 8) {
            return true
        }
        else {
            return false;
        }
    }
}

function ValidaCopiarPegarNumericos() {
    var pressedKey = String.fromCharCode(event.keyCode).toLowerCase();
    if (event.ctrlKey && (pressedKey == "c" ||
        pressedKey == "v")) {
        // disable key press porcessing
        event.returnValue = false;
    }
}
function deshabilitarAutocompletado() {
    var inputs = document.getElementsByTagName('input');
    for (var i = 0; i < inputs.length; i++) {
        inputs[i].setAttribute('autocomplete', 'off');
    }
}
function cc_format(value) {
    var v = value.replace(/\s+/g, '').replace(/[^0-9]/gi, '')
    var matches = v.match(/\d{4,16}/g);
    var match = matches && matches[0] || ''
    var parts = []

    for (i = 0, len = match.length; i < len; i += 4) {
        parts.push(match.substring(i, i + 4))
    }

    if (parts.length) {
        return parts.join(' ')
    } else {
        return value
    }
}

function CasteoTarjeta(obj) {
    var numero_tarjeta = obj.value;

    var casteo = cc_format(numero_tarjeta);
    obj.value = casteo;
}

function ValidadorPrecio(e) {
    key = (document.all) ? e.keyCode : e.which;
    if (key < 48 || key > 57) {
        if (key == 8 || key == 46) {
            return true
        }
        else {
            return false;
        }
    }
}