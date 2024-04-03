Return-Path: <linux-i2c+bounces-2735-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 427BB896255
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 04:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ECFB928A7BD
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Apr 2024 02:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACFC17729;
	Wed,  3 Apr 2024 02:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Ew5tnbrM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF02168DE
	for <linux-i2c@vger.kernel.org>; Wed,  3 Apr 2024 02:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712110251; cv=none; b=ShaVEqGrVok1ZPQQFlOZmIngwCl3EpQVAtQY/pvmChndnwJHgbEB8TcRoPyx2gN51ZKFggGo0SzZCvfREMM2UAUPEE+Jd/cliL80KzlTglXh05SnhtqFhjuSuaMZEeGe3uM6iFrcVZiEva7AT8zzXe+2grVXYyG1zYQE4H3Eg4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712110251; c=relaxed/simple;
	bh=MMccoElNIidbDCEV3bIQaz9YICJ3wVIongM1aktIckQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Tv507S7QWECTl15M6J6d2Oiu5k2DpsNe/DLyIUcT2xdW4iLOR8IQukIWWawg2F7TFm3Kbfd8wP9PbshDuBEmAB5ZtIF51oaTkwu1x0jo8Z5lOMLx+xvN0DbJSfgikbQ5FyVA3iiIJaclxbQdEJC4WWL0QoQSPLyF58qODgbsfF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Ew5tnbrM; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 7BF272C035A;
	Wed,  3 Apr 2024 15:10:45 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1712110245;
	bh=MMccoElNIidbDCEV3bIQaz9YICJ3wVIongM1aktIckQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=Ew5tnbrMrtvHXpGiZvQiGG6TP4+Ekcyl8MmNtU4jWg56WmasV3kdOCarNZ4Qk9UUb
	 nXvcTeV/nmWys5zboIf5EJe4hshP3R3Y2UIdfuq8CC9LZ6wG/FyIGmoRBGmnOOUnyH
	 CtJ8Xl4pfNB6+IgM9NcMgHzSR+2GKZfC1Sx7vYd41eKujOOieUuJw81sFsVrVO8utn
	 cai4+xNh5hbiAKhl1YvZeygooGv10LDHXmgZTtf2tqNyF60uau6HVJ2qrKohIakhaS
	 uHQitH+9JBETWLUtx5bnH+teuJBhA6nOxk7GcgRhkwL71P1QC7dlnDsIsnWUQFiV7a
	 aT/vv1fQHPIJg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B660cbaa50001>; Wed, 03 Apr 2024 15:10:45 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 3 Apr 2024 15:10:45 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1544.009; Wed, 3 Apr 2024 15:10:45 +1300
From: Hamish Martin <Hamish.Martin@alliedtelesis.co.nz>
To: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "linux-acpi@vger.kernel.org"
	<linux-acpi@vger.kernel.org>
Subject: Re: [PATCH v4] i2c: acpi: Unbind mux adapters before delete
Thread-Topic: [PATCH v4] i2c: acpi: Unbind mux adapters before delete
Thread-Index: AQHadMrxIWzpxiinSk6pUI18XlvsjrFVFMAA
Date: Wed, 3 Apr 2024 02:10:45 +0000
Message-ID: <89b741977d593fc951fef662eeb798c5d0022610.camel@alliedtelesis.co.nz>
References: <20240312221632.859695-1-hamish.martin@alliedtelesis.co.nz>
In-Reply-To: <20240312221632.859695-1-hamish.martin@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <8844518C63C6024693B1CD0254DC906E@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=AuZN3/9P c=1 sm=1 tr=0 ts=660cbaa5 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=fzn4atkRgMAA:10 a=IkcTkHD0fZMA:10 a=raytVjVEu-sA:10 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=wf1iD-8retGsROMgoPsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0

