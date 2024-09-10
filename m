Return-Path: <linux-i2c+bounces-6470-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5049C972E29
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:40:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB4841F24D0E
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A24517BEAE;
	Tue, 10 Sep 2024 09:39:57 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8978118A6B9;
	Tue, 10 Sep 2024 09:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725961197; cv=none; b=B8TeGPURPYTQQ1PkGFwxxRXy/ylxwAb+wkw4PRRDxd8BDQm/+oWlMp5jzGgzZjVH52OTzlyhDVytHtzq7VT/CJCg0K+L68Kc1wTHAjxmPtXh1tzfmrKH5Ig+yGvRmGsvdRBeoUhXwviMCIWK5VGlBVL49wQtZyYvN4EFgPtb/Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725961197; c=relaxed/simple;
	bh=tuSR+pOdWEh9XLPcbqeRivV9c2oMf65AW91OEBJyZNk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=byOrgbmBNEXf3xO8NA+W8HsXGecN8laWo9o/OtlW/r3F8fICUlQ4ruHbqQbATWiJKzFkJ/lEGhLkLJ+YLL1mgPnRoiWWSMVvh6VqeIDOKokSAxUSuQ4FFtaun1HeAjDHG0kZobco8hLrsinFE40ORdRPZGKZSq544DLnrGWV8es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48A9csGc058224
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 10 Sep 2024 17:38:54 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X2zDF6SDnz7ZMt3;
	Tue, 10 Sep 2024 17:38:53 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Tue, 10 Sep 2024 17:38:53 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Tue, 10 Sep 2024 17:38:53 +0800
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
Subject: RE: [PATCH v8] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Topic: [PATCH v8] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Index: AQHbA0iDEXTpjDBp/E6xp/M7s9EaBrJQM8eAgACJC/A=
Date: Tue, 10 Sep 2024 09:38:53 +0000
Message-ID: <743187d2fde54a9ebf86d42e29eadfb4@siengine.com>
References: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
 <ZuALQVyTBFugG0Sw@smile.fi.intel.com>
In-Reply-To: <ZuALQVyTBFugG0Sw@smile.fi.intel.com>
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
X-MAIL:mail03.siengine.com 48A9csGc058224

