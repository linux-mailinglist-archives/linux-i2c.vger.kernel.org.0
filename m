Return-Path: <linux-i2c+bounces-6478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9E6973683
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 13:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CF712878B1
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0899E18EFD2;
	Tue, 10 Sep 2024 11:55:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3B118C003;
	Tue, 10 Sep 2024 11:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725969322; cv=none; b=YiqeXYOu3AoraaIqqoi61HifJT24/LWAICFpj/QmtKse7RrkYFn0JkT76B3dGA63L7XHzmIQHzT+cf2JYqeW5qX6odYvSfvKQRQWnFso8LuuTh7/Am8wwtjytwtNckjxj43NHblQgmAbnzjwWiWGAO8dSYu1Xw5oK4hlAF3IkKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725969322; c=relaxed/simple;
	bh=joWNMT0D6LwowNYPYBBSsBEyhHR8fxiSXgF15vYlk6I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U6nrbbL7906UM36UhyXSHXgEVCS2Xk6UPbKivfoUayKe9mUAcW3Qeuj1dufH1vkBfN0QdpqWNtqUjJabZuqgWPY7A9mcn1S6tFvQthPT5BI+tIsm0D9+0u0UMYipWNDBNx8ogAAqFIrFMVY6sNppSB1PPTKTNAx+q9kbz1KWKtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48ABsi2p074038
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 10 Sep 2024 19:54:44 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X32Dz6rjzz7ZMt3;
	Tue, 10 Sep 2024 19:54:43 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Tue, 10 Sep 2024 19:54:43 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Tue, 10 Sep 2024 19:54:43 +0800
From: =?gb2312?B?TGl1IEtpbXJpdmVyL8H1vfC60w==?= <kimriver.liu@siengine.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
CC: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "jsd@semihalf.com" <jsd@semihalf.com>,
        "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v8] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Topic: [PATCH v8] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Index: AQHbA0iDEXTpjDBp/E6xp/M7s9EaBrJQM8eAgACJC/D//51HAIAAjNPQ
Date: Tue, 10 Sep 2024 11:54:43 +0000
Message-ID: <40ee4f61d7cb4a3ebb683d498bb587f0@siengine.com>
References: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
 <ZuALQVyTBFugG0Sw@smile.fi.intel.com>
 <743187d2fde54a9ebf86d42e29eadfb4@siengine.com>
 <a2de8e23-d2a0-4585-8b51-2144801eeff8@linux.intel.com>
In-Reply-To: <a2de8e23-d2a0-4585-8b51-2144801eeff8@linux.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
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
X-MAIL:mail03.siengine.com 48ABsi2p074038

