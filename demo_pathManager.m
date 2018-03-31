test

function test
    p = PathManager();
    p.addPath('test', 'test1', 'test2', true)
    p.test('paths')
end