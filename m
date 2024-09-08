Return-Path: <linux-i2c+bounces-6350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D54439704DC
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 04:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A7991C20ECD
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 02:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203881803E;
	Sun,  8 Sep 2024 02:40:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D5B33C5;
	Sun,  8 Sep 2024 02:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725763241; cv=none; b=Gq+SDnv84i4Gucg7LQ0jFKX4ThVPYfZz7zflIGXqxJAEOeVK/V6ViZaGwn8BWMN7hBGZ6/aqaSUOvK6qyafnEMHLIdI2Pge2Cy28nq7chppTUsLkPsBOU8UBMAqCS9u/Nbb39ONg9p2G6SUSa/5de9JAqAJirPh7AQQg19IQ364=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725763241; c=relaxed/simple;
	bh=9h14hdjvsJvyeLLJrfX6660rmVaeCeMYxBJ7mQEL2I4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uH0o2LJQCk5iJayHVXw/K+Pe4NiP7DkrKMfZkG/hTmgD+Ny428eMvCQHrOHhQ2DUR2yzqhKrBL4AWFHPKtZFb9UukUDDKMQICKqfloCNjbCc/m8BEnejmo9qAYJH7t5gsXogz+USxxfeNoOz66ZKV26CHddqKyHRrrvquN7laXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 4882e1KY024547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 8 Sep 2024 10:40:01 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X1Z1q74Y8z7ZMns;
	Sun,  8 Sep 2024 10:39:59 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Sun, 8 Sep 2024 10:40:00 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Sun, 8 Sep 2024 10:39:59 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Sun, 8 Sep 2024 10:39:59 +0800
From: =?gb2312?B?TGl1IEtpbXJpdmVyL8H1vfC60w==?= <kimriver.liu@siengine.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
CC: "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
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
Thread-Index: AQHbADEIW35yKdnseE29IGkdUrOvKrJJ4TuAgANMHMA=
Date: Sun, 8 Sep 2024 02:39:59 +0000
Message-ID: <9015556aa8d34cac80419348c6028a44@siengine.com>
References: <20240906074731.3064-1-kimriver.liu@siengine.com>
 <20240906080749.GE275077@black.fi.intel.com>
In-Reply-To: <20240906080749.GE275077@black.fi.intel.com>
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
X-MAIL:mail03.siengine.com 4882e1KY024547

