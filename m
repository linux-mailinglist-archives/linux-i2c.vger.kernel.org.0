Return-Path: <linux-i2c+bounces-9928-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 518E0A69DA7
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 02:36:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB1787AF2A7
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 01:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2EE1C1F2F;
	Thu, 20 Mar 2025 01:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="MIJCJ0cK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB0C1B6D06
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 01:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742434584; cv=none; b=VgJu52U0HBVP0+rF73QVdm30i9TBkqGFM21BlB0TJznnTb85uUVgOdsLnPPETCLGqHLhIPL2tNzn37VoRsM4hA5G39YyLPpfc2+svj9DPOkHgDfJ8bjw87Q2K60jLryVILqadyAVAyrvbUNkN/Vb5ig3yAl63AwYX0gVStuthI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742434584; c=relaxed/simple;
	bh=JXjqiCJ7hZ9I+Z2yreo0KU3P0ph1vreLH67Y/dWkUkY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JUcEn5cuhTkQHXn+96RD3MRmtYsey3WzKo9u/pIXMf7BRnBKb/61EoM5+UMICBv8m0xbTQjV2GG5heP5Cay5FwOXVbk8n3Bqy248huE1wNBiRCTSMW+z0AeRxrkYzDCD1uh6MhK86+8qNuvsUMpNjxCDNtdHwD5dq7NIDDBgNWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=MIJCJ0cK; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BDFCC2C052B;
	Thu, 20 Mar 2025 14:36:12 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1742434572;
	bh=JXjqiCJ7hZ9I+Z2yreo0KU3P0ph1vreLH67Y/dWkUkY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=MIJCJ0cKy6yHS1y/8kLmaDvqWsYMCM400YwrJYWh+Mk04idNG5ZJo5CWuzBIv9WS+
	 pLFkV+K4g1LjKA0ec7ZpesvFdtvmY/aONW5i9tXpl5Vziz35398+4oIrNN8LWyHNWN
	 PUEAP8L3qTClP1hqqWVVf25ef5Rq17c2uOInw5SVFSIdt63AJYcGxTgENvbzJ2xgcp
	 iJ5swxH6qSCRfVJuADdIVTCZqDG433mQkWSQBozz/nM7tKnFU4SCP6GcH+yrVdIWrd
	 LnXf7H2j/jWKRKdaL0U/YaJ7PZcTkp1+9fR5tutv0lcCjs/LnuuyOYOawsjeOL2i0s
	 o39Vst2rSXL7w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67db710c0001>; Thu, 20 Mar 2025 14:36:12 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 20 Mar 2025 14:36:12 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Thu, 20 Mar 2025 14:36:12 +1300
From: Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
	"Markus.Elfring@web.de" <Markus.Elfring@web.de>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "rric@kernel.org" <rric@kernel.org>
Subject: Re: [PATCH v13 3/3] i2c: octeon: add block-mode i2c operations
Thread-Topic: [PATCH v13 3/3] i2c: octeon: add block-mode i2c operations
Thread-Index: AQHbl6vJiHEHFgk1+0C1V3/aq92iNLN6MJoAgAA3DQA=
Date: Thu, 20 Mar 2025 01:36:12 +0000
Message-ID: <d542d00d25e37a922c0fe9d25bba7bbc7220f580.camel@alliedtelesis.co.nz>
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
	 <20250318021632.2710792-4-aryan.srivastava@alliedtelesis.co.nz>
	 <thazi6n7jwqp6xoz4p6ce7ohxts7ubhgs5h6chqsnnexbkiy3j@q6xzdrze6a6f>
