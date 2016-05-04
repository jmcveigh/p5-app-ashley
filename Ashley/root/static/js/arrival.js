$(function () {
	var arrival = new Date(
		$('#arrival > #Y').attr('value'),
		$('#arrival > #M').attr('value') - 1,
		$('#arrival > #D').attr('value'),
		$('#arrival > #h').attr('value'),
		$('#arrival > #m').attr('value'),
		$('#arrival > #s').attr('value')
	);
	
	$('#arrival_countdown').countdown({until: arrival});
});