/**
 * Created by HarryTheOgre on 06.05.2016.
 */

function getZip(path) {
    $.ajax({
        method: "POST",
        url: "getZip/".path
    });
}

function showMoreCompositions(search_request) {
    var dataHTML = $.ajax({
        method: "POST",
        url: '/searchMoreCompositions/' + search_request,
        success: function (dataHTML) {
            $("#NextCompositionsBtn").replaceWith(dataHTML);
        }
    }).responseText;
}

function showMoreAuthors(search_request) {
    var dataHTML = $.ajax({
        method: "POST",
        url: '/searchMoreAuthors/' + search_request,
        success: function (dataHTML) {
            $("#NextAuthorsBtn").replaceWith(dataHTML);
        }
    }).responseText;
}

function loadCompositions(author_id) {
    if ($.trim($("#CompositionsOfAuthorId" + author_id.toString()).html()) == '') {
        var dataHTML = $.ajax({
            method: "POST",
            url: '/loadCompositions/' + author_id,
            success: function (dataHTML) {
                $("#CompositionsOfAuthorId" + author_id.toString()).replaceWith(dataHTML);
            }
        }).responseText;
    }
}