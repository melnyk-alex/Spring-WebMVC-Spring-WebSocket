<%--
  Created by IntelliJ IDEA.
  User: human
  Date: 3/20/16
  Time: 12:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index</title>

    <link type="text/css" rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css"/>
</head>
<body>

<div class="container">
    <div class="page-header">
        <h1>WebSocket -> SockJS -> STOMP</h1>
    </div>

    <div class="row">
        <div class="col-md-4">
            <div class="form-group">
                <textarea id="history" cols="30" rows="10" class="form-control"
                          placeholder="Message history here..."></textarea>
            </div>
            <form class="input-group" onsubmit="return sendMessage();">
                <input type="text" id="message" class="form-control" placeholder="Enter message...">
                <div class="input-group-btn">
                    <button class="btn btn-primary" type="submit">
                        <i class="fa fa-envelope"></i> Send
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- BOOTSTRAP -->
<script src="http://code.jquery.com/jquery-2.2.2.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<!-- WEB SOCKET -->
<script src="/res/js/sockjs-client.js"></script>
<script src="/res/js/stomp.js"></script>
<script>
    var socket = new SockJS('http://192.168.1.99:8081/ws');
    var stompClient = Stomp.over(socket);



    stompClient.connect({}, function (frame) {
        stompClient.subscribe('/topic/update-history', function (e) {
            var history = JSON.parse(e.body);

            var historyText = "";

            for (var i in history.messages.reverse()) {
                var message = history.messages[i];

                var ts = new Date(message.timestamp);

                var h = ts.getHours() < 10 ? "0" + ts.getHours() : ts.getHours();
                var m = ts.getMinutes() < 10 ? "0" + ts.getMinutes() : ts.getMinutes();
                var s = ts.getSeconds() < 10 ? "0" + ts.getSeconds() : ts.getSeconds();

                historyText += "[" + h + ":" + m + ":" + s + "]:\n" + message.text + "\n";
            }

            $('#history').val(historyText);

        });

        stompClient.send('/app/update', {}, undefined);
    });

    function sendMessage() {
        var message = $('#message').val();

        if (message.length > 0) {
            stompClient.send("/app/send-message", {}, JSON.stringify({
                text: message
            }));
            $('#message').val("");
        }

        return false;
    }
</script>

</body>
</html>
