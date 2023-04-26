class Users
    attr_accessor :fname, :lname

    def initialize(options)
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.find_by_name(fname, lname)
        users = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
        SELECT
            *
        FROM
            users
        WHERE
            fname = ? AND
            lname = ?
    SQL
    return nil unless id.length > 0

    Users.new(users.first)
    end
end
