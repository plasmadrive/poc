package cas



import ("fmt"
"github.com/gocql/gocql"
"maersk/poc/data"
"maerks/poc/types"
)



var cluster *gocql.ClusterConfig

var session *gocql.Session

func init() {
	cluster = gocql.NewCluster("192.168.1.64")
	cluster.Keyspace = "poc"
	var err error
	session,err = cluster.CreateSession()
	if err != nil {
		fmt.Printf("Tried to open a session, but was error %v",err)
		panic(err)
	}
	defer session.Close()
	data.RegisterCityDao("cassandra",CityDaoImpl{})
}



type CityDaoImpl struct {}
func RetrieveCitiesByName(CityDaoImpl) (name string) []types.City {
	queryString := fmt.Sprintf("select city_geo_id,city_name,display_name,area_geo_id,area_name,country_geo_id,country_name,port_indicator from cities where \"prefix\" = $1")
	fmt.Printf("Query string is : %v\n",queryString)
	fmt.Printf("name is : %s",name)
	query := session.Query(queryString,name)
	fmt.Println("query created")
	rows  := query.Iter()
	fmt.Println("Iter created")

	cities := make([]types.City,0)
	city := types.City{}
	for rows.Scan(&city.CityGeoId,
			&city.CityName,
			&city.DisplayName,
			&city.AreaGeoId,
			&city.AreaName,
			&city.CountryGeoId,
			&city.CountryName,
			&city.PortIndicator) {
				cities = append(cities,city)
				city = types.City{}
	}
	return cities
}