In-Reply-To: <thazi6n7jwqp6xoz4p6ce7ohxts7ubhgs5h6chqsnnexbkiy3j@q6xzdrze6a6f>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <09B03E16ADBDB645A4F8043F8E95CBD0@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Ko7u2nWN c=1 sm=1 tr=0 ts=67db710c a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=w1vUsAckAk8A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=knz6bhgZyDJ6hf-j8LYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgQW5kaSwKCk9uIFdlZCwgMjAyNS0wMy0xOSBhdCAyMzoxOSArMDEwMCwgQW5kaSBTaHl0aSB3
cm90ZToKPiBIaSBBcnlhbiwKPiAKPiBmZXcgbml0cGlja3MgYmV0d2VlbiB0aGUgbGluZXMuIFBs
ZWFzZSBzZW5kIG9ubHkgdGhpcyBwYXRjaCBhcyBJCj4gaGF2ZSBhcHBsaWVkIGFscmVhZHkgcGF0
Y2ggMSBhbmQgMi4KPiAKPiAuLi4KPiAKPiA+ICtzdGF0aWMgaW50IG9jdGVvbl9pMmNfaGxjX2Js
b2NrX2NvbXBfcmVhZChzdHJ1Y3Qgb2N0ZW9uX2kyYyAqaTJjLAo+ID4gc3RydWN0IGkyY19tc2cg
Km1zZ3MpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgaW50IHJldDsKPiA+ICvCoMKgwqDCoMKg
wqDCoHUxNiBsZW47Cj4gPiArwqDCoMKgwqDCoMKgwqB1NjQgY21kOwo+ID4gKwo+ID4gK8KgwqDC
oMKgwqDCoMKgb2N0ZW9uX2kyY19obGNfZW5hYmxlKGkyYyk7Cj4gPiArwqDCoMKgwqDCoMKgwqBv
Y3Rlb25faTJjX2Jsb2NrX2VuYWJsZShpMmMpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgLyog
V3JpdGUgKHNpemUgLSAxKSBpbnRvIGJsb2NrIGNvbnRyb2wgcmVnaXN0ZXIgKi8KPiA+ICvCoMKg
wqDCoMKgwqDCoGxlbiA9IG1zZ3NbMV0ubGVuIC0gMTsKPiA+ICvCoMKgwqDCoMKgwqDCoG9jdGVv
bl9pMmNfd3JpdGVxX2ZsdXNoKCh1NjQpbGVuLCBpMmMtPnR3c2lfYmFzZSArCj4gPiBPQ1RFT05f
UkVHX0JMT0NLX0NUTChpMmMpKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIFByZXBhcmUg
Y29yZSBjb21tYW5kICovCj4gPiArwqDCoMKgwqDCoMKgwqBjbWQgPSBTV19UV1NJX1YgfCBTV19U
V1NJX1IgfCBTV19UV1NJX1NPVlIgfAo+ID4gU1dfVFdTSV9PUF83X0lBOwo+ID4gK8KgwqDCoMKg
wqDCoMKgY21kIHw9ICh1NjQpKG1zZ3NbMF0uYWRkciAmIDB4N2Z1bGwpIDw8IFNXX1RXU0lfQURE
Ul9TSElGVDsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIFNlbmQgY29yZSBjb21tYW5kICov
Cj4gPiArwqDCoMKgwqDCoMKgwqByZXQgPSBvY3Rlb25faTJjX2hsY19yZWFkX2NtZChpMmMsIG1z
Z3NbMF0sIGNtZCk7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAocmV0KQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7Cj4gCj4gRG8gd2UgbmVlZCB0byBkaXNhYmxl
IHRoZSBibG9jayBtb2RlPwo+IApEbyB5b3UgbWVhbiwgZG8gd2UgbmVlZCB0byBkaXNhYmxlIHRo
ZSBibG9jayBtb2RlIGF0IGFsbD8gaS5lLiBoYXZlIGl0Cm9uIGFsbCB0aGUgdGltZT8gT3RoZXJ3
aXNlLCBpdCBnZXRzIGRpc2FibGVkIGF0IHRoZSBib3R0b20gb2YgdGhpcwpmdW5jLgo+ID4gK8Kg
wqDCoMKgwqDCoMKgY21kID0gX19yYXdfcmVhZHEoaTJjLT50d3NpX2Jhc2UgKwo+ID4gT0NURU9O
X1JFR19TV19UV1NJKGkyYykpOwo+ID4gK8KgwqDCoMKgwqDCoMKgaWYgKChjbWQgJiBTV19UV1NJ
X1IpID09IDApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIG9jdGVv
bl9pMmNfY2hlY2tfc3RhdHVzKGkyYywgZmFsc2UpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKg
LyogcmVhZCBkYXRhIGluIEZJRk8gKi8KPiA+ICvCoMKgwqDCoMKgwqDCoG9jdGVvbl9pMmNfd3Jp
dGVxX2ZsdXNoKFRXU1hfQkxPQ0tfU1RTX1JFU0VUX1BUUiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGkyYy0+dHdzaV9i
YXNlICsKPiA+IE9DVEVPTl9SRUdfQkxPQ0tfU1RTKGkyYykpOwo+ID4gK8KgwqDCoMKgwqDCoMKg
Zm9yICh1MTYgaSA9IDA7IGkgPD0gbGVuOyBpICs9IDgpIHsKPiAKPiBQbGVhc2UsIGRvIG5vdCBk
ZWNsYXJlIHRoZSBpdGVyYXRvciBpbnNpZGUgdGhlIGZvciBsb29wLgo+IApEb25lLgo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIEJ5dGUtc3dhcCBGSUZPIGRhdGEgYW5kIGNv
cHkgaW50byBtc2cgYnVmZmVyICovCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
X19iZTY0IHJkID0gY3B1X3RvX2JlNjQoX19yYXdfcmVhZHEoaTJjLT50d3NpX2Jhc2UKPiA+ICsg
T0NURU9OX1JFR19CTE9DS19GSUZPKGkyYykpKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBtZW1jcHkoJm1zZ3NbMV0uYnVmW2ldLCAmcmQsIG1pbig4LCBtc2dzWzFd
LmxlbiAtCj4gPiBpKSk7Cj4gPiArwqDCoMKgwqDCoMKgwqB9Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqBvY3Rlb25faTJjX2Jsb2NrX2Rpc2FibGUoaTJjKTsKPiA+ICvCoMKgwqDCoMKgwqDCoHJl
dHVybiByZXQ7Cj4gPiArfQo+IAo+IC4uLgo+IAo+ID4gwqAjZGVmaW5lIE9DVEVPTl9SRUdfU1df
VFdTSSh4KcKgwqDCoMKgwqDCoMKgwqDCoMKgKCh4KS0+cm9mZi5zd190d3NpKQo+ID4gwqAjZGVm
aW5lIE9DVEVPTl9SRUdfVFdTSV9JTlQoeCnCoMKgwqDCoMKgwqDCoMKgwqAoKHgpLT5yb2ZmLnR3
c2lfaW50KQo+ID4gwqAjZGVmaW5lIE9DVEVPTl9SRUdfU1dfVFdTSV9FWFQoeCnCoMKgwqDCoMKg
wqAoKHgpLT5yb2ZmLnN3X3R3c2lfZXh0KQo+ID4gwqAjZGVmaW5lIE9DVEVPTl9SRUdfTU9ERSh4
KcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgKCh4KS0+cm9mZi5tb2RlKQo+ID4gKyNkZWZpbmUg
T0NURU9OX1JFR19CTE9DS19DVEwoeCnCoMKgwqDCoMKgwqDCoMKgKHgtPnJvZmYuYmxvY2tfY3Rs
KQo+ID4gKyNkZWZpbmUgT0NURU9OX1JFR19CTE9DS19TVFMoeCnCoMKgwqDCoMKgwqDCoMKgKHgt
PnJvZmYuYmxvY2tfc3RzKQo+ID4gKyNkZWZpbmUgT0NURU9OX1JFR19CTE9DS19GSUZPKHgpwqDC
oMKgwqDCoMKgwqAoeC0+cm9mZi5ibG9ja19maWZvKQo+IAo+IFBsZWFzZSB1c2UgdGhlICgoeCkt
Pi4uLikgZm9ybS4KPiAKRG9uZS4KPiBBbmRpCj4gCj4gPiDCoAo+ID4gLS8qIFNldCBSRUZDTEtf
U1JDIGFuZCBIU19NT0RFIGluIFRXU1hfTU9ERSByZWdpc3RlciAqLwo+ID4gKy8qIFRXU1hfTU9E
RSByZWdpc3RlciAqLwo+ID4gwqAjZGVmaW5lIFRXU1hfTU9ERV9SRUZDTEtfU1JDwqDCoMKgQklU
KDQpCj4gPiArI2RlZmluZSBUV1NYX01PREVfQkxPQ0tfTU9ERcKgwqDCoEJJVCgyKQo+ID4gwqAj
ZGVmaW5lIFRXU1hfTU9ERV9IU19NT0RFwqDCoMKgwqDCoMKgQklUKDApCj4gPiDCoCNkZWZpbmUg
VFdTWF9NT0RFX0hTX01BU0vCoMKgwqDCoMKgwqAoVFdTWF9NT0RFX1JFRkNMS19TUkMgfAo+ID4g
VFdTWF9NT0RFX0hTX01PREUpCgo=

