Return-Path: <linux-i2c+bounces-12136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A1EB196AF
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 00:18:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C6FB3A4A98
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Aug 2025 22:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F651FCF7C;
	Sun,  3 Aug 2025 22:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="kdeFDcGP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7166B1DED57
	for <linux-i2c@vger.kernel.org>; Sun,  3 Aug 2025 22:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754259504; cv=none; b=OyNtaaf3qbDyU8arwQwWwzJY8hMVfRO2V5YVyNxvuFjxOL9Ia9ES0TaS0YJTeCD2amX05ZIhM0CYh4F0ksq4aeP+uW8Vh16eNJY0IApAhAeosczI7fI01klamGDtPURJ9A5HI6Zmqbfwxpbl4zF6KUM1orxtXaPUVzxR/bWehNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754259504; c=relaxed/simple;
	bh=6v3dSrUtxjSI6fSxHvul9rk5ElTh3XaGpO430BjOk6s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EuakJBzSyuItyef6e4EhRMol9tmRYUAwCSlMMiY5mDbdL0/5Ixl1o987Cy/fBQoA2fVrCyhYEDiTFMfOKRWk1vLsHyG5xERK/KFEyoteS53iy5PPqiPtTGqTnNm8mQfiTMT1PnJmhozOohtI8BhpHyDUYZNCwrEkWVBGnF7Y/zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=kdeFDcGP; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5C7EA2C0132;
	Mon,  4 Aug 2025 10:12:49 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1754259169;
	bh=6v3dSrUtxjSI6fSxHvul9rk5ElTh3XaGpO430BjOk6s=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=kdeFDcGPqFal3YMmbfbl9sDYkk8KJYUjjpikYav4ERVgL60ftQEwOjg+LYELfrOmX
	 0jtnjZkPLL8bnJRy9vySkKDs0KuOPVMaZeuXjfywWKxqOo6dv4yZbof+slV+8kVbR8
	 TuU/PLMKyRhkN41DBGs9XYCg2OPbRzjk5GVEs2g6BLM3D4eQAB89i6TOJfkQxtkRRt
	 N/N6w3f/FolGGZxJhct2ddM77viMUOVTPWyRxIM+I7rPtl+ja/Y0E4jztS6sTP6E2P
	 ogDcB/bD/TYRE4m8n2My+PBrfP4U2qrjGLLb2ysecDuYIEw2TjPlURk5VBuLcxbApq
	 RxW13qxz/kjag==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B688fdee10002>; Mon, 04 Aug 2025 10:12:49 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 4 Aug 2025 10:12:49 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Mon, 4 Aug 2025 10:12:49 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Sven Eckelmann <sven@narfation.org>, Andi Shyti <andi.shyti@kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Jelonek
	<jelonek.jonas@gmail.com>, Harshal Gohel <hg@simonwunderlich.de>, "Simon
 Wunderlich" <sw@simonwunderlich.de>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: Re: [PATCH 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Thread-Topic: [PATCH 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Thread-Index: AQHcA5jAuVD1sLz1K0OZF7KtVWyQTbRQtyEA
Date: Sun, 3 Aug 2025 22:12:49 +0000
Message-ID: <cfa3e1c5-c6fc-4bab-87c0-58e857eea2ad@alliedtelesis.co.nz>
References: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
In-Reply-To: <20250802-i2c-rtl9300-multi-byte-v1-0-5f687e0098e2@narfation.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8A68D641B31824492ACEED1F6FB68C7@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dtt4CEg4 c=1 sm=1 tr=0 ts=688fdee1 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=svCTMBYCAAAA:8 a=Jhrh_n8qSaZ8Rdda_fAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=lbQUARmhvTNeubMQCRFT:22
X-SEG-SpamProfiler-Score: 0

