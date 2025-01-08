from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
import mysql.connector
import json
from datetime import datetime
from django.contrib.sessions.models import Session 
import hashlib
class Node:
    def __init__(self, question, option1, option2, option3, option4, correct_answer):
        self.question = question
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.option4 = option4
        self.correct_answer = correct_answer
        self.next = None
        self.prev = None


class DoublyLinkedList:
    def __init__(self):
        self.head = None
        self.tail = None
        self.current = None
        self.length = 0
        self.current_index = -1

    # Add a new question at the end of the list
    def append(self, question, option1, option2, option3, option4, correct_answer):
        new_node = Node(question, option1, option2,
                        option3, option4, correct_answer)
        if self.head is None:
            self.head = self.tail = new_node
            self.current = self.head
            self.current_index = 0
        else:
            new_node.prev = self.tail
            self.tail.next = new_node
            self.tail = new_node
        self.length += 1

    # Move to the next question
    def Next(self):
        if self.current and self.current.next:
            self.current = self.current.next
            self.current_index += 1
            return True
        return False

    # Move to the previous question
    def Previous(self):
        if self.current and self.current.prev:
            self.current = self.current.prev
            self.current_index -= 1
            return True
        return False

    # Get current question details as a dictionary
    def current_question(self):
        if self.current:
            return {
                "question": self.current.question,
                "option1": self.current.option1,
                "option2": self.current.option2,
                "option3": self.current.option3,
                "option4": self.current.option4,
                "correct_answer": self.current.correct_answer
            }
        return None

    # Return the total number of questions in the list
    def Length(self):
        return self.length

    # Get the current question index
    def current_number(self):
        return self.current_index + 1  # Since index starts at 0, return index + 1

    def hasNext(self):
        if self.current and self.current.next:
            return True
        return False

    # Check if there is a previous node available
    def hasPrevious(self):
        if self.current and self.current.prev:
            return True
        return False

    # Get all questions as a list of dict
    def get_all_questions(self):
        questions = []
        current_node = self.head
        while current_node:
            questions.append({
                "question": current_node.question,
                "option1": current_node.option1,
                "option2": current_node.option2,
                "option3": current_node.option3,
                "option4": current_node.option4,
                "correct_answer": current_node.correct_answer
            })
            current_node = current_node.next
        return questions


class DatabaseOperations():
    def __init__(self, dbname):
        self.dbname = dbname

    def getDBInfo(self):
        return self.dbname

    def runQuery(self, query):
        try:
            connection = mysql.connector.connect(
                host='localhost',
                # host='btieyhs2jctv9vjozees-mysql.services.clever-cloud.com',
                user='root',
                # user='ubkygkffztqf2iv8',
                password='',
                # password='SR9NIRWMNhBnqVMATMqA',
                database=self.dbname,
                # database='btieyhs2jctv9vjozees',
            )
            cursor = connection.cursor()
            cursor.execute(query)
            SUCCESS_STATUS = True
            return True, cursor.fetchall()
        except Exception as e:
            SUCCESS_STATUS = False
            return False, e
        finally:
            connection.commit()
            cursor.close()

# Create your views here.


def login(request):
    try:
        if request.method == 'POST':
            postData = request.POST
            db = DatabaseOperations('examhub')
            entered_password = postData['exam_password']
            entered_username = postData['exam_username']

            a, b = db.runQuery(
                f"SELECT * FROM examhub_auth where eh_username = '{entered_username}'")
            if not a:
                raise Exception('Examhub 1 : Server Error')
            if len(b) <= 0:
                parms = {
                    'error': True,
                    'e_msg': 'User not Found! Check Your Username'
                }
                return render(request, 'login.html', parms)

            username = b[0][0]
            password = b[0][1]
            role = b[0][2]
            if entered_password == password and entered_username == username:
                if role == 'STD':
                    request.session['username'] = username
                    request.session[f'{username}_auth'] = True
                    return redirect('student_dashboard/')
                else:
                    request.session['username'] = username
                    request.session[f'{username}_auth'] = True
                    return redirect('teacher_workspace/')

            return render(request, 'login.html')
        else:
            return render(request, 'login.html')
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)


