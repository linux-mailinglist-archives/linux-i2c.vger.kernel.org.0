Return-Path: <linux-i2c+bounces-6599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 396F0975E68
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 03:18:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01586285114
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 01:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B53601D545;
	Thu, 12 Sep 2024 01:18:01 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A042E3EB;
	Thu, 12 Sep 2024 01:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726103881; cv=none; b=uJ/2nM8/P/YCHGTDvfEJoQGX7TOqusBrUUEqhcNCrYzv46lF1jxCk2PXSebBiY4fw4uHLz5ZLMFK9Ea3HPfg0TMK7AQ6ArxwIFKWZBofmKTB+UbhyzpZ8xkHKniUBm2v6W+wOF45gxR14boFE+243bY7ivb7AkeWDBPGwBijSyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726103881; c=relaxed/simple;
	bh=i1ejyxt5d3OQ5H0dIINkfbDNH7V+lEU49m2JmIKFnAw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bybHg7xFMuiw+bvJkQi0orFN50Ejn9xyUMowftpTOsnX63dgvIeK9ldseztf3mrZ5XVJWpOMtKgVVmVYV8WolRhRqfnJLyynGyUYQwmRtdhxwJwfAkuaWKwKxCBRnODrl+RdSBjWSH3PMY5FFRJNSRyCq5fLdt+hPSyhFvce7gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48C1H9WF065468
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 12 Sep 2024 09:17:09 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X400N0xpCz7ZMtV;
	Thu, 12 Sep 2024 09:17:08 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Thu, 12 Sep 2024 09:17:08 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Thu, 12 Sep 2024 09:17:08 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Thu, 12 Sep 2024 09:17:08 +0800
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
Subject: RE: [PATCH v9] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Thread-Topic: [PATCH v9] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Thread-Index: AQHbBCZ5inqGZkJh9EaW81yTfE/+vrJSI/eAgAACKwCAATDBgA==
Date: Thu, 12 Sep 2024 01:17:08 +0000
Message-ID: <8115db78c21b4fb587be1dcfcbfd8d4d@siengine.com>
References: <69401183add8f79ee98b84c91983204df753a3e6.1726043461.git.kimriver.liu@siengine.com>
 <ZuGs8Vbd9zYuNo_U@smile.fi.intel.com> <ZuGuwhPvxbY5OqNg@smile.fi.intel.com>
In-Reply-To: <ZuGuwhPvxbY5OqNg@smile.fi.intel.com>
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
X-MAIL:mail03.siengine.com 48C1H9WF065468

