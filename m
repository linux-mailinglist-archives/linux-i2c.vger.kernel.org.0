Return-Path: <linux-i2c+bounces-12409-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39483B332DE
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 23:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BEAB1B2537B
	for <lists+linux-i2c@lfdr.de>; Sun, 24 Aug 2025 21:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D8D423D7FD;
	Sun, 24 Aug 2025 21:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="nbC2ua+Y"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2540B239573
	for <linux-i2c@vger.kernel.org>; Sun, 24 Aug 2025 21:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756071639; cv=none; b=dPnNjD3afb6HfX2agJi5xsclsPfSil5TrKvLXm0t5LeMnAyLfxIDC25T4p03/BMmt/9L1dJO7cphvAR5sXsOmZirKUnK8a/xzek+gSYmB5WLq9ueSq/gnINVhjZZjfGC6+JymzJsghJpLqKpF/pZM9uczETLcaEUjrlb082DYn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756071639; c=relaxed/simple;
	bh=VYokqYLe67430zP26uzMPr06zuvJCU9bx4xVCBvOAus=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nKxD8dceyacJ7OvSK9r3EK6mI1r1ZTwEt3qruWinA5iCpzi/jtfmdvQ6kbpOnJD0A+A8HQkF37/18WrZIkGl9hXwZNw6BevcgTkTP7Bo7mZjZ7OuCbLWlHq3lVblWUnP8bCibR1Miz3U2YMTHcHoQ2qRaSQ/dpkzo8Lgy8NTQIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=nbC2ua+Y; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 25CA82C02D0;
	Mon, 25 Aug 2025 09:31:20 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1756071080;
	bh=VYokqYLe67430zP26uzMPr06zuvJCU9bx4xVCBvOAus=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=nbC2ua+YkeqznO1rTTxxsJSWRvCmIV/Qi9fTHScYMhM4P8KnMhgIPjHg4cyB2jIVw
	 ovkOW73ArkiWjSTvg2vpVGO/j9ziCR7o4D/E7J5eLNshTOk2h1pRYbXx2mgQ9QWW1/
	 q2WVWmw/RyZv0PxzKN1QQh7ABRiEKW4JzocglDadSmtHen/Tix4pTHVsCnG/da5oOE
	 0r72o5nAvNP5iaJCcWAJ4VrbrzPGpj6t3ZBzWRYH8Wvwjm26Si9kn2YesKoxFhse1N
	 2M/uDYToVS1hi0l5UGocg5/4kJjRQVsn2nBTGk5ymjf9H1Io9gklxea3Z/F1qUqVZ5
	 5WylRZJDu8UYA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68ab84a80001>; Mon, 25 Aug 2025 09:31:20 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 25 Aug 2025 09:31:19 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Mon, 25 Aug 2025 09:31:19 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Jonas Jelonek <jelonek.jonas@gmail.com>, Andi Shyti
	<andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Markus Stockhausen
	<markus.stockhausen@gmx.de>, Sven Eckelmann <sven@narfation.org>, "Harshal
 Gohel" <hg@simonwunderlich.de>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v6 00/12] i2c: fix, rework and extend RTL9300 I2C driver
