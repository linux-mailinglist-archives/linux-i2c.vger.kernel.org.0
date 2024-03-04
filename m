Return-Path: <linux-i2c+bounces-2179-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45356870B1E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 21:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00CE6283180
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 20:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 878037995F;
	Mon,  4 Mar 2024 20:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="o5HHxq2L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5E67A139
	for <linux-i2c@vger.kernel.org>; Mon,  4 Mar 2024 20:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709582580; cv=none; b=qwh/EZ3xadDOFWpnhBQ4aXlKPmeLpj2R+X2lU8o0n6AFGSb6F1lgdekB49yAs6tEVtObx3m8rMQrhK47nOwnMojDGK9zpOpFDEnqSYQbI5IUUK86s+Cika2yBYr/i3pDYti9TwZpiEym0G0EK6ShhlJTJLheEh1GQ4rz81gzdxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709582580; c=relaxed/simple;
	bh=/LPidozw5UkwarCYzfBbkrQKWhhCq9LVcOP9y9lSJIM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A5Kgig6NnxeHnTmmjrpA+28MyRTW5tOSQGRqfVechHb48QBMLvuaKItUdRY12+4FKs83ZAbFQ2s8+g8yGwYSV/GFiBAyzW6fnuqDjyZXlYsUl0Ny1AsY5a2U5d9VNP6ZVbSXfhYX0h6bPbU1UZs4YjKAU2aB+5P4Kd0tC9Ary2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=o5HHxq2L; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9A7412C04C9;
	Tue,  5 Mar 2024 09:02:48 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1709582568;
	bh=/LPidozw5UkwarCYzfBbkrQKWhhCq9LVcOP9y9lSJIM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=o5HHxq2LjuPmSQ3VhN1oHwqVoNUEAxD/8C3ahWW2Qs5AKe6lhe4l/KO/oTaIx81YQ
	 mSml93DIEV5XPAOYZ2m84f3fTRZ+OFPxh+sRC3E4cqcBbVap9eLdlr6EvS/cWywc0E
	 zmB7nAnfTL8SyEvVInifrNqRjt6vI5bWNdDqU1M+qUb0i05Vr4QRsbxwjGdNZOvU9Y
	 +qhcGIZuEIYGHteguox2wT8RJQBf5lYD9hmLVbvwcjgb1KYImGg5Kom0k5zw9vHepB
	 BOLGEGk9GDqujoCcequf3eVGmNb5LMsZW79BCEtUKg+dlXeIPgsH5rJkgcqkv7ihCc
	 +6rMwso6lAC4w==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65e628e80001>; Tue, 05 Mar 2024 09:02:48 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 5 Mar 2024 09:02:48 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Tue, 5 Mar 2024 09:02:48 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RFT 1/3] dt-bindings: i2c: mpc: use proper binding for
 transfer timeouts
Thread-Topic: [PATCH RFT 1/3] dt-bindings: i2c: mpc: use proper binding for
 transfer timeouts
Thread-Index: AQHaav5GS1M8pxP1xEubQWdLBIKzKrEm3eAAgABQEQA=
Date: Mon, 4 Mar 2024 20:02:48 +0000
Message-ID: <89335a8e-4963-4992-a519-b88b15e3ff69@alliedtelesis.co.nz>
References: <20240229105810.29220-5-wsa+renesas@sang-engineering.com>
 <20240229105810.29220-6-wsa+renesas@sang-engineering.com>
 <r3tho2bh3l23f5xkjc3ovq4xdehpsb3nz4ukbkremxvzq6shpe@kdsxfz4brskb>
In-Reply-To: <r3tho2bh3l23f5xkjc3ovq4xdehpsb3nz4ukbkremxvzq6shpe@kdsxfz4brskb>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E6D7DA30971DF4BA5FC17CF8E09617F@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65e628e8 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=K6JAEmCyrfEA:10 a=LDBv8-xUAAAA:8 a=wMjMLsQrkjzMquoGyIgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TIyoBwpO-cKII9bNTSam:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-SEG-SpamProfiler-Score: 0

SGkgQW5kaSwNCg0KT24gNS8wMy8yNCAwNDoxNiwgQW5kaSBTaHl0aSB3cm90ZToNCj4gSGksDQo+
DQo+IE9uIFRodSwgRmViIDI5LCAyMDI0IGF0IDExOjU4OjExQU0gKzAxMDAsIFdvbGZyYW0gU2Fu
ZyB3cm90ZToNCj4+ICJpMmMtc2NsLWNsay1sb3ctdGltZW91dC11cyIgaGFzIGZsYXdzIGluIGl0
c2VsZiBhbmQgdGhlIHVzYWdlIGhlcmUgaXMNCj4+IGFsbCB3cm9uZy4gVGhlIGRyaXZlciBkb2Vz
bid0IHVzZSBpdCBhcyBhIG1heGltdW0gdGltZSBmb3IgY2xvY2sNCj4+IHN0cmV0Y2hpbmcgYnV0
IHRoZSBtYXhpbXVtIHRpbWUgZm9yIGEgdG90YWwgdHJhbnNmZXIuIFdlIGFscmVhZHkgaGF2ZQ0K
Pj4gYSBiaW5kaW5nIGZvciB0aGUgbGF0dGVyLiBDb252ZXJ0IHRoZSB3cm9uZyBiaW5kaW5nIGZy
b20gZXhhbXBsZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVu
ZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4NCj4+IC0tLQ0KPj4gICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tcGMueWFtbCB8IDIgKy0NCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW1wYy55YW1sIGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwNCj4+IGluZGV4
IDcwZmI2OWI5MjNjNC4uYjFkN2QxNGMwYmU0IDEwMDY0NA0KPj4gLS0tIGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXBjLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW1wYy55YW1sDQo+PiBAQCAtOTYsNiAr
OTYsNiBAQCBleGFtcGxlczoNCj4+ICAgICAgICAgICBpbnRlcnJ1cHRzID0gPDQzIDI+Ow0KPj4g
ICAgICAgICAgIGludGVycnVwdC1wYXJlbnQgPSA8Jm1waWM+Ow0KPj4gICAgICAgICAgIGNsb2Nr
LWZyZXF1ZW5jeSA9IDw0MDAwMDA+Ow0KPj4gLSAgICAgICAgaTJjLXNjbC1jbGstbG93LXRpbWVv
dXQtdXMgPSA8MTAwMDA+Ow0KPj4gKyAgICAgICAgaTJjLXRyYW5zZmVyLXRpbWVvdXQtdXMgPSA8
MTAwMDA+Ow0KPiBDaHJpcywgY2FuIHlvdSBwbGVhc2UgZ2l2ZSBpdCBhbiBhY2s/DQo+DQo+IFRo
ZSB3aG9sZSBzZXJpZXMgaXMgY29oZXJlbnQgdG8gdGhpcyBjaGFuZ2UuDQoNCkxvb2tzIGxpa2Ug
eW91IHdlcmVuJ3Qgb24gdGhlIFRvOiBsaXN0IGZvciB0aGUgY292ZXIgbGV0dGVyIHdoaWNoIEkg
DQpyZXBsaWVkIHRvLg0KDQpGb3IgdGhlIHNlcmllcw0KDQpSZXZpZXdlZC1ieTogQ2hyaXMgUGFj
a2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KDQphbmQgb24gYSBQMjA0
MVJEQg0KDQpUZXN0ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVs
ZXNpcy5jby5uej4NCg==

