from GroupProject.employee_management.controller.CompanyController import CompanyController
from GroupProject.employee_management.model.Trainee import Trainee
from GroupProject.employee_management.model.Employee import Employee

cc = CompanyController()
cc.addEmployeeOrTrainee(Employee("e1","e2","Junior DEV", 5000))
cc.addEmployeeOrTrainee(Employee("e1","e2","Junior DEV", 5000))
cc.addEmployeeOrTrainee("Pani Jadzia z gazowni")
cc.addEmployeeOrTrainee(Trainee("p1","p1"))
cc.getEmployees()
#cc.getTraineeOrderByLogin()
#cc.getManagersAndHeadsOrderByLoginASC()
# cc.getPrise(1000,"p1")
# cc.getPrise(1000,"e11")
#print()
# cc.ChangeEmployeeSalary("mk1", 1000)
# cc.ChangeEmployeeSalary("mk1", 11000)
cc.deleteEmployeeOrTraineeByLoginWithConfirm("mk9")