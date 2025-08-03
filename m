Return-Path: <linux-i2c+bounces-12139-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93510B196C9
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 00:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DE1B174AFA
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 22:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350B0205ABA;
	Sun,  3 Aug 2025 22:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="gA9QQAaZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C114A80C02
	for <linux-i2c@vger.kernel.org>; Sun,  3 Aug 2025 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754260786; cv=none; b=HGhiwXlkQyOmHN1ylLU6HoTngqpt5ujqqROhJAEwlkdLKwXmAluCi3jJwcJjJwGjnJ4pm6WC3LmIG9FPCHX1WZ05aZGW/HKZS2kQlh/F7VU6fVnS9z4Qp5dFvV2ER+EjrUIGDHLiSiaAsYNuYjn713s4VMoBWHy7p6bxbMiAc/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754260786; c=relaxed/simple;
	bh=R7rmafMSgtAJszOEduijGs6Se1oOKOPF5+6rbwRLc10=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fipmZ2YYnZXVgXSLlnCn8fyiARtHFfVODkjfJfeXgrKVGnQQnZF1+f4YrhifxHbIikgPpPEWgKH5k9JH+cacpKZ+FZTHXVZTfm1P0E7Nlc+OZt4WQg3iFrE51SMk7g/+VBWzefYA0mARDUdwuvDgfmOXrtdF6/sF8f2M8Q6kuqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=gA9QQAaZ; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3A6262C0132;
	Mon,  4 Aug 2025 10:39:41 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1754260781;
	bh=R7rmafMSgtAJszOEduijGs6Se1oOKOPF5+6rbwRLc10=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gA9QQAaZXigQEny5YIRkrcmQxyb3VAa5VE8itXysOzA9zfAGOXTrFyu1kBmzLnhDX
	 NPvJ2MnPwZzPxujM8hj3y/dTwdwnyFYi5eaEmFt9FFsXypd4vPFjHStY28Vs5Evpbu
	 UefpbXlTjm/3FERngASkz3uG81D6umS1oOfnSRiPXbTsnEZGh0uL4a1y7PI27udDH8
	 2ln5ZHHvii44LsRJN08cQ1r/rtEcWk5m5Bvm2EgemPBTqmh0GSldIFxieEgP8MoONN
	 jenzuwlegZg1GijFxIUPX+Z1mngutTaxGJ++w4yamSNTqjTiVky61vO/ByhiFszVSD
	 Xdl/xwWYHWvSw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B688fe52d0001>; Mon, 04 Aug 2025 10:39:41 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 4 Aug 2025 10:39:40 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Mon, 4 Aug 2025 10:39:40 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Sven Eckelmann <sven@narfation.org>, Andi Shyti <andi.shyti@kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Jelonek
	<jelonek.jonas@gmail.com>, Harshal Gohel <hg@simonwunderlich.de>, "Simon
 Wunderlich" <sw@simonwunderlich.de>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Thread-Topic: [PATCH v2 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Thread-Index: AQHcBJd8bmOI4NeShEipRLvbsLTQkLRQvKUA
Date: Sun, 3 Aug 2025 22:39:40 +0000
Message-ID: <4152a424-13ea-4437-b9e9-f1b5561cca9e@alliedtelesis.co.nz>
References: <20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org>
In-Reply-To: <20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <D196CF04CAF4D3489F9575C068F3C41F@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dtt4CEg4 c=1 sm=1 tr=0 ts=688fe52d a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=62ntRvTiAAAA:8 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=svCTMBYCAAAA:8 a=qy2jpt_WN9sJS3AXcjwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=IC2XNlieTeVoXbcui8wp:22 a=lbQUARmhvTNeubMQCRFT:22
X-SEG-SpamProfiler-Score: 0

