Return-Path: <linux-i2c+bounces-3930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B178D901979
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 04:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A394C1C20C99
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 02:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F7263D0;
	Mon, 10 Jun 2024 02:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="133oPJTM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D275227
	for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2024 02:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717988353; cv=none; b=BhzZYDafybxdZYSkZFdfoU15uKK1uDlgsc/ZysR7lj21NTct4I9kZZ8IACrlH2wiRvRNJVQdcZK1thmwVVinA+AjMzKjx2Hqc2n/LrnYRkIybgOS/kxdLw+fAAnrKDhgXk0IYfxi4u2vAoK1YdCWTFJGxJzqQfgMaHIN2/IphQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717988353; c=relaxed/simple;
	bh=H9zDOxG7QtZKk6UH85iOw8EQTHImsc3WNvMKL/MtPOw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Kw66gmVMceTZXR3Dzdg2FvlCSIsbtOzHvT/dyqYi+fFHHzjkAMHboYMopzFrpFZepAQU5O/fE/1M6zZgeoqDXsVOkaUpfe6nKPywOlYN2DKyQCIPHgnhkaY0f11VZS10AS/9z09gAuAptBtnsFrVJb1MpD2qvkrfgaA+tk26P2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=133oPJTM; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 663C72C04C9;
	Mon, 10 Jun 2024 14:59:07 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1717988347;
	bh=H9zDOxG7QtZKk6UH85iOw8EQTHImsc3WNvMKL/MtPOw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=133oPJTM8+X91uXM0R8nUk4asTNfU94cgXtEZrGXdlod0IAno2YriKJp1/BDnUWyi
	 fJ+7wWw9tHZrOHDGsqsKXFFu7icow9S9IikcdTsDefNy+3WomwjYmSvXUnNK5WYHx4
	 pn5u3Q+L4QeYzgOTxKFnuTEUMykOTJgL5quj+MfwEUpbtqFhQEzktDQW83U0Ytqaqj
	 2NuABq+rB3jkVtwc7QaI3Boew7FRPKGjh1QUwhuWq6oTB/GIqJ8OU489ougFonC0IE
	 1zVXrz8uK3AaDYzEAuDUm/2MM4IiATFFLZWsbD4AtcVu8+yxvw7OWiJYa72KKoZYXQ
	 4l9R2zkTNrrgQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66666bfb0000>; Mon, 10 Jun 2024 14:59:07 +1200
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 10 Jun 2024 14:59:07 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Mon, 10 Jun 2024 14:59:06 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Mon, 10 Jun 2024 14:59:06 +1200
From: Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4] i2c: octeon: Add block-mode r/w
Thread-Topic: [PATCH v4] i2c: octeon: Add block-mode r/w
Thread-Index: AQHajs8vclxdDYMcJ02Vc766dOU8EbFpGZ6AgFbD6QA=
Date: Mon, 10 Jun 2024 02:59:06 +0000
Message-ID: <f25f212189f26e9d7bcde4902be8b9fb17e85092.camel@alliedtelesis.co.nz>
References: <20230905102234.nlaeskxbbvu74co2@zenone.zhora.eu>
	 <20240415005213.3477671-1-aryan.srivastava@alliedtelesis.co.nz>
	 <o6xuyvunkceihtx4aifryfwviedx26scmlahygw5blijodmtge@c5cyhfoez5qq>
