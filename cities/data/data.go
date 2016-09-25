package data

import ("database/sql"
	"fmt"
	_ "github.com/lib/pq"
)

type City struct {
	CityGeoId string
	CityName string
	DisplayName string
	AreaGeoId string
	AreaName string
	CountryGeoId string
	CountryName string
	PortIndicator bool
}

var Db *sql.DB
func init () {
	var err error
	Db,err = sql.Open("postgres","user=postgres dbname=poc password=passw0rd sslmode=disable")
	if err != nil {
		panic(err)
	}
}


func RetrieveCitiesByName(name string) []City {
	queryString := fmt.Sprintf("select city_geo_id,city_name,display_name,area_geo_id,area_name,country_geo_id,country_name,port_indicator from cities where city_name like %v ||'%%'","$1")
	fmt.Printf("Query string is : %v\n",queryString)
	fmt.Printf("name is : %s",name)
	stmnt,err := Db.Prepare(queryString)
	fmt.Println("statement created")

	rows,err := stmnt.Query(name)
	if err != nil {
		panic(err)
	}
	cities := make([]City,0)
	for rows.Next() {
		city := City{}
		err := rows.Scan(&city.CityGeoId,
			&city.CityName,
			&city.DisplayName,
			&city.AreaGeoId,
			&city.AreaName,
			&city.CountryGeoId,
			&city.CountryName,
			&city.PortIndicator)
		if err != nil {
			panic(err)
		} 
		cities = append(cities,city)
	}
	return cities
}
