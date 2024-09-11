Return-Path: <linux-i2c+bounces-6516-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA12A9747DC
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 03:38:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61AD21F276BF
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 01:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB35F28E0F;
	Wed, 11 Sep 2024 01:38:24 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3F5273FC;
	Wed, 11 Sep 2024 01:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726018704; cv=none; b=pdRqO+efSj2EOxN4aPNjLkCxGH1LQm23dBZp47uUpnmeFC96+ULLyV/e/7fi/YQr9Tz83gherGcSvtAm+Fi6H9k0cZD22DIKJeIVMqyuCDfEKRETFbyOuLp7/f3NQonZJH0NeaZRPxGt8/gWRX0suzAaP4A1967+63musZiImlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726018704; c=relaxed/simple;
	bh=zjgCeBJbI2vfvwjfzlO+32xESlfuGNuHxD1Gjm5qIqg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ytq+ZINSdnAnRvLAO0goO4tFiIcnbMVYZR7WglKGtPJn3yZqRTHVPW76nqT0O3CKDb+VhlfVT2hdFbCMXRubVO2bb3MbW9nB9EGtwieczzbauxdx1dg8rLKIOPfpHslytpOqC6DptE61kwXUBFBFRnqxyegruDZPDYMyKsly/BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48B1bjPJ076135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 11 Sep 2024 09:37:45 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X3NVc20Lbz7ZMhG;
	Wed, 11 Sep 2024 09:37:44 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Wed, 11 Sep 2024 09:37:44 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 09:37:44 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Wed, 11 Sep 2024 09:37:44 +0800
From: =?utf-8?B?TGl1IEtpbXJpdmVyL+WImOmHkeaysw==?= <kimriver.liu@siengine.com>
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
Thread-Index: AQHbA0iDEXTpjDBp/E6xp/M7s9EaBrJQM8eAgACJC/D//5N/AIAAiqkw//+KBwCAAWKo0A==
Date: Wed, 11 Sep 2024 01:37:43 +0000
Message-ID: <981861a36edc4b759e20f9be45d243c7@siengine.com>
References: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
 <ZuALQVyTBFugG0Sw@smile.fi.intel.com>
 <743187d2fde54a9ebf86d42e29eadfb4@siengine.com>
 <ZuAjMmr7q4f8VJpA@smile.fi.intel.com>
 <36e6d80999cf493f8a866fb013710682@siengine.com>
 <ZuA0jMCfGdyPR-T5@smile.fi.intel.com>
In-Reply-To: <ZuA0jMCfGdyPR-T5@smile.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
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
X-MAIL:mail03.siengine.com 48B1bjPJ076135