def student_dashboard(request):
    db = DatabaseOperations('examhub')
    try:
        username = request.session.get('username')
        auth_status = request.session.get(f'{username}_auth')
        if auth_status:

            # Get All Test Codes
            a, b = db.runQuery('SELECT testcode from testcodes')
            ls = [i[0] for i in b]

            a, b = db.runQuery('SELECT testname from testcodes')
            names = [i[0] for i in b]
            parms = {
                'test_data': zip(ls, names),
            }
            return render(request, 'std_dashboard.html', parms)
        else:
            return redirect('logout')
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)


# Creating a Quiz Object Here
MainQuiz = DoublyLinkedList()
MarkWeight = 1
TotalScore = []
UserAnswers = []
QuestionPaper = []

def start_test(request):
    try:
        db = DatabaseOperations('examhub')
        if request.method == 'POST':
            testcode = request.POST.get('testcode')
            request.session['testcode'] = testcode
            username = request.session.get('username')
            a, b = db.runQuery(f'SELECT * from {testcode}')
            global MainQuiz
            global QuestionPaper
            MainQuiz = DoublyLinkedList()
            for i in b:
                MainQuiz.append(i[0], i[1], i[2], i[3], i[4], i[5])

            if MainQuiz.length == 0:
                testcode = request.session.get('testcode')
                raise Exception(f"Oops! '{testcode}' has no questions to display.")

            QuestionPaper = MainQuiz.get_all_questions()

            a, b = db.runQuery(
                f'SELECT * FROM testcodes where testcode = "{testcode}"')
            if not a:
                raise Exception("Invalid TestCode!")
            testname = b[0][0]
            testname = b[0][1]
            time = b[0][2]
            global MarkWeight
            global TotalScore
            TotalScore = []
            MarkWeight = 0
            MarkWeight = b[0][3]

            for i in range(MainQuiz.length):
                TotalScore.append(0)
            global UserAnswers
            UserAnswers = ['0' for i in range(MainQuiz.length)]
            request.session['test_state'] = True
            parms = {
                'testname': testname,
                'testcode': testcode,
                'time': time,
                'total': MainQuiz.length
            }
            return render(request, 'test.html', parms)
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)
    return render(request, 'test.html')


def initial(request):
    if request.session.get('test_state'):
        try:
            global MainQuiz
            global UserAnswers
            


            current_question = MainQuiz.current_question()
            current_question['q_no'] = MainQuiz.current_number()

            notattempted = [i for i in UserAnswers if i == '0']
            attempted = len(UserAnswers) - len(notattempted)
            notattempted = len(notattempted)


            return JsonResponse({'state': True, 'current_question': current_question, 'hasNext': MainQuiz.hasNext(), 'hasPrevious': MainQuiz.hasPrevious(),'att':attempted, 'natt':notattempted})
        except Exception as e:
            parms = {
                'err': e
            }
            return render(request, 'index.html', parms)
    else:
        return redirect("/")


def nextQuestion(request):
    try:
        global MainQuiz
        global UserAnswers
        if MainQuiz.Next():
            current_question = MainQuiz.current_question()
            current_question['q_no'] = MainQuiz.current_number()

            notattempted = [i for i in UserAnswers if i == '0']
            attempted = len(UserAnswers) - len(notattempted)
            notattempted = len(notattempted)

            return JsonResponse({'state': True, 'current_question': current_question, 'hasNext': MainQuiz.hasNext(), 'hasPrevious': MainQuiz.hasPrevious(), 'att':attempted, 'natt':notattempted})
        else:
            return JsonResponse({'state': False, 'current_question': current_question})
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)


