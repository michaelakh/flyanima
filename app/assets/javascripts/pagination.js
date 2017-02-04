(function ($) {
 
    $.fn.customPaginate = function (options) {
        var paginationContainer = this;
        var itemsToPaginate;
        
        var defaults = {
            itemsPerPage : 20,
            first : "First",
            last : "Last",
        };
        
        var settings = {};
        
        $.extend(settings, defaults, options);
        
        var itemsPerPage = settings.itemsPerPage;
        
        itemsToPaginate = $(settings.itemsToPaginate);
        var numberOfPaginationLinks = Math.ceil((itemsToPaginate.length / itemsPerPage));
        
        $("<ul class='Paginate'></ul>").prependTo(paginationContainer);
        
        paginationContainer.find("ul").append("<li>"+ defaults.first + "</li>"); 
        
        for (var index = 0; index < numberOfPaginationLinks; index++)
        {
            paginationContainer.find("ul").append("<li>"+ (index+1)+ "</li>");       
        }
        
        paginationContainer.find("ul").append("<li>"+ defaults.last + "</li>");
        
        itemsToPaginate.filter(":gt(" + (itemsPerPage - 1) + ")").hide();
        
        paginationContainer.find("ul li").on('click', function()
        {
          var linkNumber = $(this).text();
            
            var itemsToHide = itemsToPaginate.filter(":lt("+ ((linkNumber - 1) * itemsPerPage) + ")" );
            $.merge(itemsToHide, itemsToPaginate.filter(":gt(" + ((linkNumber * itemsPerPage) - 1) + ")"));
            itemsToHide.hide();
            
            var itemsToShow = itemsToPaginate.not(itemsToHide);
            itemsToShow.show();
        });
        
    }

}(jQuery));