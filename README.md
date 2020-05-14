# Flight Tickets (prototype)

Figma source: https://www.figma.com/file/ZHzWvhzW9AQH2O8vg39Nhx/Layout?node-id=0%3A1

**Building the models:**

The models have been designed with `json_serializable`, so it's neccessary to compile them or the app won't run.

To do so, simply run `flutter pub run build_runner build` on the root directory.


**Serving the mock data:**

There's a mocked JSON tabase at the root directory, named `db.json`. You can serve it with [`json-server`](https://github.com/typicode/json-server) or any other similar tool to run the project locally with mocked data.
