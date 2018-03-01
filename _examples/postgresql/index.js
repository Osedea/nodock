const app = require('express')();
const { Client } = require('pg');

app.get('/', function(request, response) {
	const client = new Client({
		user: 'default_user',
		host: 'postgresql',
		database: 'default_db',
		password: 'secret',
		post: 5432,
	});

	client.connect(function(err, res) {
		if (err) {
			return response.send('Error occurred while trying to connect to PostgreSQL.');
		}
		return response.send(`Connected to ${res.host}:${res.port}.`);
	});
});

app.listen(8000);
