Return-Path: <linux-i2c+bounces-184-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE0C7ED64F
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 22:54:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C193B1F257C6
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Nov 2023 21:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 997173DB95;
	Wed, 15 Nov 2023 21:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="lc9R61nx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65C2319B
	for <linux-i2c@vger.kernel.org>; Wed, 15 Nov 2023 13:53:49 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 393652C044A;
	Thu, 16 Nov 2023 10:53:46 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1700085226;
	bh=oo5m3qyagvPDHSC+KwUDEF9RLpa1IBC5fH94joe2/eo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=lc9R61nxte8zp1/WIlTNf7WVhCFzpXK9fLRYP8G3vxtf+J2z6mPchRanC65/J6QYO
	 mv5OsdCCzJ7dSeGsVw8/cOdEng4ePNHk8CCNtH8lNcecGiIR3mP0MhBqucibCKOdRq
	 6ecCOACvrWXe0qYRePAkMOp+OeW91jXVAZ0pzQRY9VXpTfESvjYKC/cGVdQZg4VhIa
	 HXYZGWKTDBC5tyT23pizBduIp5gSU44UPE0gMxx9Vp5z5Fs5InLbw0Ab0XW3mbyOJQ
	 wvYSgARW77Ne4a9OgSGwPYcQ5cpy9oucSkwWKDRdWFhZF4fB+p3aIh/DYCD3xGc0sb
	 egVEhx2EIgCIw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65553dea0001>; Thu, 16 Nov 2023 10:53:46 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.39; Thu, 16 Nov 2023 10:53:46 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Thu, 16 Nov 2023 10:53:45 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.039; Thu, 16 Nov 2023 10:53:45 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "wsa@kernel.org"
	<wsa@kernel.org>, "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "gregory.clement@bootlin.com"
	<gregory.clement@bootlin.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: add bus-reset-gpios property
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: add bus-reset-gpios property
Thread-Index: AQHaF3ftbmVMkvsnVUGkUfJZcnXixrB7DOKAgAAGpwA=
Date: Wed, 15 Nov 2023 21:53:45 +0000
Message-ID: <5a52b0c9-8858-4f55-8dd7-9269c29c10a7@alliedtelesis.co.nz>
References: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
 <20231115035753.925534-2-chris.packham@alliedtelesis.co.nz>
 <f24b9b2d-aeb1-47f7-bf21-4383fdcf94aa@linaro.org>
