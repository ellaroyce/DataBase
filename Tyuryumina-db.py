# coding: utf8
# import cgi
import HTML
import webbrowser

import sys
reload(sys)
sys.setdefaultencoding('utf8')

import mysql.connector


# from mysql.connector import Error

# def connect():
# try:
conn = mysql.connector.connect(host='127.0.0.1', database='TweetInTheAir', user='root', password='8888')
cursor = conn.cursor()


if conn.is_connected():
    print('Connected to MySQL database')

        # if conn.is_connected():
        #     print('Connected to MySQL database')

    # except Error as e:
    #     print(e)

#     finally:
#         conn.close()
#
# if __name__ == '__main__':
#     connect()

### info about tables
tables = dict()
tables['TwitterUser'] = ['name', 'location']
tables['Airline'] = ['name']
tables['Reason'] = ['text']
tables['Comment'] = ['text', 'created', 'retweet']
tables['ReasonReal'] = ['estimation']
tables['Airport_has_Airline'] = ['Airport_id', 'Airline_id']
tables['Comment_has_Airline'] = ['Comment_id', 'Airline_id']
tables['Comment_has_City'] = ['Comment_id', 'City_id']
tables['Comment_has_Reason'] = ['Comment_id', 'Reason_id']
tables['TwitterUser_has_Comment'] = ['TwitterUser_id', 'Comment_id']

# st = "select id, name FROM TwitterUser"
#
# cursor.execute(st)
# rows = cursor.fetchall()
# for row in rows:
#     print row


###


def lists(list1, str1):
    qq = 0
    for element in list1:
        str1 = str1 + str(qq) + ' ' + element + '\n'
    return str1


def update(table, id_name, id,  field, new_value):

    str1 = "update %s set %s = '%s' where %s=%d" % (table, field, new_value, id_name, id)
    cursor.execute(str1)
    conn.commit()


def add(table, names, values):
    str1 = 'insert into %s(' % (table)
    e = 0
    for elem in names:
        if e == 0:
            str1 = str1 + str(elem)
        else:
            str1 = str1 + ',' + str(elem)
        e = e + 1
    str1 = str1 + ') values ('
    e = 0
    for elem in values:
        if e == 0:
            str1 = str1 + "'" + str(elem) + "'"
        else:
            str1 = str1 + ',' + "'" + str(elem) + "'"
        e = e + 1
    str1 = str1 + ')'
    cursor.execute(str1)
    conn.commit()


def select(table, names):
    str1 = 'select '
    e = 0
    for elem in names:
        if e == 0:
            str1 = str1 + str(elem)
        else:
            str1 = str1 + ',' + str(elem)
        e = e + 1
    str1 = str1 + ' from %s' % (table)
    return cursor.execute(str1)


def dic(lists, str1):
    elem = dict()
    for el in lists:
        elem[el] = list()
    cursor.execute(str1)
    rows = cursor.fetchall()
    for row in rows:
        qq = 0
        for el in lists:
            elem[el].append(row[qq])
            qq = qq + 1
    return elem

