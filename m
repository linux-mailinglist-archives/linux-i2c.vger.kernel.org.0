Return-Path: <linux-i2c+bounces-6941-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E118E97F1E1
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 23:09:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B109B212BD
	for <lists+linux-i2c@lfdr.de>; Mon, 23 Sep 2024 21:09:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B44824BB;
	Mon, 23 Sep 2024 21:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ro//ND4f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10391823A9
	for <linux-i2c@vger.kernel.org>; Mon, 23 Sep 2024 21:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727125780; cv=none; b=DdfcQKVWPI2b0FUE6VgQerzyYnibueFFXTzNPoHWaQJTO4VdeysyEBWv2AQi9fgQ+wTAEhsF4TAId4sIHmEk4idmesscdf2cA0X7L3nH0hASf7ILhWp4NxT0GzOXsGbIlC8BCmLB1SgQtaIGzr7AICWpTPS/QBQWWhfUsa2V7mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727125780; c=relaxed/simple;
	bh=y/BDAr+WVaqjTV+kyPtji91RDlLPTklaOZh+mKm7qeU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vf0nTFBUaN8jJMf4zDBjGk2jd0cdJrTyyeTtbaBlVYWThHFe7JD4KVLK3F0wkbr8fpm7ECuqRsTYXAIWngv9gBSqmdsTePx60f7vdQnfxevDq69JK+Vthd0KXMG9Fey+suvYI5ykXR+28F0TcddtCtqwt3t6f2+ZDNaGQNkxVxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ro//ND4f; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B8C042C05DB;
	Tue, 24 Sep 2024 09:09:29 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727125769;
	bh=y/BDAr+WVaqjTV+kyPtji91RDlLPTklaOZh+mKm7qeU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ro//ND4fdyFcE1LunEeqmjg1bJDqNpc67ohVmbKDYgA6CwuscMABU73KZC4qpPA4C
	 Whdc4G56+ZvLA0rvuNv7iVieTMCQYti8/iWhlwFLJPKXgrekN5zmC7PfgAsdfjJskZ
	 EfRMOBpjU69yNduAB68M8reTQQIFhTiNXp/IKXHOJPsLJJ7+81NJlal12gkMQS4ajB
	 4DXa9hgftME5fKXoXpzTBAdPkG45+WZTJ1p0HbeedIVwYFYlm2AIKdaHH/FGkYVNG6
	 ya/tQlUaU4eDt9GSwbCos6TgZouJrozMm5u3Dw9LFqUTpc/PE12vRgybXhGaeQZgB1
	 COeUBF0F64jTg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f1d9090001>; Tue, 24 Sep 2024 09:09:29 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 24 Sep 2024 09:09:29 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Tue, 24 Sep 2024 09:09:29 +1200
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
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: Add RTL9300 I2C controller
Thread-Topic: [PATCH v2 1/3] dt-bindings: i2c: Add RTL9300 I2C controller
Thread-Index: AQHbCvFfF1/lrjWfeE+OalLwVwvZx7JjfDOAgAGegAA=
Date: Mon, 23 Sep 2024 21:09:29 +0000
Message-ID: <ab5c995c-b7b6-4435-9f6e-8b0e37add2e9@alliedtelesis.co.nz>
References: <20240920000930.1828086-1-chris.packham@alliedtelesis.co.nz>
 <20240920000930.1828086-2-chris.packham@alliedtelesis.co.nz>
 <6hlfdtbdf7yhkaoiuglhk4gksgzpahewzjf4cseedon7x2tx3s@m6c23rqxwkyu>
In-Reply-To: <6hlfdtbdf7yhkaoiuglhk4gksgzpahewzjf4cseedon7x2tx3s@m6c23rqxwkyu>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <3031525CF0626642A5B23B759A5BCE06@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f1d909 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=62ntRvTiAAAA:8 a=gEfo2CItAAAA:8 a=7N9J6BbcnEMxvS8Re7gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0

