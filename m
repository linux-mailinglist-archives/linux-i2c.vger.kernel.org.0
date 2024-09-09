Return-Path: <linux-i2c+bounces-6412-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 178D2971C79
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 16:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B05EC283330
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 14:27:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35AB21BA27B;
	Mon,  9 Sep 2024 14:27:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8322146D75;
	Mon,  9 Sep 2024 14:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725892040; cv=none; b=ahU3KXQoxYJFj00h8xy2G7N5w1+OL4+oYz3sHhhjsXcQBc0hhm1tB615VK+U3wI6Bu6XezQBuX9ZxJata7b66jN0isXhG8Ixw+Jn9RkOQuyvfY1Er4OUOPeVVxv/SuRiMUJfUqsYQyqWo4JWAVQijGG9t/KbKRxjejDRO11NyWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725892040; c=relaxed/simple;
	bh=qA+N2Vn+WVOiYIn7d+r2813WD9/UASlD19dk1a1qpLY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NvvMIz9ElKJpaMxn2sZLeojnrUAY5k3X3dfHzAvo6ZmslrUW7wNmFbL2XuGm43rhnwuBVBPpakyYPp0qMOlBADhq0k+cGAyN8EipFTKo1ByJnizCn4oBfRnFp3de6gdwzNvM3crsDifql8ik6B2QN7W2XhR14KhlirXmXcIQRjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 489EQWSd097314
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 9 Sep 2024 22:26:32 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X2Tfb2zWQz7ZMkV;
	Mon,  9 Sep 2024 22:26:31 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 9 Sep 2024 22:26:30 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Mon, 9 Sep 2024 22:26:30 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Mon, 9 Sep 2024 22:26:30 +0800
From: =?utf-8?B?TGl1IEtpbXJpdmVyL+WImOmHkeaysw==?= <kimriver.liu@siengine.com>
To: "andi.shyti@kernel.org" <andi.shyti@kernel.org>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "jsd@semihalf.com" <jsd@semihalf.com>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "jarkko.nikula@linux.intel.com"
	<jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH v7] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Topic: [PATCH v7] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Index: AQHbAsRDmIldr9ML/Uut0TSKanMDVw==
Date: Mon, 9 Sep 2024 14:26:30 +0000
Message-ID: <9B8C909B-AF7A-4F0F-BD75-ED368BE71E28@siengine.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BC699AB27B51C4A90CDC923735E6D3F@siengine.com>
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
X-MAIL:mail03.siengine.com 489EQWSd097314

