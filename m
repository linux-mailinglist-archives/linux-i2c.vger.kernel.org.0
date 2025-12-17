Return-Path: <linux-i2c+bounces-14631-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 436BFCC96EE
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 20:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0C3AE3009B71
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 19:43:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C18C32F12B7;
	Wed, 17 Dec 2025 19:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="AsvNmFRJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46CD2F0692
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766000613; cv=none; b=Z59BRGbG0A05z+XWOO6powyfn+WWFDNFfeHYRQct0Q4MjDmIEGOlCTgx0ba2s3ou5Trr9zAjoxeuprmkxDbhWLiV28iWzjfyf+Vf5EuoemN8uLx2/1h7/juirLs/oCZD/OX4fUvCKnT00BJbGkUh/VY+CLEp64vr2R4WAPbMcO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766000613; c=relaxed/simple;
	bh=uyWT/Twi09SNfi4i+B9w56lA5SitWy8D+pbadChv5gs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LW8fZkZ7IyBH1LrqTijjGvITn+ZcDt4nHKI+Xdwa7SFI56FM0yX00JCZZm/H4nSUaWj8R6PW21hFe0uo1cx5BAT2v7r8AuHGaA2gqkNf/4139isL32jHF1/cQDaTCTT3Q6PcwPXG+VgwUKAzEr92AeTyOz/1GJk6iT03cH7dHcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=AsvNmFRJ; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BF4D62C03FB;
	Thu, 18 Dec 2025 08:43:28 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1766000608;
	bh=uyWT/Twi09SNfi4i+B9w56lA5SitWy8D+pbadChv5gs=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=AsvNmFRJ7vqrEbH8fy2hL1CLD8OT2GbfpOdI5VlgeYdoxHlyqAWiiTcMemcKGEiKH
	 aIAzA1KaLPhEw6qD7hM3YZ8RlI05HzSN3Xbr9XUyEv2mmdaSZHK3PFpgNcuE5Z1AUm
	 UkMdhLiy+Qu2N/7QeO5/F03pddGhr0x+b8HLNU+CczcbyMm26zCV1jFDZhEsycSUpb
	 Mp+7XIlSMDTBEwLd9/CMpw0GzRIhfTfsYoKkA2T2GzyjhFHlvd1wKAful/J97SsjEE
	 b+fI75UYeVI9LE9Sv01ihbgwIdqwBs4X5609kRv9sef41BjFy5MmBQ+I8wUv2syadO
	 XP8xqewCzvahQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B694307e00001>; Thu, 18 Dec 2025 08:43:28 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 18 Dec 2025 08:43:28 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.010; Thu, 18 Dec 2025 08:43:28 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Rosen Penev <rosenp@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: Andi Shyti <andi.shyti@kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] i2c: rtl9300: use of instead of fwnode
Thread-Topic: [PATCH 2/2] i2c: rtl9300: use of instead of fwnode
Thread-Index: AQHcbx6wUMI9AwPNDkiNYeIJ0mNaq7UlYqkA
Date: Wed, 17 Dec 2025 19:43:28 +0000
Message-ID: <e3276f37-a7e0-46f5-8f64-fa9e5919b5d8@alliedtelesis.co.nz>
References: <20251217063027.37987-1-rosenp@gmail.com>
 <20251217063027.37987-3-rosenp@gmail.com>
