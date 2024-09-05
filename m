Return-Path: <linux-i2c+bounces-6227-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C65B96D076
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 09:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B09431F215FD
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 07:33:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6793F193432;
	Thu,  5 Sep 2024 07:33:39 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75319146A72;
	Thu,  5 Sep 2024 07:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521619; cv=none; b=Y9mO6JeIRrz4JHS53R/BvD+nqa3KX5wlt3St1vG81tJK5yOX/uThb/Xj4vJrTJhfeZTiZthCzMIjrZSnY++Csbl5CnNgX282Xt7aURSGG2G+u6h0Fo6p2mln0FuNIPAd9vnI5x9GplqJ2hIKeBFad4iF16GdG9UrKLdXQ3w9LsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521619; c=relaxed/simple;
	bh=lQXjfigg+HsYXd8iVhyU+nKiUVkBXqAoH7mRtHr/PR8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dhZhQbhPrqzjBvKxAzlKzDXuJW3nmUwYyNHrdeNsuv0vV79P3c6ccbZwmrzxF/S4DjZth0cZxJU4raiBAiM2mQlqYlKRWvXPK8fJaMYzUK7q+eytEo3QsBUwVgmGz/0LQXmhNophvzvU21/+vNI/gq3ybO6gYN9XQ2bHnEFTwLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 4857W7XA033674
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 5 Sep 2024 15:32:07 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4WzrfG2c6nz7ZMlW;
	Thu,  5 Sep 2024 15:32:06 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Thu, 5 Sep 2024 15:32:06 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 15:32:06 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Thu, 5 Sep 2024 15:32:06 +0800
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
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBpMmM6IGRlc2lnbndhcmU6IGZpeCBtYXN0ZXIgaXMg?=
 =?gb2312?Q?holding_SCL_low_while_ENABLE_bit_is_disabled?=
Thread-Topic: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Index: AQHa/pXqYN5O6bu3D02ZGK2PUsfYN7JHECeAgAG68NA=
Date: Thu, 5 Sep 2024 07:32:06 +0000
Message-ID: <0498cff909fe4794b7827ad399cb4e43@siengine.com>
References: <20240904064224.2394-1-kimriver.liu@siengine.com>
 <ZthYwQfj3Vy6dU-S@smile.fi.intel.com>
In-Reply-To: <ZthYwQfj3Vy6dU-S@smile.fi.intel.com>
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
X-MAIL:mail03.siengine.com 4857W7XA033674

