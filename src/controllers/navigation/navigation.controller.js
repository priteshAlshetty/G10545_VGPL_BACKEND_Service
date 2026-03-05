const db = require('../../config/db.config.js');
const rawDb = require('../../config/rawdata.db.config.js');

async function getLocation() {
    try {
        const result = await db.query(' SELECT meter_location FROM meter_mapping WHERE meter_location IS NOT NULL GROUP BY meter_location');

        if (result.rowCount === 0) {
            console.warn('No meter locations found in the database.');
            return [];
        }
        const meterLocations = result.rows.map(row => row.meter_location);
        return meterLocations;
    } catch (error) {
        console.error('Error fetching meter locations in getLocation: ', error.Message);
        throw error;
    }
}
async function getPanels() {
    try {
        const result = await db.query(' SELECT meter_panel FROM meter_mapping WHERE meter_panel IS NOT NULL GROUP BY meter_panel');

        if (result.rowCount === 0) {
            console.warn('No meter panels found in the database.');
            return [];
        }
        const meterPanels = result.rows.map(row => row.meter_panel);
        return meterPanels;
    } catch (error) {
        console.error('Error fetching meter panels in getPanels: ', error.Message);
        throw error;
    }
}

async function getMeters() {
    try {
        const result = await db.query(' SELECT meter_name FROM meter_mapping WHERE meter_name IS NOT NULL GROUP BY meter_name');

        if (result.rowCount === 0) {
            console.warn('No meter names found in the database.');
            return [];
        }
        const meterNames = result.rows.map(row => row.meter_name);
        return meterNames;
    } catch (error) {
        console.error('Error fetching meter names in getMeters: ', error.Message);
        throw error;
    }
}



async function getPanelByLocation(params) {
    try {
        const result = await db.query('SELECT meter_panel FROM meter_mapping WHERE meter_location = $1 AND meter_panel IS NOT NULL GROUP BY meter_panel', [params.location]);
        if (result.rowCount === 0) {
            console.warn('No meter panels found for the specified location.');
            return [];
        }
        const meterPanels = result.rows.map(row => row.meter_panel);
        return meterPanels;
    } catch (error) {
        console.error('Error fetching meter panels by location: ', error.Message);
        throw error;
    }
}

async function getMeterByPanel(params) {
    try {
        const result = await db.query('SELECT meter_name FROM meter_mapping WHERE meter_panel = $1 AND meter_name IS NOT NULL GROUP BY meter_name', [params.panel]);
        if (result.rowCount === 0) {
            console.warn('No meter names found for the specified panel.');
            return [];
        }
        const meterNames = result.rows.map(row => row.meter_name);
        return meterNames;
    } catch (error) {
        console.error('Error fetching meter names by panel: ', error.Message);
        throw error;
    }
}
module.exports = {
    getLocation,
    getPanels,
    getMeters,
    getPanelByLocation,
    getMeterByPanel
}