Return-Path: <linux-i2c+bounces-6682-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D19F977C35
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 11:32:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 916E61F257AE
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 09:32:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797501D6DC3;
	Fri, 13 Sep 2024 09:32:23 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0E31BD4E0
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 09:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726219943; cv=none; b=DdPSw3OjH/HTzVeTwx0bT6BpDJdo2NUgWdTgBeV0cksRbZvNRXS7ASR5mEkHjOMtI1Av3leSMFTcZL0+LDXt+EKp3xZbuw3/bJTTXvrm3ORcDRHjW20gX+oqvTZekJb+sHKoZNXmrFh8Sbt7VRg6JqcbeaDCFZrYfiQ3kFQPTiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726219943; c=relaxed/simple;
	bh=KKLfNDqfMqTfv4Iw/DfUtd2Q7H/lr75eKpNgA7rEvbk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RycxkTX+pgauaJFkfawAiD0ZS70VFCqjJtltAg6po3BTbMHEYiF02RV9bIMKkFK2E+Q9CAFes6/aenaNY7CqbebepVW6GtOp99I95CYg1m/weG5F+ZU3L+tbs25ixJqWbk5HBNNu7lDfgLJPQaiEvilV+mQZEOljxaUubu0oWFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48D9WCqN030309
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 13 Sep 2024 17:32:13 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X4px765QWz7ZMtj;
	Fri, 13 Sep 2024 17:32:11 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Fri, 13 Sep 2024 17:32:11 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Fri, 13 Sep 2024 17:32:11 +0800
From: =?utf-8?B?TGl1IEtpbXJpdmVyL+WImOmHkeaysw==?= <kimriver.liu@siengine.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Andy Shevchenko <andy.shevchenko@gmail.com>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "jsd@semihalf.com" <jsd@semihalf.com>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Subject: RE: [PATCH v11] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Thread-Topic: [PATCH v11] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Thread-Index: AQHbBY3Guj+rQp1Ui0uJhUssx5pO0bJUz0oAgACO9MD//4UbAIAAjE0w
Date: Fri, 13 Sep 2024 09:32:11 +0000
Message-ID: <cf1272474d3342e88798edc77365b420@siengine.com>
References: <4ebc4e8882a52620cbca30f1bf25650cbc3723fb.1726197817.git.kimriver.liu@siengine.com>
 <CAHp75Vdbr5sJejwfkxYrgkdNMMZV+D5w1mipTxz=R+EkEUrA0w@mail.gmail.com>
 <971008d0fd32403198785e1e4543d108@siengine.com>
 <lon3lijqcb5zpylqfni4xecjxbv6tlfn4kmyn3zwfkhajyiamw@g72c4r7fo2c6>
In-Reply-To: <lon3lijqcb5zpylqfni4xecjxbv6tlfn4kmyn3zwfkhajyiamw@g72c4r7fo2c6>
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
X-MAIL:mail03.siengine.com 48D9WCqN030309

