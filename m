Return-Path: <linux-i2c+bounces-6349-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F07E79704BF
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 04:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9057F1F21FF5
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 02:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F02BB36B17;
	Sun,  8 Sep 2024 02:13:14 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CD2191;
	Sun,  8 Sep 2024 02:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725761594; cv=none; b=nFlcwI3d6+rwHV5s7sdCTdQGrlN5NQyXIpY8Y6QynnGp7+LxCpJFg8PSChPnBCA9qKK/4Omc2Gg5Wh3ZpVB/uLgMTS/Rww/GXHau7tObcJHLT9gDIwWi/Dr9hTqpH2VXC9TmsPZg1IK6Gkla99ESD4UUakQt2q2ckie7hWhc7Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725761594; c=relaxed/simple;
	bh=WqzbDKR6GXOuk03/2/5jl6FhCqgvBHOQ2H5BdaMpLGg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TCK5YxYPYE6IZu0DofAD2JT2MC1yblSWNTlmmW4LOG3G+Cx3ufJ0rWtjHCDe65sgh229SycyMGFYB7ZqkGOt/JNh4Qr0c8KeuEF7GZs6yVe613khE4FxI7LK2OiO8nd15nW2siXciiiT2DI1o/CWeCeb6CSF1+2UtfsES9SOJcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 4882CFaI022342
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 8 Sep 2024 10:12:15 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X1YPp5SxYz7ZMkV;
	Sun,  8 Sep 2024 10:12:14 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Sun, 8 Sep 2024 10:12:14 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Sun, 8 Sep 2024 10:12:14 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Sun, 8 Sep 2024 10:12:14 +0800
From: =?gb2312?B?TGl1IEtpbXJpdmVyL8H1vfC60w==?= <kimriver.liu@siengine.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "jsd@semihalf.com" <jsd@semihalf.com>,
        "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Topic: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Index: AQHbAB/tMHVn0GKznECMQUomDNk4CrJKHtOAgAKD2rA=
Date: Sun, 8 Sep 2024 02:12:14 +0000
Message-ID: <6392ecd3f9934e9d8641b5f608ee6d60@siengine.com>
References: <20240906054250.2745-1-kimriver.liu@siengine.com>
 <Ztrr4-igQ20gu0VS@smile.fi.intel.com>
In-Reply-To: <Ztrr4-igQ20gu0VS@smile.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-DKIM-Results: [10.8.1.61]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:mail03.siengine.com 4882CFaI022342

