Feature:  A locations API that retrieves a list of locations starting with two  characters
  I need to retrieve the list of locations whose names start with two specific characters so that I can populate a typeahead list
  used, amongst other things, on the Point-to-Point schedules page. The list of locations may be filtered to remove so called
  'red flag countries' depending on the brand, which is passed as a parameter

    Scenario Outline:  Retrieve a list of locations whose name begins with  <initial_chars> for a Maersk group brand with SCAC <scac>
      Given that "<initial_chars>" has length of two 
      And "<scac>" is one of 'MAEU','SAFM','MCPU','SEJJ','SEAU'
      When I send a GET request to "/locations"
      Then the response code should be "200"
      And the content type should be "application/json"
      And the response should be an an object called "LocationList"
      And the LocationList should have an array called "Locations"


      Examples: 
      | initial_chars | scac |
      | Fe            | MAEU |
      | Ha            | MAEU |
      | Fe            | SEAU |
      | Lon           | SEAU |

      
