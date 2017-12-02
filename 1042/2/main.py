from math import sqrt

def run():
    R1 = (float)(input("R1="))
    R2 = (float)(input("R2="))
    R3 = (float)(input("R3="))
    S = (float)(input("S="))
    Rx = (R1/R2)*R3
    print("Rx = %0.4f" % (Rx,))
    delta_yi = 0.0005*(R3 + 1000/10)
    print("delta_yi = %0.4f" % (delta_yi,))
    u_yi = delta_yi / sqrt(3)
    print("u_yi = %0.4f" % (u_yi,))
    delta_ling = 0.2 / S
    print("delta_ling = %0.4f" % (delta_ling,))
    u_ling = delta_ling / sqrt(3)
    print("u_ling = %0.4f" % (u_ling,))
    u_R = sqrt(u_yi*u_yi + u_ling*u_ling)
    print("u_R = %0.4f" % (u_R,))
    

if __name__ == '__main__':
    run()