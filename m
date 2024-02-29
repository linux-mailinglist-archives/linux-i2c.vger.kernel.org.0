Return-Path: <linux-i2c+bounces-2080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A119286D646
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 22:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B984288376
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Feb 2024 21:40:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C5516FF5F;
	Thu, 29 Feb 2024 21:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="aK8P/ajy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDFB5025E
	for <linux-i2c@vger.kernel.org>; Thu, 29 Feb 2024 21:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709242853; cv=none; b=duK8RICzLQIXn6x9WGL894qI/r9PZLz8AW+bGJqmDRRUXw5kA989UXKClppqesZkYLK6gCXc8glcEu3cNdZHVQITXwcqtgvjS59+G15YGLPqeQJNiqXywDLhOfdiPgafEFcwXuvXF8DqqiGo9U+gvOgeoG1xYlHPtGLNFqaADg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709242853; c=relaxed/simple;
	bh=fhe/ofn1EKmGGMfurfxC5mf96CqQP9CEEHxjb0+86qU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P7KTvITeUelshOM2h3gTRrVquNOhPgF7TJ7pu8w3aq4n9OMzyAR46zH8PcC0T1oswbIQqBDm7rxEEB3dHD8d84G6/5MD/hl8Q7Bx4fzsTkoSDF4gxMfDOQSnQNNPxh1whibqwLT6qp3/RI0+e9NMb9vyEi5DyWjWH9IbtudGR5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=aK8P/ajy; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 57ED72C02AB;
	Fri,  1 Mar 2024 10:40:46 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1709242846;
	bh=fhe/ofn1EKmGGMfurfxC5mf96CqQP9CEEHxjb0+86qU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=aK8P/ajyFSWj40SJs0ggjqvK+ZH/jR5x14svlvnGkWtEf4AdnkAhzQYGjNh0Im6RJ
	 tlbRCJ8h+H0uFv3WjkWtj7deOxBltM9jMAtv84yScpdfqnU7BfVThtywc24auUbyUs
	 gVhon8SUM19uhNnIPpSoDApc2norBpnrKl7OA68DjvL6jRmY/hJrRsYQC8ygomqyNp
	 BqcHooclnHLVphdMdpl8DMg9u+S6aSYZaxwL0z7vLRlF+s8G2ru0n2YptwSRngAhPL
	 uYynd14g2Q3K+ynGqHXNg9XalOVB1poZqymgQNqrZYdsIFejUL+jRivrRveBYY7us4
	 00/qnP71CpAgg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65e0f9de0001>; Fri, 01 Mar 2024 10:40:46 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.40; Fri, 1 Mar 2024 10:40:46 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Fri, 1 Mar 2024 10:40:45 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Fri, 1 Mar 2024 10:40:45 +1300
From: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
CC: "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Subject: Re: [PATCH 1/1] i2c: acpi: Unbind mux adapters before delete
Thread-Topic: [PATCH 1/1] i2c: acpi: Unbind mux adapters before delete
Thread-Index: AQHaae9i75esa4M+fEexG2LDAyR1lLEgPLCAgADFaYA=
Date: Thu, 29 Feb 2024 21:40:45 +0000
Message-ID: <13fb90d652547eedb6e1b92dd59183e1109d9d37.camel@alliedtelesis.co.nz>
References: <20240228023925.2814638-1-hamish.martin@alliedtelesis.co.nz>
	 <20240228023925.2814638-2-hamish.martin@alliedtelesis.co.nz>
	 <20240229095411.GF8454@black.fi.intel.com>
In-Reply-To: <20240229095411.GF8454@black.fi.intel.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E494EE92CCF104CA56C8BF2CCFC7AD6@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65e0f9de a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=fzn4atkRgMAA:10 a=IkcTkHD0fZMA:10 a=K6JAEmCyrfEA:10 a=-fgA3zCWlboLx7rj-HcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

