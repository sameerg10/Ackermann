-- Name: Sameer Gulamali
-- ID: 0808465
-- Program Details: An ada program that performs the Ackermann function iteratively using stacks

with Ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Calendar; use Ada.Calendar;
with stack; use stack;


procedure iterative is

    m, n, r : natural;
    
    function ackermann (temp_m, temp_n : natural) return natural is
    m, n : natural;
        
    begin
        m := temp_m;
        n := temp_n;
        
        push(m);
        while not stackEmpty loop
            pop(m);
            if m = 0 then
                n := n + 1;
            elsif n = 0 then
                n := 1;
                push(m - 1);
            else
                n := n - 1;
                push(m - 1);
                push(m);
            end if;
        end loop;
        
        return n;
        
    end ackermann;
    
    Start_Time : Time;
    Finis_Time : Time;
    
begin

    put("Enter m and n: ");
    get(m);
    get(n);
    Start_Time := Clock;
    r := ackermann(m,n);
    Finis_Time := Clock;
    put ("Result = ");
    put(Natural'Image (ackermann (m, n)));
    new_line;
    Put_Line("Ackermann takes" & Duration'Image(Finis_Time - Start_Time) & " seconds.");
    
end iterative;