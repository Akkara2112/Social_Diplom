
$(function () {

    $(document).ready(function () {
        check_pas();
    });

    var RegFormSend = false;

    function check_pas() {
        console.log($(".errorpas")[0]);
        console.log($("#PasswordInField").val().length);
        if ($("#PasswordInField").val().length >= 4) {
            if ($("#PasswordConfirmField").val() != $("#PasswordInField").val()) {
                $("#PasswordConfirmDiv").append("<label class='errorpas'>Пароли не совпадают</label>");
                RegFormSend = false;
            }
            else {

                RegFormSend = true;
            }
        }
    }


    $("#registation").click(function () {
        $("#reg-field").removeClass("collapse");
        $("#ProfessionsImg").addClass("collapse");
        $("#registation").prop("disabled", true);
        $("#LoginField").val("");
        $("#PasswordField").val("");
    });

    /*$("#RegistrationServer").click(function () {
        $.get({
            url: 'RegistrationAndLogin/CheckLogin',
            success: function (result) {
                alert(result);
            }
        });
    });*/

    //$("#RegistrationServer").click(function () {
    //    $("#reg-field").removeClass("collapse");
    //    $("#ProfessionsImg").addClass("collapse");
    //    if (!RegFormSend) {
    //        //alert("hhhh`");
    //    }
    //    else {

    //    }
    //});

    $("#PasswordConfirmField").change(function () {
        check_pas();
    });

    //$("#formIn").validate({
    //    rules: {
    //        LoginField: {
    //            required: true,
    //        },
    //        PasswordField: {
    //            required: true,
    //        }
    //    },

    //    messages: {
    //        LoginField: {
    //            required: "Введите логин",
    //        },
    //        PasswordField: {
    //            required: "Введите пароль",
    //        }
    //    }
    //});

    $("#UploadImage").change(function () {
        $("form[action='/Profil/UpdateUserAvatar']").submit();
    });

    $("#RegistrationForm").submit(function () {
        if ($(this).valid()) {
            var name = $("#LoginInField").val();
            var pass = $("#PasswordInField").val();
            var LastName = $("#LastNameField").val();
            var FirstName = $("#FirstNameField").val();
            var FatherName = $("#FathertNameField").val();
            var City = $("#exampleFormControlSelect2").val();// нет а теперь подожди
            var BirthDate = $("#example-date-input").val();
            var Sex = $(".registation-radio:checked").val();
            var Status = $("#Status").val();
            var AboutYourself = $("#AboutYourself").val();

            $.ajax({
                data: {
                    'LoginField': name, 'PasswordInField': pass, 'LastNameField': LastName,
                    'FirstNameField': FirstName, 'FathertNameField': FatherName, 'testSomeSelector': City, 'testSomeDate': BirthDate,
                    'optionsRadios': Sex, 'testSomeText1': Status, 'testSomeText2': AboutYourself
                },
                type: "POST",
                url: "/RegistrationAndLogin/Registration",
                success: function (data) {
                    if (data.IsSuccess) {
                        window.location.href = '/Tests/TestList';
                    }
                    else {
                        alert('Данный логин уже занят. Выберите другой');
                    }
                },
                fail: function (data, d) {
                    alert(data);
               }

            }); 
            return false;
        }
    });

    $("#RegistrationForm").validate({
        rules: {
            LastNameField: {
                required: true,
                maxlength: 16,
            },

            FirstNameField: {
                required: true,
                maxlength: 16,
            },

            FathertNameField: {
                minlength: 2,
                maxlength: 16,
            },

            LoginField: {
                required: true,
                minlength: 4,
                maxlength: 16,
            },

            PasswordInField: {
                required: true,
                minlength: 4,
                maxlength: 16,
            }
        },

        messages: {
            LastNameField: {
                required: "Поле должно быть заполнено",
                maxlength: "Данное поле не должно содержать более 16 символов",
            },

            FirstNameField: {
                required: "Поле должно быть заполнено",
                maxlength: "Данное поле не должно содержать более 16 символов",
            },

            FathertNameField: {
                minlength: "Данное поле не должно содержать менее 4 символов",
                maxlength: "Данное поле не должно содержать более 16 символов",
            },

            LoginField: {
                required: "Поле должно быть заполнено",
                minlength: "Данное поле не должно содержать менее 4 символов",
                maxlength: "Данное поле не должно содержать более 16 символов",
            },

            PasswordInField: {
                required: "Поле должно быть заполнено",
                minlength: "Данное поле не должно содержать менее 4 символов",
                maxlength: "Данное поле не должно содержать более 16 символов",
            },
        },

    });


    //$("#RegistrationServer").click(function (e) {
    //    alert("FFFFF");
    //    //e.preventDefault();
    //    $("#RegistrationForm").validate().canselSubmit = true;
    //    if ($("#RegistrationForm").valid()) {
    //        var name = $("#LoginInField").val();
    //        var pass = $("#PasswordInField").val();
    //        var LastName = $("#LastNameField").val();
    //        var FirstName = $("#FirstNameField").val();
    //        var FatherName = $("#FathertNameField").val();
    //        var City = $("#exampleFormControlSelect2").val();// нет а теперь подожди
    //        var BirthDate = $("#example-date-input").val();
    //        var Sex = $(".registation-radio:checked").val();
    //        var Status = $("#Status").val();
    //        var AboutYourself = $("#AboutYourself").val();

    //        //alert(Sex);

    //        // я хз крч

    //       $.ajax({
    //            data: {
    //                'LoginField': name, 'PasswordInField': pass, 'LastNameField': LastName,
    //                'FirstNameField': FirstName, 'FathertNameField': FatherName, 'testSomeSelector': City, 'testSomeDate': BirthDate,
    //                'optionsRadios': Sex, 'testSomeText1': Status, 'testSomeText2': AboutYourself
    //            },
    //            type: "POST",
    //            url: "/RegistrationAndLogin/Registration",
    //            success: function (data) {
    //                if (data.IsSuccess) {
    //                    window.location.href = '/RegistrationAndLogin/test';
    //                }
    //                else {
    //                    alert('Данный логин уже занят. Выберите другой');
    //                }
    //            },
    //            fail: function (data, d) {
    //                alert(data);
    //           }
              
    //        });  

    //        //var req = $.post("/RegistrationAndLogin/Registration", {
    //        //    'LoginField': name, 'PasswordInField': pass, 'LastNameField': LastName,
    //        //    'FirstNameField': FirstName, 'FathertNameField': FatherName, 'testSomeSelector': City, 'testSomeDate': BirthDate,
    //        //    'optionsRadios': Sex, 'testSomeText1': Status, 'testSomeText2': AboutYourself
    //        //}, function (data) {
    //        //    //data = JSON.parse(data);
    //        //    alert("sdfgsd");
    //        //})
    //        //    .done(function (data) {
    //        //        if (data.IsSuccess) {
    //        //            window.location.href = '/RegistrationAndLogin/test';
    //        //        }
    //        //        else {
    //        //            alert('Данный логин уже занят. Выберите другой');
    //        //        }
    //        //        return false;
    //        //    })
    //        //    .fail(function (data) {
                    
    //        //        //alert(data.status);
    //        //        data = JSON.stringify(data);
    //        //        alert(data);
    //        //        // window.location.href = '/RegistrationAndLogin/test';
    //        //        return false;
    //        //    });


    //    }
    //    return false;
    //});


    function LogInImg() {
        $("#reg-field:not(.collapse)").addClass("collapse");
        if ($("#ProfessionsImg").hasClass("collapse")) {
            $("#ProfessionsImg").removeClass("collapse");
            $("#registation").prop("disabled", false);
        };
    }

    $("#LoginField").on('input', LogInImg);
    $("#PasswordField").on('input', LogInImg);

})
