from flask import Flask

app = Flask("SIG Sample App")

@app.route('/')
def hello_world():
    return 'Hello, SIG!'

@app.route('/health')
def health():
    return 'OK'

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=8080)