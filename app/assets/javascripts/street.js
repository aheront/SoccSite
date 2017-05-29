$(document).on("change", "#country select", function(){
var country = $(this).val();
$.ajax({
  url: "/street/new",
  method: "GET",
  dataType: "json",
  data: {country: country},
  error: function (xhr, status, error) {
  console.error('AJAX Error: ' + status + error);
},
    success: function (response) {
        console.log(response);
        var cities = response["cities"];
        $("#city select").append('<option>Select city</option>');
        for(var i=0; i< cities.length; i++){
            $("#city select").append('<option value="' + cities[i]["id"] + '">' + cities[i]["name"] + '</option>');
        }
    }
});
});
