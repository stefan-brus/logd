import vibe.d;

void index(HTTPServerRequest req, HTTPServerResponse res)
{
    res.render!("index.dt", req);
}

shared static this()
{
    auto router = new URLRouter;
    router.get("/", &index);

    auto settings = new HTTPServerSettings;
    settings.port = 8080;
    settings.bindAddresses = ["::1", "127.0.0.1"];

    listenHTTP(settings, router);
}
