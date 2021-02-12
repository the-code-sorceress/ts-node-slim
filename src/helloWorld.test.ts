import helloWorld from "./helloWorld"

describe("helloWorld", ()=>{
    it("should console log Hello World", ()=> {
        console.log = jest.fn()
        helloWorld();
        expect(console.log).toHaveBeenCalledWith('Hello World');
    });
}); 