SGkgQW5keQ0KDQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IEFuZHkgU2hl
dmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiANCj5TZW50OiAyMDI0
5bm0OeaciDEw5pelIDE5OjU5DQo+VG86IExpdSBLaW1yaXZlci/liJjph5HmsrMgPGtpbXJpdmVy
LmxpdUBzaWVuZ2luZS5jb20+DQo+Q2M6IGphcmtrby5uaWt1bGFAbGludXguaW50ZWwuY29tOyBt
aWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tOyBqc2RAc2VtaWhhbGYuY29tOyBhbmRpLnNo
eXRpQGtlcm5lbC5vcmc7IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIIHY4XSBpMmM6IGRlc2lnbndhcmU6
IGZpeCBtYXN0ZXIgaXMgaG9sZGluZyBTQ0wgbG93IHdoaWxlIEVOQUJMRSBiaXQgaXMgZGlzYWJs
ZWQNCg0KPk9uIFR1ZSwgU2VwIDEwLCAyMDI0IGF0IDExOjQzOjM0QU0gKzAwMDAsIExpdSBLaW1y
aXZlci/liJjph5HmsrMgd3JvdGU6DQo+PiA+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+
ID5Gcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNv
bT4NCj4+ID5TZW50OiAyMDI05bm0OeaciDEw5pelIDE4OjQ1DQo+PiA+T24gVHVlLCBTZXAgMTAs
IDIwMjQgYXQgMDk6Mzg6NTNBTSArMDAwMCwgTGl1IEtpbXJpdmVyL+WImOmHkeaysyB3cm90ZToN
Cj4+ID4+ID5Gcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4Lmlu
dGVsLmNvbT4NCj4+ID4+ID5TZW50OiAyMDI05bm0OeaciDEw5pelIDE3OjAzDQo+PiA+PiA+YXQg
MDI6MTM6MDlQTSArMDgwMCwgS2ltcml2ZXIgTGl1IHdyb3RlOg0KPg0KPi4uLg0KPg0KPj4gPiA+
PiArc3RhdGljIGJvb2wgaTJjX2R3X2lzX21hc3Rlcl9pZGxpbmcoc3RydWN0IGR3X2kyY19kZXYg
KmRldikNCj4+ID4+IA0KPj4gPj4gPlNvcnJ5IGlmIEkgbWFkZSBhIG1pc3Rha2UsIGJ1dCBhZ2Fp
biwgbG9va2luZyBhdCB0aGUgdXNhZ2UgeW91IA0KPj4gPj4gPmhhdmUgYWdhaW4gbmVnYXRpb24g
aGVyZSBhbmQgdGhlcmUuLi4NCj4+ID4gDQo+PiA+PiA+CWkyY19kd19pc19jb250cm9sbGVyX2Fj
dGl2ZQ0KPj4gPj4gDQo+PiA+PiA+IChub3RlIG5ldyB0ZXJtaW5vbG9neSwgZHVubm8gaWYgaXQg
bWFrZXMgc2Vuc2Ugc3RhcnQgdXNpbmcgaXQgaW4gDQo+PiA+PiA+IGZ1bmN0aW9uIG5hbWVzLCBh
cyB3ZSBoYXZlIG1vcmUgb2YgdGhlbSBmb2xsb3dpbmcgb2xkIHN0eWxlKQ0KPj4gPj4gDQo+PiA+
PiAgTGFzdCB3ZWVrICwgWW91IHN1Z2dlc3RlZCB0aGF0IEkgdXNlZCB0aGlzDQo+PiA+PiBpMmNf
ZHdfaXNfbWFzdGVyX2lkbGluZyhkZXYpDQo+PiANCj4+ID5ZZXMsIHNvcnJ5IGFib3V0IHRoYXQu
IEkgZGlkIG1heWJlIG5vdCBjbGVhcmx5IGdldCBob3cgaXQgaXMgZ29pbmcgdG8gbG9vayBsaWtl
Lg0KPj4gDQo+PiA+PiA+PiArew0KPj4gPj4gPj4gKwl1MzIgc3RhdHVzOw0KPj4gPj4gPj4gKw0K
Pj4gPj4gPj4gKwlyZWdtYXBfcmVhZChkZXYtPm1hcCwgRFdfSUNfU1RBVFVTLCAmc3RhdHVzKTsN
Cj4+ID4+ID4+ICsJaWYgKCEoc3RhdHVzICYgRFdfSUNfU1RBVFVTX01BU1RFUl9BQ1RJVklUWSkp
DQo+PiA+PiA+PiArCQlyZXR1cm4gdHJ1ZTsNCj4+ID4+IA0KPj4gPj4gCQlyZXR1cm4gZmFsc2U7
DQo+PiA+PiANCj4+ID4+ID4+ICsJcmV0dXJuICFyZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQoZGV2
LT5tYXAsIERXX0lDX1NUQVRVUywgc3RhdHVzLA0KPj4gPj4gPj4gKwkJCSEoc3RhdHVzICYgRFdf
SUNfU1RBVFVTX01BU1RFUl9BQ1RJVklUWSksDQo+PiA+PiA+PiArCQkJMTEwMCwgMjAwMDApOw0K
Pj4gPj4gDQo+PiA+PiA+Li4uYW5kIGRyb3AgIS4NCj4+ID4+IA0KPj4gPj4gIFdlIHJlcHJvZHVj
ZSB0aGlzIGlzc3VlIGluIFJUTCBzaW11bGF0aW9uKEFib3V0KH4xOjUwMCkgaW4gb3VyIHNvYyku
IA0KPj4gPj4gSXQgaXMgbmVjZXNzYXJ5ICB0byBhZGQgd2FpdGluZyBEV19JQ19TVEFUVVNfTUFT
VEVSX0FDVElWSVRZIGlkbGluZyANCj4+ID4+IGJlZm9yZSBkaXNhYmxpbmcgSTJDIHdoZW4gIEky
QyB0cmFuc2ZlciBjb21wbGV0ZWQuICBhcyBkZXNjcmliZWQgaW4gDQo+PiA+PiB0aGUgRGVzaWdu
V2FyZSAgSTJDIGRhdGFib29rKEZsb3djaGFydCBmb3IgRFdfYXBiX2kyYyBDb250cm9sbGVyKQ0K
Pj4gDQo+PiA+Q29vbCwgYnV0IGhlcmUgSSdtIHRhbGtpbmcgcHVyZWx5IGFib3V0IGludmVydGlu
ZyB0aGUgbG9naWMgKHdpdGggcmVuYW1pbmcpLCBub3RoaW5nIG1vcmUuDQo+PiANCj4+ICBhcyBk
ZXNjcmliZWQgaW4gdGhlIERlc2lnbldhcmUgSTJDIGRhdGFib29rOg0KPj4gIERXX0lDX1NUQVRV
U1s1XS5NU1RfQUNUSVZJVFkgRGVzY3JpcHRpb24gYXMgZm9sbG93czoNCj4+ICBDb250cm9sbGVy
IEZTTSBBY3Rpdml0eSBTdGF0dXMuIFdoZW4gdGhlIENvbnRyb2xsZXIgRmluaXRlICBTdGF0ZSAN
Cj4+IE1hY2hpbmUgKEZTTSkgaXMgbm90IGluIHRoZSBJRExFIHN0YXRlLCB0aGlzIGJpdCBpcyBz
ZXQuDQo+PiAgTm90ZTogSUNfU1RBVFVTWzBdLXRoYXQgaXMsIEFDVElWSVRZIGJpdC1pcyB0aGUg
T1Igb2YgIFNMVl9BQ1RJVklUWSANCj4+IGFuZCBNU1RfQUNUSVZJVFkgYml0cy4NCj4+ICBWYWx1
ZXM6DQo+PiAg4pagIDB4MSAoQUNUSVZFKTogQ29udHJvbGxlciBub3QgaWRsZQ0KPj4gIOKWoCAw
eDAgKElETEUpOiBDb250cm9sbGVyIGlzIGlkbGUNCj4+IA0KPj4gV2UgbmVlZCB3YWl0aW5nIERX
X0lDX1NUQVRVUy5NU1RfQUNUSVZJVFkgaWRsaW5nLCBJZiBDb250cm9sbGVyIG5vdCANCj4+IGlk
bGUsIFdhaXQgZm9yIGEgd2hpbGUuDQo+PiBSZXR1cm4gdmFsdWU6IA0KPj4gICBmYWxzZSgwKTog
Q29udHJvbGxlciBpcyBpZGxlDQo+PiAgIHRpbWVvdXQoLTExMCk6IENvbnRyb2xsZXIgYWN0aXZp
dHkNCj4+IA0KPj4gT2ssIGNoYW5nZSB0aGUgZnVuY3Rpb24gbmFtZSBpMmNfZHdfaXNfbWFzdGVy
X2lkbGluZyhkZXYpIHRvIA0KPj4gaTJjX2R3X2lzX2NvbnRyb2xsZXJfYWN0aXZlKGRldikgaXQg
c2VlbXMgbW9yZSByZWFzb25hYmxlDQo+PiANCg0KDQogQ2hhbmdlIGFib3ZlIHRleHQgYXMgYSBj
b21tZW50Og0KDQovKg0KICogVGhpcyBmdW5jdGlvbnMgd2FpdHMgY29udHJvbGxlciBpZGxpbmcg
YmVmb3JlIGRpc2FibGluZyBJMkMNCiAqIFdoZW4gdGhlIGNvbnRyb2xsZXIgaXMgbm90IGluIHRo
ZSBJRExFIHN0YXRlLCANCiAqIE1TVF9BQ1RJVklUWSBiaXQgKElDX1NUQVRVU1s1XSkgaXMgc2V0
Og0KICogMHgxIChBQ1RJVkUpOiBDb250cm9sbGVyIG5vdCBpZGxlDQogKiAweDAgKElETEUpOiBD
b250cm9sbGVyIGlzIGlkbGUNCiAqIFRoZSBmdW5jdGlvbiBpcyBjYWxsZWQgYWZ0ZXIgcmV0dXJu
aW5nIHRoZSBlbmQgb2YgdGhlIGN1cnJlbnQgdHJhbnNmZXINCiAqIFJldHVybnM6DQogKiBSZXR1
cm4gMCBhcyBjb250cm9sbGVyIElETEUsDQogKiBSZXR1cm4gYSBuZWdhdGl2ZSBlcnJubyBhcyBj
b250cm9sbGVyIEFDVElWRQ0KICovIA0KDQo+PiBzdGF0aWMgaW50IGkyY19kd19pc19jb250cm9s
bGVyX2FjdGl2ZShzdHJ1Y3QgZHdfaTJjX2RldiAqZGV2KSB7DQo+PiAJdTMyIHN0YXR1czsNCj4+
IA0KPj4gCXJlZ21hcF9yZWFkKGRldi0+bWFwLCBEV19JQ19TVEFUVVMsICZzdGF0dXMpOw0KPj4g
CWlmICghKHN0YXR1cyAmIERXX0lDX1NUQVRVU19NQVNURVJfQUNUSVZJVFkpKQ0KPj4gCQlyZXR1
cm4gMDsNCj4+IA0KPj4gCXJldHVybiByZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQoZGV2LT5tYXAs
IERXX0lDX1NUQVRVUywgc3RhdHVzLA0KPj4gCQkJIShzdGF0dXMgJiBEV19JQ19TVEFUVVNfTUFT
VEVSX0FDVElWSVRZKSwNCj4+IAkJCTExMDAsIDIwMDAwKTsNCj4+IH0NCg0KPlllcywgdGhhbmsg
eW91LiBUaGlzIGlzIHB1cmUgcmVhZGFiaWxpdHkgd2lzZSwgeW91IG1heSBhY3R1YWxseSBsZWF2
ZSB0aGUgYWJvdmUgdGV4dCBhcyBhIGNvbW1lbnQgb24gdG9wIG9mIHRoYXQgaGVscGVyLiBJdCB3
aWxsIGFkZCBhIHZhbHVlIG9mIHVuZGVyc3RhbmRpbmcgd2hhdCdzIGJlaGluZCB0aGUgc2NlbmVz
Lg0KDQo+ID4+ID4+ICt9DQoNCi4uLg0KDQo+PiBJIHdpbGwgYmUgb2ZmIHdvcmssIElmIHRoZXJl
IGFyZSBzdGlsbCBlbWFpbHMgdGhhdCBJIGhhdmUgbm90IGJlZW4gDQo+PiByZXBsaWVkIHRvLCBJ
IHdpbGwgcmVwbHkgdG8geW91ciBlbWFpbCBpbW1lZGlhdGVseSBhZnRlciBnb2luZyB0byB3b3Jr
IHRvbW9ycm93Lg0KDQo+Tm8gcHJvYmxlbS4gSnVzdCBrZWVwIHlvdXIgdGltZSwgcHJvb2YtcmVh
ZCBhbmQgdGVzdCB0aGUgdjkgYmVmb3JlIHNlbmRpbmcgYW5kIEkgYmVsaWV2ZSBpdCB3aWxsIGJl
IHRoZSBsYXN0IGl0ZXJhdGlvbi4gVGhhbmsgeW91IGZvciB5b3VyIHBhdGllbmNlIGFuZCBlbmVy
Z3kgdG8gcHVzaCB0aGlzIGNoYW5nZSBmb3J3YXJkIQ0KDQogIEFmdGVyIHRoZSB0ZXN0aW5nIGFu
ZCB2YWxpZGF0aW9uIGFyZSBjb21wbGV0ZWQsIEkgd2lsbCByZXNlbmQgdjkgdmVyc2lvbi4NCiAg
VGhhbmsgeW91IQ0KPg0KPi4uLg0KPg0KPj4gVGhhbmtzIHlvdSBmb3IgeW91ciBzdWdnZXN0aW9u
IQ0KDQo+WW91IGFyZSB3ZWxjb21lIQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0NCkJlc3QgUmVnYXJkcw0KS2ltcml2ZXIgTGl1DQoNCg==

