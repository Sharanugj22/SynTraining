# import os
# import random
# import time
# from selenium import webdriver
# from selenium.webdriver import ActionChains
# from selenium.webdriver.chrome.options import Options
# from selenium.webdriver.common.by import By
# from selenium.webdriver.support.ui import Select
#
# location=os.getcwd()
# r_options = Options()
# r_options.add_experimental_option('detach', True)
# driver = webdriver.Chrome(options=r_options)
# driver.get("http://secure.smartbearsoftware.com/samples/TestComplete11/WebOrders/Login.aspx")
# driver.maximize_window()
# driver.find_element(By.NAME ,"ctl00$MainContent$username").send_keys("Tester")
# driver.find_element(By.NAME,"ctl00$MainContent$password").send_keys("test")
# driver.find_element(By.NAME,"ctl00$MainContent$login_button").click()
# driver.find_element(By.LINK_TEXT , "Order")
# driver.find_element(By.NAME, "ctl00$MainContent$fmwOrder$txtQuantity").send_keys(2)
# randrandom.randrange(1,100)
#         ${Random_string}    Generate random numbers
#
#         input text      XPATH://input[@id='ctl00_MainContent_fmwOrder_txtName']       ${customer_name}+${Random_string}
#         input text      id:ctl00_MainContent_fmwOrder_TextBox2      MG#123
#         input text      name:ctl00$MainContent$fmwOrder$TextBox3       Mumbai
#         input text      name:ctl00$MainContent$fmwOrder$TextBox5        123456
#         select radio button     ctl00$MainContent$fmwOrder$cardList     Visa
# # name = driver.find_element(By.XPATH,"//input[@id='name']")
# # act = ActionChains(driver)
# # name = act.move_to_element(name).click().perform()
# # act.send_keys("12f").perform()
# # time.sleep(2)
#
# #driver.find_element(By.XPATH, "//select[@class='custom-select']").send_keys("Norway")
# #driver.find_element(By.XPATH, "//select[@class='custom-select']/option[2]")
#
# # select=Select(driver.find_element(By.XPATH, "//body/div[1]/div[3]/div[2]"))
# # print(select)
# #
# # sel=Select(driver.find_element(By.XPATH, "//select[@class='custom-select']"))
# # sel.select_by_index(2)
# driver.sa
# #screnshot........
# #driver.save_screenshot(location+"\\ss.png")


def get_name(string, list_names):
    for name in list_names:
        if name.startswith(string):
            return name

# list_names = ['Abhi', 'Dixit', 'Dixit324234', 'Pooja', 'Ravi', 'David', 'Rahul']
#
# get_name('Dixit', list_names)
