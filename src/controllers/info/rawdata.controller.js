const db = require('../../config/db.config.js');
const rawDb = require('../../config/rawdata.db.config.js');

// fetch the latest raw data for a meter by its ID and optional date parameter
async function getRawDataLatest(params) {
    const { meter_db, meter_id } = params;

    try {

        let rawDataLatestQuery = `
                SELECT * 
                FROM ${meter_db} 
                WHERE DATE(date_time) = CURRENT_DATE 
                ORDER BY date_time DESC 
                LIMIT 1
            `;


        const result = await rawDb.query(rawDataLatestQuery);

        const rows = result.rows;

        if (result.rowCount === 0) {
            console.warn(`No raw data found for the specified meter ${meter_id} and date: ${date}`);
            return null;
        }


        return rows;

    } catch (error) {
        console.error('Error fetching raw data:', error);
        throw error;
    }
}

async function getRawDataAvg(params) {
    const { date, meter_db, meter_id } = params;

    try {

        let avgRawDataQuery = `
    SELECT
        ROUND(AVG(active_energy),2)  AS active_energy,
        ROUND(AVG(reactive_power),2) AS reactive_power,
        ROUND(AVG(apparent_power),2) AS apparent_power,
        ROUND(AVG(current_i1),2)     AS current_i1,
        ROUND(AVG(current_i2),2)     AS current_i2,
        ROUND(AVG(current_i3),2)     AS current_i3,
        ROUND(AVG(voltage_v1),2)     AS voltage_v1,
        ROUND(AVG(voltage_v2),2)     AS voltage_v2,
        ROUND(AVG(voltage_v3),2)     AS voltage_v3,
        ROUND(AVG(active_power),2)   AS active_power,
        ROUND(AVG(frequency),2)      AS frequency,
        ROUND(AVG(power_factor),2)   AS power_factor,
        ROUND(AVG(kw_demand),2)      AS kw_demand,
        ROUND(AVG(thd_i),2)          AS thd_i,
        ROUND(AVG(thd_v),2)          AS thd_v,
        ROUND(AVG(spare1),2)         AS spare1,
        ROUND(AVG(spare2),2)         AS spare2,
        ROUND(AVG(spare3),2)         AS spare3
    FROM ${meter_db}
    WHERE date_time >= CURRENT_DATE
    AND date_time < CURRENT_DATE + INTERVAL '1 day';
            `;
        const result = await rawDb.query(avgRawDataQuery);

        const rows = result.rows;

        const row = result.rows[0];
        if (Object.values(row).every(v => v === null)) {
            console.warn(`No raw data found for the specified meter ${meter_id} and date: ${date}`);
            return null;
        }
        return rows;

    } catch (error) {
        console.error('Error fetching raw data:', error);
        throw error;
    }
}


async function getRawDataContinuous(params) {
    const { date, meter_db, meter_id } = params;

    try {

        let continuousRawDataQuery = `
    SELECT
       *
    FROM ${meter_db}
    WHERE DATE(date_time) = CURRENT_DATE
    ORDER BY date_time ASC;
            `;

        const result = await rawDb.query(continuousRawDataQuery);

        const rows = result.rows;

        if (result.rowCount === 0) {
            console.warn(`No raw data found for the specified meter ${meter_id} and date: ${date}`);
            return null;
        }
        const flattenData = {};

        for (const row of rows) {
            for (const key in row) {
                if (!flattenData.hasOwnProperty(key)) {
                    flattenData[key] = [];
                }
                flattenData[key].push(row[key]);
            }
        }
        return flattenData;

    } catch (error) {
        console.error('Error fetching raw data:', error);
        throw error;
    }
}
async function getRawMeterDataNow(params) {
    try {

        const query = `
            SELECT *
            FROM meter_mapping 
            WHERE meter_name = $1
        `;
        const { rows } = await db.query(query, [params.meter_id]);
        if (rows.length === 0) {
            throw new Error('Meter not found');
        }
        const meter_db = rows[0].meter_db;
        const meter_id = rows[0].meter_id;
        const meter_name = rows[0].meter_name;
        const meter_panel = rows[0].meter_panel;
        const meter_location = rows[0].meter_location;


        params.meter_db = meter_db;

        const latest_reading = await getRawDataLatest(params);
        const avg_reading = await getRawDataAvg(params);
        const continuous_readings = await getRawDataContinuous(params);

        if (!latest_reading || !avg_reading || !continuous_readings) {
            console.error(`Data not found for the specified meter ${params.meter_id}`);
        }
        const returnObject =
        {
            status: true,
            date: new Date().toISOString().split('T')[0],
            meter_id,
            meter_name,
            meter_panel,
            meter_location,
            latest_reading,
            avg_reading,
            continuous_readings
        }
        return returnObject;
    } catch (error) {
        console.error('Error in getRawMeterDataNow:', error);
        throw error;
    }
}



// getRawMeterDataNow({
//     'meter_id': "HT1METER1",
// }).then(data => {
//     console.log('Continuous Data: retrieved successfully');
//     console.dir(data, { depth: null, maxArrayLength: null, maxStringLength: null, maxObjectDepth: null, colors: true });
// }).catch(error => {
//     console.error('Error fetching continuous data:', error);
// });

module.exports = { getRawMeterDataNow }