def select_users(flag):
    str1 = "select name, location from TwitterUser"
    if flag != "":
        str1 = str1 + " where name like '%" + "%s" % (flag) + "%' "
    users = dic(['name', 'location'], str1)
    print(" name location ")
    for i in range(0, len(users['name'])):
        str1 = "%d" % (i + 1) + " " + users['name'][i] + " " + users['location'][i]
        print(str1)
    print("\n0 -- add new user\nuser id -- change or delete\n-1 -- go back")
    num = int(input())
    if num == 0:
        names = ['id', 'name', 'location']
        valuesToAdd = list()
        valuesToAdd.append(str(int(len(users['name'])+1)))
        print("Type name:")
        nameToAdd = raw_input()
        valuesToAdd.append(str(nameToAdd))
        print("Type location:")
        locToAdd = raw_input()
        valuesToAdd.append(str(locToAdd))
        add('TwitterUser', names, valuesToAdd)
    elif num > 0:
        user_id = num
        print("\n1 -- change information\n 2 -- delete this user \n3 - nothing")
        ans_4 = int(input())
        if ans_4 == 2:
            str1 = 'delete from TwitterUser where id = %d' % (user_id)
            cursor.execute(str1)
            conn.commit()
        elif ans_4 == 1:
            print('Choose to change:\n1 - name\n2 - location\n3-connect/add comment')
            var = int(input())
            if var == 1:
                print('Type new name')
                new_name = raw_input()
                update('TwitterUser', 'id', user_id, 'name', str(new_name))
            elif var == 2:
                print('Type new location')
                new_loc = raw_input()
                update('TwitterUser', 'id', user_id, 'location', str(new_loc))
            elif var == 3:
                print('Comment:\nc - connect\na - add')
                # print('Next? \n1 -- add a comment, \n2 -- add an airline \n3 -- add a reason')
                var = raw_input()
                if var == 'c':
                    comments = dic(['comm_id', 'text', 'created'], 'select id, text, created from Comment')
                    for i in range(0, len(comments['text'])):
                        print(str(i + 1) + ' ' + comments['text'][i] + ' ' + comments['created'][i])
                    print('Choose the comment to connect with:\n')
                    num = int(input())
                    try:
                        comment_id = comments['comm_id'][num-1]
                    except Exception as exc:
                        print(exc)
                    add('TwitterUser_has_Comment', ['TwitterUser_id', 'Comment_id'], [user_id, comment_id])
                elif var == 'a':
                    comments = dic(['comm_id', 'text', 'created'], 'select id, text, created from Comment')
                    names = ['id', 'text', 'created', 'retweet']
                    valuesToAdd = list()
                    for i in range(0, len(comments['text'])):
                        # print(str(i + 1) + ' ' + comments['text'][i] + ' ' + comments['created'][i])
                        end = i
                    comment_id = comments['comm_id'][end] + 1
                    valuesToAdd.append(str(comment_id))
                    print("Type text:")
                    textToAdd = raw_input()
                    valuesToAdd.append(textToAdd)
                    print("Type created in format yyyy-mm-dd hh:mm:ss:")
                    crtdToAdd = raw_input()
                    valuesToAdd.append(str(crtdToAdd))
                    valuesToAdd.append(str(0))
                    add('Comment', names, valuesToAdd)
                    add('TwitterUser_has_Comment', ['TwitterUser_id', 'Comment_id'], [user_id, comment_id])
                    print('Airline:\nc - connect\na - add')
                    var = raw_input()
                    if var == 'c':
                        str1 = "select name from Airline"
                        airlines = dic(['name'], str1)
                        print(" name  ")
                        for i in range(0, len(airlines['name'])):
                            str1 = "%d" % (i + 1) + " " + airlines['name'][i]
                            print(str1)
                        print("Type an id of airline:")
                        Airline_id = raw_input()
                        # valuesToAdd.append(textToAdd)
                        add('Comment_has_Airline', ['Comment_id', 'Airline_id'], [comment_id, Airline_id])
                    elif var == 'a':
                        valuesToAdd = list()
                        str1 = "select name from Airline"
                        airlines = dic(['name'], str1)
                        for i in range(0, len(airlines['name'])):
                            # str1 = "%d" % (i + 1) + " " + airlines['name'][i]
                            # print(str1)
                            end = i+1
                        print("Type name:")
                        try:
                            airnameToAdd = raw_input()
                        except Exception as exc:
                            print(exc)
                        valuesToAdd.append(str(end+1))
                        valuesToAdd.append(str(airnameToAdd))
                        names = ['id', 'name']
                        add('Airline', names, valuesToAdd)
                        Airline_id = end+1
                        add('Comment_has_Airline', ['Comment_id', 'Airline_id'], [comment_id, Airline_id])
                    print('Reason:\nc - connect\na - add')
                    var = raw_input()
                    if var == 'c':
                        str1 = "select text from Reason"
                        reasons = dic(['text'], str1)
                        print(" text  ")
                        for i in range(0, len(reasons['text'])):
                            str1 = "%d" % (i + 1) + " " + reasons['text'][i]
                            print(str1)
                        print("Type an id of reason:")
                        Reason_id = raw_input()
                        # valuesToAdd.append(textToAdd)
                        add('Comment_has_Reason', ['Comment_id', 'Reason_id'], [comment_id, Reason_id])
                    elif var == 'a':
                        str1 = "select text from Reason"
                        reasons = dic(['text'], str1)
                        # print(" text  ")
                        for i in range(0, len(reasons['text'])):
                            # str1 = "%d" % (i + 1) + " " + reasons['text'][i]
                            # print(str1)
                            end = i+1
                        valuesToAdd = list()
                        names = ['id', 'text']
                        valuesToAdd.append(str(end+1))
                        print("Type text:")
                        reasonToAdd = raw_input()
                        valuesToAdd.append(str(reasonToAdd))
                        Reason_id = end+1
                        add('Reason', names, valuesToAdd)
                        add('Comment_has_Reason', ['Comment_id', 'Reason_id'], [comment_id, Reason_id])



