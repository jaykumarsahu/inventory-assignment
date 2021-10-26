### Ruby Version
- 3.0.2

### Rails Version
- 6.1.4

### Used Gems
- `activeadmin` to manage of all resource at admin level
- `devise` to authenticate user
- `jwt` to maintain API authentication
- `rubocop`  to maintain conventions
- `pry-rails`  to debug the issues

## Pre-requisite Installation
1. Install [Docker](https://www.docker.com/)
1. Install [Docker Compose](https://docs.docker.com/compose/install/)

## Usage
1.  `make build` to launch the application for the first time
1.  `make start` to launch the application
1.  `make db-setup` to setup the database with seeds
1.  `make stop` to bring down all docker containers
1.  `make console` command lets you interact with your application from the command line. On the underside, application console uses [Pry](https://github.com/pry/pry), so if you've ever used it, you'll be right at home. This is useful for testing out quick ideas with code and changing the data server-side.

### Instructions
1. run `make build` to load all gem dependencies
2. run `make db-setup` to create & migrate DB schema
3. run `make start` to up to application
4. use Postman collection to check API endpoints
5. open `localhost:3000/admin` on browser to access admin panel
6. credentials for login => `admin@example.com/password`

### API endpoints
```
POST           `/api/sign_in`                                 # Sign-in
PUT            `/api/products/:id/update_status`              # Approve/Reject product
GET            `/api/products`                                # Fetch all products of a company
GET            `/api/employees`                               # Fetch all employees of a company
GET            `/api/inventories`                             # Fetch all inventories of a company
POST           `/api/inventories/:inventory_id/products`      # Create product
POST           `/api/inventories`                             # Create inventory
POST           `/api/employees`                               # Create employee
GET            `/api/products/:id`                            # Fetch product detail
GET            `/api/inventories/:id`                         # Fetch inventory detail
GET            `/api/employees/:id`                           # Fetch employee detail
PUT            `/api/products/:id`                            # Update product
PUT            `/api/employees/:id`                           # Update employee
PUT            `/api/inventories/:id`                         # Update inventory
DELETE         `/api/products/:id`                            # Delete product
DELETE         `/api/employees/:id`                           # Delete employee
DELETE         `/api/inventories/:id`                         # Delete inventory
```
