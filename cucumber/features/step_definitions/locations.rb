require 'net/http'
require 'json'



Given(/^that "([^"]*)" has length of two$/) do |arg1|
  arg1.length.should == 2
  @location_name_prefix = arg1
end

Given(/^"([^"]*)" is one of 'MAEU','SAFM','MCPU','SEJJ','SEAU'$/) do |arg1|
#  arg1.should == 'MAEU' or arg1.should == 'SAFM' or  arg1.should == 'MCPU' or arg1.should or 'SEJJ' or  arg1.should == 'SEAU'
  expect(arg1).to eq('MAEU').or eq('SAFM').or eq('MCPU').or eq('SEJJ').or eq('SEAU')
  @scac = arg1
end

#When(/^I send a GET request to \/locations\?LocationNamePrefix=<Fe>SCAC=<<brand>>$/) do
 #  uri = URI('http://www.google.co.uk')

#end

When(/^I send a GET request to "([^"]*)"$/) do |arg1|
  uri = URI('https://private-4af26-locations15.apiary-mock.com/locations/')
  params = {:LocationNamePrefix => @location_name_prefix, :SCAC => @scac}
  uri.query = URI.encode_www_form(params)
  @res = Net::HTTP.get_response(uri)

end

Then(/^the response code should be "([^"]*)"$/) do |arg1|
  @res.code.should == arg1
end

Then(/^the content type should be "([^"]*)"$/) do |arg1|
 @content_type = @res.get_fields('Content-Type')[0]
 @content_type.should ==  arg1
end

Then(/^the response should be an an object called "([^"]*)"$/) do |arg1|
  @parsed_response = JSON.parse(@res.body)
  @parsed_response.keys.length.should == 1
  @parsed_response.keys[0].should == 'LocationList'
end


Then(/^the LocationList should have an array called "([^"]*)"$/) do |arg1|
   @parsed_response["LocationList"].keys.length.should == 1
   @parsed_response["LocationList"].keys[0].should == 'Locations'
end

#Then(/^the Locations array should be objects with elements "([^"]*)", "([^"]*)", and "([^"]*)"$/) do |arg1, arg2, arg3|
 # args = [arg1,arg2,arg3]
  #locations = @parsed_response["LocationList"]["Locations"]
#  locations.each do |location| 
 #   location_keys = location.keys
  #  expect(args).to include()
#  end
  
#end


