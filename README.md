# Cloudflare Workers for Platform (WfP) Demo

Review **[How Workers for Platforms works](https://developers.cloudflare.com/cloudflare-for-platforms/workers-for-platforms/reference/how-workers-for-platforms-works/)**.

Bunch of different Workers as part of this demo:

- [dispatch-worker](/dispatch-worker/) -- Handles the routing of requests
- [outbound-worker](/outbound-worker/) -- Handles adding our Authorization header for the API
- [user-worker](/user-worker/) -- The User Worker
- [saas-api](/saas-api/) -- The API returning a status

## SaaS API

This SaaS API [index.ts](https://github.com/DavidJKTofan/cloudflare-workers-for-platform-wfp/blob/main/saas-api/src/index.ts) can be any API endpoint within or outside of Cloudflare.

## Dispatch Worker

The Dispatch Worker [index.ts](https://github.com/DavidJKTofan/cloudflare-workers-for-platform-wfp/blob/main/dispatch-worker/src/index.ts) finds the User Worker within a [dispatch namespace](https://developers.cloudflare.com/cloudflare-for-platforms/workers-for-platforms/reference/how-workers-for-platforms-works/#dispatch-namespace) and fetches it.

It also allows you to set your own [custom limits](https://developers.cloudflare.com/cloudflare-for-platforms/workers-for-platforms/configuration/custom-limits/) to the User Workers.

## User Worker

This is the User Worker [uploaded](https://developers.cloudflare.com/cloudflare-for-platforms/workers-for-platforms/get-started/user-workers/) by your end-customers.

The User Worker fetches the assets requested [index.ts#L13](https://github.com/DavidJKTofan/cloudflare-workers-for-platform-wfp/blob/main/user-worker/src/index.ts#L13), which are [Bindings](https://developers.cloudflare.com/workers/runtime-apis/bindings/) to the Workers [wrangler.toml#L7-L8](https://github.com/DavidJKTofan/cloudflare-workers-for-platform-wfp/blob/main/user-worker/wrangler.toml#L7-L8). Then [index.ts#L15](https://github.com/DavidJKTofan/cloudflare-workers-for-platform-wfp/blob/main/user-worker/src/index.ts#L15) fetches the SaaS API (can be any endpoint).

## Outbound Worker

Due to the User Worker fetching an external endpoint (the SaaS API), [index.ts](https://github.com/DavidJKTofan/cloudflare-workers-for-platform-wfp/blob/main/outbound-worker/src/index.ts) manipulates the outgoing request, such as sending an authorization header.

* * * 

# Other Examples

* https://developers.cloudflare.com/cloudflare-for-platforms/workers-for-platforms/demos/
* https://blog.cloudflare.com/powering-platforms-on-workers/

# Disclaimer

Educational purposes only.
