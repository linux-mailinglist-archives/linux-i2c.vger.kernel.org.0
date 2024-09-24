Return-Path: <linux-i2c+bounces-6964-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEA5984CDA
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 23:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5007C2849AC
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Sep 2024 21:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40113143C5D;
	Tue, 24 Sep 2024 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="BZntob/h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A872113DBBC
	for <linux-i2c@vger.kernel.org>; Tue, 24 Sep 2024 21:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727213035; cv=none; b=Xy1YFsh2Mr9sekt/v0ZWGfaIgjnfENZKPfRMooy7Y1yJiemtZbDEpgx4ewPZAN1T5SnUadGRSd0TPHYEHBj0VkkdKzwRteyTj53+X67cudAnxmPc4q9X/RE7JVb+DcbaXPLXzEugWDtxtfgelsK9qfgrpY6urXxP41guXYo4a+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727213035; c=relaxed/simple;
	bh=0trbBWevCDs8OnyEcXvg+bJTXUk38+rmaOI+r/Q8j7U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TYh0g3o6FrSrMOeimzxQLcJXLT3jKoxhYCa2louNxXxZ0j4mzNXRYSsc6+2auxDjDq6PROh2pmTkYDnTVgyT9NFlUTD2R++thoZjeq93AiD63giqZL2vt2r1Iz71FiKnp34PPZXUHBgzoyy1QKGOoAFLdX5xJJLEDYRTqxs0byU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=BZntob/h; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 646842C05DB;
	Wed, 25 Sep 2024 09:23:49 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727213029;
	bh=0trbBWevCDs8OnyEcXvg+bJTXUk38+rmaOI+r/Q8j7U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=BZntob/hCZlQdZIxu6IaWTBz4xfmL+dAa/juTqStG+byCOKgiRnBCm5wbanNBIgYW
	 7Vt+QOzVF/IsueG8sKDgdjJYIhIKCS/8rJEio+lbVvxA5Ahq7rwpMddn57tbeW0Bx7
	 doez+FxRWjvqcc8xUvW7WNcRlIe1+HaTlZ/ZJ6t1nL84YUz3P9W5XM4ZiA+l/evive
	 R2MiFL16N/lAUvImnkRF+yLkOGyyIraIUPyUWF0DCb/uoj2cLJ+IkgEiIDklutAhKW
	 eNvc5swDe9xb4NFqWNN6yEXewfnR8sCRk7XMyBOsmlYQahdJpeijGqHQjOH5lu3EDL
	 zZ+zZtcsQDBAQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f32de50001>; Wed, 25 Sep 2024 09:23:49 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Wed, 25 Sep 2024 09:23:49 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Wed, 25 Sep 2024 09:23:48 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Wed, 25 Sep 2024 09:23:48 +1200
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
Subject: Re: [PATCH v3 3/3] mips: dts: realtek: Add I2C controllers
Thread-Topic: [PATCH v3 3/3] mips: dts: realtek: Add I2C controllers
Thread-Index: AQHbDgytdmN5OYfmG0iIxQ5nrdrn47Jl2EIAgADSkAA=
Date: Tue, 24 Sep 2024 21:23:48 +0000
Message-ID: <fc8bd7f5-3874-4958-be3d-eda9352cb534@alliedtelesis.co.nz>
References: <20240923230230.3001657-1-chris.packham@alliedtelesis.co.nz>
 <20240923230230.3001657-4-chris.packham@alliedtelesis.co.nz>
 <ocmrfbu4atns3c2p7xev7vhktfzv3roy2ijz5qhqklylelgkor@zkrqoeiyvqoi>
