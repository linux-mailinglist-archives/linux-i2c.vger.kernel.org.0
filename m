Return-Path: <linux-i2c+bounces-7006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 775E9986A67
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 03:26:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E39D21F23048
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 01:26:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F070017278D;
	Thu, 26 Sep 2024 01:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="c1zf/DUt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3795170A12
	for <linux-i2c@vger.kernel.org>; Thu, 26 Sep 2024 01:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727314011; cv=none; b=u+L2MvfymvMn9C1/WVMDg8bSRnKnzzABoU5pO8l7bJiUdveY+N6zJf2Yd3Y97jzpjBr/qzKJ4L541ed03bIL8re8rS5oNvDnh539xdELfSpKEqfiH9OiTq/jdplWOmoBIfarP4MDztSJGvH29bnFoSR2S8fSAINtW6OKJdnxg0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727314011; c=relaxed/simple;
	bh=1795Hl5aHkEpsl1k0n4L0XLmlewyGe4isH62lTfVHCg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MzEXeYeKr/ce3I0Bp/Vp8iMUkXQqPgbpEuH989GOzoqKNcr3Op4bmJhSYS36OxaiQ1utkBd58t/rvA8HvfKiwMVujpBfzkNcP36elPWAv2vOixujx4UDL34xyJ1MeAEjj1hYwyD9fdzMyTR2XNfTFuHfAP7CM+pL9IZzI2CQaDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=c1zf/DUt; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 928472C012A;
	Thu, 26 Sep 2024 13:26:45 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727314005;
	bh=1795Hl5aHkEpsl1k0n4L0XLmlewyGe4isH62lTfVHCg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=c1zf/DUtdkQrOvp5hH6YhxZPsA5d+Mw5+LLFnmIBmWo8ocnvz5N/v1yKq4HXeGniW
	 52hvvg5laZ9t3+nbOq4WaOCoE6th8/f4NF7Q8cry11MewEiYX/yACNDkEFxPJV0o0e
	 uvQ+hv4DSf0bvkAS44xfM7ZHpwq/xTYzQU2GWLrIZx3auR4VvQkLTJ3gyOI9S13wVr
	 0YrnRaLnyZ4CQ8qeea1Whp8uIv8epfzlGNriXRLJ6OUQs72/rJf2QgZGaT9/KYbjo4
	 y0Zu4vYnTpB0IPNqqfc6/R+nLofSiXNPwdsoIpwXppvXYKY1qBHe955cN6T5sWAfzq
	 wRDqvR/GYRx9w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f4b8550000>; Thu, 26 Sep 2024 13:26:45 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Thu, 26 Sep 2024 13:26:45 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Thu, 26 Sep 2024 13:26:45 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Thu, 26 Sep 2024 13:26:45 +1200
From: Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 1/2] i2c: octeon: refactor common i2c operations
Thread-Topic: [PATCH v7 1/2] i2c: octeon: refactor common i2c operations
Thread-Index: AQHawsjTyTBvsusNCEie+wVscqbULLJSCMGAgBcOzQA=
Date: Thu, 26 Sep 2024 01:26:45 +0000
Message-ID: <2f34aa022014cb3dd762d33dc0e8f04b6549a7cb.camel@alliedtelesis.co.nz>
References: <20240620041746.3315255-1-aryan.srivastava@alliedtelesis.co.nz>
	 <20240620041746.3315255-2-aryan.srivastava@alliedtelesis.co.nz>
	 <5qafqlqdcm5jsynyqumzfhzqpkaog55muytcdwqlhebcnt5rgg@oxdv6yfid42a>