def prevQuestion(request):
    try:
        global MainQuiz
        if MainQuiz.Previous():
            current_question = MainQuiz.current_question()
            current_question['q_no'] = MainQuiz.current_number()

            notattempted = [i for i in UserAnswers if i == '0']
            attempted = len(UserAnswers) - len(notattempted)
            notattempted = len(notattempted)

            return JsonResponse({'state': True, 'current_question': current_question, 'hasPrevious': MainQuiz.hasPrevious(), 'hasNext': MainQuiz.hasNext(),'att':attempted, 'natt':notattempted})
        else:
            return JsonResponse({'state': False, 'current_question': current_question})
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)


def submitAnswer(request):
    try:
        if request.method == 'POST':
            data = json.loads(request.body)

            global MainQuiz
            q_data = MainQuiz.current_question()
            correct_ans = q_data['correct_answer']
            keys = q_data.keys()
            keys = list(keys)
            keys = keys[1:5]

            answers = [q_data.get(i) for i in keys]

            to_letter = {
                0: 'A',
                1: 'B',
                2: 'C',
                3: 'D',
            }
            global TotalScore
            global UserAnswers

            # Converting User Answer to A,B,C,D
            user_ans = to_letter[answers.index(data['data'])]

            # Getting Current Question Number
            current_q_no = MainQuiz.current_number()

            # Setting UserAnswer
            UserAnswers[current_q_no-1] = user_ans

            # Calculating Score of User if Answer is Correct.
            if user_ans == correct_ans:
                TotalScore[current_q_no-1] = 1
            else:
                TotalScore[current_q_no-1] = 0

            notattempted = [i for i in UserAnswers if i == '0']
            attempted = len(UserAnswers) - len(notattempted)
            notattempted = len(notattempted)

        return JsonResponse({'att':attempted, 'natt':notattempted})
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)


def getUserAnswer(request):
    global MainQuiz
    global UserAnswers
    return JsonResponse({'Answers': UserAnswers, 'q_no': MainQuiz.current_number()})


def submitTest(request):
    try:
        global MainQuiz
        global UserAnswers
        global TotalScore
        global MarkWeight
        testcode = request.session.get('testcode')
        username = request.session.get('username')
        db = DatabaseOperations('examhub')
        date_time = datetime.now().strftime("%d/%m/%Y %H:%M:%S")

        total_of = MainQuiz.length * MarkWeight
        obtained = sum(TotalScore) * MarkWeight

        per = "{:.2f}".format((obtained/total_of)*100)

        user_ans = ', '.join(UserAnswers)

        unique_user_submit_id = str(username) + str(date_time)

        hash_object = hashlib.sha256()
        hash_object.update(unique_user_submit_id.encode())
        hash_hex = hash_object.hexdigest()

        

        a,b = db.runQuery(f"SELECT CROP FROM {testcode}")
        only_ans = [i[0] for i in b]
        result = []
        quesion_n = []
        marks = []
        for i in range(0,len(only_ans)):
            quesion_n.append(f"Q.{i+1}")
            if UserAnswers[i] == only_ans[i]:
                marks.append(MarkWeight)
                result.append(1)
            else:
                result.append(-1)
                marks.append(0)


        f_qno = []
        f_uans = []
        f_res = []
        f_mark = []
        end_data = []
        for i in range(len(only_ans)):
            stack = []
            stack.append(quesion_n[i])
            if UserAnswers[i] == '0':
                stack.append("-")
            else:
                stack.append(UserAnswers[i])
            stack.append(result[i])
            stack.append(marks[i])
            end_data.append(stack)

        final_result = zip(quesion_n,UserAnswers,result,marks)
        

        global QuestionPaper
        user_report = []
        for i in QuestionPaper:
            single_q = ""
            single_q = f"{i['question']} ## {i['option1']} ## {i['option2']} ## {i['option3']} ## {i['option4']} ## {i['correct_answer']} ## "
            user_report.append(single_q)

        for i in range(0,len(end_data)):
            user_report[i] = user_report[i] + f"{end_data[i][1]} ## {end_data[i][2]} ## {end_data[i][3]} |||"

        user_final_report = ''.join(user_report)
        a, b = db.runQuery(
            f"INSERT INTO {testcode}_res VALUES('{username}','{user_ans}', '{user_final_report}' ,'{obtained}', '{per}', '{date_time}', '{hash_hex}')")

        request.session['test_state'] = False
        
        
        
        
        parms = {
            'total_of': total_of,
            'obtained': obtained,
            'per': per,
            'final_result':final_result,
            'end_data':end_data,
            'totalQues' : len(only_ans)
        }
        return render(request, 'result.html', parms)
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)


