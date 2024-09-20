Return-Path: <linux-i2c+bounces-6890-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0219B97D3D1
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 11:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A11061F21B4D
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Sep 2024 09:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FABA757EA;
	Fri, 20 Sep 2024 09:41:34 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB531EA6F
	for <linux-i2c@vger.kernel.org>; Fri, 20 Sep 2024 09:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726825294; cv=none; b=TiWJwTpKuVWYlV6SvFLA/nEVXyGI+iDFDEFLoM7O0ZZFKjYEHg+i362Nn0bBblV6XhWEJ9yUv6ftoIm5Q4EiVpPfAY0kVhHpofRmGxYWHQFu6PIj/6aSzW31qkPDPg8MuYOXjT/cd1jYiIaWJ6HOB5wsUjFQBYSkeeDqewuFlZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726825294; c=relaxed/simple;
	bh=Oxlp3kFgnZ2io4E0Uy8G4L4nD5sMydeDVAI915eg+10=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dRTdcVAgavuhqdsWsb+hFkcqvLBbwUAx0teMFAdLu8a1nFOE2tg4gT/+AF1ecZmU8Qd6gGx7t//fobAid3SHHQ21hM0lEMDQDcfoK06QZZ8Ng4xrWjEvHNYJCdS2yK4jmbXbZ4i93cvQtcNEn4/NOSphJAKE2hIK9x/Xp2plCA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48K9fHj4012218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 20 Sep 2024 17:41:17 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X96pN61jvz7ZMv2;
	Fri, 20 Sep 2024 17:41:16 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Fri, 20 Sep 2024 17:41:15 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Fri, 20 Sep 2024 17:41:14 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Fri, 20 Sep 2024 17:41:14 +0800
From: =?gb2312?B?TGl1IEtpbXJpdmVyL8H1vfC60w==?= <kimriver.liu@siengine.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
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
Thread-Index: AQHbBY3Guj+rQp1Ui0uJhUssx5pO0bJf45mAgACQdhA=
Date: Fri, 20 Sep 2024 09:41:14 +0000
Message-ID: <c81956a4215a4ca587b9c4e541b0cb0d@siengine.com>
References: <4ebc4e8882a52620cbca30f1bf25650cbc3723fb.1726197817.git.kimriver.liu@siengine.com>
 <hua4cnnstss2lw5ejau25ktdiujwz3m3ixawnfuz7havwsr7vc@i7jlayooy3ha>
In-Reply-To: <hua4cnnstss2lw5ejau25ktdiujwz3m3ixawnfuz7havwsr7vc@i7jlayooy3ha>
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
X-MAIL:mail03.siengine.com 48K9fHj4012218

SEksIEFuZGkNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQW5kaSBTaHl0
aSA8YW5kaS5zaHl0aUBrZXJuZWwub3JnPiANCj5TZW50OiAyMDI0xOo51MIyMMjVIDE2OjUyDQo+
VG86IExpdSBLaW1yaXZlci/B9b3wutMgPGtpbXJpdmVyLmxpdUBzaWVuZ2luZS5jb20+DQo+Q2M6
IGphcmtrby5uaWt1bGFAbGludXguaW50ZWwuY29tOyBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5p
bnRlbC5jb207IG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb207IGpzZEBzZW1paGFsZi5j
b207IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IEFuZHkgU2hldmNoZW5rbyA+PGFuZHlAa2VybmVsLm9yZz4NCj5TdWJqZWN0OiBSZTogW1BB
VENIIHYxMV0gaTJjOiBkZXNpZ253YXJlOiBmaXggY29udHJvbGxlciBpcyBob2xkaW5nIFNDTCBs
b3cgd2hpbGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZA0KDQo+SGkgS2ltcml2ZXIsDQoNCj5PbiBG
cmksIFNlcCAxMywgMjAyNCBhdCAxMTozMTo0NkFNIEdNVCwgS2ltcml2ZXIgTGl1IHdyb3RlOg0K
Pj4gSXQgd2FzIG9ic2VydmVkIHRoYXQgaXNzdWluZyB0aGUgQUJPUlQgYml0IChJQ19FTkFCTEVb
MV0pIHdpbGwgbm90DQo+PiB3b3JrIHdoZW4gSUNfRU5BQkxFIGlzIGFscmVhZHkgZGlzYWJsZWQu
DQo+PiANCj4+IENoZWNrIGlmIHRoZSBFTkFCTEUgYml0IChJQ19FTkFCTEVbMF0pIGlzIGRpc2Fi
bGVkIHdoZW4gdGhlIGNvbnRyb2xsZXINCj4+IGlzIGhvbGRpbmcgU0NMIGxvdy4gSWYgdGhlIEVO
QUJMRSBiaXQgaXMgZGlzYWJsZWQsIHRoZSBzb2Z0d2FyZSBuZWVkcw0KPj4gdG8gZW5hYmxlIGl0
IGJlZm9yZSB0cnlpbmcgdG8gaXNzdWUgdGhlIEFCT1JUIGJpdC4gb3RoZXJ3aXNlLA0KPj4gdGhl
IGNvbnRyb2xsZXIgaWdub3JlcyBhbnkgd3JpdGUgdG8gQUJPUlQgYml0Lg0KPj4gDQo+PiBUaGVz
ZSBrZXJuZWwgbG9ncyBzaG93IHVwIHdoZW5ldmVyIGFuIEkyQyB0cmFuc2FjdGlvbiBpcw0KPj4g
YXR0ZW1wdGVkIGFmdGVyIHRoaXMgZmFpbHVyZS4NCj4+IGkyY19kZXNpZ253YXJlIGU5NWUwMDAw
LmkyYzogdGltZW91dCB3YWl0aW5nIGZvciBidXMgcmVhZHkNCj4+IGkyY19kZXNpZ253YXJlIGU5
NWUwMDAwLmkyYzogdGltZW91dCBpbiBkaXNhYmxpbmcgYWRhcHRlcg0KPj4gDQo+PiBUaGUgcGF0
Y2ggZml4ZXMgdGhlIGlzc3VlIHdoZXJlIHRoZSBjb250cm9sbGVyIGNhbm5vdCBiZSBkaXNhYmxl
ZA0KPj4gd2hpbGUgU0NMIGlzIGhlbGQgbG93IGlmIHRoZSBFTkFCTEUgYml0IGlzIGFscmVhZHkg
ZGlzYWJsZWQuDQo+PiANCj4+IEZpeGVzOiAyNDA5MjA1YWNkM2MgKCJpMmM6IGRlc2lnbndhcmU6
IGZpeCBfX2kyY19kd19kaXNhYmxlKCkgaW4gY2FzZSBtYXN0ZXIgaXMgaG9sZGluZyBTQ0wgbG93
IikNCj4+IFNpZ25lZC1vZmYtYnk6IEtpbXJpdmVyIExpdSA8a2ltcml2ZXIubGl1QHNpZW5naW5l
LmNvbT4NCj4+IFJldmlld2VkLWJ5OiBNaWthIFdlc3RlcmJlcmcgPG1pa2Eud2VzdGVyYmVyZ0Bs
aW51eC5pbnRlbC5jb20+DQo+PiBBY2tlZC1ieTogSmFya2tvIE5pa3VsYSA8amFya2tvLm5pa3Vs
YUBsaW51eC5pbnRlbC5jb20+DQo+PiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5
QGtlcm5lbC5vcmc+DQoNCj5JJ20gc29ycnkgZm9yIHRoZSBkZWxheSwgYnV0IEkgbmVlZGVkIHRv
IHdhaXQgZm9yIHRoZSBwcmV2aW91cw0KPmJhdGNoIG9mIGZpeGVzIHRvIGJlIG1lcmdlZC4NCj4N
Cj4gWy4uLl0NCj4NCj4+ICsvKg0KPj4gKyAqIFRoaXMgZnVuY3Rpb24gd2FpdHMgY29udHJvbGxl
ciBpZGxpbmcgYmVmb3JlIGRpc2FibGluZyBJMkMNCj4+ICsgKiBXaGVuIHRoZSBjb250cm9sbGVy
IGlzIG5vdCBpbiB0aGUgSURMRSBzdGF0ZSwNCj4+ICsgKiBNU1RfQUNUSVZJVFkgYml0IChJQ19T
VEFUVVNbNV0pIGlzIHNldC4NCj4+ICsgKiBWYWx1ZXM6DQo+PiArICogMHgxIChBQ1RJVkUpOiBD
b250cm9sbGVyIG5vdCBpZGxlDQo+PiArICogMHgwIChJRExFKTogQ29udHJvbGxlciBpcyBpZGxl
DQo+PiArICogVGhlIGZ1bmN0aW9uIGlzIGNhbGxlZCBhZnRlciByZXR1cm5pbmcgdGhlIGVuZCBv
ZiB0aGUgY3VycmVudCB0cmFuc2Zlcg0KPj4gKyAqIFJldHVybnM6DQo+PiArICogRmFsc2Ugd2hl
biBjb250cm9sbGVyIGlzIGluIElETEUgc3RhdGUuDQo+PiArICogVHJ1ZSB3aGVuIGNvbnRyb2xs
ZXIgaXMgaW4gQUNUSVZFIHN0YXRlLg0KPj4gKyAqLw0KDQo+SSB0b29rIHRoZSBsaWJlcnR5IG9m
IG1ha2luZyBzb21lIHNtYWxsIGNoYW5nZXMgdG8gdGhlIGNvbW1lbnQ6DQoNCj4rLyoNCj4rICog
VGhpcyBmdW5jdGlvbiB3YWl0cyBmb3IgdGhlIGNvbnRyb2xsZXIgdG8gYmUgaWRsZSBiZWZvcmUg
ZGlzYWJsaW5nIEkyQw0KPisgKiBXaGVuIHRoZSBjb250cm9sbGVyIGlzIG5vdCBpbiB0aGUgSURM
RSBzdGF0ZSwgdGhlIE1TVF9BQ1RJVklUWSBiaXQNCj4rICogKElDX1NUQVRVU1s1XSkgaXMgc2V0
Lg0KPisgKg0KPisgKiBWYWx1ZXM6DQo+KyAqIDB4MSAoQUNUSVZFKTogQ29udHJvbGxlciBub3Qg
aWRsZQ0KPisgKiAweDAgKElETEUpOiBDb250cm9sbGVyIGlzIGlkbGUNCj4rICoNCj4rICogVGhl
IGZ1bmN0aW9uIGlzIGNhbGxlZCBhZnRlciBjb21wbGV0aW5nIHRoZSBjdXJyZW50IHRyYW5zZmVy
Lg0KPisgKg0KPisgKiBSZXR1cm5zOg0KPisgKiBGYWxzZSB3aGVuIHRoZSBjb250cm9sbGVyIGlz
IGluIHRoZSBJRExFIHN0YXRlLg0KPisgKiBUcnVlIHdoZW4gdGhlIGNvbnRyb2xsZXIgaXMgaW4g
dGhlIEFDVElWRSBzdGF0ZS4NCj4rICovDQoNCj5mb3IgYW4gaW1wcm92ZWQgY2xhcml0eSBhbmQg
YWRkcmVzcyBhIGZldyBncmFtbWF0aWNhbCBpc3N1ZXMuDQo+UGxlYXNlIHZlcmlmeSB0aGF0IGl0
J3MgY29ycmVjdC4NCg0KPkkgbWVyZ2VkIHlvdXIgcGF0Y2ggdG8gaTJjL2kyYy1ob3N0LWZpeGVz
IGFsb25nIHdpdGggdGhlIGxhdGVzdCANCj5jaGFuZ2VzIHByb3Bvc2VkIGJ5IEFuZHkuDQoNCj5U
aGFua3MgZm9yIHlvdXIgd29yaywNCj5BbmRpDQoNCllvdXIgc21hbGwgY2hhbmdlcyBtYWtlIHRo
ZSBjb21tZW50cyBjbGVhcmVyIGFuZCBtb3JlIHBlcmZlY3QuDQpUaGFua3MuDQotLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkJlc3QgUmVnYXJkcw0KS2ltcml2ZXIg
TGl1DQo=

