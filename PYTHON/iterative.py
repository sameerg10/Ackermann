# Name: Sameer Gulamali
# ID: 0808465
# Program Details: An python program that performs the Ackermann function iteratively using stacks

# below stack method reference found @ https://codeatsociallywired.wordpress.com/tag/stacks-in-python/
#class for defining a stack
import sys, timeit, time
class Stack:
    def __init__(self):
        self.items = []
         
    #method for pushing an item on a stack
    def push(self,item):
        self.items.append(item)
         
    #method for popping an item from a stack
    def pop(self):
        return self.items.pop()
    
    #method to check whether the stack is empty or not
    def isEmpty(self):
        return (self.items == [])   
        
    def __str__(self):
        return str(self.items)
     
# ackermann function that uses stacks
def ackermann(m,n):
    stack = Stack()
    
    stack.push(m)
    while stack.items != []:
        m = stack.pop()
        if m == 0:
            n = n + 1
        elif n == 0:
            n = 1
            stack.push(m-1)
        else:
            n = n - 1
            stack.push(m-1)
            stack.push(m)
    return n
    
if __name__ == "__main__":
    
    m, n = map(int,raw_input("Enter m and n: ").split())
    #start= timeit.timeit()
    startTime = (time.time())
    r = ackermann(m, n)
    endTime = (time.time())
    time = endTime - startTime
    #end= timeit.timeit()
    #time= (end-start)
    print "Result = ", r
    print "Time taken = ", time, " seconds"
