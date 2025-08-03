Return-Path: <linux-i2c+bounces-12137-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB3BB196BB
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 00:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D641918931E8
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 22:29:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7281FE444;
	Sun,  3 Aug 2025 22:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="eOH3ybel"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0E71DED57
	for <linux-i2c@vger.kernel.org>; Sun,  3 Aug 2025 22:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754260166; cv=none; b=DPJTqG4HGGXD5uFTdT6lAB9gzKiE57EjS85UTG84HaLdYa7+AYC+lkbpMJ2GgWLHnjugfKrWwN3djcOFtFtLDGIBvzriD/Cc9r8IUu641bOgSy94CT5/Yn/SpTiy6ZbYZju/g5GsCaNK5fH5zgcjHx3gmALgtGpxYiOGWrAmHH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754260166; c=relaxed/simple;
	bh=5f7+eih9/Mo4Bl9VGxxOn8cafHAFcYGauy1Py5W+sns=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rcqI3ccyqJCerOpOx5BdEuNz2/YEvYEFStT+AorKlYGuAwATucanrRkuF7BQikmkIGjEQ7uOiFQU9E74Btbw3/3Ih8p+/zVCsBIh4KWhekOEzuO4Si4hBUyPluPxiGiR3rhmIgKGxigpfxs1ULgevzCS8FJcA/bB+iqSGZD3Hls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=eOH3ybel; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id F17CE2C0132;
	Mon,  4 Aug 2025 10:29:21 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1754260161;
	bh=5f7+eih9/Mo4Bl9VGxxOn8cafHAFcYGauy1Py5W+sns=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=eOH3ybelMAVupkOGWVNPISkWsvT/6213eFdlTs14KD/o5WmyEsZg5YLtSOGFb0cWo
	 afrndDNwZiSR2THJdaUJ5Ip2sRrbCCYtRZPQQq9hmVytTCxrmRdMJ4INBFIJOgJbWp
	 rCX0Lfp8kWr03mAirJVdaI1EKI4R7mw9/0lm7/LWjL2NO7oSP3AQcQKSUPdSxniuHt
	 fYUJIK47LuM7gss+o2Rx4wfaMNYwC58uBOc+YvsjlsR4vrejERHEhlpoTndyvnq9PL
	 Xt64DvzhU0AvLrvjgPyEcu5qgWBrAcWPPuV6+OkjMJXVwvrQcR+k+R4s5a39vfb3Ge
	 pYp2cyEirsp2w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B688fe2c10001>; Mon, 04 Aug 2025 10:29:21 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 4 Aug 2025 10:29:21 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Mon, 4 Aug 2025 10:29:21 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Sven Eckelmann <sven@narfation.org>, Andi Shyti <andi.shyti@kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Jelonek
	<jelonek.jonas@gmail.com>, Harshal Gohel <hg@simonwunderlich.de>, "Simon
 Wunderlich" <sw@simonwunderlich.de>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: Re: [PATCH 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Thread-Topic: [PATCH 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Thread-Index: AQHcA5jAuVD1sLz1K0OZF7KtVWyQTbRQu8GA
