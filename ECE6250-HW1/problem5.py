import numpy as np
import matplotlib.pyplot as plt

if __name__ == "__main__":
    n = np.linspace(-20, 20, 41)
    M = 7
    h_n = np.sinc(n / M)

    plt.stem(n, h_n)
    plt.show()

    t = np.linspace(-0.5, 0.5, 1001)
    B = 9
    x_t = (np.cos(2*np.pi*B*t)-np.cos(2*np.pi*(B+1)*t))/((2*B+1)*(1.-np.cos(2*np.pi*t)))

    plt.plot(t, x_t)
    plt.show()

    n = np.linspace(-40, 40, 81)
    n[40] = 1e-6 # if this is 0, divide by 0 error happens. This gets us close
    N = 51
    B = 7
    x_n = (np.cos(2*np.pi*B*n/N)-np.cos(2*np.pi*(B+1)*n/N))/((2*B+1)*(1.-np.cos(2*np.pi*n/N)))

    plt.stem(n, x_n)
    plt.show()