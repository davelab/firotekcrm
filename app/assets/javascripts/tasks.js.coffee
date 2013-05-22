# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

#set done task with checkbox ajax call
$(document).ready ($) ->
  $("table.tasks td input[type=\"checkbox\"]").each ->
    $(this).change ->
      $.post "tasks/done",
        id: $(this).data("task-id")
        done: $(this).attr("value")

      $(this).parent().parent("tr").fadeOut("fast")
      task_count = $("#tasks_count").html()
      $("#tasks_count").html(task_count-1)
      $("#tasks_count").fadeOut("fast")  if task_count is "1"