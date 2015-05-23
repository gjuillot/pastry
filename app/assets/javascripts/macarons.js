$("span.parfum").mouseover(function() {
  $("div.macaron").hide();
  $("div#" + this.id).show();
});