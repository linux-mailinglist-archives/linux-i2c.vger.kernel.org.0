Return-Path: <linux-i2c+bounces-6453-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 304579726B0
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 03:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 623711C23684
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 01:45:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00C665674D;
	Tue, 10 Sep 2024 01:45:32 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7EB1DA4C;
	Tue, 10 Sep 2024 01:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725932731; cv=none; b=BOfQtr8ZCrp8DUNkj8JN6/KKvNQwpXDoS3JhZ0SeVJa86e8DgccF+N2J2jJNOBL/wIcuaIiF5a60GjUoh8HMKw7ozGjLvT4PtVoaPM1MDbqt/OKlai+HBT/lLvCoYAZisijwQiTxDaZyG6sJd+B3TLAyNHyYzkVSZMq97PGd17w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725932731; c=relaxed/simple;
	bh=yIiv/cK1oz5dKXmykD4a1GOLI20a/axokE/jAm1kVG8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ixKBuxonKo/oEMGGTBEewXWPA6BneMNbgeJWspjQkmwrsSx2HoEqtd0n04egDS0i/ld+3uJrPnVmFo26knR9e8dOh2EENOZ4o3O6DJMgwPPN98e+UcsoMPuxCzroZEO2fI5M6TAssT+24y3Sers9aTwOhFw9j9P+tV51fT+w4cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48A1iiWn083327
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 10 Sep 2024 09:44:44 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X2mj766rpz7ZMtl;
	Tue, 10 Sep 2024 09:44:43 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Tue, 10 Sep 2024 09:44:43 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Tue, 10 Sep 2024 09:44:43 +0800
From: =?gb2312?B?TGl1IEtpbXJpdmVyL8H1vfC60w==?= <kimriver.liu@siengine.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "jsd@semihalf.com" <jsd@semihalf.com>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "jarkko.nikula@linux.intel.com"
	<jarkko.nikula@linux.intel.com>,
        Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>
Subject: RE: [PATCH v7] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Topic: [PATCH v7] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Index: AQHbAsRDmIldr9ML/Uut0TSKanMDV7JPMgmAgAEHEXA=
Date: Tue, 10 Sep 2024 01:44:43 +0000
Message-ID: <c4f85357180e4f9c92169930d2cc5ada@siengine.com>
References: <9B8C909B-AF7A-4F0F-BD75-ED368BE71E28@siengine.com>
 <zr3kwfko3ibotqivmszpthbulcre5iofw4ihc3nwnks3or5mje@pkiynzbboxpn>
In-Reply-To: <zr3kwfko3ibotqivmszpthbulcre5iofw4ihc3nwnks3or5mje@pkiynzbboxpn>
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
X-MAIL:mail03.siengine.com 48A1iiWn083327

