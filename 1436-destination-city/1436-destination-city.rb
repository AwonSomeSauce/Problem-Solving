# @param {String[][]} paths
# @return {String}
def dest_city(paths)
    city_connections = paths.to_h
    (city_connections.values - city_connections.keys)[0]
end