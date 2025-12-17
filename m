Return-Path: <linux-i2c+bounces-14632-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A76D2CC9700
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 20:47:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7361030572DD
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Dec 2025 19:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F38FB2F60CC;
	Wed, 17 Dec 2025 19:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="gqunuTJu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5943D2D7DD1
	for <linux-i2c@vger.kernel.org>; Wed, 17 Dec 2025 19:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766000834; cv=none; b=t8tc5dqLJQ8bdCUKtLiBP9C9S5tVzzaoxnxz1wgJ850DU7C+hhqhS+/BPMM88Ed+X/skHTBuw6ViYNX1NGFdVmnykyyzJqZ2MUCSqUedDC0s7LrNK/Ko4mwYwn79oFqZj7YRVJAu00fU0MOFyi+yWmzXh6YDqsjA1XqVux0GzLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766000834; c=relaxed/simple;
	bh=KJlDs1A38kQHLXJLZrk46KfCxoK7OaauVkBgN0+FiJo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TzFMKeSkjqVzv5nZF0yYNe5Uo8km5yUvWjh/MQU0I2xW+QtrVWkr1P0evbbovhG1oXIemNHdJuXmd9S0ozeuwlP8xpblTasE7SGL3CnlZYJYN/Cq7tKqKOjnmtARoDOA1+lQVTFcolpZ/4x32shySYJ/fp6La+PrnDx74Z+niEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=gqunuTJu; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8D1DC2C038E;
	Thu, 18 Dec 2025 08:39:59 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1766000399;
	bh=KJlDs1A38kQHLXJLZrk46KfCxoK7OaauVkBgN0+FiJo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gqunuTJun/9eWLnSA3Ohax0lu74zg87AlnwhNgBIpSeYlpPePoObzK7msb8OCho1y
	 lJf8vJFKoJKdGwv8goS86o2KLZpm/xARQYe+TcGM7IDItSeqZhnYxIMT1IHgKyjdhg
	 PB94yAq1hVZufWCH8AmnHsmZgx9e0atDmfdSPl1Q+BLPE/dQs2MpABjZtJxcspkNiA
	 fpVyS+uZaJfyWy7DP6Y8FhWkE/2qk3FFTV3W9R/I7UEmJ/hqsZpBdSe1Y/ohr8Yrlh
	 ZillJQlsfCqQRUjT0rjLr/stSqM8qf8xWlQmCxD3G6zoC0nGD+foB7/Ew3YzQC6yWR
	 0Z2RYC2TkLRbw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6943070f0001>; Thu, 18 Dec 2025 08:39:59 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 18 Dec 2025 08:39:59 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1748.010; Thu, 18 Dec 2025 08:39:59 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Rosen Penev <rosenp@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: Andi Shyti <andi.shyti@kernel.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: rtl9300: remove const cast
Thread-Topic: [PATCH 1/2] i2c: rtl9300: remove const cast
Thread-Index: AQHcbx6vmLmPN+ai60yUXcIrL3dHHbUlYbCA
Date: Wed, 17 Dec 2025 19:39:59 +0000
Message-ID: <dd2c0c2d-5a1e-46a8-9c5a-90d0330efd9a@alliedtelesis.co.nz>
References: <20251217063027.37987-1-rosenp@gmail.com>
 <20251217063027.37987-2-rosenp@gmail.com>
