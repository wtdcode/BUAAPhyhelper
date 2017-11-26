from math import sqrt

def run():
    delta_d_5 = []
    for i in range(5):
        delta_d_5.append(float(input("请输入连续的5个逐差值（500个圈圈）：")))
    delta_5d = sum(delta_d_5)/5
    print("delta_5d = %.10f mm" % delta_5d)
    u_a_5d = cal_u_a_5d(delta_d_5, delta_5d)
    print("u_a_5d = %.10f mm" % u_a_5d)
    u_b_5d = 0.00005/sqrt(3)
    print("u_b_5d = %.10f mm" % u_b_5d)
    u_5d = sqrt(u_a_5d*u_a_5d + u_b_5d*u_b_5d)
    print("u_5d = %.10f mm" % u_5d)
    u_n = 1/sqrt(3)
    print("u_N = %.10f" % u_n)
    u_lambda_div = sqrt((u_5d/delta_5d)*(u_5d/delta_5d) + (u_n/500)*(u_n/500))
    print("u_lambda/lambda = %.10f" % u_lambda_div)
    l = 2*delta_5d*1000000/500
    print("lambda = %.10f nm" % l)
    print("u_lambda = %.10f nm" % (u_lambda_div*l))
    print("绝对误差：%.10f 相对误差：%.10f" % (632.8 - l, (632.8-l)/632.8))
    print("（想开点，误差大点没什么的")


def cal_u_a_5d(delta_d_5, delta_d):
    tp = 0
    for d in delta_d_5:
        tp += (d-delta_d)*(d-delta_d)
    return sqrt(tp/20)

if __name__ == '__main__':
    run()
