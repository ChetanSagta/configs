const api_key:string="";
const lat:Number = 29;
const lon:Number = 79;
let icon:string = "";

const api_call_command:string = "https://api.openweathermap.org/data/2.5/onecall?lat="+lat+"&lon="+lon+"&appid="+ api_key;

const responseJson = async() => {

  let response = await fetch(api_call_command);

  return new Promise((resolve,reject) => {
    setTimeout(()=>{ response.json()},2000);
  });

console.log(responseJson);

const output = JSON.parse(responseJson);

console.log(output)

const current= output.current;

console.log(current)

const weather = current.weather;
console.log(weather)

const temp = current.temp; 

icon=weather[0].icon;

console.log("Temp: " + temp + " Icon: " + icon);