DQpISSBhbmRpDQoNCkR1ZSB0byBhIDEyIHRpbWUgZGlmZmVyZW5jZe+8jEkgaGFkIGJlZW4gb2Zm
IHdvcmsuDQpJIGFtIHZlcnkgc29ycnkgdGhhdCBJIGNhbid0IHJlcGx5IGVtYWlsIGluIHRpbWUu
IEkgd2lsbCByZXBseSB0byB5b3VyIGVtYWlsICBpbW1lZGlhdGVseSBhZnRlciBnb2luZyB0byB3
b3JrIHRvbW9ycm93Lg0KDQrlj5Hoh6rmiJHnmoTigIZpUGhvbmUNCg0KPkZyb206IEFuZGkgU2h5
dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4NCj5UbzogS2ltcml2ZXIgTGl1IDxraW1yaXZlci5s
aXVAc2llbmdpbmUuY29tPg0KPkNjOiBqYXJra28ubmlrdWxhQGxpbnV4LmludGVsLmNvbSwgYW5k
cml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tLA0KCSBtaWthLndlc3RlcmJlcmdAbGludXgu
aW50ZWwuY29tLCBqc2RAc2VtaWhhbGYuY29tLA0KCWxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmcs
ICBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSCB2N10g
aTJjOiBkZXNpZ253YXJlOiBmaXggbWFzdGVyIGlzIGhvbGRpbmcgU0NMIGxvdyB3aGlsZSBFTkFC
TEUgYml0IGlzIGRpc2FibGVkDQo+RGF0ZTogTW9uLCA5IFNlcCAyMDI0IDE1OjA4OjI1ICswMjAw
CVt0aHJlYWQgb3ZlcnZpZXddDQo+TWVzc2FnZS1JRDogPHRyYWo1dWhxYm55NXlybzNoZjcyazJx
cGdhN2V6N2N1cXYybWVzdmw3M2ZrdTJiNXhxQHV3NWRxamRjNm1tcz4gKHJhdykNCj5Jbi1SZXBs
eS1UbzogPDIwMjQwOTA5MDE1NjQ2LjIyODUtMS1raW1yaXZlci5saXVAc2llbmdpbmUuY29tPg0K
DQo+SGkgS2ltcml2ZXIsDQoNCj5PbiBNb24sIFNlcCAwOSwgMjAyNCBhdCAwOTo1Njo0NkFNIEdN
VCwgS2ltcml2ZXIgTGl1IHdyb3RlOg0KPj4gSXQgd2FzIG9ic2VydmVkIGlzc3VpbmcgQUJPUlQg
Yml0KElDX0VOQUJMRVsxXSkgd2lsbCBub3Qgd29yayB3aGVuDQo+PiBJQ19FTkFCTEUgaXMgYWxy
ZWFkeSBkaXNhYmxlZC4NCj4+IA0KPj4gQ2hlY2sgaWYgRU5BQkxFIGJpdChJQ19FTkFCTEVbMF0p
IGlzIGRpc2FibGVkIHdoZW4gdGhlIG1hc3RlciBpcw0KPj4gaG9sZGluZyBTQ0wgbG93LiBJZiBF
TkFCTEUgYml0IGlzIGRpc2FibGVkLCB0aGUgc29mdHdhcmUgbmVlZA0KPj4gZW5hYmxlIGl0IGJl
Zm9yZSB0cnlpbmcgdG8gaXNzdWUgQUJPUlQgYml0LiBvdGhlcndpc2UsDQo+PiB0aGUgY29udHJv
bGxlciBpZ25vcmVzIGFueSB3cml0ZSB0byBBQk9SVCBiaXQuDQo+PiANCj4+IFNpZ25lZC1vZmYt
Ynk6IEtpbXJpdmVyIExpdSA8a2ltcml2ZXIubGl1QHNpZW5naW5lLmNvbT4NCg0KPllvdSBmb3Jn
b3Q6DQoNCj5SZXZpZXdlZC1ieTogTWlrYSBXZXN0ZXJiZXJnIDxtaWthLndlc3RlcmJlcmdAbGlu
dXguaW50ZWwuY29tPg0KICANCiAgVGhhbmsgeW91IGZvciB0ZWxsaW5nIG1lDQogIA0KPj4gLS0t
DQo+PiBWNi0+Vjc6DQo+PiAJMS4gYWRkIFN1YmplY3QgdmVyc2lvbmluZyBbUEFUQ0ggdjddDQo+
PiAJMi4gY2hhbmdlIGZzbGVlcCgyNSkgdG8gdXNsZWVwX3JhbmdlKDI1LCAyNTApDQo+PiAJMy4g
QWRkIG1hY3JvIGRlZmluaXRpb24gRFdfaUNfRU5BQkxFX0VOQUJMRSB0byBmaXggY29tcGlsZSBl
cnJvcnMNCj4+IAk0LiBiYXNlOiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgv
a2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/aD1tYXN0ZXINCg0KPlRoYW5rcyBh
IGxvdCBmb3IgZm9sbG93aW5nIHVwISA6LSkNCg0KPj4gVjUtPlY2OiByZXN0b3JlIGkyY19kd19p
c19tYXN0ZXJfaWRsaW5nKCkgZnVuY3Rpb24gY2hlY2tpbmcNCj4+IFY0LT5WNTogZGVsZXRlIG1h
c3RlciBpZGxpbmcgY2hlY2tpbmcNCj4+IFYzLT5WNDoNCj4+IAkxLiB1cGRhdGUgY29tbWl0IG1l
c3NhZ2VzIGFuZCBhZGQgcGF0Y2ggdmVyc2lvbiBhbmQgY2hhbmdlbG9nDQo+PiAJMi4gbW92ZSBw
cmludCB0aGUgZXJyb3IgbWVzc2FnZSBpbiBpMmNfZHdfeGZlcg0KPj4gVjItPlYzOiBjaGFuZ2Ug
KCFlbmFibGUpIHRvICghKGVuYWJsZSAmIERXX0lDX0VOQUJMRV9FTkFCTEUpKQ0KPj4gVjEtPlYy
OiB1c2VkIHN0YW5kYXJkIHdvcmRzIGluIGZ1bmN0aW9uIG5hbWVzIGFuZCBhZGRyZXNzZWQgcmV2
aWV3IGNvbW1lbnRzDQo+PiANCj4+IGxpbmsgdG8gVjE6DQo+PiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9sa21sLzIwMjQwOTA0MDY0MjI0LjIzOTQtMS1raW1yaXZlci5saXVAc2llbmdpbmUuY29t
Lw0KPj4gLS0tDQoNCi4uLg0KDQo+PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2ln
bndhcmUtY29tbW9uLmMNCj4+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVzaWdud2Fy
ZS1jb21tb24uYw0KPj4gQEAgLTQ1Myw2ICs0NTMsMTggQEAgdm9pZCBfX2kyY19kd19kaXNhYmxl
KHN0cnVjdCBkd19pMmNfZGV2ICpkZXYpDQo+PiAgDQo+PiAgCWFib3J0X25lZWRlZCA9IHJhd19p
bnRyX3N0YXRzICYgRFdfSUNfSU5UUl9NU1RfT05fSE9MRDsNCj4+ICAJaWYgKGFib3J0X25lZWRl
ZCkgew0KPj4gKwkJaWYgKCEoZW5hYmxlICYgRFdfSUNfRU5BQkxFX0VOQUJMRSkpIHsNCj4+ICsJ
CQlyZWdtYXBfd3JpdGUoZGV2LT5tYXAsIERXX0lDX0VOQUJMRSwgRFdfSUNfRU5BQkxFX0VOQUJM
RSk7DQo+PiArCQkJZW5hYmxlIHw9IERXX0lDX0VOQUJMRV9FTkFCTEU7DQo+PiArCQkJLyoNCj4+
ICsJCQkgKiBOZWVkIHR3byBpY19jbGsgZGVsYXkgd2hlbiBlbmFibGluZyB0aGUgSTJDIHRvIGVu
c3VyZSBFTkFCTEUgYml0DQo+PiArCQkJICogaXMgYWxyZWFkeSBzZXQuIFdhaXQgMTAgdGltZXMg
dGhlIHNpZ25hbGluZyBwZXJpb2Qgb2YgdGhlIGhpZ2hlc3QNCj4+ICsJCQkgKiBJMkMgdHJhbnNm
ZXIgc3VwcG9ydGVkIGJ5IHRoZSBkcml2ZXIoZm9yIDQwMEtIeiB0aGlzIGlzIDI1dXMpDQo+PiAr
CQkJICogYXMgZGVzY3JpYmVkIGluIHRoZSBEZXNpZ25XYXJlIEkyQyBkYXRhYm9vay4NCj4+ICsJ
CQkgKi8NCj4+ICsJCQl1c2xlZXBfcmFuZ2UoMjUsIDI1MCk7DQoNCj5JIHRoaW5rIHRoZXJlIGlz
IGEgbWlzdW5kZXJzdGFuZGluZyBoZXJlLiBBbmR5IGFza2VkIHlvdSB0byB1c2UNCj5mbHNlZXAg
YW5kIGltcHJvdmUgdGhlIGNhbGN1bGF0aW9uOiAiUGxlYXNlLCBjYWxjdWxhdGUgdGhpcyBkZWxh
eQ0KPmJhc2VkIG9uIHRoZSBhY3R1YWwgc3BlZWQgaW4gdXNlIChvciBhYm91dCB0byBiZSBpbiB1
c2UpLiJbKl0NCg0KPkFuZHkgY2FuIHlvdSBwbGVhc2UgY2xhcmlmeSB3aXRoIEtpbXJpdmVyIGhl
cmU/DQoNCiBpZiB3ZSB1c2UgNDAwa0h6ICxuZWVkIHNldHRpbmcgZmxzZWVwKDI1KTsNCiBpZiB3
ZSB1c2UgMTAwa0h6ICxuZWVkIHNldHRpbmcgZmxzZWVwKDEwMCk7DQogT3ZlcmFsbCwgdGFrZSB0
aGUgbWF4aW11bSB2YWx1ZTpmbHNlZXAoMTAwKTsNCg0KPiAtLQ0KPiAyLjE3LjENCg==

