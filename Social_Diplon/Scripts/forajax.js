function OnFailureReg(request, error) {
    alert('Произошла ошибка сервера. Попробуйте позже');
}
function OnSuccessReg(data) {
    if (data.IsSuccess) {
        window.location.href = '/RegistrationAndLogin/test'
    }
    else {
        alert('Данный логин уже занят. Выберите другой');
    }
}
function OnFailureLog(request, error) {
    alert('Произошла ошибка сервера. Попробуйте позже');
}
function OnSuccessLog(data) {
    if (data.IsSuccess) {
        window.location.href = '/Profil/YourselfProfil'
    }
    else {
        alert('Логин или пароль введены неверно');
    }
}