# NodeJS_Trello
<pre> nodejs version 8.11 </pre>
1) Node.js install
    <pre> sudo apt-get update <br> sudo apt-get install nodejs</pre>
    <pre>https://www.digitalocean.com/community/tutorials/node-js-ubuntu-16-04-ru</pre>
    ------------------
2) Npm install
    <pre>sudo apt-get install npm</pre>
    ------------------
3) PostgreSQL install
    <pre>https://www.digitalocean.com/community/tutorials/postgresql-ubuntu-16-04-ru</pre>

    <pre>https://www.postgresql.org/download/windows/</pre>
    ------------------
    <pre>
    user: 'oleg',
    password: 'AEslySam',
    port: '5432',
    name: 'mydb',
    dialect: 'postgres',
    host: '127.0.0.1' 
    </pre>
    ------------------
    Added table on bd
    <pre>psql -h 127.0.0.1 -d mydb -U oleg -f ./mydb.sql</pre>
    ------------------
4) Install project
   <pre>npm install</pre>
    ------------------
5) Start project
   <pre>npm start</pre>