Return-Path: <linux-i2c+bounces-7035-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B0B987A34
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 22:52:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE9E21F24F4A
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 20:52:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D87183CB6;
	Thu, 26 Sep 2024 20:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="dB8fSNHs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9888617BEAC
	for <linux-i2c@vger.kernel.org>; Thu, 26 Sep 2024 20:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727383943; cv=none; b=oQvpvmExZtrEs/4g7DEEY1Ie88VshY02xOP62u9ZYccW58L/UPklJamMlbtKbEHC6SdudXDK3q0JKULOueFjtRSKxFIhOZaYvS8vZeEay73lRZ7ujQhKmhTrVfWDc7jthq+05LCGX/swh5/XQliqSHjE8SgMOXSWqh+aMoRSngk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727383943; c=relaxed/simple;
	bh=CFVZk9PbcIyWENme2tejWi5yO0fGTir0Yb3Q4V+tEl8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TcK7GfziYeWFNizsCzFEHDtR4Doxgt4X5GOyjUpLYT95kWuB0LKaypcRK0M7BTFSjblpOf9svW5Y+CwjJzqOyVObMG1UKkIGs6bgJRt19aiJU2izjlIDzBJ4v1upXaU532e2XRwoR/cFaINbao+L9IeKyzTKCGHFtmBzGElGTtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=dB8fSNHs; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2DCDF2C0613;
	Fri, 27 Sep 2024 08:52:18 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727383938;
	bh=CFVZk9PbcIyWENme2tejWi5yO0fGTir0Yb3Q4V+tEl8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=dB8fSNHsGNb+VZ9rNVaxvr0I1zSspQHOh0syuCj2JCdStvr8ibBZ69M/WWImv6qMo
	 CDbhJwIXJ0rOQKu5ONu0MMcDH57xVYhgdDr4J8ptY1+8wSKPTBYgt0PImVO5QJJqLW
	 FTvd5tMHdGGsSsFBJDrRAAKsmd80YcTxcWVGFjTNS+Rt+0/YuY0e8fuNWlyp3Tg1/Y
	 GaO/kJFKxPbejZ1qtKhXW9YU3S9U6KYSinI3O063CnuC6RA4GZgU+whs2OVoc0FW3N
	 K/EEmc1XDgtOy+QFbMBdMgMREaFqC49oCzNtFOGPFZYYLKk7gw/5SYj0vuN6FcI8Uy
	 sHgum9XUx8hig==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f5c9820000>; Fri, 27 Sep 2024 08:52:18 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Fri, 27 Sep 2024 08:52:17 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Fri, 27 Sep 2024 08:52:17 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Fri, 27 Sep 2024 08:52:17 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "lee@kernel.org"
	<lee@kernel.org>, "sre@kernel.org" <sre@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v5 5/6] mips: dts: realtek: Add I2C controllers
Thread-Topic: [PATCH v5 5/6] mips: dts: realtek: Add I2C controllers
Thread-Index: AQHbD5ZF+7xT76Qpf0aJJZ+4/y1OGbJo1NYAgADuxIA=
Date: Thu, 26 Sep 2024 20:52:17 +0000
Message-ID: <3d39d12b-a206-46e2-b3fa-001914a68165@alliedtelesis.co.nz>
References: <20240925215847.3594898-1-chris.packham@alliedtelesis.co.nz>
 <20240925215847.3594898-6-chris.packham@alliedtelesis.co.nz>
 <euqypyub7f3bd7wa7w6axdt6mrvmbvckptvrum2rou3ni6sqdf@ouwm7zjuarni>
