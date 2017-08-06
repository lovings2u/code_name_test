App.notifications = App.cable.subscriptions.create("NotificationsChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    $("#alert").prepend(data.html).fadeOut();
    console.log(data);
  }
});

// ---
