Return-Path: <linux-i2c+bounces-12150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D666DB1AA39
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 22:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B4743BEE1E
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Aug 2025 20:45:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CA35238C1A;
	Mon,  4 Aug 2025 20:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="j3Js7PeG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB3A1F4615
	for <linux-i2c@vger.kernel.org>; Mon,  4 Aug 2025 20:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754340327; cv=none; b=hTrBsdTvIoZg58a9rNFLvP5cH0TGUMfLwo1JMTH2kvqTABUIbEHNwIdv95tIvOknRIF5/YYvVXFWduShDoNIIYeTxZQTsJDs8xfDHsjkuh8I/vxT/ky9773flggI3RreHsMCb6w16Z1DChdL78qjSdsRPs7DMzzEZiQHql2dLzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754340327; c=relaxed/simple;
	bh=IjJKZzdJDzq7KRLALknVBAWFv16rllC57Lmd92C2vnA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZwAPz5Li+qgPQlQJosDJzKAoCSY4cnKGpM+yZy1N+gRaAQBDiCsdcz+bvU6m8Dy/vv57oVeAJmr3oyceuLHbLy62T3il42Xb9CsWoepkUkkXOfFIT/MwYbHh4M+XK+CnbLM/jDJImTXw/D7mbv8LNGJdF/CZpZWv+/BXMwdww9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=j3Js7PeG; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 077312C045C;
	Tue,  5 Aug 2025 08:45:21 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1754340321;
	bh=IjJKZzdJDzq7KRLALknVBAWFv16rllC57Lmd92C2vnA=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=j3Js7PeGwKxynoK1/LpipbB4mE0xKp+RUTNr3zkULpOD+YZTRx0a1I4aRDplSLyam
	 /TQMs3BC0f/YwBW8O0UXUEw+V3oJWlNqK3bxpnzdO0a2VzPkNZHGcckAkIGR7T6AZV
	 WvH/8jVl31P8vY8ww/UJ0XUDCJ5eWu3gv4+iAfbaF1jK0/f09m2FIKeohJeuD37Pgj
	 r/uR3mJC3IYd77pxe1Jh4HehXThUK77EIVmHcw9to+2Odh8RoIfA7NU7s0QTzQcm7F
	 Qh7xdCex8S7niL/d+8CwL0HOSn581yyhOuBg+kJdokTF2ZHmKkGufWt0kz2WBeDhq4
	 78niKnjzn8ISQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B68911be00001>; Tue, 05 Aug 2025 08:45:20 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 5 Aug 2025 08:45:20 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.014; Tue, 5 Aug 2025 08:45:20 +1200
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Sven Eckelmann <sven@narfation.org>, Andi Shyti <andi.shyti@kernel.org>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Jelonek
	<jelonek.jonas@gmail.com>, Harshal Gohel <hg@simonwunderlich.de>, "Simon
 Wunderlich" <sw@simonwunderlich.de>, "stable@vger.kernel.org"
	<stable@vger.kernel.org>
