$(document).ready(function () {
   

    function DateNow() {
        var currentdate = new Date();
        var datetime = 
            + currentdate.getHours() + ":"
            + currentdate.getMinutes();
        return datetime;
    }

    $('.myclass').each(function (index, elem) {
        $(elem).click(function () {
            $.ajax({
                data: { "Iid": $(this).data("id") },
                type: "POST",
                url: "/Messages/returnMessages",
                success: function (data) {
                    $('#messageContent').html(data);
                },
                fail: function (data) { alert("-"); }
            });


        });
    });

    //$('.myclass').click(function () {
    //    cdata = $(this).data("id");

    //    $.ajax({
    //        data: {
    //            "id": id,
    //            "cdata": Iid
    //        },
    //        type: "POST",
    //        url: "/Messages/returnMessages",
    //        success: function (data) {
    //            alert("+");
    //        },
    //        fail: function (data) { alert("-");}
    //    });

    /*id, */
    //});

    var connect = $.connection.chatHub;
    connect.client.SendMessage = function (message) {
        $("#MessageBox").append('<div class="w-100"><div class="message-his w-100 d-inline-block"><p class="margin-bottom-none message-his-color">' + message + '</p></div><p class="date-time">' + DateNow() + '</p></div >');
    };

    $.connection.hub.start().done(function () {
        connect.server.connect();
        $('#SendMessage').click(function () {
            var id = $('#SelectedChat').data('selectedchat');
                
            if (id == undefined) {
                alert('lalka');
                return;
            }
           // куда то там вставить cdata;
            // id - твоя учетка, cdata - с кем общаешься. не уверена что будет работать но мозг сейчас вообще не работает не будет работать
            var message = $('#MessageArea').val();
            $("#MessageBox").append('<div class="w-100"><div class="message-my w-100 d-inline-block"><p class="margin-bottom-none message-my-color">' + message + '</p></div><p class="date-time message-my">' + DateNow() + '</p></div>');
            //я отошла на пару мин
            connect.server.send(id, message);
            $('#MessageArea').val("");
        });
    });

});