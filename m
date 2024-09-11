Return-Path: <linux-i2c+bounces-6543-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EC196975045
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 12:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 77B6EB2634D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 10:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B3814A097;
	Wed, 11 Sep 2024 10:54:16 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF4C45C18;
	Wed, 11 Sep 2024 10:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726052056; cv=none; b=kJ1OlRxyaTew2HD6Un0I+sq51zKu5lBexqnq8RseZt3RLqHTF1UIUFXtYS/RPaS1hdfCWYBTI8dTJjm10i9dYa1HQ/V3K2sgb73P3S9XZ4n+KL9PX0fwSc/KfIRt5j2Hk7ysjEPy9snpGhf6Q8KS6YN2ll2RlDEZgpfY0ucgRQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726052056; c=relaxed/simple;
	bh=pt7Nsu/a0iTTJQLsQHAFok+w0I0WgKnWFmCzGfnSj8E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rivSs8vYxTLlyiHrpz8sPrSyW2lg62kRZu5RUyAqrTKZJX1S4RXGBgByqXDFPZ0HTEhobW3+nrd9Y7nveDc023pIw/aGg+14QB2c9aV/UlUOhWPcd+F7Kn7wl5+PbC+uV6wRnUYvqrW42hU/5WFQU3Fu6VxlgeEoIO3SCFZK+CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48BArJvV060683
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 11 Sep 2024 18:53:19 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X3cqg0668z7ZMtj;
	Wed, 11 Sep 2024 18:53:19 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Wed, 11 Sep 2024 18:53:18 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Wed, 11 Sep 2024 18:53:18 +0800
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
Subject: RE: [PATCH v9] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Thread-Topic: [PATCH v9] i2c: designware: fix controller is holding SCL low
 while ENABLE bit is disabled
Thread-Index: AQHbBCZ5inqGZkJh9EaW81yTfE/+vrJR2OyAgACORhA=
Date: Wed, 11 Sep 2024 10:53:18 +0000
Message-ID: <a6e3accdbf6446f4befb8865b0ced07f@siengine.com>
References: <69401183add8f79ee98b84c91983204df753a3e6.1726043461.git.kimriver.liu@siengine.com>
 <ynzj54wf54b3ebxambxu73trcxee5xjiwhvs6tok652hhkxiff@wympszncw2gx>
In-Reply-To: <ynzj54wf54b3ebxambxu73trcxee5xjiwhvs6tok652hhkxiff@wympszncw2gx>
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
X-MAIL:mail03.siengine.com 48BArJvV060683

