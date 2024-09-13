Return-Path: <linux-i2c+bounces-6679-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77789977B16
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 10:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 386A128A191
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 08:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BECDB1D6C4C;
	Fri, 13 Sep 2024 08:31:30 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02011BC097
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726216290; cv=none; b=Upls9pZMDjTHzyJJuJ02DUGj5yzB1Uh/WUJv/k1/7K/uJw6u9h2C4yfpUWKFAKU3FPFeOHxSCR1xQsBvX3io2VQxiEsSQIebkZ0CB9V5+dSuv5mVtG7ssDsrbU673rfP3W76Z0Uhg9MShterK32hqPYNF9HnL+bSPrbDaWXtaQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726216290; c=relaxed/simple;
	bh=b7m/UasnZq0dbx4PVyx0tY1zqMBARt2DyIBiQoHA9YM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B6nC7PJdP0GkRuwZGQ2pDeFUFEOIJrinDGMq3ZD19pObtngnNCWBDAgtC8nD31iluJ1yDvDfDtM2y0LHT7kZXvsuu5xxWysuV0ny+159nZKyL5T1DfvCzt6m1QycV7QCieePRY7gHa8P/fTbEeMCNdeM2PsP8NnE1LfA2yKtyg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48D8VJhC021653
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 13 Sep 2024 16:31:19 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X4nZt0BJ2z7ZMt2;
	Fri, 13 Sep 2024 16:31:18 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Fri, 13 Sep 2024 16:31:18 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Fri, 13 Sep 2024 16:31:18 +0800
From: =?utf-8?B?TGl1IEtpbXJpdmVyL+WImOmHkeaysw==?= <kimriver.liu@siengine.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "jsd@semihalf.com" <jsd@semihalf.com>,
        "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Subject: RE: [PATCH v11] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Thread-Topic: [PATCH v11] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Thread-Index: AQHbBY3Guj+rQp1Ui0uJhUssx5pO0bJUz0oAgACO9MA=
Date: Fri, 13 Sep 2024 08:31:18 +0000
Message-ID: <971008d0fd32403198785e1e4543d108@siengine.com>
References: <4ebc4e8882a52620cbca30f1bf25650cbc3723fb.1726197817.git.kimriver.liu@siengine.com>
 <CAHp75Vdbr5sJejwfkxYrgkdNMMZV+D5w1mipTxz=R+EkEUrA0w@mail.gmail.com>
In-Reply-To: <CAHp75Vdbr5sJejwfkxYrgkdNMMZV+D5w1mipTxz=R+EkEUrA0w@mail.gmail.com>
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
X-MAIL:mail03.siengine.com 48D8VJhC021653