SGkgS3J6eXpzdG9mLA0KDQpPbiAyMy8wOS8yNCAwODoyNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3
cm90ZToNCj4gT24gRnJpLCBTZXAgMjAsIDIwMjQgYXQgMTI6MDk6MjhQTSArMTIwMCwgQ2hyaXMg
UGFja2hhbSB3cm90ZToNCj4+IEFkZCBkdHNjaGVtYSBmb3IgdGhlIEkyQyBjb250cm9sbGVyIG9u
IHRoZSBSVEw5MzAwIFNvQy4gVGhlIEkyQw0KPj4gY29udHJvbGxlcnMgb24gdGhpcyBTb0MgYXJl
IHBhcnQgb2YgdGhlICJzd2l0Y2giIGJsb2NrIHdoaWNoIGlzDQo+PiByZXByZXNlbnRlZCBoZXJl
IGFzIGEgc3lzY29uIG5vZGUuIFRoZSBTQ0wgcGlucyBhcmUgZGVwZW5kZW50IG9uIHRoZSBJMkMN
Cj4+IGNvbnRyb2xsZXIgKEdQSU84IGZvciB0aGUgZmlyc3QgY29udHJvbGxlciwgR1BJTyAxNyBm
b3IgdGhlIHNlY29uZCkuIFRoZQ0KPj4gU0RBIHBpbnMgY2FuIGJlIGFzc2lnbmVkIHRvIGVpdGhl
ciBvbmUgb2YgdGhlIEkyQyBjb250cm9sbGVycyAoYnV0IG5vdA0KPj4gYm90aCkuDQo+Pg0KPj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lz
LmNvLm56Pg0KPj4gLS0tDQo+Pg0KPj4gTm90ZXM6DQo+PiAgICAgIENoYW5nZXMgaW4gdjI6DQo+
PiAgICAgIC0gVXNlIHJlZyBwcm9wZXJ0eSBmb3IgY29udHJvbGxlciByZWdpc3RlcnMNCj4+ICAg
ICAgLSBSZW1vdmUgZ2xvYmFsLWNvbnRyb2wtb2Zmc2V0ICh3aWxsIGJlIGhhcmQgY29kZWQgaW4g
ZHJpdmVyKQ0KPj4gICAgICAtIEludGVncmF0ZWQgdGhlIG11bHRpcGxleGluZyBmdW5jdGlvbi4g
Q2hpbGQgbm9kZXMgbm93IHJlcHJlc2VudCB0aGUNCj4+ICAgICAgICBhdmFpbGFibGUgU0RBIGxp
bmVzDQo+Pg0KPj4gICAuLi4vYmluZGluZ3MvaTJjL3JlYWx0ZWsscnRsOTMwMC1pMmMueWFtbCAg
ICAgfCA4MiArKysrKysrKysrKysrKysrKysrDQo+PiAgIE1BSU5UQUlORVJTICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICA2ICsrDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgODgg
aW5zZXJ0aW9ucygrKQ0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2kyYy9yZWFsdGVrLHJ0bDkzMDAtaTJjLnlhbWwNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9yZWFsdGVrLHJ0
bDkzMDAtaTJjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3Jl
YWx0ZWsscnRsOTMwMC1pMmMueWFtbA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4
IDAwMDAwMDAwMDAwMC4uZThjMzcyMzliMjk5DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL3JlYWx0ZWsscnRsOTMwMC1pMmMu
eWFtbA0KPj4gQEAgLTAsMCArMSw4MiBAQA0KPj4gKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPj4gKyVZQU1MIDEuMg0KPj4gKy0tLQ0K
Pj4gKyRpZDogaHR0cDovL3NjYW5tYWlsLnRydXN0d2F2ZS5jb20vP2M9MjA5ODgmZD0yXzN3NXFk
S2F3Y3Z3N0J2NkszbUFfdjRKRjFybHhkZE4zQWhDZWtTdGcmdT1odHRwJTNhJTJmJTJmZGV2aWNl
dHJlZSUyZW9yZyUyZnNjaGVtYXMlMmZpMmMlMmZyZWFsdGVrJTJjcnRsOTMwMC1pMmMlMmV5YW1s
JTIzDQo+PiArJHNjaGVtYTogaHR0cDovL3NjYW5tYWlsLnRydXN0d2F2ZS5jb20vP2M9MjA5ODgm
ZD0yXzN3NXFkS2F3Y3Z3N0J2NkszbUFfdjRKRjFybHhkZE55SnhEYmdYc3cmdT1odHRwJTNhJTJm
JTJmZGV2aWNldHJlZSUyZW9yZyUyZm1ldGEtc2NoZW1hcyUyZmNvcmUlMmV5YW1sJTIzDQo+PiAr
DQo+PiArdGl0bGU6IFJlYWx0ZWsgUlRMIEkyQyBDb250cm9sbGVyDQo+PiArDQo+PiArbWFpbnRh
aW5lcnM6DQo+PiArICAtIENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNp
cy5jby5uej4NCj4+ICsNCj4+ICtkZXNjcmlwdGlvbjoNCj4+ICsgIFRoZSBSVEw5MzAwIFNvQyBo
YXMgdHdvIEkyQyBjb250cm9sbGVycy4gRWFjaCBvZiB0aGVzZSBoYXMgYW4gU0NMIGxpbmUgKHdo
aWNoDQo+PiArICBpZiBub3QtdXNlZCBmb3IgU0NMIGNhbiBiZSBhIEdQSU8pLiBUaGVyZSBhcmUg
OCBjb21tb24gU0RBIGxpbmVzIHRoYXQgY2FuIGJlDQo+PiArICBhc3NpZ25lZCB0byBlaXRoZXIg
STJDIGNvbnRyb2xsZXIuDQo+PiArDQo+PiArcHJvcGVydGllczoNCj4+ICsgIGNvbXBhdGlibGU6
DQo+PiArICAgIGNvbnN0OiByZWFsdGVrLHJ0bDkzMDAtaTJjDQo+PiArDQo+PiArICByZWc6DQo+
PiArICAgIGRlc2NyaXB0aW9uOiBSZWdpc3RlciBvZmZzZXQgYW5kIHNpemUgdGhpcyBJMkMgY29u
dHJvbGxlci4NCj4+ICsNCj4+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4+ICsgICdeaTJjQFswLTdd
JCc6DQo+PiArICAgICRyZWY6IC9zY2hlbWFzL2kyYy9pMmMtY29udHJvbGxlci55YW1sDQo+PiAr
ICAgIHVuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4+ICsNCj4+ICsgICAgcHJvcGVydGll
czoNCj4+ICsgICAgICByZWc6DQo+PiArICAgICAgICBkZXNjcmlwdGlvbjogVGhlIFNEQSBwaW4g
YXNzb2NpYXRlZCB3aXRoIHRoZSBJMkMgYnVzLg0KPj4gKyAgICAgICAgbWF4SXRlbXM6IDENCj4+
ICsNCj4+ICsgICAgcmVxdWlyZWQ6DQo+PiArICAgICAgLSByZWcNCj4+ICsNCj4+ICt1bmV2YWx1
YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+IFRoaXMgZ29lcyBhZnRlciAicmVxdWlyZWQ6IiBibG9j
ay4NCkFjay4NCj4+ICsNCj4+ICtyZXF1aXJlZDoNCj4+ICsgIC0gY29tcGF0aWJsZQ0KPj4gKyAg
LSByZWcNCj4+ICsNCj4+ICtleGFtcGxlczoNCj4+ICsgIC0gfA0KPj4gKyAgICBzd2l0Y2hAMWIw
MDAwMDAgew0KPj4gKyAgICAgIGNvbXBhdGlibGUgPSAicmVhbHRlayxydGw5MzAyYy1zd2l0Y2gi
LCAic3lzY29uIiwgInNpbXBsZS1tZmQiOw0KPiBEcm9wLi4uIG9yIHB1dCBlbnRpcmUgZXhhbXBs
ZSBpbiB0aGUgcGFyZW50IGRldmljZSBub2RlLg0KDQpPSyBJJ2xsIGRyb3AgaXQuDQoNCj4NCj4+
ICsgICAgICByZWcgPSA8MHgxYjAwMDAwMCAweDEwMDAwPjsNCj4+ICsgICAgICAjYWRkcmVzcy1j
ZWxscyA9IDwxPjsNCj4+ICsgICAgICAjc2l6ZS1jZWxscyA9IDwxPjsNCj4+ICsNCj4+ICsgICAg
ICBpMmNAMzZjIHsNCj4+ICsgICAgICAgIGNvbXBhdGlibGUgPSAicmVhbHRlayxydGw5MzAwLWky
YyI7DQo+IFBhcmVudCBpcyA5MzAyYywgYnV0IHRoaXMgaXMgOTMwMD8NCg0KVGhlIFJUTDkzMDJD
IGlzIG9uZSBvZiBhIHNlcmllcyBvZiBzd2l0Y2ggY2hpcHMgd2l0aCBpbnRlZ3JhdGVkIENQVXMu
IA0KVGhlcmUgaXMgYWxzbyB0aGUgUlRMOTMwMSwgUlRMOTMwMkIgYW5kIFJUTDkzMDMgKHRoZXJl
IG15IGJlIG90aGVycyBidXQgDQp0aG9zZSBhcmUgdGhlIDQgSSBrbm93IGFib3V0KS4gVGhlIGRp
ZmZlcmVuY2VzIGFyZSBhbGwgYXJvdW5kIHRoZSBzd2l0Y2ggDQpwb3J0L1NFUkRFUy4gVGhlIGRv
Y3VtZW50YXRpb24gdXNlcyAiUlRMOTMwMCIgd2hlbiByZWZlcnJpbmcgdG8gdGhpbmdzIA0KY29t
bW9uIGFjcm9zcyB0aGUgZmFtaWx5LiBUaGVyZSdzIGV2ZW4gYW4gYXBwIG5vdGUgdGl0bGVkIA0K
IlJUTDkzMDBfSTJDX0FwcGxpY2F0aW9uX05vdGVfVjEuMSg4MykiLiBTbyBJJ2QgcmVhbGx5IGxp
a2UgdG8gdXNlIA0KInJ0bDkzMDAiIHdoZW4gdGFsa2luZyBhYm91dCB0aGUgU29DIHBlcmlwaGVy
YWxzIGJ1dCB1c2UgdGhlIHNwZWNpZmljIA0KY2hpcCBjb21wYXRpYmxlIHdoZW4gdGFsa2luZyBh
Ym91dCB0aGUgRXRoZXJuZXQgc3dpdGNoIG9yIHRoZSBvdmVyYWxsIA0KY2hpcC4gSSdtIGFsc28g
dGVtcHRlZCB0byBhZGQgdGhlIG90aGVyIHZhcmlhbnRzIHRvIG15IG90aGVyIGluLWZsaWdodCAN
CnBhdGNoIHNlcmllcy4NCg0KInJlYWx0ZWsscnRsOTMwMC1pMmMiIGFsc28gaGFwcGVucyB0byBi
ZSB3aGF0IG9wZW53cnQgaXMgdXNpbmcsIGJ1dCBJJ20gDQpub3Qgc3VyZSB0aGF0IHRoYXQgaGVs
cHMgbXkgYXJndW1lbnQgYXMgdGhlIGJpbmRpbmcgaXMgbm93IHF1aXRlIGRpZmZlcmVudC4NCg0K
Pg0KPj4gKyAgICAgICAgcmVnID0gPDB4MzZjIDB4MTQ+Ow0KPj4gKyAgICAgICAgY2xvY2stZnJl
cXVlbmN5ID0gPDEwMDAwMD47DQo+PiArICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+
ICsgICAgICAgICNzaXplLWNlbGxzID0gPDA+Ow0KPj4gKw0KPj4gKyAgICAgICAgaTJjQDAgew0K
Pj4gKyAgICAgICAgICByZWcgPSA8MD47DQo+PiArICAgICAgICAgICNhZGRyZXNzLWNlbGxzID0g
PDE+Ow0KPj4gKyAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4+ICsgICAgICAgICAgZ3Bp
b0AyMCB7DQo+PiArICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm54cCxwY2E5NTU1IjsNCj4g
TWl4ZWQgaW5kZW50YXRpb24uDQpXaG9vcHMgbWlzc2VkIHRoYXQuIFdpbGwgZml4Lg0KPg0KPj4g
KyAgICAgICAgICAgICAgZ3Bpby1jb250cm9sbGVyOw0KPj4gKyAgICAgICAgICAgICAgI2dwaW8t
Y2VsbHMgPSA8Mj47DQo+PiArICAgICAgICAgICAgICByZWcgPSA8MHgyMD47DQo+PiArICAgICAg
ICAgIH07DQo+PiArICAgICAgICB9Ow0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPg==

