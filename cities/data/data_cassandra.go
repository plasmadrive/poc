package data



import ("fmt"
"github.com/gocql/gocql"
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
}


