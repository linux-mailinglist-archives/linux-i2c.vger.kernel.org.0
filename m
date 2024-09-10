Return-Path: <linux-i2c+bounces-6472-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D16972FBB
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 11:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9ABB8B27E23
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 09:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2256818C347;
	Tue, 10 Sep 2024 09:54:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2E318B495;
	Tue, 10 Sep 2024 09:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725962042; cv=none; b=HQ6Lu1hUuLHnQIpSKi9SVCQ/+GKfRmLeMwbYtIJ3DkRiOS50eVrauQIaXHIGtIKad4irVfG78oHx8UhMpm4JrBcwfTB/HMeP9ahVomz6WFu14gKnljQ0dl+YwiW62uJyb2L7HKQnNktB9R9CUf6RemELGFI8bpv9xvXYD6U/rnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725962042; c=relaxed/simple;
	bh=tY4CTWLOfbRQqs2CZoQjqgdVrpqwEaUPi+PflwjPp8g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qps1hEemuM4ZzclB+CT1rtNQPfKcFe8+iZnUFd1G4KJgAypJBlA3KnKC+Kpk0Q+1RjDdQz/1QLC7rEC/z5Ca/IXB9nBzL/ZSpdR7QILYL1nPTB5KQfAwTSllvKTlhdb8quy0Ds9TTWx7cuRP/Fjs55IDRP+UzmMfVVC33aFDGZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48A9rMTG059615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 10 Sep 2024 17:53:22 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X2zXx22jsz7ZMhG;
	Tue, 10 Sep 2024 17:53:21 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Tue, 10 Sep 2024 17:53:20 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Tue, 10 Sep 2024 17:53:20 +0800
From: =?gb2312?B?TGl1IEtpbXJpdmVyL8H1vfC60w==?= <kimriver.liu@siengine.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
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
Thread-Index: AQHbA0iDEXTpjDBp/E6xp/M7s9EaBrJQM7AAgACQVAA=
Date: Tue, 10 Sep 2024 09:53:20 +0000
Message-ID: <5d47dd133343473b9108c22fe5ff9a44@siengine.com>
References: <9d181a45f3edf92364c9e6b729638f0b3f2e7baa.1725946886.git.kimriver.liu@siengine.com>
 <3ededf4f-7fba-4b15-ada8-a7172bd56caa@linux.intel.com>
In-Reply-To: <3ededf4f-7fba-4b15-ada8-a7172bd56caa@linux.intel.com>
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
X-MAIL:mail03.siengine.com 48A9rMTG059615

