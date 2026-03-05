SELECT * FROM public.db5g1m1
ORDER BY id ASC ;

ALTER TABLE db5g1m1
RENAME COLUMN thd_il TO thd_i;

SELECT
    AVG(active_energy),
    AVG(reactive_power),
    AVG(apparent_power),
    AVG(current_i1),
    AVG(current_i2),
    AVG(current_i3),
    AVG(voltage_v1),
    AVG(voltage_v2),
    AVG(voltage_v3),
    AVG(active_power),
    AVG(frequency),
    AVG(power_factor),
    AVG(kw_demand),
    AVG(thd_i),
    AVG(thd_v),
    AVG(spare1),
    AVG(spare2),
    AVG(spare3)
FROM db5g1m1
WHERE date_time >= '2026-03-03'
AND date_time < '2026-03-03'::date + INTERVAL '1 day';

  SELECT
       *
    FROM db5g1m1
    WHERE DATE(date_time) = CURRENT_DATE
    ORDER BY date_time ASC;

-- insert query
INSERT INTO db5g1m1 (
    active_energy,
    reactive_power,
    apparent_power,
    current_i1,
    current_i2,
    current_i3,
    voltage_v1,
    voltage_v2,
    voltage_v3,
    active_power,
    frequency,
    power_factor,
    kw_demand,
    thd_i,
    thd_v,
    spare1,
    spare2,
    spare3
)
VALUES (
    -- active_energy: 100–2000
    ROUND((100 + random() * 1900)::numeric, 4),

    -- reactive_power: 50–400
    ROUND((50 + random() * 350)::numeric, 4),

    -- apparent_power: 200–2000
    ROUND((200 + random() * 1800)::numeric, 4),

    -- currents: 10–60 A
    ROUND((10 + random() * 50)::numeric, 4),
    ROUND((10 + random() * 50)::numeric, 4),
    ROUND((10 + random() * 50)::numeric, 4),

    -- voltages: 220–240 V
    ROUND((220 + random() * 20)::numeric, 4),
    ROUND((220 + random() * 20)::numeric, 4),
    ROUND((220 + random() * 20)::numeric, 4),

    -- active_power: 100–2000 kW
    ROUND((100 + random() * 1900)::numeric, 4),

    -- frequency: 49.5–50.5 Hz
    ROUND((49.5 + random() * 1.0)::numeric, 4),

    -- power_factor: 0.85–0.99
    ROUND((0.85 + random() * 0.14)::numeric, 4),

    -- kw_demand: 100–2000
    ROUND((100 + random() * 1900)::numeric, 4),

    -- THD: 0.5–10%
    ROUND((0.5 + random() * 9.5)::numeric, 4),
    ROUND((0.5 + random() * 9.5)::numeric, 4),

    -- spare columns
    0,
    0,
    0
);
SELECT * FROM public.db5g1m1
WHERE DATE(date_time) = CURRENT_DATE
ORDER BY id ASC ;