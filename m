Return-Path: <linux-i2c+bounces-6963-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A66984C90
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 23:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 294C71F24689
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 21:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4276213D504;
	Tue, 24 Sep 2024 21:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="PQQCHOds"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE61F13C9A9
	for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2024 21:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727212285; cv=none; b=poGDZ95R93p+Nf2niep0tiAJFGvn0lC6AoDzD1fSQzzYwt1H8D/0HETW1tbcG+eeZhOP5rqX8jEAZPI0iq8MWDiHVo6XZkNdMFAcLlJKsPP10/SWBmyB6Ol7furVzqZBXY8sKorgyojPY9m8HMqDsnjHF3H/xtx4SIA3c9+zTso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727212285; c=relaxed/simple;
	bh=wmUpZfC/htD+iA5wrFbgl2pgQTzIbbElSrdk9cyMR7M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uAV0lZ8rVxiA1WtnSvTxXDGdCDG4PcS/vyfiSXK1n5uVxTdfByzzHbfPruOrSXD8t02yMxBjubN7VBz4XlapmmB9meMPWykyz+txuJ+w0L0t2MPW4A4qxFTrhItNJoXIW2J1h4Gafa+vT2eJ/4ec7Qk2N/J0aZnuuRK2ExlxFcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=PQQCHOds; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id D17102C05DB;
	Wed, 25 Sep 2024 09:11:13 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727212273;
	bh=wmUpZfC/htD+iA5wrFbgl2pgQTzIbbElSrdk9cyMR7M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=PQQCHOdsMILjfKbKz7lKGd9jlu99F1CX5R5whH4q5fe6depqvxwsuX9E2lTRh7hx6
	 8HMFfGDHZdEIqcNcnF545gaV+xSq+O5VKybz3nNH1ZH08riakfMPRiyL7vk4J+xXll
	 DXD3MO0BiRIHAlPiYJ1NHJIY7zYD1c4bfvRhauXNh9WUXQPYRgODkK2Qociss+SR82
	 36yqVvcIxPoDnavWisPx1nTivQeWSyvfusABdxVltkU4BqwR3Wag9cxgepqMuelCna
	 w/Md7s8AW6aBAs/sVVfCP90DntpCJYTl8iBBfpztcvv/z0CvuzHcKuk3Hurm5hVCT2
	 WD9u/GYBLNCZg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f32af10001>; Wed, 25 Sep 2024 09:11:13 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Wed, 25 Sep 2024 09:11:13 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Wed, 25 Sep 2024 09:11:13 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Wed, 25 Sep 2024 09:11:13 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "tsbogend@alpha.franken.de"
	<tsbogend@alpha.franken.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-mips@vger.kernel.org"
	<linux-mips@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: i2c: Add RTL9300 I2C controller
Thread-Topic: [PATCH v3 1/3] dt-bindings: i2c: Add RTL9300 I2C controller
Thread-Index: AQHbDgytK10u72+gUkipBcb15OmiQrJl2bMAgADNmgA=
Date: Tue, 24 Sep 2024 21:11:13 +0000
Message-ID: <4a0dbf45-3f27-43d4-87c6-35b1983ceaef@alliedtelesis.co.nz>
References: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
 <20240923230230.3001657-2-chris.packham@alliedtelesis.co.nz>
 <uxv5kzjo5btypvca5vh27i7xkajyqvbqtkys7xcmfz5ltmwezv@fgrlz4yzznri>
