
require 'rubygems'
require "selenium-webdriver"


$driver = Selenium::WebDriver.for :chrome
wait = Selenium::WebDriver::Wait.new(:timeout => 10)
class CommonFunctions
  def adminLogin
      $driver.navigate.to "http://phptravels.net/admin"
      $driver.find_element(:xpath,"//input[@name='email']").send_keys("admin@phptravels.com")
      $driver.find_element(:xpath,"//input[@name='password']").send_keys("demoadmin")
      $driver.find_element(:xpath,"//ins[@class='iCheck-helper']").click
      $driver.find_element(:xpath,"//button[@class='btn-lg btn btn-primary btn-block ladda-button fadeIn animated']").click
  end
  
  def userLogin
      $driver.navigate.to "http://phptravels.net/login"  
      $driver.find_element(:xpath,"//input[@name='username']").send_keys("varunreddy@abc.com")
      $driver.find_element(:xpath,"//input[@name='password']").send_keys("password")
      $driver.find_element(:xpath,"//button[@class='btn btn-action btn-block loginbtn']").click
  end
end

#Task1
login = CommonFunctions.new
login.adminLogin

wait.until {$driver.find_element(:xpath,"//i[@class='glyphicon glyphicon-user']")}
$driver.find_element(:xpath,"//i[@class='glyphicon glyphicon-user']").click
sleep(3)
$driver.find_element(:xpath,"//a[.='Customers']").click
$driver.find_element(:xpath,"//button[@class='btn btn-success']").click

$driver.find_element(:xpath,"//input[@name='fname']").send_keys("Varun")
$driver.find_element(:xpath,"//input[@name='lname']").send_keys("Reddy")
$driver.find_element(:xpath,"//input[@name='email']").send_keys("varunreddy@abc.com")
$driver.find_element(:xpath,"//input[@name='password']").send_keys("password")
$driver.find_element(:xpath,"//input[@name='mobile']").send_keys("1234567899")
$driver.find_element(:xpath,"//span[@class='select2-chosen']").click
$driver.find_element(:xpath,"//input[@class='select2-input select2-focused']").send_keys("United States")
$driver.find_element(:xpath,"//input[@class='select2-input select2-focused']").click
$driver.find_element(:xpath,"//span[@class='select2-match']").click
$driver.find_element(:xpath,"//input[@name='address1']").send_keys("2000 Walnut Ave")
$driver.find_element(:xpath,"//input[@name='address2']").send_keys("Fremont CA")
$driver.find_element(:xpath,"//button[@class='btn btn-primary']").click

wait.until {$driver.find_element(:xpath,"//a[.='varunreddy@abc.com']")}
assertion_one = $driver.find_element(:xpath,"//a[.='varunreddy@abc.com']").text

if assertion_one == "varunreddy@abc.com"
  puts 'User successfully created'
else
  puts 'User not created repeat the test'
end

