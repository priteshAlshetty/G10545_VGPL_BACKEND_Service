const express = require('express');
const router = express.Router();
const { getRawMeterDataNow } = require('../../controllers/info/rawdata.controller.js');
const { getRawMeterDataByDate } = require('../../controllers/info/rawDataByDate.controller.js');



// GET /api/ems/processeddata/now/meterdata?meter_id=123&date=now
router.get('/meterdata/now/', async (req, res) => {
    try {
        const { meter_id } = req.query;

        if (!meter_id) {
            return res.status(400).json({ error: 'meter_id is required' });
        }

        const params = {
            meter_id,
        };

        const rawData = await getRawMeterDataNow(params);

        res.status(200).json({
            data: rawData
        });

    } catch (error) {
        console.error("Meter Data Error /meterdata/now/ try-catch block:", error.message);
        res.status(500).json({
            status: false,
            errMessage: error.message,
            error: error
        });
    }
});

// GET /api/ems/processeddata/at/meterdata?meter_id=123&date="2026-03-03"
router.get('/meterdata/at/', async (req, res) => {
    try {
        const { meter_id, date } = req.query;

        if (!meter_id) {
            return res.status(400).json({ error: 'meter_id is required' });
        }
        if (!date) {
            return res.status(400).json({ error: 'date is required' });
        }
        const params = {
            meter_id,
            date
        };

        const rawData = await getRawMeterDataByDate(params);

        res.status(200).json({
            data: rawData
        });

    } catch (error) {
        console.error("Meter Data Error at /meterdata/at/ try-catch block:", error.message);
        res.status(500).json({
            status: false,
            errMessage: error.message,
            error: error
        });
    }
});


module.exports = router;

