Return-Path: <linux-i2c+bounces-7433-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A0C9A12F1
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 21:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A46A1F23418
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 19:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 589A42139CF;
	Wed, 16 Oct 2024 19:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="qDBer67J"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91351B6D0C
	for <linux-i2c@vger.kernel.org>; Wed, 16 Oct 2024 19:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729108242; cv=none; b=klV1aPqpdaANpOr4MOH5Y9zulrR08aEK70kpHSKUCHqx48z/pUdNe8IKESNq1KfnZth1aelfpx0oKuGNYjXTZM24haTwht/OXAfWW8Q6zUol6BwHbMLoePMe7dE5y2n9pePg9WjPUjCxe9uNh/ur4VSalPLSpRrgil2HJ/7srAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729108242; c=relaxed/simple;
	bh=lYz8N4/jMLsog3BqxBrS71EX/CtVo4jT6H/piDci1DA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nSM8BeV+j6NTi1F9wbtoJeZ038VUZLG0zrAxIXKPCrqLjT0ZSwwl5gexZy+GSCDocwLrV5AgP2vzhRqq0mpZtxRR1SDSNJn6ohaMDtmwu+sSqs5qE6ixo3uBkn4hLErkHXZOM+iCqZzIoXYA9ag+bKgWhG9iSbr4bo+1Lrw7HoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=qDBer67J; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C74222C0517;
	Thu, 17 Oct 2024 08:50:36 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729108236;
	bh=lYz8N4/jMLsog3BqxBrS71EX/CtVo4jT6H/piDci1DA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=qDBer67JzySQkTBCQ8XoqKIhvQJgJd485Sohr5p5f0XfqfQKvgXl8WeWuXqfH/73a
	 v3VW6K7Megr4rtqAFAAHjFuF0ZOdswSHEXpn1Da0+1XaFUfGc2g7HsGTBVrwSk8k6V
	 6Q6p69CPbK99ktHcq19ybEBdEIkiOMUSG5K0kypZdKZSVLNJDet1iLi6Jlc5MuXb5k
	 QeuzGAoOYV7NETGuGDM4pf96JaUEWlHpzz/thP3iwJvbfQacZAwxb7tA8mnLJfLMxt
	 PWbAVoKndB+85uDm/xMRDZe9twMHw0q4o2Ymhf1Hq3hwgFrjFQFW2EqXLAYuFurZMc
	 WzyceGIcQ319A==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6710190c0002>; Thu, 17 Oct 2024 08:50:36 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Thu, 17 Oct 2024 08:50:36 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Thu, 17 Oct 2024 08:50:36 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Thu, 17 Oct 2024 08:50:36 +1300
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
Thread-Index: AQHbH1XyRCVZAOY+h0G2xpDtEx4lKrKIFFgAgADcY4A=
Date: Wed, 16 Oct 2024 19:50:36 +0000
Message-ID: <1c7abf59-588b-4679-8638-7e9985f133d1@alliedtelesis.co.nz>
References: <20241015225948.3971924-1-chris.packham@alliedtelesis.co.nz>
 <20241015225948.3971924-4-chris.packham@alliedtelesis.co.nz>
 <5o77wkohvujnfnm4xm73b65gpx5by7chhyhdbuw3dkpota53us@5x6jlcabjoes>
