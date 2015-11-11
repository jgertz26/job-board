var jobList = $(".job-row")

if (jobList.length > 0) {
  $(".show-page-link").on('click', function(event) {
    event.preventDefault();
    window.open(this.href, this.text, "height=700,width=700");
  })
}
