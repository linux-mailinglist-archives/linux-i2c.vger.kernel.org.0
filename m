Return-Path: <linux-i2c+bounces-6375-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D34970B41
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:32:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3305B281FA5
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A1A1B27D;
	Mon,  9 Sep 2024 01:31:59 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0986C18C3D
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 01:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725845519; cv=none; b=Y6N7PgKSWO6HI2o8pCnhnIBx4i/NNHecbfM21QSGq3Fb29hlV1YaCpdNAlhpo3vXZN19PTkQnFFBX/dCPCDESH00z98wKXmDclfqxp3fEOcS2pMhrCnJwRnNxtpOP312DSlqgrAeA0AnMLIPbHGCyWNoPeBv9LW4weJYrr5bfW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725845519; c=relaxed/simple;
	bh=OV7RsPTtf5jTdNH+X7jXGLv6MDzHIDOCnPqNISKgzbQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Gsuq2Ukrg/5KnFfiW+421fbY4LVUqS+zx22xNFEM/DziPKu4il2vDdjzT03g0IpjFbgo6nKgaFwjSS8xXRubS+//fA4E89e0uk61lrN6i+iJIJrCqqVF5M5cGSu2Oer7oFW1kfPBCJ1YPU7ZQOVkmA3wSmaaynuhlJkMGgIt2Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 4891VkE9085406
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 9 Sep 2024 09:31:46 +0800 (+08)
	(envelope-from kimriver.liu@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X28Sd20r8z7ZMjf;
	Mon,  9 Sep 2024 09:31:45 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 9 Sep 2024 09:31:45 +0800
Received: from SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe]) by
 SEEXMB03-2019.siengine.com ([fe80::23e0:1bbb:3ec9:73fe%16]) with mapi id
 15.02.1544.011; Mon, 9 Sep 2024 09:31:45 +0800
From: =?gb2312?B?TGl1IEtpbXJpdmVyL8H1vfC60w==?= <kimriver.liu@siengine.com>
To: kernel test robot <lkp@intel.com>,
        "jarkko.nikula@linux.intel.com"
	<jarkko.nikula@linux.intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
        "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "jsd@semihalf.com" <jsd@semihalf.com>,
        "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Topic: [PATCH] i2c: designware: fix master is holding SCL low while
 ENABLE bit is disabled
Thread-Index: AQHa/2duFR8zehOY/kSHdEPBwRT+f7JNYfWAgAFJ+9A=
Date: Mon, 9 Sep 2024 01:31:45 +0000
Message-ID: <d37f51a15b454217936c423512de6e39@siengine.com>
References: <20240905074211.2278-1-kimriver.liu@siengine.com>
 <202409082011.9JF6aYsk-lkp@intel.com>
In-Reply-To: <202409082011.9JF6aYsk-lkp@intel.com>
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
X-MAIL:mail03.siengine.com 4891VkE9085406