In-Reply-To: <5o77wkohvujnfnm4xm73b65gpx5by7chhyhdbuw3dkpota53us@5x6jlcabjoes>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <820BFB81548DA04F856E2B30779A14C3@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=6710190c a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=gEfo2CItAAAA:8 a=PZBvVurBh3LiFW73o5MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAxNi8xMC8yNCAxOTo0MSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gV2Vk
LCBPY3QgMTYsIDIwMjQgYXQgMTE6NTk6NDVBTSArMTMwMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToN
Cj4+ICtwcm9wZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgb25lT2Y6DQo+PiAr
ICAgICAgLSBpdGVtczoNCj4+ICsgICAgICAgICAgLSBlbnVtOg0KPj4gKyAgICAgICAgICAgICAg
LSByZWFsdGVrLHJ0bDkzMDJiLWkyYw0KPj4gKyAgICAgICAgICAgICAgLSByZWFsdGVrLHJ0bDkz
MDJjLWkyYw0KPj4gKyAgICAgICAgICAgICAgLSByZWFsdGVrLHJ0bDkzMDMtaTJjDQo+PiArICAg
ICAgICAgIC0gY29uc3Q6IHJlYWx0ZWsscnRsOTMwMS1pMmMNCj4+ICsgICAgICAtIGNvbnN0OiBy
ZWFsdGVrLHJ0bDkzMDEtaTJjDQo+PiArDQo+PiArICByZWc6DQo+PiArICAgIGRlc2NyaXB0aW9u
OiBSZWdpc3RlciBvZmZzZXQgYW5kIHNpemUgdGhpcyBJMkMgY29udHJvbGxlci4NCj4+ICsNCj4+
ICsgICIjYWRkcmVzcy1jZWxscyI6DQo+PiArICAgIGNvbnN0OiAxDQo+PiArDQo+PiArICAiI3Np
emUtY2VsbHMiOg0KPj4gKyAgICBjb25zdDogMA0KPj4gKw0KPj4gK3BhdHRlcm5Qcm9wZXJ0aWVz
Og0KPj4gKyAgJ15pMmNAWzAtN10kJzoNCj4+ICsgICAgJHJlZjogL3NjaGVtYXMvaTJjL2kyYy1j
b250cm9sbGVyLnlhbWwNCj4+ICsgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPj4g
Kw0KPj4gKyAgICBwcm9wZXJ0aWVzOg0KPj4gKyAgICAgIHJlZzoNCj4+ICsgICAgICAgIGRlc2Ny
aXB0aW9uOiBUaGUgU0RBIHBpbiBhc3NvY2lhdGVkIHdpdGggdGhlIEkyQyBidXMuDQo+PiArICAg
ICAgICBtYXhJdGVtczogMQ0KPj4gKw0KPj4gKyAgICByZXF1aXJlZDoNCj4+ICsgICAgICAtIHJl
Zw0KPj4gKw0KPj4gK3JlcXVpcmVkOg0KPj4gKyAgLSBjb21wYXRpYmxlDQo+PiArICAtIHJlZw0K
Pj4gKw0KPj4gK3VuZXZhbHVhdGVkUHJvcGVydGllczogZmFsc2UNCj4gVGhpcyBoYXMgdG8gYmU6
IGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KDQpIbW0sIHdoZW4gSSBkbyB0aGF0IHRoZSBk
dF9iaW5kaW5nX2NoZWNrIGNvbXBsYWlucw0KDQpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2guZXhhbXBsZS5kdGI6IA0KZXRoZXJuZXQt
c3dpdGNoQDFiMDAwMDAwOiBpMmNAMzZjOmkyY0AwOiAnI2FkZHJlc3MtY2VsbHMnLCANCicjc2l6
ZS1jZWxscycsICdncGlvQDIwJyBkbyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOiAncGlu
Y3RybC1bMC05XSsnDQogwqDCoMKgwqDCoMKgwqAgZnJvbSBzY2hlbWEgJGlkOiANCmh0dHA6Ly9k
ZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21mZC9yZWFsdGVrLHJ0bDkzMDEtc3dpdGNoLnlhbWwjDQpE
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0
Y2guZXhhbXBsZS5kdGI6IA0KZXRoZXJuZXQtc3dpdGNoQDFiMDAwMDAwOiBpMmNAMzZjOmkyY0Ay
OiAnI2FkZHJlc3MtY2VsbHMnLCANCicjc2l6ZS1jZWxscycsICdncGlvQDIwJyBkbyBub3QgbWF0
Y2ggYW55IG9mIHRoZSByZWdleGVzOiAncGluY3RybC1bMC05XSsnDQogwqDCoMKgwqDCoMKgwqAg
ZnJvbSBzY2hlbWEgJGlkOiANCmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21mZC9yZWFs
dGVrLHJ0bDkzMDEtc3dpdGNoLnlhbWwjDQpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2guZXhhbXBsZS5kdGI6IA0KZXRoZXJuZXQtc3dp
dGNoQDFiMDAwMDAwOiBpMmNAMzg4OmkyY0A3OiAnI2FkZHJlc3MtY2VsbHMnLCANCicjc2l6ZS1j
ZWxscycsICdncGlvQDIwJyBkbyBub3QgbWF0Y2ggYW55IG9mIHRoZSByZWdleGVzOiAncGluY3Ry
bC1bMC05XSsnDQogwqDCoMKgwqDCoMKgwqAgZnJvbSBzY2hlbWEgJGlkOiANCmh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL21mZC9yZWFsdGVrLHJ0bDkzMDEtc3dpdGNoLnlhbWwjDQpEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2gu
ZXhhbXBsZS5kdGI6IA0KaTJjQDM2YzogaTJjQDA6ICcjYWRkcmVzcy1jZWxscycsICcjc2l6ZS1j
ZWxscycsICdncGlvQDIwJyBkbyBub3QgbWF0Y2ggDQphbnkgb2YgdGhlIHJlZ2V4ZXM6ICdwaW5j
dHJsLVswLTldKycNCiDCoMKgwqDCoMKgwqDCoCBmcm9tIHNjaGVtYSAkaWQ6IA0KaHR0cDovL2Rl
dmljZXRyZWUub3JnL3NjaGVtYXMvaTJjL3JlYWx0ZWsscnRsOTMwMS1pMmMueWFtbCMNCkRvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvcmVhbHRlayxydGw5MzAxLXN3aXRjaC5l
eGFtcGxlLmR0YjogDQppMmNAMzZjOiBpMmNAMjogJyNhZGRyZXNzLWNlbGxzJywgJyNzaXplLWNl
bGxzJywgJ2dwaW9AMjAnIGRvIG5vdCBtYXRjaCANCmFueSBvZiB0aGUgcmVnZXhlczogJ3BpbmN0
cmwtWzAtOV0rJw0KIMKgwqDCoMKgwqDCoMKgIGZyb20gc2NoZW1hICRpZDogDQpodHRwOi8vZGV2
aWNldHJlZS5vcmcvc2NoZW1hcy9pMmMvcmVhbHRlayxydGw5MzAxLWkyYy55YW1sIw0KRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9yZWFsdGVrLHJ0bDkzMDEtc3dpdGNoLmV4
YW1wbGUuZHRiOiANCmkyY0AzODg6IGkyY0A3OiAnI2FkZHJlc3MtY2VsbHMnLCAnI3NpemUtY2Vs
bHMnLCAnZ3Bpb0AyMCcgZG8gbm90IG1hdGNoIA0KYW55IG9mIHRoZSByZWdleGVzOiAncGluY3Ry
bC1bMC05XSsnDQogwqDCoMKgwqDCoMKgwqAgZnJvbSBzY2hlbWEgJGlkOiANCmh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9zY2hlbWFzL2kyYy9yZWFsdGVrLHJ0bDkzMDEtaTJjLnlhbWwjDQoNClRob3Nl
IHByb3BlcnRpZXMgc2hvdWxkIGJlIGdldHRpbmcgZGVmaW5lZCB2aWEgdGhlIGkyYy1jb250cm9s
bGVyLnlhbWwgDQpzY2hlbWEgc28gSSBtdXN0IGJlIG1pc3Npbmcgc29tZXRoaW5nLCBJJ20ganVz
dCBub3Qgc3VyZSB3aGF0Lg0KDQo+DQo+PiArDQo+PiArZXhhbXBsZXM6DQo+PiArICAtIHwNCj4+
ICsgICAgaTJjQDM2YyB7DQo+PiArICAgICAgY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0bDkzMDEt
aTJjIjsNCj4+ICsgICAgICByZWcgPSA8MHgzNmMgMHgxND47DQo+PiArICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQo+PiArICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+PiArDQo+PiArICAg
ICAgaTJjQDAgew0KPj4gKyAgICAgICAgcmVnID0gPDA+Ow0KPj4gKyAgICAgICAgI2FkZHJlc3Mt
Y2VsbHMgPSA8MT47DQo+PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4+ICsgICAgICAg
IGdwaW9AMjAgew0KPj4gKyAgICAgICAgICBjb21wYXRpYmxlID0gIm54cCxwY2E5NTU1IjsNCj4+
ICsgICAgICAgICAgZ3Bpby1jb250cm9sbGVyOw0KPj4gKyAgICAgICAgICAjZ3Bpby1jZWxscyA9
IDwyPjsNCj4+ICsgICAgICAgICAgcmVnID0gPDB4MjA+Ow0KPj4gKyAgICAgICAgfTsNCj4+ICsg
ICAgICB9Ow0KPj4gKw0KPj4gKyAgICAgIGkyY0AyIHsNCj4+ICsgICAgICAgIHJlZyA9IDwyPjsN
Cj4+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4gKyAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MD47DQo+PiArICAgICAgICBncGlvQDIwIHsNCj4+ICsgICAgICAgICAgY29tcGF0aWJs
ZSA9ICJueHAscGNhOTU1NSI7DQo+PiArICAgICAgICAgIGdwaW8tY29udHJvbGxlcjsNCj4+ICsg
ICAgICAgICAgI2dwaW8tY2VsbHMgPSA8Mj47DQo+PiArICAgICAgICAgIHJlZyA9IDwweDIwPjsN
Cj4+ICsgICAgICAgIH07DQo+PiArICAgICAgfTsNCj4+ICsgICAgfTsNCj4+ICsgICAgaTJjQDM4
OCB7DQo+PiArICAgICAgY29tcGF0aWJsZSA9ICJyZWFsdGVrLHJ0bDkzMDEtaTJjIjsNCj4+ICsg
ICAgICByZWcgPSA8MHgzODggMHgxND47DQo+PiArICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
DQo+PiArICAgICAgI3NpemUtY2VsbHMgPSA8MD47DQo+PiArDQo+PiArICAgICAgaTJjQDcgew0K
Pj4gKyAgICAgICAgcmVnID0gPDc+Ow0KPj4gKyAgICAgICAgI2FkZHJlc3MtY2VsbHMgPSA8MT47
DQo+PiArICAgICAgICAjc2l6ZS1jZWxscyA9IDwwPjsNCj4+ICsgICAgICB9Ow0KPj4gKyAgICB9
Ow0KPiBZb3kgaGF2ZSBub3cgbXVsdGlwbGUgc2FtZSBleGFtcGxlcy4gS2VlcCBvbmx5IG9uZSwg
Y29tcGxldGUgaW4gdGhlIHBhcmVudA0KPiBzY2hlbWEuDQoNCk9LLiBJJ2xsIGtlZXAgb25lIGV4
YW1wbGUgb2YgYSBjb250cm9sbGVyIHdpdGggYSBub24temVybyBjaGFubmVsIGluIHRoZSANCmky
YyBiaW5kaW5nIGFuZCBsZWF2ZSBhIG1vcmUgY29tcGxldGUgZXhhbXBsZSBpbiB0aGUgbWZkLg0K
DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9y
ZWFsdGVrLHJ0bDkzMDEtc3dpdGNoLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWZkL3JlYWx0ZWsscnRsOTMwMS1zd2l0Y2gueWFtbA0KPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjA1MzMwM2FiMWU2DQo+PiAtLS0gL2Rldi9u
dWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZkL3JlYWx0
ZWsscnRsOTMwMS1zd2l0Y2gueWFtbA0KPj4gQEAgLTAsMCArMSwxMTQgQEANCj4+ICsjIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+ICsl
WUFNTCAxLjINCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4=

