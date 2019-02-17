const express = require('express');
const router = express.Router();

const mysqlConnection = require('../database');

router.get('/', (req, res, next) => {
  mysqlConnection.query('SELECT * FROM courses', (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

router.get('/:courses_id', (req, res, next) => {
  const { courses_id } = req.params;
  mysqlConnection.query('SELECT * FROM courses WHERE courses_id = ?', [courses_id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

router.post('/', (req, res, next) => {
  const { courses_id, courses_name, courses_descrption, courses_start_date, courses_final_date, courses_students, status_id } = req.body;
  const query = `
    CALL coursesAddOrEdit(?, ?, ?, ?, ?, ?, ?);
  `;
  mysqlConnection.query(query, [courses_id, courses_name, courses_descrption, courses_start_date, courses_final_date, courses_students, status_id], (err, rows, fields) => {
    if (!err) {
      res.json({Status: 'Course created'});
    } else {
      console.log(err);
    }
  });
});

router.put('/:courses_id', (req, res, next) => {
  const { courses_name, courses_descrption, courses_start_date, courses_final_date, courses_students, status_id } = req.body;
  const { courses_id } = req.params;
  const query = 'CALL coursesAddOrEdit(?, ?, ?, ?, ?, ?, ?)';
  mysqlConnection.query(query, [courses_id, courses_name, courses_descrption, courses_start_date, courses_final_date, courses_students, status_id], (err, rows, fields) => {
    if (!err) {
      res.json({Status: 'Course updated'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;
