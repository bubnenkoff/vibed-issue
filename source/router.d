module router;
import std.stdio;
import std.file;
import vibe.d;

@rootPathFromName
interface API
{
    @path("mytrack")           @method(HTTPMethod.GET)    Json doTrackSpeedAnalyze(int trackid=0, string startDateTime="0", string endDateTime="0"); 
}

class MyRouter : API
{ 
   this()
   {

   }

    @path("/")
    void myerror(string _error = null) // it seems that it's even do not calls
    {
        render!("index.dt", _error);
		writeln("errrror"); // DO NOT PRINTS ON COLSOLE
    }
    override:
        @errorDisplay!myerror
        Json doTrackSpeedAnalyze(int trackid=0, string startDateTime="0", string endDateTime="0") // /api/mytrack?trackid=123&startDateTime=2000&endDateTime=2010
        {
            if(trackid == 0)
            {
                throw new Exception("Some fields are empty");
            }
    
            return Json.emptyObject();
        }


}

