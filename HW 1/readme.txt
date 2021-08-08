Yingjie Shen
CSCI 585
Homework 1

Foreign keys:
    FK1     STUDENT_NUM
    FK2     INSTRUCTOR_NUM
    FK3     CURR_NUM
    FK4     TEXTBOOK_NUM
    FK5     CLASSRM_NUM
    FK6     JOB_NUM
    FK7     LANG_NUM
    FK8     PROJECT_NUM
    FK9     TABLE_NUM
    FK10    PART_NUM
    FK11    BOOK_NUM

Entity:
    INSTRUCTOR
Atrributes:
    INSTRUCTOR_NUM      Integer     (PK, FK2) instructor id
    INSTRUCTOR_FNAME    String      instructor's first name
    INSTRUCTOR_LNAME    String      instructor's last name
Notes:
    Assume different instructors can have same first name or last name. 
    The primary key of an instructor entity is the instructor id. 
Relations:
    One instructor can teach many sections.
    One instructor can oversee many projects.

Entity:
    JOB
Atrributes:
    JOB_NUM             Integer     (PK) job id
    JOB_TITLE           String      job's title: 'Curriculum instructor' or 'Project supervisor'
    JOB_SALARY          Double      job's hourly rate
Notes:
    A job title contains two types: Curriculum instructor and Project supervisor.
    The primary key of a job entity is the job id.
Relations: 
    One job can be found in one section.
    One job can be found in one projct.

Entity:
    STUDENT         
Atrributes:
    STUDENT_NUM         Integer     (PK, FK1) student id
    STUDENT_FNAME       String      student's first name
    STUDENT_LNAME       String      student's last name
    DEPOSIT             Double      student's deposit at the beginning of the term
Notes:
    Assume different students can have same first name, last name or deposit submission.
    The primary key of a student entity is the student id.
Relations:
    One student can be wirtten in many curriculum enrollment records.
    One student can be wirtten in many projct enrollment records.
    One student can generate many library records.

Entity:   
    CURRICULUM_ENROLLMENT           Bridge Entity
Atrributes:
    STUDENT_NUM         Integer     (PK, FK1) student id
    CURR_NUM            Integer     (PK, FK3) curriculum id
    INSTRUCTOR_RATING   Integer     this student's rating towards the instructor of the curriculum
    CLASS_RATING        Integer     this student's rating towards the curriculum
Notes:
    Assume different curriculum enrollment records consist of differernt students and curricula can have same instructor rating or curriculum rating.
    The primary key of a curriculum enrollment record entity is a composite of student id and curriculum id.
Relations:
    Many curriculum enrollment records can contain one student.
    Many curriculum enrollment records can contain one curriculum.

Entity: 
    CURRICULUM
Atrributes:
    CURR_NUM            (PK) curriculum id
    CURR_NAME           curriculum's name
Notes:
    Assume different curriculum can have same name.
    The primary key of a curriculum entity is the curriculum id.
Relations:
    One curriculum can be found in one curriculum enrollment record.
    One curriculum can generate many sections.

Entity:
    SECTION
Atrributes:
    SECTION_NUM         Integer     (PK) section id
    CURR_NUM            Integer     (FK3) curriculum id
    INSTRUCTOR_NUM      Integer     (FK2) instructor id
    JOB_NUM             Integer     (FK6) job id
    CLASSRM_NUM         Integer     (FK5) classroom id
    TEXTBOOK_NUM        Integer     (FK4) textbook id
    SEC_START_DATE      String      section's start date: `mm-dd-yy`
    SEC_END_DATE        String      section's start time: `day: hh-mm`
    SEC_END_DATE        String      section's end time: `day: hh-mm`
Notes:
    Assume different sections can from same curriculum, have same instructors, classrooms, textbooks, start dates, start times or end times.
    The primary key of a section entity is the section id.
Relations:
    Many sections can be generated from one curriculum.
    Many sections can be taughted by one instructor.
    One section can have one job.
    Many sections can be held in one classroom.
    Many sections can use one textbook.

Entity:
    TEXTBOOK
Atrributes:
    TEXTBOOK_NUM        Integer     (PK) textbook's id
    TEXTBOOK_TITLE      String      textbook's title
    LANG_NUM            Integer     (FK7, multivalued) programming language id
Notes:
    Assume different textbooks have same title or programming language(s)
    The primary key of a textbook entity is the textbook id.
Relations:
    Many textbooks can have many programming languages.

Entity:
    LANGUAGE
Atrributes:
    LANG_NUM            Integer     (PK) programming language id
    LANG_NAME           String      programming language's name
