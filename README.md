# Stadium Security KPI Dashboard — Grafana

Real-time security monitoring dashboard for sporting venues built on Grafana + PostgreSQL.

## Quick Start

```bash
docker-compose up -d
```

Open **http://localhost:3000** in your browser.

- **Username:** `admin`
- **Password:** `stadium2026`

The dashboard loads automatically as the home page.

## Features

- **Dark theme** with color-coded KPI status indicators
- **6 gauge panels** — one per security category (Security Readiness, Crowd Management, Screening, Emergency Response, Interagency, Cybersecurity)
- **Top stat cards** — Overall Score, Total Incidents, Avg Response Time, Fan Satisfaction, Complaints, Status Distribution
- **Bar chart** — Category performance vs 95% target
- **Trend line chart** — KPI improvement across events
- **Detailed KPI tables** — per-category breakdown with status icons
- **Event filter dropdown** — switch between events instantly
- **Auto-refresh** every 10 seconds

## Architecture

```
┌─────────────┐      ┌──────────────┐
│   Grafana    │─────▶│  PostgreSQL   │
│  (port 3000) │      │  (port 5432)  │
└─────────────┘      └──────────────┘
```

- **PostgreSQL** stores all KPI data (events, categories, KPIs, readings)
- **Grafana** queries PostgreSQL views for dashboard panels
- **SQL Views** compute status and achievement scores automatically

## Adding New Events

Connect to PostgreSQL and insert data:

```sql
-- Add a new event
INSERT INTO events (event_name, event_date) VALUES ('New Match', '2026-04-01');

-- Add KPI readings (kpi_id 1-30, event_id = new event ID)
INSERT INTO kpi_readings (kpi_id, event_id, target_value, actual_value)
VALUES (1, 4, 100, 97);
```

The dashboard updates automatically.

## Stopping

```bash
docker-compose down        # Stop containers (keep data)
docker-compose down -v     # Stop and delete all data
```
