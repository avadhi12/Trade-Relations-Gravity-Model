import numpy as np
import pandas as pd

reqd_cols = ['year', 'iso3_o', 'iso3_d', 'contig', 'distcap', 'comlang_off', 'gdp_o', 'gdp_d', 'tradeflow_comtrade_o', 'tradeflow_comtrade_d', 'tradeflow_baci', 'tradeflow_imf_o', 'tradeflow_imf_d']

data = pd.read_csv('data.csv', usecols=reqd_cols)

reqd_countries = ['AUS', 'BRN', 'KHM', 'CHN', 'IND', 'IDN', 'JPN', 'LAO', 'MYS', 'MMR', 'NZL', 'PHL', 'SGP', 'KOR', 'THA', 'VNM']

data_final = data.loc[(2000 <= data.year) & (data.year <= 2020) & data.iso3_o.isin(reqd_countries) & data.iso3_d.isin(reqd_countries) & (data.iso3_o != data.iso3_d)]

country_to_full = {
    'AUS': 'Australia',
    'BRN': 'Brunei',
    'KHM': 'Cambodia',
    'CHN': 'China',
    'IND': 'India',
    'IDN': 'Indonesia',
    'JPN': 'Japan',
    'LAO': 'Laos',
    'MYS': 'Malaysia',
    'MMR': 'Myanmar',
    'NZL': 'New Zealand',
    'PHL': 'Philippines',
    'SGP': 'Singapore',
    'KOR': 'South Korea',
    'THA': 'Thailand',
    'VNM': 'Vietnam',
}

data_final.loc[:, 'iso3_o_full'] = [country_to_full[country] for country in data_final.iso3_o]
data_final.loc[:, 'iso3_d_full'] = [country_to_full[country] for country in data_final.iso3_d]

print(data_final.isnull().sum())

data_final.to_csv('data_final.csv', index=False)
