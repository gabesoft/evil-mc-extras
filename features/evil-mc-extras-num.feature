Feature: Increment and decrement numbers at cursors
  
  Scenario: The numbers at cursors should be incremented by one from previous
    When I replace the buffer text with "0 0 0 0 0"
    And I press "vgrm"
    And I press "gr+"
    Then I should see:
    """
    0 1 2 3 4
    """ 

  Scenario: The numbers at cursors should be decremented by one from previous
    When I replace the buffer text with "0 0 0 0 0"
    And I press "vgrm"
    And I press "gr-"
    Then I should see:
    """
    0 -1 -2 -3 -4
    """