SGkgDQogIEkgYW0gc29ycnkgZm9yIG5vdCByZXBseWluZyB0byBxdWVzdGlvbnMgaW4gdGltZSBv
biBGcmlkYXkuDQoNCg0KLS0tLS3Tyrz+1K28/i0tLS0tDQq3orz+yMs6IE1pa2EgV2VzdGVyYmVy
ZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbT4gDQq3osvNyrG85DogMjAyNMTqOdTC
NsjVIDE2OjA4DQrK1bz+yMs6IExpdSBLaW1yaXZlci/B9b3wutMgPGtpbXJpdmVyLmxpdUBzaWVu
Z2luZS5jb20+DQqzrcvNOiBqYXJra28ubmlrdWxhQGxpbnV4LmludGVsLmNvbTsgYW5kcml5LnNo
ZXZjaGVua29AbGludXguaW50ZWwuY29tOyBqc2RAc2VtaWhhbGYuY29tOyBhbmRpLnNoeXRpQGtl
cm5lbC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcNCtb3zOI6IFJlOiBbUEFUQ0hdIGkyYzogZGVzaWdud2FyZTogZml4IG1hc3RlciBp
cyBob2xkaW5nIFNDTCBsb3cgd2hpbGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZA0KDQpIaSwNCg0K
T24gRnJpLCBTZXAgMDYsIDIwMjQgYXQgMDM6NDc6MzFQTSArMDgwMCwgS2ltcml2ZXIgTGl1IHdy
b3RlOg0KPiBJdCB3YXMgb2JzZXJ2ZWQgaXNzdWluZyBBQk9SVCBiaXQoSUNfRU5BQkxFWzFdKSB3
aWxsIG5vdCB3b3JrIHdoZW4NCj4gSUNfRU5BQkxFIGlzIGFscmVhZHkgZGlzYWJsZWQuDQo+IA0K
PiBDaGVjayBpZiBFTkFCTEUgYml0KElDX0VOQUJMRVswXSkgaXMgZGlzYWJsZWQgd2hlbiB0aGUg
bWFzdGVyIGlzDQo+IGhvbGRpbmcgU0NMIGxvdy4gSWYgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZCwg
dGhlIHNvZnR3YXJlIG5lZWQNCj4gZW5hYmxlIGl0IGJlZm9yZSB0cnlpbmcgdG8gaXNzdWUgQUJP
UlQgYml0LiBvdGhlcndpc2UsDQo+IHRoZSBjb250cm9sbGVyIGlnbm9yZXMgYW55IHdyaXRlIHRv
IEFCT1JUIGJpdC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEtpbXJpdmVyIExpdSA8a2ltcml2ZXIu
bGl1QHNpZW5naW5lLmNvbT4NCj4gDQo+IC0tLQ0KPiBWNS0+VjY6IHJlc3RvcmUgaTJjX2R3X2lz
X21hc3Rlcl9pZGxpbmcoKSBmdW5jdGlvbiBjaGVja2luZw0KPiBWNC0+VjU6IGRlbGV0ZSBtYXN0
ZXIgaWRsaW5nIGNoZWNraW5nDQo+IFYzLT5WNDoNCj4gICAgICAgMS4gdXBkYXRlIGNvbW1pdCBt
ZXNzYWdlcyBhbmQgYWRkIHBhdGNoIHZlcnNpb24gYW5kIGNoYW5nZWxvZw0KPiAgICAgICAyLiBt
b3ZlIHByaW50IHRoZSBlcnJvciBtZXNzYWdlIGluIGkyY19kd194ZmVyDQo+IFYyLT5WMzogY2hh
bmdlICghZW5hYmxlKSB0byAoIShlbmFibGUgJiBEV19JQ19FTkFCTEVfRU5BQkxFKSkNCj4gVjEt
PlYyOiB1c2VkIHN0YW5kYXJkIHdvcmRzIGluIGZ1bmN0aW9uIG5hbWVzIGFuZCBhZGRyZXNzZWQg
cmV2aWV3IGNvbW1lbnRzDQo+IA0KPiBsaW5rIHRvIFYxOg0KPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjQwOTA0MDY0MjI0LjIzOTQtMS1raW1yaXZlci5saXVAc2llbmdpbmUuY29t
Lw0KPiAtLS0NCj4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1jb21tb24uYyB8
IDExICsrKysrKysrKysrDQo+ICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtbWFz
dGVyLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDMz
IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LWRlc2lnbndhcmUtY29tbW9uLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUt
Y29tbW9uLmMNCj4gaW5kZXggZThhNjg4ZDA0YWVlLi4yYjMzOThjZDQzODIgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1jb21tb24uYw0KPiArKysgYi9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtY29tbW9uLmMNCj4gQEAgLTQ1Myw2ICs0
NTMsMTcgQEAgdm9pZCBfX2kyY19kd19kaXNhYmxlKHN0cnVjdCBkd19pMmNfZGV2ICpkZXYpDQo+
ICANCj4gIAlhYm9ydF9uZWVkZWQgPSByYXdfaW50cl9zdGF0cyAmIERXX0lDX0lOVFJfTVNUX09O
X0hPTEQ7DQo+ICAJaWYgKGFib3J0X25lZWRlZCkgew0KPiArCQlpZiAoIShlbmFibGUgJiBEV19J
Q19FTkFCTEVfRU5BQkxFKSkgew0KPiArCQkJcmVnbWFwX3dyaXRlKGRldi0+bWFwLCBEV19JQ19F
TkFCTEUsIERXX0lDX0VOQUJMRV9FTkFCTEUpOw0KPiArCQkJZW5hYmxlIHw9IERXX0lDX0VOQUJM
RV9FTkFCTEU7DQo+ICsJCQkvKg0KPiArCQkJICogV2FpdCB0d28gaWNfY2xrIGRlbGF5IHdoZW4g
ZW5hYmxpbmcgdGhlIEkyQyB0byBlbnN1cmUgRU5BQkxFIGJpdA0KPiArCQkJICogaXMgYWxyZWFk
eSBzZXQgYnkgdGhlIGRyaXZlciAoZm9yIDQwMEtIeiB0aGlzIGlzIDI1dXMpDQo+ICsJCQkgKiBh
cyBkZXNjcmliZWQgaW4gdGhlIERlc2lnbldhcmUgSTJDIGRhdGFib29rLg0KPiArCQkJICovDQo+
ICsJCQlmc2xlZXAoMjUpOw0KPiArCQl9DQo+ICsNCj4gIAkJcmVnbWFwX3dyaXRlKGRldi0+bWFw
LCBEV19JQ19FTkFCTEUsIGVuYWJsZSB8IERXX0lDX0VOQUJMRV9BQk9SVCk7DQo+ICAJCXJldCA9
IHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dChkZXYtPm1hcCwgRFdfSUNfRU5BQkxFLCBlbmFibGUs
DQo+ICAJCQkJCSAgICAgICAhKGVuYWJsZSAmIERXX0lDX0VOQUJMRV9BQk9SVCksIDEwLA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLW1hc3Rlci5jIGIv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLW1hc3Rlci5jDQo+IGluZGV4IGM3ZTU2
MDAyODA5YS4uMTMyYjcyMzdjMDA0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMv
aTJjLWRlc2lnbndhcmUtbWFzdGVyLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1k
ZXNpZ253YXJlLW1hc3Rlci5jDQo+IEBAIC0yNTMsNiArMjUzLDE5IEBAIHN0YXRpYyB2b2lkIGky
Y19kd194ZmVyX2luaXQoc3RydWN0IGR3X2kyY19kZXYgKmRldikNCj4gIAlfX2kyY19kd193cml0
ZV9pbnRyX21hc2soZGV2LCBEV19JQ19JTlRSX01BU1RFUl9NQVNLKTsNCj4gIH0NCj4gIA0KPiAr
c3RhdGljIGJvb2wgaTJjX2R3X2lzX21hc3Rlcl9pZGxpbmcoc3RydWN0IGR3X2kyY19kZXYgKmRl
dikNCj4gK3sNCj4gKwl1MzIgc3RhdHVzOw0KPiArDQo+ICsJcmVnbWFwX3JlYWQoZGV2LT5tYXAs
IERXX0lDX1NUQVRVUywgJnN0YXR1cyk7DQo+ICsJaWYgKCEoc3RhdHVzICYgRFdfSUNfU1RBVFVT
X01BU1RFUl9BQ1RJVklUWSkpDQo+ICsJCXJldHVybiB0cnVlOw0KPiArDQo+ICsJcmV0dXJuICFy
ZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQoZGV2LT5tYXAsIERXX0lDX1NUQVRVUywgc3RhdHVzLA0K
PiArCQkJIShzdGF0dXMgJiBEV19JQ19TVEFUVVNfTUFTVEVSX0FDVElWSVRZKSwNCj4gKwkJCTEx
MDAsIDIwMDAwKTsNCj4gK30NCg0KPlllYWgsIEkgbm93IHJlYWxpemUgdGhhdCBpMmNfZHdfd2Fp
dF9idXNfbm90X2J1c3koKSBjaGVja3MgZm9yDQo+RFdfSUNfU1RBVFVTX0FDVElWSVRZIG5vdCBm
b3IgRFdfSUNfU1RBVFVTX01BU1RFUl9BQ1RJVklUWSBhcyBJIHRob3VnaHQNCj5zbyBjb25zb2xp
ZGF0aW5nIHRoZW0gbWFrZXMgbm90IHRoYXQgbXVjaCBzZW5zZS4NCg0KPlRoaXMgbG9va3MgZ29v
ZCB0byBtZSwNCg0KVGhhbmtzLg0KIFRoaXMgY2FzZSBoYXBwZW5zIHJhcmVseSBhbmQgaXMgaGFy
ZCB0byByZXByb2R1Y2UuIFdlIHJlcHJvZHVjZSB0aGlzIGlzc3VlIA0KIGluIFJUTCBzaW11bGF0
aW9uLiBJdCBpcyBuZWNlc3NhcnkgdG8gYWRkIHdhaXRpbmcgRFdfSUNfU1RBVFVTX01BU1RFUl9B
Q1RJVklUWQ0KIGlkbGluZyBiZWZvcmUgZGlzYWJsaW5nIEkyQyB3aGVuIEkyQyB0cmFuc2ZlciBj
b21wbGV0ZWQuICBhcyBkZXNjcmliZWQgaW4gdGhlDQogRGVzaWduV2FyZSBJMkMgZGF0YWJvb2so
Rmxvd2NoYXJ0IGZvciBEV19hcGJfaTJjIENvbnRyb2xsZXIpDQoNCg0KLS0tLS0tLS0tLS0tLS0t
LS0NCkJlc3QgUmVnYXJkcw0KS2ltcml2ZXIgTGl1DQo=