In-Reply-To: <euqypyub7f3bd7wa7w6axdt6mrvmbvckptvrum2rou3ni6sqdf@ouwm7zjuarni>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <A45B31A9E944204B81CA8C4EDEE1563F@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f5c982 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=KKAkSRfTAAAA:8 a=wTsGNWAvS5ChLd09A-EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=p9w29zTGHJRujDE_EBod:22 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAyNi8wOS8yNCAxODozNywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gVGh1
LCBTZXAgMjYsIDIwMjQgYXQgMDk6NTg6NDZBTSArMTIwMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToN
Cj4+IEFkZCB0aGUgSTJDIGNvbnRyb2xsZXJzIHRoYXQgYXJlIHBhcnQgb2YgdGhlIFJUTDkzMDAg
U29DLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1A
YWxsaWVkdGVsZXNpcy5jby5uej4NCj4+IC0tLQ0KPj4NCj4+IE5vdGVzOg0KPj4gICAgICBDaGFu
Z2VzIGluIHY1Og0KPj4gICAgICAtIFVwZGF0ZSBjb21wYXRpYmxlcw0KPj4gICAgICBDaGFuZ2Vz
IGluIHY0Og0KPj4gICAgICAtIFNraXBwZWQgZHVlIHRvIGNvbWJpbmluZyBwYXRjaCBzZXJpZXMN
Cj4+ICAgICAgQ2hhbmdlcyBpbiB2MzoNCj4+ICAgICAgLSBOb25lDQo+PiAgICAgIENoYW5nZXMg
aW4gdjI6DQo+PiAgICAgIC0gVXNlIHJlZyBwcm9wZXJ0eQ0KPj4NCj4+ICAgYXJjaC9taXBzL2Jv
b3QvZHRzL3JlYWx0ZWsvcnRsOTMwMmMuZHRzaSB8ICA4ICsrKysrKysrDQo+PiAgIGFyY2gvbWlw
cy9ib290L2R0cy9yZWFsdGVrL3J0bDkzMHguZHRzaSAgfCAxNiArKysrKysrKysrKysrKysrDQo+
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9hcmNoL21pcHMvYm9vdC9kdHMvcmVhbHRlay9ydGw5MzAyYy5kdHNpIGIvYXJjaC9taXBzL2Jv
b3QvZHRzL3JlYWx0ZWsvcnRsOTMwMmMuZHRzaQ0KPj4gaW5kZXggODBkOWY0MDdlNzU4Li41NmMz
NWU4YjhiNjIgMTAwNjQ0DQo+PiAtLS0gYS9hcmNoL21pcHMvYm9vdC9kdHMvcmVhbHRlay9ydGw5
MzAyYy5kdHNpDQo+PiArKysgYi9hcmNoL21pcHMvYm9vdC9kdHMvcmVhbHRlay9ydGw5MzAyYy5k
dHNpDQo+PiBAQCAtNSwzICs1LDExIEBADQo+PiAgICZzd2l0Y2gwIHsNCj4+ICAgCWNvbXBhdGli
bGUgPSAicmVhbHRlayxydGw5MzAyYy1zd2l0Y2giLCAicmVhbHRlayxydGw5MzAwLXN3aXRjaCIs
ICJzeXNjb24iLCAic2ltcGxlLW1mZCI7DQo+PiAgIH07DQo+PiArDQo+PiArJmkyYzAgew0KPj4g
Kwljb21wYXRpYmxlID0gInJlYWx0ZWsscnRsOTMwMmMtaTJjIiwgInJlYWx0ZWsscnRsOTMwMC1p
MmMiOw0KPj4gK307DQo+PiArDQo+PiArJmkyYzEgew0KPj4gKwljb21wYXRpYmxlID0gInJlYWx0
ZWsscnRsOTMwMmMtaTJjIiwgInJlYWx0ZWsscnRsOTMwMC1pMmMiOw0KPj4gK307DQo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9taXBzL2Jvb3QvZHRzL3JlYWx0ZWsvcnRsOTMweC5kdHNpIGIvYXJjaC9t
aXBzL2Jvb3QvZHRzL3JlYWx0ZWsvcnRsOTMweC5kdHNpDQo+PiBpbmRleCA4OWI4ODU0NTk2Y2Qu
LjJmYjg0NjFhZjU3NSAxMDA2NDQNCj4+IC0tLSBhL2FyY2gvbWlwcy9ib290L2R0cy9yZWFsdGVr
L3J0bDkzMHguZHRzaQ0KPj4gKysrIGIvYXJjaC9taXBzL2Jvb3QvZHRzL3JlYWx0ZWsvcnRsOTMw
eC5kdHNpDQo+PiBAQCAtNDEsNiArNDEsMjIgQEAgcmVib290QGMgew0KPj4gICAJCQlyZWcgPSA8
MHgwYyAweDQ+Ow0KPj4gICAJCQl2YWx1ZSA9IDwweDAxPjsNCj4+ICAgCQl9Ow0KPj4gKw0KPj4g
KwkJaTJjMDogaTJjQDM2YyB7DQo+PiArCQkJY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0bDkzMDAt
aTJjIjsNCj4+ICsJCQlyZWcgPSA8MHgzNmMgMHgxND47DQo+PiArCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsNCj4gVXN1YWwgY29udmVudGlvbiBpcyB0byBoYXZlIHN0YXR1cyB0aGUgbGFzdC4gTWF5
YmUgTUlQUyBoYXMgZGlmZmVyZW50LA0KPiBzbyBrZWVwIHdoYXRldmVyIGlzIGNvbnNpc3RlbnQg
aW4geW91ciBjYXNlLg0KDQpJJ2xsIHNlbmQgb3V0IGEgZml4dXAgcGF0Y2ggdGhhdCBjYW4gYmUg
Zm9sZGVkIGludG8gdGhpcy4gSG9wZWZ1bGx5IA0KVGhvbWFzIGNhbiBjb21iaW5lIHRoZW0gYXQg
aGlzIGVuZCAob3IgaWYgdGhlcmUgaXMgYSBuZWVkIGZvciBhIHY2IEkgY2FuKS4NCg0KSSdsbCBw
cm9iYWJseSBoYXZlIG90aGVyIHNlcmllcyB0b3VjaGluZyB0aGlzIGZpbGUgc28gaWYgdGhlIGZp
eHVwIA0KZG9lc24ndCBtYWtlIGl0IG5vdyBJIGNhbiBpbmNsdWRlIGl0IGluIGEgZnV0dXJlIHNl
cmllcy4NCg0KPg0KPiBBbnl3YXk6DQo+DQo+IFJldmlld2VkLWJ5OiBLcnp5c3p0b2YgS296bG93
c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+DQo+IEJlc3QgcmVnYXJkcywN
Cj4gS3J6eXN6dG9mDQo+

