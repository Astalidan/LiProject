#include <iostream>
#include <cassert>

int fib(int n)
{
    if(n <= 1)
    {
        return n;
    }
    else
    {
        return (fib(n - 1) + fib(n - 2));
    }
}

int main()
{
    int n;

    std::cout << "Enter a value: ";
    std::cin >> n;

    //I'm Lazy and didn't feel like putting in an error checking loop, so I did this instead
    //You should try it to see what happens

    assert(n >= 0);

    for(int i = 0; i < n; i++)
    {
        std::cout << fib(i) << std::endl;
    }
    return 0;
}