SGkgQW5keQ0KIA0KICBTdWJqZWN0OiAgW1BBVENIIHYxMV0gaTJjOiBkZXNpZ253YXJlOiBmaXgg
Y29udHJvbGxlciBpcyBob2xkaW5nIFNDTCBsb3cgd2hpbGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxl
ZA0KICBJIHdpbGwgY2hhbmdlIHRoZSBzdWJqZWN0IHRv77yaDQogIFN1YmplY3Q6ICBbUEFUQ0gg
djExXSBpMmM6IGRlc2lnbndhcmU6IGZpeCBjb250cm9sbGVyIGlzIGhvbGRpbmcgU0NMIGxvdyB3
aGlsZSB0aGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZA0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj5Gcm9tOiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+
IA0KPlNlbnQ6IDIwMjTlubQ55pyIMTPml6UgMTU6NDENCj5UbzogTGl1IEtpbXJpdmVyL+WImOmH
keaysyA8a2ltcml2ZXIubGl1QHNpZW5naW5lLmNvbT4NCj5DYzogamFya2tvLm5pa3VsYUBsaW51
eC5pbnRlbC5jb207IGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbTsgbWlrYS53ZXN0
ZXJiZXJnQGxpbnV4LmludGVsLmNvbTsganNkQHNlbWloYWxmLmNvbTsgYW5kaS5zaHl0aUBrZXJu
ZWwub3JnOyBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJu
ZWwub3JnOyBBbmR5ID5TaGV2Y2hlbmtvIDxhbmR5QGtlcm5lbC5vcmc+DQo+U3ViamVjdDogUmU6
IFtQQVRDSCB2MTFdIGkyYzogZGVzaWdud2FyZTogZml4IGNvbnRyb2xsZXIgaXMgaG9sZGluZyBT
Q0wgbG93IHdoaWxlIEVOQUJMRSBiaXQgaXMgZGlzYWJsZWQNCg0KPk9uIEZyaSwgU2VwIDEzLCAy
MDI0IGF0IDY6MzXigK9BTSBLaW1yaXZlciBMaXUgPGtpbXJpdmVyLmxpdUBzaWVuZ2luZS5jb20+
IHdyb3RlOg0KPj4NCj4+IEl0IHdhcyBvYnNlcnZlZCB0aGF0IGlzc3VpbmcgdGhlIEFCT1JUIGJp
dCAoSUNfRU5BQkxFWzFdKSB3aWxsIG5vdCANCj4+IHdvcmsgd2hlbiBJQ19FTkFCTEUgaXMgYWxy
ZWFkeSBkaXNhYmxlZC4NCj4+DQo+PiBDaGVjayBpZiB0aGUgRU5BQkxFIGJpdCAoSUNfRU5BQkxF
WzBdKSBpcyBkaXNhYmxlZCB3aGVuIHRoZSBjb250cm9sbGVyIA0KPj4gaXMgaG9sZGluZyBTQ0wg
bG93LiBJZiB0aGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZCwgdGhlIHNvZnR3YXJlIG5lZWRzIA0K
Pj4gdG8gZW5hYmxlIGl0IGJlZm9yZSB0cnlpbmcgdG8gaXNzdWUgdGhlIEFCT1JUIGJpdC4gb3Ro
ZXJ3aXNlLCB0aGUgDQo+PiBjb250cm9sbGVyIGlnbm9yZXMgYW55IHdyaXRlIHRvIEFCT1JUIGJp
dC4NCj4+DQo+PiBUaGVzZSBrZXJuZWwgbG9ncyBzaG93IHVwIHdoZW5ldmVyIGFuIEkyQyB0cmFu
c2FjdGlvbiBpcyBhdHRlbXB0ZWQgDQo+PiBhZnRlciB0aGlzIGZhaWx1cmUuDQo+PiBpMmNfZGVz
aWdud2FyZSBlOTVlMDAwMC5pMmM6IHRpbWVvdXQgd2FpdGluZyBmb3IgYnVzIHJlYWR5IA0KPj4g
aTJjX2Rlc2lnbndhcmUgZTk1ZTAwMDAuaTJjOiB0aW1lb3V0IGluIGRpc2FibGluZyBhZGFwdGVy
DQo+Pg0KPj4gVGhlIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSB3aGVyZSB0aGUgY29udHJvbGxlciBj
YW5ub3QgYmUgZGlzYWJsZWQgDQo+PiB3aGlsZSBTQ0wgaXMgaGVsZCBsb3cgaWYgdGhlIEVOQUJM
RSBiaXQgaXMgYWxyZWFkeSBkaXNhYmxlZC4NCj4NCj4uLi4NCj4NCj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgIC8qU2V0IEVOQUJMRSBiaXQgYmVmb3JlIHNldHRpbmcgQUJPUlQqLw0KDQogICAg
ICAgLyogU2V0IEVOQUJMRSBiaXQgYmVmb3JlIHNldHRpbmcgQUJPUlQgKi8NCg0KPk1pc3Npbmcg
c3BhY2VzDQo+DQo+Li4uDQoNCj4+ICsvKg0KPj4gKyAqIFRoaXMgZnVuY3Rpb24gd2FpdHMgY29u
dHJvbGxlciBpZGxpbmcgYmVmb3JlIGRpc2FibGluZyBJMkMNCg0KPndhaXRzIGZvciBjb250cm9s
bGVyDQoNCiArICogVGhpcyBmdW5jdGlvbiB3YWl0cyBmb3IgY29udHJvbGxlciBpZGxpbmcgYmVm
b3JlIGRpc2FibGluZyBJMkMNCg0KPj4gKyAqIFdoZW4gdGhlIGNvbnRyb2xsZXIgaXMgbm90IGlu
IHRoZSBJRExFIHN0YXRlLA0KPj4gKyAqIE1TVF9BQ1RJVklUWSBiaXQgKElDX1NUQVRVU1s1XSkg
aXMgc2V0Lg0KPj4gKyAqIFZhbHVlczoNCj4+ICsgKiAweDEgKEFDVElWRSk6IENvbnRyb2xsZXIg
bm90IGlkbGUNCj4+ICsgKiAweDAgKElETEUpOiBDb250cm9sbGVyIGlzIGlkbGUNCj4+ICsgKiBU
aGUgZnVuY3Rpb24gaXMgY2FsbGVkIGFmdGVyIHJldHVybmluZyB0aGUgZW5kIG9mIHRoZSBjdXJy
ZW50IA0KPj4gKyB0cmFuc2Zlcg0KPj4gKyAqIFJldHVybnM6DQoNCj4+ICsgKiBGYWxzZSB3aGVu
IGNvbnRyb2xsZXIgaXMgaW4gSURMRSBzdGF0ZS4NCj4+ICsgKiBUcnVlIHdoZW4gY29udHJvbGxl
ciBpcyBpbiBBQ1RJVkUgc3RhdGUuDQoNCj5ZZWFoLCBJIGtub3cgdGhhdCB0aGlzIGlzIGEgY29w
eSBvZiB3aGF0IEkgc3VnZ2VzdGVkLCBidXQgaWYgd2UgZ29pbmcgdG8gYW1lbmQsIHRoZXNlIHNo
b3VsZCBiZSB3aXRoIGRlZmluaXRlIGFydGljbGUNCg0KPiAqIEZhbHNlIHdoZW4gdGhlIGNvbnRy
b2xsZXIgaXMgaW4gdGhlIElETEUgc3RhdGUuDQo+ICogVHJ1ZSB3aGVuIHRoZSBjb250cm9sbGVy
IGlzIGluIHRoZSBBQ1RJVkUgc3RhdGUuDQoNCiANCg0KPj4gKyAqLw0KDQo+Li4uDQoNCj4+ICsg
ICAgICAgcmV0dXJuIHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dChkZXYtPm1hcCwgRFdfSUNfU1RB
VFVTLCBzdGF0dXMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAh
KHN0YXR1cyAmIERXX0lDX1NUQVRVU19NQVNURVJfQUNUSVZJVFkpLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgMTEwMCwgMjAwMDApICE9IDA7DQoNCj5Zb3UgYnJv
a2UgdGhlIGluZGVudGF0aW9uIGFnYWluLg0KDQppdCBoYXMgYmVlbiBpbmRlbnRlZCBhbmQgYWxp
Z25lZCBmcm9tIHRoZSB3ZWLvvJoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC80ZWJjNGU4
ODgyYTUyNjIwY2JjYTMwZjFiZjI1NjUwY2JjMzcyM2ZiLjE3MjYxOTc4MTcuZ2l0LmtpbXJpdmVy
LmxpdUBzaWVuZ2luZS5jb20vDQoNClRoYW5rc++8gSANCg0KPi0tDQotLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkJlc3QgUmVnYXJkcw0KS2ltcml2ZXIgTGl1DQo=

