Return-Path: <linux-i2c+bounces-2124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC7E86F706
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 21:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C1DAB20EA8
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 20:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2556279DC2;
	Sun,  3 Mar 2024 20:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="pm60YOsI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5EF79DBA
	for <linux-i2c@vger.kernel.org>; Sun,  3 Mar 2024 20:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709497725; cv=none; b=C4q21lZxfarXOXsnUgdtm8l5Qga7NLbCmJfZnUEgJHleFb45h92doaDyVLPIi5FdxWVV+rEjg8Z+LXFoCyQpAJO4T4TtJri6kSYXnhxRMUKBOfVAdl3rgvcz/GEH4EztoBSZ0QD4+28F2/uNa5u/Nm0e1iY/1wXIb5FRGPAdmv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709497725; c=relaxed/simple;
	bh=q02xHBtzDRtbgPZMmRiuOWe7tcZKt0E8TYgDa/42fSc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JkJv9WHI2xxETopf7FitO10AL6vHcapb8EKy+sUKu9+JOAq56xlQPKn2dvXdyh8S/ndB26n3UXhkVLKhhy+NaVLLhZ9aW3MI00cX+iNs97osIjKmUz4kEmfaeAt98vQEgGGgZaAqv8CApmlilRnAKW35daUDDh9ZfGVgwLj2bQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=pm60YOsI; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 230C02C0652;
	Mon,  4 Mar 2024 09:28:40 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1709497720;
	bh=q02xHBtzDRtbgPZMmRiuOWe7tcZKt0E8TYgDa/42fSc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=pm60YOsI+GPF2/XjaH9Sf1tchYsFivPFOwPCebIvaxFV0bga3KEjJkGHldXGxAHP6
	 zaqGSVwAqgcf0w2Zk20PxcxCKe3/kSm87f8WiKwkBT+KeQB1e7hikWZCnVOeoRS7lI
	 XAki74Ja0/D3BIxgAz7nWvFEOjnYlwfGEDUbZKA9huOpDnZOBkeBYcRFZ9nz23et5T
	 9zZ3JxHAaoQ/YL8yh/9s8uVEbbATpeeAsDkNdYv8wX4YWad4ThbvOCy2eTGl94JmIO
	 vomXRpUdB/eaOrM40Z3KRRqKLF2+wpsT9WKSvbkcADwLOczXBLVQwoN3JwX+hgKTON
	 AeTIDuaQ3qOyA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65e4dd770001>; Mon, 04 Mar 2024 09:28:39 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 4 Mar 2024 09:28:39 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Mon, 4 Mar 2024 09:28:39 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFT 0/3] i2c: mpc: use proper binding for transfer
 timeouts
Thread-Topic: [PATCH RFT 0/3] i2c: mpc: use proper binding for transfer
 timeouts
Thread-Index: AQHaav5GSOiVMdh1uE2cfe2fJzIwLrElotWA
Date: Sun, 3 Mar 2024 20:28:39 +0000
Message-ID: <b3d01672-7a81-4e93-ab9e-2ea216e40d89@alliedtelesis.co.nz>
References: <20240229105810.29220-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240229105810.29220-5-wsa+renesas@sang-engineering.com>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F2611897A8D8747BD5FAF233A1AE1C9@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65e4dd77 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=K6JAEmCyrfEA:10 a=w9H3kZa7z7M5lhOVuj4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyOS8wMi8yNCAyMzo1OCwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBUbyBjbGVhbiB1cCB0
aGUgY29uZnVzaW5nIHNpdHVhdGlvbiByZWdhcmRpbmcgSTJDIHRpbWVvdXQgYmluZGluZ3MsIGhl
cmUNCj4gaXMgdGhlIHNlcmllcyB0byBmaXggdXAgdGhlIE1QQyBkcml2ZXIgd2hpY2ggbWl4ZWQg
dXAgY2xvY2sgc3RyZXRjaGluZw0KPiB0aW1lb3V0IHdpdGggdHJhbnNmZXIgdGltZW91dHMuIFBs
dXMgYSBtaW5vciBjbGVhbnVwIHdoaWxlIGhlcmUuDQo+DQo+IE9ubHkgYnVpbGQgdGVzdGVkLCBz
byBhY3R1YWwgdGVzdGluZyBpcyB3ZWxjb21lLg0KDQpGb3IgdGhlIHNlcmllcw0KDQpSZXZpZXdl
ZC1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0K
DQphbmQgb24gYSBQMjA0MVJEQg0KDQpUZXN0ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBh
Y2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCg0KPg0KPg0KPiBXb2xmcmFtIFNhbmcgKDMpOg0K
PiAgICBkdC1iaW5kaW5nczogaTJjOiBtcGM6IHVzZSBwcm9wZXIgYmluZGluZyBmb3IgdHJhbnNm
ZXIgdGltZW91dHMNCj4gICAgaTJjOiBtcGM6IHVzZSBwcm9wZXIgYmluZGluZyBmb3IgdHJhbnNm
ZXIgdGltZW91dHMNCj4gICAgaTJjOiBtcGM6IHJlbW92ZSBvdXRkYXRlZCBtYWNybw0KPg0KPiAg
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwgICAgICAgICB8ICAyICst
DQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyAgICAgICAgICAgICAgICAgICAgIHwg
MTYgKysrKysrKy0tLS0tLS0tLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCAxMCBkZWxldGlvbnMoLSkNCj4=

