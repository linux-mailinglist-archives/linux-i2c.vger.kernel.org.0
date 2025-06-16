Return-Path: <linux-i2c+bounces-11478-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB65FADA54D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 03:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DCC33A9512
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jun 2025 00:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E8813EFF3;
	Mon, 16 Jun 2025 01:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="z5AiXWx6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983F11474CC
	for <linux-i2c@vger.kernel.org>; Mon, 16 Jun 2025 01:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750035605; cv=none; b=be9nE48kf6OXwP3L8O10EmlvuTp6zPx7XsWZFALOczcZJQ2WRkIaZAvQfaA+g2OhYzgeg796iofdiJHLLB8slWRQPLOQpiHW6htIeEeDh/TIUKHABngnxOFMJE2EwVTH60GnBMIuecMhPWHCN+cZxzYb5CrdLgJVA9stkQSwga4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750035605; c=relaxed/simple;
	bh=ihETkKqKIG8M9skc5uZtPuobJCFD4/xhLiN5mqVre8o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ht54DLNZt6/w8gzy0pUqFpWhsh8N9g1s/9NI2/pEmN9G0OAcSy+wvWZ0AKpCTanTWm1CFxFkgvW43I/a1Nd9oX8skWNKImNXdCo9nUGC/NQm/1OffvrCkLstiGcCTQthlA5vs8VM6TvVy92A8gp6Ncmc9/XqnzmRQLc6+hNBAAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=z5AiXWx6; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 229272C05BD;
	Mon, 16 Jun 2025 12:59:54 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1750035594;
	bh=ihETkKqKIG8M9skc5uZtPuobJCFD4/xhLiN5mqVre8o=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=z5AiXWx66NE1ki4I1FHUabRUtrUlIw+chgqGDquaEvdd+OgueW1BUVBVBvqzf3TYS
	 laLHz0xDyv37vSoL58woTX8WgTvgF4DM4f/YKiTD4TLtvxLWeShircadbi8bvYwyFI
	 GmQDhmP08zJnx/gK1+WWJqFyu7dPxED1hsTX25gSnX8jB6JDR1PsPGkYLg5BzOdJ8F
	 rkpOuXNgt9h4Qn5YNEzddf2/QVh0dOiFq+KD3LiKPUjoORyfMjij85/S9Obq5PrQO6
	 ZYZIC6tojaZKO5VDdeI5hS/jxcPQsD8857/czwKs0CdStsQuyMnBfBmbsUro989F3v
	 p8J8w+oXEXWFg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B684f6c7f0001>; Mon, 16 Jun 2025 12:59:43 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 16 Jun 2025 12:59:43 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Mon, 16 Jun 2025 12:59:43 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Alex Guo <alexguo1023@gmail.com>
CC: "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: rtl9300: Fix out-of-bounds bug in
 rtl9300_i2c_smbus_xfer
Thread-Topic: [PATCH] i2c: rtl9300: Fix out-of-bounds bug in
 rtl9300_i2c_smbus_xfer
Thread-Index: AQHb3lCd+yXRspKshU2u62+trp+jQrQELhcA
Date: Mon, 16 Jun 2025 00:59:42 +0000
Message-ID: <e2c361b4-52bc-4ead-bbfc-fc6636b57064@alliedtelesis.co.nz>
References: <20250615235248.529019-1-alexguo1023@gmail.com>
In-Reply-To: <20250615235248.529019-1-alexguo1023@gmail.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F360CFA3D31204FA966B0118EC6C233@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=F7/0dbhN c=1 sm=1 tr=0 ts=684f6c7f a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=jnnnbLZWfpgPSXHVTWUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=QH9-EOpvJABdOtv2Ar0o:22
X-SEG-SpamProfiler-Score: 0

SGkgQWxleCwNCg0KT24gMTYvMDYvMjAyNSAxMTo1MiwgQWxleCBHdW8gd3JvdGU6DQo+IFRoZSBk
YXRhLT5ibG9ja1swXSB2YXJpYWJsZSBjb21lcyBmcm9tIHVzZXIuIFdpdGhvdXQgcHJvcGVyIGNo
ZWNrLA0KPiB0aGUgdmFyaWFibGUgbWF5IGJlIHZlcnkgbGFyZ2UgdG8gY2F1c2UgYW4gb3V0LW9m
LWJvdW5kcyBidWcuDQo+DQo+IEZpeCB0aGlzIGJ1ZyBieSBjaGVja2luZyB0aGUgdmFsdWUgb2Yg
ZGF0YS0+YmxvY2tbMF0gZmlyc3QuDQo+DQo+IFNpbWlsYXIgY29tbWl0Og0KPiAxLiBjb21taXQg
MzkyNDRjYzc1NDggKCJpMmM6IGlzbXQ6IEZpeCBhbiBvdXQtb2YtYm91bmRzIGJ1ZyBpbg0KPiBp
c210X2FjY2VzcygpIikNCj4gMi4gY29tbWl0IDkyZmJiNmQxMjk2ICgiaTJjOiB4Z2VuZS1zbGlt
cHJvOiBGaXggb3V0LW9mLWJvdW5kcw0KPiBidWcgaW4geGdlbmVfc2xpbXByb19pMmNfeGZlcigp
IikNCj4NCj4gU2lnbmVkLW9mZi1ieTogQWxleCBHdW8gPGFsZXhndW8xMDIzQGdtYWlsLmNvbT4N
Cg0KUmV2aWV3ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNp
cy5jby5uej4NClRlc3RlZC1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0
ZWxlc2lzLmNvLm56Pg0KDQpUaGFua3MNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2kyYy9idXNzZXMv
aTJjLXJ0bDkzMDAuYyB8IDQgKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcnRsOTMwMC5jIGIv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1ydGw5MzAwLmMNCj4gaW5kZXggZTA2NGU4YTRhMWYwLi41
Njg0OTU3MjA4MTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcnRsOTMw
MC5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcnRsOTMwMC5jDQo+IEBAIC0yODEs
NiArMjgxLDEwIEBAIHN0YXRpYyBpbnQgcnRsOTMwMF9pMmNfc21idXNfeGZlcihzdHJ1Y3QgaTJj
X2FkYXB0ZXIgKmFkYXAsIHUxNiBhZGRyLCB1bnNpZ25lZCBzDQo+ICAgCQlyZXQgPSBydGw5MzAw
X2kyY19yZWdfYWRkcl9zZXQoaTJjLCBjb21tYW5kLCAxKTsNCj4gICAJCWlmIChyZXQpDQo+ICAg
CQkJZ290byBvdXRfdW5sb2NrOw0KPiArCQlpZiAoZGF0YS0+YmxvY2tbMF0gPCAxIHx8IGRhdGEt
PmJsb2NrWzBdID4gSTJDX1NNQlVTX0JMT0NLX01BWCkgew0KPiArCQkJcmV0ID0gLUVJTlZBTDsN
Cj4gKwkJCWdvdG8gb3V0X3VubG9jazsNCj4gKwkJfQ0KPiAgIAkJcmV0ID0gcnRsOTMwMF9pMmNf
Y29uZmlnX3hmZXIoaTJjLCBjaGFuLCBhZGRyLCBkYXRhLT5ibG9ja1swXSk7DQo+ICAgCQlpZiAo
cmV0KQ0KPiAgIAkJCWdvdG8gb3V0X3VubG9jazs=

