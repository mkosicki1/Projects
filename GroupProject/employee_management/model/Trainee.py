import hashlib

class Trainee:
    def __init__(self, login, password):
        self.login = login
        self.password = hashlib.md5(("salt:XYZ"+password).encode('utf-8')).hexdigest()
        self.possition = "PRAKTYKANT"
        self.salary = 0
    def assignPrise(self, amount):
        self.salary += amount

    def __str__(self):
        return "| %15s | %10s | %15s | %13.2f zł |" % \
               (self.login, self.password[0:8], self.possition, self.salary)

# t = Trainee("MiroslawK", "qweasd")
# t.assignPrise(5000)
# print(t)