SGksDQogSSBhbSBzb3JyeSBmb3Igbm90IHJlcGx5aW5nIHRvIHF1ZXN0aW9ucyBpbiB0aW1lLCB3
aGVuIEkgbGVmdCB0aGUgb2ZmaWNlIGVhcmx5IG9uIEZyaWRheS4NCiBJIHNpbmNlcmVseSBhcG9s
b2dpemUgdG8geW91IGFnYWluLg0KDQotLS0tLdPKvP7Urbz+LS0tLS0NCreivP7IyzogQW5keSBT
aGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IA0Kt6LLzcqxvOQ6
IDIwMjTE6jnUwjbI1SAxOTo0OA0KytW8/sjLOiBMaXUgS2ltcml2ZXIvwfW98LrTIDxraW1yaXZl
ci5saXVAc2llbmdpbmUuY29tPg0Ks63LzTogamFya2tvLm5pa3VsYUBsaW51eC5pbnRlbC5jb207
IG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb207IGpzZEBzZW1paGFsZi5jb207IGFuZGku
c2h5dGlAa2VybmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZw0K1vfM4jogUmU6IFtQQVRDSF0gaTJjOiBkZXNpZ253YXJlOiBmaXgg
bWFzdGVyIGlzIGhvbGRpbmcgU0NMIGxvdyB3aGlsZSBFTkFCTEUgYml0IGlzIGRpc2FibGVkDQoN
Ck9uIEZyaSwgU2VwIDA2LCAyMDI0IGF0IDAxOjQyOjUwUE0gKzA4MDAsIEtpbXJpdmVyIExpdSB3
cm90ZToNCj4gSXQgd2FzIG9ic2VydmVkIGlzc3VpbmcgQUJPUlQgYml0KElDX0VOQUJMRVsxXSkg
d2lsbCBub3Qgd29yayB3aGVuIA0KPiBJQ19FTkFCTEUgaXMgYWxyZWFkeSBkaXNhYmxlZC4NCj4g
DQo+IENoZWNrIGlmIEVOQUJMRSBiaXQoSUNfRU5BQkxFWzBdKSBpcyBkaXNhYmxlZCB3aGVuIHRo
ZSBtYXN0ZXIgaXMgDQo+IGhvbGRpbmcgU0NMIGxvdy4gSWYgRU5BQkxFIGJpdCBpcyBkaXNhYmxl
ZCwgdGhlIHNvZnR3YXJlIG5lZWQgZW5hYmxlIA0KPiBpdCBiZWZvcmUgdHJ5aW5nIHRvIGlzc3Vl
IEFCT1JUIGJpdC4gb3RoZXJ3aXNlLCB0aGUgY29udHJvbGxlciBpZ25vcmVzIA0KPiBhbnkgd3Jp
dGUgdG8gQUJPUlQgYml0DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLaW1yaXZlciBMaXUgPGtpbXJp
dmVyLmxpdUBzaWVuZ2luZS5jb20+DQo+IA0KPiAtLS0NCg0KPiBWMy0+VjQ6DQoNCj5OaWNlLCBi
dXQgdGhlIFN1YmplY3QgKHdoaWNoIGlzIG1vc3QgaW1wb3J0YW50IHBhcnQpIHN0aWxsIGhhcyBu
byB2ZXJzaW9uaW5nIDotKA0KDQogVGhhbmtzIG9yIHlvdXIgZ3VpZGFuY2UuDQogT04gTW9uZGF5
ICwgSSB3aWxsIHVwZGF0ZSB0aGUgU3ViamVjdCB2ZXJzaW9uaW5nIGFuZCByZXNlbmQgVjcgcGF0
Y2g6ICANCiBbUEFUQ0ggVjddIGkyYzogZGVzaWdud2FyZTogZml4IG1hc3RlciBpcyBob2xkaW5n
IFNDTCBsb3cgd2hpbGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZA0KDQo+ICAgICAgIDEuIHVwZGF0
ZSBjb21taXQgbWVzc2FnZXMgYW5kIGFkZCBwYXRjaCB2ZXJzaW9uIGFuZCBjaGFuZ2Vsb2cNCj4g
ICAgICAgMi4gbW92ZSBwcmludCB0aGUgZXJyb3IgbWVzc2FnZSBpbiBpMmNfZHdfeGZlcg0KPiBW
Mi0+VjM6IGNoYW5nZSAoIWVuYWJsZSkgdG8gKCEoZW5hYmxlICYgRFdfSUNfRU5BQkxFX0VOQUJM
RSkpDQo+IFYxLT5WMjogdXNlZCBzdGFuZGFyZCB3b3JkcyBpbiBmdW5jdGlvbiBuYW1lcyBhbmQg
YWRkcmVzc2VkIHJldmlldyANCj4gVjEtPmNvbW1lbnRzDQoNCi4uLg0KDQo+ICsJCQkvKg0KPiAr
CQkJICogV2FpdCB0d28gaWNfY2xrIGRlbGF5IHdoZW4gZW5hYmxpbmcgdGhlIGkyYyB0byBlbnN1
cmUgRU5BQkxFIGJpdA0KPiArCQkJICogaXMgYWxyZWFkeSBzZXQgYnkgdGhlIGRyaXZlciAoZm9y
IDQwMEtIeiB0aGlzIGlzIDI1dXMpDQo+ICsJCQkgKiBhcyBkZXNjcmliZWQgaW4gdGhlIERlc2ln
bldhcmUgSTJDIGRhdGFib29rLg0KPiArCQkJICovDQo+ICsJCQlmc2xlZXAoMjUpOw0KDQo+QW5k
IGlmIHdlIHVzZSAxMDBrSHo/DQo+UGxlYXNlLCBjYWxjdWxhdGUgdGhpcyBkZWxheSBiYXNlZCBv
biB0aGUgYWN0dWFsIHNwZWVkIGluIHVzZSAob3IgYWJvdXQgdG8gYmUgaW4gdXNlKS4NCg0KWWVz
LCBJIHdpbGwgY2hhbmdlIGZzbGVlcCgyNSkgdG8gdXNsZWVwX3JhbmdlKDI1LCAyNTApLCBmb3Ig
bmV4dCBWNyB2ZXJzaW9uLg0KV2FpdCAxMCB0aW1lcyB0aGUgc2lnbmFsaW5nIHBlcmlvZCBvZiB0
aGUgaGlnaGVzdCBJMkMgdHJhbnNmZXIgc3VwcG9ydGVkDQpieSB0aGUgZHJpdmVyIChmb3IgNDAw
S0h6IHRoaXMgaXMqIDI1dXMpDQoNCj4gKwkJfQ0KDQotLS0tLS0tLS0tLS0tLS0NCktpbXJpdmVy
IExpdQ0KDQo=

