import hug

@hug.cli()
@hug.local()
@hug.get(examples='username=stranger')
def say_hello(username: hug.types.text):
	return {'message': 'Hello {0}!'.format(username)}