SEkgYW5kaSBhbmQgYW5keSwNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTog
QW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBrZXJuZWwub3JnPiANCj5TZW50OiAyMDI0xOo51MIxMcjV
IDE4OjE2DQo+VG86IExpdSBLaW1yaXZlci/B9b3wutMgPGtpbXJpdmVyLmxpdUBzaWVuZ2luZS5j
b20+DQo+Q2M6IGphcmtrby5uaWt1bGFAbGludXguaW50ZWwuY29tOyBhbmRyaXkuc2hldmNoZW5r
b0BsaW51eC5pbnRlbC5jb207IG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb207IGpzZEBz
ZW1paGFsZi5jb207IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2Vy
Lmtlcm5lbC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIIHY5XSBpMmM6IGRlc2lnbndhcmU6IGZp
eCBjb250cm9sbGVyIGlzIGhvbGRpbmcgU0NMIGxvdyB3aGlsZSBFTkFCTEUgYml0IGlzIGRpc2Fi
bGVkDQoNCj5BbmR5LA0KDQo+T24gV2VkLCBTZXAgMTEsIDIwMjQgYXQgMDQ6Mzk6NDVQTSBHTVQs
IEtpbXJpdmVyIExpdSB3cm90ZToNCj4+IEl0IHdhcyBvYnNlcnZlZCB0aGF0IGlzc3VpbmcgQUJP
UlQgYml0IChJQ19FTkFCTEVbMV0pIHdpbGwgbm90DQo+PiB3b3JrIHdoZW4gSUNfRU5BQkxFIGlz
IGFscmVhZHkgZGlzYWJsZWQuDQo+PiANCj4+IENoZWNrIGlmIEVOQUJMRSBiaXQgKElDX0VOQUJM
RVswXSkgaXMgZGlzYWJsZWQgd2hlbiB0aGUgY29udHJvbGxlcg0KPj4gaXMgaG9sZGluZyBTQ0wg
bG93LiBJZiBFTkFCTEUgYml0IGlzIGRpc2FibGVkLCB0aGUgc29mdHdhcmUgbmVlZA0KPj4gdG8g
ZW5hYmxlIGl0IGJlZm9yZSB0cnlpbmcgdG8gaXNzdWUgQUJPUlQgYml0LiBvdGhlcndpc2UsDQo+
PiB0aGUgY29udHJvbGxlciBpZ25vcmVzIGFueSB3cml0ZSB0byBBQk9SVCBiaXQuDQo+PiANCj4+
IFRoZXNlIGtlcm5lbCBsb2dzIHNob3cgdXAgd2hlbmV2ZXIgYW4gSTJDIHRyYW5zYWN0aW9uIGlz
DQo+PiBhdHRlbXB0ZWQgYWZ0ZXIgdGhpcyBmYWlsdXJlLg0KPj4gaTJjX2Rlc2lnbndhcmUgZTk1
ZTAwMDAuaTJjOiB0aW1lb3V0IHdhaXRpbmcgZm9yIGJ1cyByZWFkeQ0KPj4gaTJjX2Rlc2lnbndh
cmUgZTk1ZTAwMDAuaTJjOiB0aW1lb3V0IGluIGRpc2FibGluZyBhZGFwdGVyDQo+PiANCj4+IFRo
ZSBwYXRjaCBjYW4gYmUgZml4IHRoZSBjb250cm9sbGVyIGNhbm5vdCBiZSBkaXNhYmxlZCB3aGls
ZQ0KPj4gU0NMIGlzIGhlbGQgbG93IGluIEVOQUJMRSBiaXQgaXMgYWxyZWFkeSBkaXNhYmxlZC4N
Cj4+IA0KPj4gRml4ZXM6IDI0MDkyMDVhY2QzYyAoImkyYzogZGVzaWdud2FyZTogZml4IF9faTJj
X2R3X2Rpc2FibGUoKSBpbiBjYXNlIG1hc3RlciBpcyBob2xkaW5nIFNDTCBsb3ciKQ0KPj4gU2ln
bmVkLW9mZi1ieTogS2ltcml2ZXIgTGl1IDxraW1yaXZlci5saXVAc2llbmdpbmUuY29tPg0KPj4g
UmV2aWV3ZWQtYnk6IE1pa2EgV2VzdGVyYmVyZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVs
LmNvbT4NCj4+IEFja2VkLWJ5OiBKYXJra28gTmlrdWxhIDxqYXJra28ubmlrdWxhQGxpbnV4Lmlu
dGVsLmNvbT4NCg0KPmlmIHlvdSdyZSBoYXBwZSwgSSB3b3VsZCB0YWtlIHRoaXMgaW4uDQoNCj5U
aGFua3MgS2ltcml2ZXIgZm9yIGZvbGxvd2luZyB1cCBvbiBhbGwgdGhlIHJldmlld3MsIEkgcmVh
bGx5DQo+YXBwcmVjaWF0ZSB5b3VyIHJlc3BvbnNpdm5lc3MuDQoNCiBUaGFua3MgZm9yIHRoZSBy
ZXZpZXchDQoNCiBJIGhhdmUgZG9uZSB0aGUgdGVzdGluZyBvZiB0aGUgVjkgcGF0Y2ggb24gb3Vy
IHByb2R1Y3QgLCBpdCBWZXJpZmllZCBzdWNjZXNzZnVsIHdoZW4gY29udHJvbGxlciBpcyBob2xk
aW5nIFNDTCBsb3cuDQoNCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KQmVzdCBSZWdhcmRzDQpLaW1yaXZlciBMaXUNCg==

