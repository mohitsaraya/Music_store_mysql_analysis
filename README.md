<div class="section">
    <h2>Overview</h2>
    <p>This project is centered around analyzing the database schema of a music store. The schema includes tables for customers, employees, invoices, tracks, and playlists, among others. The aim of this analysis is to extract actionable insights and answer critical business questions using SQL.</p>
</div>

<div class="section">
    <h2>Database Schema</h2>
    <p>The music store database schema consists of the following main tables:</p>
    <ul>
        <li><strong>employee</strong>: Tracks information about employees, including their names, titles, and reporting structure.
            <ul>
                <li><strong>Key Columns</strong>: `employee_id`, `reports_to`</li>
            </ul>
        </li>
        <li><strong>customer</strong>: Stores customer details such as contact information and associated support representative.
            <ul>
                <li><strong>Key Columns</strong>: `customer_id`, `support_rep_id`</li>
            </ul>
        </li>
        <li><strong>invoice</strong>: Represents individual transactions, including billing details and total amounts.
            <ul>
                <li><strong>Key Columns</strong>: `invoice_id`, `customer_id`</li>
            </ul>
        </li>
        <li><strong>invoice_line</strong>: Breaks down each invoice into individual line items with tracks and their quantities.
            <ul>
                <li><strong>Key Columns</strong>: `invoice_line_id`, `track_id`</li>
            </ul>
        </li>
        <li><strong>track</strong>: Contains details about individual tracks, including metadata and pricing.
            <ul>
                <li><strong>Key Columns</strong>: `track_id`, `album_id`</li>
            </ul>
        </li>
        <li><strong>album</strong>: Captures album details, including the associated artist.
            <ul>
                <li><strong>Key Columns</strong>: `album_id`, `artist_id`</li>
            </ul>
        </li>
        <li><strong>artist</strong>: Stores details about artists.
            <ul>
                <li><strong>Key Column</strong>: `artist_id`</li>
            </ul>
        </li>
        <li><strong>playlist</strong>: Contains playlists created in the music store.
            <ul>
                <li><strong>Key Column</strong>: `playlist_id`</li>
            </ul>
        </li>
        <li><strong>playlist_track</strong>: Maps tracks to playlists, representing a many-to-many relationship.
            <ul>
                <li><strong>Key Columns</strong>: `playlist_id`, `track_id`</li>
            </ul>
        </li>
        <li><strong>media_type</strong>: Describes the format of the tracks.
            <ul>
                <li><strong>Key Column</strong>: `media_type_id`</li>
            </ul>
        </li>
        <li><strong>genre</strong>: Represents the genre of the tracks.
            <ul>
                <li><strong>Key Column</strong>: `genre_id`</li>
            </ul>
        </li>
    </ul>
</div>



<div class="section">
    <h2>Objectives</h2>
    <h3>Analysis Questions</h3>
    <h4>Easy</h4>
    <ul>
        <li>Who is the senior-most employee based on job title?</li>
        <li>Which countries have the most invoices?</li>
        <li>What are the top 3 values of total invoice amounts?</li>
        <li>Which city has the best customers? Identify the city with the highest sum of invoice totals.</li>
        <li>Who is the best customer? Find the customer who has spent the most money.</li>
    </ul>

    <h4>Moderate</h4>
    <ul>
        <li>Return the email, first name, last name, and genre of all Rock music listeners, ordered by email.</li>
        <li>Identify the artists who have written the most Rock music. Return the artist name and total track count of the top 10 Rock bands.</li>
        <li>Find all track names with a song length longer than the average. Return the name and milliseconds, ordered by song length.</li>
    </ul>

    <h4>Advanced</h4>
    <ul>
        <li>Find how much each customer spent on artists. Return customer name, artist name, and total spent.</li>
        <li>Identify the most popular music genre for each country based on purchases.</li>
        <li>Determine the customer who spent the most on music for each country. Include all customers in case of ties.</li>
    </ul>
</div>
<div class="section">
    <h2>Tools and Technologies</h2>
    <ul>
        <li><strong>Database</strong>: PostgreSQL or MySQL</li>
        <li><strong>Query Language</strong>: SQL</li>
        <li><strong>Visualization</strong>: Power BI, Tableau, or Matplotlib (optional for visualization)</li>
        <li><strong>Version Control</strong>: Git and GitHub</li>
    </ul>
</div>

<div class="section">
    <h2>Potential Insights</h2>
    <ul>
        <li><strong>Customer Behavior</strong>: Identifying top customers and their preferences to tailor marketing strategies.</li>
        <li><strong>Sales Performance</strong>: Determining which genres and artists drive the most revenue.</li>
        <li><strong>Employee Performance</strong>: Measuring the impact of support representatives on customer spending.</li>
        <li><strong>Trends and Patterns</strong>: Observing seasonal or monthly sales trends to inform inventory management.</li>
    </ul>
</div>

<div class="section">
    <h2>License</h2>
    <p>This project is licensed under the MIT License. Feel free to use and adapt the code for your own purposes.</p>
</div>

<div class="section">
    <h2>Contact</h2>
    <p>For any questions or contributions, feel free to reach out:</p>
    <ul>
        <li><strong>Email</strong>: <a href="mailto:your.email@example.com">your.email@example.com</a></li>
        <li><strong>GitHub</strong>: <a href="https://github.com/yourusername">yourusername</a></li>
    </ul>
</div>