SGkgSmFya2tvIA0KDQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBKYXJra28g
TmlrdWxhIDxqYXJra28ubmlrdWxhQGxpbnV4LmludGVsLmNvbT4gDQo+U2VudDogMjAyNMTqOdTC
MTDI1SAxNzowMw0KPlRvOiBMaXUgS2ltcml2ZXIvwfW98LrTIDxraW1yaXZlci5saXVAc2llbmdp
bmUuY29tPg0KPkNjOiBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb207IG1pa2Eud2Vz
dGVyYmVyZ0BsaW51eC5pbnRlbC5jb207IGpzZEBzZW1paGFsZi5jb207IGFuZGkuc2h5dGlAa2Vy
bmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjhdIGkyYzogZGVzaWdud2FyZTogZml4IG1h
c3RlciBpcyBob2xkaW5nIFNDTCBsb3cgd2hpbGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZA0KDQo+
T24gOS8xMC8yNCA5OjEzIEFNLCBLaW1yaXZlciBMaXUgd3JvdGU6DQo+PiBJdCB3YXMgb2JzZXJ2
ZWQgaXNzdWluZyBBQk9SVCBiaXQoSUNfRU5BQkxFWzFdKSB3aWxsIG5vdCB3b3JrIHdoZW4gDQo+
PiBJQ19FTkFCTEUgaXMgYWxyZWFkeSBkaXNhYmxlZC4NCj4+IA0KPj4gQ2hlY2sgaWYgRU5BQkxF
IGJpdChJQ19FTkFCTEVbMF0pIGlzIGRpc2FibGVkIHdoZW4gdGhlIG1hc3RlciBpcyANCj4+IGhv
bGRpbmcgU0NMIGxvdy4gSWYgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZCwgdGhlIHNvZnR3YXJlIG5l
ZWQgZW5hYmxlIA0KPj4gaXQgYmVmb3JlIHRyeWluZyB0byBpc3N1ZSBBQk9SVCBiaXQuIG90aGVy
d2lzZSwgdGhlIGNvbnRyb2xsZXIgaWdub3JlcyANCj4+IGFueSB3cml0ZSB0byBBQk9SVCBiaXQu
DQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEtpbXJpdmVyIExpdSA8a2ltcml2ZXIubGl1QHNpZW5n
aW5lLmNvbT4NCj4+IFJldmlld2VkLWJ5OiBNaWthIFdlc3RlcmJlcmcgPG1pa2Eud2VzdGVyYmVy
Z0BsaW51eC5pbnRlbC5jb20+DQo+PiANCj4+IC0tLQ0KPj4gVjctPlY4Og0KPj4gCTEuY2FsY3Vs
YXRlIHRoaXMgZGVsYXkgYmFzZWQgb24gdGhlIGFjdHVhbCBzcGVlZCBpbiB1c2UNCj4+IAkgIGZz
bGVlcChESVZfUk9VTkRfQ0xPU0VTVF9VTEwoMTAgKiBNSUNSTywgdC0+YnVzX2ZyZXFfaHopKQ0K
Pj4gCTIuIGFkZCBSZXZpZXdlZC1ieTogTWlrYSBXZXN0ZXJiZXJnPG1pa2Eud2VzdGVyYmVyZ0Bs
aW51eC5pbnRlbC5jb20+DQo+PiBWNi0+Vjc6DQo+PiAJMS4gYWRkIFN1YmplY3QgdmVyc2lvbmlu
ZyBbUEFUQ0ggdjddDQo+PiAJMi4gY2hhbmdlIGZzbGVlcCgyNSkgdG8gdXNsZWVwX3JhbmdlKDI1
LCAyNTApDQo+PiAJMy4gQWRkIG1hY3JvIGRlZmluaXRpb24gRFdfaUNfRU5BQkxFX0VOQUJMRSB0
byBmaXggY29tcGlsZSBlcnJvcnMNCj4+IAkgIHwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJv
Ym90IDxsa3BAaW50ZWwuY29tPg0KPj4gCSAgfCBDbG9zZXM6aHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvb2Uta2J1aWxkLWFsbC8yMDI0MDkwODIwMTEuOUpGNmFZc2stbGtwQGludGVsLmNvbS8NCj4+
IAk0LiBiYXNlOiANCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJu
ZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWkNCj4+IHQvP2g9bWFzdGVyDQo+PiBWNS0+VjY6
IHJlc3RvcmUgaTJjX2R3X2lzX21hc3Rlcl9pZGxpbmcoKSBmdW5jdGlvbiBjaGVja2luZw0KPj4g
VjQtPlY1OiBkZWxldGUgbWFzdGVyIGlkbGluZyBjaGVja2luZw0KPj4gVjMtPlY0Og0KPj4gCTEu
IHVwZGF0ZSBjb21taXQgbWVzc2FnZXMgYW5kIGFkZCBwYXRjaCB2ZXJzaW9uIGFuZCBjaGFuZ2Vs
b2cNCj4+IAkyLiBtb3ZlIHByaW50IHRoZSBlcnJvciBtZXNzYWdlIGluIGkyY19kd194ZmVyDQo+
PiBWMi0+VjM6IGNoYW5nZSAoIWVuYWJsZSkgdG8gKCEoZW5hYmxlICYgRFdfSUNfRU5BQkxFX0VO
QUJMRSkpDQo+PiBWMS0+VjI6IHVzZWQgc3RhbmRhcmQgd29yZHMgaW4gZnVuY3Rpb24gbmFtZXMg
YW5kIGFkZHJlc3NlZCByZXZpZXcgDQo+PiBWMS0+Y29tbWVudHMNCj4+IA0KPj4gbGluayB0byBW
MToNCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDA5MDQwNjQyMjQuMjM5NC0x
LWtpbXJpdmVyLmxpdUBzaWVuZ2kNCj4+IG5lLmNvbS8NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLWRlc2lnbndhcmUtY29tbW9uLmMgfCAxMyArKysrKysrKysrKysrDQo+PiAg
IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2FyZS1jb3JlLmggICB8ICAxICsNCj4+ICAg
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLW1hc3Rlci5jIHwgMjIgKysrKysrKysr
KysrKysrKysrKysrKw0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykNCj4+
IA0KPkFja2VkLWJ5OiBKYXJra28gTmlrdWxhIDxqYXJra28ubmlrdWxhQGxpbnV4LmludGVsLmNv
bT4NCg0KVGhhbmtzIGZvciB0aGUgQWNrZWQhDQoNCkkgd2lsbCB1cGRhdGUgYSBuZXcgdmVyc2lv
biBWOSBiYXNlZCBvbiBBbmR5J3Mgc3VnZ2VzdGlvbnMuDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KQmVzdCBSZWdhcmRzDQpLaW1yaXZlciBMaXUNCg==

