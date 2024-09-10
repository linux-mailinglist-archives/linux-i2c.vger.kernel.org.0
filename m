Return-Path: <linux-i2c+bounces-6477-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3AE973660
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 13:44:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F6D6286E11
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:44:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0597918EFD6;
	Tue, 10 Sep 2024 11:44:17 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD1F17BEC8;
	Tue, 10 Sep 2024 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725968656; cv=none; b=A+y10e1AlhYAUUFRROLn5LBiJAV/HjDzx5JTg/gr0AaC0DwtWaA8kBRXWVCtVhgVX3YcIOq0ndnpahl2Ds8TCNFJtfjN+QlQd+GsEkecwUA+C16ycZnW2MosaHXKxWaBTKphvvHLVm+AFtfCk9NGU0FdndRHl40YZbbyxFvC2zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725968656; c=relaxed/simple;
	bh=GuXq/yLp2QuT4oyRMkfClvEaL4qgrmeMsiLDacTuEUk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BhcaQTuEvPT3FOfa9nFIl0F+TgGh2YeecEfczEOXUXXT40fmz/RYjsvm3sybwYZdhaSvWsRRtvCICI7aOVkbFOifCtf2y5G5/P42yCYaBC9JpMU7/94cA3zYE6R8Xlwik5TpwjdJwlLstgegNXN3L20vRCXSoePHtprTOZxKxuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48ABha6Z073103
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 10 Sep 2024 19:43:36 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X32071Bvtz7ZMtl;
	Tue, 10 Sep 2024 19:43:35 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Tue, 10 Sep 2024 19:43:34 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Tue, 10 Sep 2024 19:43:34 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Tue, 10 Sep 2024 19:43:34 +0800
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
Thread-Index: AQHbA0iDEXTpjDBp/E6xp/M7s9EaBrJQM8eAgACJC/D//5N/AIAAiqkw
Date: Tue, 10 Sep 2024 11:43:34 +0000
Message-ID: <36e6d80999cf493f8a866fb013710682@siengine.com>
References: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
 <ZuALQVyTBFugG0Sw@smile.fi.intel.com>
 <743187d2fde54a9ebf86d42e29eadfb4@siengine.com>
 <ZuAjMmr7q4f8VJpA@smile.fi.intel.com>
In-Reply-To: <ZuAjMmr7q4f8VJpA@smile.fi.intel.com>
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
X-MAIL:mail03.siengine.com 48ABha6Z073103

