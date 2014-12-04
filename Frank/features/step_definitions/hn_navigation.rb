Then(/^I should see loading indicator$/) do
    check_element_exists "view:'UIActivityIndicatorView' marked:'In progress'"
end

Then(/^I should see the list of hn news$/) do
  element_is_not_hidden("view:'HNTableViewCell'").should be_true
end
