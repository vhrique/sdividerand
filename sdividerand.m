function [trainInd, valInd, testInd] = sdividerand(Y,trainRatio,valRatio,testRatio)
%%  Stratified dividerand
%
%	Divide targets into three sets using random indices, while keeping
%	classes' original proportion.
%
%--------------------------------------------------------------------------
%
%   Inputs:
%       Y:
%           Targets to divide up. An array of categories.
%       trainRatio:
%           Ratio of vectors for training. Default = 0.7.
%       valRatio:
%           Ratio of vectors for validation. Default = 0.15.
%       testRatio:
%           Ratio of vectors for testing. Default = 0.15.
%
%   Outputs:
%       trainInd:
%           Training indices.
%       valInd:
%           Validation indices.
%       testInd:
%           Test indices.
%
%--------------------------------------------------------------------------
%
%   Version 1.0 - Copyright 2018
%
%       For new releases and bug fixing of this Tool Set please send e-mail
%       to the authors.
%
%--------------------------------------------------------------------------
%
%   Institution:
%       Optimization, Modeling and Control Systems Research Group
%
%       Graduate Program in Industrial and Systems Engineering - PPGEPS
%
%       Pontifical Catholic University of Paraná - Brazil.
%           <http://en.pucpr.br/>
%
%--------------------------------------------------------------------------
%
%	Authors:
%       Victor Henrique Alves Ribeiro
%           <victor.henrique@pucpr.edu.br>
%

    %% Initialize
    
    if (nargin < 4), testRatio = 0.15; end        
    if (nargin < 3), valRatio = 0.15; end
    if (nargin < 2), trainRatio = 0.7; end
    
    allInd = 1 : length(Y);
    
    trainInd = [];
    valInd = [];
    testInd = [];
    
    uniques = unique(Y);
    
    %% For each class
    for q = 1 : length(uniques)
        
        qInd = allInd(Y == uniques(q));
        Q = length(qInd);
        
        [train, val, test] = dividerand(...
            Q, trainRatio, valRatio, testRatio);
        
        trainInd = [trainInd, qInd(train)];
        valInd = [valInd, qInd(val)];
        testInd = [testInd, qInd(test)];
    end    

end

