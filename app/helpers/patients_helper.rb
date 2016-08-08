module PatientsHelper
    def mr(id)
        "MR" + id.to_s.rjust(6, '0')
    end

    def full_name(first, middle, last)
        last + ", " + first + " " + middle
    end

    def age(date_of_birth)
        now = Time.now.utc.to_date
        now.year - date_of_birth.year - ((now.month > date_of_birth.month || (now.month == date_of_birth.month && now.day >= date_of_birth.day)) ? 0 : 1)
    end
end
