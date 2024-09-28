function N=Bateman_equations(N0,lambda)
    %initializing arrays
    syms s;
    n=length(lambda);
    A=sym(zeros(n));
    b=zeros(n,1);
    N=sym(zeros(n,1));
    %diagonal elements of the matrix A
    for i=1:n-1
         A(i,i)=s+lambda(i);
    end
    %last element of the diagonal
    A(n,n)=s;
    for i=2:n
        A(i,i-1)=-lambda(i-1);
    end
    %initial condition (more can be added for other isotopes)
    b(1)=N0;
    %finding the solution in the Laplace domain
    N_s=A\b;
    %The output is an array with the solved functions in the time domain
    for i=1:n
    N(i)=ilaplace(N_s(i));
    end
end