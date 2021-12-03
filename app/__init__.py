import os
from flask import Flask

def create_app(test_config=None):
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        DEBUG=True,
        SECRET_KEY="dev",
        DATABASE=os.path.join(app.instance_path, "app.sqlite"),
    )

    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    from app import db
    db.init_app(app)

    from app import auth, blog, eventts, home
    app.register_blueprint(auth.bp)
    app.register_blueprint(blog.bp)
    app.register_blueprint(eventts.bp)
    app.register_blueprint(home.bp)

    app.add_url_rule('/', 'home')
    return app