SEksDQogVGhhbmsgeW91IGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gcmV2aWV3IHRoZSBwYXRjaCBh
bmQgY29uc2lkZXJpbmcgaXQuDQogVGhhbmtzIGEgYnVuY2ghDQoNCi0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIEJlc3QgUmVnYXJkcw0KIEtpbXJpdmVyIExpdQ0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFuZGkgU2h5dGkgPGFuZGku
c2h5dGlAa2VybmVsLm9yZz4gDQo+IFNlbnQ6IDIwMjTlubQ55pyIMTPml6UgMTY6NTMNCj4gVG86
IExpdSBLaW1yaXZlci/liJjph5HmsrMgPGtpbXJpdmVyLmxpdUBzaWVuZ2luZS5jb20+DQo+IENj
OiBBbmR5IFNoZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+OyBqYXJra28ubmlr
dWxhQGxpbnV4LmludGVsLmNvbTsgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOyBt
aWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tOyBqc2RAc2VtaWhhbGYuY29tOyBsaW51eC1p
MmNAdmdlci5rZXJuZWwub3JnOyBsaW51eC0+IGtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEFuZHkg
U2hldmNoZW5rbyA8YW5keUBrZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYxMV0g
aTJjOiBkZXNpZ253YXJlOiBmaXggY29udHJvbGxlciBpcyBob2xkaW5nIFNDTCBsb3cgd2hpbGUg
RU5BQkxFIGJpdCBpcyBkaXNhYmxlZA0KDQo+IEhpIEtpbXJpdmVyLA0KDQo+IHBsZWFzZSwgZG9u
J3Qgc2VuZCB2MTIgYW55bW9yZSwgSSB3aWxsIHRha2UgY2FyZSBvZiB0aGVzZSBsaXR0bGUgbm90
ZXMgZnJvbSBBbmR5Lg0KDQo+IFlvdSBkaWQgYSBncmVhdCBqb2IgYXQgZm9sbG93aW5nIHVwIG9u
IGFsbCB0aGUgcmV2aWV3cywgdGhhbmtzIQ0KDQo+IEFuZGkNCg0KPiBPbiBGcmksIFNlcCAxMywg
MjAyNCBhdCAwODozMToxOEFNIEdNVCwgTGl1IEtpbXJpdmVyL+WImOmHkeaysyB3cm90ZToNCj4g
PiBIaSBBbmR5DQo+PiAgIA0KPj4gICAgU3ViamVjdDogIFtQQVRDSCB2MTFdIGkyYzogZGVzaWdu
d2FyZTogZml4IGNvbnRyb2xsZXIgaXMgaG9sZGluZyBTQ0wgbG93IHdoaWxlIEVOQUJMRSBiaXQg
aXMgZGlzYWJsZWQNCj4+ICAgIEkgd2lsbCBjaGFuZ2UgdGhlIHN1YmplY3QgdG/vvJoNCj4+ICAg
IFN1YmplY3Q6ICBbUEFUQ0ggdjExXSBpMmM6IGRlc2lnbndhcmU6IGZpeCBjb250cm9sbGVyIGlz
IGhvbGRpbmcgU0NMIA0KPj4gIGxvdyB3aGlsZSB0aGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZA0K
Pj4gIA0KPiA+ID4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4gID5Gcm9tOiBBbmR5IFNo
ZXZjaGVua28gPGFuZHkuc2hldmNoZW5rb0BnbWFpbC5jb20+DQo+ID4gPlNlbnQ6IDIwMjTlubQ5
5pyIMTPml6UgMTU6NDENCj4gPiA+VG86IExpdSBLaW1yaXZlci/liJjph5HmsrMgPGtpbXJpdmVy
LmxpdUBzaWVuZ2luZS5jb20+DQo+ID4gPkNjOiBqYXJra28ubmlrdWxhQGxpbnV4LmludGVsLmNv
bTsgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOyANCj4gPiA+bWlrYS53ZXN0ZXJi
ZXJnQGxpbnV4LmludGVsLmNvbTsganNkQHNlbWloYWxmLmNvbTsgDQo+ID4gPmFuZGkuc2h5dGlA
a2VybmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgDQo+ID4gPmxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7IEFuZHkgPlNoZXZjaGVua28gPGFuZHlAa2VybmVsLm9yZz4NCj4+
ID5TdWJqZWN0OiBSZTogW1BBVENIIHYxMV0gaTJjOiBkZXNpZ253YXJlOiBmaXggY29udHJvbGxl
ciBpcyBob2xkaW5nIA0KPj4gPlNDTCBsb3cgd2hpbGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZA0K
Pj4gDQo+PiA+T24gRnJpLCBTZXAgMTMsIDIwMjQgYXQgNjozNeKAr0FNIEtpbXJpdmVyIExpdSA8
a2ltcml2ZXIubGl1QHNpZW5naW5lLmNvbT4gd3JvdGU6DQo+ID4+Pg0KPiA+Pj4gSXQgd2FzIG9i
c2VydmVkIHRoYXQgaXNzdWluZyB0aGUgQUJPUlQgYml0IChJQ19FTkFCTEVbMV0pIHdpbGwgbm90
IA0KPiA+Pj53b3JrIHdoZW4gSUNfRU5BQkxFIGlzIGFscmVhZHkgZGlzYWJsZWQuDQo+ID4+Pg0K
PiA+Pj4gQ2hlY2sgaWYgdGhlIEVOQUJMRSBiaXQgKElDX0VOQUJMRVswXSkgaXMgZGlzYWJsZWQg
d2hlbiB0aGUgDQo+ID4+PiBjb250cm9sbGVyIGlzIGhvbGRpbmcgU0NMIGxvdy4gSWYgdGhlIEVO
QUJMRSBiaXQgaXMgZGlzYWJsZWQsIHRoZSANCj4gPj4+IHNvZnR3YXJlIG5lZWRzIHRvIGVuYWJs
ZSBpdCBiZWZvcmUgdHJ5aW5nIHRvIGlzc3VlIHRoZSBBQk9SVCBiaXQuIA0KPiA+Pj4gb3RoZXJ3
aXNlLCB0aGUgY29udHJvbGxlciBpZ25vcmVzIGFueSB3cml0ZSB0byBBQk9SVCBiaXQuDQo+ID4+
Pg0KPiA+Pj5UaGVzZSBrZXJuZWwgbG9ncyBzaG93IHVwIHdoZW5ldmVyIGFuIEkyQyB0cmFuc2Fj
dGlvbiBpcyBhdHRlbXB0ZWQgDQo+ID4+PiBhZnRlciB0aGlzIGZhaWx1cmUuDQo+ID4+PiBpMmNf
ZGVzaWdud2FyZSBlOTVlMDAwMC5pMmM6IHRpbWVvdXQgd2FpdGluZyBmb3IgYnVzIHJlYWR5IA0K
PiA+Pj4gaTJjX2Rlc2lnbndhcmUgZTk1ZTAwMDAuaTJjOiB0aW1lb3V0IGluIGRpc2FibGluZyBh
ZGFwdGVyDQo+ID4+Pg0KPiA+Pj4gVGhlIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSB3aGVyZSB0aGUg
Y29udHJvbGxlciBjYW5ub3QgYmUgZGlzYWJsZWQgDQo+ID4+PiB3aGlsZSBTQ0wgaXMgaGVsZCBs
b3cgaWYgdGhlIEVOQUJMRSBiaXQgaXMgYWxyZWFkeSBkaXNhYmxlZC4NCj4gPj4NCj4gPj4uLi4N
Cj4gPj4NCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgIC8qU2V0IEVOQUJMRSBiaXQgYmVm
b3JlIHNldHRpbmcgQUJPUlQqLw0KPiA+DQo+ID4gICAgICAgLyogU2V0IEVOQUJMRSBiaXQgYmVm
b3JlIHNldHRpbmcgQUJPUlQgKi8NCj4gPg0KPiA+Pk1pc3Npbmcgc3BhY2VzDQo+ID4+DQo+ID4+
Li4uDQo+PiANCj4+ID4+ICsvKg0KPj4gPj4gKyAqIFRoaXMgZnVuY3Rpb24gd2FpdHMgY29udHJv
bGxlciBpZGxpbmcgYmVmb3JlIGRpc2FibGluZyBJMkMNCj4+IA0KPj4gPndhaXRzIGZvciBjb250
cm9sbGVyDQo+PiANCj4+ICArICogVGhpcyBmdW5jdGlvbiB3YWl0cyBmb3IgY29udHJvbGxlciBp
ZGxpbmcgYmVmb3JlIGRpc2FibGluZyBJMkMNCj4+IA0KPj4gPj4gKyAqIFdoZW4gdGhlIGNvbnRy
b2xsZXIgaXMgbm90IGluIHRoZSBJRExFIHN0YXRlLA0KPiA+Pj4gKyAqIE1TVF9BQ1RJVklUWSBi
aXQgKElDX1NUQVRVU1s1XSkgaXMgc2V0Lg0KPiA+Pj4gKyAqIFZhbHVlczoNCj4gPj4+ICsgKiAw
eDEgKEFDVElWRSk6IENvbnRyb2xsZXIgbm90IGlkbGUNCj4+ID4+ICsgKiAweDAgKElETEUpOiBD
b250cm9sbGVyIGlzIGlkbGUNCj4+ID4+ICsgKiBUaGUgZnVuY3Rpb24gaXMgY2FsbGVkIGFmdGVy
IHJldHVybmluZyB0aGUgZW5kIG9mIHRoZSBjdXJyZW50IA0KPj4gPj4gKyB0cmFuc2Zlcg0KPj4g
Pj4gKyAqIFJldHVybnM6DQo+PiANCj4+ID4+ICsgKiBGYWxzZSB3aGVuIGNvbnRyb2xsZXIgaXMg
aW4gSURMRSBzdGF0ZS4NCj4+ID4+ICsgKiBUcnVlIHdoZW4gY29udHJvbGxlciBpcyBpbiBBQ1RJ
VkUgc3RhdGUuDQo+PiANCj4gPj5ZZWFoLCBJIGtub3cgdGhhdCB0aGlzIGlzIGEgY29weSBvZiB3
aGF0IEkgc3VnZ2VzdGVkLCBidXQgaWYgd2UgZ29pbmcgDQo+ID4+dG8gYW1lbmQsIHRoZXNlIHNo
b3VsZCBiZSB3aXRoIGRlZmluaXRlIGFydGljbGUNCj4+IA0KPj4gPiAqIEZhbHNlIHdoZW4gdGhl
IGNvbnRyb2xsZXIgaXMgaW4gdGhlIElETEUgc3RhdGUuDQo+PiA+ICogVHJ1ZSB3aGVuIHRoZSBj
b250cm9sbGVyIGlzIGluIHRoZSBBQ1RJVkUgc3RhdGUuDQo+PiANCj4+ICANCj4+IA0KPj4gPj4g
KyAqLw0KPj4gDQo+PiA+Li4uDQo+PiANCj4+ID4+ICsgICAgICAgcmV0dXJuIHJlZ21hcF9yZWFk
X3BvbGxfdGltZW91dChkZXYtPm1hcCwgRFdfSUNfU1RBVFVTLCBzdGF0dXMsDQo+PiA+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAhKHN0YXR1cyAmIERXX0lDX1NUQVRV
U19NQVNURVJfQUNUSVZJVFkpLA0KPj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgMTEwMCwgMjAwMDApICE9IDA7DQo+PiANCj4+ID5Zb3UgYnJva2UgdGhlIGluZGVu
dGF0aW9uIGFnYWluLg0KPj4gDQo+PiBpdCBoYXMgYmVlbiBpbmRlbnRlZCBhbmQgYWxpZ25lZCBm
cm9tIHRoZSB3ZWLvvJoNCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC80ZWJjNGU4ODgy
YTUyNjIwY2JjYTMwZjFiZjI1NjUwY2JjMzcyM2ZiLjENCj4+IDcyNjE5NzgxNy5naXQua2ltcml2
ZXIubGl1QHNpZW5naW5lLmNvbS8NCj4+IA0KPj4gVGhhbmtz77yBDQo+PiANCj4+ID4tLQ0KIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIEJlc3QgUmVnYXJkcw0K
IEtpbXJpdmVyIExpdQ0K

