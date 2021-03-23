$(function(){
	$("#first").click(function(){
		var currentPage = $("#currentPage").text();
		if(currentPage == "1"){
			return false;
		}
		window.location.href = "book?page=1";
	});
	
	$("#previous").click(function(){
		var currentPage = $("#currentPage").text();
		if(currentPage == "1"){
			return false;
		}
		currentPage = parseInt(currentPage);
		currentPage--;
		window.location.href = "book?page="+currentPage;
	});
	
	$("#next").click(function(){
		var currentPage = $("#currentPage").text();
		var pages = $("#pages").text();
		if(currentPage == pages){
			return false;
		}
		currentPage = parseInt(currentPage);
		currentPage++;
		window.location.href = "book?page="+currentPage;
	});
	
	$("#last").click(function(){
		var currentPage = $("#currentPage").text();
		var pages = $("#pages").text();
		if(currentPage == pages){
			return false;
		}
		window.location.href = "book?page="+pages;
	});
})