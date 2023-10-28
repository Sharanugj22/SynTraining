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


@keyword("xpath creator")
def crete_xpath(uservalue, index):
    xpath = "(//*[text()='" + uservalue + "'])[" + str(index) + "]//..//td//input"
    return xpath
