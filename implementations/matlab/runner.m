function runner(niter,lambda,image_file)
% Example: runner(500,1);
expected_output = 52608;

Nr = 502;
Nc = 458;
fileID = fopen(image_file,'r');
for i = 1:3
    fgets(fileID); % skip header
end
image  = reshape(fscanf(fileID,'%lf'),Nc,Nr);
image  = image.';
fclose(fileID);

% ROI image size
NeROI = Nr * Nc;

iN = -1 + 1:Nr;
iS =  1 + 1:Nr;
jW = -1 + 1:Nc;
jE =  1 + 1:Nc;

dN = zeros(Nr, Nc);
dS = zeros(Nr, Nc);
dW = zeros(Nr, Nc);
dE = zeros(Nr, Nc);

c  = zeros(Nr, Nc);

% set boundary value
iN(1)  = 1;
iS(Nr) = Nr;
jW(1)  = 1;
jE(Nc) = 1;

% scale image
image = exp(image / 255);

tic();
image = srad_core(image,NeROI,Nc,Nr,iN,iS,jW,jE,dN,dS,dW,dE,c,lambda,niter);
elapsedTime = toc();

image = log(image) * 255;
j     = sum(floor(image(1:Nr)));
msg = sprintf('{ \"status\": %d, \"options\": \"%d %f\", \"time\": %f, \"output\": %d }\n', 1, niter, lambda, elapsedTime, j);
disp(msg);

end
