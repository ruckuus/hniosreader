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

  Scenario:
    Share news -- continue

    When I press share button
    Then I should see share window
    When I realised that I don't want to share
    Then I click cancel

  Scenario:
    Back to the news list -- continue

    When I press black rounded button
    Then I should be in the home page

