Return-Path: <linux-i2c+bounces-4118-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB9490FA8D
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 02:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAD6D1F237A1
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 00:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E55C9445;
	Thu, 20 Jun 2024 00:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="sinVRZdn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8978C04
	for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 00:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718845020; cv=none; b=uvewZIOoT70UHDSYvN3he6plynCJFkIIpL2xNvTBotxDaqLr8J4xjpmxv7tck8P2rC7yK7f58ClOcLNX9uSZl2tTtchMoYEb0GdnJY/tVMZ86BAiWsTi9vrEWoGzN0ppaV2gx/BT6szhUJ26vYpo3hhHUpoixQpIdZoRSHGaCNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718845020; c=relaxed/simple;
	bh=VSRqC8QiZks43XrxcuxDcRsJ/SPDeKz8N25M2qTUvBM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UJRviNdjIKBOvZMEOGq9ooeiqhKSaXF6ukw+G0U+gcOv+4lP1eJrOgPIvFizhutcwfINyxo1cLYTtrd/Lz6akriXafx79orZUOzi9oDIC0TzIdQ6VnHzB0IEeNTQE25ILTqyMhkohZVE7SaWkUheoHcNP8CpAqyip3nZyRvtwaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=sinVRZdn; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 49BA22C0358;
	Thu, 20 Jun 2024 12:56:55 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1718845015;
	bh=VSRqC8QiZks43XrxcuxDcRsJ/SPDeKz8N25M2qTUvBM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=sinVRZdnQxo7VlE5K2P3/HVvmK89fYN9tyNPR0hy57fnkUp/6JI0PZfkGpQsI66FE
	 YWjUrcuqTWvvoNK10J6aVlpuO28ll8aj30x/5Itf0tB2wO35KEi05CV0j5y2q0et9F
	 pteUlF/xavqnRxyvjaaOUGOWiHUx1Cn9yuigtWwrf8hO2JeasNdHlLfeQMjf7ea1d7
	 NxI/Qvtr7kxFxtuEtsXyW3s9/n0M7v7+z4BbHvKRY5J3+MwhIzS2+3oMhs7flT6+sj
	 JwYBI07dHa0HzufY3OBnv7dyLQOia+KJO9Lhn0QTyXAAsadq3IY0A+dh0wvEfGFcsC
	 /3DIdGOKBf/mQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66737e570001>; Thu, 20 Jun 2024 12:56:55 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 20 Jun 2024 12:56:55 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Thu, 20 Jun 2024 12:56:55 +1200
From: Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "Markus.Elfring@web.de" <Markus.Elfring@web.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"rric@kernel.org" <rric@kernel.org>
Subject: Re: [PATCH v6 1/2] i2c: octeon: refactor hlc r/w operations
Thread-Topic: [PATCH v6 1/2] i2c: octeon: refactor hlc r/w operations
Thread-Index: AQHavTz6fQ4iQdx2D0KL9Q0aILYeGrHFlrcAgAl/IAA=
Date: Thu, 20 Jun 2024 00:56:54 +0000
Message-ID: <d577efcc4ea68715767c2e100d5b4262632d5b3b.camel@alliedtelesis.co.nz>
References: <20240613025412.3848629-1-aryan.srivastava@alliedtelesis.co.nz>
	 <20240613025412.3848629-2-aryan.srivastava@alliedtelesis.co.nz>
	 <lx2mv6kbblao5ubjfxg4we6h62g63osbwct2hyuwygmp2u5nxz@j3iyezth2zd2>
