t = -5:0.01:5;

x1 = unit_step(t);
figure (1);
plot(t, x1);
ylim([-0.5,1.5]);

x2 = ramp(t);
figure (2);
plot(t, x2);
ylim([-0.50,6]);

x3 = rect(t, 0, 2);
figure (3);
plot(t, x3);
ylim([-0.5,1.5]);

figure (4);
plot(t, y1(t));
ylim([-0.5,4]);

figure (5);
plot(t, y1(t / 2));
ylim([-0.5,4]);

figure (6);
plot(t, (y1(t) + y1(t + 1)) .* rect(t, 0, 2));
ylim([-0.5,7]);

figure (7);
plot(t, ( (1 - cos(3 .* t)) .* rect(t, 2, 2)));
ylim([-0.5,2.5]);


function y = unit_step(t)
y = zeros (size(t));
y (t >= 0) = 1;
end

function y = ramp(t)
y = zeros (size(t));
y (t >= 0) = t (t >= 0);
end

function y = rect(t, pos, len)
y = zeros (size(t));
y (t >= pos - len /2 & t < pos + len / 2) = 1;
end

function y = y1(t)
y = unit_step(-t + 2) + ramp(t + 1) - ramp(t - 1);
end
