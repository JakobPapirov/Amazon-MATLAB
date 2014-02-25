%%AmazonFreeDelivery
% This program will determine the best possible item combinations to reach
% the lowest price limit to get free shipping
% Limitation: Does only sum items in order no within the list, at the
% moment.

%% Housekeeping
run rent
%% Program

list = [];
    while length(list) < 3
        list_rows_i = input('Please type in the number of items to check: [min 3 items] ');
        list = zeros(list_rows_i, 1);
        if length(list) < 3
            disp('Please add more items to the list.');
        else
            disp('You have entered enough items, thanks!');
        end
    end

    for loop_1 = 1:list_rows_i
        list(loop_1, 1) = input('Please type in the prices of the items [2.11, 3.0, etc]: ');
    end

threshold = 25; % £

if sum(list) <= threshold
    disp('You don''t have enought items to reach the threshold');
else
%     list_perm = perms(list);
%     list_perm_trans = list_perm';
%     [list_perm_rows, list_perm_cols] = size(list_perm_trans);
%     list_perm_sum = zeros(list_perm_rows, list_perm_cols);
%         for iii = 1:list_perm_cols
%             for ii = 1:list_perm_rows
%                 list_perm_sum(ii, iii) = sum( list_perm_trans(1:ii, iii) );
%             end
%         end
%     list_above_threshold = find( list_perm_sum >= threshold);
%     list_above = list_perm_sum(list_above_threshold);
% 	list_above_unique = unique(list_above);
%     list_above_perm_sum = find( list_perm_sum == list_above_unique); % only works when RightHandSide has 1 element
%     list_above_perm = list_perm_trans(list_above_perm_sum);
    list_sum = zeros( length(list) ); % Skapa en tom vektor för summor
        for loop_2 = 1:length(list)
            list_sum(loop_2, 1) = sum( list(1:loop_2) ); % Summera det första elementet med respektive
            list_sum(loop_2, 2) = sum( list(2:loop_2) );
            list_sum(loop_2, 3) = sum( list(3:loop_2) );
        end
    list_sum_above = find( list_sum >= threshold); % Hitta de summor som är över gränsen
    list_item_above = zeros( length(list), length(list_sum_above) ); % Skapa en tom matris som är [list x list_sum_above_len] stor
        for loop_3 = 1:length(list_sum_above)
                list_item_above(1:list_sum_above(loop_3), loop_3)  = list(1: list_sum_above(loop_3) ); % Plocka ut de element som tillsammans adderas ihop till gränsen
        end
    disp('You can buy these items');
    disp(num2str(list_item_above));
end

%% Comments
% I can reshuffle intergers using randperm, maybe that will allow me to sum
% the elements in between