SGksIEphcmtrbw0KDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEphcmtr
byBOaWt1bGEgPGphcmtrby5uaWt1bGFAbGludXguaW50ZWwuY29tPiANCj5TZW50OiAyMDI0xOo5
1MIxMMjVIDE5OjIwDQo+VG86IExpdSBLaW1yaXZlci/B9b3wutMgPGtpbXJpdmVyLmxpdUBzaWVu
Z2luZS5jb20+OyBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVs
LmNvbT4NCj5DYzogbWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbTsganNkQHNlbWloYWxm
LmNvbTsgYW5kaS5zaHl0aUBrZXJuZWwub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSCB2OF0gaTJj
OiBkZXNpZ253YXJlOiBmaXggbWFzdGVyIGlzIGhvbGRpbmcgU0NMIGxvdyB3aGlsZSBFTkFCTEUg
Yml0IGlzIGRpc2FibGVkDQoNCj5PbiA5LzEwLzI0IDEyOjM4IFBNLCBMaXUgS2ltcml2ZXIvwfW9
8LrTIHdyb3RlOg0KPj4gSGkgQW5keSwNCj4+IA0KPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQo+Pj4gRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5p
bnRlbC5jb20+DQo+Pj4gU2VudDogMjAyNMTqOdTCMTDI1SAxNzowMw0KPj4+IFRvOiBMaXUgS2lt
cml2ZXIvwfW98LrTIDxraW1yaXZlci5saXVAc2llbmdpbmUuY29tPg0KPj4+IENjOiBqYXJra28u
bmlrdWxhQGxpbnV4LmludGVsLmNvbTsgbWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbTsg
DQo+Pj4ganNkQHNlbWloYWxmLmNvbTsgYW5kaS5zaHl0aUBrZXJuZWwub3JnOyBsaW51eC1pMmNA
dmdlci5rZXJuZWwub3JnOyANCj4+PiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+Pj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2OF0gaTJjOiBkZXNpZ253YXJlOiBmaXggbWFzdGVyIGlzIGhv
bGRpbmcgU0NMIA0KPj4+IGxvdyB3aGlsZSBFTkFCTEUgYml0IGlzIGRpc2FibGVkDQo+PiANCj4+
PiBPbiBUdWUsIFNlcCAxMCwgMjAyNCBhdCAwMjoxMzowOVBNICswODAwLCBLaW1yaXZlciBMaXUg
d3JvdGU6DQo+Pj4+IEl0IHdhcyBvYnNlcnZlZCBpc3N1aW5nIEFCT1JUIGJpdChJQ19FTkFCTEVb
MV0pIHdpbGwgbm90IHdvcmsgd2hlbg0KPj4+DQo+Pj4gIi4uLm9ic2VydmVkIHRoYXQgaXNzdWlu
Zy4uLiINCj4+PiAuLi5iaXQgKC4uLiINCj4+IA0KPj4gDQo+Pj4+IElDX0VOQUJMRSBpcyBhbHJl
YWR5IGRpc2FibGVkLg0KPj4+Pg0KPj4+PiBDaGVjayBpZiBFTkFCTEUgYml0KElDX0VOQUJMRVsw
XSkgaXMgZGlzYWJsZWQgd2hlbiB0aGUgbWFzdGVyIGlzDQo+PiANCj4+PiAiLi4uYml0ICguLi4i
DQo+Pj4gbWFzdGVyIC0tPiBjb250cm9sbGVyDQo+PiANCj4+ICAgVXBkYXRlIGl0IGluIFY5DQo+
PiANCj5QbGVhc2UgYWRkIGJhY2sgYWxzbyBrZXJuZWwgZXJyb3JzIHRoYXQgYXJlIHNob3duIHdo
ZW4gdGhlIGlzc3VlIG9jY3Vycy4gDQo+SSBzYXcgdGhvc2UgbWVudGlvbmVkIGluIHRoZSBjb21t
aXQgbG9nIGluIHNvbWUgZWFybGllciB2ZXJzaW9uIG9mIHRoZSBwYXRjaC4NCg0KVGhvc2UgbWF5
IGhlbHAgZ29vZ2xpbmcgdGhlIHNvbHV0aW9uIChpLmUuIHRoaXMgcGF0Y2gpIGlmIHNvbWVib2R5
IHNlZXMgc2ltaWxhciBlcnJvciBvbiB0aGVpciBIVy4NCiBPaw0KDQogQWRkIGJhY2sga2VybmVs
IGVycm9ycyBsb2dzIGluIFY5Og0KVGhlc2Uga2VybmVsIGxvZ3Mgc2hvdyB1cCB3aGVuZXZlciBh
biBJMkMgdHJhbnNhY3Rpb24gaXMNCmF0dGVtcHRlZCBhZnRlciB0aGlzIGZhaWx1cmUuDQppMmNf
ZGVzaWdud2FyZSBlOTVlMDAwMC5pMmM6IHRpbWVvdXQgaW4gZGlzYWJsaW5nIGFkYXB0ZXINCmky
Y19kZXNpZ253YXJlIGU5NWUwMDAwLmkyYzogdGltZW91dCB3YWl0aW5nIGZvciBidXMgcmVhZHkN
Cg0KVGhlIHBhdGNoIGNhbiBiZSBmaXggdGhlIGNvbnRyb2xsZXIgY2Fubm90IGJlIGRpc2FibGVk
IHdoaWxlDQpTQ0wgaXMgaGVsZCBsb3cgaW4gRU5BQkxFIGJpdCBpcyBhbHJlYWR5IGRpc2FibGVk
Lg0KDQpUaGFua3MhDQoNCkkgd2lsbCBiZSBvZmYgd29yaywgSWYgdGhlcmUgYXJlIHN0aWxsIGVt
YWlscyB0aGF0IEkgaGF2ZSBub3QgYmVlbiByZXBsaWVkIHRvLA0KSSB3aWxsIHJlcGx5IHRvIHlv
dXIgZW1haWwgaW1tZWRpYXRlbHkgYWZ0ZXIgZ29pbmcgdG8gd29yayB0b21vcnJvdy4NCi0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KQmVzdCBSZWdhcmRzDQpLaW1y
aXZlciBMaXUNCg==