In-Reply-To: <lx2mv6kbblao5ubjfxg4we6h62g63osbwct2hyuwygmp2u5nxz@j3iyezth2zd2>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA7C7241DD985A43ADB3AD29F4DDCA9D@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=66737e57 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=w1vUsAckAk8A:10 a=IkcTkHD0fZMA:10 a=T1WGqf2p2xoA:10 a=2bw0RP9PS6Dfekxk3y0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgQW5kaSwNCk9uIEZyaSwgMjAyNC0wNi0xNCBhdCAwMDo1NSArMDEwMCwgQW5kaSBTaHl0aSB3
cm90ZToNCj4gSGkgQXJ5YW4sDQo+IA0KPiA+ICsvKiBDb25zdHJ1Y3QgYW5kIHNlbmQgaTJjIHRy
YW5zYWN0aW9uIGNvcmUgY21kIGZvciByZWFkIG9wcyAqLw0KPiA+ICtzdGF0aWMgaW50IG9jdGVv
bl9pMmNfaGxjX3JlYWRfY21kKHN0cnVjdCBvY3Rlb25faTJjICppMmMsIHN0cnVjdA0KPiA+IGky
Y19tc2cgbXNnLCB1NjQgY21kKQ0KPiA+ICt7DQo+ID4gK8KgwqDCoMKgwqDCoMKgdTY0IGV4dCA9
IDA7DQo+ID4gKw0KPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChvY3Rlb25faTJjX2hsY19leHQoaTJj
LCBtc2csICZjbWQsICZleHQpKQ0KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBv
Y3Rlb25faTJjX3dyaXRlcV9mbHVzaChleHQsIGkyYy0+dHdzaV9iYXNlICsNClRoaXMgdXNlZCB0
byBiZSBjYWxsZWQgd2l0aGluIHRoaXMgYmxvY2sgcHJldmlvdXNseSBmb3IgdGhlIHJlYWQNCmZ1
bmN0aW9uIG9ubHk6DQoNCglpZiAobXNnc1swXS5sZW4gPT0gMikgew0KCQl1NjQgZXh0ID0gMDsN
Cg0KCQljbWQgfD0gU1dfVFdTSV9FSUE7DQoJCWV4dCA9ICh1NjQpbXNnc1swXS5idWZbMF0gPDwg
U1dfVFdTSV9JQV9TSElGVDsNCgkJY21kIHw9ICh1NjQpbXNnc1swXS5idWZbMV0gPDwgU1dfVFdT
SV9JQV9TSElGVDsNCgkJb2N0ZW9uX2kyY193cml0ZXFfZmx1c2goZXh0LCBpMmMtPnR3c2lfYmFz
ZSArDQpTV19UV1NJX0VYVChpMmMpKTsNCgl9IGVsc2Ugew0KCQljbWQgfD0gKHU2NCltc2dzWzBd
LmJ1ZlswXSA8PCBTV19UV1NJX0lBX1NISUZUOw0KCX0NCg0KVGhpcyBpcyB0aGUgd3JpdGUgZnVu
Y3Rpb24gZXF1aXZlbGFudDoNCglpZiAobXNnc1swXS5sZW4gPT0gMikgew0KCQljbWQgfD0gU1df
VFdTSV9FSUE7DQoJCWV4dCB8PSAodTY0KW1zZ3NbMF0uYnVmWzBdIDw8IFNXX1RXU0lfSUFfU0hJ
RlQ7DQoJCXNldF9leHQgPSB0cnVlOw0KCQljbWQgfD0gKHU2NCltc2dzWzBdLmJ1ZlsxXSA8PCBT
V19UV1NJX0lBX1NISUZUOw0KCX0gZWxzZSB7DQoJCWNtZCB8PSAodTY0KW1zZ3NbMF0uYnVmWzBd
IDw8IFNXX1RXU0lfSUFfU0hJRlQ7DQoJfQ0KVGhleSBhcmUgbmVhcmx5IGlkZW50aWNhbCBibG9j
a3Mgb2YgY29kZSwgYmFyIHRoZSBvbmUgd3JpdGUuIA0KU28gdG8gdXNlIHRoaXMgYmxvY2sgZ2Vu
ZXJpY2FsbHkgZm9yIGJvdGggd3JpdGUgYW5kIHJlYWQsIHRoZW4gSSBoYXZlDQp0byBwdWxsIG91
dCB0aGlzIGxpbmUgYW5kIHJ1biBpdCBvbmx5IGluIHRoZSByZWFkIGNhc2UuIFRoZXJlZm9yZSB0
aGlzDQppcyBtb3JlIG9mIGEgcmVvcmRlcmluZyBvZiBvcGVyYXRpb25zLCBhcyB0aGUgc2V0X2V4
dCBmbGFnIG5vdyBnZXRzIHNldA0Kd2hlcmUgdGhlIGxpbmUgdXNlZCB0byBydW4sIGFuZCBpcyB1
c2VkIHRvIGNvbmRpdGlvbiB0aGUgcnVubmluZyBvZiB0aGUNCmxpbmUuDQo+ID4gU1dfVFdTSV9F
WFQoaTJjKSk7DQo+IA0KPiBJIHRoaW5rIHRoaXMgY2hlY2sgaGVyZSBpcyB0aGUgb25seSBsb2dp
Y2FsIGNoYW5nZSBJIHNlZS4gUmlnaHQ/DQo+IA0KPiBJZiBzbywgY2FuIHlvdSBwbGVhc2UgZGVz
Y3JpYmUgaW4gdGhlIGxvZyB3aHkgeW91IG1hZGUgdGhpcw0KPiBjaGFuZ2U/DQo+IA0KPiBUaGFu
a3MsDQo+IEFuZGkNCj4gDQo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIG9jdGVvbl9pMmNfaGxj
X2NtZF9zZW5kKGkyYywgY21kKTsNCj4gPiArfQ0KVGhhbmtzLA0KQXJ5YW4uDQoNCg==

