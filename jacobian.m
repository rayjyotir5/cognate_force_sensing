function [J, dJ]=jacobian(th,dth)


[n dof type alp a b bt dx dy dz m g  Icxx Icyy Iczz Icxy Icyz Iczx aj al angs]=inputs(); 

alp1=th(1);
alp2=th(2);
alp3=th(2)+th(3)-2*pi;
alp31=th(2)+th(3)-angs(2);
alp4=th(4);
alp5=th(4)+th(5)-2*pi;
alp51=th(4)+th(5)-angs(1);
alp6=th(4)+th(5)+th(6)-2*pi;
alp7=th(7);
alp8=th(7)+th(8)-2*pi;
alp81=th(7)+th(8)+angs(2)-2*pi;
alp9=th(7)+th(8)+th(9)-2*pi;

% Velocities_dtheta
J1=[ al(2)*sin(alp1)
     -al(2)*cos(alp1)
     0
     0
     0
     0
     0
     0
     ];
J2= [-al(3)*sin(alp2)-al(4)*sin(alp3)
        al(3)*cos(alp2)+al(4)*cos(alp3)
        al(3)*sin(alp2)+al(6)*sin(alp31)
        -al(3)*cos(alp2)-al(6)*cos(alp31)
        al(3)*sin(alp2)+al(6)*sin(alp31)
        -al(3)*cos(alp2)-al(6)*cos(alp31)
        0
        0
        ];
J3= [-al(4)*sin(alp3)
        al(4)*cos(alp3)
        al(6)*sin(alp31)
        -al(6)*cos(alp31)
        al(6)*sin(alp31)
        -al(6)*cos(alp31)
        0
        0
        ];
J4= [0
        0
        0
        0
        -al(7)*sin(alp4)-al(9)*sin(alp51)
        al(7)*cos(alp4)+al(9)*cos(alp51)
        al(7)*sin(alp4)+al(11)*sin(alp5)+al(15)*sin(alp6)
        -al(7)*cos(alp4)-al(11)*cos(alp5)-al(15)*cos(alp6)
        ];
J5= [0
        0
        0
        0
        -al(9)*sin(alp51)
        al(9)*cos(alp51)
        al(11)*sin(alp5)+al(15)*sin(alp6)
        -al(11)*cos(alp5)-al(15)*cos(alp6)
        ];
J6= [0
        0
        0
        0
        0
        0
        al(15)*sin(alp6)
        -al(15)*cos(alp6)
        ];
J7= [0
        0
        -al(8)*sin(alp7)-al(10)*sin(alp81)
        al(8)*cos(alp7)+al(10)*cos(alp81)
        0
        0
        -al(8)*sin(alp7)-al(14)*sin(alp8)-al(16)*sin(alp9)
        al(8)*cos(alp7)+al(14)*cos(alp8)+al(16)*cos(alp9)
        ];
J8= [0
        0
        -al(10)*sin(alp81)
        al(10)*cos(alp81)
        0
        0
        -al(14)*sin(alp8)-al(16)*sin(alp9)
        al(14)*cos(alp8)+al(16)*cos(alp9)
        ];
J9= [0
        0
        0
        0
        0
        0
        -al(16)*sin(alp9)
        al(16)*cos(alp9)
        ];

J=[J1 J2 J3 J4 J5 J6 J7 J8 J9];

% Acceleration_ddtheta 
dalp1=dth(1);
dalp2=dth(2);
dalp3=dth(2)+dth(3);
dalp4=dth(4);
dalp5=dth(4)+dth(5);
dalp6=dth(4)+dth(5)+dth(6);
dalp7=dth(7);
dalp8=dth(7)+dth(8);
dalp9=dth(7)+dth(8)+dth(9);

% Velocities_dtheta
dJ1=[ al(2)*cos(alp1)*dalp1
     al(2)*sin(alp1)*dalp1
     0
     0
     0
     0
     0
     0
     ];
dJ2= [-al(3)*cos(alp2)*dalp2-al(4)*cos(alp3)*dalp3
        -al(3)*sin(alp2)*dalp2-al(4)*sin(alp3)*dalp3
        al(3)*cos(alp2)*dalp2+al(6)*cos(alp31)*dalp3
        al(3)*sin(alp2)*dalp2+al(6)*sin(alp31)*dalp3
        al(3)*cos(alp2)*dalp2+al(6)*cos(alp31)*dalp3
        al(3)*sin(alp2)*dalp2+al(6)*sin(alp31)*dalp3
        0
        0
        ];
dJ3= [-al(4)*cos(alp3)*dalp3
        -al(4)*sin(alp3)*dalp3
        al(6)*cos(alp31)*dalp3
        al(6)*sin(alp31)*dalp3
        al(6)*cos(alp31)*dalp3
        al(6)*sin(alp31)*dalp3
        0
        0
        ];
dJ4= [0
        0
        0
        0
        -al(7)*cos(alp4)*dalp4-al(9)*cos(alp51)*dalp5
        -al(7)*sin(alp4)*dalp4-al(9)*sin(alp51)*dalp5
        al(7)*cos(alp4)*dalp4+al(11)*cos(alp5)*dalp5+al(15)*cos(alp6)*dalp6
        al(7)*sin(alp4)*dalp4+al(11)*sin(alp5)*dalp5+al(15)*sin(alp6)*dalp6
        ];
dJ5= [0
        0
        0
        0
        -al(9)*cos(alp51)*dalp5
        -al(9)*sin(alp51)*dalp5
        al(11)*cos(alp5)*dalp5+al(15)*cos(alp6)*dalp6
        al(11)*sin(alp5)*dalp5+al(15)*sin(alp6)*dalp6
        ];
dJ6= [0
        0
        0
        0
        0
        0
        al(15)*cos(alp6)*dalp6
        al(15)*sin(alp6)*dalp6
        ];
dJ7= [0
        0
        -al(8)*cos(alp7)*dalp7-al(10)*cos(alp81)*dalp8
        -al(8)*sin(alp7)*dalp7-al(10)*sin(alp81)*dalp8
        0
        0
        -al(8)*cos(alp7)*dalp7-al(14)*cos(alp8)*dalp8-al(16)*cos(alp9)*dalp9
        -al(8)*sin(alp7)*dalp7-al(14)*sin(alp8)*dalp8-al(16)*sin(alp9)*dalp9
        ];
dJ8= [0
        0
        -al(10)*cos(alp81)*dalp8
        -al(10)*sin(alp81)*dalp8
        0
        0
        -al(14)*cos(alp8)*dalp8-al(16)*cos(alp9)*dalp9
        -al(14)*sin(alp8)*dalp8-al(16)*sin(alp9)*dalp9
        ];
dJ9= [0
        0
        0
        0
        0
        0
        -al(16)*cos(alp9)*dalp9
        -al(16)*sin(alp9)*dalp9
        ];

dJ=[dJ1 dJ2 dJ3 dJ4 dJ5 dJ6 dJ7 dJ8 dJ9];