T24gVGh1LCAyMDI0LTAyLTI5IGF0IDExOjU0ICswMjAwLCBNaWthIFdlc3RlcmJlcmcgd3JvdGU6
Cj4gT24gV2VkLCBGZWIgMjgsIDIwMjQgYXQgMDM6Mzk6MjVQTSArMTMwMCwgSGFtaXNoIE1hcnRp
biB3cm90ZToKPiA+IFVuYmluZCBhbnkgaTJjX2FkYXB0ZXJzIG1hdGNoaW5nIGFuIEFDUEkgZGV2
aWNlIGJlaW5nIHJlbW92ZWQuIFRoaXMKPiA+IGVuc3VyZXMgdGhhdCB0aGUgbGlua2FnZSBiZXR3
ZWVuIHRoZSBBQ1BJIGRldmljZSBhbmQgdGhlCj4gPiBpMmNfYWRhcHRlciBpcwo+ID4gY29ycmVj
dGx5IGJyb2tlbiBiZWZvcmUgdGhlIEFDUEkgZGV2aWNlIGlzIGRlc3Ryb3llZC4KCj4gSSBzdWdn
ZXN0IHRvIG1vdmUgc29tZSBvZiB0aGUgaW5mb3JtYXRpb24gZnJvbSB0aGUgY292ZXIgbGV0dGVy
IGhlcmUKPiB0bwo+IG1ha2Ugc3VyZSBpdCBpcyBub3QgbG9zdC4gSXQgaW5jbHVkZXMgZ29vZCBh
bmFseXNpcyBvZiB0aGUgcHJvYmxlbSBzbwo+IHNob3VsZCBiZSBwYXJ0IG9mIHRoZSBjaGFuZ2Vs
b2cuCk9LLCB0aGFua3MgTWlrYS4gSSB3aWxsIGRvIHRoYXQuCgo+IAo+ID4gU2lnbmVkLW9mZi1i
eTogSGFtaXNoIE1hcnRpbiA8aGFtaXNoLm1hcnRpbkBhbGxpZWR0ZWxlc2lzLmNvLm56Pgo+ID4g
LS0tCj4gPiDCoGRyaXZlcnMvaTJjL2kyYy1jb3JlLWFjcGkuYyB8IDE5ICsrKysrKysrKysrKysr
Ky0tLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25z
KC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1hY3BpLmMgYi9k
cml2ZXJzL2kyYy9pMmMtY29yZS0KPiA+IGFjcGkuYwo+ID4gaW5kZXggZDYwMzdhMzI4NjY5Li42
N2ZhOGRlY2NlZjYgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1hY3BpLmMK
PiA+ICsrKyBiL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWFjcGkuYwo+ID4gQEAgLTQ0NSw2ICs0NDUs
MTEgQEAgc3RhdGljIHN0cnVjdCBpMmNfY2xpZW50Cj4gPiAqaTJjX2FjcGlfZmluZF9jbGllbnRf
YnlfYWRldihzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYpCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0
dXJuIGkyY19maW5kX2RldmljZV9ieV9md25vZGUoYWNwaV9md25vZGVfaGFuZGxlKGFkZXYpKTsK
PiA+IMKgfQo+ID4gwqAKPiA+ICtzdGF0aWMgc3RydWN0IGkyY19hZGFwdGVyICppMmNfYWNwaV9m
aW5kX2FkYXB0ZXJfYnlfYWRldihzdHJ1Y3QKPiA+IGFjcGlfZGV2aWNlICphZGV2KQo+ID4gK3sK
PiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybgo+ID4gaTJjX2ZpbmRfYWRhcHRlcl9ieV9md25vZGUo
YWNwaV9md25vZGVfaGFuZGxlKGFkZXYpKTsKPiA+ICt9Cj4gPiArCj4gPiDCoHN0YXRpYyBpbnQg
aTJjX2FjcGlfbm90aWZ5KHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsIHVuc2lnbmVkCj4gPiBs
b25nIHZhbHVlLAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB2b2lkICphcmcpCj4gPiDCoHsKPiA+IEBAIC00NzEsMTEgKzQ3NiwxNyBAQCBz
dGF0aWMgaW50IGkyY19hY3BpX25vdGlmeShzdHJ1Y3QKPiA+IG5vdGlmaWVyX2Jsb2NrICpuYiwg
dW5zaWduZWQgbG9uZyB2YWx1ZSwKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gwqAKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgY2xpZW50ID0gaTJjX2FjcGlfZmluZF9jbGllbnRfYnlfYWRldihhZGV2KTsKPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIWNsaWVudCkKPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYnJlYWs7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGNsaWVudCkgewo+ID4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoY2xp
ZW50KTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cHV0X2RldmljZSgmY2xpZW50LT5kZXYpOwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhZGFwdGVyID0g
aTJjX2FjcGlfZmluZF9hZGFwdGVyX2J5X2FkZXYoYWRldik7Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgaWYgKGFkYXB0ZXIpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYWNwaV9kZXZpY2Vfbm90aWZ5X3JlbW92ZSgmYWRhcHRl
ci0+ZGV2KTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgcHV0X2RldmljZSgmYWRhcHRlci0+ZGV2KTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB9Cj4gCj4gVGhpcyBsb29rcyBnb29kIHRvIG1lLiBJJ20ganVzdCB3b25kZXJpbmcg
d2hldGhlciB3ZSBoYXZlIHRoZSBzYW1lCj4gaXNzdWUKPiBvbiBEVCBzaWRlIHRvbz8KV2UgZG9u
J3Qgc2VlIHRoYXQuIFdlIGhhdmUgcGxlbnR5IG9mIHN5c3RlbXMgd2l0aCB0aGUgc2FtZSBiYXNp
YwpoYXJkd2FyZSBsYXlvdXQgdXNpbmcgZGV2aWNlIHRyZWUgYW5kIGRvbid0IG9ic2VydmUgdGhp
cyBraW5kIG9mIGlzc3VlLgoKPiAKPiA+IMKgCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgaTJjX3VucmVnaXN0ZXJfZGV2aWNlKGNsaWVudCk7Cj4gPiAtwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcHV0X2RldmljZSgmY2xpZW50LT5kZXYpOwo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBicmVhazsKPiA+IMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiDCoAo+
ID4gLS0gCj4gPiAyLjQzLjAKCg==