SGkgQW5kaQ0KDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQW5kaSBT
aHl0aSA8YW5kaS5zaHl0aUBrZXJuZWwub3JnPiANCj4gU2VudDogMjAyNMTqOdTCMTDI1SAxOjM3
DQo+IFRvOiBMaXUgS2ltcml2ZXIvwfW98LrTIDxraW1yaXZlci5saXVAc2llbmdpbmUuY29tPg0K
PiBDYzogYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOyBtaWthLndlc3RlcmJlcmdA
bGludXguaW50ZWwuY29tOyBqc2RAc2VtaWhhbGYuY29tOyBsaW51eC1pMmNAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBqYXJra28ubmlrdWxhQGxpbnV4Lmlu
dGVsLmNvbQ0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY3XSBpMmM6IGRlc2lnbndhcmU6IGZpeCBt
YXN0ZXIgaXMgaG9sZGluZyBTQ0wgbG93IHdoaWxlIEVOQUJMRSBiaXQgaXMgZGlzYWJsZWQNCg0K
PiBIaSBLaW1yaXZlciwNCg0KPiBPbiBNb24sIFNlcCAwOSwgMjAyNCBhdCAwMjoyNjozMFBNIEdN
VCwgTGl1IEtpbXJpdmVyL8H1vfC60yB3cm90ZToNCj4gPiANCj4gPiBISSBhbmRpDQo+ID4gDQo+
ID4gRHVlIHRvIGEgMTIgdGltZSBkaWZmZXJlbmNlo6xJIGhhZCBiZWVuIG9mZiB3b3JrLg0KPiA+
IEkgYW0gdmVyeSBzb3JyeSB0aGF0IEkgY2FuJ3QgcmVwbHkgZW1haWwgaW4gdGltZS4gSSB3aWxs
IHJlcGx5IHRvIHlvdXIgZW1haWwgIGltbWVkaWF0ZWx5IGFmdGVyIGdvaW5nIHRvIHdvcmsgdG9t
b3Jyb3cuDQoNCj4gSXQncyBub3QgYSBwcm9ibGVtLCB0YWtlIHlvdXIgdGltZSEgOi0pDQoNCj4g
PiA+PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtY29tbW9uLmMNCj4g
PiA+PiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtY29tbW9uLmMNCj4g
PiA+PiBAQCAtNDUzLDYgKzQ1MywxOCBAQCB2b2lkIF9faTJjX2R3X2Rpc2FibGUoc3RydWN0IGR3
X2kyY19kZXYgKmRldikNCj4gPiA+PiAgDQo+ID4gPj4gIAlhYm9ydF9uZWVkZWQgPSByYXdfaW50
cl9zdGF0cyAmIERXX0lDX0lOVFJfTVNUX09OX0hPTEQ7DQo+ID4gPj4gIAlpZiAoYWJvcnRfbmVl
ZGVkKSB7DQo+PiAgPj4gKwkJaWYgKCEoZW5hYmxlICYgRFdfSUNfRU5BQkxFX0VOQUJMRSkpIHsN
Cj4+ICA+PiArCQkJcmVnbWFwX3dyaXRlKGRldi0+bWFwLCBEV19JQ19FTkFCTEUsIERXX0lDX0VO
QUJMRV9FTkFCTEUpOw0KPiA+ID4+ICsJCQllbmFibGUgfD0gRFdfSUNfRU5BQkxFX0VOQUJMRTsN
Cj4gPiA+PiArCQkJLyoNCj4gPiA+PiArCQkJICogTmVlZCB0d28gaWNfY2xrIGRlbGF5IHdoZW4g
ZW5hYmxpbmcgdGhlIEkyQyB0byBlbnN1cmUgRU5BQkxFIGJpdA0KPiA+ID4+ICsJCQkgKiBpcyBh
bHJlYWR5IHNldC4gV2FpdCAxMCB0aW1lcyB0aGUgc2lnbmFsaW5nIHBlcmlvZCBvZiB0aGUgaGln
aGVzdA0KPiA+ID4+ICsJCQkgKiBJMkMgdHJhbnNmZXIgc3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIo
Zm9yIDQwMEtIeiB0aGlzIGlzIDI1dXMpDQo+ID4gPj4gKwkJCSAqIGFzIGRlc2NyaWJlZCBpbiB0
aGUgRGVzaWduV2FyZSBJMkMgZGF0YWJvb2suDQo+ID4gPj4gKwkJCSAqLw0KPiA+ID4+ICsJCQl1
c2xlZXBfcmFuZ2UoMjUsIDI1MCk7DQo+ID4gDQo+ID4gPkkgdGhpbmsgdGhlcmUgaXMgYSBtaXN1
bmRlcnN0YW5kaW5nIGhlcmUuIEFuZHkgYXNrZWQgeW91IHRvIHVzZSANCj4gPiA+ZmxzZWVwIGFu
ZCBpbXByb3ZlIHRoZSBjYWxjdWxhdGlvbjogIlBsZWFzZSwgY2FsY3VsYXRlIHRoaXMgZGVsYXkg
DQo+ID4gPmJhc2VkIG9uIHRoZSBhY3R1YWwgc3BlZWQgaW4gdXNlIChvciBhYm91dCB0byBiZSBp
biB1c2UpLiJbKl0NCj4gPiANCj4gPiA+QW5keSBjYW4geW91IHBsZWFzZSBjbGFyaWZ5IHdpdGgg
S2ltcml2ZXIgaGVyZT8NCj4gPiANCj4+ICAgaWYgd2UgdXNlIDQwMGtIeiAsbmVlZCBzZXR0aW5n
IGZsc2VlcCgyNSk7ICBpZiB3ZSB1c2UgMTAwa0h6ICxuZWVkIA0KPiA+IHNldHRpbmcgZmxzZWVw
KDEwMCk7ICBPdmVyYWxsLCB0YWtlIHRoZSBtYXhpbXVtIHZhbHVlOmZsc2VlcCgxMDApOw0KDQo+
IFRoYW5rcyBmb3IgY2xhcmlmeWluZywgdGhlbiB0aGlzIGlzIHdoYXQgQW5keSBhc2tlZCB0byBk
bywgaW5zdGVhZCBvZiB3YWl0aW5nIGFuIGF2ZXJhZ2UgcmFuZG9tIGFtb3VudCBmcm9tIDI1IHRv
IDI1MHVzLg0KPiBEb2VzIGl0IG1ha2Ugc2Vuc2UgdG8geW91Pw0KDQogYXMgZGVzY3JpYmVkIGlu
IHRoZSBEZXNpZ25XYXJlIEkyQyBkYXRhYm9vazoNCiBEZWZpbmUgYSB0aW1lciBpbnRlcnZhbCAo
dGkyY19wb2xsKSBlcXVhbCB0byB0aGUgMTAgdGltZXMgdGhlIHNpZ25hbGluZyBwZXJpb2QgZm9y
IHRoZSBoaWdoZXN0IEkyQyB0cmFuc2Zlcg0KIHNwZWVkIHVzZWQgaW4gdGhlIHN5c3RlbSBhbmQg
c3VwcG9ydGVkIGJ5IERXX2FwYl9pMmMuIEZvciBleGFtcGxlLCBpZiB0aGUgaGlnaGVzdCBJMkMg
dHJhbnNmZXIgbW9kZQ0KIGlzIDQwMCBrYi9zLCB0aGVuIHRoaXMgdGkyY19wb2xsIGlzIDI1psxz
Lg0KDQogTm93IEkgdW5kZXJzdGFuZCBob3cgdG8gY2FsY3VsYXRlIHRoaXMgZGVsYXkgYmFzZWQg
b24gYWN0dWFsIHVzYWdlIHNwZWVkOg0KIGZzbGVlcChESVZfUk9VTkRfQ0xPU0VTVF9VTEwoMTAg
KiBNSUNSTywgdC0+YnVzX2ZyZXFfaHopKTsNCiBJIHdpbGwgdXBkYXRlIGNvZGUgYW5kIHJlLXNl
bmQgaXQgYXMgVjguDQoNClRoYW5rcy4NCg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCkJlc3QgUmVnYXJkcw0KS2ltcml2ZXIgTGl1DQo=