def teacher_workspace(request):
    return render(request, 'tec_dashboard.html')


def view_test(request):
    db = DatabaseOperations('examhub')
    if request.method == 'GET':
        a, b = db.runQuery('SELECT testcode from testcodes')
        ls = [i[0] for i in b]
        # for i in b:
        #     ls.append(i[0])

        a, b = db.runQuery('SELECT testname from testcodes')
        names = [i[0] for i in b]
        parms = {
            'test_data': zip(ls, names),
        }
        return render(request, 'view_test.html', parms)
    if request.method == 'POST':
        try:
            a, b = db.runQuery('SELECT testcode from testcodes')
            ls = [i[0] for i in b]

            a, b = db.runQuery('SELECT testname from testcodes')
            names = [i[0] for i in b]
            testcode = request.POST['testcode']
            a, b = db.runQuery(f'SELECT * FROM {testcode}')
            parms = {
                'data': b,
                'postData': True,
                'test_data': zip(ls, names),
            }
            return render(request, 'view_test.html', parms)
        except Exception as e:
            parms = {
                'err': e
            }
            return render(request, 'index.html', parms)


def view_result(request):
    db = DatabaseOperations('examhub')
    if request.method == 'GET':
        a, b = db.runQuery('SELECT testcode from testcodes')
        ls = [i[0] for i in b]

        a, b = db.runQuery('SELECT testname from testcodes')
        names = [i[0] for i in b]
        parms = {
            'test_data': zip(ls, names),
        }
        return render(request, 'view_result.html', parms)
    if request.method == 'POST':
        try:
            a, b = db.runQuery('SELECT testcode from testcodes')
            ls = [i[0] for i in b]

            a, b = db.runQuery('SELECT testname from testcodes')
            names = [i[0] for i in b]
            testcode = request.POST['testcode']
            request.session['view_test_code'] = testcode
            a, b = db.runQuery(f'SELECT username,marks,per,date_time,submit_id FROM {testcode}_res')
            parms = {
                'data': b,
                'postData': True,
                'test_data': zip(ls, names),
            }
            return render(request, 'view_result.html', parms)
        except Exception as e:
            parms = {
                'err': e
            }
            return render(request, 'index.html', parms)


def user_control(request):
    try:
        db = DatabaseOperations('examhub')
        a,b = db.runQuery('SELECT * FROM `examhub_auth`')
        if not a:
            raise Exception('Examhub: User Control Not Responding')
        
        x,y = db.runQuery('SELECT eh_username FROM `examhub_auth`')
        usernames = [i[0] for i in y]
        user_data = {
            'data':b,
            'usernames':usernames,
        }
        return render(request, 'user_control.html',user_data)
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)

def createUser(request):
    db = DatabaseOperations('examhub')
    if request.method == 'POST':
        data = json.loads(request.body)
        newusername = data['uname']
        newpassword = data['passwd']
        newrole = data['userrole']
        a,b = db.runQuery(f"INSERT INTO examhub_auth values('{newusername}', '{newpassword}', '{newrole}')")
    return JsonResponse({'acc':a})


def deleteUser(request):
    db = DatabaseOperations('examhub')
    if request.method == 'POST':
        data = json.loads(request.body)
        deluname = data['deluname']
        a,b = db.runQuery(f"DELETE FROM examhub_auth WHERE eh_username = '{deluname}'")
    return JsonResponse({'acc':a})


