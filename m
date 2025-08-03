Return-Path: <linux-i2c+bounces-12135-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E82B3B196AC
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 00:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 643097AA5D8
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 22:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8341F5838;
	Sun,  3 Aug 2025 22:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="SJub7XGW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2139F187332
	for <linux-i2c@vger.kernel.org>; Sun,  3 Aug 2025 22:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754259408; cv=none; b=OU172R9XBwAA/K82kIIAJ3pb83AvIJfwzhbpL0xMlUDzjlzvGN+SFwobHNa5/vTfEdnPf6P1U/HaCh8QbtTC8ODrxhiS0lwYr9hELKSEjdOndUcdeJQbaEGR9KwShZDWv16npmjiHOeribuVxgMPxHuW8R949HDmQB1dZ8zKJB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754259408; c=relaxed/simple;
	bh=wrg8YNi/+mgLr+kRzaWZ4y4voMkbPDI5eze5xDzcR/o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W+4qIk9IBpZcU21wd6my6ClC4M/U1z6ud4bN+kd1gBRRLwkp8B7B5stX2qAKlYYb/c1WOru5KO9inSdC5qwnJInMKcnQ5wTzyMqaBjzm+obtRkqm5JZk2nVpqyvJo2M1ZPU71o6N3aNqSWtRPSdys20h66uLfC9rl05/2R1mV8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=SJub7XGW; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 41C7F2C03C5;
	Mon,  4 Aug 2025 10:16:42 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1754259402;
	bh=wrg8YNi/+mgLr+kRzaWZ4y4voMkbPDI5eze5xDzcR/o=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=SJub7XGW3xcf/+z6XLDyhnrbFpzabPLh7eNvft7PFEckmDk1hYiMkFjMiKSgDYLNc
	 XTEepe3CEAi4Ew60vrjd12nAqTW4qENGIFpcUAbpRmpmcxS22wKKhajyEqvPTcjrxT
	 TyO981bLIzm9slCp8IdMjVRBYR0lYxu0ygBJ3Yp0M/DeHEDV+WfPbn5n8liitX0oBu
	 vEs5ck1dbE6pYYsB0DzU/BHB2kuYOOD1GxiYWaepI92C4QlbDixaVtroaR0U4KVt4e
	 LoQzaIEsFtI9x1nfWiVWp/WIF9LBOzKTCc+oPxNoXrDxfo02pn3GoeD0naS10yxatS
	 KoJiEKpYzNzrg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B688fdfca0001>; Mon, 04 Aug 2025 10:16:42 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 4 Aug 2025 10:16:42 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Mon, 4 Aug 2025 10:16:41 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Sven Eckelmann <sven@narfation.org>, Andi Shyti <andi.shyti@kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Jelonek
	<jelonek.jonas@gmail.com>, Harshal Gohel <hg@simonwunderlich.de>, "Simon
 Wunderlich" <sw@simonwunderlich.de>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: Re: [PATCH 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Thread-Topic: [PATCH 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Thread-Index: AQHcA5jAuVD1sLz1K0OZF7KtVWyQTbRQtyEAgAABFoA=
Date: Sun, 3 Aug 2025 22:16:41 +0000
Message-ID: <50d3d886-8352-4c21-9243-d058f14d8c65@alliedtelesis.co.nz>
References: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
 <cfa3e1c5-c6fc-4bab-87c0-58e857eea2ad@alliedtelesis.co.nz>