In-Reply-To: <uxv5kzjo5btypvca5vh27i7xkajyqvbqtkys7xcmfz5ltmwezv@fgrlz4yzznri>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <57FDC9A905DF6D4A8AFDB832831CAF85@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f32af1 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=62ntRvTiAAAA:8 a=gEfo2CItAAAA:8 a=ybuHqjYP6VfxY7Zg_iQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAyNC8wOS8yNCAyMDo1NSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gVHVl
LCBTZXAgMjQsIDIwMjQgYXQgMTE6MDI6MjhBTSArMTIwMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToN
Cj4+IEFkZCBkdHNjaGVtYSBmb3IgdGhlIEkyQyBjb250cm9sbGVyIG9uIHRoZSBSVEw5MzAwIFNv
Qy4gVGhlIEkyQw0KPj4gY29udHJvbGxlcnMgb24gdGhpcyBTb0MgYXJlIHBhcnQgb2YgdGhlICJz
d2l0Y2giIGJsb2NrIHdoaWNoIGlzDQo+PiByZXByZXNlbnRlZCBoZXJlIGFzIGEgc3lzY29uIG5v
ZGUuIFRoZSBTQ0wgcGlucyBhcmUgZGVwZW5kZW50IG9uIHRoZSBJMkMNCj4+IGNvbnRyb2xsZXIg
KEdQSU84IGZvciB0aGUgZmlyc3QgY29udHJvbGxlciwgR1BJTyAxNyBmb3IgdGhlIHNlY29uZCku
IFRoZQ0KPj4gU0RBIHBpbnMgY2FuIGJlIGFzc2lnbmVkIHRvIGVpdGhlciBvbmUgb2YgdGhlIEky
QyBjb250cm9sbGVycyAoYnV0IG5vdA0KPj4gYm90aCkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4gLS0t
DQo+Pg0KPj4gTm90ZXM6DQo+PiAgICAgIENoYW5nZXMgaW4gdjM6DQo+PiAgICAgIC0gUmVtb3Zl
IHBhcmVudCBub2RlIGluIGV4YW1wbGUNCj4+ICAgICAgLSBwdXQgdW5ldmFsdWF0ZWRQcm9wZXJ0
aWVzIGFmdGVyIHJlcXVpcmVkDQo+PiAgICAgIC0gQWRkICNhZGRyZXNzLWNlbGxzIGFuZCAjc2l6
ZS1jZWxscw0KPj4gICAgICANCj4+ICAgICAgQ2hhbmdlcyBpbiB2MjoNCj4+ICAgICAgLSBVc2Ug
cmVnIHByb3BlcnR5IGZvciBjb250cm9sbGVyIHJlZ2lzdGVycw0KPj4gICAgICAtIFJlbW92ZSBn
bG9iYWwtY29udHJvbC1vZmZzZXQgKHdpbGwgYmUgaGFyZCBjb2RlZCBpbiBkcml2ZXIpDQo+PiAg
ICAgIC0gSW50ZWdyYXRlZCB0aGUgbXVsdGlwbGV4aW5nIGZ1bmN0aW9uLiBDaGlsZCBub2RlcyBu
b3cgcmVwcmVzZW50IHRoZQ0KPj4gICAgICAgIGF2YWlsYWJsZSBTREEgbGluZXMNCj4+DQo+PiAg
IC4uLi9iaW5kaW5ncy9pMmMvcmVhbHRlayxydGw5MzAwLWkyYy55YW1sICAgICB8IDgwICsrKysr
KysrKysrKysrKysrKysNCj4+ICAgTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDYgKysNCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCsp
DQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL3JlYWx0ZWsscnRsOTMwMC1pMmMueWFtbA0KPj4NCj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlYWx0ZWsscnRsOTMwMC1pMmMueWFt
bCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvcmVhbHRlayxydGw5MzAw
LWkyYy55YW1sDQo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAw
Li45NzllYzIyZTgxZjENCj4+IC0tLSAvZGV2L251bGwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvcmVhbHRlayxydGw5MzAwLWkyYy55YW1sDQo+PiBAQCAt
MCwwICsxLDgwIEBADQo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25s
eSBPUiBCU0QtMi1DbGF1c2UpDQo+PiArJVlBTUwgMS4yDQo+PiArLS0tDQo+PiArJGlkOiBodHRw
Oi8vc2Nhbm1haWwudHJ1c3R3YXZlLmNvbS8/Yz0yMDk4OCZkPWdmN3k1cmd5OUVSNDRIWnB0a2tv
dkxiVkd0a1lkN0J5QXozSzZQTlBBdyZ1PWh0dHAlM2ElMmYlMmZkZXZpY2V0cmVlJTJlb3JnJTJm
c2NoZW1hcyUyZmkyYyUyZnJlYWx0ZWslMmNydGw5MzAwLWkyYyUyZXlhbWwlMjMNCj4+ICskc2No
ZW1hOiBodHRwOi8vc2Nhbm1haWwudHJ1c3R3YXZlLmNvbS8/Yz0yMDk4OCZkPWdmN3k1cmd5OUVS
NDRIWnB0a2tvdkxiVkd0a1lkN0J5QTItYTdLSktCZyZ1PWh0dHAlM2ElMmYlMmZkZXZpY2V0cmVl
JTJlb3JnJTJmbWV0YS1zY2hlbWFzJTJmY29yZSUyZXlhbWwlMjMNCj4+ICsNCj4+ICt0aXRsZTog
UmVhbHRlayBSVEwgSTJDIENvbnRyb2xsZXINCj4+ICsNCj4+ICttYWludGFpbmVyczoNCj4+ICsg
IC0gQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4g
Kw0KPj4gK2Rlc2NyaXB0aW9uOg0KPj4gKyAgVGhlIFJUTDkzMDAgU29DIGhhcyB0d28gSTJDIGNv
bnRyb2xsZXJzLiBFYWNoIG9mIHRoZXNlIGhhcyBhbiBTQ0wgbGluZSAod2hpY2gNCj4gVGhpcyBp
cyBjb25mdXNpbmcuIEl0IHRvb2sgbWUgc29tZSBtaW51dGVzIHRvIHVuZGVyc3RhbmQgdGhhdCB0
d28gSTJDcw0KPiBpbiB0aGUgZXhhbXBsZSBkbyBub3QgbWF0Y2ggd2hhdCB5b3Ugd3JvdGUgaGVy
ZS4gSSBnb3QgdGhlcmUgb25seSBiZWNhdXNlDQo+IG9mIHlvdXIgRFRTLiBZb3VyIHBhdGNoc2V0
cyAtIHNlbnQgc2VwYXJhdGVseSBhbmQgZGVzY3JpYmluZyBwcm9ibGVtDQo+IGluY29tcGxldGVs
eSAtIGRvIG5vdCBoZWxwLg0KPg0KPiBUaGlzIGlzIHRoZSBiaW5kaW5nIGZvciBJMkMsIG5vdCBm
b3IgUlRMOTMwMCBTb0MuDQo+DQo+PiArICBpZiBub3QtdXNlZCBmb3IgU0NMIGNhbiBiZSBhIEdQ
SU8pLiBUaGVyZSBhcmUgOCBjb21tb24gU0RBIGxpbmVzIHRoYXQgY2FuIGJlDQo+PiArICBhc3Np
Z25lZCB0byBlaXRoZXIgSTJDIGNvbnRyb2xsZXIuDQo+PiArDQo+PiArcHJvcGVydGllczoNCj4+
ICsgIGNvbXBhdGlibGU6DQo+PiArICAgIGNvbnN0OiByZWFsdGVrLHJ0bDkzMDAtaTJjDQo+PiAr
DQo+PiArICByZWc6DQo+PiArICAgIGRlc2NyaXB0aW9uOiBSZWdpc3RlciBvZmZzZXQgYW5kIHNp
emUgdGhpcyBJMkMgY29udHJvbGxlci4NCj4gTm9wZSwgeW91ciByZWJvb3QgbW9kZSBkb2VzIG5v
dCBoYXZlIHJlZy4gRWl0aGVyIGZpeCByZWJvb3QgbW9kZSBkcml2ZXINCj4gb3IgdGhpcy4gUHJl
ZmVyYWJseSByZWJvb3QgbW9kZS4NCg0KSSdtIG5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgdGhp
cy4gVGhlIHN5c2Nvbi1yZWJvb3QgYmluZGluZyBkb2Vzbid0IA0KcmVxdWlyZSBhIHJlZyBwcm9w
ZXJ0eSBhbmQgSSBjYW4gb25seSBmaW5kIG9uZSBpbi10cmVlIGR0cyANCih0dXJyaXMxeC5kdHMp
IHRoYXQgYWN0dWFsbHkgZ2l2ZXMgaXQgYSByZWcgcHJvcGVydHkuDQoNCj4NCj4gQmVzdCByZWdh
cmRzLA0KPiBLcnp5c3p0b2YNCj4=

