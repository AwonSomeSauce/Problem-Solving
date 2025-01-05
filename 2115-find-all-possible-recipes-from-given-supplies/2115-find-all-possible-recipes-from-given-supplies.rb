# @param {String[]} recipes
# @param {String[][]} ingredients
# @param {String[]} supplies
# @return {String[]}
def find_all_recipes(recipes, ingredients, supplies)
    in_degrees = {}
    dependent_items = {}
    makeable_recipes = []

    supplies.each { |supply| in_degrees[supply] = 0 }
    recipes.each_with_index do |recipe, index|
        in_degrees[recipe] = ingredients[index].length
        ingredients[index].each do |ingredient|
            dependent_items[ingredient] ||= []
            dependent_items[ingredient] << recipe
        end
    end

    until in_degrees.empty?
        in_degrees = in_degrees.sort_by { |_, value| value }.to_h
        item, degrees = in_degrees.first
        break unless degrees.zero?
        dependent_items[item].each { |recipe| in_degrees[recipe] -= 1 } if dependent_items.key?(item)
        makeable_recipes << item if recipes.include?(item)
        in_degrees.delete(item) 
    end

    makeable_recipes
end