In-Reply-To: <cfa3e1c5-c6fc-4bab-87c0-58e857eea2ad@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <DBA40D1A7BC15444BE930E65A5682513@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dtt4CEg4 c=1 sm=1 tr=0 ts=688fdfca a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=svCTMBYCAAAA:8 a=HhedtFaihxu2ksWirVcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=lbQUARmhvTNeubMQCRFT:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAwNC8wOC8yMDI1IDEwOjEyLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPiBIaSBTdmVuLA0K
Pg0KPiBPbiAwMi8wOC8yMDI1IDIyOjMxLCBTdmVuIEVja2VsbWFubiB3cm90ZToNCj4+IER1cmlu
ZyB0aGUgaW50ZWdyYXRpb24gb2YgdGhlIFJUTDgyMzkgUE9FIGNoaXAgKyBpdHMgZnJvbnRlbmQg
TUNVLCBpdCANCj4+IHdhcw0KPj4gbm90aWNlZCB0aGF0IG11bHRpLWJ5dGUgb3BlcmF0aW9ucyB3
ZXJlIGJhc2ljYWxseSBicm9rZW4gaW4gdGhlIGN1cnJlbnQNCj4+IGRyaXZlci4NCj4+DQo+PiBU
ZXN0cyB1c2luZyBTTUJ1cyBCbG9jayBXcml0ZXMgc2hvd2VkIHRoYXQgdGhlIGRhdGEgKGFmdGVy
IHRoZSBXciArIEFjaw0KPj4gbWFya2VyKSB3YXMgbWl4ZWQgdXAgb24gdGhlIHdpcmUuIEF0IGZp
cnN0IGdsYW5jZSwgaXQgbG9va2VkIGxpa2UgYW4NCj4+IGVuZGlhbm5lc3MgcHJvYmxlbS4gQnV0
IGZvciB0cmFuc2ZlcnMgd2VyZSB0aGUgbnVtYmVyIG9mIGNvdW50ICsgZGF0YSANCj4+IGJ5dGVz
DQo+PiB3YXMgbm90IGRpdmlzaWJsZSBieSA0LCB0aGUgbGFzdCBieXRlcyB3ZXJlIG5vdCBsb29r
aW5nIGxpa2UgYW4gDQo+PiBlbmRpYW5uZXNzDQo+PiBwcm9ibGVtIGJlY2F1c2UgdGhleSB3ZXJl
IHdlcmUgaW4gdGhlIHdyb25nIG9yZGVyIGJ1dCBub3QgZm9yIGV4YW1wbGUgDQo+PiAwIC0NCj4+
IHdoaWNoIHdvdWxkIGJlIHRoZSBjYXNlIGZvciBhbiBlbmRpYW5uZXNzIHByb2JsZW0gd2l0aCAz
MiBiaXQgDQo+PiByZWdpc3RlcnMuIEF0DQo+PiB0aGUgZW5kLCBpdCB0dXJuZWQgb3V0IHRvIGJl
IGEgdGhlIHdheSBob3cgaTJjX3dyaXRlIHRyaWVkIHRvIGFkZCB0aGUgDQo+PiBieXRlcw0KPj4g
dG8gdGhlIHNlbmQgcmVnaXN0ZXJzLg0KPj4NCj4+IEVhY2ggMzIgYml0IHJlZ2lzdGVyIHdhcyB1
c2VkIHNpbWlsYXIgdG8gYSBzaGlmdCByZWdpc3RlciAtIHNoaWZ0aW5nIHRoZQ0KPj4gdmFyaW91
cyBieXRlcyB1cCB0aGUgcmVnaXN0ZXIgd2hpbGUgdGhlIG5leHQgb25lIGlzIGFkZGVkIHRvIHRo
ZSBsZWFzdA0KPj4gc2lnbmlmaWNhbnQgYnl0ZS4gQnV0IHRoZSBJMkMgY29udHJvbGxlciBleHBl
Y3RzIHRoZSBmaXJzdCBieXRlIG9mIHRoZQ0KPj4gdHJhbm1pc3Npb24gaW4gdGhlIGxlYXN0IHNp
Z25pZmljYW50IGJ5dGUgb2YgdGhlIGZpcnN0IHJlZ2lzdGVyLiBBbmQgdGhlDQo+PiBsYXN0IGJ5
dGUgKGFzc3VtaW5nIGl0IGlzIGEgMTYgYnl0ZSB0cmFuc2ZlcikgaW4gdGhlIG1vc3Qgc2lnbmlm
aWNhbnQgDQo+PiBieXRlDQo+PiBvZiB0aGUgZm91cnRoIHJlZ2lzdGVyLg0KPj4NCj4+IFdoaWxl
IGRvaW5nIHRoZXNlIHRlc3RzLCBpdCB3YXMgYWxzbyBvYnNlcnZlZCB0aGF0IHRoZSBjb3VudCBi
eXRlIHdhcw0KPj4gbWlzc2luZyBmcm9tIHRoZSBTTUJ1cyBCbG9jayBXcml0ZXMuIFRoZSBkcml2
ZXIganVzdCByZW1vdmVkIHRoZW0gDQo+PiBmcm9tIHRoZQ0KPj4gZGF0YS0+YmxvY2sgKGZyb20g
dGhlIEkyQyBzdWJzeXN0ZW0pLiBCdXQgdGhlIEkyQyBjb250cm9sbGVyIERPRVMgTk9UDQo+PiBh
dXRvbWF0aWNhbGx5IGFkZCB0aGlzIGJ5dGUgLSBmb3IgZXhhbXBsZSBieSB1c2luZyB0aGUgY29u
ZmlndXJlZA0KPj4gdHJhbnNtaXNzaW9uIGxlbmd0aC4NCj4+DQo+PiBUaGUgUlRMODIzOSBNQ1Ug
aXMgbm90IGFjdHVhbGx5IGFuIFNNQnVzIGNvbXBsaWFudCBkZXZpY2UuIEluc3RlYWQsIGl0DQo+
PiBleHBlY3RzIEkyQyBCbG9jayBSZWFkcyArIEkyQyBCbG9jayBXcml0ZXMuIEJ1dCBhY2NvcmRp
bmcgdG8gdGhlIGFscmVhZHkNCj4+IGlkZW50aWZpZWQgYnVncyBpbiB0aGUgZHJpdmVyLCBpdCB3
YXMgY2xlYXIgdGhhdCB0aGUgSTJDIGNvbnRyb2xsZXIgY2FuDQo+PiBzaW1wbHkgYmUgbW9kaWZp
ZWQgdG8gbm90IHNlbmQgdGhlIGNvdW50IGJ5dGUgZm9yIA0KPj4gSTJDX1NNQlVTX0kyQ19CTE9D
S19EQVRBLg0KPj4gVGhlIHJlY2VpdmUgcGFydCwganVzdCBuZWVkcyB0byB3cml0ZSB0aGUgY29u
dGVudCBvZiB0aGUgcmVjZWl2ZSANCj4+IGJ1ZmZlciB0bw0KPj4gdGhlIGNvcnJlY3QgcG9zaXRp
b24gaW4gZGF0YS0+YmxvY2suDQo+Pg0KPj4gV2hpbGUgdGhlIG9uLXdpcmUgZm9ybXdhdCB3YXMg
bm93IGNvcnJlY3QsIHJlYWRzIHdlcmUgc3RpbGwgbm90IHBvc3NpYmxlDQo+PiBhZ2FpbnN0IHRo
ZSBNQ1UgKGZvciB0aGUgUlRMODIzOSBQT0UgY2hpcCkuIEl0IHdhcyBhbHdheXMgdGltaW5nIG91
dA0KPj4gYmVjYXVzZSB0aGUgMm1zIHdlcmUgbm90IGVub3VnaCBmb3Igc2VuZGluZyB0aGUgcmVh
ZCByZXF1ZXN0IGFuZCB0aGVuDQo+PiByZWNlaXZpbmcgdGhlIDEyIGJ5dGUgYW5zd2VyLg0KPj4N
Cj4+IFRoZXNlIGNoYW5nZXMgd2VyZSBvcmlnaW5hbGx5IHN1Ym1pdHRlZCB0byBPcGVuV3J0LiBC
dXQgdGhlcmUgYXJlIA0KPj4gcGxhbnMgdG8NCj4+IG1pZ3JhdGUgT3BlbldydCB0byB0aGUgdXBz
dHJlYW0gTGludXggZHJpdmVyLiBBcyByZXN1bHQsIHRoZSBwdWxsIA0KPj4gcmVxdWVzdA0KPj4g
d2FzIHN0b3BwZWQgYW5kIHRoZSBjaGFuZ2VzIHdlcmUgcmVkb25lIGFnYWluc3QgdGhpcyBkcml2
ZXIuDQo+DQo+IFRoYW5rcy4gSSB3YXMgb25seSByZWFsbHkgYWJsZSB0byB0ZXN0IHdpdGggYmFz
aWMgZWVwcm9tIGxpa2UgZGV2aWNlcyANCj4gc28gaXQncyBub3QgZW50aXJlbHkgc3VycHJpc2lu
ZyB0aGF0IHRoZSBTTUJVUyBzdHVmZiB3YXMgd3JvbmcuDQo+DQo+IElzIHlvdSBzZXJpZXMgaW50
ZW5kZWQgdG8gYXBwbHkgb24gdG9wIG9mIEpvbmFzJ3M/IEknbSB0cnlpbmcgdG8gYXBwbHkgDQo+
IHlvdXJzIGFsb25lIChmb3IgdmFyaW91cyByZWFzb25zIGhhcHBlbnMgdG8gYmUgb24gdG9wIG9m
IA0KPiBuZXQtbmV4dC9tYWluKSBhbmQgSSdtIGdldHRpbmcgY29uZmxpY3RzLg0KDQpDb25mbGlj
dCBhcHBlYXJzIHRvIGJlIHdpdGggDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA2
MTUyMzUyNDguNTI5MDE5LTEtYWxleGd1bzEwMjNAZ21haWwuY29tLw0KDQo+DQo+IEF0IGEgY3Vy
c29yeSBnbGFuY2UgeW91ciBjaGFuZ2VzIGFsbCBsb29rIHNlbnNpYmxlIEknbGwgcmVwbHkgd2l0
aCBhIA0KPiBwcm9wZXIgci1ieSB3aGVuIEkndmUgYmVlbiBhYmxlIHRvIHRlc3RzIHRoZW0uDQo+
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU3ZlbiBFY2tlbG1hbm4gPHN2ZW5AbmFyZmF0aW9uLm9y
Zz4NCj4+IC0tLQ0KPj4gSGFyc2hhbCBHb2hlbCAoMik6DQo+PiDCoMKgwqDCoMKgwqAgaTJjOiBy
dGw5MzAwOiBGaXggbXVsdGktYnl0ZSBJMkMgd3JpdGUNCj4+IMKgwqDCoMKgwqDCoCBpMmM6IHJ0
bDkzMDA6IEltcGxlbWVudCBJMkMgYmxvY2sgcmVhZCBhbmQgd3JpdGUNCj4+DQo+PiBTdmVuIEVj
a2VsbWFubiAoMik6DQo+PiDCoMKgwqDCoMKgwqAgaTJjOiBydGw5MzAwOiBJbmNyZWFzZSB0aW1l
b3V0IGZvciB0cmFuc2ZlciBwb2xsaW5nDQo+PiDCoMKgwqDCoMKgwqAgaTJjOiBydGw5MzAwOiBB
ZGQgbWlzc2luZyBjb3VudCBieXRlIGZvciBTTUJ1cyBCbG9jayBXcml0ZQ0KPj4NCj4+IMKgIGRy
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtcnRsOTMwMC5jIHwgNDMgDQo+PiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4+IC0tLQ0KPj4gYmFzZS1jb21taXQ6IGI5ZGRhYTk1
ZmQyODNiY2U3MDQxNTUwZGRiYmU3ZTc2NGM0NzcxMTANCj4+IGNoYW5nZS1pZDogMjAyNTA4MDIt
aTJjLXJ0bDkzMDAtbXVsdGktYnl0ZS1lZGFhMWZiMDg3MmMNCj4+DQo+PiBCZXN0IHJlZ2FyZHMs

