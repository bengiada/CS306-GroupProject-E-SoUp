import pandas as pd
from sqlalchemy import create_engine
import plotly.express as px
import kaleido


if __name__ == '__main__':


    my_conn = create_engine("mysql+mysqldb://root:password@localhost/cs_306")

    query = "SELECT * FROM Energy_Production NATURAL JOIN Countries WHERE date = 2020 ORDER by total_production DESC LIMIT 20"

    df = pd.read_sql(query, my_conn)
    df = df.sort_values('date', ascending=True)

    df = pd.melt(df, id_vars=['iso_code','total_production','name'], value_vars=['nuclear','fossil','renewable'], var_name='productiontype', value_name='production')

    fig = px.treemap(df, path=['name','productiontype'], values='production',
                     color='productiontype', hover_data=['iso_code', 'production','name'],
                     title="Energy Production by Source in 2020"

                     )
    fig.show()

    fig.write_html("EnergyProductionTreeMap.html")