U29ycnkgZm9yIHRoZSBub2lzZS4gSSBkaWQgdGVzdCB2MiBidXQgcmVwbGllZCB0byB2MS4NCg0K
T24gMDQvMDgvMjAyNSAwNDo1NCwgU3ZlbiBFY2tlbG1hbm4gd3JvdGU6DQo+IER1cmluZyB0aGUg
aW50ZWdyYXRpb24gb2YgdGhlIFJUTDgyMzkgUE9FIGNoaXAgKyBpdHMgZnJvbnRlbmQgTUNVLCBp
dCB3YXMNCj4gbm90aWNlZCB0aGF0IG11bHRpLWJ5dGUgb3BlcmF0aW9ucyB3ZXJlIGJhc2ljYWxs
eSBicm9rZW4gaW4gdGhlIGN1cnJlbnQNCj4gZHJpdmVyLg0KPg0KPiBUZXN0cyB1c2luZyBTTUJ1
cyBCbG9jayBXcml0ZXMgc2hvd2VkIHRoYXQgdGhlIGRhdGEgKGFmdGVyIHRoZSBXciArIEFjaw0K
PiBtYXJrZXIpIHdhcyBtaXhlZCB1cCBvbiB0aGUgd2lyZS4gQXQgZmlyc3QgZ2xhbmNlLCBpdCBs
b29rZWQgbGlrZSBhbg0KPiBlbmRpYW5uZXNzIHByb2JsZW0uIEJ1dCBmb3IgdHJhbnNmZXJzIHdl
cmUgdGhlIG51bWJlciBvZiBjb3VudCArIGRhdGEgYnl0ZXMNCj4gd2FzIG5vdCBkaXZpc2libGUg
YnkgNCwgdGhlIGxhc3QgYnl0ZXMgd2VyZSBub3QgbG9va2luZyBsaWtlIGFuIGVuZGlhbm5lc3MN
Cj4gcHJvYmxlbSBiZWNhdXNlIHRoZXkgd2VyZSB3ZXJlIGluIHRoZSB3cm9uZyBvcmRlciBidXQg
bm90IGZvciBleGFtcGxlIDAgLQ0KPiB3aGljaCB3b3VsZCBiZSB0aGUgY2FzZSBmb3IgYW4gZW5k
aWFubmVzcyBwcm9ibGVtIHdpdGggMzIgYml0IHJlZ2lzdGVycy4gQXQNCj4gdGhlIGVuZCwgaXQg
dHVybmVkIG91dCB0byBiZSBhIHRoZSB3YXkgaG93IGkyY193cml0ZSB0cmllZCB0byBhZGQgdGhl
IGJ5dGVzDQo+IHRvIHRoZSBzZW5kIHJlZ2lzdGVycy4NCj4NCj4gRWFjaCAzMiBiaXQgcmVnaXN0
ZXIgd2FzIHVzZWQgc2ltaWxhciB0byBhIHNoaWZ0IHJlZ2lzdGVyIC0gc2hpZnRpbmcgdGhlDQo+
IHZhcmlvdXMgYnl0ZXMgdXAgdGhlIHJlZ2lzdGVyIHdoaWxlIHRoZSBuZXh0IG9uZSBpcyBhZGRl
ZCB0byB0aGUgbGVhc3QNCj4gc2lnbmlmaWNhbnQgYnl0ZS4gQnV0IHRoZSBJMkMgY29udHJvbGxl
ciBleHBlY3RzIHRoZSBmaXJzdCBieXRlIG9mIHRoZQ0KPiB0cmFubWlzc2lvbiBpbiB0aGUgbGVh
c3Qgc2lnbmlmaWNhbnQgYnl0ZSBvZiB0aGUgZmlyc3QgcmVnaXN0ZXIuIEFuZCB0aGUNCj4gbGFz
dCBieXRlIChhc3N1bWluZyBpdCBpcyBhIDE2IGJ5dGUgdHJhbnNmZXIpIGluIHRoZSBtb3N0IHNp
Z25pZmljYW50IGJ5dGUNCj4gb2YgdGhlIGZvdXJ0aCByZWdpc3Rlci4NCj4NCj4gV2hpbGUgZG9p
bmcgdGhlc2UgdGVzdHMsIGl0IHdhcyBhbHNvIG9ic2VydmVkIHRoYXQgdGhlIGNvdW50IGJ5dGUg
d2FzDQo+IG1pc3NpbmcgZnJvbSB0aGUgU01CdXMgQmxvY2sgV3JpdGVzLiBUaGUgZHJpdmVyIGp1
c3QgcmVtb3ZlZCB0aGVtIGZyb20gdGhlDQo+IGRhdGEtPmJsb2NrIChmcm9tIHRoZSBJMkMgc3Vi
c3lzdGVtKS4gQnV0IHRoZSBJMkMgY29udHJvbGxlciBET0VTIE5PVA0KPiBhdXRvbWF0aWNhbGx5
IGFkZCB0aGlzIGJ5dGUgLSBmb3IgZXhhbXBsZSBieSB1c2luZyB0aGUgY29uZmlndXJlZA0KPiB0
cmFuc21pc3Npb24gbGVuZ3RoLg0KPg0KPiBUaGUgUlRMODIzOSBNQ1UgaXMgbm90IGFjdHVhbGx5
IGFuIFNNQnVzIGNvbXBsaWFudCBkZXZpY2UuIEluc3RlYWQsIGl0DQo+IGV4cGVjdHMgSTJDIEJs
b2NrIFJlYWRzICsgSTJDIEJsb2NrIFdyaXRlcy4gQnV0IGFjY29yZGluZyB0byB0aGUgYWxyZWFk
eQ0KPiBpZGVudGlmaWVkIGJ1Z3MgaW4gdGhlIGRyaXZlciwgaXQgd2FzIGNsZWFyIHRoYXQgdGhl
IEkyQyBjb250cm9sbGVyIGNhbg0KPiBzaW1wbHkgYmUgbW9kaWZpZWQgdG8gbm90IHNlbmQgdGhl
IGNvdW50IGJ5dGUgZm9yIEkyQ19TTUJVU19JMkNfQkxPQ0tfREFUQS4NCj4gVGhlIHJlY2VpdmUg
cGFydCwganVzdCBuZWVkcyB0byB3cml0ZSB0aGUgY29udGVudCBvZiB0aGUgcmVjZWl2ZSBidWZm
ZXIgdG8NCj4gdGhlIGNvcnJlY3QgcG9zaXRpb24gaW4gZGF0YS0+YmxvY2suDQo+DQo+IFdoaWxl
IHRoZSBvbi13aXJlIGZvcm13YXQgd2FzIG5vdyBjb3JyZWN0LCByZWFkcyB3ZXJlIHN0aWxsIG5v
dCBwb3NzaWJsZQ0KPiBhZ2FpbnN0IHRoZSBNQ1UgKGZvciB0aGUgUlRMODIzOSBQT0UgY2hpcCku
IEl0IHdhcyBhbHdheXMgdGltaW5nIG91dA0KPiBiZWNhdXNlIHRoZSAybXMgd2VyZSBub3QgZW5v
dWdoIGZvciBzZW5kaW5nIHRoZSByZWFkIHJlcXVlc3QgYW5kIHRoZW4NCj4gcmVjZWl2aW5nIHRo
ZSAxMiBieXRlIGFuc3dlci4NCj4NCj4gVGhlc2UgY2hhbmdlcyB3ZXJlIG9yaWdpbmFsbHkgc3Vi
bWl0dGVkIHRvIE9wZW5XcnQuIEJ1dCB0aGVyZSBhcmUgcGxhbnMgdG8NCj4gbWlncmF0ZSBPcGVu
V3J0IHRvIHRoZSB1cHN0cmVhbSBMaW51eCBkcml2ZXIuIEFzIHJlc3VsdCwgdGhlIHB1bGwgcmVx
dWVzdA0KPiB3YXMgc3RvcHBlZCBhbmQgdGhlIGNoYW5nZXMgd2VyZSByZWRvbmUgYWdhaW5zdCB0
aGlzIGRyaXZlci4NCj4NCj4gRm9yIHJlYXNvbnMgb2YgdHJhbnNwYXJlbmN5OiBUaGUgd29yayBv
biBJMkNfU01CVVNfSTJDX0JMT0NLX0RBVEEgc3VwcG9ydA0KPiBmb3IgdGhlIFJUTDgyMzktTUNV
IHdhcyBkb25lIG9uIFJUTDkzMXh4LiBBbGwgcHJvYmxlbSB3ZXJlIHRoZXJlZm9yZQ0KPiBkZXRl
Y3RlZCB3aXRoIHRoZSBwYXRjaGVzIGZyb20gSm9uYXMgSmVsb25layBbMV0gYW5kIG5vdCB0aGUg
dmFuaWxsYSBMaW51eA0KPiBkcml2ZXIuIEJ1dCBsb29raW5nIHRocm91Z2ggdGhlIGNvZGUsIGl0
IHNlZW1zIGxpa2UgdGhlc2UgYXJlIE5PVA0KPiByZWdyZXNzaW9ucyBpbnRyb2R1Y2VkIGJ5IHRo
ZSBSVEw5MzF4IHBhdGNoc2V0Lg0KPg0KPiBbMV0gaHR0cHM6Ly9zY2FubWFpbC50cnVzdHdhdmUu
Y29tLz9jPTIwOTg4JmQ9bnBTUDZORFBYVGFRVENsU2RGbUQ2Uk1uZzVmZzRXTXo3S1NDeDV0Z053
JnU9aHR0cHMlM2ElMmYlMmZwYXRjaHdvcmslMmVvemxhYnMlMmVvcmclMmZwcm9qZWN0JTJmbGlu
dXgtaTJjJTJmY292ZXIlMmYyMDI1MDcyNzExNDgwMCUyZTMwNDYtMS1qZWxvbmVrJTJlam9uYXMl
NDBnbWFpbCUyZWNvbSUyZg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdmVuIEVja2VsbWFubiA8c3Zl
bkBuYXJmYXRpb24ub3JnPg0KDQpGb3IgdGhlIHNlcmllcw0KDQpSZXZpZXdlZC1ieTogQ2hyaXMg
UGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KVGVzdGVkLWJ5OiBD
aHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQoNCk5vdGUg
dGhhdCBJJ3ZlIG9ubHkgZ290IHRoZSBzYW1lIHNpbXBsZSBlZXByb20gZGV2aWNlcyB0aGF0IEkg
ZGlkIHRoZSANCmluaXRpYWwgZGV2ZWxvcG1lbnQgb24gc28gSSBkb24ndCB0aGluayBJJ3ZlIHJl
YWxseSBleGVyY2lzZWQgdGhlIGJsb2NrIA0KZGF0YSBwYXRocyBidXQgSSBjYW4gc2F5IHRoZSBj
aGFuZ2VzIGRvbid0IGFwcGVhciB0byBoYXZlIHJlZ3Jlc3NlZCANCmFueXRoaW5nLg0KDQo+IC0t
LQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIGFkZCB0aGUgbWlzc2luZyB0cmFuc2ZlciB3aWR0aCBh
bmQgcmVhZCBsZW5ndGggaW5jcmVhc2UgZm9yIHRoZSBTTUJ1cw0KPiAgICBXcml0ZS9SZWFkDQo+
IC0gTGluayB0byB2MTogaHR0cHM6Ly9zY2FubWFpbC50cnVzdHdhdmUuY29tLz9jPTIwOTg4JmQ9
bnBTUDZORFBYVGFRVENsU2RGbUQ2Uk1uZzVmZzRXTXo3S0hReE1Wc1lnJnU9aHR0cHMlM2ElMmYl
MmZsb3JlJTJla2VybmVsJTJlb3JnJTJmciUyZjIwMjUwODAyLWkyYy1ydGw5MzAwLW11bHRpLWJ5
dGUtdjEtMC01ZjY4N2UwMDk4ZTIlNDBuYXJmYXRpb24lMmVvcmcNCj4NCj4gLS0tDQo+IEhhcnNo
YWwgR29oZWwgKDIpOg0KPiAgICAgICAgaTJjOiBydGw5MzAwOiBGaXggbXVsdGktYnl0ZSBJMkMg
d3JpdGUNCj4gICAgICAgIGkyYzogcnRsOTMwMDogSW1wbGVtZW50IEkyQyBibG9jayByZWFkIGFu
ZCB3cml0ZQ0KPg0KPiBTdmVuIEVja2VsbWFubiAoMik6DQo+ICAgICAgICBpMmM6IHJ0bDkzMDA6
IEluY3JlYXNlIHRpbWVvdXQgZm9yIHRyYW5zZmVyIHBvbGxpbmcNCj4gICAgICAgIGkyYzogcnRs
OTMwMDogQWRkIG1pc3NpbmcgY291bnQgYnl0ZSBmb3IgU01CdXMgQmxvY2sgT3BzDQo+DQo+ICAg
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1ydGw5MzAwLmMgfCA0MyArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDM2IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogYjlkZGFhOTVmZDI4M2Jj
ZTcwNDE1NTBkZGJiZTdlNzY0YzQ3NzExMA0KPiBjaGFuZ2UtaWQ6IDIwMjUwODAyLWkyYy1ydGw5
MzAwLW11bHRpLWJ5dGUtZWRhYTFmYjA4NzJjDQo+DQo+IEJlc3QgcmVnYXJkcyw=

