var itemTitle;
var itemID;

function confirmAdd(itemID) {
    this.itemID = itemID;
    var xhttp = new XMLHttpRequest();

    //send HTTP get request via AJAX that is asynchronous to increment cart/itemID
    xhttp.open("GET", "cart/" + itemID, true);
    xhttp.send();
    setTimeout(function() { // wait for 3 secs(2)
        location.reload(); // then reload the page.(3)
    }, 3000);
}