SEksIEFuZHkNCg0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBBbmR5IFNo
ZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gDQo+U2VudDogMjAy
NMTqOdTCMTDI1SAxODo0NQ0KPlRvOiBMaXUgS2ltcml2ZXIvwfW98LrTIDxraW1yaXZlci5saXVA
c2llbmdpbmUuY29tPg0KPkNjOiBqYXJra28ubmlrdWxhQGxpbnV4LmludGVsLmNvbTsgbWlrYS53
ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbTsganNkQHNlbWloYWxmLmNvbTsgYW5kaS5zaHl0aUBr
ZXJuZWwub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSCB2OF0gaTJjOiBkZXNpZ253YXJlOiBmaXgg
bWFzdGVyIGlzIGhvbGRpbmcgU0NMIGxvdyB3aGlsZSBFTkFCTEUgYml0IGlzIGRpc2FibGVkDQoN
Cj5PbiBUdWUsIFNlcCAxMCwgMjAyNCBhdCAwOTozODo1M0FNICswMDAwLCBMaXUgS2ltcml2ZXIv
wfW98LrTIHdyb3RlOg0KPj4gPkZyb206IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVu
a29AbGludXguaW50ZWwuY29tPg0KPj4gPlNlbnQ6IDIwMjTE6jnUwjEwyNUgMTc6MDMNCj4+ID5U
bzogTGl1IEtpbXJpdmVyL8H1vfC60yA8a2ltcml2ZXIubGl1QHNpZW5naW5lLmNvbT4gT24gVHVl
LCBTZXAgMTAsIDIwMjQgDQo+PiA+YXQgMDI6MTM6MDlQTSArMDgwMCwgS2ltcml2ZXIgTGl1IHdy
b3RlOg0KDQo+Li4uDQoNCj4+ID5tYXN0ZXIgLS0+IGNvbnRyb2xsZXINCj4+IA0KPj4gIFVwZGF0
ZSBpdCBpbiBWOQ0KDQo+QWxzbyBpbiB0aGUgU3ViamVjdC4NCiBPSywgdXBkYXRlIGl0IGluIFtQ
QVRDSCB2OV0NCi4uLg0KDQo+ID4+IGhvbGRpbmcgU0NMIGxvdy4gSWYgRU5BQkxFIGJpdCBpcyBk
aXNhYmxlZCwgdGhlIHNvZnR3YXJlIG5lZWQgDQo+ID4+IGVuYWJsZSBpdCBiZWZvcmUgdHJ5aW5n
IHRvIGlzc3VlIEFCT1JUIGJpdC4gb3RoZXJ3aXNlLCB0aGUgDQo+ID4+IGNvbnRyb2xsZXIgaWdu
b3JlcyBhbnkgd3JpdGUgdG8gQUJPUlQgYml0Lg0KPiANCj4gPkZpeGVzIHRhZz8NCj4+IA0KPj4g
IFBhdGNoIHJlYmFzZTogIG9uIExpbnV4IHY2LjExLjAtcmM2ICg4OWY1ZTE0ZDA1YikNCg0KPk5v
LCB0aGlzIG9uZSBpcyBkb25lIGJ5IHVuZGVyc3RhbmRpbmcgd2hlcmUgdGhlIHByb2JsZW0gYXBw
ZWFyIGZpcnN0Lg0KPldoYXQgeW91IG1lbnRpb25lZCBhYm92ZSBtYXkgYmUgYWNoaWV2ZWQgYnkg
dXNpbmcgLS1iYXNlIG9wdGlvbiB3aGVuIGZvcm1hdCB0aGUgcGF0Y2guDQoNCiBGaXhlczogMjQw
OTIwNWFjZDNjICgiaTJjOiBkZXNpZ253YXJlOiBmaXggX19pMmNfZHdfZGlzYWJsZSgpIGluIGNh
c2UgbWFzdGVyIGlzIGhvbGRpbmcgU0NMIGxvdyIpDQoNCj4uLi4NCg0KPiA+PiArc3RhdGljIGJv
b2wgaTJjX2R3X2lzX21hc3Rlcl9pZGxpbmcoc3RydWN0IGR3X2kyY19kZXYgKmRldikNCj4+IA0K
Pj4gPlNvcnJ5IGlmIEkgbWFkZSBhIG1pc3Rha2UsIGJ1dCBhZ2FpbiwgbG9va2luZyBhdCB0aGUg
dXNhZ2UgeW91IGhhdmUgDQo+PiA+YWdhaW4gbmVnYXRpb24gaGVyZSBhbmQgdGhlcmUuLi4NCj4g
DQo+PiA+CWkyY19kd19pc19jb250cm9sbGVyX2FjdGl2ZQ0KPj4gDQo+PiA+IChub3RlIG5ldyB0
ZXJtaW5vbG9neSwgZHVubm8gaWYgaXQgbWFrZXMgc2Vuc2Ugc3RhcnQgdXNpbmcgaXQgaW4gDQo+
PiA+IGZ1bmN0aW9uIG5hbWVzLCBhcyB3ZSBoYXZlIG1vcmUgb2YgdGhlbSBmb2xsb3dpbmcgb2xk
IHN0eWxlKQ0KPj4gDQo+PiAgTGFzdCB3ZWVrICwgWW91IHN1Z2dlc3RlZCB0aGF0IEkgdXNlZCB0
aGlzIA0KPj4gaTJjX2R3X2lzX21hc3Rlcl9pZGxpbmcoZGV2KQ0KDQo+WWVzLCBzb3JyeSBhYm91
dCB0aGF0LiBJIGRpZCBtYXliZSBub3QgY2xlYXJseSBnZXQgaG93IGl0IGlzIGdvaW5nIHRvIGxv
b2sgbGlrZS4NCg0KPj4gPj4gK3sNCj4+ID4+ICsJdTMyIHN0YXR1czsNCj4+ID4+ICsNCj4+ID4+
ICsJcmVnbWFwX3JlYWQoZGV2LT5tYXAsIERXX0lDX1NUQVRVUywgJnN0YXR1cyk7DQo+PiA+PiAr
CWlmICghKHN0YXR1cyAmIERXX0lDX1NUQVRVU19NQVNURVJfQUNUSVZJVFkpKQ0KPj4gPj4gKwkJ
cmV0dXJuIHRydWU7DQo+PiANCj4+IAkJcmV0dXJuIGZhbHNlOw0KPj4gDQo+PiA+PiArCXJldHVy
biAhcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KGRldi0+bWFwLCBEV19JQ19TVEFUVVMsIHN0YXR1
cywNCj4+ID4+ICsJCQkhKHN0YXR1cyAmIERXX0lDX1NUQVRVU19NQVNURVJfQUNUSVZJVFkpLA0K
Pj4gPj4gKwkJCTExMDAsIDIwMDAwKTsNCj4+IA0KPj4gPi4uLmFuZCBkcm9wICEuDQo+PiANCj4+
ICBXZSByZXByb2R1Y2UgdGhpcyBpc3N1ZSBpbiBSVEwgc2ltdWxhdGlvbihBYm91dCh+MTo1MDAp
IGluIG91ciBzb2MpLiANCj4+IEl0IGlzIG5lY2Vzc2FyeSAgdG8gYWRkIHdhaXRpbmcgRFdfSUNf
U1RBVFVTX01BU1RFUl9BQ1RJVklUWSBpZGxpbmcgDQo+PiBiZWZvcmUgZGlzYWJsaW5nIEkyQyB3
aGVuICBJMkMgdHJhbnNmZXIgY29tcGxldGVkLiAgYXMgZGVzY3JpYmVkIGluIA0KPj4gdGhlIERl
c2lnbldhcmUgIEkyQyBkYXRhYm9vayhGbG93Y2hhcnQgZm9yIERXX2FwYl9pMmMgQ29udHJvbGxl
cikNCg0KPkNvb2wsIGJ1dCBoZXJlIEknbSB0YWxraW5nIHB1cmVseSBhYm91dCBpbnZlcnRpbmcg
dGhlIGxvZ2ljICh3aXRoIHJlbmFtaW5nKSwgbm90aGluZyBtb3JlLg0KDQogYXMgZGVzY3JpYmVk
IGluIHRoZSBEZXNpZ25XYXJlIEkyQyBkYXRhYm9vazoNCiBEV19JQ19TVEFUVVNbNV0uTVNUX0FD
VElWSVRZIERlc2NyaXB0aW9uIGFzIGZvbGxvd3M6DQogQ29udHJvbGxlciBGU00gQWN0aXZpdHkg
U3RhdHVzLiBXaGVuIHRoZSBDb250cm9sbGVyIEZpbml0ZQ0KIFN0YXRlIE1hY2hpbmUgKEZTTSkg
aXMgbm90IGluIHRoZSBJRExFIHN0YXRlLCB0aGlzIGJpdCBpcyBzZXQuDQogTm90ZTogSUNfU1RB
VFVTWzBdLXRoYXQgaXMsIEFDVElWSVRZIGJpdC1pcyB0aGUgT1Igb2YNCiBTTFZfQUNUSVZJVFkg
YW5kIE1TVF9BQ1RJVklUWSBiaXRzLg0KIFZhbHVlczoNCiCh9iAweDEgKEFDVElWRSk6IENvbnRy
b2xsZXIgbm90IGlkbGUNCiCh9iAweDAgKElETEUpOiBDb250cm9sbGVyIGlzIGlkbGUNCg0KV2Ug
bmVlZCB3YWl0aW5nIERXX0lDX1NUQVRVUy5NU1RfQUNUSVZJVFkgaWRsaW5nLA0KSWYgQ29udHJv
bGxlciBub3QgaWRsZSwgV2FpdCBmb3IgYSB3aGlsZS4NClJldHVybiB2YWx1ZTogDQogIGZhbHNl
KDApOiBDb250cm9sbGVyIGlzIGlkbGUNCiAgdGltZW91dCgtMTEwKTogQ29udHJvbGxlciBhY3Rp
dml0eQ0KDQpPaywgY2hhbmdlIHRoZSBmdW5jdGlvbiBuYW1lIGkyY19kd19pc19tYXN0ZXJfaWRs
aW5nKGRldikgdG8gaTJjX2R3X2lzX2NvbnRyb2xsZXJfYWN0aXZlKGRldikNCml0IHNlZW1zIG1v
cmUgcmVhc29uYWJsZQ0KDQpzdGF0aWMgaW50IGkyY19kd19pc19jb250cm9sbGVyXyBhY3RpdmUo
c3RydWN0IGR3X2kyY19kZXYgKmRldikNCnsNCgl1MzIgc3RhdHVzOw0KDQoJcmVnbWFwX3JlYWQo
ZGV2LT5tYXAsIERXX0lDX1NUQVRVUywgJnN0YXR1cyk7DQoJaWYgKCEoc3RhdHVzICYgRFdfSUNf
U1RBVFVTX01BU1RFUl9BQ1RJVklUWSkpDQoJCXJldHVybiBmYWxzZTsNCg0KCXJldHVybiByZWdt
YXBfcmVhZF9wb2xsX3RpbWVvdXQoZGV2LT5tYXAsIERXX0lDX1NUQVRVUywgc3RhdHVzLA0KCQkJ
IShzdGF0dXMgJiBEV19JQ19TVEFUVVNfTUFTVEVSX0FDVElWSVRZKSwNCgkJCTExMDAsIDIwMDAw
KTsNCn0NCg0KPj4gPj4gK30NCg0KLi4uDQoNCj4+ID4+ICsJLyoNCj4+ID4+ICsJICogVGhpcyBo
YXBwZW5zIHJhcmVseSBhbmQgaXMgaGFyZCB0byByZXByb2R1Y2UuIERlYnVnIHRyYWNlDQo+PiAN
Cj4+ID5SYXJlbHkgaG93PyBQZXJoYXBzIHB1dCBhIHJhdGlvbiBpbiB0aGUgcGFyZW50aGVzZXMs
IGxpa2UNCj4+IA0KPj4gPiIuLi5yYXJlbHkgKH4xOjEwMCkuLi4iDQo+PiAgQWJvdXQofjE6NTAw
KSBpbiBvdXIgc29jDQoNCj5ZZXMsIHdoYXQgSSBzaG93ZWQgd2FzIGp1c3QgYW4gZXhhbXBsZSwg
cHV0IHRoZSByZWFsIG51bWJlcnMgaW50byB0aGUgY29tbWVudC4NCg0KICAqIFRoaXMgaGFwcGVu
cyByYXJlbHkgKH4xOjUwMCkgYW5kIGlzIGhhcmQgdG8gcmVwcm9kdWNlLiBEZWJ1ZyB0cmFjZQ0K
DQo+PiA+PiArCSAqIHNob3dlZCB0aGF0IElDX1NUQVRVUyBoYWQgdmFsdWUgb2YgMHgyMyB3aGVu
IFNUT1BfREVUIG9jY3VycmVkLA0KPj4gPj4gKwkgKiBpZiBkaXNhYmxlIElDX0VOQUJMRS5FTkFC
TEUgaW1tZWRpYXRlbHkgdGhhdCBjYW4gcmVzdWx0IGluDQo+PiA+PiArCSAqIElDX1JBV19JTlRS
X1NUQVQuTUFTVEVSX09OX0hPTEQgaG9sZGluZyBTQ0wgbG93Lg0KPj4gPj4gKwkgKi8NCj4+ID4+
ICsJaWYgKCFpMmNfZHdfaXNfbWFzdGVyX2lkbGluZyhkZXYpKQ0KPj4gDQo+PiA+Li4uYW5kIGhl
cmUNCj4+IA0KPj4gPglpZiAoaTJjX2R3X2lzX2NvbnRyb2xsZXJfYWN0aXZlKGRldikpDQo+PiAN
Cj4+ID5CdXQgcGxlYXNlIGRvdWJsZSBjaGVjayB0aGF0IEkgaGF2ZW4ndCBtYWRlIGFueSBtaXN0
YWtlcyBpbiBhbGwgdGhpcyBsb2dpYy4NCj4+IA0KPj4gIExhc3Qgd2VlayAsIFlvdSBzdWdnZXN0
ZWQgdGhhdCBJIHVzZWQgdGhpcyANCj4+IGkyY19kd19pc19tYXN0ZXJfaWRsaW5nKGRldikgIGtl
ZXAgdXNpbmcgaTJjX2R3X2lzX21hc3Rlcl9pZGxpbmcoZGV2KSAsIE9rPw0KDQpTZWUgYWJvdmUu
DQoNCj4gPj4gKwkJZGV2X2VycihkZXYtPmRldiwgIkkyQyBtYXN0ZXIgbm90IGlkbGluZ1xuIik7
DQoNCkkgd2lsbCBiZSBvZmYgd29yaywgIElmIHRoZXJlIGFyZSBzdGlsbCBlbWFpbHMgdGhhdCBJ
IGhhdmUgbm90IGJlZW4gcmVwbGllZCB0bywgDQogSSB3aWxsIHJlcGx5IHRvIHlvdXIgZW1haWwg
aW1tZWRpYXRlbHkgYWZ0ZXIgZ29pbmcgdG8gd29yayB0b21vcnJvdy4NCiANClRoYW5rcyB5b3Ug
Zm9yIHlvdXIgc3VnZ2VzdGlvbiENCg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tDQpCZXN0IFJlZ2FyZHMNCktpbXJpdmVyIExpdQ0KDQo=

