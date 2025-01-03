# @param {String[][]} favorite_companies
# @return {Integer[]}
def people_indexes(favorite_companies)
    companies = favorite_companies.flatten.uniq
    company_to_id = {}
    person_to_companies = {}
    cool_people = []

    companies.each_with_index do |company, index|
        company_to_id[company] ||= index
    end

    favorite_companies.each_with_index do |companies, index|
        companies.each do |company|
            person_to_companies[index] ||= []
            person_to_companies[index] << company_to_id[company]
        end
        person_to_companies[index].sort!
    end

    person_to_companies.each do |person_1, companies_1|
        cool_person = true

        person_to_companies.each do |person_2, companies_2|
            next if person_2.eql?(person_1)

            if companies_1.union(companies_2).sort.eql?(companies_2)
                cool_person = false
                break
            end
        end

        cool_people << person_1 if cool_person
    end

    cool_people
end