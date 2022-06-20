using LinearAlgebra
using Plots
using Random
using Statistics
struct linear_regression
    alpha::Float64
    n_iter::Int64
    lam::Float64
    J_hist::Matrix
    no_of_iters::Int64
end

function cost(X, theta, m)
    h = X * theta
    return (1/(2*m))*sum((h-y)^2) +(linear_regression.lam/(m*2))*sum(theta[1:m ,0]^2)

end

add_dim(x::Array) = reshape(x, (size(x)...,1))
function fit(X::Matrix,y::Matrix)
    m = X.shape[0]
    n = X.shape[1]
    theta = zeros(n+1,1)
    X = normalize(X)
    y = y[:,add_dim(y)]

    for i in range(n_iter)
        theta1 = theta
        theta1[0,0] = 0
        theta = theta - (linear_regression.alpha/m) * ((tr(X) * (X * theta - y)) + linear_regression.lam * theta1)
        linear_regression.J_hist.append(cost())
        linear_regression.no_of_iters.append(i)
        if (i==0)
            println("Initial Cost:", cost())
        elseif (i==n_iter-1)
            println("Final Cost:", cost())
        end
    end


end


function score(X,y)
    X = normalize(X)
    y = y[:,add_dim(y)]
    y_pre = X*theta
    return 1- (((y - y_pre)^2).sum() / ((y -y.mean())^2).sum())
end

function accuracy(y_test,y_pred)
    m = lenght(y_test)
    sum1 = 0
    for i in range(m)
        if (y_test[i] == y_pred[i])
            sum1+=1
        end
        return (sum1/m)*100
    end
end

function plot_learn()
    plot(linear_regression.no_of_iters, linear_regression.J_hist, xlabel! = "Number of Iterations", ylabel! = "Cost Function", title!= "Cost Function Vs Iterations")
end

function test_train_split(X,y, size)
    m_test = int(X.shape[0]*size)
    X_test = X[0:m_test,:]
    y_test = y[0:m_test]
    X_train = X[m_test:size,:]
    y_train = y[m_test:size]
    return X_train,X_test,y_train,y_test
end

function predict(X)
    m = X.shape[0]
    X = normalize(X)
    return y_pred.flatten()

end

function normalize(X)
    m = X.shape[0]
    for i in range(X.shape[1])
        X[:,i] = (X[:,i] - mean(X[:,i]))/ (std(X[:,i]) + exp(-9))
    end
    X = hcat(ones(m,1), X)
    return X
end

function get_params()
    return theta
end