In-Reply-To: <o6xuyvunkceihtx4aifryfwviedx26scmlahygw5blijodmtge@c5cyhfoez5qq>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <3006EFC2E90EC24C8CB3214B63D69DFF@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=F9L0dbhN c=1 sm=1 tr=0 ts=66666bfb a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=w1vUsAckAk8A:10 a=IkcTkHD0fZMA:10 a=T1WGqf2p2xoA:10 a=JuaPn8sHQKJUHuXBK5kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgQW5kaSwKClRoYW5rcyBmb3IgeW91ciBjb21tZW50cy4KT24gTW9uLCAyMDI0LTA0LTE1IGF0
IDIzOjU5ICswMjAwLCBBbmRpIFNoeXRpIHdyb3RlOgo+IEhpIEFyeWFuLAo+IAo+IE9uIE1vbiwg
QXByIDE1LCAyMDI0IGF0IDEyOjUyOjEzUE0gKzEyMDAsIEFyeWFuIFNyaXZhc3RhdmEgd3JvdGU6
Cj4gPiBBZGQgc3VwcG9ydCBmb3IgYmxvY2sgbW9kZSByZWFkL3dyaXRlIG9wZXJhdGlvbnMgb24K
PiA+IFRodW5kZXJ4IGNoaXBzLgo+ID4gCj4gPiBXaGVuIGF0dGVtcHRpbmcgci93IG9wZXJhdGlv
bnMgb2YgZ3JlYXRlciB0aGVuIDggYnl0ZXMKPiA+IGJsb2NrIG1vZGUgaXMgdXNlZCwgaW5zdGVh
ZCBvZiBwZXJmb3JtaW5nIGEgc2VyaWVzIG9mCj4gPiA4IGJ5dGUgcmVhZHMuCj4gCj4gQ2FuIHlv
dSBwbGVhc2UgYWRkIHNvbWUgbW9yZSBkZXNjcmlwdGlvbiBvZiB5b3VyIHBhdGNoIGhlcmUuCj4g
Cj4gSG93IGRpZCB5b3UgZG8gaXQ/IFdoaWNoIG1vZGVzIGhhdmUgeW91IGFkZGVkPyBXaGF0IGFy
ZSB0aGVzZQo+IG1vZGVzIGRvaW5nIGFuZCBob3cgdGhleSB3b3JrPwo+IAo+IFRoZSBwYXRjaCBp
cyBub3QgdGhlIGVhc2llc3QgaXRzZWxmIGFuZCB3aXRoIGxpdHRsZSBkZXNjcmlwdGlvbgo+IGlz
IHZlcnkgY2hhbGxlbmdpbmcgdG8gcmV2aWV3LiBQbGVhc2UgbWFrZSBteSBsaWZlIGVhc2llciA6
LSkKPiAKRG9uZS4KPiA+IFNpZ25lZC1vZmYtYnk6IEFyeWFuIFNyaXZhc3RhdmEKPiA+IDxhcnlh
bi5zcml2YXN0YXZhQGFsbGllZHRlbGVzaXMuY28ubno+Cj4gCj4gLi4uCj4gCj4gPiArc3RhdGlj
IHZvaWQgb2N0ZW9uX2kyY19ibG9ja19lbmFibGUoc3RydWN0IG9jdGVvbl9pMmMgKmkyYykKPiA+
ICt7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoaTJjLT5ibG9ja19lbmFibGVkIHx8ICFUV1NJX0JM
T0NLX0NUTChpMmMpKQo+IAo+IGRvZXMgdGhlIGJsb2NrX2N0bCByZWdpc3RlciBzdG9yZXMgdGhl
IGxlbmd0aCBvZiB0aGUgbWVzc2FnZT8KPiBJZiBpdCBnb2VzICcwJyBkb2VzIGl0IG1lYW4gdGhh
dCBpdCdzIHJlYWR5IGZvciBhIGJsb2NrIHRyYW5zZmVyPwo+IChzYW1lIHF1ZXN0aW9uIGZvciB0
aGUgZGlzYWJsZSBmdW5jdGlvbikuClRoaXMgaXMgc2ltcGx5IHRvIGNoZWNrIGlmIHRoZSBIVyBp
cyBjYXBhYmxlIGZvciBibG9jayB0cmFuc2FjdGlvbnMuCj4gCj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgaTJjLT5ibG9j
a19lbmFibGVkID0gdHJ1ZTsKPiA+ICvCoMKgwqDCoMKgwqDCoG9jdGVvbl9pMmNfd3JpdGVxX2Zs
dXNoKFRXU0lfTU9ERV9TVFJFVENICj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
fCBUV1NJX01PREVfQkxPQ0tfTU9ERSwgaTJjLT50d3NpX2Jhc2UgKwo+ID4gVFdTSV9NT0RFKGky
YykpOwo+ID4gK30KPiAKPiAuLi4KPiAKPiA+IEBAIC01NzksMTAgKzYxMiw3IEBAIHN0YXRpYyBp
bnQgb2N0ZW9uX2kyY19obGNfY29tcF93cml0ZShzdHJ1Y3QKPiA+IG9jdGVvbl9pMmMgKmkyYywg
c3RydWN0IGkyY19tc2cgKm1zZwo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChzZXRfZXh0KQo+ID4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBvY3Rlb25faTJjX3dyaXRlcV9mbHVzaChl
eHQsIGkyYy0+dHdzaV9iYXNlICsKPiA+IFNXX1RXU0lfRVhUKGkyYykpOwo+ID4gwqAKPiA+IC3C
oMKgwqDCoMKgwqDCoG9jdGVvbl9pMmNfaGxjX2ludF9jbGVhcihpMmMpOwo+ID4gLcKgwqDCoMKg
wqDCoMKgb2N0ZW9uX2kyY193cml0ZXFfZmx1c2goY21kLCBpMmMtPnR3c2lfYmFzZSArCj4gPiBT
V19UV1NJKGkyYykpOwo+ID4gLQo+ID4gLcKgwqDCoMKgwqDCoMKgcmV0ID0gb2N0ZW9uX2kyY19o
bGNfd2FpdChpMmMpOwo+ID4gK8KgwqDCoMKgwqDCoMKgcmV0ID0gb2N0ZW9uX2kyY19obGNfY21k
X3NlbmQoaTJjLCBjbWQpOwo+ID4gwqDCoMKgwqDCoMKgwqDCoGlmIChyZXQpCj4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGdvdG8gZXJyOwo+IAo+IENhbiB5b3UgcHV0IHRoZSBv
Y3Rlb25faTJjX2hsY19jb21wX3JlYWQvb2N0ZW9uX2kyY19obGNfY29tcF93cml0ZQo+IHJlZmFj
dG9yaW5nIGluIGEgZGlmZmVyZW50IHBhdGNoIGFzIGEgcHJlcGFyYXRvcnkgdG8gdGhpcyBvbmU/
Cj4gSXQncyBlYXNpZXIgdG8gcmV2aWV3Lgo+IAo+IFBsZWFzZSwgcmVtZW1iZXIgdG8ga2VlcCBw
YXRjaGVzIGxvZ2ljYWxseSBzZXBhcmF0ZWQgaW4gc21hbGxlcgo+IGNodW5rcy4KPiAKRG9uZS4K
PiA+IMKgCj4gPiBAQCAtNTk0LDYgKzYyNCwxMDYgQEAgc3RhdGljIGludCBvY3Rlb25faTJjX2hs
Y19jb21wX3dyaXRlKHN0cnVjdAo+ID4gb2N0ZW9uX2kyYyAqaTJjLCBzdHJ1Y3QgaTJjX21zZyAq
bXNnCj4gPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIHJldDsKPiA+IMKgfQo+ID4gwqAKPiA+ICsv
KioKPiA+ICsgKiBoaWdoLWxldmVsLWNvbnRyb2xsZXIgY29tcG9zaXRlIGJsb2NrIHdyaXRlK3Jl
YWQsIG1zZzA9YWRkciwKPiA+IG1zZzE9ZGF0YQo+IAo+IFRoaXMgbWVzc2FnZSBkb2Vzbid0IG1l
YW4gbXVjaC4gUGxlYXNlIGNoZWNrIHRoZSBET0MgZm9ybWF0dGluZwo+IGFuZCB0aGUgb3RoZXIg
ZnVuY3Rpb25zLCBhcyB3ZWxsLgo+IAo+IFJlbWVtYmVyIGdvb2QgY29tbWVudHMgYXJlIGhpZ2hs
eSBhcHByZWNpYXRlZC4KPiAKRG9uZS4KPiA+ICsgKiBVc2VkIGluIHRoZSBjYXNlIHdoZXJlIHRo
ZSBpMmMgeGZlciBpcyBmb3IgZ3JlYXRlciB0aGFuIDggYnl0ZXMKPiA+IG9mIHJlYWQgZGF0YS4K
PiA+ICsgKi8KPiAKPiAuLi4KPiAKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIHJlYWQgZGF0YSBpbiBG
SUZPICovCj4gPiArwqDCoMKgwqDCoMKgwqBvY3Rlb25faTJjX3dyaXRlcV9mbHVzaChUV1NJX0JM
T0NLX1NUU19SRVNFVF9QVFIsIGkyYy0KPiA+ID50d3NpX2Jhc2UgKyBUV1NJX0JMT0NLX1NUUyhp
MmMpKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoaW50IGkgPSAwOyBpIDwgbGVuOyBpICs9IDgp
IHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1NjQgcmQgPSBfX3Jhd19yZWFk
cShpMmMtPnR3c2lfYmFzZSArCj4gPiBUV1NJX0JMT0NLX0ZJRk8oaTJjKSk7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yIChpbnQgaiA9IDc7IGogPj0gMDsgai0tKQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBtc2dzWzFdLmJ1
ZltpICsgKDcgLSBqKV0gPSAocmQgPj4gKDggKiBqKSkKPiA+ICYgMHhmZjsKPiAKPiBMb29rcyBn
b29kLCBidXQgZG8geW91IG1pbmQgYSBjb21tZW50IGhlcmU/CkRvbmUsIGFsc28gYWRkZWQgZXhw
bGFuYXRpb24gaW4gY29tbWl0Lgo+IAo+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gKwo+ID4gK8Kg
wqDCoMKgwqDCoMKgb2N0ZW9uX2kyY19ibG9ja19kaXNhYmxlKGkyYyk7Cj4gPiArwqDCoMKgwqDC
oMKgwqByZXR1cm4gcmV0Owo+ID4gK30KPiAKPiAuLi4KPiAKPiA+ICvCoMKgwqDCoMKgwqDCoC8q
IFdyaXRlIG1zZyBpbnRvIEZJRk8gYnVmZmVyICovCj4gPiArwqDCoMKgwqDCoMKgwqBvY3Rlb25f
aTJjX3dyaXRlcV9mbHVzaChUV1NJX0JMT0NLX1NUU19SRVNFVF9QVFIsIGkyYy0KPiA+ID50d3Np
X2Jhc2UgKyBUV1NJX0JMT0NLX1NUUyhpMmMpKTsKPiA+ICvCoMKgwqDCoMKgwqDCoGZvciAoaW50
IGkgPSAwOyBpIDwgbGVuOyBpICs9IDgpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB1NjQgYnVmID0gMDsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3Ig
KGludCBqID0gNzsgaiA+PSAwOyBqLS0pCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGJ1ZiB8PSAobXNnc1sxXS5idWZbaSArICg3IC0gaildIDw8ICg4
ICoKPiA+IGopKTsKPiAKPiBhIGNvbW1lbnQgaGVyZT8KPiAKRG9uZS4KPiA+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBvY3Rlb25faTJjX3dyaXRlcV9mbHVzaChidWYsIGkyYy0+dHdz
aV9iYXNlICsKPiA+IFRXU0lfQkxPQ0tfRklGTyhpMmMpKTsKPiA+ICvCoMKgwqDCoMKgwqDCoH0K
PiA+ICvCoMKgwqDCoMKgwqDCoGlmIChzZXRfZXh0KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoG9jdGVvbl9pMmNfd3JpdGVxX2ZsdXNoKGV4dCwgaTJjLT50d3NpX2Jhc2UgKwo+
ID4gU1dfVFdTSV9FWFQoaTJjKSk7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqAvKiBTZW5kIGNv
bW1hbmQgdG8gY29yZSAoc2VuZCBkYXRhIGluIEZJRk8pICovCj4gPiArwqDCoMKgwqDCoMKgwqBy
ZXQgPSBvY3Rlb25faTJjX2hsY19jbWRfc2VuZChpMmMsIGNtZCk7Cj4gPiArwqDCoMKgwqDCoMKg
wqBpZiAocmV0KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiByZXQ7
Cj4gCj4gZG8gd2UgbmVlZCB0byBkaXNhYmxlIGFueXRoaW5nIGhlcmU/ClRoZXJlIGlzIGEgZGlz
YWJsZSBhdCB0aGUgYm90dG9tIG9mIHRoZSBmdW5jdGlvbiBmb3IgYmxvY2sgbW9kZS4KPiAKPiBU
aGFua3MgZm9yIHlvdXIgcGF0Y2gsCj4gQW5kaQo+IAo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKg
Y21kID0gX19yYXdfcmVhZHEoaTJjLT50d3NpX2Jhc2UgKyBTV19UV1NJKGkyYykpOwo+ID4gK8Kg
wqDCoMKgwqDCoMKgaWYgKChjbWQgJiBTV19UV1NJX1IpID09IDApCj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIG9jdGVvbl9pMmNfY2hlY2tfc3RhdHVzKGkyYywgZmFs
c2UpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgb2N0ZW9uX2kyY19ibG9ja19kaXNhYmxlKGky
Yyk7Cj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gcmV0Owo+ID4gK30KPiAKPiAuLi4KVGhhbmtz
LApBcnlhbi4K