SEmjrHJvYm90LA0KIFRvZGF5IEkgd2lsbCByZXNlbmQgYSB2ZXJzaW9uIHY3IHBhdGNoKFtQQVRD
SCBWN10gaTJjOiBkZXNpZ253YXJlOiBmaXggbWFzdGVyIGlzIGhvbGRpbmcgU0NMIGxvdyB3aGls
ZSBFTkFCTEUgYml0IGlzIGRpc2FibGVkKQ0KIGJhc2VkIG9uIHRoZSBsYXRlc3QgTGludXggbWFz
dGVyIGJyYW5jaCB0byByZXNvbHZlIGNvbXBpbGUgZXJyb3JzLg0KDQotLS0tLS0tLS0tLS0tDQpC
ZXN0IFJlZ2FyZHMsDQpLaW1yaXZlciBMaXUNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
CkZyb206IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPiANClNlbnQ6IDIwMjTE6jnU
wjjI1SAyMTozMg0KVG86IExpdSBLaW1yaXZlci/B9b3wutMgPGtpbXJpdmVyLmxpdUBzaWVuZ2lu
ZS5jb20+OyBqYXJra28ubmlrdWxhQGxpbnV4LmludGVsLmNvbQ0KQ2M6IG9lLWtidWlsZC1hbGxA
bGlzdHMubGludXguZGV2OyBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb207IG1pa2Eu
d2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb207IGpzZEBzZW1paGFsZi5jb207IGFuZGkuc2h5dGlA
a2VybmVsLm9yZzsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZzsgTGl1IEtpbXJpdmVyL8H1vfC60yA8a2ltcml2ZXIubGl1QHNpZW5naW5lLmNv
bT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGkyYzogZGVzaWdud2FyZTogZml4IG1hc3RlciBpcyBo
b2xkaW5nIFNDTCBsb3cgd2hpbGUgRU5BQkxFIGJpdCBpcyBkaXNhYmxlZA0KDQpIaSBraW1yaXZl
ciwNCg0Ka2VybmVsIHRlc3Qgcm9ib3Qgbm90aWNlZCB0aGUgZm9sbG93aW5nIGJ1aWxkIGVycm9y
czoNCg0KW2F1dG8gYnVpbGQgdGVzdCBFUlJPUiBvbiBhbmRpLXNoeXRpL2kyYy9pMmMtaG9zdF0N
ClthbHNvIGJ1aWxkIHRlc3QgRVJST1Igb24gbGludXMvbWFzdGVyIHY2LjExLXJjNiBuZXh0LTIw
MjQwOTA2XQ0KW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGllZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUs
IGtpbmRseSBkcm9wIHVzIGEgbm90ZS4NCkFuZCB3aGVuIHN1Ym1pdHRpbmcgcGF0Y2gsIHdlIHN1
Z2dlc3QgdG8gdXNlICctLWJhc2UnIGFzIGRvY3VtZW50ZWQgaW4NCmh0dHBzOi8vZ2l0LXNjbS5j
b20vZG9jcy9naXQtZm9ybWF0LXBhdGNoI19iYXNlX3RyZWVfaW5mb3JtYXRpb25dDQoNCnVybDog
ICAgaHR0cHM6Ly9naXRodWIuY29tL2ludGVsLWxhYi1sa3AvbGludXgvY29tbWl0cy9raW1yaXZl
ci1saXUvaTJjLWRlc2lnbndhcmUtZml4LW1hc3Rlci1pcy1ob2xkaW5nLVNDTC1sb3ctd2hpbGUt
RU5BQkxFLWJpdC1pcy1kaXNhYmxlZC8yMDI0MDkwNS0xNTQ3MTENCmJhc2U6ICAgaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvYW5kaS5zaHl0aS9saW51eC5n
aXQgaTJjL2kyYy1ob3N0DQpwYXRjaCBsaW5rOiAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9y
LzIwMjQwOTA1MDc0MjExLjIyNzgtMS1raW1yaXZlci5saXUlNDBzaWVuZ2luZS5jb20NCnBhdGNo
IHN1YmplY3Q6IFtQQVRDSF0gaTJjOiBkZXNpZ253YXJlOiBmaXggbWFzdGVyIGlzIGhvbGRpbmcg
U0NMIGxvdyB3aGlsZSBFTkFCTEUgYml0IGlzIGRpc2FibGVkDQpjb25maWc6IHNoLWFsbG1vZGNv
bmZpZyAoaHR0cHM6Ly9kb3dubG9hZC4wMS5vcmcvMGRheS1jaS9hcmNoaXZlLzIwMjQwOTA4LzIw
MjQwOTA4MjAxMS45SkY2YVlzay1sa3BAaW50ZWwuY29tL2NvbmZpZykNCmNvbXBpbGVyOiBzaDQt
bGludXgtZ2NjIChHQ0MpIDE0LjEuMA0KcmVwcm9kdWNlICh0aGlzIGlzIGEgVz0xIGJ1aWxkKTog
KGh0dHBzOi8vZG93bmxvYWQuMDEub3JnLzBkYXktY2kvYXJjaGl2ZS8yMDI0MDkwOC8yMDI0MDkw
ODIwMTEuOUpGNmFZc2stbGtwQGludGVsLmNvbS9yZXByb2R1Y2UpDQoNCklmIHlvdSBmaXggdGhl
IGlzc3VlIGluIGEgc2VwYXJhdGUgcGF0Y2gvY29tbWl0IChpLmUuIG5vdCBqdXN0IGEgbmV3IHZl
cnNpb24gb2YNCnRoZSBzYW1lIHBhdGNoL2NvbW1pdCksIGtpbmRseSBhZGQgZm9sbG93aW5nIHRh
Z3MNCnwgUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KfCBD
bG9zZXM6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyNDA5MDgyMDEx
LjlKRjZhWXNrLWxrcEBpbnRlbC5jb20vDQoNCkFsbCBlcnJvcnMgKG5ldyBvbmVzIHByZWZpeGVk
IGJ5ID4+KToNCg0KICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1kZXNpZ253YXJlLWNvbW1vbi5j
OiBJbiBmdW5jdGlvbiAnX19pMmNfZHdfZGlzYWJsZSc6DQo+PiBkcml2ZXJzL2kyYy9idXNzZXMv
aTJjLWRlc2lnbndhcmUtY29tbW9uLmM6NTM4OjMyOiBlcnJvcjogJ0RXX0lDX0VOQUJMRV9FTkFC
TEUnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFu
ICdEV19JQ19FTkFCTEVfU1RBVFVTJz8NCiAgICAgNTM4IHwgICAgICAgICAgICAgICAgIGlmICgh
KGVuYWJsZSAmIERXX0lDX0VOQUJMRV9FTkFCTEUpKSB7DQogICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+DQogICAgICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBEV19JQ19FTkFCTEVfU1RBVFVTDQogICBkcml2ZXJz
L2kyYy9idXNzZXMvaTJjLWRlc2lnbndhcmUtY29tbW9uLmM6NTM4OjMyOiBub3RlOiBlYWNoIHVu
ZGVjbGFyZWQgaWRlbnRpZmllciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rp
b24gaXQgYXBwZWFycyBpbg0KDQoNCnZpbSArNTM4IGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtZGVz
aWdud2FyZS1jb21tb24uYw0KDQogICA1MjMJDQogICA1MjQJdm9pZCBfX2kyY19kd19kaXNhYmxl
KHN0cnVjdCBkd19pMmNfZGV2ICpkZXYpDQogICA1MjUJew0KICAgNTI2CQl1bnNpZ25lZCBpbnQg
cmF3X2ludHJfc3RhdHM7DQogICA1MjcJCXVuc2lnbmVkIGludCBlbmFibGU7DQogICA1MjgJCWlu
dCB0aW1lb3V0ID0gMTAwOw0KICAgNTI5CQlib29sIGFib3J0X25lZWRlZDsNCiAgIDUzMAkJdW5z
aWduZWQgaW50IHN0YXR1czsNCiAgIDUzMQkJaW50IHJldDsNCiAgIDUzMgkNCiAgIDUzMwkJcmVn
bWFwX3JlYWQoZGV2LT5tYXAsIERXX0lDX1JBV19JTlRSX1NUQVQsICZyYXdfaW50cl9zdGF0cyk7
DQogICA1MzQJCXJlZ21hcF9yZWFkKGRldi0+bWFwLCBEV19JQ19FTkFCTEUsICZlbmFibGUpOw0K
ICAgNTM1CQ0KICAgNTM2CQlhYm9ydF9uZWVkZWQgPSByYXdfaW50cl9zdGF0cyAmIERXX0lDX0lO
VFJfTVNUX09OX0hPTEQ7DQogICA1MzcJCWlmIChhYm9ydF9uZWVkZWQpIHsNCiA+IDUzOAkJCWlm
ICghKGVuYWJsZSAmIERXX0lDX0VOQUJMRV9FTkFCTEUpKSB7DQogICA1MzkJCQkJcmVnbWFwX3dy
aXRlKGRldi0+bWFwLCBEV19JQ19FTkFCTEUsIERXX0lDX0VOQUJMRV9FTkFCTEUpOw0KICAgNTQw
CQkJCWVuYWJsZSB8PSBEV19JQ19FTkFCTEVfRU5BQkxFOw0KICAgNTQxCQ0KICAgNTQyCQkJCS8q
DQogICA1NDMJCQkJICogV2FpdCB0d28gaWNfY2xrIGRlbGF5IHdoZW4gZW5hYmxpbmcgdGhlIGky
YyB0byBlbnN1cmUgRU5BQkxFIGJpdA0KICAgNTQ0CQkJCSAqIGlzIGFscmVhZHkgc2V0IGJ5IHRo
ZSBkcml2ZXIgKGZvciA0MDBLSHogdGhpcyBpcyAyNXVzKQ0KICAgNTQ1CQkJCSAqIGFzIGRlc2Ny
aWJlZCBpbiB0aGUgRGVzaWduV2FyZSBJMkMgZGF0YWJvb2suDQogICA1NDYJCQkJICovDQogICA1
NDcJCQkJZnNsZWVwKDI1KTsNCiAgIDU0OAkJCX0NCiAgIDU0OQkNCiAgIDU1MAkJCXJlZ21hcF93
cml0ZShkZXYtPm1hcCwgRFdfSUNfRU5BQkxFLCBlbmFibGUgfCBEV19JQ19FTkFCTEVfQUJPUlQp
Ow0KICAgNTUxCQkJcmV0ID0gcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KGRldi0+bWFwLCBEV19J
Q19FTkFCTEUsIGVuYWJsZSwNCiAgIDU1MgkJCQkJCSAgICAgICAhKGVuYWJsZSAmIERXX0lDX0VO
QUJMRV9BQk9SVCksIDEwLA0KICAgNTUzCQkJCQkJICAgICAgIDEwMCk7DQogICA1NTQJCQlpZiAo
cmV0KQ0KICAgNTU1CQkJCWRldl9lcnIoZGV2LT5kZXYsICJ0aW1lb3V0IHdoaWxlIHRyeWluZyB0
byBhYm9ydCBjdXJyZW50IHRyYW5zZmVyXG4iKTsNCiAgIDU1NgkJfQ0KICAgNTU3CQ0KICAgNTU4
CQlkbyB7DQogICA1NTkJCQlfX2kyY19kd19kaXNhYmxlX25vd2FpdChkZXYpOw0KICAgNTYwCQkJ
LyoNCiAgIDU2MQkJCSAqIFRoZSBlbmFibGUgc3RhdHVzIHJlZ2lzdGVyIG1heSBiZSB1bmltcGxl
bWVudGVkLCBidXQNCiAgIDU2MgkJCSAqIGluIHRoYXQgY2FzZSB0aGlzIHRlc3QgcmVhZHMgemVy
byBhbmQgZXhpdHMgdGhlIGxvb3AuDQogICA1NjMJCQkgKi8NCiAgIDU2NAkJCXJlZ21hcF9yZWFk
KGRldi0+bWFwLCBEV19JQ19FTkFCTEVfU1RBVFVTLCAmc3RhdHVzKTsNCiAgIDU2NQkJCWlmICgo
c3RhdHVzICYgMSkgPT0gMCkNCiAgIDU2NgkJCQlyZXR1cm47DQogICA1NjcJDQogICA1NjgJCQkv
Kg0KICAgNTY5CQkJICogV2FpdCAxMCB0aW1lcyB0aGUgc2lnbmFsaW5nIHBlcmlvZCBvZiB0aGUg
aGlnaGVzdCBJMkMNCiAgIDU3MAkJCSAqIHRyYW5zZmVyIHN1cHBvcnRlZCBieSB0aGUgZHJpdmVy
IChmb3IgNDAwS0h6IHRoaXMgaXMNCiAgIDU3MQkJCSAqIDI1dXMpIGFzIGRlc2NyaWJlZCBpbiB0
aGUgRGVzaWduV2FyZSBJMkMgZGF0YWJvb2suDQogICA1NzIJCQkgKi8NCiAgIDU3MwkJCXVzbGVl
cF9yYW5nZSgyNSwgMjUwKTsNCiAgIDU3NAkJfSB3aGlsZSAodGltZW91dC0tKTsNCiAgIDU3NQkN
CiAgIDU3NgkJZGV2X3dhcm4oZGV2LT5kZXYsICJ0aW1lb3V0IGluIGRpc2FibGluZyBhZGFwdGVy
XG4iKTsNCiAgIDU3Nwl9DQogICA1NzgJDQoNCi0tIA0KMC1EQVkgQ0kgS2VybmVsIFRlc3QgU2Vy
dmljZQ0KaHR0cHM6Ly9naXRodWIuY29tL2ludGVsL2xrcC10ZXN0cy93aWtpDQo=