Date: Sun, 3 Aug 2025 22:29:21 +0000
Message-ID: <7323356d-d71e-42f3-85d1-48a44c07bf0a@alliedtelesis.co.nz>
References: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
In-Reply-To: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0C48A83B9047E418971F82D69A8B3AF@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dtt4CEg4 c=1 sm=1 tr=0 ts=688fe2c1 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=svCTMBYCAAAA:8 a=Jhrh_n8qSaZ8Rdda_fAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ZbagjJmtVjimjlfyF5Mf:22 a=lbQUARmhvTNeubMQCRFT:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAwMi8wOC8yMDI1IDIyOjMxLCBTdmVuIEVja2VsbWFubiB3cm90ZToNCj4gRHVyaW5nIHRo
ZSBpbnRlZ3JhdGlvbiBvZiB0aGUgUlRMODIzOSBQT0UgY2hpcCArIGl0cyBmcm9udGVuZCBNQ1Us
IGl0IHdhcw0KPiBub3RpY2VkIHRoYXQgbXVsdGktYnl0ZSBvcGVyYXRpb25zIHdlcmUgYmFzaWNh
bGx5IGJyb2tlbiBpbiB0aGUgY3VycmVudA0KPiBkcml2ZXIuDQo+DQo+IFRlc3RzIHVzaW5nIFNN
QnVzIEJsb2NrIFdyaXRlcyBzaG93ZWQgdGhhdCB0aGUgZGF0YSAoYWZ0ZXIgdGhlIFdyICsgQWNr
DQo+IG1hcmtlcikgd2FzIG1peGVkIHVwIG9uIHRoZSB3aXJlLiBBdCBmaXJzdCBnbGFuY2UsIGl0
IGxvb2tlZCBsaWtlIGFuDQo+IGVuZGlhbm5lc3MgcHJvYmxlbS4gQnV0IGZvciB0cmFuc2ZlcnMg
d2VyZSB0aGUgbnVtYmVyIG9mIGNvdW50ICsgZGF0YSBieXRlcw0KPiB3YXMgbm90IGRpdmlzaWJs
ZSBieSA0LCB0aGUgbGFzdCBieXRlcyB3ZXJlIG5vdCBsb29raW5nIGxpa2UgYW4gZW5kaWFubmVz
cw0KPiBwcm9ibGVtIGJlY2F1c2UgdGhleSB3ZXJlIHdlcmUgaW4gdGhlIHdyb25nIG9yZGVyIGJ1
dCBub3QgZm9yIGV4YW1wbGUgMCAtDQo+IHdoaWNoIHdvdWxkIGJlIHRoZSBjYXNlIGZvciBhbiBl
bmRpYW5uZXNzIHByb2JsZW0gd2l0aCAzMiBiaXQgcmVnaXN0ZXJzLiBBdA0KPiB0aGUgZW5kLCBp
dCB0dXJuZWQgb3V0IHRvIGJlIGEgdGhlIHdheSBob3cgaTJjX3dyaXRlIHRyaWVkIHRvIGFkZCB0
aGUgYnl0ZXMNCj4gdG8gdGhlIHNlbmQgcmVnaXN0ZXJzLg0KPg0KPiBFYWNoIDMyIGJpdCByZWdp
c3RlciB3YXMgdXNlZCBzaW1pbGFyIHRvIGEgc2hpZnQgcmVnaXN0ZXIgLSBzaGlmdGluZyB0aGUN
Cj4gdmFyaW91cyBieXRlcyB1cCB0aGUgcmVnaXN0ZXIgd2hpbGUgdGhlIG5leHQgb25lIGlzIGFk
ZGVkIHRvIHRoZSBsZWFzdA0KPiBzaWduaWZpY2FudCBieXRlLiBCdXQgdGhlIEkyQyBjb250cm9s
bGVyIGV4cGVjdHMgdGhlIGZpcnN0IGJ5dGUgb2YgdGhlDQo+IHRyYW5taXNzaW9uIGluIHRoZSBs
ZWFzdCBzaWduaWZpY2FudCBieXRlIG9mIHRoZSBmaXJzdCByZWdpc3Rlci4gQW5kIHRoZQ0KPiBs
YXN0IGJ5dGUgKGFzc3VtaW5nIGl0IGlzIGEgMTYgYnl0ZSB0cmFuc2ZlcikgaW4gdGhlIG1vc3Qg
c2lnbmlmaWNhbnQgYnl0ZQ0KPiBvZiB0aGUgZm91cnRoIHJlZ2lzdGVyLg0KPg0KPiBXaGlsZSBk
b2luZyB0aGVzZSB0ZXN0cywgaXQgd2FzIGFsc28gb2JzZXJ2ZWQgdGhhdCB0aGUgY291bnQgYnl0
ZSB3YXMNCj4gbWlzc2luZyBmcm9tIHRoZSBTTUJ1cyBCbG9jayBXcml0ZXMuIFRoZSBkcml2ZXIg
anVzdCByZW1vdmVkIHRoZW0gZnJvbSB0aGUNCj4gZGF0YS0+YmxvY2sgKGZyb20gdGhlIEkyQyBz
dWJzeXN0ZW0pLiBCdXQgdGhlIEkyQyBjb250cm9sbGVyIERPRVMgTk9UDQo+IGF1dG9tYXRpY2Fs
bHkgYWRkIHRoaXMgYnl0ZSAtIGZvciBleGFtcGxlIGJ5IHVzaW5nIHRoZSBjb25maWd1cmVkDQo+
IHRyYW5zbWlzc2lvbiBsZW5ndGguDQo+DQo+IFRoZSBSVEw4MjM5IE1DVSBpcyBub3QgYWN0dWFs
bHkgYW4gU01CdXMgY29tcGxpYW50IGRldmljZS4gSW5zdGVhZCwgaXQNCj4gZXhwZWN0cyBJMkMg
QmxvY2sgUmVhZHMgKyBJMkMgQmxvY2sgV3JpdGVzLiBCdXQgYWNjb3JkaW5nIHRvIHRoZSBhbHJl
YWR5DQo+IGlkZW50aWZpZWQgYnVncyBpbiB0aGUgZHJpdmVyLCBpdCB3YXMgY2xlYXIgdGhhdCB0
aGUgSTJDIGNvbnRyb2xsZXIgY2FuDQo+IHNpbXBseSBiZSBtb2RpZmllZCB0byBub3Qgc2VuZCB0
aGUgY291bnQgYnl0ZSBmb3IgSTJDX1NNQlVTX0kyQ19CTE9DS19EQVRBLg0KPiBUaGUgcmVjZWl2
ZSBwYXJ0LCBqdXN0IG5lZWRzIHRvIHdyaXRlIHRoZSBjb250ZW50IG9mIHRoZSByZWNlaXZlIGJ1
ZmZlciB0bw0KPiB0aGUgY29ycmVjdCBwb3NpdGlvbiBpbiBkYXRhLT5ibG9jay4NCj4NCj4gV2hp
bGUgdGhlIG9uLXdpcmUgZm9ybXdhdCB3YXMgbm93IGNvcnJlY3QsIHJlYWRzIHdlcmUgc3RpbGwg
bm90IHBvc3NpYmxlDQo+IGFnYWluc3QgdGhlIE1DVSAoZm9yIHRoZSBSVEw4MjM5IFBPRSBjaGlw
KS4gSXQgd2FzIGFsd2F5cyB0aW1pbmcgb3V0DQo+IGJlY2F1c2UgdGhlIDJtcyB3ZXJlIG5vdCBl
bm91Z2ggZm9yIHNlbmRpbmcgdGhlIHJlYWQgcmVxdWVzdCBhbmQgdGhlbg0KPiByZWNlaXZpbmcg
dGhlIDEyIGJ5dGUgYW5zd2VyLg0KPg0KPiBUaGVzZSBjaGFuZ2VzIHdlcmUgb3JpZ2luYWxseSBz
dWJtaXR0ZWQgdG8gT3BlbldydC4gQnV0IHRoZXJlIGFyZSBwbGFucyB0bw0KPiBtaWdyYXRlIE9w
ZW5XcnQgdG8gdGhlIHVwc3RyZWFtIExpbnV4IGRyaXZlci4gQXMgcmVzdWx0LCB0aGUgcHVsbCBy
ZXF1ZXN0DQo+IHdhcyBzdG9wcGVkIGFuZCB0aGUgY2hhbmdlcyB3ZXJlIHJlZG9uZSBhZ2FpbnN0
IHRoaXMgZHJpdmVyLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBTdmVuIEVja2VsbWFubiA8c3ZlbkBu
YXJmYXRpb24ub3JnPg0KDQpGb3IgdGhlIHNlcmllcw0KDQpSZXZpZXdlZC1ieTogQ2hyaXMgUGFj
a2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KVGVzdGVkLWJ5OiBDaHJp
cyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQoNCk5vdGUgdGhh
dCBJJ3ZlIG9ubHkgZ290IHRoZSBzYW1lIHNpbXBsZSBlZXByb20gZGV2aWNlcyB0aGF0IEkgZGlk
IHRoZSANCmluaXRpYWwgZGV2ZWxvcG1lbnQgb24gc28gSSBkb24ndCB0aGluayBJJ3ZlIHJlYWxs
eSBleGVyY2lzZWQgdGhlIGJsb2NrIA0KZGF0YSBwYXRocyBidXQgSSBjYW4gc2F5IHRoZSBjaGFu
Z2VzIGRvbid0IGFwcGVhciB0byBoYXZlIHJlZ3Jlc3NlZCANCmFueXRoaW5nLg0KDQo+IC0tLQ0K
PiBIYXJzaGFsIEdvaGVsICgyKToNCj4gICAgICAgIGkyYzogcnRsOTMwMDogRml4IG11bHRpLWJ5
dGUgSTJDIHdyaXRlDQo+ICAgICAgICBpMmM6IHJ0bDkzMDA6IEltcGxlbWVudCBJMkMgYmxvY2sg
cmVhZCBhbmQgd3JpdGUNCj4NCj4gU3ZlbiBFY2tlbG1hbm4gKDIpOg0KPiAgICAgICAgaTJjOiBy
dGw5MzAwOiBJbmNyZWFzZSB0aW1lb3V0IGZvciB0cmFuc2ZlciBwb2xsaW5nDQo+ICAgICAgICBp
MmM6IHJ0bDkzMDA6IEFkZCBtaXNzaW5nIGNvdW50IGJ5dGUgZm9yIFNNQnVzIEJsb2NrIFdyaXRl
DQo+DQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1ydGw5MzAwLmMgfCA0MyArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDM2IGlu
c2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IC0tLQ0KPiBiYXNlLWNvbW1pdDogYjlkZGFh
OTVmZDI4M2JjZTcwNDE1NTBkZGJiZTdlNzY0YzQ3NzExMA0KPiBjaGFuZ2UtaWQ6IDIwMjUwODAy
LWkyYy1ydGw5MzAwLW11bHRpLWJ5dGUtZWRhYTFmYjA4NzJjDQo+DQo+IEJlc3QgcmVnYXJkcyw=

