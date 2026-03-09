-- Stadium Security KPI Database

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    event_name VARCHAR(200) NOT NULL,
    event_date DATE NOT NULL,
    venue VARCHAR(200) DEFAULT 'King Fahd Stadium',
    status VARCHAR(20) DEFAULT 'completed'
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    icon VARCHAR(10),
    sort_order INT
);

CREATE TABLE kpis (
    id SERIAL PRIMARY KEY,
    category_id INT REFERENCES categories(id),
    name VARCHAR(300) NOT NULL,
    unit VARCHAR(50),
    lower_is_better BOOLEAN DEFAULT FALSE
);

CREATE TABLE kpi_readings (
    id SERIAL PRIMARY KEY,
    kpi_id INT REFERENCES kpis(id),
    event_id INT REFERENCES events(id),
    target_value DECIMAL(10,2),
    actual_value DECIMAL(10,2),
    recorded_at TIMESTAMP DEFAULT NOW(),
    notes TEXT
);

-- Seed categories
INSERT INTO categories (name, icon, sort_order) VALUES
('Security Readiness', '🛡️', 1),
('Crowd Management', '👥', 2),
('Screening & Inspection', '🔍', 3),
('Emergency Response', '🚨', 4),
('Interagency Coordination', '🤝', 5),
('Cybersecurity', '🔒', 6),
('Fan Security Experience', '😊', 7);

-- Seed events
INSERT INTO events (event_name, event_date) VALUES
('Saudi Pro League Match', '2026-02-15'),
('AFC Champions League', '2026-02-28'),
('International Friendly', '2026-03-08');

-- Seed KPIs
-- Security Readiness
INSERT INTO kpis (category_id, name, unit, lower_is_better) VALUES
(1, 'Completion rate of MoS approved security plans', '%', FALSE),
(1, 'Joint security drills conducted with MoS', 'count', FALSE),
(1, 'Operations room readiness time before event', 'hours', TRUE),
(1, 'Security clearance completion for staff & volunteers', '%', FALSE),
(1, 'Completion rate of Accreditation', '%', FALSE),
(1, 'CCTV readiness', '%', FALSE),
(1, 'MIFON integration', '%', FALSE);

-- Crowd Management
INSERT INTO kpis (category_id, name, unit, lower_is_better) VALUES
(2, 'Average fan entry time', 'minutes', TRUE),
(2, 'Crowd density in gathering areas', 'persons/m²', TRUE),
(2, 'Number of crowd surge incidents', 'count', TRUE),
(2, 'Gates opened on time', '%', FALSE),
(2, 'Crowd management companies approved by MoS', '%', FALSE),
(2, 'Crowd management supervisors qualified by LDI/MoS', '%', FALSE);

-- Screening & Inspection
INSERT INTO kpis (category_id, name, unit, lower_is_better) VALUES
(3, 'Average screening time per fan', 'seconds', TRUE),
(3, 'Number of prohibited items confiscated', 'count', TRUE),
(3, 'Compliance with standard screening procedures', '%', FALSE),
(3, 'Banners entry without approval', 'count', TRUE);

-- Emergency Response
INSERT INTO kpis (category_id, name, unit, lower_is_better) VALUES
(4, 'Average security incident response time', 'minutes', TRUE),
(4, 'Incidents contained within target response time', '%', FALSE),
(4, 'Evacuation time during drills', 'minutes', TRUE),
(4, 'Security reports handled during event', 'count', FALSE);

-- Interagency Coordination
INSERT INTO kpis (category_id, name, unit, lower_is_better) VALUES
(5, 'Information sharing time between command centers', 'seconds', TRUE),
(5, 'Security decisions implemented on time', '%', FALSE),
(5, 'Security Escalation Process time', 'minutes', TRUE);

-- Cybersecurity
INSERT INTO kpis (category_id, name, unit, lower_is_better) VALUES
(6, 'Detected and mitigated cyber intrusion attempts', 'count', TRUE),
(6, 'Cyber incident response time', 'minutes', TRUE),
(6, 'Ticketing & accreditation system uptime', '%', FALSE);

-- Fan Security Experience
INSERT INTO kpis (category_id, name, unit, lower_is_better) VALUES
(7, 'Fan satisfaction with security measures', '%', FALSE),
(7, 'Number of security-related complaints', 'count', TRUE),
(7, 'Clarity of security signage and guidance', '%', FALSE);

-- Seed KPI readings for Event 1: Saudi Pro League Match
INSERT INTO kpi_readings (kpi_id, event_id, target_value, actual_value) VALUES
-- Security Readiness
(1, 1, 100, 95), (2, 1, 4, 3), (3, 1, 3, 2.5), (4, 1, 100, 97),
(5, 1, 100, 92), (6, 1, 100, 98), (7, 1, 100, 88),
-- Crowd Management
(8, 1, 8, 7.2), (9, 1, 4, 3.2), (10, 1, 0, 1), (11, 1, 100, 95),
(12, 1, 100, 90), (13, 1, 100, 85),
-- Screening & Inspection
(14, 1, 30, 25), (15, 1, 0, 12), (16, 1, 100, 96), (17, 1, 0, 0),
-- Emergency Response
(18, 1, 3, 2.5), (19, 1, 100, 94), (20, 1, 10, 9), (21, 1, NULL, 15),
-- Interagency Coordination
(22, 1, 30, 22), (23, 1, 100, 93), (24, 1, 5, 4.2),
-- Cybersecurity
(25, 1, NULL, 3), (26, 1, 5, 3.5), (27, 1, 99.9, 99.95),
-- Fan Security Experience
(28, 1, 90, 87), (29, 1, 0, 8), (30, 1, 95, 90);

