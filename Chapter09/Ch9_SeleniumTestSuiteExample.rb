# ----------------------------------------------------------
#  _________      .__                .__               
# /   _____/ ____ |  |   ____   ____ |__|__ __  _____  
# \_____  \_/ __ \|  | _/ __ \ /    \|  |  |  \/     \ 
# /        \  ___/|  |_\  ___/|   |  \  |  |  /  Y Y  \
#/_______  /\___  >____/\___  >___|  /__|____/|__|_|  /
#        \/     \/          \/     \/               \/ 
# Behavior Driven Development - Test Suite Example
# Mastering Jenkins 
# ----------------------------------------------------------


# -- Define required GEMS
require 'rubygems'
require 'selenium-webdriver'
require 'rspec'

# -----------------------
# Test Suite Definition
# --------------------
describe "ExampleSeleniuTestSuite" do

    # -------------------
    # Test Suite Setup (ALL)
    # ----------------
    attr_reader :selenium_driver    
    before(:all) do

        # -- Defines the Selenium WebDriver details
        @selenium_driver = Selenium::WebDriver.for(
          :remote,
          url: 'http://10.10.33.231:4444/wd/hub',
          desired_capabilities: :chrome) # you can also use :chrome, :safari, etc.
 
    end

    # -------------------
    # Test Case Setup
    # ----------------
    before(:each) do

        # -- Setup browser session (a safe url to start from)
        @selenium_driver.get "http://example.com"

    end

    # -------------------
    # Test Suite TearDown
    # ----------------
    after(:all) do

        # -- Close our Selenium Instance
        @selenium_driver.close
    
    end

    # -------------------
    # Test Case 1
    # ----------------        
    it "can find the right title" do

        @selenium_driver.get "http://www.google.com"
        expect(@selenium_driver.title).to eq('Google')

    end

end

