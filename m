Return-Path: <linux-i2c+bounces-2958-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEFA8A61EB
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 05:59:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21D831F243B7
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Apr 2024 03:59:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C9B208A4;
	Tue, 16 Apr 2024 03:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="VUswTp5A"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C681BDD0
	for <linux-i2c@vger.kernel.org>; Tue, 16 Apr 2024 03:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713239964; cv=none; b=C+n19boH8p38mK2aNLUkwFxsW5HvMqOSPu6hl8ljKsPX/afJaPJZabMQ9Gcn5krboIIGE+9putSGrzVjCj3DCDvE0rfM5rNsK6BjllKKjGfSGARRhGAByha0OPXKlKqoa5QS2Mgt/AgbmswTAd/Ke4dUpslJ/1QIZOcCcOxkvNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713239964; c=relaxed/simple;
	bh=FgRQ8y+a+3342fuSHaW0GvB9Eat6gnfWUekNdzkskAo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TnRul1168wSFlV+41KJMlgdgmSNQsufjfeHQWM+RHMYZV6wdR5gFNZDFVYTrCRgvxxg97JGLbWsWpGaSOCIE5GvTCSX0WVkAgSvESGrtr1iIhtfCPVNGBIx6OV+jnFFvndaQjccn2gurxvfeaz6UtGfvYMwTPv58uQ+iLiozxh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=VUswTp5A; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A6B272C04F7;
	Tue, 16 Apr 2024 15:59:13 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1713239953;
	bh=FgRQ8y+a+3342fuSHaW0GvB9Eat6gnfWUekNdzkskAo=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=VUswTp5ANw2uSZip3lUPe6I6gbL58AwpI5hKJuTzpeZMFA5wD1qYhDOpISvq8qVeG
	 JFludmEeo2v6yCqkeymC0sOq1bj7W9LH8PO8M1JgNa7PLcgnm+XeKvFr0WJDRSYLac
	 KNQ7Cq72YXoR8vdFaiiOd1Bly+FC4i+eabjo7tZ7AS+XUMwwlhUquaYLwBrRmTsKIR
	 e/mIQIaKDSA6QsWVd1r8I/44PTtOVI9Ei1C959Jb3XGrVjtDraiH2+qxIwn33uClHy
	 wqg/iuO7mJVOqGOKBNkD/DhNgZVKIjB/LUvPoMb4PztAIDY/Zzt07//ihDvcfMTUR+
	 jZhNM7gq/ivgQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B661df7910001>; Tue, 16 Apr 2024 15:59:13 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 16 Apr 2024 15:59:13 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.009; Tue, 16 Apr 2024 15:59:13 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>, Abhinav Jain
	<jain.abhinav177@gmail.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>, "Julia
 Lawall" <julia.lawall@inria.fr>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Thread-Topic: [PATCH] i2c: mpc: Removal of of_node_put with __free for auto
 cleanup
Thread-Index: AQHaj0/GzDJ4DPHHek+eKx0F5hnQY7FpBlkAgAB2vgA=
Date: Tue, 16 Apr 2024 03:59:13 +0000
Message-ID: <2ea08951-3613-4ed5-a2b2-dd4887105ac3@alliedtelesis.co.nz>
References: <20240415161220.8347-1-jain.abhinav177@gmail.com>
 <vegjt4pcl2x2wmwso6ajbihqc6rpbup5knycnz76jz3zfbfpp4@opxek6apu3w4>
In-Reply-To: <vegjt4pcl2x2wmwso6ajbihqc6rpbup5knycnz76jz3zfbfpp4@opxek6apu3w4>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <711434C7B851E04E8BA12FB3CEA63A67@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dY4j3mXe c=1 sm=1 tr=0 ts=661df791 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=SQiHmE0Aj67H6G5b:21 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=raytVjVEu-sA:10 a=O23guemLEh43BbyxQAYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAxNi8wNC8yNCAwODo1NCwgQW5kaSBTaHl0aSB3cm90ZToNCj4gSGkgQWJoaW5hdiwNCj4N
Cj4+ICAgCS8qIEVuYWJsZSBJMkMgaW50ZXJydXB0cyBmb3IgbXBjNTEyMSAqLw0KPj4gLQlub2Rl
X2N0cmwgPSBvZl9maW5kX2NvbXBhdGlibGVfbm9kZShOVUxMLCBOVUxMLA0KPj4gLQkJCQkJICAg
ICJmc2wsbXBjNTEyMS1pMmMtY3RybCIpOw0KPj4gKwlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGVf
Y3RybCBfX2ZyZWUoZGV2aWNlX25vZGUpID0NCj4gSG93IGhhdmUgeW91IHRlc3RlZCB0aGlzPw0K
DQpJJ20gbm90IHN1cmUgSSBrbm93IGFueW9uZSB0aGF0IHN0aWxsIGhhcyBhIG1wYzUxMjEuIE1h
eWJlIHNvbWVvbmUgb24gDQpsaW51eHBwYy1kZXY/DQoNCkkgZGlkIHRyeSB0byB0YWtlIHRoZSBw
YXRjaCBmb3IgYSBzcGluIG9uIG15IFQyMDgxUkRCIGJ1dCBJJ20gaGF2aW5nIA0Kc29tZSB1c2Vy
bGFuZCBpc3N1ZXMgb24gaXQgZm9yIHNvbWUgcmVhc29uICh1bnJlbGF0ZWQgdG8gdGhpcyBjaGFu
Z2UpLiANClRoZSBrZXJuZWwgYm9vdCBkb2VzIGRpc2NvdmVyIGEgZmV3IHBlcmlwaGVyYWxzIGhh
bmdpbmcgb2YgdGhlIEkyQyANCmludGVyZmFjZSBidXQgSSdtIG5vdCBpbiBhIHBvc2l0aW9uIHRv
IG9mZmVyIHVwIGEgVGVzdGVkLWJ5IGFuZCBJJ3ZlIHJ1biANCm91dCBvZiB0aW1lIHRvIGRlYnVn
IHdoeSBteSBib2FyZCBpcyB1bmhhcHB5Lg0KDQo=

