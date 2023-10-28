from robot.api.deco import keyword
import pandas as pd


@keyword("Panda CommonFunction")
def read_webtable_using_panda(webtable_value, colname):
    df = pd.read_html(webtable_value)
    print(df)
    df = df[-1]
    # df.to_csv('table.csv')
    df.to_excel('table.xlsx')
    # data = pd.read_csv("table.csv")
    data = pd.read_excel('table.xlsx')
    # Converting a specific Dataframe
    # column to list using Series.tolist()
    col_list = data[colname].tolist()
    return col_list


@keyword("Get Matching String")
def get_matching_name(string, list_names):
    for name in list_names:
        if string in name:
            return name


@keyword("Get Word Count")
def get_word_count(string, list_names):
    cnt = 0
    for name in list_names:
        if string in name:
            cnt = cnt + 1
    return cnt

    # --------------------UserKeyowrds.py


@keyword("Get Matching String")
def get_matching_name(string, list_names):
    for name in list_names:
        if string in name:
            return name


# list_names = ['Abhi', 'Dixit', 'Dixit10234', 'Pooja', 'Ravi', 'David', 'Rahul']
# get_matching_name('Dixit', list_names)

@keyword("Get Word Count")
def get_word_count(string, list_names):
    cnt = 0
    for name in list_names:
        if string in name:
            cnt = cnt + 1
    return cnt


# ---------------------------------------------------


@keyword("Get Matching String")
def get_matching_name(string, list_names):
    for name in list_names:
        if string in name:
            return name


# list_names = ['Abhi', 'Dixit', 'Dixit10234', 'Pooja', 'Ravi', 'David', 'Rahul']
# get_matching_name('Dixit', list_names)

@keyword("Get Word Count")
def get_word_count(string, list_names):
    cnt = 0
    for name in list_names:
        if string in name:
            cnt = cnt + 1
    return cnt


# Robot
# Test
# case -
#
# validate and check
# the
# box
# IF    ${Element_Count} > 0
#
# FOR    ${index}
# IN
# RANGE
# 1    ${Element_Count + 1}
# ${xpath} = xpath
# creator       ${index}
# Select
# Checkbox     ${xpath}
# END
# END
# Sleep
# 10
# s


@keyword("xpath creator")
def crete_xpath(index):
    xpath = "(//*[text()='Salmon Island'])[" + str(index) + "]//..//td//input"
    return xpath


@keyword("xpath creators")
def crete_xpath(uservalue, index):
    xpath = "(//*[text()='" + uservalue + "'])[" + str(index) + "]//..//td//input"
    return xpath
