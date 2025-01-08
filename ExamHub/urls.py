"""
URL configuration for ExamHub project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from . import views
urlpatterns = [
    path('admin/', admin.site.urls),

    # For Both
    path('', views.login ,name="Root_Login"),
    path('logout/', views.logout ,name="logout"),

    # For Students
    path('student_dashboard/', views.student_dashboard ,name="student_dashboard"),
    path('solvetest/', views.start_test ,name="solvetest"),
    path('submitTest/', views.submitTest ,name="submitTest"),

    # For Teachers
    path('teacher_workspace/', views.teacher_workspace ,name="teacher_workspace"),
    path('view_test/', views.view_test ,name="view_test"),
    path('view_result/', views.view_result ,name="view_result"),
    path('user_control/', views.user_control ,name="user_control"),
    path('create_test/', views.create_test ,name="create_test"),
    path('detailed_report/', views.detailed_report ,name="detailed_report"),


    # Json Handlers
    path('initial/', views.initial ,name="initial"),
    path('nextQuestion/', views.nextQuestion ,name="nextQuestion"),
    path('prevQuestion/', views.prevQuestion ,name="prevQuestion"),
    path('submitAnswer/', views.submitAnswer ,name="submitAnswer"),
    path('getUserAnswer/', views.getUserAnswer ,name="getUserAnswer"),

    # For Teachers
    path('createUser/', views.createUser ,name="createUser"),
    path('deleteUser/', views.deleteUser ,name="deleteUser"),
    path('create_new_test/', views.create_new_test ,name="create_new_test"),
    path('edit_test/', views.edit_test ,name="edit_test"),
    path('refresh_table/', views.refresh_table ,name="refresh_table"),
    path('add_new_question/', views.add_new_question ,name="add_new_question"),
    
    

]