Thread-Topic: [PATCH v6 00/12] i2c: fix, rework and extend RTL9300 I2C driver
Thread-Index: AQHcFOsSz4qV8sz8VkayQ85c3bJjJLRxiduA
Date: Sun, 24 Aug 2025 21:31:19 +0000
Message-ID: <b61a8521-c5d2-4b44-800a-c93833ff8f1a@alliedtelesis.co.nz>
References: <20250824113348.263475-1-jelonek.jonas@gmail.com>
In-Reply-To: <20250824113348.263475-1-jelonek.jonas@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <DAAD7065DEC1B04E833473C7190E6A51@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Yo+sRJYX c=1 sm=1 tr=0 ts=68ab84a8 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=DSnrLwHJ4Z4XNXYrIEwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgSm9uYXMsDQoNCk9uIDI0LzA4LzIwMjUgMjM6MzMsIEpvbmFzIEplbG9uZWsgd3JvdGU6DQo+
IFRoaXMgcGF0Y2ggc2VyaWVzIGZvciB0aGUgUlRMOTMwMCBJMkMgZHJpdmVyOg0KPiAgICAgIC0g
Zml4ZXMgaXNzdWVzLCBvbmUgb2YgdGhlbSBpbiBzb21lIGNhc2VzIGNhdXNpbmcgZGF0YSBjb3Jy
dXB0aW9uDQo+ICAgICAgLSByZXdvcmtzIHNpZ25pZmljYW50IHBhcnRzIG9mIHRoZSBjdXJyZW50
IGltcGxlbWVudGF0aW9uDQo+ICAgICAgLSBhZGQgc3VwcG9ydCBmb3IgdGhlIChxdWl0ZSBzaW1p
bGFyKSBSVEw5MzEwIHNlcmllcw0KPg0KPiBHb2FsIG9mIHRoaXMgaXMgdG8gZml4IGNyaXRpY2Fs
IGlzc3VlcywgaW1wcm92ZSBvdmVyYWxsIGNvZGUgcXVhbGl0eSBhbmQNCj4gc2ltcGxpZnkgbWFp
bnRhaW5hbmNlIGFuZCBmdXJ0aGVyIGV4dGVuc2lvbiBvZiB0aGUgZHJpdmVyLiBNb3Jlb3Zlciwg
aXQNCj4gc2hvdWxkIGJlIGJyb3VnaHQgb24gcGFyIGZlYXR1cmUtd2lzZSB3aXRoIE9wZW5XcnQn
cyBkb3duc3RyZWFtIGRyaXZlcg0KPiB0byBiZSBhYmxlIHRvIGRyb3AgdGhlIGRvd25zdHJlYW0g
dmVyc2lvbi4NCj4NCj4gVGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgYWRkcmVzcyBidWdzIGluIHRo
ZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLCBvbg0KPiBvZiB0aGVtIGJlaW5nIGNyaXRpY2FsIGFu
ZCBjYXVzaW5nIGRhdGEgY29ycnVwdGlvbiB1bmRlciBjZXJ0YWluDQo+IGNpcmN1bXN0YW5jZXMu
IEFsdGhvdWdoIHRoZSBoYXJkd2FyZSBkb2Vzbid0IHN1cHBvcnQgU01CdXMgUXVpY2sgV3JpdGUs
DQo+IHRoZSBkcml2ZXIgY2xhaW1zIHRvIHN1cHBvcnQgaXQgd2l0aCBhIGJyb2tlbiBpbXBsZW1l
bnRhdGlvbi4gVGhpcw0KPiBjYXVzZXMgdG8gZXhlY3V0ZSBhIDE2LWJ5dGUgV3JpdGUgaW5zdGVh
ZCBvZiBhIFF1aWNrIFdyaXRlLCBlLmcuIGNhdXNpbmcNCj4gY29ycnVwdGlvbiBvbiBub3Qtd3Jp
dGUtcHJvdGVjdGVkIFNGUCBFRVBST01zIGFuZCBzb2Z0LWJyaWNraW5nIHRoZW0uDQo+IFRoZXNl
IHRocmVlIHBhdGNoZXMgYXJlIGFsc28gc2VudCB0byAnc3RhYmxlJyBiZWNhdXNlIHRoZXkgZml4
IGNyaXRpY2FsDQo+IGlzc3Vlcy4NCj4NCj4gU3Vic2VxdWVudCBwYXRjaGVzIGludHJvZHVjZSB2
YXJpb3VzIHNtYWxsZXIgYW5kIGJpZ2dlciBlbmhhbmNlbWVudHMuDQo+IFRoZXNlIGluY2x1ZGU6
DQo+ICAgICAgLSB1c2UgcmVnbWFwX2ZpZWxkICsgaXRzIEFQSSBpbnN0ZWFkIG9mIG1hY3JvcyAr
IEdFTk1BU0sgKyBzaGlmdHMNCj4gICAgICAtIHJlZmFjdG9yIHhmZXIgaGFuZGxpbmcNCj4gICAg
ICAtIHZhcmlhYmxlIHJlbmFtaW5nIHRvIGF2b2lkIGNvbmZ1c2lvbg0KPiAgICAgIC0gbW92ZSBz
b21lIHJlZ2lzdGVyIG9wZXJhdGlvbnMsIGNhbGxpbmcgdGhlbSBzb21ld2hlcmUgZWxzZSBhbmQN
Cj4gICAgICAgIGxlc3MgZnJlcXVlbnRseQ0KPiAgICAgIC0gdXNlIGd1YXJkZWQgbXV0ZXggaW5z
dGVhZCBvZiBleHBsaWNpdCBtdXRleF9sb2NrL191bmxvY2sgdG8NCj4gICAgICAgIHNpbXBsaWZ5
IGNvbnRyb2wgZmxvdw0KPg0KPiBGaW5hbGx5LCB0aGUgbGFzdCB0d28gcGF0Y2hlcyBhZGQgc3Vw
cG9ydCBmb3IgUlRMOTMxMCAobWFuZ28pIHNlcmllcyB0bw0KPiB0aGUgZHJpdmVyIGFuZCBhZGp1
c3QgdGhlIGR0LWJpbmRpbmdzIGFjY29yZGluZ2x5Lg0KPg0KPiBTaW1wbGUgb3BlcmF0aW9ucyBo
YXZlIGJlZW4gdGVzdGVkIHN1Y2Nlc3NmdWxseSBvbjoNCj4gICAgICAtIFp5eGVsIFhHUzEyMTAt
MTIgKFJUTDkzMDJCKQ0KPiAgICAgIC0gVFAtTGluayBUTC1TVDEwMDhGIHYyLjAgKFJUTDkzMDMp
DQo+ICAgICAgLSBOZXRnZWFyIE1TNTEwVFhNIChSVEw5MzEzKQ0KPg0KPiB3aXRoIEJ5dGUtUmVh
ZCwgV29yZC1SZWFkIGFuZCBJMkMtQmxvY2stUmVhZC4gT3RoZXIgb3BlcmF0aW9ucyBuZWVkDQo+
IHRlc3RpbmcgZnJvbSBwZW9wbGUgd2l0aCBkZXZpY2VzIGF2YWlsYWJsZS4NCj4NCj4gQ29tcGls
ZS10ZXN0ZWQgd2l0aCBMaW51eCwgcnVuLXRlc3RlZCBhcyBiYWNrcG9ydCBpbiBPcGVuV3J0IG9u
IHRoZQ0KPiBhZm9yZW1lbnRpb25lZCBkZXZpY2VzLg0KDQpGb3IgdGhlIHNlcmllcw0KDQpSZXZp
ZXdlZC1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56
Pg0KVGVzdGVkLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMu
Y28ubno+ICMgT24gDQpSVEw5MzAyQyBiYXNlZCBib2FyZA0KDQo+IC0tDQo+IENoYW5nZWxvZw0K
Pg0KPiB2NjogLSBwYXRjaCAnaTJjOiBydGw5MzAwOiBjaGVjayBpZiB4ZmVyIGxlbmd0aCBpcyB2
YWxpZCcNCj4gICAgICAgICAgLSByZW5hbWVkIHRvICdlbnN1cmUgZGF0YSBsZW5ndGggaXMgd2l0
aGluIHN1cHBvcnRlZCByYW5nZScNCj4gICAgICAgICAgLSBhZGRlZCBJMkMgcXVpcmsgZm9yIHpl
cm8gbGVuZ3RoIGFzIHN1Z2dlc3RlZCBieSBXb2xmcmFtIFNhbmcNCj4gICAgICAtIHJlb3JkZXJl
ZCBwYXRjaGVzIHRvIGhhdmUgYmFja3BvcnQtd29ydGh5IGZpeGVzIGZpcnN0IGFuZA0KPiAgICAg
ICAgZW5oYW5jZW1lbnRzL290aGVycyBhZnRlcg0KPiAgICAgICAgICAtIHBhdGNoZXMgJ2ZpeCBj
aGFubmVsIG51bWJlciBib3VuZCBjaGVjaycsICdjaGVjayBpZiB4ZmVyDQo+ICAgICAgICAgICAg
bGVuZ3RoIGlzIHZhbGlkJyBhbmQgJ3JlbW92ZSBTTUJ1cyBRdWljayBvcGVyYXRpb24gc3VwcG9y
dCcNCj4gICAgICAgICAgICB3ZXJlIG1vdmVkIGJlZm9yZSBhbGwgb3RoZXJzDQo+IAktIGFkZGVk
IENDOiBzdGFibGUgdG8gZmlyc3QgdGhyZWUgcGF0Y2hlcw0KPiAgICAgIC0gZml4ZWQgY29tbWl0
IG1lc3NhZ2Ugb2YgJ2R0LWJpbmRpbmdzOiBpMmM6IHJlYWx0ZWsscnRsOTMwMS1pMmM6DQo+ICAg
ICAgICBleHRlbmQgZm9yIFJUTDkzMTAgc3VwcG9ydCcNCj4gICAgICAtIGFkZGVkIGEgcGF0Y2gg
dG8gdXNlIGd1YXJkKG11dGV4KSBpbnN0ZWFkIG9mIGV4cGxpY2l0IGxvY2svdW5sb2NrDQo+ICAg
ICAgICBhcyBzdWdnZXN0ZWQgYnkgTWFya3VzIEVsZnJpbmcNCj4gICAgICAtIGFkZGVkIFJldmll
d2VkLWJ5OiBSb2IgSGVycmluZyAuLi4gdG8gZHQtYmluZGluZ3MgcGF0Y2hlcw0KPiAgICAgIC0g
YWRkZWQgVGVzdGVkLWJ5OiBTdmVuIEVja2VsbWFubiAuLi4gdG8gYWxsIHBhdGNoZXMgKGV4Y2Vw
dCB0aGUNCj4gICAgICAgIG5ldyBwYXRjaCBpbiB0aGlzIHZlcnNpb24pDQo+DQo+IHY1OiAtIGFk
ZGVkIG1vcmUgcGF0Y2hlcyB0byBmaXggZnVydGhlciBpc3N1ZXMvZG8gZnVydGhlciBjbGVhbnVw
DQo+ICAgICAgICAgIC0gcmVtb3ZlIFNNQnVzIFF1aWNrIHN1cHBvcnQgKG5vdCBzdXBwb3J0ZWQg
YnkgaGFyZHdhcmUpDQo+ICAgICAgICAgIC0gbW92ZSBzZXR0aW5nIFNDTCBmcmVxdWVuY3kgdG8g
Y29uZmlnX2lvDQo+ICAgICAgICAgIC0gb25seSBzZXQgcmVhZCBtZXNzYWdlIGZvcm1hdCAoUkRf
TU9ERSkgb25jZSBvbiBwcm9iaW5nDQo+ICAgICAgICAgIC0gYWRkIGNoZWNrIHRvIGF2b2lkIGxl
biA9IDAgYmVpbmcgYWxsb3dlZCBhcyBsZW5ndGgNCj4gICAgICAtIGFkanVzdGVkIGNvdmVyIGxl
dHRlcg0KPg0KPiB2NDogLSBmaXhlZCBhbiBpbmNvcnJlY3QgY2hlY2sgZm9yIG51bWJlciBvZiBj
aGFubmVscyB3aGljaCB3YXMgYWxyZWFkeQ0KPiAgICAgICAgcHJlc2VudCBpbiBvcmlnaW5hbCBj
b2RlDQo+DQo+IHYzOiAtIG5hcnJvd2VkIHZlbmRvciBwcm9wZXJ0eSBwZXIgdmFyaWFudCB0byBi
ZSByZXF1aXJlZCBvbmx5DQo+ICAgICAgICBmb3IgUlRMOTMxMA0KPiAgICAgIC0gbmFycm93ZWQg
dXNhYmxlIGNoaWxkLW5vZGUgaTJjIGFkZHJlc3NlcyBwZXIgdmFyaWFudA0KPiAgICAgIC0gbm8g
Y2hhbmdlcyB0byBkcml2ZXIgcGF0Y2hlcw0KPg0KPiB2MjogLSBQYXRjaCAxOg0KPiAgICAgICAg
ICAtIGFkanVzdGVkIGNvbW1pdCBtZXNzYWdlDQo+ICAgICAgICAgIC0gcmV0YWluZWQgVGVzdGVk
LUJ5IGFuZCBSZXZpZXdlZC1CeSBmcm9tIENocmlzIFBhY2toYW0NCj4gICAgICAtIFBhdGNoIDI6
DQo+ICAgICAgICAgIC0gc2ltcGxpZmllZCBjaGVjayBhcyBzdWdnZXN0ZWQgYnkgTWFya3VzIFN0
b2NraGF1c2VuDQo+ICAgICAgICAgIC0gZml4ZWQgY29tbWl0IG1lc3NhZ2UNCj4gICAgICAtIFBh
dGNoIDMgKGFsbCByZXF1ZXN0ZWQgYnkgS3J6eXN6dG9mKToNCj4gICAgICAgICAgLSB1c2UgdmVu
ZG9yIHByb3BlcnR5IGluc3RlYWQgb2YgZ2VuZXJpYw0KPiAgICAgICAgICAtIGFkZCBmcm9udCBj
b21wYXRpYmxlcyB0byBtYWtlIGJpbmRpbmcgY29tcGxldGUNCj4gICAgICAgICAgLSBmaXggY29t
bWl0IG1lc3NhZ2UNCj4gICAgICAtIHJlb3JkZXJlZCBwYXRjaGVzLCBkdC1iaW5kaW5ncyBwYXRj
aCBub3cgY29tZXMgYmVmb3JlIGl0cyAndXNlcicNCj4gICAgICAtIHByb3Blcmx5IGFkZCBkZXZp
Y2UtdHJlZSBsaXN0IGFuZCByZWxldmFudCBtYWludGFpbmVycyB0byBUby9DYw0KPg0KPiAtLS0N
Cj4gSm9uYXMgSmVsb25layAoMTIpOg0KPiAgICBpMmM6IHJ0bDkzMDA6IGZpeCBjaGFubmVsIG51
bWJlciBib3VuZCBjaGVjaw0KPiAgICBpMmM6IHJ0bDkzMDA6IGVuc3VyZSBkYXRhIGxlbmd0aCBp
cyB3aXRoaW4gc3VwcG9ydGVkIHJhbmdlDQo+ICAgIGkyYzogcnRsOTMwMDogcmVtb3ZlIGJyb2tl
biBTTUJ1cyBRdWljayBvcGVyYXRpb24gc3VwcG9ydA0KPiAgICBpMmM6IHJ0bDkzMDA6IHVzZSBy
ZWdtYXAgZmllbGRzIGFuZCBBUEkgZm9yIHJlZ2lzdGVycw0KPiAgICBkdC1iaW5kaW5nczogaTJj
OiByZWFsdGVrLHJ0bDkzMDEtaTJjOiBmaXggd29yZGluZyBhbmQgdHlwb3MNCj4gICAgaTJjOiBy
dGw5MzAwOiByZW5hbWUgaW50ZXJuYWwgc2RhX3BpbiB0byBzZGFfbnVtDQo+ICAgIGkyYzogcnRs
OTMwMDogbW92ZSBzZXR0aW5nIFNDTCBmcmVxdWVuY3kgdG8gY29uZmlnX2lvDQo+ICAgIGkyYzog
cnRsOTMwMDogZG8gbm90IHNldCByZWFkIG1vZGUgb24gZXZlcnkgdHJhbnNmZXINCj4gICAgaTJj
OiBydGw5MzAwOiBzZXBhcmF0ZSB4ZmVyIGNvbmZpZ3VyYXRpb24gYW5kIGV4ZWN1dGlvbg0KPiAg
ICBpMmM6IHJ0bDkzMDA6IHVzZSBzY29wZWQgZ3VhcmQgaW5zdGVhZCBvZiBleHBsaWNpdCBsb2Nr
L3VubG9jaw0KPiAgICBkdC1iaW5kaW5nczogaTJjOiByZWFsdGVrLHJ0bDkzMDEtaTJjOiBleHRl
bmQgZm9yIFJUTDkzMTAgc3VwcG9ydA0KPiAgICBpMmM6IHJ0bDkzMDA6IGFkZCBzdXBwb3J0IGZv
ciBSVEw5MzEwIEkyQyBjb250cm9sbGVyDQo+DQo+ICAgLi4uL2JpbmRpbmdzL2kyYy9yZWFsdGVr
LHJ0bDkzMDEtaTJjLnlhbWwgICAgIHwgIDQ1ICstDQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1ydGw5MzAwLmMgICAgICAgICAgICAgIHwgNDg4ICsrKysrKysrKystLS0tLS0tLQ0KPiAgIDIg
ZmlsZXMgY2hhbmdlZCwgMzI1IGluc2VydGlvbnMoKyksIDIwOCBkZWxldGlvbnMoLSkNCj4NCj4N
Cj4gYmFzZS1jb21taXQ6IDU3Nzc0NDMwODY0YjcyMTA4MmI5YmFmZDE3ZmM4MzlmMzEyNTFjN2I=