QW5keSBTaGV2Y2hlbmtvOiANCiAgVG9kYXksIEkgZm9sbG93ZWQgeW91ciBzdWdnZXN0aW9uIHRv
IHJlc2VuZCB0aGUgcGF0Y2gsIGJ1dCBJIGZvdW5kIHRoYXQgDQp0aGVyZSBpcyBhbiBpbmFjY3Vy
YXRlIGlzc3VlIHdpdGggZGV0ZXJtaW5pbmcgd2hldGhlciBpMmMgaXMgZW5hYmxlZCwNCkkgd2ls
bCB1cGRhdGUgdGhlIHBhdGNoIGFnYWluIHRoaXMgYWZ0ZXJub29uIGFuZCBzZW5kIGl0IHRvIHlv
dS4gVGhhbmsgeW91Lg0KDQo+ICAJYWJvcnRfbmVlZGVkID0gcmF3X2ludHJfc3RhdHMgJiBEV19J
Q19JTlRSX01TVF9PTl9IT0xEOw0KPiAgCWlmIChhYm9ydF9uZWVkZWQpIHsNCi0JCWlmICghZW5h
YmxlKSB7DQorCQlpZiAoIShlbmFibGUgJiBEV19JQ19FTkFCTEVfRU5BQkxFKSkgew0KIAkJCXJl
Z21hcF93cml0ZShkZXYtPm1hcCwgRFdfSUNfRU5BQkxFLCBEV19JQ19FTkFCTEVfRU5BQkxFKTsN
CiAJCQllbmFibGUgfD0gRFdfSUNfRU5BQkxFX0VOQUJMRTsNCg0KQmVzdCBSZWdhcmRzDQpLaW1y
aXZlci5saXUNCg0KLS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IEFuZHkgU2hldmNoZW5rbyA8
YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiANCreiy83KsbzkOiAyMDI0xOo51MI0
yNUgMjA6NTUNCsrVvP7IyzogTGl1IEtpbXJpdmVyL8H1vfC60yA8a2ltcml2ZXIubGl1QHNpZW5n
aW5lLmNvbT4NCrOty806IGphcmtrby5uaWt1bGFAbGludXguaW50ZWwuY29tOyBtaWthLndlc3Rl
cmJlcmdAbGludXguaW50ZWwuY29tOyBqc2RAc2VtaWhhbGYuY29tOyBhbmRpLnNoeXRpQGtlcm5l
bC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmcNCtb3zOI6IFJlOiBbUEFUQ0hdIGkyYzogZGVzaWdud2FyZTogZml4IG1hc3RlciBpcyBo
b2xkaW5nIFNDTCBsb3cgd2hpbGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZA0KDQpPbiBXZWQsIFNl
cCAwNCwgMjAyNCBhdCAwMjo0MjoyNFBNICswODAwLCBraW1yaXZlciBsaXUgd3JvdGU6DQo+IEZy
b206ICJraW1yaXZlci5saXUiIDxraW1yaXZlci5saXVAc2llbmdpbmUuY29tPg0KPiANCj4gRmFp
bHVyZSBpbiBub3JtYWwgU3RvcCBvcGVyYXRpb25hbCBwYXRoDQo+IA0KPiBUaGlzIGZhaWx1cmUg
aGFwcGVucyByYXJlbHkgYW5kIGlzIGhhcmQgdG8gcmVwcm9kdWNlLiBEZWJ1ZyB0cmFjZSANCj4g
c2hvd2VkIHRoYXQgSUNfU1RBVFVTIGhhZCB2YWx1ZSBvZiAweDIzIHdoZW4gU1RPUF9ERVQgb2Nj
dXJyZWQsIA0KPiBpbW1lZGlhdGVseSBkaXNhYmxlIEVOQUJMRSBiaXQgdGhhdCBjYW4gcmVzdWx0
IGluIA0KPiBJQ19SQVdfSU5UUl9TVEFULk1BU1RFUl9PTl9IT0xEIGhvbGRpbmcgU0NMIGxvdy4N
Cj4gDQo+IEZhaWx1cmUgaW4gRU5BQkxFIGJpdCBpcyBkaXNhYmxlZCBwYXRoDQo+IA0KPiBJdCB3
YXMgb2JzZXJ2ZWQgdGhhdCBtYXN0ZXIgaXMgaG9sZGluZyBTQ0wgbG93IGFuZCB0aGUgSUNfRU5B
QkxFIGlzIA0KPiBhbHJlYWR5IGRpc2FibGVkLCBFbmFibGUgQUJPUlQgYml0IGFuZCBFTkFCTEUg
Yml0IHNpbXVsdGFuZW91c2x5IA0KPiBjYW5ub3QgdGFrZSBlZmZlY3QuDQo+IA0KPiBDaGVjayBp
ZiB0aGUgbWFzdGVyIGlzIGhvbGRpbmcgU0NMIGxvdyBhZnRlciBFTkFCTEUgYml0IGlzIGFscmVh
ZHkgDQo+IGRpc2FibGVkLiBJZiBTQ0wgaXMgaGVsZCBsb3csIFRoZSBzb2Z0d2FyZSBjYW4gc2V0
IHRoaXMgQUJPUlQgYml0IG9ubHkgDQo+IHdoZW4gRU5BQkxFIGlzIGFscmVhZHkgc2V0o6xvdGhl
cndpc2UsDQo+IHRoZSBjb250cm9sbGVyIGlnbm9yZXMgYW55IHdyaXRlIHRvIEFCT1JUIGJpdC4g
V2hlbiB0aGUgYWJvcnQgaXMgZG9uZSwgDQo+IHRoZW4gcHJvY2VlZCB3aXRoIGRpc2FibGluZyB0
aGUgY29udHJvbGxlci4NCj4gDQo+IFRoZXNlIGtlcm5lbCBsb2dzIHNob3cgdXAgd2hlbmV2ZXIg
YW4gSTJDIHRyYW5zYWN0aW9uIGlzIGF0dGVtcHRlZCANCj4gYWZ0ZXIgdGhpcyBmYWlsdXJlLg0K
PiBpMmNfZGVzaWdud2FyZSBlOTVlMDAwMC5pMmM6IHRpbWVvdXQgaW4gZGlzYWJsaW5nIGFkYXB0
ZXIgDQo+IGkyY19kZXNpZ253YXJlIGU5NWUwMDAwLmkyYzogdGltZW91dCB3YWl0aW5nIGZvciBi
dXMgcmVhZHkNCj4gDQo+IFRoZSBwYXRjaCBjYW4gYmUgZml4IHRoZSBjb250cm9sbGVyIGNhbm5v
dCBiZSBkaXNhYmxlZCB3aGlsZSBTQ0wgaXMgDQo+IGhlbGQgbG93IGluIEVOQUJMRSBiaXQgaXMg
YWxyZWFkeSBkaXNhYmxlZC4NCg0KLi4uDQoNCj4gIAlhYm9ydF9uZWVkZWQgPSByYXdfaW50cl9z
dGF0cyAmIERXX0lDX0lOVFJfTVNUX09OX0hPTEQ7DQo+ICAJaWYgKGFib3J0X25lZWRlZCkgew0K
PiArCQlpZiAoIWVuYWJsZSkgew0KPiArCQkJcmVnbWFwX3dyaXRlKGRldi0+bWFwLCBEV19JQ19F
TkFCTEUsIERXX0lDX0VOQUJMRV9FTkFCTEUpOw0KPiArCQkJZW5hYmxlIHw9IERXX0lDX0VOQUJM
RV9FTkFCTEU7DQoNCj4gKwkJCXVzbGVlcF9yYW5nZSgyNSwgMTAwKTsNCg0KZnNsZWVwKCkNCg0K
QW5kIGFkZCBhIHNob3J0IGNvbW1lbnQgdG8gZXhwbGFpbiB0aGUgY2hvc2VuIHZhbHVlLg0KDQo+
ICsJCX0NCg0KLi4uDQoNCj4gK3N0YXRpYyBpbnQgaTJjX2R3X2NoZWNrX21zdF9hY3Rpdml0eShz
dHJ1Y3QgZHdfaTJjX2RldiAqZGV2KSB7DQo+ICsJdTMyIHN0YXR1cyA9IDA7DQo+ICsJaW50IHJl
dCA9IDA7DQo+ICsNCj4gKwlyZWdtYXBfcmVhZChkZXYtPm1hcCwgRFdfSUNfU1RBVFVTLCAmc3Rh
dHVzKTsNCj4gKwlpZiAoc3RhdHVzICYgRFdfSUNfU1RBVFVTX01BU1RFUl9BQ1RJVklUWSkgew0K
PiArCQlyZXQgPSByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQoZGV2LT5tYXAsIERXX0lDX1NUQVRV
Uywgc3RhdHVzLA0KPiArCQkJCSEoc3RhdHVzICYgRFdfSUNfU1RBVFVTX01BU1RFUl9BQ1RJVklU
WSksDQo+ICsJCQkJMTEwMCwgMjAwMDApOw0KPiArCQlpZiAocmV0KQ0KPiArCQkJZGV2X2Vycihk
ZXYtPmRldiwgImkyYyBtc3QgYWN0aXZpdHkgbm90IGlkbGUgJWRcbiIsIHJldCk7DQo+ICsJfQ0K
PiArDQo+ICsJcmV0dXJuIHJldDsNCg0KVGhpcyBjYW4gYmUgcmV3cml0dGVuIGFzDQoNCgl1MzIg
c3RhdHVzID0gMDsNCglpbnQgcmV0Ow0KDQoJcmVnbWFwX3JlYWQoZGV2LT5tYXAsIERXX0lDX1NU
QVRVUywgJnN0YXR1cyk7DQoJaWYgKCFzdGF0dXMgJiBEV19JQ19TVEFUVVNfTUFTVEVSX0FDVElW
SVRZKSkNCgkJcmV0dXJuIDA7DQoNCglyZXQgPSByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQoZGV2
LT5tYXAsIERXX0lDX1NUQVRVUywgc3RhdHVzLA0KCQkJIShzdGF0dXMgJiBEV19JQ19TVEFUVVNf
TUFTVEVSX0FDVElWSVRZKSwNCgkJCTExMDAsIDIwMDAwKTsNCglpZiAocmV0KQ0KCQlkZXZfZXJy
KGRldi0+ZGV2LCAiaTJjIG1zdCBhY3Rpdml0eSBub3QgaWRsZSAlZFxuIiwgcmV0KTsNCg0KCXJl
dHVybiByZXQ7DQoNCj4gK30NCg0KLi4uDQoNCj4gKwlyZXQgPSBpMmNfZHdfY2hlY2tfbXN0X2Fj
dGl2aXR5KGRldik7DQo+ICsJaWYgKCFyZXQpDQo+ICsJCV9faTJjX2R3X2Rpc2FibGVfbm93YWl0
KGRldik7DQoNCi4uLmJ1dCBsb29raW5nIGF0IHRoZSB1c2FnZSwgSSB0aGluayB0aGUgcHJvcGVy
IGlzIHRvIGhhdmUgdGhlIGFib3ZlIHRvIHJldHVybiBib29sZWFuLiBBbmQgYWxzbyB1cGRhdGUg
dGhlIG5hbWUgdG8gZm9sbG93IHRoZSB1c3VhbCBwYXR0ZXJuIGZvciBib29sZWFuIGhlbHBlcnMu
DQoNCnN0YXRpYyBib29sIGkyY19kd19pc19tc3RfaWRsaW5nKHN0cnVjdCBkd19pMmNfZGV2ICpk
ZXYpIC4uLg0KCWlmIChpMmNfZHdfaXNfbXN0X2lkbGluZyhkZXYpKQ0KCQlfX2kyY19kd19kaXNh
YmxlX25vd2FpdChkZXYpOw0KDQouLi4NCg0KQWxzbyB3aGF0IGRvZXMgdGhlIGhlY2sgIm1zdCIg
c3RhbmQgZm9yPyBQbGVhc2UsIHVzZSBkZWNyeXB0ZWQgd29yZHMgaW4gZnVuY3Rpb24gbmFtZXMg
YW5kIGVycm9yIG1lc3NhZ2VzLi4NCg0KLS0NCldpdGggQmVzdCBSZWdhcmRzLA0KQW5keSBTaGV2
Y2hlbmtvDQoNCg0K

