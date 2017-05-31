import vibe.vibe;
import router;

void main()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];

	auto router = new URLRouter();
	router.registerRestInterface(new MyRouter());

	listenHTTP(settings, router);

	logInfo("Please open http://127.0.0.1:8080/ in your browser.");
	runApplication();
}
