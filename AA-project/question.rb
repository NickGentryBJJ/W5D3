require_relative "questions_database.rb"

class Question < QuestionsDatabase

attr_accessor :title, :body, :id

    def initialize(options)
        @title = options['title']
        @body = options['body']
        @id = options['id']
    end

    def self.find_by_id(id)
        question_data = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil unless question_data.length > 0
        # Question.new(question_data.first)
        return question_data
    end

    def self.all
        data = QuestionsDatabase.instance.execute('select * from questions')
        data.map { |datum| Question.new(datum)}
    end

    def insert
        raise "#{self} already in database" if self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body)
            INSERT INTO
                questions (title, body)
            VALUES
                (?, ?)
        SQL
        self.id = QuestionsDatabase.instance.last_insert_row_id
    end

    def update
        raise "#{self} not in database" unless self.id
        QuestionsDatabase.instance.execute(<<-SQL, self.id, self.title, self.body)
            UPDATE
                questions
            SET
                id = ?, title = ?, body = ?
            WHERE
                id = ?
        SQL
    end

end