SGkgQW5keSwNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQW5keSBTaGV2
Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IA0KPlNlbnQ6IDIwMjTE
6jnUwjEwyNUgMTc6MDMNCj5UbzogTGl1IEtpbXJpdmVyL8H1vfC60yA8a2ltcml2ZXIubGl1QHNp
ZW5naW5lLmNvbT4NCj5DYzogamFya2tvLm5pa3VsYUBsaW51eC5pbnRlbC5jb207IG1pa2Eud2Vz
dGVyYmVyZ0BsaW51eC5pbnRlbC5jb207IGpzZEBzZW1paGFsZi5jb207IGFuZGkuc2h5dGlAa2Vy
bmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjhdIGkyYzogZGVzaWdud2FyZTogZml4IG1h
c3RlciBpcyBob2xkaW5nIFNDTCBsb3cgd2hpbGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZA0KDQo+
T24gVHVlLCBTZXAgMTAsIDIwMjQgYXQgMDI6MTM6MDlQTSArMDgwMCwgS2ltcml2ZXIgTGl1IHdy
b3RlOg0KPj4gSXQgd2FzIG9ic2VydmVkIGlzc3VpbmcgQUJPUlQgYml0KElDX0VOQUJMRVsxXSkg
d2lsbCBub3Qgd29yayB3aGVuDQo+DQo+Ii4uLm9ic2VydmVkIHRoYXQgaXNzdWluZy4uLiINCj4u
Li5iaXQgKC4uLiINCg0KDQo+PiBJQ19FTkFCTEUgaXMgYWxyZWFkeSBkaXNhYmxlZC4NCj4+IA0K
Pj4gQ2hlY2sgaWYgRU5BQkxFIGJpdChJQ19FTkFCTEVbMF0pIGlzIGRpc2FibGVkIHdoZW4gdGhl
IG1hc3RlciBpcw0KDQo+Ii4uLmJpdCAoLi4uIg0KPm1hc3RlciAtLT4gY29udHJvbGxlcg0KDQog
VXBkYXRlIGl0IGluIFY5DQoNCj4+IGhvbGRpbmcgU0NMIGxvdy4gSWYgRU5BQkxFIGJpdCBpcyBk
aXNhYmxlZCwgdGhlIHNvZnR3YXJlIG5lZWQNCj4+IGVuYWJsZSBpdCBiZWZvcmUgdHJ5aW5nIHRv
IGlzc3VlIEFCT1JUIGJpdC4gb3RoZXJ3aXNlLA0KPj4gdGhlIGNvbnRyb2xsZXIgaWdub3JlcyBh
bnkgd3JpdGUgdG8gQUJPUlQgYml0Lg0KDQo+Rml4ZXMgdGFnPw0KDQogUGF0Y2ggcmViYXNlOiAg
b24gTGludXggdjYuMTEuMC1yYzYgKDg5ZjVlMTRkMDViKQ0KDQo+Li4uDQoNCj4+ICAJYWJvcnRf
bmVlZGVkID0gcmF3X2ludHJfc3RhdHMgJiBEV19JQ19JTlRSX01TVF9PTl9IT0xEOw0KPj4gIAlp
ZiAoYWJvcnRfbmVlZGVkKSB7DQo+PiArCQlpZiAoIShlbmFibGUgJiBEV19JQ19FTkFCTEVfRU5B
QkxFKSkgew0KPg0KPj4gKwkJCXJlZ21hcF93cml0ZShkZXYtPm1hcCwgRFdfSUNfRU5BQkxFLCBE
V19JQ19FTkFCTEVfRU5BQkxFKTsNCj4NCj5UaGlzIGNhbGwgbWlnaHQgYWxzbyBuZWVkIGEgb25l
IGxpbmUgY29tbWVudC4NCiAgTGFzdCBXZWRuZXNkYXkNCj4+ICsJCQllbmFibGUgfD0gRFdfSUNf
RU5BQkxFX0VOQUJMRTsNCg0KPk1vcmUgbmF0dXJhbCBpcyB0byBwdXQgdGhpcyBhZnRlciB0aGUg
ZnNsZWVwKCkgY2FsbC4gVGhlIHJhdGlvbmFsZSBpcyB0aGF0IGl0DQo+d2lsbCBiZSBlYXNpZXIg
dG8gc2VlIHdoYXQgZXhhY3RseSBpcyBnb2luZyB0byBiZSB3cml0dGVuIGJhY2sgdG8gdGhlDQo+
cmVnaXN0ZXIuDQogT2sgDQoNCj4+ICsJCQkvKg0KPj4gKwkJCSAqIFdhaXQgMTAgdGltZXMgdGhl
IHNpZ25hbGluZyBwZXJpb2Qgb2YgdGhlIGhpZ2hlc3QgSTJDDQo+ID4rCQkJICogdHJhbnNmZXIg
c3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIgKGZvciA0MDBLSHogdGhpcyBpcw0KPiA+KwkJCSAqIDI1
dXMpIHRvIGVuc3VyZSB0aGUgSTJDIEVOQUJMRSBiaXQgaXMgYWxyZWFkeSBzZXQNCj4+ICsJCQkg
KiBhcyBkZXNjcmliZWQgaW4gdGhlIERlc2lnbldhcmUgSTJDIGRhdGFib29rLg0KPj4gKwkJCSAq
Lw0KPiA+KwkJCWZzbGVlcChESVZfUk9VTkRfQ0xPU0VTVF9VTEwoMTAgKiBNSUNSTywgdC0+YnVz
X2ZyZXFfaHopKTsNCj4NCj4uLi5zb21ld2hlcmUgaGVyZS4uLg0KPg0KCU9rDQo+PiArCQl9DQo+
ICsNCj4+ICAJCXJlZ21hcF93cml0ZShkZXYtPm1hcCwgRFdfSUNfRU5BQkxFLCBlbmFibGUgfCBE
V19JQ19FTkFCTEVfQUJPUlQpOw0KDQouLi4NCg0KPj4gK3N0YXRpYyBib29sIGkyY19kd19pc19t
YXN0ZXJfaWRsaW5nKHN0cnVjdCBkd19pMmNfZGV2ICpkZXYpDQoNCj5Tb3JyeSBpZiBJIG1hZGUg
YSBtaXN0YWtlLCBidXQgYWdhaW4sIGxvb2tpbmcgYXQgdGhlIHVzYWdlIHlvdSBoYXZlIGFnYWlu
DQo+bmVnYXRpb24gaGVyZSBhbmQgdGhlcmUuLi4NCg0KPglpMmNfZHdfaXNfY29udHJvbGxlcl9h
Y3RpdmUNCg0KPiAobm90ZSBuZXcgdGVybWlub2xvZ3ksIGR1bm5vIGlmIGl0IG1ha2VzIHNlbnNl
IHN0YXJ0IHVzaW5nIGl0IGluIGZ1bmN0aW9uDQo+IG5hbWVzLCBhcyB3ZSBoYXZlIG1vcmUgb2Yg
dGhlbSBmb2xsb3dpbmcgb2xkIHN0eWxlKQ0KDQogTGFzdCB3ZWVrICwgWW91IHN1Z2dlc3RlZCB0
aGF0IEkgdXNlZCB0aGlzIGkyY19kd19pc19tYXN0ZXJfaWRsaW5nKGRldikNCg0KPj4gK3sNCj4+
ICsJdTMyIHN0YXR1czsNCj4+ICsNCj4+ICsJcmVnbWFwX3JlYWQoZGV2LT5tYXAsIERXX0lDX1NU
QVRVUywgJnN0YXR1cyk7DQo+PiArCWlmICghKHN0YXR1cyAmIERXX0lDX1NUQVRVU19NQVNURVJf
QUNUSVZJVFkpKQ0KPj4gKwkJcmV0dXJuIHRydWU7DQoNCgkJcmV0dXJuIGZhbHNlOw0KDQouLCwN
Cg0KPj4gKwlyZXR1cm4gIXJlZ21hcF9yZWFkX3BvbGxfdGltZW91dChkZXYtPm1hcCwgRFdfSUNf
U1RBVFVTLCBzdGF0dXMsDQo+PiArCQkJIShzdGF0dXMgJiBEV19JQ19TVEFUVVNfTUFTVEVSX0FD
VElWSVRZKSwNCj4+ICsJCQkxMTAwLCAyMDAwMCk7DQoNCj4uLi5hbmQgZHJvcCAhLg0KDQoNCiBX
ZSByZXByb2R1Y2UgdGhpcyBpc3N1ZSBpbiBSVEwgc2ltdWxhdGlvbihBYm91dCh+MTo1MDApIGlu
IG91ciBzb2MpLiBJdCBpcyBuZWNlc3NhcnkNCiB0byBhZGQgd2FpdGluZyBEV19JQ19TVEFUVVNf
TUFTVEVSX0FDVElWSVRZIGlkbGluZyBiZWZvcmUgZGlzYWJsaW5nIEkyQyB3aGVuIA0KIEkyQyB0
cmFuc2ZlciBjb21wbGV0ZWQuICBhcyBkZXNjcmliZWQgaW4gdGhlIERlc2lnbldhcmUNCiBJMkMg
ZGF0YWJvb2soRmxvd2NoYXJ0IGZvciBEV19hcGJfaTJjIENvbnRyb2xsZXIpDQoNCj4+ICt9DQoN
Ci4uLg0KDQo+PiArCS8qDQo+PiArCSAqIFRoaXMgaGFwcGVucyByYXJlbHkgYW5kIGlzIGhhcmQg
dG8gcmVwcm9kdWNlLiBEZWJ1ZyB0cmFjZQ0KDQo+UmFyZWx5IGhvdz8gUGVyaGFwcyBwdXQgYSBy
YXRpb24gaW4gdGhlIHBhcmVudGhlc2VzLCBsaWtlDQoNCj4iLi4ucmFyZWx5ICh+MToxMDApLi4u
Ig0KIEFib3V0KH4xOjUwMCkgaW4gb3VyIHNvYw0KDQo+PiArCSAqIHNob3dlZCB0aGF0IElDX1NU
QVRVUyBoYWQgdmFsdWUgb2YgMHgyMyB3aGVuIFNUT1BfREVUIG9jY3VycmVkLA0KPj4gKwkgKiBp
ZiBkaXNhYmxlIElDX0VOQUJMRS5FTkFCTEUgaW1tZWRpYXRlbHkgdGhhdCBjYW4gcmVzdWx0IGlu
DQo+PiArCSAqIElDX1JBV19JTlRSX1NUQVQuTUFTVEVSX09OX0hPTEQgaG9sZGluZyBTQ0wgbG93
Lg0KPj4gKwkgKi8NCj4+ICsJaWYgKCFpMmNfZHdfaXNfbWFzdGVyX2lkbGluZyhkZXYpKQ0KDQo+
Li4uYW5kIGhlcmUNCg0KPglpZiAoaTJjX2R3X2lzX2NvbnRyb2xsZXJfYWN0aXZlKGRldikpDQoN
Cj5CdXQgcGxlYXNlIGRvdWJsZSBjaGVjayB0aGF0IEkgaGF2ZW4ndCBtYWRlIGFueSBtaXN0YWtl
cyBpbiBhbGwgdGhpcyBsb2dpYy4NCg0KIExhc3Qgd2VlayAsIFlvdSBzdWdnZXN0ZWQgdGhhdCBJ
IHVzZWQgdGhpcyBpMmNfZHdfaXNfbWFzdGVyX2lkbGluZyhkZXYpDQoga2VlcCB1c2luZyBpMmNf
ZHdfaXNfbWFzdGVyX2lkbGluZyhkZXYpICwgT2s/DQoNCj4+ICsJCWRldl9lcnIoZGV2LT5kZXYs
ICJJMkMgbWFzdGVyIG5vdCBpZGxpbmdcbiIpOw0KDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQ0KQmVzdCBSZWdhcmRzDQpLaW1yaXZlciBMaXUNCg==

