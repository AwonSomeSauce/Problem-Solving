# @param {String} path
# @return {String}
def simplify_path(path)
    directories = path.split('/')
    arr = []

    directories.each do |directory|
        next if directory == '.' || directory.empty?

        if directory == '..'
        arr.pop
        else
        arr.push(directory)
        end
    end

    "/#{arr.join('/')}"
end