In-Reply-To: <20251217063027.37987-2-rosenp@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <6E8A458018E8A742B6E80D5D32D7FECB@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=XMSTShhE c=1 sm=1 tr=0 ts=6943070f a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=drD7vYo3kbIA:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=pGLkceISAAAA:8 a=Dw-2Dg0FSfONaq_MROYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgUm9zZW4sDQoNCk9uIDE3LzEyLzIwMjUgMTk6MzAsIFJvc2VuIFBlbmV2IHdyb3RlOg0KPiBU
aGVzZSBjYXN0cyBhcmUgdXNlZCB0byByZW1vdmUgY29uc3QgZm9yIG5vIGdvb2QgcmVhc29uLiBG
aXggdGhlIHR5cGVzDQo+IGluc3RlYWQuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IFJvc2VuIFBlbmV2
IDxyb3NlbnBAZ21haWwuY29tPg0KUmV2aWV3ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBh
Y2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLXJ0bDkzMDAuYyB8IDggKysrKy0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMv
YnVzc2VzL2kyYy1ydGw5MzAwLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXJ0bDkzMDAuYw0K
PiBpbmRleCA0NzIzZTQ4Y2ZlMTguLmYyYWEzNDFhN2NkZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1ydGw5MzAwLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1ydGw5MzAwLmMNCj4gQEAgLTEyOSw3ICsxMjksNyBAQCBzdGF0aWMgaW50IHJ0bDkzMTBfaTJj
X3NlbGVjdF9zY2woc3RydWN0IHJ0bDkzMDBfaTJjICppMmMsIHU4IHNjbCkNCj4gICANCj4gICBz
dGF0aWMgaW50IHJ0bDkzMDBfaTJjX2NvbmZpZ19jaGFuKHN0cnVjdCBydGw5MzAwX2kyYyAqaTJj
LCBzdHJ1Y3QgcnRsOTMwMF9pMmNfY2hhbiAqY2hhbikNCj4gICB7DQo+IC0Jc3RydWN0IHJ0bDkz
MDBfaTJjX2Rydl9kYXRhICpkcnZfZGF0YTsNCj4gKwljb25zdCBzdHJ1Y3QgcnRsOTMwMF9pMmNf
ZHJ2X2RhdGEgKmRydl9kYXRhOw0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0KPiAgIAlpZiAoaTJjLT5z
ZGFfbnVtID09IGNoYW4tPnNkYV9udW0pDQo+IEBAIC0xMzksNyArMTM5LDcgQEAgc3RhdGljIGlu
dCBydGw5MzAwX2kyY19jb25maWdfY2hhbihzdHJ1Y3QgcnRsOTMwMF9pMmMgKmkyYywgc3RydWN0
IHJ0bDkzMDBfaTJjX2MNCj4gICAJaWYgKHJldCkNCj4gICAJCXJldHVybiByZXQ7DQo+ICAgDQo+
IC0JZHJ2X2RhdGEgPSAoc3RydWN0IHJ0bDkzMDBfaTJjX2Rydl9kYXRhICopZGV2aWNlX2dldF9t
YXRjaF9kYXRhKGkyYy0+ZGV2KTsNCj4gKwlkcnZfZGF0YSA9IGRldmljZV9nZXRfbWF0Y2hfZGF0
YShpMmMtPmRldik7DQo+ICAgCXJldCA9IGRydl9kYXRhLT5zZWxlY3Rfc2NsKGkyYywgaTJjLT5z
Y2xfbnVtKTsNCj4gICAJaWYgKHJldCkNCj4gICAJCXJldHVybiByZXQ7DQo+IEBAIC0zNzIsNyAr
MzcyLDcgQEAgc3RhdGljIGludCBydGw5MzAwX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPiAgIAlz
dHJ1Y3QgcnRsOTMwMF9pMmMgKmkyYzsNCj4gICAJc3RydWN0IGZ3bm9kZV9oYW5kbGUgKmNoaWxk
Ow0KPiAtCXN0cnVjdCBydGw5MzAwX2kyY19kcnZfZGF0YSAqZHJ2X2RhdGE7DQo+ICsJY29uc3Qg
c3RydWN0IHJ0bDkzMDBfaTJjX2Rydl9kYXRhICpkcnZfZGF0YTsNCj4gICAJc3RydWN0IHJlZ19m
aWVsZCBmaWVsZHNbRl9OVU1fRklFTERTXTsNCj4gICAJdTMyIGNsb2NrX2ZyZXEsIHNjbF9udW0s
IHNkYV9udW07DQo+ICAgCWludCByZXQsIGkgPSAwOw0KPiBAQCAtMzk5LDcgKzM5OSw3IEBAIHN0
YXRpYyBpbnQgcnRsOTMwMF9pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikN
Cj4gICANCj4gICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgaTJjKTsNCj4gICANCj4gLQlk
cnZfZGF0YSA9IChzdHJ1Y3QgcnRsOTMwMF9pMmNfZHJ2X2RhdGEgKilkZXZpY2VfZ2V0X21hdGNo
X2RhdGEoaTJjLT5kZXYpOw0KPiArCWRydl9kYXRhID0gZGV2aWNlX2dldF9tYXRjaF9kYXRhKGky
Yy0+ZGV2KTsNCj4gICAJaWYgKGRldmljZV9nZXRfY2hpbGRfbm9kZV9jb3VudChkZXYpID4gZHJ2
X2RhdGEtPm1heF9uY2hhbikNCj4gICAJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZB
TCwgIlRvbyBtYW55IGNoYW5uZWxzXG4iKTsNCj4gICA=