def find_users(ans):
    str1 = "select name, location from TwitterUser"
    if ans == 1:
        print("Type name: ")
        searchName = raw_input()
        str1 = str1 + " where name like '%" + "%s" % (str(searchName)) + "%' "
        users = dic(['name', 'location'], str1)
        print(" name location ")
        for i in range(0, len(users['name'])):
            str1 = "%d" % (i + 1) + " " + users['name'][i] + " " + users['location'][i]
            print(str1)
    elif ans == 2:
        print("Type location: ")
        searchLoc = raw_input()
        str1 = str1 + " where location like '%" + "%s" % (str(searchLoc)) + "%' "
        users = dic(['name', 'location'], str1)
        print(" name location ")
        for i in range(0, len(users['name'])):
            str1 = "%d" % (i + 1) + " " + users['name'][i] + " " + users['location'][i]
            print(str1)



print("Hello dear, welcom to TweetFromTheAir database, lets work!\n")
while True:
    try:
        print("Press:\n0 - comments\n1 - users\n2 - reasons\n3 - airlines\n4 - see reports\n5 - exit")
        ans_1 = int(input())
        if ans_1 == 1:
            while True:
                print("What you want to do?\n Type: 1 - all users, 2 - find user, 3 - go back")
                ans_2 = int(input())
                if ans_2 == 1:
                    try:
                        select_users("")
                    except Exception as exc:
                        print(exc)
                elif ans_2 == 2:
                    print("1 - name\n2 - location ")
                    ans = int(input())
                    try:
                        find_users(ans)
                    except Exception as exc:
                        print(exc)
                elif ans_2 == 3:
                    break
        elif ans_1 == 2:
            while True:
                print("What you want to do?\n Type: 1 - all reasons, 2 - go back")
                ans_2 = int(input())
                if ans_2 == 1:
                    str1 = "select text from Reason"
                    reasons = dic(['text'], str1)
                    t = HTML.Table(header_row=['', 'Reason'])
                    print(" text  ")
                    for i in range(0, len(reasons['text'])):
                        str1 = "%d" % (i + 1) + " " + reasons['text'][i]
                        t.rows.append(["%d" % (i + 1), reasons['text'][i]])
                        print(str1)

                    htmlcode = str(t)

                    f = open('reasons.html', 'w')

                    message = htmlcode

                    f.write(message)
                    f.close()

                    filename = 'file:///Users/ellatyuryumina/Downloads/reasons.html'
                    webbrowser.open_new_tab(filename)

                elif ans_2 == 2:
                    break
        elif ans_1 == 3:
            print("What you want to do?\n Type: 1 - all airlines, 2 - go back")
            ans_2 = int(input())
            if ans_2 == 1:
                str1 = "select name from Airline"
                airlines = dic(['name'], str1)
                t = HTML.Table(header_row=['', 'Airline'])
                print(" name  ")
                for i in range(0, len(airlines['name'])):
                    str1 = "%d" % (i + 1) + " " + airlines['name'][i]
                    t.rows.append(["%d" % (i + 1), airlines['name'][i]])
                    print(str1)

                htmlcode = str(t)

                f = open('airlines.html', 'w')

                message = htmlcode

                f.write(message)
                f.close()

                filename = 'file:///Users/ellatyuryumina/Downloads/airlines.html'
                webbrowser.open_new_tab(filename)

            elif ans_2 == 2:
                break
        elif ans_1 == 4:
            print('Reports:\n 1 - search Twitter User and Comment by Airline\n 2 - Airline and Reason Real\n 3 - Comment and Reason by City \n 4 -  Reason and count Comments by Airline \n 5 - Airline, Reason Real')
            num = int(input())
            if num == 1:
                print('airline to Search')
                var = raw_input()
                airlineSearch = str(var)
                str1 = "select TwitterUser.name, Comment.text, Airline.name from Comment left join TwitterUser_has_Comment on TwitterUser_has_Comment.Comment_id = Comment.id  left join TwitterUser on TwitterUser_has_Comment.TwitterUser_id = TwitterUser.id inner join Comment_has_Airline on Comment_has_Airline.Comment_id = Comment.id left join Airline on Comment_has_Airline.Airline_id = Airline.id where Airline.name in ('" + "%s" % (str(airlineSearch)) + "') order by Airline.name"
                cursor.execute(str1)
                results = cursor.fetchall()
                if results:
                    for r in results:
                        print r

                htmlcode = HTML.table(results, header_row=['Twitter User', 'Comment', 'Airline'])

                f = open('index1.html', 'w')

                message = htmlcode

                f.write(message)
                f.close()

                # Change path to reflect file location
                filename = 'file:///Users/ellatyuryumina/Downloads/index1.html'
                webbrowser.open_new_tab(filename)


            if num == 2:
                print('airline to Search')
                var = raw_input()
                airlineSearch = str(var)
                str1 = "SELECT distinct Airline.name, Reasonreal.estimation FROM Airline JOIN Airline_has_ReasonReal ON (Airline.id = Airline_has_ReasonReal.Airline_id) JOIN ReasonReal ON (ReasonReal.id = Airline_has_ReasonReal.ReasonReal_id) where name in ('" + "%s" % (str(airlineSearch)) + "')"
                cursor.execute(str1)
                results = cursor.fetchall()
                if results:
                    for r in results:
                        print r

                htmlcode = HTML.table(results, header_row=['Airline', 'Reason Real'])

                f = open('index2.html', 'w')

                message = htmlcode

                f.write(message)
                f.close()

                # Change path to reflect file location
                filename = 'file:///Users/ellatyuryumina/Downloads/index2.html'
                webbrowser.open_new_tab(filename)

            if num == 3:
                print('city to Search')
                var = raw_input()
                citySearch = str(var)
                str1 = "SELECT Comment.text as comment, Reason.text as reason, City.name as city FROM comment LEFT JOIN Comment_has_City ON comment.id = Comment_has_City.Comment_id LEFT JOIN city ON city.id = Comment_has_City.City_id LEFT JOIN Comment_has_Reason ON comment.id = Comment_has_Reason.Comment_id LEFT JOIN reason ON reason.id = Comment_has_Reason.Reason_id where city.name = '" + "%s" % (str(citySearch)) + "'"
                cursor.execute(str1)
                results = cursor.fetchall()
                if results:
                    for r in results:
                        print r

                htmlcode = HTML.table(results, header_row=['Comment', 'Reason', 'City'])

                f = open('index3.html', 'w')

                message = htmlcode

                f.write(message)
                f.close()

                # Change path to reflect file location
                filename = 'file:///Users/ellatyuryumina/Downloads/index3.html'
                webbrowser.open_new_tab(filename)

            if num == 4:
                str1 = "select Reason.text, count(comment.id), Airline.name from Reason join Comment_has_Reason on Comment_has_Reason.Reason_id = Reason.id join Comment on Comment_has_Reason.Comment_id = Comment.id join Comment_has_Airline on Comment.id = Comment_has_Airline.Comment_id join Airline on Airline.id = Comment_has_Airline.Airline_id group by Reason.id, Airline.id"
                cursor.execute(str1)
                results = cursor.fetchall()
                if results:
                    for r in results:
                        print r
                htmlcode = HTML.table(results, header_row=['Reason', 'Comments', 'Airline'])

                f = open('index4.html', 'w')

                message = htmlcode

                f.write(message)
                f.close()

                # Change path to reflect file location
                filename = 'file:///Users/ellatyuryumina/Downloads/index4.html'
                webbrowser.open_new_tab(filename)


            if num == 5:
                print('reason to Search')
                var = raw_input()
                reasonSearch = str(var)
                str1 = "SELECT distinct Airline.name, Reasonreal.estimation FROM Airline JOIN Airline_has_ReasonReal ON (Airline.id = Airline_has_ReasonReal.Airline_id) JOIN ReasonReal ON (ReasonReal.id = Airline_has_ReasonReal.ReasonReal_id) WHERE  estimation in ('" + "%s" % (str(reasonSearch)) + "')"
                cursor.execute(str1)
                results = cursor.fetchall()
                if results:
                    for r in results:
                        print r

                htmlcode = HTML.table(results, header_row=['Airline', 'Reason Real'])

                f = open('index5.html', 'w')

                message = htmlcode

                f.write(message)
                f.close()

            # Change path to reflect file location
            filename = 'file:///Users/ellatyuryumina/Downloads/index5.html'
            webbrowser.open_new_tab(filename)
        if ans_1 == 0:
            print("What you want to do?\n Type: 1 - all comments, 2 - go back")
            ans_2 = int(input())
            if ans_2 == 1:
                str1 = "select name from Comment"
                comments = dic(['comm_id', 'text', 'created', 'retweets'], 'select id, text, created, retweet from Comment')
                t = HTML.Table(header_row=['', 'Comment', 'created', 'retweet' ])
                print(" text created retweets  ")
                for i in range(0, len(comments['text'])):
                    print(str(i + 1) + ' ' + comments['text'][i] + ' ' + comments['created'][i] + ' ' + str(comments['retweets'][i]))
                    t.rows.append(["%d" % (i + 1), comments['text'][i], comments['created'][i], comments['retweets'][i]])
                    print(str1)

                htmlcode = str(t)

                f = open('comments.html', 'w')

                message = htmlcode

                f.write(message)
                f.close()

                filename = 'file:///Users/ellatyuryumina/Downloads/comments.html'
                webbrowser.open_new_tab(filename)

            elif ans_2 == 2:
                break
        elif ans_1 == 5:
            # mysql.close()
            conn.close()
            break
    except Exception as exc:
        print(exc)


