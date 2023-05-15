import pandas as panda
import mysql.connector
import seaborn as sea
import matplotlib.pyplot as plot

cnx = mysql.connector.connect(
    host="localhost",
    user="root",
    password="Ca2003285",
    database="cs_306"
)
cursor = cnx.cursor()

query1 = "SELECT percentage, date, iso_code FROM Access_To_Electricity"
cursor.execute(query1)
result1 = cursor.fetchall()

query2 = "SELECT GDP, date, iso_code FROM Yearly_Status"
cursor.execute(query2)
result2 = cursor.fetchall()

df1 = panda.DataFrame(result1, columns=['percentage', 'date', 'iso_code'])
df2 = panda.DataFrame(result2, columns=['GDP', 'date', 'iso_code'])

df = panda.merge(df1, df2, on=['iso_code', 'date'])

top_countries = df.groupby('date').apply(lambda x: x.nlargest(10, 'GDP'))

plot.figure(figsize=(10, 8))
sea.scatterplot(x='date', y='percentage', size='GDP', data=df)

plot.title('Access to Electricity vs. Year with GDP as Bubble Size')
plot.xlabel('Year')
plot.ylabel('Access to Electricity (%)')

for line in range(0, top_countries.shape[0]):
    plot.text(top_countries.date.iloc[line], top_countries.percentage.iloc[line],
             top_countries.iso_code.iloc[line], horizontalalignment='left',
             size='medium', color='black', weight='semibold')

plot.show()