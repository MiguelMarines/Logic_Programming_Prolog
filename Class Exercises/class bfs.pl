mov(1, 2).
mov(1, 3).
mov(1, 4).
mov(2, 5).
mov(2, 6).
mov(2, 7).
mov(3, 8).
mov(3, 9).
mov(3, 6).
mov(4, 5).
mov(4, 7).
mov(4, 11).
mov(4, 9).
mov(7, 8).
mov(7, 10).
mov(8, 9).
state_record(State, Parent, [State, Parent]).go(Start, Goal) :-     empty_queue(Empty_open),    state_record(Start, nil, State),    add_to_queue(State, Empty_open, Open),    empty_set(Closed),    path(Open, Closed, Goal).path(Open,_,_) :- empty_queue(Open),                  write('graph searched, no solution found').    path(Open, Closed, Goal) :-     remove_from_queue(Next_record, Open, _),    state_record(State, _, Next_record),    State = Goal,    write('Solution path is: '), nl,    printsolution(Next_record, Closed).    path(Open, Closed, Goal) :-     remove_from_queue(Next_record, Open, Rest_of_open),    (bagof(Child, moves(Next_record, Open, Closed, Child), Children);Children = []),    add_list_to_queue(Children, Rest_of_open, New_open),     add_to_set(Next_record, Closed, New_closed),    path(New_open, New_closed, Goal),!.moves(State_record, Open, Closed, Child_record) :-    state_record(State, _, State_record),    mov(State, Next),    % not (unsafe(Next)),    state_record(Next, _, Test),    not(member_queue(Test, Open)),    not(member_set(Test, Closed)),    state_record(Next, State, Child_record).printsolution(State_record, _):-     state_record(State,nil, State_record),    write(State), nl.	printsolution(State_record, Closed) :-    state_record(State, Parent, State_record),    state_record(Parent, _, Parent_record),    member(Parent_record, Closed),    printsolution(Parent_record, Closed),    write(State), nl. add_list_to_queue([], Queue, Queue).add_list_to_queue([H|T], Queue, New_queue) :-    add_to_queue(H, Queue, Temp_queue),    add_list_to_queue(T, Temp_queue, New_queue).