test

function test
    p = pathManager()
    p.addPath('test', 'test1', 'test2', true)
    p.test('paths')
end