In-Reply-To: <5qafqlqdcm5jsynyqumzfhzqpkaog55muytcdwqlhebcnt5rgg@oxdv6yfid42a>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <6BCC1CE68E5FB74E88141B216DB995FA@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f4b855 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=w1vUsAckAk8A:10 a=IkcTkHD0fZMA:10 a=EaEq8P2WXUwA:10 a=InLPWLBpFnOSA2FroUkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgQW5kaQpPbiBXZWQsIDIwMjQtMDktMTEgYXQgMTE6MTkgKzAyMDAsIEFuZGkgU2h5dGkgd3Jv
dGU6Cj4gSGkgQXJ5YW4sCj4gCj4gLi4uCj4gCj4gPiArLyogQ29uc3RydWN0IGFuZCBzZW5kIGky
YyB0cmFuc2FjdGlvbiBjb3JlIGNtZCBmb3IgcmVhZCBvcHMgKi8KPiA+ICtzdGF0aWMgaW50IG9j
dGVvbl9pMmNfaGxjX3JlYWRfY21kKHN0cnVjdCBvY3Rlb25faTJjICppMmMsIHN0cnVjdAo+ID4g
aTJjX21zZyBtc2csIHU2NCBjbWQpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgdTY0IGV4dCA9
IDA7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAob2N0ZW9uX2kyY19obGNfZXh0KGkyYywg
bXNnLCAmY21kLCAmZXh0KSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvY3Rl
b25faTJjX3dyaXRlcV9mbHVzaChleHQsIGkyYy0+dHdzaV9iYXNlICsKPiA+IFNXX1RXU0lfRVhU
KGkyYykpOwo+ID4gKwo+IAo+IFdoYXQgSSBtZWFudCBsYXN0IHRpbWUgaXMgdGhhdCB0aGVyZSBp
cyBzdGlsbCBhIGNoYW5nZSBoZXJlLiBJCj4gdW5kZXJzdGFuZCB0aGUgY29tbW9uIHBhcnRzIHlv
dSBhZGRyZXNzZWQgaW4gbXkgcHJldmlvdXMgcmV2aWV3LAo+IGJ1dCB5b3UncmUgc3RpbGwgbWlz
c2luZyB0aGlzLi4uCj4gCj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gb2N0ZW9uX2kyY19obGNf
Y21kX3NlbmQoaTJjLCBjbWQpOwo+ID4gK30KPiA+ICsKPiA+IMKgLyogaGlnaC1sZXZlbC1jb250
cm9sbGVyIGNvbXBvc2l0ZSB3cml0ZStyZWFkLCBtc2cwPWFkZHIsCj4gPiBtc2cxPWRhdGEgKi8K
PiA+IMKgc3RhdGljIGludCBvY3Rlb25faTJjX2hsY19jb21wX3JlYWQoc3RydWN0IG9jdGVvbl9p
MmMgKmkyYywgc3RydWN0Cj4gPiBpMmNfbXNnICptc2dzKQo+ID4gwqB7Cj4gPiBAQCAtNDk5LDI2
ICs1NDMsOCBAQCBzdGF0aWMgaW50IG9jdGVvbl9pMmNfaGxjX2NvbXBfcmVhZChzdHJ1Y3QKPiA+
IG9jdGVvbl9pMmMgKmkyYywgc3RydWN0IGkyY19tc2cgKm1zZ3MKPiA+IMKgwqDCoMKgwqDCoMKg
wqAvKiBBICovCj4gPiDCoMKgwqDCoMKgwqDCoMKgY21kIHw9ICh1NjQpKG1zZ3NbMF0uYWRkciAm
IDB4N2Z1bGwpIDw8IFNXX1RXU0lfQUREUl9TSElGVDsKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKg
wqBpZiAobXNnc1swXS5mbGFncyAmIEkyQ19NX1RFTikKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBjbWQgfD0gU1dfVFdTSV9PUF8xMF9JQTsKPiA+IC3CoMKgwqDCoMKgwqDCoGVs
c2UKPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbWQgfD0gU1dfVFdTSV9PUF83
X0lBOwo+ID4gLQo+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKG1zZ3NbMF0ubGVuID09IDIpIHsKPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1NjQgZXh0ID0gMDsKPiA+IC0KPiA+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjbWQgfD0gU1dfVFdTSV9FSUE7Cj4gPiAtwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZXh0ID0gKHU2NCltc2dzWzBdLmJ1ZlswXSA8PCBT
V19UV1NJX0lBX1NISUZUOwo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGNtZCB8
PSAodTY0KW1zZ3NbMF0uYnVmWzFdIDw8IFNXX1RXU0lfSUFfU0hJRlQ7Cj4gPiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgb2N0ZW9uX2kyY193cml0ZXFfZmx1c2goZXh0LCBpMmMtPnR3
c2lfYmFzZSArCj4gPiBTV19UV1NJX0VYVChpMmMpKTsKPiA+IC3CoMKgwqDCoMKgwqDCoH0gZWxz
ZSB7Cj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY21kIHw9ICh1NjQpbXNnc1sw
XS5idWZbMF0gPDwgU1dfVFdTSV9JQV9TSElGVDsKPiA+IC3CoMKgwqDCoMKgwqDCoH0KPiA+IC0K
PiA+IC3CoMKgwqDCoMKgwqDCoG9jdGVvbl9pMmNfaGxjX2ludF9jbGVhcihpMmMpOwo+ID4gLcKg
wqDCoMKgwqDCoMKgb2N0ZW9uX2kyY193cml0ZXFfZmx1c2goY21kLCBpMmMtPnR3c2lfYmFzZSAr
Cj4gPiBTV19UV1NJKGkyYykpOwo+IAo+IC4uLiB0aGlzISBXaGlsZSBJIGRvbuKAmXQga25vdyB0
aGUgaGFyZHdhcmUgaW50ZXJuYWxzLCB0aGlzIGlzIGEKPiBsb2dpY2FsIGNoYW5nZSB0aGF0IHJl
cXVpcmVzIGp1c3RpZmljYXRpb24sIGVzcGVjaWFsbHkgd2hlbgo+IGNvbXBhcmVkIHRvIHdoYXQg
eW914oCZdmUgZGVzY3JpYmVkIGluIHRoZSBjb21taXQgbWVzc2FnZS4KPiAKWWVzIHlvdSBhcmUg
cmlnaHQsIEkndmUgYWRkIHNvbWUgaW5mbyB0byB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gZGVzY3Jp
YmUKZXhhY3RseSB3aGF0IEknbSB0cnlpbmcgdG8gYWNoaWV2ZSBoZXJlLgoKPiBBbmRpCj4gCj4g
PiAtwqDCoMKgwqDCoMKgwqByZXQgPSBvY3Rlb25faTJjX2hsY193YWl0KGkyYyk7Cj4gPiArwqDC
oMKgwqDCoMKgwqAvKiBTZW5kIGNvcmUgY29tbWFuZCAqLwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0
ID0gb2N0ZW9uX2kyY19obGNfcmVhZF9jbWQoaTJjLCBtc2dzWzBdLCBjbWQpOwo+ID4gwqDCoMKg
wqDCoMKgwqDCoGlmIChyZXQpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdv
dG8gZXJyOwoKQXJ5YW4K

