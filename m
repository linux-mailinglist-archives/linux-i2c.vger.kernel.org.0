Return-Path: <linux-i2c+bounces-7434-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB699A1311
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 22:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C4AE51F225F7
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 20:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC6E2141D9;
	Wed, 16 Oct 2024 20:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="0QnX+y+f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB2D1C233A
	for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 20:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729108829; cv=none; b=AfxBaY4ma/A53/L9qUQcV3vRs0dcpa3zGo3sTJchXFSfi1Mz1JeEKRyrlQ1Cj5+v4yOoJ2PEMFNot2poXKMPd/rIwzYEAmbikXPEQM4W1WVa0VgfGqq3H5mNfogTDZt3RGYds4ropxhhdX5BNqb2fw/XGVpBe+J4SwO8AwMIvnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729108829; c=relaxed/simple;
	bh=Yy+427w6SA0Uyrx7chHSxLxb5fuPBo1r7UcsPY7j9hA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eF32JrceLv/BTVm1dr5kWYeq04e74tS9EkIVSeQ0gAPUsvvy2rxsRS4v1qTe1LByunRx1uP4t8s9dp0B3Nmy20Cph7rSaXw7qSWfDza6uanh627TLzwIvnnJcXPvLUs57JAt7Ul7YDrd6rz3/dRpdz8pegP0UUy6eY5qyvG+q2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=0QnX+y+f; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A8C642C0436;
	Thu, 17 Oct 2024 09:00:24 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729108824;
	bh=Yy+427w6SA0Uyrx7chHSxLxb5fuPBo1r7UcsPY7j9hA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=0QnX+y+fGDKmNo9ux8OzlVHONdJVDwcUslIkKAa5/OP1ULgkXbmOb7X1kBRAYc7Ec
	 42bW2ejPD3lovvci9vlUbfgYzAtxxiEd8poEnX0mbj+gpjub62wyP8Pp5yooPSTEHO
	 Tg5YGz83xeA1CNPnMSOTNcctV1nnEYUE/2nJxkpe6rd7WibVc2qNAnDPuXqCZF5myV
	 7Uzdg+6qK3f1O9lo/Z1Jr1sXF2jsmy9LEmR7lBD7dtN5+R2XJG4MG7z5TfVHqRUq7Z
	 WgwtPkRktF9Cj1ULv/rC5obIX8/cuBrYDBlPY/6xo5OMhIecKudngXRm5knCkWJkJS
	 botZYZ/BZlteA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67101b580001>; Thu, 17 Oct 2024 09:00:24 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Thu, 17 Oct 2024 09:00:24 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Thu, 17 Oct 2024 09:00:24 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Thu, 17 Oct 2024 09:00:24 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "andi.shyti@kernel.org" <andi.shyti@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "lee@kernel.org"
	<lee@kernel.org>, "sre@kernel.org" <sre@kernel.org>,
	"tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
	"markus.stockhausen@gmx.de" <markus.stockhausen@gmx.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v6 3/6] dt-bindings: mfd: Add Realtek RTL9300 switch
 peripherals
Thread-Topic: [PATCH v6 3/6] dt-bindings: mfd: Add Realtek RTL9300 switch
 peripherals
Thread-Index: AQHbH1XyRCVZAOY+h0G2xpDtEx4lKrKIFFgAgADcY4CAAAK9gA==
Date: Wed, 16 Oct 2024 20:00:23 +0000
Message-ID: <c5f93d92-6bba-41f7-98e0-1e21d61d5941@alliedtelesis.co.nz>
References: <20241015225948.3971924-1-chris.packham@alliedtelesis.co.nz>
 <20241015225948.3971924-4-chris.packham@alliedtelesis.co.nz>
 <5o77wkohvujnfnm4xm73b65gpx5by7chhyhdbuw3dkpota53us@5x6jlcabjoes>
 <1c7abf59-588b-4679-8638-7e9985f133d1@alliedtelesis.co.nz>
