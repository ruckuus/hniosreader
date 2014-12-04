Feature:
  As a hn user
  I want to read hn from my iPhone
  So I can haz updated news from hackers around the world

  Scenario:
    Launch hn iOS app and see the list of news

    Given I launch the app
    Then I should see loading indicator
    When I wait for 3 seconds
    Then I should see the list of hn news

  Scenario:
    Read hn news

    Then I should see the list of hn news
    When I touch the first news
    Then I should see news reader page

  Scenario:
    Refresh the web page -- continue

    When I press the refresh button
    Then I should see the news refreshed

