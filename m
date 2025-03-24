Return-Path: <linux-i2c+bounces-9994-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60477A6E22C
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 19:21:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 273EE188D28D
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Mar 2025 18:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9640C2620C9;
	Mon, 24 Mar 2025 18:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="yXfS7BXi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69992264A7E
	for <linux-i2c@vger.kernel.org>; Mon, 24 Mar 2025 18:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742840450; cv=none; b=kvVEhmqDJHAJS/SOKV144rHUFFKu2hydf0r0VBUfZZeEG82OKEKzphYWvxXe2GwMNaA6ArkOXwegNjBVUsv46RVKZo+BxiOE/QNphUWKlbSQPGelNkzCc/xPvs/vh2046RgT7fhDDKlIdCXRHcvSSUPVcoDVdmbksX/gQjJvO4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742840450; c=relaxed/simple;
	bh=jcbglrtrzi4TXdy8lI2uD0gTHxJoZBF6WMdLdLn/8bg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FHIhyAnoPqLj7uSXr9jhyADtOs6RDX4tBol/ikrhAoLsIIFC+yDG79kq4aMcs1bUHEMdz/yotUKKtq9XRM80aBMXOLMKw3lmvooIlYAD7iR9prJlQzugTjViiu5YkSlVG1qYN9IZ/QgjyNJ3IuCOrcClkCnWu0klp1yZiH/lZRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=yXfS7BXi; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id C992C2C0526;
	Tue, 25 Mar 2025 07:14:51 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1742840091;
	bh=jcbglrtrzi4TXdy8lI2uD0gTHxJoZBF6WMdLdLn/8bg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=yXfS7BXiu07gVqrEnPKDJV+tpUA+RP9B1vwsK01Q4o0WkZf9hAh96en0SYgvOiIfu
	 ELSciUfQjKtrUYrccZ/yB3l83QC9gcaFx8l7o3Z1w2yRe8i+ET+YsKpi5AdXMwBIK2
	 +rzDrdKS6a2XAblax5dxO24IUA9x51I/l96wWJLEbtZF8kY7pkqJXxlrqDKXzB4Pwm
	 BiY+TnUA7bMkHPH2Wt6oJAmbMK5nOEQJ0cfWnIC+5O2wKbLr/XLQJQy+oyxDUrcodG
	 JBI9QbakvKlsWSkyfjRVuIFQv0pQGv2UvLNozXTALGGVj2E6wckkwqeA/8AQYg+AMt
	 xERsGy3aYPyXg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67e1a11b0001>; Tue, 25 Mar 2025 07:14:51 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 25 Mar 2025 07:14:51 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Tue, 25 Mar 2025 07:14:51 +1300
From: Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
	"Markus.Elfring@web.de" <Markus.Elfring@web.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rric@kernel.org" <rric@kernel.org>
Subject: Re: [PATCH v13 3/3] i2c: octeon: add block-mode i2c operations
Thread-Topic: [PATCH v13 3/3] i2c: octeon: add block-mode i2c operations
Thread-Index: AQHbl6vJiHEHFgk1+0C1V3/aq92iNLN6MJoAgAA3DQCAAHxqAIAG4+6A
Date: Mon, 24 Mar 2025 18:14:51 +0000
Message-ID: <0b562e42889c67e96e9e8a6d1e59b58ca332dff4.camel@alliedtelesis.co.nz>
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
	 <20250318021632.2710792-4-aryan.srivastava@alliedtelesis.co.nz>
	 <thazi6n7jwqp6xoz4p6ce7ohxts7ubhgs5h6chqsnnexbkiy3j@q6xzdrze6a6f>
	 <d542d00d25e37a922c0fe9d25bba7bbc7220f580.camel@alliedtelesis.co.nz>
	 <2enq7ixb5m6nn2hlufsgeh6cqt24l5rmbtceflbtwaep64osxy@ej63czorl2tn>
In-Reply-To: <2enq7ixb5m6nn2hlufsgeh6cqt24l5rmbtceflbtwaep64osxy@ej63czorl2tn>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C2E4E0652FA5A4391B860F124304E22@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Ko7u2nWN c=1 sm=1 tr=0 ts=67e1a11b a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=w1vUsAckAk8A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=1T9zNMSQzU2THpBoscgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

