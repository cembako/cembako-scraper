require 'whenever'

every :day do
  # runner "MyModel.task_to_run_at_four_thirty_in_the_morning"
  scrape_kemendag
  scrape_ews
end