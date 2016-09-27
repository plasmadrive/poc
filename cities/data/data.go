package data

import ("fmt"
"maersk/poc/types")

type CityDao interface {
	RetrieveCitiesByPrefix(prefix string)  []types.City
}


var daoMap map[string]types.CityDao

func init () {
	daoMap = make(map[string]types.CityDao)
}

func RegisterCityDao(x string,dao types.CityDao) {
	daoMap[x] = dao

}

func RetrieveCitiesByPrefix(PersistenceType string,CityPrefix string) []types.City, error {
	citydao,exists := daoMap[PersistenceType]
	if exists {
		return citydao.RetrieveCitiesByPrefix(CityPrefix), nil
	} else {
		return nil,fmt.Errorf("No dao found for %s",CityPrefix)
	}
}