-- Seed KPI readings for Event 2: AFC Champions League
INSERT INTO kpi_readings (kpi_id, event_id, target_value, actual_value) VALUES
(1, 2, 100, 98), (2, 2, 4, 4), (3, 2, 3, 2.8), (4, 2, 100, 99),
(5, 2, 100, 96), (6, 2, 100, 99), (7, 2, 100, 93),
(8, 2, 8, 6.5), (9, 2, 4, 3.8), (10, 2, 0, 0), (11, 2, 100, 98),
(12, 2, 100, 95), (13, 2, 100, 92),
(14, 2, 30, 22), (15, 2, 0, 8), (16, 2, 100, 98), (17, 2, 0, 0),
(18, 2, 3, 2.8), (19, 2, 100, 96), (20, 2, 10, 8.5), (21, 2, NULL, 22),
(22, 2, 30, 18), (23, 2, 100, 97), (24, 2, 5, 3.8),
(25, 2, NULL, 1), (26, 2, 5, 4.2), (27, 2, 99.9, 99.8),
(28, 2, 90, 91), (29, 2, 0, 5), (30, 2, 95, 93);

-- Seed KPI readings for Event 3: International Friendly
INSERT INTO kpi_readings (kpi_id, event_id, target_value, actual_value) VALUES
(1, 3, 100, 100), (2, 3, 4, 4), (3, 3, 3, 3), (4, 3, 100, 100),
(5, 3, 100, 98), (6, 3, 100, 100), (7, 3, 100, 95),
(8, 3, 8, 7.8), (9, 3, 4, 3.5), (10, 3, 0, 0), (11, 3, 100, 100),
(12, 3, 100, 97), (13, 3, 100, 94),
(14, 3, 30, 28), (15, 3, 0, 5), (16, 3, 100, 99), (17, 3, 0, 0),
(18, 3, 3, 2.2), (19, 3, 100, 98), (20, 3, 10, 9.2), (21, 3, NULL, 18),
(22, 3, 30, 25), (23, 3, 100, 95), (24, 3, 5, 4.5),
(25, 3, NULL, 2), (26, 3, 5, 3.8), (27, 3, 99.9, 99.92),
(28, 3, 90, 89), (29, 3, 0, 3), (30, 3, 95, 92);

-- Useful views
CREATE VIEW v_kpi_status AS
SELECT
    r.id as reading_id,
    e.event_name,
    e.event_date,
    c.name as category,
    c.sort_order,
    k.name as kpi_name,
    k.unit,
    k.lower_is_better,
    r.target_value,
    r.actual_value,
    CASE
        WHEN r.target_value IS NULL THEN 'Info'
        WHEN k.lower_is_better AND r.actual_value <= r.target_value THEN 'On Target'
        WHEN k.lower_is_better AND r.actual_value > r.target_value THEN 'Needs Attention'
        WHEN NOT k.lower_is_better AND r.target_value > 0 AND (r.actual_value / r.target_value) >= 0.95 THEN 'On Target'
        WHEN NOT k.lower_is_better AND r.target_value > 0 AND (r.actual_value / r.target_value) >= 0.85 THEN 'Needs Attention'
        WHEN NOT k.lower_is_better AND r.target_value > 0 AND (r.actual_value / r.target_value) < 0.85 THEN 'Below Target'
        ELSE 'On Target'
    END as status,
    CASE
        WHEN r.target_value IS NULL OR r.target_value = 0 THEN NULL
        WHEN k.lower_is_better THEN ROUND(((r.target_value - r.actual_value) / r.target_value * 100)::numeric, 1)
        ELSE ROUND(((r.actual_value / r.target_value) * 100)::numeric, 1)
    END as achievement_pct
FROM kpi_readings r
JOIN kpis k ON r.kpi_id = k.id
JOIN categories c ON k.category_id = c.id
JOIN events e ON r.event_id = e.id;

CREATE VIEW v_category_scores AS
SELECT
    event_name,
    event_date,
    category,
    sort_order,
    COUNT(*) as total_kpis,
    SUM(CASE WHEN status = 'On Target' THEN 1 ELSE 0 END) as on_target,
    SUM(CASE WHEN status = 'Needs Attention' THEN 1 ELSE 0 END) as needs_attention,
    SUM(CASE WHEN status = 'Below Target' THEN 1 ELSE 0 END) as below_target,
    ROUND(AVG(CASE WHEN achievement_pct IS NOT NULL THEN achievement_pct END)::numeric, 1) as avg_achievement
FROM v_kpi_status
GROUP BY event_name, event_date, category, sort_order
ORDER BY event_date DESC, sort_order;