T24gVGh1LCAyMDI1LTAzLTIwIGF0IDEwOjAxICswMTAwLCBBbmRpIFNoeXRpIHdyb3RlOg0KPiBI
aSBBcnlhbiwNCj4gDQo+IE9uIFRodSwgTWFyIDIwLCAyMDI1IGF0IDAxOjM2OjEyQU0gKzAwMDAs
IEFyeWFuIFNyaXZhc3RhdmEgd3JvdGU6DQo+ID4gT24gV2VkLCAyMDI1LTAzLTE5IGF0IDIzOjE5
ICswMTAwLCBBbmRpIFNoeXRpIHdyb3RlOg0KPiA+ID4gPiArc3RhdGljIGludCBvY3Rlb25faTJj
X2hsY19ibG9ja19jb21wX3JlYWQoc3RydWN0IG9jdGVvbl9pMmMNCj4gPiA+ID4gKmkyYywNCj4g
PiA+ID4gc3RydWN0IGkyY19tc2cgKm1zZ3MpDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICvCoMKgwqDC
oMKgwqDCoGludCByZXQ7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoHUxNiBsZW47DQo+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoHU2NCBjbWQ7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKgwqDC
oMKgb2N0ZW9uX2kyY19obGNfZW5hYmxlKGkyYyk7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoG9j
dGVvbl9pMmNfYmxvY2tfZW5hYmxlKGkyYyk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKg
wqDCoMKgLyogV3JpdGUgKHNpemUgLSAxKSBpbnRvIGJsb2NrIGNvbnRyb2wgcmVnaXN0ZXIgKi8N
Cj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgbGVuID0gbXNnc1sxXS5sZW4gLSAxOw0KPiA+ID4gPiAr
wqDCoMKgwqDCoMKgwqBvY3Rlb25faTJjX3dyaXRlcV9mbHVzaCgodTY0KWxlbiwgaTJjLT50d3Np
X2Jhc2UgKw0KPiA+ID4gPiBPQ1RFT05fUkVHX0JMT0NLX0NUTChpMmMpKTsNCj4gPiA+ID4gKw0K
PiA+ID4gPiArwqDCoMKgwqDCoMKgwqAvKiBQcmVwYXJlIGNvcmUgY29tbWFuZCAqLw0KPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqBjbWQgPSBTV19UV1NJX1YgfCBTV19UV1NJX1IgfCBTV19UV1NJX1NP
VlIgfA0KPiA+ID4gPiBTV19UV1NJX09QXzdfSUE7DQo+ID4gPiA+ICvCoMKgwqDCoMKgwqDCoGNt
ZCB8PSAodTY0KShtc2dzWzBdLmFkZHIgJiAweDdmdWxsKSA8PA0KPiA+ID4gPiBTV19UV1NJX0FE
RFJfU0hJRlQ7DQo+ID4gPiA+ICsNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgLyogU2VuZCBjb3Jl
IGNvbW1hbmQgKi8NCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gb2N0ZW9uX2kyY19obGNf
cmVhZF9jbWQoaTJjLCBtc2dzWzBdLCBjbWQpOw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqBpZiAo
cmV0KQ0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsN
Cj4gPiA+IA0KPiA+ID4gRG8gd2UgbmVlZCB0byBkaXNhYmxlIHRoZSBibG9jayBtb2RlPw0KPiA+
ID4gDQo+ID4gRG8geW91IG1lYW4sIGRvIHdlIG5lZWQgdG8gZGlzYWJsZSB0aGUgYmxvY2sgbW9k
ZSBhdCBhbGw/IGkuZS4gaGF2ZQ0KPiA+IGl0DQo+ID4gb24gYWxsIHRoZSB0aW1lPyBPdGhlcndp
c2UsIGl0IGdldHMgZGlzYWJsZWQgYXQgdGhlIGJvdHRvbSBvZiB0aGlzDQo+ID4gZnVuYy4NCj4g
DQo+IHllcywgYnV0IHlvdSByZXR1cm4gZWFybGllciwgcmlnaHQ/DQo+IA0KQWggeWVzLCBnb29k
IGNhdGNoLiBJIHdpbGwgZml4IHRoaXMgdXAsIHRoYW5rIHlvdSA6KQ0KDQpDaGVlcnMsIEFyeWFu
Lg0KDQo=

