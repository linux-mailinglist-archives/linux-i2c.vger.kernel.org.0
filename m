Return-Path: <linux-i2c+bounces-6351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4C19704EE
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 04:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70FBD1C20F5A
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Sep 2024 02:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB42A22615;
	Sun,  8 Sep 2024 02:56:57 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7B8200A0;
	Sun,  8 Sep 2024 02:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725764217; cv=none; b=MpY3EF/tEHJYC6v/CZb1UFu9BNnkBOfmTr5wgfDABEwKejribnhoK3nqeBTlhA0tOt17qD5gvpMsIbbMA374fhEKvtbmPNCzW76KXRJk+I4CCRG5JD8iEOhmejSUMaiT5Qt4UnvMJL3sLj+YSuu14nGHOXlUw/XMdWmJ9K55fdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725764217; c=relaxed/simple;
	bh=CXFBArreQotdGP87kdWDKag2rUr4eeLxwlmDkTzXchA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WHgBuPHD9VOVGcsAqf/XljhCVKuu1JXCV6CmWKBVtat2PRX9W3qWweiWgzDVce7Q7OzgMgX3zZYNEuyjMPoQdYlE7yINOk6MMT/Weoh0Y/PlQAqZ5r531eJLPrGXhKGKu/OkedR9gC2XLGVaviqQaLQzHjXUdJ4Yl3FQVbz/eF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 4882uKIR025911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 8 Sep 2024 10:56:20 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X1ZNZ53yDz7ZMtq;
	Sun,  8 Sep 2024 10:56:14 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Sun, 8 Sep 2024 10:56:14 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Sun, 8 Sep 2024 10:56:14 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Sun, 8 Sep 2024 10:56:14 +0800
From: =?gb2312?B?TGl1IEtpbXJpdmVyL8H1vfC60w==?= <kimriver.liu@siengine.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "jsd@semihalf.com" <jsd@semihalf.com>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Topic: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Index: AQHbADEIW35yKdnseE29IGkdUrOvKrJKwqmAgAHsLUA=
Date: Sun, 8 Sep 2024 02:56:14 +0000
Message-ID: <879b934827fe4cea995e8e20ba0a796f@siengine.com>
References: <20240906074731.3064-1-kimriver.liu@siengine.com>
 <tlyybm626om6a64du5ke4sbxqo4nx2p3g5g4f2mfhv5wp4pulw@5alrb7jixquw>
In-Reply-To: <tlyybm626om6a64du5ke4sbxqo4nx2p3g5g4f2mfhv5wp4pulw@5alrb7jixquw>
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
X-MAIL:mail03.siengine.com 4882uKIR025911