In-Reply-To: <ocmrfbu4atns3c2p7xev7vhktfzv3roy2ijz5qhqklylelgkor@zkrqoeiyvqoi>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <D42F9084B7041A4089F0477D65319456@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f32de5 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=zest7o_Hml77ye0SHoAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyNC8wOS8yNCAyMDo1MCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gVHVl
LCBTZXAgMjQsIDIwMjQgYXQgMTE6MDI6MzBBTSArMTIwMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToN
Cj4+IEFkZCB0aGUgSTJDIGNvbnRyb2xsZXJzIHRoYXQgYXJlIHBhcnQgb2YgdGhlIFJUTDkzMDAg
U29DLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1A
YWxsaWVkdGVsZXNpcy5jby5uej4NCj4+IC0tLQ0KPj4NCj4+IE5vdGVzOg0KPj4gICAgICBDaGFu
Z2VzIGluIHYyOg0KPj4gICAgICAtIFVzZSByZWcgcHJvcGVydHkNCj4+DQo+PiAgIGFyY2gvbWlw
cy9ib290L2R0cy9yZWFsdGVrL3J0bDkzMHguZHRzaSB8IDE4ICsrKysrKysrKysrKysrKysrKw0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9hcmNoL21pcHMvYm9vdC9kdHMvcmVhbHRlay9ydGw5MzB4LmR0c2kgYi9hcmNoL21pcHMvYm9v
dC9kdHMvcmVhbHRlay9ydGw5MzB4LmR0c2kNCj4+IGluZGV4IGNmMWIzOGI2YzM1My4uY2M0MzAy
NWNkNDZjIDEwMDY0NA0KPj4gLS0tIGEvYXJjaC9taXBzL2Jvb3QvZHRzL3JlYWx0ZWsvcnRsOTMw
eC5kdHNpDQo+PiArKysgYi9hcmNoL21pcHMvYm9vdC9kdHMvcmVhbHRlay9ydGw5MzB4LmR0c2kN
Cj4+IEBAIC0zMywxMiArMzMsMzAgQEAgbHhfY2xrOiBjbG9jay0xNzVtaHogew0KPj4gICAJc3dp
dGNoMDogc3dpdGNoQDFiMDAwMDAwIHsNCj4+ICAgCQljb21wYXRpYmxlID0gInJlYWx0ZWsscnRs
OTMwMmMtc3dpdGNoIiwgInN5c2NvbiIsICJzaW1wbGUtbWZkIjsNCj4+ICAgCQlyZWcgPSA8MHgx
YjAwMDAwMCAweDEwMDAwPjsNCj4+ICsJCSNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4gKwkJI3Np
emUtY2VsbHMgPSA8MT47DQo+PiAgIA0KPj4gICAJCXJlYm9vdCB7DQo+PiAgIAkJCWNvbXBhdGli
bGUgPSAic3lzY29uLXJlYm9vdCI7DQo+PiAgIAkJCW9mZnNldCA9IDwweDBjPjsNCj4+ICAgCQkJ
dmFsdWUgPSA8MHgwMT47DQo+PiAgIAkJfTsNCj4+ICsNCj4+ICsJCWkyYzA6IGkyY0AzNmMgew0K
Pj4gKwkJCWNvbXBhdGlibGUgPSAicmVhbHRlayxydGw5MzAwLWkyYyI7DQo+PiArCQkJcmVnID0g
PDB4MzZjIDB4MTQ+Ow0KPj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+PiArCQkJI2FkZHJl
c3MtY2VsbHMgPSA8MT47DQo+PiArCQkJI3NpemUtY2VsbHMgPSA8MD47DQo+PiArCQl9Ow0KPiBU
aGlzIHNob3VsZCBiZSBzZW50IGFzIG9uZSBzZXJpZXMuLi4gWW91IGhhdmUgZGVwZW5kZW5jeSBv
dGhlcndpc2UuIEFsc28NCj4gdGhpcyBwb2ludHMgdG8gaXNzdWUgb2YgbWl4aW5nIG5vZGVzIHdp
dGggYW5kIHdpdGhvdXQgdW5pdCBhZGRyZXNzLg0KPg0KPiBJIHRoaW5rIGkyYyBjaGlsZHJlbiBz
aG91bGQgYmUgdW5kZXIgc29tZSBzb3J0IG9mICJpMmMiIGJ1cyBub2RlLg0KDQpzb21ldGhpbmcg
bGlrZSB0aGlzPw0KDQpzd2l0Y2hAMWIwMDAwMDAgew0KIMKgwqAgaTJjLWNvbnRyb2xsZXIgew0K
IMKgwqDCoMKgIGkyYy1tc3QxIHsNCiDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsN
CiDCoMKgwqDCoMKgwqDCoMKgIGkyY0AwIHsNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9
IDwwPjsNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdwaW9AMjAgew0KIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgyMD47DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9
Ow0KIMKgwqDCoMKgwqDCoMKgwqAgfTsNCiDCoMKgwqDCoMKgwqDCoMKgIGkyY0AyIHsNCiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwyPjsNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdw
aW9AMjAgew0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZWcgPSA8MHgyMD47DQog
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Ow0KIMKgwqDCoMKgwqDCoMKgwqAgfTsNCiDCoMKgwqDC
oCB9Ow0KIMKgwqDCoMKgIGkyYy1tc3QyIHsNCiDCoMKgwqDCoMKgwqDCoMKgIHN0YXR1cyA9ICJk
aXNhYmxlZCI7DQogwqDCoMKgwqAgfTsNCiDCoCB9Ow0KfTsNCg0KPiBQbGVhc2UgcHJvcG9zZSBl
bnRpcmUgcmVhbHRlayxydGw5MzAyYy1zd2l0Y2ggYmluZGluZyB3aXRoIHRoZSBJMkMuIEl0J3MN
Cj4gdmVyeSBjb25mdXNpbmcgdG8gc2VlIGl0IHBhcnRpYWwuDQpZZXAgd2lsbCBjb21iaW5lIHRo
ZXNlIHNlcmllcy4NCj4NCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4=

