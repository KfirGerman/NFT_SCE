def fib(n, memo={}):
    if n <= 1:
        return n
    elif n not in memo:
        memo[n] = fib(n - 1, memo) + fib(n - 2, memo)
    return memo[n]


def main():
    try:
        n_terms = int(input("Enter the number of terms: "))

        if n_terms <= 0:
            print("Please enter a positive integer")
        else:
            print("Fibonacci sequence:")
            for i in range(n_terms):
                print(fib(i))

    except ValueError:
        print("Invalid input! Please enter a positive integer.")
    except KeyboardInterrupt:
        print("\nProgram interrupted by the user.")
    except RecursionError:
        print("Input too high! Please enter a smaller number.")


if __name__ == "__main__":
    main()