SGkgU3ZlbiwNCg0KT24gMDIvMDgvMjAyNSAyMjozMSwgU3ZlbiBFY2tlbG1hbm4gd3JvdGU6DQo+
IER1cmluZyB0aGUgaW50ZWdyYXRpb24gb2YgdGhlIFJUTDgyMzkgUE9FIGNoaXAgKyBpdHMgZnJv
bnRlbmQgTUNVLCBpdCB3YXMNCj4gbm90aWNlZCB0aGF0IG11bHRpLWJ5dGUgb3BlcmF0aW9ucyB3
ZXJlIGJhc2ljYWxseSBicm9rZW4gaW4gdGhlIGN1cnJlbnQNCj4gZHJpdmVyLg0KPg0KPiBUZXN0
cyB1c2luZyBTTUJ1cyBCbG9jayBXcml0ZXMgc2hvd2VkIHRoYXQgdGhlIGRhdGEgKGFmdGVyIHRo
ZSBXciArIEFjaw0KPiBtYXJrZXIpIHdhcyBtaXhlZCB1cCBvbiB0aGUgd2lyZS4gQXQgZmlyc3Qg
Z2xhbmNlLCBpdCBsb29rZWQgbGlrZSBhbg0KPiBlbmRpYW5uZXNzIHByb2JsZW0uIEJ1dCBmb3Ig
dHJhbnNmZXJzIHdlcmUgdGhlIG51bWJlciBvZiBjb3VudCArIGRhdGEgYnl0ZXMNCj4gd2FzIG5v
dCBkaXZpc2libGUgYnkgNCwgdGhlIGxhc3QgYnl0ZXMgd2VyZSBub3QgbG9va2luZyBsaWtlIGFu
IGVuZGlhbm5lc3MNCj4gcHJvYmxlbSBiZWNhdXNlIHRoZXkgd2VyZSB3ZXJlIGluIHRoZSB3cm9u
ZyBvcmRlciBidXQgbm90IGZvciBleGFtcGxlIDAgLQ0KPiB3aGljaCB3b3VsZCBiZSB0aGUgY2Fz
ZSBmb3IgYW4gZW5kaWFubmVzcyBwcm9ibGVtIHdpdGggMzIgYml0IHJlZ2lzdGVycy4gQXQNCj4g
dGhlIGVuZCwgaXQgdHVybmVkIG91dCB0byBiZSBhIHRoZSB3YXkgaG93IGkyY193cml0ZSB0cmll
ZCB0byBhZGQgdGhlIGJ5dGVzDQo+IHRvIHRoZSBzZW5kIHJlZ2lzdGVycy4NCj4NCj4gRWFjaCAz
MiBiaXQgcmVnaXN0ZXIgd2FzIHVzZWQgc2ltaWxhciB0byBhIHNoaWZ0IHJlZ2lzdGVyIC0gc2hp
ZnRpbmcgdGhlDQo+IHZhcmlvdXMgYnl0ZXMgdXAgdGhlIHJlZ2lzdGVyIHdoaWxlIHRoZSBuZXh0
IG9uZSBpcyBhZGRlZCB0byB0aGUgbGVhc3QNCj4gc2lnbmlmaWNhbnQgYnl0ZS4gQnV0IHRoZSBJ
MkMgY29udHJvbGxlciBleHBlY3RzIHRoZSBmaXJzdCBieXRlIG9mIHRoZQ0KPiB0cmFubWlzc2lv
biBpbiB0aGUgbGVhc3Qgc2lnbmlmaWNhbnQgYnl0ZSBvZiB0aGUgZmlyc3QgcmVnaXN0ZXIuIEFu
ZCB0aGUNCj4gbGFzdCBieXRlIChhc3N1bWluZyBpdCBpcyBhIDE2IGJ5dGUgdHJhbnNmZXIpIGlu
IHRoZSBtb3N0IHNpZ25pZmljYW50IGJ5dGUNCj4gb2YgdGhlIGZvdXJ0aCByZWdpc3Rlci4NCj4N
Cj4gV2hpbGUgZG9pbmcgdGhlc2UgdGVzdHMsIGl0IHdhcyBhbHNvIG9ic2VydmVkIHRoYXQgdGhl
IGNvdW50IGJ5dGUgd2FzDQo+IG1pc3NpbmcgZnJvbSB0aGUgU01CdXMgQmxvY2sgV3JpdGVzLiBU
aGUgZHJpdmVyIGp1c3QgcmVtb3ZlZCB0aGVtIGZyb20gdGhlDQo+IGRhdGEtPmJsb2NrIChmcm9t
IHRoZSBJMkMgc3Vic3lzdGVtKS4gQnV0IHRoZSBJMkMgY29udHJvbGxlciBET0VTIE5PVA0KPiBh
dXRvbWF0aWNhbGx5IGFkZCB0aGlzIGJ5dGUgLSBmb3IgZXhhbXBsZSBieSB1c2luZyB0aGUgY29u
ZmlndXJlZA0KPiB0cmFuc21pc3Npb24gbGVuZ3RoLg0KPg0KPiBUaGUgUlRMODIzOSBNQ1UgaXMg
bm90IGFjdHVhbGx5IGFuIFNNQnVzIGNvbXBsaWFudCBkZXZpY2UuIEluc3RlYWQsIGl0DQo+IGV4
cGVjdHMgSTJDIEJsb2NrIFJlYWRzICsgSTJDIEJsb2NrIFdyaXRlcy4gQnV0IGFjY29yZGluZyB0
byB0aGUgYWxyZWFkeQ0KPiBpZGVudGlmaWVkIGJ1Z3MgaW4gdGhlIGRyaXZlciwgaXQgd2FzIGNs
ZWFyIHRoYXQgdGhlIEkyQyBjb250cm9sbGVyIGNhbg0KPiBzaW1wbHkgYmUgbW9kaWZpZWQgdG8g
bm90IHNlbmQgdGhlIGNvdW50IGJ5dGUgZm9yIEkyQ19TTUJVU19JMkNfQkxPQ0tfREFUQS4NCj4g
VGhlIHJlY2VpdmUgcGFydCwganVzdCBuZWVkcyB0byB3cml0ZSB0aGUgY29udGVudCBvZiB0aGUg
cmVjZWl2ZSBidWZmZXIgdG8NCj4gdGhlIGNvcnJlY3QgcG9zaXRpb24gaW4gZGF0YS0+YmxvY2su
DQo+DQo+IFdoaWxlIHRoZSBvbi13aXJlIGZvcm13YXQgd2FzIG5vdyBjb3JyZWN0LCByZWFkcyB3
ZXJlIHN0aWxsIG5vdCBwb3NzaWJsZQ0KPiBhZ2FpbnN0IHRoZSBNQ1UgKGZvciB0aGUgUlRMODIz
OSBQT0UgY2hpcCkuIEl0IHdhcyBhbHdheXMgdGltaW5nIG91dA0KPiBiZWNhdXNlIHRoZSAybXMg
d2VyZSBub3QgZW5vdWdoIGZvciBzZW5kaW5nIHRoZSByZWFkIHJlcXVlc3QgYW5kIHRoZW4NCj4g
cmVjZWl2aW5nIHRoZSAxMiBieXRlIGFuc3dlci4NCj4NCj4gVGhlc2UgY2hhbmdlcyB3ZXJlIG9y
aWdpbmFsbHkgc3VibWl0dGVkIHRvIE9wZW5XcnQuIEJ1dCB0aGVyZSBhcmUgcGxhbnMgdG8NCj4g
bWlncmF0ZSBPcGVuV3J0IHRvIHRoZSB1cHN0cmVhbSBMaW51eCBkcml2ZXIuIEFzIHJlc3VsdCwg
dGhlIHB1bGwgcmVxdWVzdA0KPiB3YXMgc3RvcHBlZCBhbmQgdGhlIGNoYW5nZXMgd2VyZSByZWRv
bmUgYWdhaW5zdCB0aGlzIGRyaXZlci4NCg0KVGhhbmtzLiBJIHdhcyBvbmx5IHJlYWxseSBhYmxl
IHRvIHRlc3Qgd2l0aCBiYXNpYyBlZXByb20gbGlrZSBkZXZpY2VzIHNvIA0KaXQncyBub3QgZW50
aXJlbHkgc3VycHJpc2luZyB0aGF0IHRoZSBTTUJVUyBzdHVmZiB3YXMgd3JvbmcuDQoNCklzIHlv
dSBzZXJpZXMgaW50ZW5kZWQgdG8gYXBwbHkgb24gdG9wIG9mIEpvbmFzJ3M/IEknbSB0cnlpbmcg
dG8gYXBwbHkgDQp5b3VycyBhbG9uZSAoZm9yIHZhcmlvdXMgcmVhc29ucyBoYXBwZW5zIHRvIGJl
IG9uIHRvcCBvZiBuZXQtbmV4dC9tYWluKSANCmFuZCBJJ20gZ2V0dGluZyBjb25mbGljdHMuDQoN
CkF0IGEgY3Vyc29yeSBnbGFuY2UgeW91ciBjaGFuZ2VzIGFsbCBsb29rIHNlbnNpYmxlIEknbGwg
cmVwbHkgd2l0aCBhIA0KcHJvcGVyIHItYnkgd2hlbiBJJ3ZlIGJlZW4gYWJsZSB0byB0ZXN0cyB0
aGVtLg0KDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFN2ZW4gRWNrZWxtYW5uIDxzdmVuQG5hcmZhdGlv
bi5vcmc+DQo+IC0tLQ0KPiBIYXJzaGFsIEdvaGVsICgyKToNCj4gICAgICAgIGkyYzogcnRsOTMw
MDogRml4IG11bHRpLWJ5dGUgSTJDIHdyaXRlDQo+ICAgICAgICBpMmM6IHJ0bDkzMDA6IEltcGxl
bWVudCBJMkMgYmxvY2sgcmVhZCBhbmQgd3JpdGUNCj4NCj4gU3ZlbiBFY2tlbG1hbm4gKDIpOg0K
PiAgICAgICAgaTJjOiBydGw5MzAwOiBJbmNyZWFzZSB0aW1lb3V0IGZvciB0cmFuc2ZlciBwb2xs
aW5nDQo+ICAgICAgICBpMmM6IHJ0bDkzMDA6IEFkZCBtaXNzaW5nIGNvdW50IGJ5dGUgZm9yIFNN
QnVzIEJsb2NrIFdyaXRlDQo+DQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1ydGw5MzAwLmMg
fCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IC0tLQ0KPiBiYXNl
LWNvbW1pdDogYjlkZGFhOTVmZDI4M2JjZTcwNDE1NTBkZGJiZTdlNzY0YzQ3NzExMA0KPiBjaGFu
Z2UtaWQ6IDIwMjUwODAyLWkyYy1ydGw5MzAwLW11bHRpLWJ5dGUtZWRhYTFmYjA4NzJjDQo+DQo+
IEJlc3QgcmVnYXJkcyw=