In-Reply-To: <1c7abf59-588b-4679-8638-7e9985f133d1@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <7582E3B684A33745A5E735E3207E9CBE@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67101b58 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=gEfo2CItAAAA:8 a=TXPRNiiwDGDrT-YAXYQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAxNy8xMC8yNCAwODo1MCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4NCj4gT24gMTYvMTAv
MjQgMTk6NDEsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+PiBPbiBXZWQsIE9jdCAxNiwg
MjAyNCBhdCAxMTo1OTo0NUFNICsxMzAwLCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4+ICtwcm9w
ZXJ0aWVzOg0KPj4+ICvCoCBjb21wYXRpYmxlOg0KPj4+ICvCoMKgwqAgb25lT2Y6DQo+Pj4gK8Kg
wqDCoMKgwqAgLSBpdGVtczoNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZW51bToNCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSByZWFsdGVrLHJ0bDkzMDJiLWkyYw0KPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHJlYWx0ZWsscnRsOTMwMmMtaTJjDQo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gcmVhbHRlayxydGw5MzAzLWkyYw0KPj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqAgLSBjb25zdDogcmVhbHRlayxydGw5MzAxLWkyYw0KPj4+ICvCoMKgwqDC
oMKgIC0gY29uc3Q6IHJlYWx0ZWsscnRsOTMwMS1pMmMNCj4+PiArDQo+Pj4gK8KgIHJlZzoNCj4+
PiArwqDCoMKgIGRlc2NyaXB0aW9uOiBSZWdpc3RlciBvZmZzZXQgYW5kIHNpemUgdGhpcyBJMkMg
Y29udHJvbGxlci4NCj4+PiArDQo+Pj4gK8KgICIjYWRkcmVzcy1jZWxscyI6DQo+Pj4gK8KgwqDC
oCBjb25zdDogMQ0KPj4+ICsNCj4+PiArwqAgIiNzaXplLWNlbGxzIjoNCj4+PiArwqDCoMKgIGNv
bnN0OiAwDQo+Pj4gKw0KPj4+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4+PiArwqAgJ15pMmNAWzAt
N10kJzoNCj4+PiArwqDCoMKgICRyZWY6IC9zY2hlbWFzL2kyYy9pMmMtY29udHJvbGxlci55YW1s
DQo+Pj4gK8KgwqDCoCB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlDQo+Pj4gKw0KPj4+ICvC
oMKgwqAgcHJvcGVydGllczoNCj4+PiArwqDCoMKgwqDCoCByZWc6DQo+Pj4gK8KgwqDCoMKgwqDC
oMKgIGRlc2NyaXB0aW9uOiBUaGUgU0RBIHBpbiBhc3NvY2lhdGVkIHdpdGggdGhlIEkyQyBidXMu
DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIG1heEl0ZW1zOiAxDQo+Pj4gKw0KPj4+ICvCoMKgwqAgcmVx
dWlyZWQ6DQo+Pj4gK8KgwqDCoMKgwqAgLSByZWcNCj4+PiArDQo+Pj4gK3JlcXVpcmVkOg0KPj4+
ICvCoCAtIGNvbXBhdGlibGUNCj4+PiArwqAgLSByZWcNCj4+PiArDQo+Pj4gK3VuZXZhbHVhdGVk
UHJvcGVydGllczogZmFsc2UNCj4+IFRoaXMgaGFzIHRvIGJlOiBhZGRpdGlvbmFsUHJvcGVydGll
czogZmFsc2UNCj4NCj4gSG1tLCB3aGVuIEkgZG8gdGhhdCB0aGUgZHRfYmluZGluZ19jaGVjayBj
b21wbGFpbnMNCj4NCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yZWFs
dGVrLHJ0bDkzMDEtc3dpdGNoLmV4YW1wbGUuZHRiOiANCj4gZXRoZXJuZXQtc3dpdGNoQDFiMDAw
MDAwOiBpMmNAMzZjOmkyY0AwOiAnI2FkZHJlc3MtY2VsbHMnLCANCj4gJyNzaXplLWNlbGxzJywg
J2dwaW9AMjAnIGRvIG5vdCBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6IA0KPiAncGluY3RybC1b
MC05XSsnDQo+IMKgwqDCoMKgwqDCoMKgIGZyb20gc2NoZW1hICRpZDogDQo+IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL21mZC9yZWFsdGVrLHJ0bDkzMDEtc3dpdGNoLnlhbWwjDQo+IERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcmVhbHRlayxydGw5MzAxLXN3aXRj
aC5leGFtcGxlLmR0YjogDQo+IGV0aGVybmV0LXN3aXRjaEAxYjAwMDAwMDogaTJjQDM2YzppMmNA
MjogJyNhZGRyZXNzLWNlbGxzJywgDQo+ICcjc2l6ZS1jZWxscycsICdncGlvQDIwJyBkbyBub3Qg
bWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOiANCj4gJ3BpbmN0cmwtWzAtOV0rJw0KPiDCoMKgwqDC
oMKgwqDCoCBmcm9tIHNjaGVtYSAkaWQ6IA0KPiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9tZmQvcmVhbHRlayxydGw5MzAxLXN3aXRjaC55YW1sIw0KPiBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2guZXhhbXBsZS5kdGI6IA0K
PiBldGhlcm5ldC1zd2l0Y2hAMWIwMDAwMDA6IGkyY0AzODg6aTJjQDc6ICcjYWRkcmVzcy1jZWxs
cycsIA0KPiAnI3NpemUtY2VsbHMnLCAnZ3Bpb0AyMCcgZG8gbm90IG1hdGNoIGFueSBvZiB0aGUg
cmVnZXhlczogDQo+ICdwaW5jdHJsLVswLTldKycNCj4gwqDCoMKgwqDCoMKgwqAgZnJvbSBzY2hl
bWEgJGlkOiANCj4gaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbWZkL3JlYWx0ZWsscnRs
OTMwMS1zd2l0Y2gueWFtbCMNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21m
ZC9yZWFsdGVrLHJ0bDkzMDEtc3dpdGNoLmV4YW1wbGUuZHRiOiANCj4gaTJjQDM2YzogaTJjQDA6
ICcjYWRkcmVzcy1jZWxscycsICcjc2l6ZS1jZWxscycsICdncGlvQDIwJyBkbyBub3QgDQo+IG1h
dGNoIGFueSBvZiB0aGUgcmVnZXhlczogJ3BpbmN0cmwtWzAtOV0rJw0KPiDCoMKgwqDCoMKgwqDC
oCBmcm9tIHNjaGVtYSAkaWQ6IA0KPiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pMmMv
cmVhbHRlayxydGw5MzAxLWkyYy55YW1sIw0KPiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2guZXhhbXBsZS5kdGI6IA0KPiBpMmNAMzZj
OiBpMmNAMjogJyNhZGRyZXNzLWNlbGxzJywgJyNzaXplLWNlbGxzJywgJ2dwaW9AMjAnIGRvIG5v
dCANCj4gbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOiAncGluY3RybC1bMC05XSsnDQo+IMKgwqDC
oMKgwqDCoMKgIGZyb20gc2NoZW1hICRpZDogDQo+IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hl
bWFzL2kyYy9yZWFsdGVrLHJ0bDkzMDEtaTJjLnlhbWwjDQo+IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9tZmQvcmVhbHRlayxydGw5MzAxLXN3aXRjaC5leGFtcGxlLmR0YjogDQo+
IGkyY0AzODg6IGkyY0A3OiAnI2FkZHJlc3MtY2VsbHMnLCAnI3NpemUtY2VsbHMnLCAnZ3Bpb0Ay
MCcgZG8gbm90IA0KPiBtYXRjaCBhbnkgb2YgdGhlIHJlZ2V4ZXM6ICdwaW5jdHJsLVswLTldKycN
Cj4gwqDCoMKgwqDCoMKgwqAgZnJvbSBzY2hlbWEgJGlkOiANCj4gaHR0cDovL2RldmljZXRyZWUu
b3JnL3NjaGVtYXMvaTJjL3JlYWx0ZWsscnRsOTMwMS1pMmMueWFtbCMNCj4NCj4gVGhvc2UgcHJv
cGVydGllcyBzaG91bGQgYmUgZ2V0dGluZyBkZWZpbmVkIHZpYSB0aGUgaTJjLWNvbnRyb2xsZXIu
eWFtbCANCj4gc2NoZW1hIHNvIEkgbXVzdCBiZSBtaXNzaW5nIHNvbWV0aGluZywgSSdtIGp1c3Qg
bm90IHN1cmUgd2hhdC4NCg0KU2lsbHkgbWUuIEkgcmVtb3ZlZCB0aGUgd3JvbmcgdW5ldmFsdWF0
ZWRQcm9wZXJ0aWVzLiBJZiBJIGZpeCB1cCB0aGUgb25lIA0KeW91IGFjdHVhbGx5IHBvaW50ZWQg
b3V0IGl0J3MgZmluZS4gdjcgY29taW5nIHNvb24uDQoNCj4NCj4+DQo+Pj4gKw0KPj4+ICtleGFt
cGxlczoNCj4+PiArwqAgLSB8DQo+Pj4gK8KgwqDCoCBpMmNAMzZjIHsNCj4+PiArwqDCoMKgwqDC
oCBjb21wYXRpYmxlID0gInJlYWx0ZWsscnRsOTMwMS1pMmMiOw0KPj4+ICvCoMKgwqDCoMKgIHJl
ZyA9IDwweDM2YyAweDE0PjsNCj4+PiArwqDCoMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwxPjsN
Cj4+PiArwqDCoMKgwqDCoCAjc2l6ZS1jZWxscyA9IDwwPjsNCj4+PiArDQo+Pj4gK8KgwqDCoMKg
wqAgaTJjQDAgew0KPj4+ICvCoMKgwqDCoMKgwqDCoCByZWcgPSA8MD47DQo+Pj4gK8KgwqDCoMKg
wqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4+ICvCoMKgwqDCoMKgwqDCoCAjc2l6ZS1j
ZWxscyA9IDwwPjsNCj4+PiArwqDCoMKgwqDCoMKgwqAgZ3Bpb0AyMCB7DQo+Pj4gK8KgwqDCoMKg
wqDCoMKgwqDCoCBjb21wYXRpYmxlID0gIm54cCxwY2E5NTU1IjsNCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgIGdwaW8tY29udHJvbGxlcjsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgICNncGlvLWNl
bGxzID0gPDI+Ow0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MjA+Ow0KPj4+ICvC
oMKgwqDCoMKgwqDCoCB9Ow0KPj4+ICvCoMKgwqDCoMKgIH07DQo+Pj4gKw0KPj4+ICvCoMKgwqDC
oMKgIGkyY0AyIHsNCj4+PiArwqDCoMKgwqDCoMKgwqAgcmVnID0gPDI+Ow0KPj4+ICvCoMKgwqDC
oMKgwqDCoCAjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+PiArwqDCoMKgwqDCoMKgwqAgI3NpemUt
Y2VsbHMgPSA8MD47DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGdwaW9AMjAgew0KPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqAgY29tcGF0aWJsZSA9ICJueHAscGNhOTU1NSI7DQo+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoCBncGlvLWNvbnRyb2xsZXI7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCAjZ3Bpby1j
ZWxscyA9IDwyPjsNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDIwPjsNCj4+PiAr
wqDCoMKgwqDCoMKgwqAgfTsNCj4+PiArwqDCoMKgwqDCoCB9Ow0KPj4+ICvCoMKgwqAgfTsNCj4+
PiArwqDCoMKgIGkyY0AzODggew0KPj4+ICvCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAicmVhbHRl
ayxydGw5MzAxLWkyYyI7DQo+Pj4gK8KgwqDCoMKgwqAgcmVnID0gPDB4Mzg4IDB4MTQ+Ow0KPj4+
ICvCoMKgwqDCoMKgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4+ICvCoMKgwqDCoMKgICNzaXpl
LWNlbGxzID0gPDA+Ow0KPj4+ICsNCj4+PiArwqDCoMKgwqDCoCBpMmNANyB7DQo+Pj4gK8KgwqDC
oMKgwqDCoMKgIHJlZyA9IDw3PjsNCj4+PiArwqDCoMKgwqDCoMKgwqAgI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQo+Pj4gK8KgwqDCoMKgwqDCoMKgICNzaXplLWNlbGxzID0gPDA+Ow0KPj4+ICvCoMKg
wqDCoMKgIH07DQo+Pj4gK8KgwqDCoCB9Ow0KPj4gWW95IGhhdmUgbm93IG11bHRpcGxlIHNhbWUg
ZXhhbXBsZXMuIEtlZXAgb25seSBvbmUsIGNvbXBsZXRlIGluIHRoZSANCj4+IHBhcmVudA0KPj4g
c2NoZW1hLg0KPg0KPiBPSy4gSSdsbCBrZWVwIG9uZSBleGFtcGxlIG9mIGEgY29udHJvbGxlciB3
aXRoIGEgbm9uLXplcm8gY2hhbm5lbCBpbiANCj4gdGhlIGkyYyBiaW5kaW5nIGFuZCBsZWF2ZSBh
IG1vcmUgY29tcGxldGUgZXhhbXBsZSBpbiB0aGUgbWZkLg0KPg0KPj4+IGRpZmYgLS1naXQgDQo+
Pj4gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMw
MS1zd2l0Y2gueWFtbCANCj4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
ZmQvcmVhbHRlayxydGw5MzAxLXN3aXRjaC55YW1sDQo+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQN
Cj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmYwNTMzMDNhYjFlNg0KPj4+IC0tLSAvZGV2L251bGwN
Cj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0ZWss
cnRsOTMwMS1zd2l0Y2gueWFtbA0KPj4+IEBAIC0wLDAgKzEsMTE0IEBADQo+Pj4gKyMgU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKQ0KPj4+ICsl
WUFNTCAxLjINCj4+IEJlc3QgcmVnYXJkcywNCj4+IEtyenlzenRvZg0KPj4=