In-Reply-To: <f24b9b2d-aeb1-47f7-bf21-4383fdcf94aa@linaro.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.32.14.96]
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1D6441B8311464BA666AA1FA29E90D8@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=AZXP4EfG c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oOnywjR1vmkA:10 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=S1fl2u1ynVkmC_t_ytwA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgS3J5c3RvZiwNCg0KT24gMTYvMTEvMjMgMTA6MjksIEtyenlzenRvZiBLb3psb3dza2kgd3Jv
dGU6DQo+IE9uIDE1LzExLzIwMjMgMDQ6NTcsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+PiBBZGQg
YnVzLXJlc2V0LWdwaW9zIGFuZCBidXMtcmVzZXQtZHVyYXRpb24tdXMgcHJvcGVydGllcyB0byB0
aGUgYmluZGluZw0KPj4gZGVzY3JpcHRpb24gZm9yIGkyYyBidXNzZXMuIFRoZXNlIGNhbiBiZSB1
c2VkIHRvIGRlc2NyaWJlIGhhcmR3YXJlIHdoZXJlDQo+PiBhIGNvbW1vbiByZXNldCBHUElPIGlz
IGNvbm5lY3RlZCB0byBhbGwgZG93bnN0cmVhbSBkZXZpY2VzIG9uIGFuZCBJMkMNCj4+IGJ1cy4g
VGhpcyByZXNldCB3aWxsIGJlIGFzc2VydGVkIHRoZW4gcmVsZWFzZWQgYmVmb3JlIHRoZSBkb3du
c3RyZWFtDQo+PiBkZXZpY2VzIG9uIHRoZSBidXMgYXJlIHByb2JlZC4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+
DQo+PiAtLS0NCj4+DQo+IC4uLg0KPg0KPj4gICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvaTJjL2kyYy50eHQgfCA4ICsrKysrKysrDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL2kyYy9pMmMudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L2kyYy9pMmMudHh0DQo+PiBpbmRleCBmYzNkZDdlYzA0NDUuLjNmOTVkNzFiOTk4NSAxMDA2NDQN
Cj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLnR4dA0K
Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMudHh0DQo+
PiBAQCAtOTksNiArOTksMTQgQEAgd2FudHMgdG8gc3VwcG9ydCBvbmUgb2YgdGhlIGJlbG93IGZl
YXR1cmVzLCBpdCBzaG91bGQgYWRhcHQgdGhlc2UgYmluZGluZ3MuDQo+PiAgIAlpbmRpY2F0ZXMg
dGhhdCB0aGUgc3lzdGVtIGlzIGFjY2Vzc2libGUgdmlhIHRoaXMgYnVzIGFzIGFuIGVuZHBvaW50
IGZvcg0KPj4gICAJTUNUUCBvdmVyIEkyQyB0cmFuc3BvcnQuDQo+PiAgIA0KPj4gKy0gYnVzLXJl
c2V0LWdwaW9zOg0KPj4gKwlHUElPIHBpbiBwcm92aWRpbmcgYSBjb21tb24gcmVzZXQgZm9yIGFs
bCBkb3duc3RyZWFtIGRldmljZXMuIFRoaXMgR1BJTw0KPj4gKwl3aWxsIGJlIGFzc2VydGVkIHRo
ZW4gcmVsZWFzZWQgYmVmb3JlIHRoZSBkb3duc3RyZWFtIGRldmljZXMgYXJlIHByb2JlZC4NCj4g
SSBpbml0aWFsbHkgcmV2aWV3ZWQgaXQsIGJ1dCBkaWQgbm90IHRoaW5rIGVub3VnaCBhYm91dCBp
dC4gQWZ0ZXIgbW9yZQ0KPiBjb25zaWRlcmF0aW9uLCBJIGJlbGlldmUgdGhpcyBpcyBub3QgYSBw
cm9wZXJ0eSBvZiB0aGUgSTJDIGJ1cw0KPiBjb250cm9sbGVyLiBUaGlzIGlzIGEgcHJvcGVydHkg
b2YgZWFjaCBkZXZpY2UsIGV2ZW4gaWYgdGhlIEdQSU8gaXMgdGhlIHNhbWUuDQo+DQo+IExpbnV4
IGtlcm5lbCBhbHJlYWR5IHN1cHBvcnRzIHNoYXJlZCBHUElPLCBzbyB5b3Ugb25seSBuZWVkDQo+
IGVuYWJsZS1yZWYtY291bnRpbmcgb24gaXQuDQoNClRoYXQncyB0aGUga2luZCBvZiBicmVhZGNy
dW1iIEkgbmVlZC4gQWx0aG91Z2ggSSBjYW4ndCBzZWUgDQplbmFibGUtcmVmLWNvdW50aW5nIGFz
IGFueSBraW5kIG9mIERUIHByb3BlcnR5LiBEbyB5b3UgbWVhbiANCkdQSU9EX0ZMQUdTX0JJVF9O
T05FWENMVVNJVkU/DQoNCj4gUHV0dGluZyBpdCBpbnRvIHRoZSBjb250cm9sbGVyIGJpbmRpbmdz
IGxvb2tzIGxpa2Ugc29sdmluZyBPUyBpc3N1ZSB3aXRoDQo+IGluY29ycmVjdCBoYXJkd2FyZSBk
ZXNjcmlwdGlvbi4NClllcyB0aGF0J3MgZW50aXJlbHkgd2hhdHMgaGFwcGVuaW5nIGhlcmUuDQo+
IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+

