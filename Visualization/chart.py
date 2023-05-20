import pandas as pd
from sqlalchemy import create_engine
import plotly.express as px

if __name__ == '__main__':
    my_conn = create_engine("mysql+mysqldb://root:password@localhost/cs_306")

    query = "SELECT GDP, iso_code,date FROM Yearly_Status ORDER BY date ASC;"

    df = pd.read_sql(query, my_conn)

    fig = px.choropleth(df, locations="iso_code",
                        color="GDP",
                        animation_frame="date")
    fig.show()
    #fig.write_html("ChoroplethMap.html")