SGkgQW5keQ0KDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEFuZHkgU2hl
dmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiANCj5TZW50OiAyMDI0
xOo51MIxMcjVIDIyOjUzDQo+VG86IExpdSBLaW1yaXZlci/B9b3wutMgPGtpbXJpdmVyLmxpdUBz
aWVuZ2luZS5jb20+DQo+Q2M6IGphcmtrby5uaWt1bGFAbGludXguaW50ZWwuY29tOyBtaWthLndl
c3RlcmJlcmdAbGludXguaW50ZWwuY29tOyBqc2RAc2VtaWhhbGYuY29tOyBhbmRpLnNoeXRpQGtl
cm5lbC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIIHY5XSBpMmM6IGRlc2lnbndhcmU6IGZpeCBj
b250cm9sbGVyIGlzIGhvbGRpbmcgU0NMIGxvdyB3aGlsZSBFTkFCTEUgYml0IGlzIGRpc2FibGVk
DQoNCj5PbiBXZWQsIFNlcCAxMSwgMjAyNCBhdCAwNTo0NTowNVBNICswMzAwLCBBbmR5IFNoZXZj
aGVua28gd3JvdGU6DQo+PiBPbiBXZWQsIFNlcCAxMSwgMjAyNCBhdCAwNDozOTo0NVBNICswODAw
LCBLaW1yaXZlciBMaXUgd3JvdGU6DQoNCj5GV0lXLCBiZWxvdyBhcmUgdGhlIGZpeGVzDQo+DQo+
Li4uDQo+DQo+PiA+ICsvKg0KPj4gPiArICogVGhpcyBmdW5jdGlvbnMgd2FpdHMgY29udHJvbGxl
ciBpZGxpbmcgYmVmb3JlIGRpc2FibGluZyBJMkMNCj4+ID4gKyAqIFdoZW4gdGhlIGNvbnRyb2xs
ZXIgaXMgbm90IGluIHRoZSBJRExFIHN0YXRlLA0KPj4gPiArICogTVNUX0FDVElWSVRZIGJpdCAo
SUNfU1RBVFVTWzVdKSBpcyBzZXQuDQo+PiA+ICsgKiBWYWx1ZXM6DQo+PiA+ICsgKiAweDEgKEFD
VElWRSk6IENvbnRyb2xsZXIgbm90IGlkbGUNCj4+ID4gKyAqIDB4MCAoSURMRSk6IENvbnRyb2xs
ZXIgaXMgaWRsZQ0KPj4gPiArICogVGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCBhZnRlciByZXR1cm5p
bmcgdGhlIGVuZCBvZiB0aGUgY3VycmVudCB0cmFuc2Zlcg0KPj4gPiArICogUmV0dXJuczoNCj4+
IA0KPj4gPiArICogUmV0dXJuIDAgYXMgY29udHJvbGxlciBJRExFDQo+PiA+ICsgKiBSZXR1cm4g
YSBuZWdhdGl2ZSBlcnJubyBhcyBjb250cm9sbGVyIEFDVElWRQ0KPg0KPiAqIEZhbHNlIHdoZW4g
Y29udHJvbGxlciBpcyBpbiBJRExFIHN0YXRlLg0KPiAqIFRydWUgd2hlbiBjb250cm9sbGVyIGlz
IGluIEFDVElWRSBzdGF0ZS4NCj4NCj4+IEJ1dCB3aHkgbm9uLWJvb2xlYW4gYWdhaW4/DQo+PiAN
Cj4+ID4gKyAqLw0KPj4gPiArc3RhdGljIGludCBpMmNfZHdfaXNfY29udHJvbGxlcl9hY3RpdmUo
c3RydWN0IGR3X2kyY19kZXYgKmRldikNCj4NCj5zdGF0aWMgYm9vbCBpMmNfZHdfaXNfY29udHJv
bGxlcl9hY3RpdmUoc3RydWN0IGR3X2kyY19kZXYgKmRldikNCj4NCj4+ID4gK3sNCj4+ID4gKwl1
MzIgc3RhdHVzOw0KPj4gPiArDQo+PiA+ICsJcmVnbWFwX3JlYWQoZGV2LT5tYXAsIERXX0lDX1NU
QVRVUywgJnN0YXR1cyk7DQo+PiA+ICsJaWYgKCEoc3RhdHVzICYgRFdfSUNfU1RBVFVTX01BU1RF
Ul9BQ1RJVklUWSkpDQo+PiA+ICsJCXJldHVybiAwOw0KPg0KPgkJcmV0dXJuIGZhbHNlOw0KPg0K
Pj4gPiArCXJldHVybiByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQoZGV2LT5tYXAsIERXX0lDX1NU
QVRVUywgc3RhdHVzLA0KPj4gPiArCQkJIShzdGF0dXMgJiBEV19JQ19TVEFUVVNfTUFTVEVSX0FD
VElWSVRZKSwNCj4+ID4gKwkJCTExMDAsIDIwMDAwKTsNCj4NCj4JCQkxMTAwLCAyMDAwMCkgIT0g
MDsNCj4NCj5BbHRlcm5hdGl2ZWx5DQo+DQo+CWludCByZXQ7DQo+CS4uLg0KPg0KPglyZXQgPSBy
ZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQoZGV2LT5tYXAsIERXX0lDX1NUQVRVUywgc3RhdHVzLA0K
PgkJCQkgICAgICAgIShzdGF0dXMgJiBEV19JQ19TVEFUVVNfTUFTVEVSX0FDVElWSVRZKSwNCj4J
CQkJICAgICAgIDExMDAsIDIwMDAwKTsNCj4JaWYgKHJldCkNCj4JCXJldHVybiB0cnVlOw0KPg0K
PglyZXR1cm4gZmFsc2U7DQo+DQo+IChBbHNvIG1pbmQgaW5kZW50YXRpb24gaW4gX3JlYWRfcG9s
bF90aW1lb3V0KCkgbGluZXMuKQ0KPg0KPj4gPiArfQ0KDQpTb3JyeS4NClRoYW5rcyBmb3IgeW91
ciBzdWdnZXN0aW9ucyBhbmQgc2NoZW1lLCBJIHdpbGwgdXBkYXRlIGluIHBhdGNoIHYxMCB0b2Rh
eS4NCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQpCZXN0IFJl
Z2FyZHMNCktpbXJpdmVyIExpdQ0KDQo=