SGkgQW5kaQ0KIEkgYW0gc29ycnkgZm9yIG5vdCByZXBseWluZyB0byBxdWVzdGlvbnMgaW4gdGlt
ZSwgd2hlbiBJIGxlZnQgdGhlIG9mZmljZSBlYXJseSBvbiBGcmlkYXkuDQogSSBzaW5jZXJlbHkg
YXBvbG9naXplIHRvIHlvdSBhZ2Fpbi4NCg0KSSB3aWxsIGltcHJvdmUgbXkgcmVzcG9uc2UgcHJv
Z3Jlc3MgYW5kIGZvbGxvdyBBbmR5J3Mgc3VnZ2VzdGlvbi4gVGhhbmtzLg0KQW5kIHdpbGwgcmVz
ZW5kIG5ldyBwYXRjaCBWNyBvbiBNb2RheToNCltQQVRDSCBWN10gaTJjOiBkZXNpZ253YXJlOiBm
aXggbWFzdGVyIGlzIGhvbGRpbmcgU0NMIGxvdyB3aGlsZSBFTkFCTEUgYml0IGlzIGRpc2FibGVk
DQoNCi0tLS0t08q8/tStvP4tLS0tLQ0Kt6K8/sjLOiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGtl
cm5lbC5vcmc+IA0Kt6LLzcqxvOQ6IDIwMjTE6jnUwjfI1SA1OjM1DQrK1bz+yMs6IExpdSBLaW1y
aXZlci/B9b3wutMgPGtpbXJpdmVyLmxpdUBzaWVuZ2luZS5jb20+DQqzrcvNOiBqYXJra28ubmlr
dWxhQGxpbnV4LmludGVsLmNvbTsgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tOyBt
aWthLndlc3RlcmJlcmdAbGludXguaW50ZWwuY29tOyBqc2RAc2VtaWhhbGYuY29tOyBsaW51eC1p
MmNAdmdlci5rZXJuZWwub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQrW98ziOiBS
ZTogW1BBVENIXSBpMmM6IGRlc2lnbndhcmU6IGZpeCBtYXN0ZXIgaXMgaG9sZGluZyBTQ0wgbG93
IHdoaWxlIEVOQUJMRSBiaXQgaXMgZGlzYWJsZWQNCg0KSGkgS2ltcml2ZXIsDQoNCi4uLg0KDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtY29tbW9uLmMg
DQo+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLWNvbW1vbi5jDQo+IGluZGV4
IGU4YTY4OGQwNGFlZS4uMmIzMzk4Y2Q0MzgyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLWRlc2lnbndhcmUtY29tbW9uLmMNCj4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2Vz
L2kyYy1kZXNpZ253YXJlLWNvbW1vbi5jDQo+IEBAIC00NTMsNiArNDUzLDE3IEBAIHZvaWQgX19p
MmNfZHdfZGlzYWJsZShzdHJ1Y3QgZHdfaTJjX2RldiAqZGV2KQ0KPiAgDQo+ICAJYWJvcnRfbmVl
ZGVkID0gcmF3X2ludHJfc3RhdHMgJiBEV19JQ19JTlRSX01TVF9PTl9IT0xEOw0KPiAgCWlmIChh
Ym9ydF9uZWVkZWQpIHsNCj4gKwkJaWYgKCEoZW5hYmxlICYgRFdfSUNfRU5BQkxFX0VOQUJMRSkp
IHsNCj4gKwkJCXJlZ21hcF93cml0ZShkZXYtPm1hcCwgRFdfSUNfRU5BQkxFLCBEV19JQ19FTkFC
TEVfRU5BQkxFKTsNCg0KPkJUVywgeW91ciBwYXRjaCBkb2Vzbid0IGNvbXBpbGUuIFBsZWFzZSBt
YWtlIHN1cmUgdGhhdCB5b3UgaGF2ZSBldmVyeXRoaW5nIGluIHBsYWNlIGFuZCBwbGVhc2UgcmVz
ZW5kLg0KDQo+VGhpcyB0aW1lIEkgZXhwZWN0IHlvdSB0byBmb2xsb3cgQW5keSdzIHN1Z2dlc3Rp
b24uDQoNClNvcnJ5LCBJIGZvcmdldCB0byBtZXJnZSBEV19JQ19FTkFCTEVfRU5BQkxFIHBhdGNo
IHRvIGhlcmUuIEkgd2lsbCB1cGRhdGUgVjcgcGF0Y2ggb24gTW9uZGF5LA0KW1BBVENIIFY3XSBp
MmM6IGRlc2lnbndhcmU6IGZpeCBtYXN0ZXIgaXMgaG9sZGluZyBTQ0wgbG93IHdoaWxlIEVOQUJM
RSBiaXQgaXMgZGlzYWJsZWQNCkkgd2lsbCB1cGRhdGUgVjcgcGF0Y2ggb24gTW9uZGF5IHdoaWNo
IGluY2x1ZGVzIHRoZSBmb2xsb3dpbmcgaXNzdWVzOg0KLS0tLS0tLQ0KVjYtPlY3Og0KCTEuIGFk
ZCBTdWJqZWN0IHZlcnNpb25pbmcNCgkyLiBjaGFuZ2UgZnNsZWVwKDI1KSB0byB1c2xlZXBfcmFu
Z2UoMjUsIDI1MCkNCgkzLiBBZGQgbWFjcm8gZGVmaW5pdGlvbiBEV19pQ19FTkFCTEVfRU5BQkxF
IGZvciBjb21waWxpbmcgZXJyb3INCi0tLS0tLS0tLS0tLS0tLS0tLQ0KQmVzdCBSZWdhcmRzDQpL
aW1yaXZlciBMaXUNCg==