Notes:
    The primary key of a programming language is the programming language id.
Relations:
    Many programming languages can be wirtten in many textbooks.

Entity:
    PROJECT_ENROLLMENT              Bridge Entity
Atrributes:
    STUDENT_NUM         Integer     (PK, FK1) student id         
    PROJECT_NUM         Integer     (PK, FK8) project id
    INSTRUCTOR_RATING   Integer     this student's rating towards the instructor of the project
    CLASS_RATING        Integer     this student's rating towards the project
Notes:
    Assume different project enrollment records consist of different students and projects can have same instructor rating or project rating.
    The primary key of a projct enrollment record entity is a composite of student id and projct id.
Relations:
    Many project enrollment records can contain one student.
    Many project enrollment records can contain one project.

Entity:
    PROJECT
Atrributes:
    PROJECT_NUM         Integer     (PK, FK8) project id
    INSTRUCTOR_NUM      Integer     (FK2) instructor id
    JOB_NUM             Integer     (FK6) job id
    TABLE_NUM           Integer     (FK9) table id
    PART_NUM            Integer     (FK10, multivalued) part id
    PROJECT_NAME        String      project's name
    PROJECT_START_DATE  String      project's start date: `mm-dd-yy`
    PROJECT_START_TIME  String      project's start time: `day: hh-mm`
    PROJECT_END_TIME    String      project's end time: `day: hh-mm`
Notes:
    Assume different projects have same instructors, tables, start dates, start times or end times.
    The primary key of a projct entity is the projct id.
Relations:
    One project can be found in many projct enrollment records.
    One project can uses many parts.
    Many projects can can be overseen by one instructor.
    One project can have one job.
    Many projects can work on one table.

Entity:
    TABLE
Atrributes:
    TABLE_NUM           Integer     (PK) table id
    CLASSRM_NUM         Integer     (FK5) classroom id
    PART_NUM            Integer     (FK10, multivalued) part id
Notes:
    Assume different tables can be put in same classroom.
    The primary key of a table entity is the table id.
Relations:
    One table can hold many projects.
    One table can store many parts.
    Many tables can be put in one classroom.

Entity:
    CLASSROOM
Atrributes:
    CLASSRM_NUM         Integer     (PK) classroom id
    CLASSRM_NAME        String      classroom's name
    CLASSRM_LOCATION    String      classroom's location
    TABLE_NUM           Integer     (FK9, multivalued) table id 
Notes:
    Assume different classrooms can have same name.
    The primary key of a classroom entity is the classroom id.
Relations:
    One classroom can contain many tables.
    One classroom can hold many sections.

Entity:
    PART
Atrributes:
    PART_NUM            Integer     (PK, FK10) part id
    PART_NAME           String      part's name
    PART_TYPE           String      part's type: 'micro-controller' or "micro-controller's part"
    PART_STATUS         Boolean     part's working status
    PART_PRICE          Double      part's price
Notes:
    A part contains two categories: micro-controller and micro-controller's part.
    A part has two working status: working and not working.
    Assume different parts can have same name, type, status or price.
    The primary key of a part entity is the part id.
Relations:
    Many parts can used by one projct.
    Many parts can stored in one table.
    Many parts can be purchased from one supplier.

Entity:
    SUPPLIER
Atrributes:
    SUPPLIER_NUM        Integer     (PK) supplier id
    SUPPLIER_NAME       String      supplier's name
    PART_NUM            Integer     (FK10, multivalued) part id
Notes:
    Assume different suppliers can have same name or provide same part.
    The primary key of a supplier entity is the supplier id.
Relations:
    One supplier can sell many parts.


Entity:
    LIBRARY_RECORD                  Bridge Entity
Atrributes:
    STUDENT_NUM         Integer     (PK, FK1) student id
    BOOK_NUM            Integer     (PK, FK11) library book id
    CHECKOUT_TIME       String      library book's check out time: `mm-dd-yy: hh-mm`
    RETURN_TIME         String      library book's return time: `mm-dd-yy: hh-mm`
Notes:
    Assume different library records consist of different students and books can have same check out time or return time.
    The primary key of a library record entity is a composite of student id and library book id.
Relations:
    Many library records can generated from a student.
    Many library records can refer to one book.

Entity:
    LIBRARY_BOOK
Atrributes:
    BOOK_NUM        Integer         (PK) library book id
    BOOK_TITLE      String          library book's title
    BOOK_TOPIC      String          (multivalued) library book's topic
Notes:
    Assume different library books can have same title, topic. 
    The primary key of a library book entity is the library book id.
Relations:
    One library book can be found in many library records.