#Task2
wait.until {$driver.find_element(:xpath,"//i[@class='fa fa-suitcase']")}
$driver.find_element(:xpath,"//i[@class='fa fa-suitcase']").click
sleep(3)
$driver.find_element(:xpath,"//a[.=' Add New']").click
sleep(3)
$driver.find_element(:xpath,"//input[@name='tourname']").send_keys("Varuns Tour")
content = File.open('file.txt', 'rb') { |file| file.read }
content_new = content.force_encoding("utf-8")  
$driver.find_element(:xpath,"//iframe[@class='cke_wysiwyg_frame cke_reset']").click
$driver.find_element(:xpath,"//iframe[@class='cke_wysiwyg_frame cke_reset']").send_keys(content_new)
$driver.find_element(:xpath,"//input[@name='maxadult']").send_keys("6")
$driver.find_element(:xpath,"//input[@name='adultprice']").send_keys("60")
$driver.find_element(:id, "child").click
$driver.find_element(:xpath,"//input[@name='maxchild']").send_keys("4")
$driver.find_element(:xpath,"//input[@name='childprice']").send_keys("25")
$driver.find_element(:id, "infantbtn").click
$driver.find_element(:xpath,"//input[@name='maxinfant']").send_keys("2")
$driver.find_element(:xpath,"//input[@name='infantprice']").send_keys("10")
$driver.find_element(:xpath,"//option[@value='4']").click
$driver.find_element(:xpath,"//input[@name='tourdays']").send_keys("3")
$driver.find_element(:xpath,"//input[@name='tournights']").send_keys("3")
$driver.find_element(:id, "s2id_autogen1").click
sleep(5)
$driver.find_element(:xpath,"//input[@class='select2-input select2-focused']").send_keys("Holidays")
$driver.find_element(:xpath,"//div[@class='select2-result-label']").click
$driver.find_element(:xpath,"//option[@value='yes']").click
$driver.find_element(:id, "s2id_autogen3").click
$driver.find_element(:xpath,"//input[@class='select2-input select2-focused']").send_keys("Dubai Investment Park")
sleep(3)
$driver.find_element(:xpath,"//div[@class='select2-result-label']").click
$driver.find_element(:id, "s2id_autogen5").click
$driver.find_element(:xpath,"//input[@class='select2-input select2-focused']").send_keys("Sharjah")
sleep(2)
$driver.find_element(:xpath,"//div[@class='select2-result-label']").click
sleep(2)
$driver.find_element(:id, "s2id_autogen7").click
$driver.find_element(:xpath,"//input[@class='select2-input select2-focused']").send_keys("Ajman")
sleep(2)
$driver.find_element(:xpath,"//div[@class='select2-result-label']").click
sleep(2)
$driver.find_element(:xpath,"//option[@value='fixed']").click
$driver.find_element(:xpath,"//input[@name='depositvalue']").send_keys("10")
$driver.find_element(:xpath,"//option[@value='percentage']").click
$driver.find_element(:xpath,"//input[@name='taxvalue']").send_keys("5")
$driver.find_element(:id, "s2id_autogen23").click
$driver.find_element(:id, "s2id_autogen24").send_keys("Old and New Delhi City Tour")
$driver.find_element(:xpath,"//div[@class='select2-result-label']").click
$driver.find_element(:id, "s2id_autogen23").click
$driver.find_element(:id, "s2id_autogen24").send_keys("Legoland Malaysia Day Pass")
$driver.find_element(:xpath,"//div[@class='select2-result-label']").click
$driver.find_element(:id, "mapaddress").send_keys("Big Bus Tours Dubai - Deira - Dubai - United Arab Emirates")
element_visible = $driver.find_element(:xpath,"//a[.='Inclusions']")
$driver.execute_script('window.scrollTo(0, arguments[0]);', 0)
element_visible.click
$driver.find_element(:xpath,"//ins[@class='iCheck-helper']").click
$driver.find_element(:xpath,"//*[contains(text(), 'Return Ferry Tickets')]").click
$driver.find_element(:xpath,"//*[contains(text(), 'Collision Coverage')]").click
$driver.find_element(:xpath,"//*[contains(text(), 'Snowcat ride')]").click
$driver.find_element(:xpath,"//*[contains(text(), 'Cruise')]").click
$driver.find_element(:xpath,"//*[contains(text(), 'Service fee for tour guide')]").click
$driver.execute_script('window.scrollTo(0, arguments[0]);', 0)
$driver.find_element(:xpath,"//a[.='Exclusions']").click
$driver.find_element(:xpath,"//*[contains(text(), 'Airfare & airport taxes')]").click
$driver.find_element(:xpath,"//*[contains(text(), 'Return Airport Transfer')]").click
$driver.find_element(:xpath,"//*[contains(text(), 'Any optional tours')]").click
$driver.find_element(:xpath,"//*[contains(text(), 'Alcoholic beverages')]").click
$driver.find_element(:xpath,"//*[contains(text(), 'Extra stay pre/post tour')]").click
$driver.find_element(:xpath,"//a[.='Meta Info']").click
$driver.find_element(:xpath,"//input[@name='tourmetatitle']").send_keys("Varun's Tour")
$driver.find_element(:xpath,"//input[@name='tourkeywords']").send_keys("touchpoint; hotseller, Big Bus Tour of Dubai Combo Hop On Hop Off Day Tour + Night Loop, Dubai tour, U.A.E. tour")
metacontent = File.open('metadata.txt', 'rb') { |file| file.read } 
metacontent_new = metacontent.force_encoding("utf-8")
$driver.find_element(:xpath,"//textarea[@name='tourmetadesc']").send_keys(metacontent_new)
$driver.find_element(:xpath,"//a[.='Policy']").click
$driver.find_element(:id, "s2id_autogen25").click
$driver.find_element(:id, "s2id_autogen26").send_keys("Credit Card")
$driver.find_element(:xpath,"//div[@class='select2-result-label']").click
$driver.find_element(:id, "s2id_autogen26").send_keys("Wire Transfer")
$driver.find_element(:xpath,"//div[@class='select2-result-label']").click
$driver.find_element(:id, "s2id_autogen26").send_keys("American Express")
$driver.find_element(:xpath,"//div[@class='select2-result-label']").click
$driver.find_element(:id, "s2id_autogen26").send_keys("Paypal")
$driver.find_element(:xpath,"//div[@class='select2-result-label']").click
$driver.find_element(:id, "s2id_autogen26").send_keys("Master/ Visa Card")
$driver.find_element(:xpath,"//div[@class='select2-result-label']").click
tourprivacy = File.open('tourprivacy.txt', 'rb') { |file| file.read }
tourprivacy_new = tourprivacy.force_encoding("utf-8")
$driver.find_element(:xpath,"//textarea[@name='tourprivacy']").send_keys(tourprivacy_new)
$driver.find_element(:id, "add").click

wait.until {$driver.find_element(:xpath,"//a[.='Varuns Tour']")}
assertion_two = $driver.find_element(:xpath,"//a[.='Varuns Tour']").text

if assertion_two == "Varuns Tour"
  puts 'Tour Successfully Created'
else
  puts 'Tour creation not successful try again'
end

#Task3
login = CommonFunctions.new
login.userLogin
sleep(3)
$driver.navigate.to "http://phptravels.net/tours"
wait.until {$driver.find_element(:xpath,"//input[@name='txtSearch']")}
$driver.find_element(:xpath,"//input[@name='txtSearch']").send_keys("Varuns Tour")
wait.until {$driver.find_element(:xpath,"//a[@class='go-text-right RTL clearfix ng-scope']")}
$driver.find_element(:xpath,"//a[@class='go-text-right RTL clearfix ng-scope']").click
$driver.find_element(:xpath,"//button[@class='btn-primary btn btn-lg btn-block']").click
$driver.find_element(:xpath,"//button[@class='btn btn-block btn-action btn-lg']").click
$driver.find_element(:xpath,"//button[@class='btn btn-action btn-lg btn-block completebook']").click

$driver.quit

