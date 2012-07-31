var $alljsDemocodeblocks = $('div.demo_code');
$alljsDemocodeblocks.each(function (i, e) {
    $e = $(e);
    $e.hide();
    var script = $e.find('script');
    script.detach();
    script = script.html();
    $e.append('<pre name="code" class="javascript" cols="40" rows="20">' + script + '</pre>');
    $e.show();

});


var $allcssDemocodeblocks = $('div.demo_css');
$allcssDemocodeblocks.each(function (i, e) {
    $e = $(e);
    $e.hide();
    var style = $e.find('style');
    style.detach();
    style = style.html();
    $e.append('<pre name="code" class="css" cols="40" rows="20">' + style + '</pre>');
    $e.show();

});


var $allhtmlDemocodeblocks = $('div.demo_html');
$allhtmlDemocodeblocks.each(function (i, e) {
    $e = $(e);
    $e.hide();

    var html = $e.html();
    $(html).detach();

    $e.html('<pre name="code" class="xml" cols="40" rows="20">' + html + '</pre>');
    $e.show();
});