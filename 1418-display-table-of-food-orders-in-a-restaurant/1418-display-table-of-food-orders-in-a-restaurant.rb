# @param {String[][]} orders
# @return {String[][]}
def display_table(orders)
    table_orders = {}
    menu = []
    table_menu = []

    orders.each do |order|
        table_orders[order[1]] ||= {}
        table_orders[order[1]][order[2]] ||= 0
        table_orders[order[1]][order[2]] += 1
        menu << order[2]
    end

    table_orders = table_orders.sort_by { |key, _| key.to_i }.to_h

    menu.uniq!
    menu.sort!
    menu.unshift('Table')

    table_menu << menu

    table_orders.each do |key, value|
        row = []
        menu.each do |food|
        if food == 'Table'
            row << key
            next
        end

        food_count = value.key?(food) ? value[food] : 0
        row << food_count.to_s
        end
        table_menu << row
    end

    table_menu
end