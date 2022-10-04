'use strict'

const Storage = require('@google-cloud/storage');
const BigQuery = require('@google-cloud/bigquery');

const storage = new Storage();
const bigquery = new BigQuery();

exports.loadFile = (event, context) => {
  const dataset = 'my_dataset';
  const table = 'my_table';

  const jobMetadata = {
    autodetect: true
  };

  console.log(`Loading from gs://${event.bucket}/${event.name} into ${dataset}:${table}`);

  bigquery
    .dataset(dataset)
    .table(table)
    .load(storage.bucket(event.bucket).file(event.name), jobMetadata)
    .catch(err => {
      console.error('ERROR:', err)
    });

  console.log(`Load complete`);
};