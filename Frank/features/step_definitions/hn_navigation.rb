Then(/^I should see loading indicator$/) do
  check_element_exists "view:'UIActivityIndicatorView' marked:'In progress'"
  wait_until(:timeout => 30, :message => "wait until the web page is fully loaded") {
     element_is_not_hidden("view:'HNTableViewCell' view:'UITableViewCellContentView' view:'UIButton'")
  }

end

Then(/^I should see the list of hn news$/) do
  # Check if there is HNTableViewCell element
  news = frankly_map("view:'HNTableViewCell'", 'tag')
  news.count.should be > 1
  element_is_not_hidden("view:'HNTableViewCell' view:'UITableViewCellContentView' view:'UIButton'").should be_true
  element_is_not_hidden("view:'HNTableViewCell' view:'UITableViewCellContentView' view:'UILabel'").should be_true
end

When(/^I touch the first news$/) do
  touch("tableViewCell first")
end

Then(/^I should see news reader page$/) do
  check_element_exists "view:'UIButton' marked:'backButton2'"
  check_element_exists "view:'_UIToolbarNavigationButton' marked:'SVWebViewControllerBack'"
  check_element_exists "view:'_UIToolbarNavigationButton' marked:'SVWebViewControllerNext'"
  check_element_exists "view:'UIToolbarButton' marked:'Stop'"
  check_element_exists "view:'UIToolbarButton' marked:'Share'"
  element_is_not_hidden("view:'UIWebView'").should be_true
  wait_until(:timeout => 60, :message => "wait until the web page is fully loaded") {
     element_exists("view:'UIToolbarButton' marked:'Refresh'")
  }
end

Given(/^I am on news reader page$/) do
    step "I launch the app"
    step "I should see loading indicator"
    step "I wait for 3 seconds"
    step "I should see the list of hn news"
    step "I touch the first news"
    step "I should see news reader page"
end

When(/^I press the refresh button$/) do
    touch("view:'UIToolbarButton' marked:'Refresh'")
end

Then(/^I should see the news refreshed$/) do
    check_element_exists "view:'UIToolbarButton' marked:'Stop'"
    wait_until(:timeout => 30, :message => "wait until the web page is fully loaded") {
       element_exists("view:'UIToolbarButton' marked:'Refresh'")
    }
end

When(/^I press share button$/) do
    touch("view:'UIToolbarButton' marked:'Share'")
end

Then(/^I should see share window$/) do
    check_element_exists "view:'_UIActivityGroupActivityCell' marked:'Mail'"
    check_element_exists "view:'UILabel' marked:'Mail'"
    check_element_exists "view:'_UIActivityGroupActivityCell' marked:'Add to Reading List'"
    check_element_exists "view:'UILabel' marked:'Add to Reading List'"
    check_element_exists "view:'_UIActivityGroupActivityCell' marked:'Copy'"
    check_element_exists "view:'UILabel' marked:'Copy'"
    check_element_exists "view:'_UIActivityGroupActivityCell' marked:'Open in Safari'"
    check_element_exists "view:'UILabel' marked:'Open in Safari'"
    check_element_exists "view:'_UIActivityGroupActivityCell' marked:'More'"
    check_element_exists "view:'UILabel' marked:'More'"
    check_element_exists "view:'_UIAlertControllerActionView' marked:'Cancel'"
    check_element_exists "view:'UILabel' marked:'Cancel'"
end

When(/^I realised that I don't want to share$/) do
    puts " ... I am still thinking ... "
    sleep(1)
end

Then(/^I click cancel$/) do
    step "I touch \"Cancel\""
end

When(/^I press black rounded button$/) do
    touch "view:'UIButton' marked:'backButton2'"
end

Then(/^I should be in the home page$/) do
    step "I should see the list of hn news"
end
