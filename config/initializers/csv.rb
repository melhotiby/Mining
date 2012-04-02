require 'csv'
class Array
    def to_csv
        if self.first.class.superclass == ActiveRecord::Base
            first_row = self.first.attributes.collect{|c| c[0] }
            CSV.generate do |csv|
                csv << first_row
                self.each do |row|
                    csv << first_row.collect{ |attribute| row[attribute] }
                end
            end
        else
            CSV.generate_line(self, Hash.new)
        end
    end
end