T24gV2VkLCAyMDI0LTAzLTEzIGF0IDExOjE2ICsxMzAwLCBIYW1pc2ggTWFydGluIHdyb3RlOg0K
PiBUaGVyZSBpcyBhbiBpc3N1ZSB3aXRoIEFDUEkgb3ZlcmxheSB0YWJsZSByZW1vdmFsIHNwZWNp
ZmljYWxseQ0KPiByZWxhdGVkDQo+IHRvIEkyQyBtdWx0aXBsZXhlcnMuDQo+IA0KPiBDb25zaWRl
ciBhbiBBQ1BJIFNTRFQgT3ZlcmxheSB0aGF0IGRlZmluZXMgYSBQQ0E5NTQ4IEkyQyBtdXggb24g
YW4NCj4gZXhpc3RpbmcgSTJDIGJ1cy4gV2hlbiB0aGlzIHRhYmxlIGlzIGxvYWRlZCB3ZSBzZWUg
dGhlIGNyZWF0aW9uIG9mIGENCj4gZGV2aWNlIGZvciB0aGUgb3ZlcmFsbCBQQ0E5NTQ4IGNoaXAg
YW5kIDggZnVydGhlciBkZXZpY2VzIC0gb25lDQo+IGkyY19hZGFwdGVyIGVhY2ggZm9yIHRoZSBt
dXggY2hhbm5lbHMuIFRoZXNlIGFyZSBhbGwgYm91bmQgdG8gdGhlaXINCj4gQUNQSSBlcXVpdmFs
ZW50cyB2aWEgYW4gZXZlbnR1YWwgaW52b2NhdGlvbiBvZiBhY3BpX2JpbmRfb25lKCkuDQo+IA0K
PiBXaGVuIHdlIHVubG9hZCB0aGUgU1NEVCBvdmVybGF5IHdlIHJ1biBpbnRvIHRoZSBwcm9ibGVt
LiBUaGUgQUNQSQ0KPiBkZXZpY2VzIGFyZSBkZWxldGVkIGFzIG5vcm1hbCB2aWEgYWNwaV9kZXZp
Y2VfZGVsX3dvcmtfZm4oKSBhbmQgdGhlDQo+IGFjcGlfZGV2aWNlX2RlbF9saXN0Lg0KPiANCj4g
SG93ZXZlciwgdGhlIGZvbGxvd2luZyB3YXJuaW5nIGFuZCBzdGFjayB0cmFjZSBpcyBvdXRwdXQg
YXMgdGhlDQo+IGRlbGV0aW9uIGRvZXMgbm90IGdvIHNtb290aGx5Og0KPiAtLS0tLS0tLS0tLS1b
IGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4ga2VybmZzOiBjYW4gbm90IHJlbW92ZSAncGh5c2lj
YWxfbm9kZScsIG5vIGRpcmVjdG9yeQ0KPiBXQVJOSU5HOiBDUFU6IDEgUElEOiAxMSBhdCBmcy9r
ZXJuZnMvZGlyLmM6MTY3NA0KPiBrZXJuZnNfcmVtb3ZlX2J5X25hbWVfbnMrMHhiOS8weGMwDQo+
IE1vZHVsZXMgbGlua2VkIGluOg0KPiBDUFU6IDEgUElEOiAxMSBDb21tOiBrd29ya2VyL3UxMjg6
MCBOb3QgdGFpbnRlZCA2LjguMC1yYzYrICMxDQo+IEhhcmR3YXJlIG5hbWU6IGNvbmdhdGVjIEFH
IGNvbmdhLUI3RTMvY29uZ2EtQjdFMywgQklPUyA1LjEzDQo+IDA1LzE2LzIwMjMNCj4gV29ya3F1
ZXVlOiBrYWNwaV9ob3RwbHVnIGFjcGlfZGV2aWNlX2RlbF93b3JrX2ZuDQo+IFJJUDogMDAxMDpr
ZXJuZnNfcmVtb3ZlX2J5X25hbWVfbnMrMHhiOS8weGMwDQo+IENvZGU6IGU0IDAwIDQ4IDg5IGVm
IGU4IDA3IDcxIGRiIGZmIDViIGI4IGZlIGZmIGZmIGZmIDVkIDQxIDVjIDQxIDVkDQo+IGU5IGE3
IDU1IGU0IDAwIDBmIDBiIGViIGE2IDQ4IGM3IGM3IGYwIDM4IDBkIDlkIGU4IDk3IDBhIGQ1IGZm
IDwwZj4NCj4gMGIgZWIgZGMgMGYgMWYgMDAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAgOTAg
OTAgOTAgOTAgOTAgOTANCj4gUlNQOiAwMDE4OmZmZmY5Zjg2NDAwOGZiMjggRUZMQUdTOiAwMDAx
MDI4Ng0KPiBSQVg6IDAwMDAwMDAwMDAwMDAwMDAgUkJYOiBmZmZmOGVmOTBhOGQ0OTQwIFJDWDog
MDAwMDAwMDAwMDAwMDAwMA0KPiBSRFg6IGZmZmY4ZjAwMGUyNjdkMTAgUlNJOiBmZmZmOGYwMDBl
MjVjNzgwIFJESTogZmZmZjhmMDAwZTI1Yzc4MA0KPiBSQlA6IGZmZmY4ZWY5MTg2Zjk4NzAgUjA4
OiAwMDAwMDAwMDAwMDEzZmZiIFIwOTogMDAwMDAwMDBmZmZmYmZmZg0KPiBSMTA6IDAwMDAwMDAw
ZmZmZmJmZmYgUjExOiBmZmZmOGYwMDBlMGEwMDAwIFIxMjogZmZmZjlmODY0MDA4ZmI1MA0KPiBS
MTM6IGZmZmY4ZWY5MGM5M2RkNjAgUjE0OiBmZmZmOGVmOTAxMGQwOTU4IFIxNTogZmZmZjhlZjkx
ODZmOThjOA0KPiBGUzrCoCAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY4ZjAwMGUyNDAw
MDAoMDAwMCkNCj4ga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPiBDUzrCoCAwMDEwIERTOiAwMDAw
IEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0KPiBDUjI6IDAwMDA3ZjQ4ZjUyNTNhMDgg
Q1IzOiAwMDAwMDAwM2NiODJlMDAwIENSNDogMDAwMDAwMDAwMDM1MDZmMA0KPiBDYWxsIFRyYWNl
Og0KPiDCoDxUQVNLPg0KPiDCoD8ga2VybmZzX3JlbW92ZV9ieV9uYW1lX25zKzB4YjkvMHhjMA0K
PiDCoD8gX193YXJuKzB4N2MvMHgxMzANCj4gwqA/IGtlcm5mc19yZW1vdmVfYnlfbmFtZV9ucysw
eGI5LzB4YzANCj4gwqA/IHJlcG9ydF9idWcrMHgxNzEvMHgxYTANCj4gwqA/IGhhbmRsZV9idWcr
MHgzYy8weDcwDQo+IMKgPyBleGNfaW52YWxpZF9vcCsweDE3LzB4NzANCj4gwqA/IGFzbV9leGNf
aW52YWxpZF9vcCsweDFhLzB4MjANCj4gwqA/IGtlcm5mc19yZW1vdmVfYnlfbmFtZV9ucysweGI5
LzB4YzANCj4gwqA/IGtlcm5mc19yZW1vdmVfYnlfbmFtZV9ucysweGI5LzB4YzANCj4gwqBhY3Bp
X3VuYmluZF9vbmUrMHgxMDgvMHgxODANCj4gwqBkZXZpY2VfZGVsKzB4MThiLzB4NDkwDQo+IMKg
PyBzcnNvX3JldHVybl90aHVuaysweDUvMHg1Zg0KPiDCoD8gc3Jzb19yZXR1cm5fdGh1bmsrMHg1
LzB4NWYNCj4gwqBkZXZpY2VfdW5yZWdpc3RlcisweGQvMHgzMA0KPiDCoGkyY19kZWxfYWRhcHRl
ci5wYXJ0LjArMHgxYmYvMHgyNTANCj4gwqBpMmNfbXV4X2RlbF9hZGFwdGVycysweGExLzB4ZTAN
Cj4gwqBpMmNfZGV2aWNlX3JlbW92ZSsweDFlLzB4ODANCj4gwqBkZXZpY2VfcmVsZWFzZV9kcml2
ZXJfaW50ZXJuYWwrMHgxOWEvMHgyMDANCj4gwqBidXNfcmVtb3ZlX2RldmljZSsweGJmLzB4MTAw
DQo+IMKgZGV2aWNlX2RlbCsweDE1Ny8weDQ5MA0KPiDCoD8gX19wZnhfZGV2aWNlX21hdGNoX2Z3
bm9kZSsweDEwLzB4MTANCj4gwqA/IHNyc29fcmV0dXJuX3RodW5rKzB4NS8weDVmDQo+IMKgZGV2
aWNlX3VucmVnaXN0ZXIrMHhkLzB4MzANCj4gwqBpMmNfYWNwaV9ub3RpZnkrMHgxMGYvMHgxNDAN
Cj4gwqBub3RpZmllcl9jYWxsX2NoYWluKzB4NTgvMHhkMA0KPiDCoGJsb2NraW5nX25vdGlmaWVy
X2NhbGxfY2hhaW4rMHgzYS8weDYwDQo+IMKgYWNwaV9kZXZpY2VfZGVsX3dvcmtfZm4rMHg4NS8w
eDFkMA0KPiDCoHByb2Nlc3Nfb25lX3dvcmsrMHgxMzQvMHgyZjANCj4gwqB3b3JrZXJfdGhyZWFk
KzB4MmYwLzB4NDEwDQo+IMKgPyBfX3BmeF93b3JrZXJfdGhyZWFkKzB4MTAvMHgxMA0KPiDCoGt0
aHJlYWQrMHhlMy8weDExMA0KPiDCoD8gX19wZnhfa3RocmVhZCsweDEwLzB4MTANCj4gwqByZXRf
ZnJvbV9mb3JrKzB4MmYvMHg1MA0KPiDCoD8gX19wZnhfa3RocmVhZCsweDEwLzB4MTANCj4gwqBy
ZXRfZnJvbV9mb3JrX2FzbSsweDFiLzB4MzANCj4gwqA8L1RBU0s+DQo+IC0tLVsgZW5kIHRyYWNl
IDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPiAuLi4NCj4gcmVwZWF0ZWQgNyBtb3JlIHRpbWVzLCAx
IGZvciBlYWNoIGNoYW5uZWwgb2YgdGhlIG11eA0KPiAuLi4NCj4gDQo+IFRoZSBpc3N1ZSBpcyB0
aGF0IHRoZSBiaW5kaW5nIG9mIHRoZSBBQ1BJIGRldmljZXMgdG8gdGhlaXIgcGVlciBJMkMNCj4g
YWRhcHRlcnMgaXMgbm90IGNvcnJlY3RseSBjbGVhbmVkIHVwLiBEaWdnaW5nIGRlZXBlciBpbnRv
IHRoZSBpc3N1ZQ0KPiB3ZQ0KPiBzZWUgdGhhdCB0aGUgZGVsZXRpb24gb3JkZXIgaXMgc3VjaCB0
aGF0IHRoZSBBQ1BJIGRldmljZXMgbWF0Y2hpbmcNCj4gdGhlDQo+IG11eCBjaGFubmVsIGkyYyBh
ZGFwdGVycyBhcmUgZGVsZXRlZCBmaXJzdCBkdXJpbmcgdGhlIFNTRFQgb3ZlcmxheQ0KPiByZW1v
dmFsLiBGb3IgZWFjaCBvZiB0aGUgY2hhbm5lbHMgd2Ugc2VlIGEgY2FsbCB0byBpMmNfYWNwaV9u
b3RpZnkoKQ0KPiB3aXRoIEFDUElfUkVDT05GSUdfREVWSUNFX1JFTU9WRSBidXQsIGJlY2F1c2Ug
dGhlc2UgZGV2aWNlcyBhcmUgbm90DQo+IGFjdHVhbGx5IGkyY19jbGllbnRzLCBub3RoaW5nIGlz
IGRvbmUgZm9yIHRoZW0uDQo+IA0KPiBMYXRlciBvbiwgYWZ0ZXIgZWFjaCBvZiB0aGUgbXV4IGNo
YW5uZWxzIGhhcyBiZWVuIGRlYWx0IHdpdGgsIHdlIGNvbWUNCj4gdG8gZGVsZXRlIHRoZSBpMmNf
Y2xpZW50IHJlcHJlc2VudGluZyB0aGUgUENBOTU0OCBkZXZpY2UuIFRoaXMgaXMgdGhlDQo+IGNh
bGwgc3RhY2sgd2Ugc2VlIGFib3ZlLCB3aGVyZWJ5IHRoZSBrZXJuZWwgY2xlYW5zIHVwIHRoZSBp
MmNfY2xpZW50DQo+IGluY2x1ZGluZyBkZXN0cnVjdGlvbiBvZiB0aGUgbXV4IGFuZCBpdHMgY2hh
bm5lbCBhZGFwdGVycy4gQXQgdGhpcw0KPiBwb2ludCB3ZSBkbyBhdHRlbXB0IHRvIHVuYmluZCBm
cm9tIHRoZSBBQ1BJIHBlZXJzIGJ1dCB0aG9zZSBwZWVycyBubw0KPiBsb25nZXIgZXhpc3QgYW5k
IHNvIHdlIGhpdCB0aGUga2VybmZzIGVycm9ycy4NCj4gDQo+IFRoZSBmaXggaXMgdG8gYXVnbWVu
dCBpMmNfYWNwaV9ub3RpZnkoKSB0byBoYW5kbGUgaTJjX2FkYXB0ZXJzLiBCdXQsDQo+IGdpdmVu
IHRoYXQgdGhlIGxpZmUgY3ljbGUgb2YgdGhlIGFkYXB0ZXJzIGlzIGxpbmtlZCB0byB0aGUNCj4g
aTJjX2NsaWVudCwNCj4gaW5zdGVhZCBvZiBkZWxldGluZyB0aGUgaTJjX2FkYXB0ZXJzIGR1cmlu
ZyB0aGUgaTJjX2FjcGlfbm90aWZ5KCksIHdlDQo+IGp1c3QgdHJpZ2dlciB1bmJpbmRpbmcgb2Yg
dGhlIEFDUEkgZGV2aWNlIGZyb20gdGhlIGFkYXB0ZXIgZGV2aWNlLA0KPiBhbmQNCj4gYWxsb3cg
dGhlIGNsZWFuIHVwIG9mIHRoZSBhZGFwdGVyIHRvIGNvbnRpbnVlIGluIHRoZSB3YXkgaXQgYWx3
YXlzDQo+IGhhcy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEhhbWlzaCBNYXJ0aW4gPGhhbWlzaC5t
YXJ0aW5AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4gUmV2aWV3ZWQtYnk6IE1pa2EgV2VzdGVyYmVy
ZyA8bWlrYS53ZXN0ZXJiZXJnQGxpbnV4LmludGVsLmNvbT4NCj4gUmV2aWV3ZWQtYnk6IEFuZGkg
U2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4NCj4gRml4ZXM6IDUyNWU2ZmFiZWFlMiAoImky
YyAvIEFDUEk6IGFkZCBzdXBwb3J0IGZvciBBQ1BJIHJlY29uZmlndXJlDQo+IG5vdGlmaWNhdGlv
bnMiKQ0KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjQuOCsNCj4gLS0tDQo+IA0K
PiBOb3RlczoNCj4gwqDCoMKgIHY0Og0KPiDCoMKgwqDCoMKgIFJlc29sdmUgQnVpbGQgZmFpbHVy
ZSBub3RlZCBieToNCj4gwqDCoMKgwqDCoMKgwqAgTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVz
dGluZyA8bGtmdEBsaW5hcm8ub3JnPiwgYW5kDQo+IMKgwqDCoMKgwqDCoMKgIGtlcm5lbCB0ZXN0
IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPiDCoMKgwqDCoMKgIFRoZXNlIGZhaWx1cmVzIGxlZCB0
byByZXZlcnQgb2YgdGhlIHYzIHZlcnNpb24gb2YgdGhpcyBwYXRjaA0KPiB0aGF0IGhhZCBiZWVu
IGFjY2VwdGVkIGVhcmxpZXIuDQo+IMKgwqDCoCB2MzoNCj4gwqDCoMKgwqDCoCBBZGQgcmV2aWV3
ZWQgYnkgdGFncyAoTWlrYSBXZXN0ZXJiZXJnIGFuZCBBbmRpIFNoeXRpKSBhbmQgRml4ZXMNCj4g
dGFnLg0KPiDCoMKgwqAgdjI6DQo+IMKgwqDCoMKgwqAgTW92ZWQgbG9uZyBwcm9ibGVtIGRlc2Ny
aXB0aW9uIGZyb20gY292ZXIgbGV0dGVyIHRvIGNvbW1pdA0KPiBkZXNjcmlwdGlvbiBhdCBNaWth
J3Mgc3VnZ2VzdGlvbg0KPiANCj4gwqBkcml2ZXJzL2kyYy9pMmMtY29yZS1hY3BpLmMgfCAxOSAr
KysrKysrKysrKysrKystLS0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvaTJjLWNvcmUt
YWNwaS5jIGIvZHJpdmVycy9pMmMvaTJjLWNvcmUtDQo+IGFjcGkuYw0KPiBpbmRleCBkNjAzN2Ez
Mjg2NjkuLjE0YWUwY2ZjMzI1ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvaTJjLWNvcmUt
YWNwaS5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWFjcGkuYw0KPiBAQCAtNDQ1LDYg
KzQ0NSwxMSBAQCBzdGF0aWMgc3RydWN0IGkyY19jbGllbnQNCj4gKmkyY19hY3BpX2ZpbmRfY2xp
ZW50X2J5X2FkZXYoc3RydWN0IGFjcGlfZGV2aWNlICphZGV2KQ0KPiDCoMKgwqDCoMKgwqDCoMKg
cmV0dXJuIGkyY19maW5kX2RldmljZV9ieV9md25vZGUoYWNwaV9md25vZGVfaGFuZGxlKGFkZXYp
KTsNCj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMgc3RydWN0IGkyY19hZGFwdGVyICppMmNfYWNwaV9m
aW5kX2FkYXB0ZXJfYnlfYWRldihzdHJ1Y3QNCj4gYWNwaV9kZXZpY2UgKmFkZXYpDQo+ICt7DQo+
ICvCoMKgwqDCoMKgwqDCoHJldHVybiBpMmNfZmluZF9hZGFwdGVyX2J5X2Z3bm9kZShhY3BpX2Z3
bm9kZV9oYW5kbGUoYWRldikpOw0KPiArfQ0KPiArDQo+IMKgc3RhdGljIGludCBpMmNfYWNwaV9u
b3RpZnkoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwgdW5zaWduZWQgbG9uZw0KPiB2YWx1ZSwN
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2
b2lkICphcmcpDQo+IMKgew0KPiBAQCAtNDcxLDExICs0NzYsMTcgQEAgc3RhdGljIGludCBpMmNf
YWNwaV9ub3RpZnkoc3RydWN0DQo+IG5vdGlmaWVyX2Jsb2NrICpuYiwgdW5zaWduZWQgbG9uZyB2
YWx1ZSwNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
YnJlYWs7DQo+IMKgDQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2xpZW50ID0g
aTJjX2FjcGlfZmluZF9jbGllbnRfYnlfYWRldihhZGV2KTsNCj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGlmICghY2xpZW50KQ0KPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgaWYgKGNsaWVudCkgew0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGkyY191bnJlZ2lzdGVyX2RldmljZShjbGllbnQpOw0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHB1dF9kZXZpY2UoJmNsaWVudC0+ZGV2
KTsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gKw0KPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgYWRhcHRlciA9IGkyY19hY3BpX2ZpbmRfYWRhcHRlcl9ieV9h
ZGV2KGFkZXYpOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKGFkYXB0ZXIp
IHsNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBhY3Bp
X3VuYmluZF9vbmUoJmFkYXB0ZXItPmRldik7DQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgcHV0X2RldmljZSgmYWRhcHRlci0+ZGV2KTsNCj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gwqANCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoGkyY191bnJlZ2lzdGVyX2RldmljZShjbGllbnQpOw0KPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcHV0X2RldmljZSgmY2xpZW50LT5kZXYpOw0KPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOw0KPiDCoMKgwqDCoMKgwqDCoMKgfQ0KPiDCoA0K
DQpJIHdvbmRlciBpZiB0aGlzIHBhdGNoIGhhcyBzbGlwcGVkIHRocm91Z2ggdGhlIG5ldCBkdWUg
dG8gYSBwcm9jZXNzDQplcnJvciBvbiBteSBwYXJ0Lg0KDQpUaGUgdjMgdmVyc2lvbiB3YXMgYWNj
ZXB0ZWQgYnkgV29sZnJhbSBpbnRvIGZvci1jdXJyZW50IG9uIE1hcmNoIDR0aCwNCmJ1dCBhIGJ1
aWxkIGlzc3VlIHdhcyBkZXRlY3RlZCBieSBhIGNvdXBsZSBvZiB0ZXN0IHJvYm90cywgbGVhZGlu
ZyB0bw0KaXQgYmVpbmcgcmV2ZXJ0ZWQgMyBkYXlzIGxhdGVyLg0KSSBzdWJtaXR0ZWQgdGhpcyBj
b3JyZWN0ZWQgdjQgdmVyc2lvbiBvbiBNYXJjaCAxM3RoLiBQZXJoYXBzIEkgc2hvdWxkDQpoYXZl
IG5vdCBzdWJtaXR0ZWQgYSB2NCBhbmQgdGhhdCBoYXMgc2NyZXdlZCBzb21ldGhpbmcgdXAsIG9y
IHBlcmhhcHMNCmZvbGtzIGFyZSBqdXN0IGJ1c3kgOy0pLg0KDQpMZXQgbWUga25vdyB3aGF0IGZ1
cnRoZXIgd29yayBpcyByZXF1aXJlZCB0byBnZXQgdGhpcyBvbmUgYWNjZXB0ZWQuDQoNClRoYW5r
cywNCkhhbWlzaCBNLg0KDQoNCg==