Subject: Re: [PATCH v2 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Thread-Topic: [PATCH v2 0/4] i2c: rtl9300: Fix multi-byte I2C operations
Thread-Index: AQHcBJd8bmOI4NeShEipRLvbsLTQkLRQvKUAgACmgICAAMvjAA==
Date: Mon, 4 Aug 2025 20:45:20 +0000
Message-ID: <f635263b-524f-4b72-8e52-9019d3761544@alliedtelesis.co.nz>
References: <20250803-i2c-rtl9300-multi-byte-v2-0-9b7b759fe2b6@narfation.org>
 <4152a424-13ea-4437-b9e9-f1b5561cca9e@alliedtelesis.co.nz>
 <10701742.nUPlyArG6x@ripper>
In-Reply-To: <10701742.nUPlyArG6x@ripper>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <8E5AD9F388830943BC5408457C89780C@alliedtelesis.co.nz>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dtt4CEg4 c=1 sm=1 tr=0 ts=68911be0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=62ntRvTiAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=sPyYOCAXAAAA:8 a=37r0mbmQKWHD3V_2CnIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=96ojHBnQknRBTfH8o4xf:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAwNC8wOC8yMDI1IDIwOjM1LCBTdmVuIEVja2VsbWFubiB3cm90ZToNCj4gT24gTW9uZGF5
LCA0IEF1Z3VzdCAyMDI1IDAwOjM5OjQwIENFU1QgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IEZv
ciB0aGUgc2VyaWVzDQo+Pg0KPj4gUmV2aWV3ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBh
Y2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+IFRlc3RlZC1ieTogQ2hyaXMgUGFja2hhbSA8
Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPiBUaGFuayB5b3UuDQo+DQo+PiBO
b3RlIHRoYXQgSSd2ZSBvbmx5IGdvdCB0aGUgc2FtZSBzaW1wbGUgZWVwcm9tIGRldmljZXMgdGhh
dCBJIGRpZCB0aGUNCj4+IGluaXRpYWwgZGV2ZWxvcG1lbnQgb24gc28gSSBkb24ndCB0aGluayBJ
J3ZlIHJlYWxseSBleGVyY2lzZWQgdGhlIGJsb2NrDQo+PiBkYXRhIHBhdGhzIGJ1dCBJIGNhbiBz
YXkgdGhlIGNoYW5nZXMgZG9uJ3QgYXBwZWFyIHRvIGhhdmUgcmVncmVzc2VkDQo+PiBhbnl0aGlu
Zy4NCj4gSSBjYW4gdW5kZXJzdGFuZCB0aGlzIHByb2JsZW0gcXVpdGUgd2VsbC4gV2UgY2FuIGFs
bCBvbmx5IHRyeSBvdXIgYmVzdCBhbmQNCj4gdGhlbiBob3BlIHRoYXQgc29tZW9uZSB3aXRoIHRo
ZSBhY3R1YWwgSFcgY2FuIGZpZ3VyZSBvdXQgdGhlIHNwZWNpZmljIHBhcnRzDQo+IHdoaWNoIHdl
IGRpZG4ndCBoYWQgYWNjZXNzIHRvLg0KPg0KPg0KPj4gSXMgeW91IHNlcmllcyBpbnRlbmRlZCB0
byBhcHBseSBvbiB0b3Agb2YgSm9uYXMncz8gSSdtIHRyeWluZyB0byBhcHBseQ0KPj4geW91cnMg
YWxvbmUgKGZvciB2YXJpb3VzIHJlYXNvbnMgaGFwcGVucyB0byBiZSBvbiB0b3Agb2YgbmV0LW5l
eHQvbWFpbikNCj4+IGFuZCBJJ20gZ2V0dGluZyBjb25mbGljdHMuDQo+DQo+IE5vLCBJIHByZXBh
cmUgc29tZXRoaW5nIGZvciBkb3duc3RyZWFtIHRlc3RpbmcgKHdpdGggSm9uYXMnIHBhdGNoKToN
Cj4gaHR0cHM6Ly9zY2FubWFpbC50cnVzdHdhdmUuY29tLz9jPTIwOTg4JmQ9NFBDUTZCSEpFUEJ1
LTdCUUlRVVpxdVJUamZ4UXhJUk0xd0FMLW41bXZnJnU9aHR0cHMlM2ElMmYlMmZnaXRodWIlMmVj
b20lMmZvcGVud3J0JTJmb3BlbndydCUyZnB1bGwlMmYxOTU3NyUyM2Rpc2N1c3Npb24lNWZyMjI0
ODUyMDk0OQ0KPg0KPj4gQ29uZmxpY3QgYXBwZWFycyB0byBiZSB3aXRoDQo+PiBodHRwczovL3Nj
YW5tYWlsLnRydXN0d2F2ZS5jb20vP2M9MjA5ODgmZD00UENRNkJISkVQQnUtN0JRSVFVWnF1UlRq
ZnhReElSTTExQUktblV5dHcmdT1odHRwcyUzYSUyZiUyZmxvcmUlMmVrZXJuZWwlMmVvcmclMmZh
bGwlMmYyMDI1MDYxNTIzNTI0OCUyZTUyOTAxOS0xLWFsZXhndW8xMDIzJTQwZ21haWwlMmVjb20l
MmYNCj4gVGhhbmtzLCBJIHdhcyBub3QgYXdhcmUgb2YgdGhpcyBzcGVjaWZpYyBvbmUuIEkgZG9u
J3QgZXhhY3RseSBrbm93IHRoZSByZXBvDQo+IHN0cnVjdHVyZSBmb3IgSTJDIEhvc3QgZHJpdmVy
cy4gQnV0DQo+IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9h
bmRpLnNoeXRpL2xpbnV4LmdpdA0KPiBpMmMvaTJjLWhvc3QtZml4ZXMgb3IgaTJjL2kyYy1ob3N0
LW5leHQgZGlkbid0IGhhZCB0aGlzIHBhdGNoLiBJJ3ZlIGFsc28NCj4gY2hlY2tlZCBsaW51eC1u
ZXh0IGFuZCBjb3VsZG4ndCBmaW5kIHRoZSBwYXRjaCBhdCB0aGUgbW9tZW50Lg0KPg0KPiBJIGFt
IGd1ZXNzaW5nIGl0IGlzIHRoZSBiZXN0IHdoZW4gSSByZXNlbnQgdGhpcyBwYXRjaCBhcyBwYXJ0
IG9mIG15IHBhdGNoc2V0DQo+IGFuZCBtb2RpZnkgbXkgcGF0Y2hlcyBhY2NvcmRpbmdseS4gVGhl
IHJlc2VudCB3aWxsIHRoZW4gYmUgZG9uZSB0aGlzIGV2ZW5pbmcNCj4gKEdNVCsyKS4gUHJldmll
dyBjYW4gYmUgZm91bmQgYXQNCj4gaHR0cHM6Ly9zY2FubWFpbC50cnVzdHdhdmUuY29tLz9jPTIw
OTg4JmQ9NFBDUTZCSEpFUEJ1LTdCUUlRVVpxdVJUamZ4UXhJUk0xMVpZclhkanZnJnU9aHR0cHMl
M2ElMmYlMmZnaXQlMmVvcGVuLW1lc2glMmVvcmclMmZsaW51eC1tZXJnZSUyZWdpdCUyZmxvZyUy
ZiUzZmglM2RiNCUyZmkyYy1ydGw5MzAwLW11bHRpLWJ5dGUNCj4NCj4gSSd2ZSBhbHNvIGNoZWNr
ZWQgbGludXgtbmV4dCBhbmQgY291bGRuJ3QgZmluZCB0aGUgcGF0Y2ggYXQgdGhlIG1vbWVudC4N
Cg0KT29wcyBteSBiYWQuIEknZCBhcHBsaWVkIEFsZXgncyBwYXRjaCB0byB0ZXN0IGxvY2FsbHkg
dGhlbiBhZGRlZCBtb3JlIA0Kc3R1ZmYgb24gdG9wIG9mIGl0IGFuZCBwcm9tcHRseSBmb3Jnb3Qu
IFdoZW4gSSBjYW1lIHRvIHRlc3QgeW91ciBwYXRjaGVzIA0KSSBqdXN0IHJlYmFzZWQgb24gdG9w
IG9mIG5ldC1uZXh0IHdoaWNoIEkgaW5jb3JyZWN0bHkgYXNzdW1lZCBoYWQgcGlja2VkIA0KdXAg
QWxleCdzIGNoYW5nZSB2aWEgbGludXgtbmV4dCBoZW5jZSByZXBvcnRpbmcgdGhlIGNvbmZsaWN0
IHdoaWNoIHlvdSANCmNhbid0IHNlZS4gR2xhZCB5b3UgbWFuYWdlZCB0byBmaWd1cmUgaXQgb3V0
IG9uIHlvdXIgZW5kIGZvciB2My4NCg0KPg0KPiBLaW5kIHJlZ2FyZHMsDQo+IAlTdmVu

