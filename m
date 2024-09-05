Return-Path: <linux-i2c+bounces-6219-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A56B96CCC9
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 04:47:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FE771F271FA
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 02:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F118136E21;
	Thu,  5 Sep 2024 02:47:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2451FDA;
	Thu,  5 Sep 2024 02:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725504461; cv=none; b=Iem3gCNzwNKsorjRDKp8GqRiejnPebrrS6gKLjO4RK62mIvyB2sGUZ39F3gm0B2BM3iUJcvGkJp+YvQT8Z3QEbvAe1hlnqo/EuninpD+eGkUc7mIchu84Dfptp8zguhB+O4Pkmy2ViGlaOFS+ukGl6rkEPtVVdOJLQp90XCYdEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725504461; c=relaxed/simple;
	bh=DhoDKVBAUT8AgXJcIdb7+HLGvgvn5SxTmdfVpZP4jPM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cAsxjpQB6gFfJ57Y8zWIX3F+c17QopYEvCbI6aA00XA6gmGNNgEB/TdrsvgWgvcPy0DwP597CoHUpXTNh0NvBUJQKeWKhHS4hT2l6SFd+CGnE1P3z9iuo87Vo/RQbCEPJJ1OMtnMqFyGIIYbmkoIFNZ4pIrKkrCicYIijfG+mLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 4852kmOG089921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 5 Sep 2024 10:46:48 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4WzkK33wj6z7ZMtc;
	Thu,  5 Sep 2024 10:46:47 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Thu, 5 Sep 2024 10:46:48 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 10:46:47 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Thu, 5 Sep 2024 10:46:47 +0800
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
Subject: =?gb2312?B?u9i4tDogW1BBVENIXSBpMmM6IGRlc2lnbndhcmU6IGZpeCBtYXN0ZXIgaXMg?=
 =?gb2312?Q?holding_SCL_low_while_ENABLE_bit_is_disabled?=
Thread-Topic: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Index: AQHa/pXqYN5O6bu3D02ZGK2PUsfYN7JHECeAgAFrduA=
Date: Thu, 5 Sep 2024 02:46:47 +0000
Message-ID: <5d0dd59f21bc44c582b18db99a3d7672@siengine.com>
References: <20240904064224.2394-1-kimriver.liu@siengine.com>
 <ZthYwQfj3Vy6dU-S@smile.fi.intel.com>
In-Reply-To: <ZthYwQfj3Vy6dU-S@smile.fi.intel.com>
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
X-MAIL:mail03.siengine.com 4852kmOG089921

CVRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLiBJIHdpbGwgcmV2aXNlIGl0IGFjY29yZGluZyB0
byB5b3VyIHN1Z2dlc3Rpb25zIA0KYW5kIHJlc2VuZCB0aGUgcGF0Y2guDQoNCkJlc3QgUmVnYXJk
cw0KDQotLS0tLdPKvP7Urbz+LS0tLS0NCreivP7IyzogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IA0Kt6LLzcqxvOQ6IDIwMjTE6jnUwjTI1SAyMDo1
NQ0KytW8/sjLOiBMaXUgS2ltcml2ZXIvwfW98LrTIDxraW1yaXZlci5saXVAc2llbmdpbmUuY29t
Pg0Ks63LzTogamFya2tvLm5pa3VsYUBsaW51eC5pbnRlbC5jb207IG1pa2Eud2VzdGVyYmVyZ0Bs
aW51eC5pbnRlbC5jb207IGpzZEBzZW1paGFsZi5jb207IGFuZGkuc2h5dGlAa2VybmVsLm9yZzsg
bGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0K
1vfM4jogUmU6IFtQQVRDSF0gaTJjOiBkZXNpZ253YXJlOiBmaXggbWFzdGVyIGlzIGhvbGRpbmcg
U0NMIGxvdyB3aGlsZSBFTkFCTEUgYml0IGlzIGRpc2FibGVkDQoNCk9uIFdlZCwgU2VwIDA0LCAy
MDI0IGF0IDAyOjQyOjI0UE0gKzA4MDAsIGtpbXJpdmVyIGxpdSB3cm90ZToNCj4gRnJvbTogImtp
bXJpdmVyLmxpdSIgPGtpbXJpdmVyLmxpdUBzaWVuZ2luZS5jb20+DQo+IA0KPiBGYWlsdXJlIGlu
IG5vcm1hbCBTdG9wIG9wZXJhdGlvbmFsIHBhdGgNCj4gDQo+IFRoaXMgZmFpbHVyZSBoYXBwZW5z
IHJhcmVseSBhbmQgaXMgaGFyZCB0byByZXByb2R1Y2UuIERlYnVnIHRyYWNlIA0KPiBzaG93ZWQg
dGhhdCBJQ19TVEFUVVMgaGFkIHZhbHVlIG9mIDB4MjMgd2hlbiBTVE9QX0RFVCBvY2N1cnJlZCwg
DQo+IGltbWVkaWF0ZWx5IGRpc2FibGUgRU5BQkxFIGJpdCB0aGF0IGNhbiByZXN1bHQgaW4gDQo+
IElDX1JBV19JTlRSX1NUQVQuTUFTVEVSX09OX0hPTEQgaG9sZGluZyBTQ0wgbG93Lg0KPiANCj4g
RmFpbHVyZSBpbiBFTkFCTEUgYml0IGlzIGRpc2FibGVkIHBhdGgNCj4gDQo+IEl0IHdhcyBvYnNl
cnZlZCB0aGF0IG1hc3RlciBpcyBob2xkaW5nIFNDTCBsb3cgYW5kIHRoZSBJQ19FTkFCTEUgaXMg
DQo+IGFscmVhZHkgZGlzYWJsZWQsIEVuYWJsZSBBQk9SVCBiaXQgYW5kIEVOQUJMRSBiaXQgc2lt
dWx0YW5lb3VzbHkgDQo+IGNhbm5vdCB0YWtlIGVmZmVjdC4NCj4gDQo+IENoZWNrIGlmIHRoZSBt
YXN0ZXIgaXMgaG9sZGluZyBTQ0wgbG93IGFmdGVyIEVOQUJMRSBiaXQgaXMgYWxyZWFkeSANCj4g
ZGlzYWJsZWQuIElmIFNDTCBpcyBoZWxkIGxvdywgVGhlIHNvZnR3YXJlIGNhbiBzZXQgdGhpcyBB
Qk9SVCBiaXQgb25seSANCj4gd2hlbiBFTkFCTEUgaXMgYWxyZWFkeSBzZXSjrG90aGVyd2lzZSwN
Cj4gdGhlIGNvbnRyb2xsZXIgaWdub3JlcyBhbnkgd3JpdGUgdG8gQUJPUlQgYml0LiBXaGVuIHRo
ZSBhYm9ydCBpcyBkb25lLCANCj4gdGhlbiBwcm9jZWVkIHdpdGggZGlzYWJsaW5nIHRoZSBjb250
cm9sbGVyLg0KPiANCj4gVGhlc2Uga2VybmVsIGxvZ3Mgc2hvdyB1cCB3aGVuZXZlciBhbiBJMkMg
dHJhbnNhY3Rpb24gaXMgYXR0ZW1wdGVkIA0KPiBhZnRlciB0aGlzIGZhaWx1cmUuDQo+IGkyY19k
ZXNpZ253YXJlIGU5NWUwMDAwLmkyYzogdGltZW91dCBpbiBkaXNhYmxpbmcgYWRhcHRlciANCj4g
aTJjX2Rlc2lnbndhcmUgZTk1ZTAwMDAuaTJjOiB0aW1lb3V0IHdhaXRpbmcgZm9yIGJ1cyByZWFk
eQ0KPiANCj4gVGhlIHBhdGNoIGNhbiBiZSBmaXggdGhlIGNvbnRyb2xsZXIgY2Fubm90IGJlIGRp
c2FibGVkIHdoaWxlIFNDTCBpcyANCj4gaGVsZCBsb3cgaW4gRU5BQkxFIGJpdCBpcyBhbHJlYWR5
IGRpc2FibGVkLg0KDQouLi4NCg0KPiAgCWFib3J0X25lZWRlZCA9IHJhd19pbnRyX3N0YXRzICYg
RFdfSUNfSU5UUl9NU1RfT05fSE9MRDsNCj4gIAlpZiAoYWJvcnRfbmVlZGVkKSB7DQo+ICsJCWlm
ICghZW5hYmxlKSB7DQo+ICsJCQlyZWdtYXBfd3JpdGUoZGV2LT5tYXAsIERXX0lDX0VOQUJMRSwg
RFdfSUNfRU5BQkxFX0VOQUJMRSk7DQo+ICsJCQllbmFibGUgfD0gRFdfSUNfRU5BQkxFX0VOQUJM
RTsNCg0KPiArCQkJdXNsZWVwX3JhbmdlKDI1LCAxMDApOw0KDQpmc2xlZXAoKQ0KDQpBbmQgYWRk
IGEgc2hvcnQgY29tbWVudCB0byBleHBsYWluIHRoZSBjaG9zZW4gdmFsdWUuDQoNCj4gKwkJfQ0K
DQouLi4NCg0KPiArc3RhdGljIGludCBpMmNfZHdfY2hlY2tfbXN0X2FjdGl2aXR5KHN0cnVjdCBk
d19pMmNfZGV2ICpkZXYpIHsNCj4gKwl1MzIgc3RhdHVzID0gMDsNCj4gKwlpbnQgcmV0ID0gMDsN
Cj4gKw0KPiArCXJlZ21hcF9yZWFkKGRldi0+bWFwLCBEV19JQ19TVEFUVVMsICZzdGF0dXMpOw0K
PiArCWlmIChzdGF0dXMgJiBEV19JQ19TVEFUVVNfTUFTVEVSX0FDVElWSVRZKSB7DQo+ICsJCXJl
dCA9IHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dChkZXYtPm1hcCwgRFdfSUNfU1RBVFVTLCBzdGF0
dXMsDQo+ICsJCQkJIShzdGF0dXMgJiBEV19JQ19TVEFUVVNfTUFTVEVSX0FDVElWSVRZKSwNCj4g
KwkJCQkxMTAwLCAyMDAwMCk7DQo+ICsJCWlmIChyZXQpDQo+ICsJCQlkZXZfZXJyKGRldi0+ZGV2
LCAiaTJjIG1zdCBhY3Rpdml0eSBub3QgaWRsZSAlZFxuIiwgcmV0KTsNCj4gKwl9DQo+ICsNCj4g
KwlyZXR1cm4gcmV0Ow0KDQpUaGlzIGNhbiBiZSByZXdyaXR0ZW4gYXMNCg0KCXUzMiBzdGF0dXMg
PSAwOw0KCWludCByZXQ7DQoNCglyZWdtYXBfcmVhZChkZXYtPm1hcCwgRFdfSUNfU1RBVFVTLCAm
c3RhdHVzKTsNCglpZiAoIXN0YXR1cyAmIERXX0lDX1NUQVRVU19NQVNURVJfQUNUSVZJVFkpKQ0K
CQlyZXR1cm4gMDsNCg0KCXJldCA9IHJlZ21hcF9yZWFkX3BvbGxfdGltZW91dChkZXYtPm1hcCwg
RFdfSUNfU1RBVFVTLCBzdGF0dXMsDQoJCQkhKHN0YXR1cyAmIERXX0lDX1NUQVRVU19NQVNURVJf
QUNUSVZJVFkpLA0KCQkJMTEwMCwgMjAwMDApOw0KCWlmIChyZXQpDQoJCWRldl9lcnIoZGV2LT5k
ZXYsICJpMmMgbXN0IGFjdGl2aXR5IG5vdCBpZGxlICVkXG4iLCByZXQpOw0KDQoJcmV0dXJuIHJl
dDsNCg0KPiArfQ0KDQouLi4NCg0KPiArCXJldCA9IGkyY19kd19jaGVja19tc3RfYWN0aXZpdHko
ZGV2KTsNCj4gKwlpZiAoIXJldCkNCj4gKwkJX19pMmNfZHdfZGlzYWJsZV9ub3dhaXQoZGV2KTsN
Cg0KLi4uYnV0IGxvb2tpbmcgYXQgdGhlIHVzYWdlLCBJIHRoaW5rIHRoZSBwcm9wZXIgaXMgdG8g
aGF2ZSB0aGUgYWJvdmUgdG8gcmV0dXJuIGJvb2xlYW4uIEFuZCBhbHNvIHVwZGF0ZSB0aGUgbmFt
ZSB0byBmb2xsb3cgdGhlIHVzdWFsIHBhdHRlcm4gZm9yIGJvb2xlYW4gaGVscGVycy4NCg0Kc3Rh
dGljIGJvb2wgaTJjX2R3X2lzX21zdF9pZGxpbmcoc3RydWN0IGR3X2kyY19kZXYgKmRldikgLi4u
DQoJaWYgKGkyY19kd19pc19tc3RfaWRsaW5nKGRldikpDQoJCV9faTJjX2R3X2Rpc2FibGVfbm93
YWl0KGRldik7DQoNCi4uLg0KDQpBbHNvIHdoYXQgZG9lcyB0aGUgaGVjayAibXN0IiBzdGFuZCBm
b3I/IFBsZWFzZSwgdXNlIGRlY3J5cHRlZCB3b3JkcyBpbiBmdW5jdGlvbiBuYW1lcyBhbmQgZXJy
b3IgbWVzc2FnZXMuLg0KDQotLQ0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpBbmR5IFNoZXZjaGVua28N
Cg0KDQo=

