require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true 
    end

end

class Users
    attr_accessor :id, :fname, :lname 
    def self.all
        users_data = QuestionsDatabase.instance.execute("SELECT * FROM users")
        users_data.map { |datum| Users.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']

    end

    def self.find_by_name(f, l)
        person = QuestionsDatabase.instance.execute(<<-SQL, f, l)
        SELECT
            *
        FROM
            users
        WHERE
            fname = ?
            AND
            lname = ?
            SQL
        return Users.new(person[0])
    end
 
    def self.find_by_id(id)
        user_data = QuestionsDatabase.instance.execute( <<-SQL, id: id)
        SELECT
        *
        FROM
        users
        WHERE
        id = :id
        SQL
        
        raise "#{id} not found in db" if user_data.empty?
            user_data.map {|user| Users.new(user)} 
    end
    
    def authored_questions
        Question.find_by_author_id(id)
    end

    def authored_replies
        Replies.find_by_user_id(id)
    end



    

    

end

class Questions
    def self.all
        question = QuestionsDatabase.instance.execute("SELECT * FROM questions")
        question.map { |datum| Questions.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @title = options['title']
        @body = options['body']
        @author_id = options['author_id']
    end

    def self.find_by_id(id)
        user_data = QuestionsDatabase.instance.execute( <<-SQL, id: id)
        SELECT
        *
        FROM
        users
        WHERE
        id = :id
        SQL
        
        raise "#{id} not found in db" if user_data.empty?
            user_data.map {|user| Questions.new(user)} 
    end

    def self.find_by_author_id(author_id)
        author_data = QuestionsDatabase.instance.execute(<<-SQL, author_id)
       SELECT
        * 
       FROM
        questions
       WHERE
        author_id = ?
     SQL
     author_data.map {|author| Questions.new(author)}
    end

    def author 
        Users.found_by_id(author_id)
    end

    def replies 
        Replies.found_by_question_id(id)
    end


end


class QuestionFollows
    def self.all
        follow = QuestionsDatabase.instance.execute("SELECT * FROM question_follows")
        follow.map { |datum| QuestionFollows.new(datum) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']

    end

    def self.find_by_id(id)
        user_data = QuestionsDatabase.instance.execute( <<-SQL, id: id)
        SELECT
        *
        FROM
        users
        WHERE
        id = :id
        SQL
        
        raise "#{id} not found in db" if user_data.empty?
            user_data.map {|user| QuestionFollows.new(user)} 
    end

    def followers_for_question_id(question_id)

    end

end


class Replies
    attr_accessor :id, :question_id
    def self.all
        reply = QuestionsDatabase.instance.execute("SELECT * FROM replies")
        reply.map { |datum| Replies.new(datum) }
    end
    
    def initialize(options)
        @id = options['id']
        @question_id = options['question_id']
        @parent_id = options['parent_id']
        @replier_id = options['replier_id']
    end

    def self.find_by_id(id)
        user_data = QuestionsDatabase.instance.execute( <<-SQL, id: id)
        SELECT
        *
        FROM
        users
        WHERE
        id = :id
        SQL
        
        raise "#{id} not found in db" if user_data.empty?
            user_data.map {|user| Replies.new(user)} 
    end

    def self.found_by_user_id(replier_id)
        users_data = QuestionsDatabase.instance.execute( <<-SQL, replier_id)
        SELECT
            *
        FROM
            replies
        WHERE
            replier_id = ?
        SQL

        users_data.map {|user| Replies.new(user) }
        
    end

    def self.find_by_parent_id(parent_id)
        replies_data = QuestionsDatabase.execute(<<-SQL, parent_reply_id: parent_id)
          SELECT
            replies.*
          FROM
            replies
          WHERE
            replies.parent_reply_id = :parent_reply_id
        SQL
    
        replies_data.map { |reply_data| Reply.new(reply_data) }
    end

    def self.find_by_question_id(question_id)
        users_data = QuestionsDatabase.instance.execute( <<-SQL, question_id)
        SELECT
            *
        FROM
            replies
        WHERE
            question_id = ?
        SQL

        users_data.map {|user| Replies.new(user) }
        
    end

    def author 
        Users.find_by_id(author_id)
    end

    def question
        Questions.find_by_id(question_id)
    end

    def parent_reply
        Replies.find_by_id(parent_id)
    end

    def child_reply
        Replies.find_by_parent_id(id)
    end


end

class QuestionLikes
    def self.all
        like = QuestionsDatabase.instance.execute("SELECT * FROM question_likes")
        like.map { |datum| QuestionLikes.new(datum) }
    end

    def self.find_by_id(id)
        user_data = QuestionsDatabase.instance.execute( <<-SQL, id: id)
        SELECT
        *
        FROM
        users
        WHERE
        id = :id
        SQL
        
        raise "#{id} not found in db" if user_data.empty?
        user_data.map {|user| QuestionLikes.new(user)} 
    end


    def initialize(options)
        @id = options['id']
        @like_id = options['like_id']
        @liker_id = options['liker_id']

    end
    

end


