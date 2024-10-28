# Task Manager API

## Running the API

1. Clone this repository and cd to app directory
```
$ git clone git@github.com:raenier/task_manager.git
$ cd task_manager
```

2. Install dependencies
```
$ bundle install
```

3. Prepare the database
```
$ bundle exec rails db:prepare
```

4. Run the API
```
$ bundle exec rails s
```

----

## Documentation
### Base URL
```
http://localhost:3000/api/v1
```

### Endpoints
1. List All Tasks
> GET /tasks

**Description**
Retrieve a paginated list of all tasks, ordered by their position.

**Query Parameters:**
- page (optional): Page number for pagination.
- per_page (optional): Number of tasks per page.

**Response**:
200 OK

```
[
  {
    "id": 1,
    "title": "Buy groceries",
    "row_order": 1
  },
  {
    "id": 2,
    "title": "Clean the house",
    "row_order": 2
  }
]
```
----

2. Get a Specific Task
> GET /tasks/:id

**Description**
Retrieve details of a specific task by its ID.

**Parameters:**
- id (required): The ID of the task.

**Response:**
200 OK

```
{
  "id": 1,
  "title": "Buy groceries",
  "row_order": 1
}
```
----

3. Create a New Task
> POST /tasks

**Description**
Create a new task.

**Request Body**:
```
{
  "task": {
    "title": "New task title"
  }
}
```

**Response**
201 Created

```
{
  "id": 3,
  "title": "New task title",
  "row_order": 3
}
```

422 Unprocessable Entity (on validation failure)

```
{
  "title": ["can't be blank"]
}
```
----

4. Update an Existing Task
> PATCH/PUT /tasks/:id

**Description**
Update an existing task.

**Parameters**
- id (required): The ID of the task.

**Request Body**
```
{
  "title": "Updated task title"
}
```

**Response**
200 OK

```
{
  "id": 1,
  "title": "Updated task title",
  "row_order": 1
}
```

422 Unprocessable Entity (on validation failure)

```
{
  "title": ["can't be blank"]
}
```
----

5. Delete a Task
> DELETE /tasks/:id

**Description**
Delete a specific task by its ID.

Parameters:
- id (required): The ID of the task.

**Response**
204 No Content (on successful deletion)

6. Move a Task
> PATCH/PUT /tasks/:id/move

**Description**
Change the position of a specific task.

**Parameters**
- id (required): The ID of the task.

**Request Body**
```
{
  "position": 2
}
```

**Response**
200 OK

```
{
  "id": 1,
  "title": "Buy groceries",
  "row_order": 2
}
```
----

**Error Responses**
Common error responses include:

- 404 Not Found: Task not found for the provided ID.
- 422 Unprocessable Entity: Validation errors on creation or update.

**Example Error Response (Validation)**
```
{
  "title": ["can't be blank"]
}
```
