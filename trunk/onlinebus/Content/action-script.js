$(function() {
    var currentDate = new Date();
    var year = currentDate.getFullYear();
    var month = currentDate.getMonth();
    var day = currentDate.getDate();
    $("#txtDepartureDate").datepicker({ minDate: new Date(year, month, day) });
    $("#txtReturnDate").datepicker({ minDate: new Date(year, month, day) });
});
$(function() {
    $("button, a", ".button").button();
    $("#Search", ".button").click(function() {
        alert("System searching....");
        return false;
    });
    $("#Login", ".button").click(function() {
        alert("System loging....");
        return false;
    });
});