In-Reply-To: <20251217063027.37987-3-rosenp@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <EA6030EA8CC06440A447219A92FDBC29@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=XMSTShhE c=1 sm=1 tr=0 ts=694307e0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=drD7vYo3kbIA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=pGLkceISAAAA:8 a=P5TUbWidKFhoGcf1pQUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgUm9zZW4sDQoNCk9uIDE3LzEyLzIwMjUgMTk6MzAsIFJvc2VuIFBlbmV2IHdyb3RlOg0KPiBB
dm9pZHMgaGF2aW5nIHRvIHVzZSB0b19vZl9ub2RlIGFuZCBqdXN0IGFzc2lnbiBkaXJlY3RseS4g
VGhpcyBpcyBhbiBPRg0KPiBvbmx5IGRyaXZlciBhbnl3YXkuDQo+DQo+IFVzZSBfc2NvcGVkIGZv
ciB0aGUgZm9yIGVhY2ggbG9vcCB0byBhdm9pZCByZWZjb3VudCBsZWFrcy4NCj4NCj4gU2lnbmVk
LW9mZi1ieTogUm9zZW4gUGVuZXYgPHJvc2VucEBnbWFpbC5jb20+DQoNCkkgdGhvdWdodCB0aGUg
dHJlbmQgd2FzIHRvIG1vdmUgdG8gdGhlIG1vcmUgZ2VuZXJpYyBkZXZpY2UgcHJvcGVydGllcyAN
CnJhdGhlciB0aGFuIHVzaW5nIG9mXyBzcGVjaWZpYyBBUElzIHdoaWNoIGlzIHdoeSBJIHdyb3Rl
IHRoZSBkcml2ZXIgDQp1c2luZyB0aGVtLiBJIGFncmVlIHRoYXQgdGhpcyBkcml2ZXIgaXMgdW5s
aWtlbHkgdG8gYmUgdXNlZCBvbiBhbnkgDQpwbGF0Zm9ybSB0aGF0IGRvZXNuJ3QgdXNlIGEgZGV2
aWNlIHRyZWUgc28gaWYgQW5kaSBpcyBoYXBweSB3aXRoIHRoaXMgDQpJJ20gZmluZSB3aXRoIHRo
ZSBjaGFuZ2UuDQoNClJldmlld2VkLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFs
bGllZHRlbGVzaXMuY28ubno+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1y
dGw5MzAwLmMgfCA5ICsrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDUgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLXJ0bDkzMDAuYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcnRsOTMwMC5jDQo+IGluZGV4
IGYyYWEzNDFhN2NkZC4uNjcyY2I5NzgwNjZkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLXJ0bDkzMDAuYw0KPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJ0bDkz
MDAuYw0KPiBAQCAtMzcxLDcgKzM3MSw2IEBAIHN0YXRpYyBpbnQgcnRsOTMwMF9pMmNfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICB7DQo+ICAgCXN0cnVjdCBkZXZpY2Ug
KmRldiA9ICZwZGV2LT5kZXY7DQo+ICAgCXN0cnVjdCBydGw5MzAwX2kyYyAqaTJjOw0KPiAtCXN0
cnVjdCBmd25vZGVfaGFuZGxlICpjaGlsZDsNCj4gICAJY29uc3Qgc3RydWN0IHJ0bDkzMDBfaTJj
X2Rydl9kYXRhICpkcnZfZGF0YTsNCj4gICAJc3RydWN0IHJlZ19maWVsZCBmaWVsZHNbRl9OVU1f
RklFTERTXTsNCj4gICAJdTMyIGNsb2NrX2ZyZXEsIHNjbF9udW0sIHNkYV9udW07DQo+IEBAIC00
MTUsMTUgKzQxNCwxNSBAQCBzdGF0aWMgaW50IHJ0bDkzMDBfaTJjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgCQlyZXR1cm4gcmV0Ow0KPiAgIA0KPiAgIAlpID0gMDsN
Cj4gLQlkZXZpY2VfZm9yX2VhY2hfY2hpbGRfbm9kZShkZXYsIGNoaWxkKSB7DQo+ICsJZm9yX2Vh
Y2hfY2hpbGRfb2Zfbm9kZV9zY29wZWQoZGV2LT5vZl9ub2RlLCBjaGlsZCkgew0KPiAgIAkJc3Ry
dWN0IHJ0bDkzMDBfaTJjX2NoYW4gKmNoYW4gPSAmaTJjLT5jaGFuc1tpXTsNCj4gICAJCXN0cnVj
dCBpMmNfYWRhcHRlciAqYWRhcCA9ICZjaGFuLT5hZGFwOw0KPiAgIA0KPiAtCQlyZXQgPSBmd25v
ZGVfcHJvcGVydHlfcmVhZF91MzIoY2hpbGQsICJyZWciLCAmc2RhX251bSk7DQo+ICsJCXJldCA9
IG9mX3Byb3BlcnR5X3JlYWRfdTMyKGNoaWxkLCAicmVnIiwgJnNkYV9udW0pOw0KPiAgIAkJaWYg
KHJldCkNCj4gICAJCQlyZXR1cm4gcmV0Ow0KPiAgIA0KPiAtCQlyZXQgPSBmd25vZGVfcHJvcGVy
dHlfcmVhZF91MzIoY2hpbGQsICJjbG9jay1mcmVxdWVuY3kiLCAmY2xvY2tfZnJlcSk7DQo+ICsJ
CXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKGNoaWxkLCAiY2xvY2stZnJlcXVlbmN5IiwgJmNs
b2NrX2ZyZXEpOw0KPiAgIAkJaWYgKHJldCkNCj4gICAJCQljbG9ja19mcmVxID0gSTJDX01BWF9T
VEFOREFSRF9NT0RFX0ZSRVE7DQo+ICAgDQo+IEBAIC00NDksNyArNDQ4LDcgQEAgc3RhdGljIGlu
dCBydGw5MzAwX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgIAkJ
YWRhcC0+cmV0cmllcyA9IDM7DQo+ICAgCQlhZGFwLT5kZXYucGFyZW50ID0gZGV2Ow0KPiAgIAkJ
aTJjX3NldF9hZGFwZGF0YShhZGFwLCBjaGFuKTsNCj4gLQkJYWRhcC0+ZGV2Lm9mX25vZGUgPSB0
b19vZl9ub2RlKGNoaWxkKTsNCj4gKwkJYWRhcC0+ZGV2Lm9mX25vZGUgPSBjaGlsZDsNCj4gICAJ
CXNucHJpbnRmKGFkYXAtPm5hbWUsIHNpemVvZihhZGFwLT5uYW1lKSwgIiVzIFNEQSVkXG4iLCBk
ZXZfbmFtZShkZXYpLCBzZGFfbnVtKTsNCj4gICAJCWkrKzsNCj4gICA=