def create_test(request):
    try:
        db = DatabaseOperations('examhub')
        a, b = db.runQuery('SELECT testcode from testcodes')
        ls = [i[0] for i in b]

        a, b = db.runQuery('SELECT testname from testcodes')
        names = [i[0] for i in b]
        parms = {
            'test_data': zip(ls, names),
        }
        return render(request, 'create_test.html',parms)
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)

def create_new_test(request):
    try:
        db = DatabaseOperations('examhub')
        if request.method == 'POST':
            data = json.loads(request.body)
            test_name = data['test_name']
            test_id = data['test_id']
            test_weight = data['test_weight']

            a,b = db.runQuery(f"CREATE TABLE {test_id} (QUE VARCHAR(256), OP1 VARCHAR(256), OP2 VARCHAR(256), OP3 VARCHAR(256), OP4 VARCHAR(256), CROP VARCHAR(256))")

            a,b = db.runQuery(f"CREATE TABLE {test_id}_res (username VARCHAR(256), answers VARCHAR(256),report VARCHAR(4096), marks VARCHAR(256), per VARCHAR(256), date_time VARCHAR(256), submit_id VARCHAR(1024))")

            a,b = db.runQuery(f"INSERT INTO testcodes VALUES ('{test_id}','{test_name}','0', '{test_weight}')")
            request.session['editing_test'] = test_id
            if a:
                return JsonResponse({
                    'state' : True,
                    'test_id' : test_id,
                    'test_name' : test_name,
                })
            else:
                return JsonResponse({
                    'state' : False,
            })
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)


def edit_test(request):
    try:
        if request.method == 'POST':
            db = DatabaseOperations('examhub')
            data = json.loads(request.body)
            test_id = data['edit_test_id']
            request.session['editing_test'] = test_id
            return JsonResponse({'test_id': test_id, 'state':True})
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)

def refresh_table(request):
    try:
        db = DatabaseOperations('examhub')
        test_id = request.session.get('editing_test')
        a,b = db.runQuery(f"SELECT * FROM {test_id}")
        if a:
            return JsonResponse({'state':True,'data' : b})
        else:
            return JsonResponse({'state':false})
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)

def add_new_question(request):
    try:
        if request.method == 'POST':
            data = json.loads(request.body)

            ques = data['newques']
            opa = data['newA']
            opb = data['newB']
            opc = data['newC']
            opd = data['newD']
            crop = data['newCROP']
         
            db = DatabaseOperations('examhub')
            test_id = request.session.get('editing_test')
            a,b = db.runQuery(f"INSERT INTO {test_id} values ('{ques}','{opa}','{opb}','{opc}','{opd}','{crop}')")
            return JsonResponse({'state':a})
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)

def logout(request):
    Session.objects.all().delete()
    return redirect('/')

def detailed_report(request):
    try:
        db = DatabaseOperations('examhub')
        if request.method == 'POST':
            sid = request.POST.get('sid')
            testcode = request.session.get('view_test_code')
            a,b = db.runQuery(f"SELECT report FROM {testcode}_res WHERE submit_id = '{sid}'")
            all_data = b[0]
            q_sep = all_data[0].split('|||')
            send_data = []
            for i in q_sep:
                stack = []
                stack = i.split('##')
                if len(stack) > 1:
                    print(len(stack))
                    send_data.append(stack)
            a,b = db.runQuery(f"SELECT username,marks,per,date_time FROM {testcode}_res WHERE submit_id = '{sid}'")
            print(send_data)
            prams = {
                'data' : send_data,
                'std_data' : b[0],
                'tid' : testcode,
            }
            return render(request, 'detailed_report.html',prams)
        else:
            raise Exception("Invalid Request!")
    except Exception as e:
        parms = {
            'err': e
        }
        return render(request, 'index.html', parms)


# ------------------------------------------------------------------------------------------------------------------------
