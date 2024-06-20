Return-Path: <linux-i2c+bounces-4119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6F090FAC0
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 03:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D13CA1C2143B
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 01:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BE2ABA46;
	Thu, 20 Jun 2024 01:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Q2QDIuog"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B839B320B
	for <linux-i2c@vger.kernel.org>; Thu, 20 Jun 2024 01:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718845529; cv=none; b=MlEuQrfSdNtsEe/abdF6kReKA1irRjiYTdDkZcAyruto0NufBpVlaVur3t7Ld6hEES9PwxGJU1bj6dlFfACyRjSuDp2wC85ajLsoFgIa6pwEDF/b7AUxnQlH3P/QnoeDyf5hY0/g3J0NY3WQqc4jibYn/DsBZLxthvS/8paALUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718845529; c=relaxed/simple;
	bh=SavSndA/u2H9gbARk/djutSfqZDpUHGWYWRdfF+wye0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LCqTjd3gO6Gh5+p4TpbsOVADE+Trn4SkAEfvLR3nrKb1vPfPpIJljV88zaH1k34bP5iD5RXjj0lMKEokeMXlOi0teFFkFh2KmZGD96NMCYvza35+0UppLFS7Qn//OXe48OBOgyrEmH+nhjlimOTqJpEdR7/70pewWYQSXnNnUS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Q2QDIuog; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 726B52C0358;
	Thu, 20 Jun 2024 13:05:24 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1718845524;
	bh=SavSndA/u2H9gbARk/djutSfqZDpUHGWYWRdfF+wye0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Q2QDIuogwp+i8Y9oYlo91Z4/NIGNuheUVHY+pAORWZBTHjb6OHOETEOhxB6KguEJQ
	 IitUQjEzKQ0A0K6sYWZNlWwmOZIFmyRpJDD9tuZ8PyXSc4GhaNoWR2wKH8ow/Q31IY
	 7dDldpQYccUHE+I08VR86FfHISnACQ2NOaZwxDAeFGPBpGxzRShUTyStwYjgrh9XCp
	 KJ8GJsstksM3M7i56HbCm0GedKSr6dWeSpoWnZhllCqmxye6k5VdYK6vq8ygtI2bgi
	 L3+tzfwXk7LrO3BpZmWnBs6ASd94/FXhZG+1eZnaT+89nLvmCwRDvx4R5Wl+Cl1owE
	 uBMFxhorI7U4w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B667380540001>; Thu, 20 Jun 2024 13:05:24 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 20 Jun 2024 13:05:24 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.011; Thu, 20 Jun 2024 13:05:24 +1200
From: Aryan Srivastava <Aryan.Srivastava@alliedtelesis.co.nz>
To: "Markus.Elfring@web.de" <Markus.Elfring@web.de>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "rric@kernel.org"
	<rric@kernel.org>
Subject: Re: [PATCH v6 1/2] i2c: octeon: refactor hlc r/w operations
Thread-Topic: [PATCH v6 1/2] i2c: octeon: refactor hlc r/w operations
Thread-Index: AQHavTz6fQ4iQdx2D0KL9Q0aILYeGrHEc0wAgAqk6oA=
Date: Thu, 20 Jun 2024 01:05:24 +0000
Message-ID: <91f9c8b0938851ce399062dac03363e77d38f547.camel@alliedtelesis.co.nz>
References: <20240613025412.3848629-1-aryan.srivastava@alliedtelesis.co.nz>
	 <20240613025412.3848629-2-aryan.srivastava@alliedtelesis.co.nz>
	 <8383c494-911f-40fd-abfa-9489fada67a3@web.de>
In-Reply-To: <8383c494-911f-40fd-abfa-9489fada67a3@web.de>
Accept-Language: en-US, en-NZ
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <091B5162677A124EBB8455DB47AB441D@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=66738054 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=w1vUsAckAk8A:10 a=IkcTkHD0fZMA:10 a=T1WGqf2p2xoA:10 a=AQz5W6wBH4rOcr7yEUoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

SGkgTWFya3VzLA0KT24gVGh1LCAyMDI0LTA2LTEzIGF0IDA4OjMyICswMjAwLCBNYXJrdXMgRWxm
cmluZyB3cm90ZToNCj4gPiBSZWZhY3RvciB0aGUgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiB0
aGUgaGlnaC1sZXZlbCBjb21wb3NpdGUNCj4gPiByZWFkIGFuZA0KPiA+IHdyaXRlIG9wZXJhdGlv
bnMgaW4gcHJlcGFyYXRpb24gb2YgdGhlIGFkZGl0aW9uIG9mIGJsb2NrLW1vZGUNCj4gPiByZWFk
L3dyaXRlDQo+ID4gb3BlcmF0aW9ucy4NCj4g4oCmDQo+IA0KPiAqIEkgZmluZCB0aGF0IGEgY292
ZXIgbGV0dGVyIGNhbiBiZSBoZWxwZnVsIGFsc28gZm9yIHRoZSBwcmVzZW50ZWQNCj4gc21hbGwg
cGF0Y2ggc2VyaWVzLg0KPiANCkkgZGlkIG1ha2Ugb25lLCBidXQgSSBhbSBub3Qgc3VyZSB3aGF0
IGhhcHBlbmVkIHRvIGl0LiBUaGUgbGluayBvbiB0aGUNCmxvcmUua2VybmVsIHRocmVhZCBmb3Ig
aXQgaXMgYnJva2VuLCBJIG1pZ2h0IGhhdmUgZ2VuZXJhdGVkIGl0DQppbmNvcnJlY3RseT8gSG9w
ZWZ1bGx5IHRoZSBuZXh0IHBhdGNoIHNlcmllcyB3aWxsIGhhdmUgaW50YWN0Lg0KPiAqIEhvdyBk
byB5b3UgdGhpbmsgYWJvdXQgdG8gcmVwbGFjZSBhbnkgYWJicmV2aWF0aW9ucyBpbiBzdW1tYXJ5
DQo+IHBocmFzZXM/DQo+IMKgIC0gSExDDQo+IMKgIC0gci93DQo+IA0KRG9uZS4NCj4gDQo+IFJl
Z2FyZHMsDQo+IE1hcmt1cw0KDQpUaGFua3MsDQpBcnlhbg0K

