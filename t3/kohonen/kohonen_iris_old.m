% Solve a Clustering Problem with a Self-Organizing Map
% Script generated by Neural Clustering app
% Created 17-May-2017 10:11:11
%

% -------- Program settings --------
num_classes = 3;
train_percent = 0.75;

% ------ Dataset construction ------
x = csvread("datasets/generoIris.csv", 1, 0)'; % ignores the first row
dimensions = size(x);
num_values = dimensions(1); % one parameter value per row
num_samples = dimensions(2); % one sample per column
x = x(:,randperm(num_samples)); % shuffles the samples

% ------ Training/test set construction ------
training_boundary = int64(num_samples * train_percent);
training_set = x(:,1:training_boundary);

test_set = x(:,(training_boundary + 1):end);
test_set((num_values + 1 - num_classes):end,:) = 0;

% Create a Self-Organizing Map
dimension1 = 10;
dimension2 = 10;
net = selforgmap([dimension1 dimension2], 100, 3, 'gridtop');

% Train the Network
[net,tr] = train(net,training_set);

% Test the Network
y = net(test_set);
%vec2ind(y)

% View the Network
%view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotsomtop(net)
%figure, plotsomnc(net)
%figure, plotsomnd(net)
%figure, plotsomplanes(net)
%figure, plotsomhits(net,x)
%figure, plotsompos(net,x)

