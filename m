Return-Path: <linux-i2c+bounces-1346-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 222A082FA05
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 22:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1EED1C25EF8
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jan 2024 21:22:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20210612EE;
	Tue, 16 Jan 2024 19:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="gwHVhC2C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67BC612EA
	for <linux-i2c@vger.kernel.org>; Tue, 16 Jan 2024 19:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705435098; cv=none; b=L8zxrU/ETn2KrlVSlL9KQTnyBv6+XTbArpli1eXcZ21W07VyOgowleZECf7E73NecD2pL+bySgvweEYCbjNCoju7aITptSjLxiTLBLlNJtabywMangngwlzBGD1Rud5rTpriI+NGXDOuSEXl1kcnRqQrfhLJ3gLZu+hbsa3254M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705435098; c=relaxed/simple;
	bh=m7wSxdVOaZ1i1jVeM8/JbhFQZmZwRKPRQYMQT50flwU=;
	h=Received:DKIM-Signature:Received:Received:Received:From:To:CC:
	 Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-originating-ip:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score; b=cQCGDAx09GFdMlCroqLZs1OCs/YaiNGk0JJmN9n5d0eQ3w4D/hYajcNQdjEUhSF6P1izy2th1XUxRQaOe/qCNmRYuLDDBx6p3PFLXYn/Eapb53cnLiP8JrbYcMAoQDk5tkhtGOuPoRbcQI/adtLCmTmlN6j+KHoNsp2BepExv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=gwHVhC2C; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5B0F12C02AE;
	Wed, 17 Jan 2024 08:58:13 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1705435093;
	bh=m7wSxdVOaZ1i1jVeM8/JbhFQZmZwRKPRQYMQT50flwU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=gwHVhC2C8PVwAw1SsadeAGITsha9gBemsoDBN3M5NGrIF0pmT9cn1uJUPjn+slUGC
	 TuvMsU4ACftQE4X+O2GhlTeIEswZ2W5EhRG8nuylzIETYgHFZszY556x/noevyfH7+
	 MyZ3iVOuyD39zhwtCyzrTtdbUnvnuczJPgedUZQUrKr5SqydQ7U8fnCyY+Nk3QOJMh
	 ZKjJbuVezl75h+aLzTWSVOvkDMPp1q2boLyhEPgP8AY5RM4zZz3ErsWI8Atp+QQDRJ
	 Y2Sv5qLBi/nMCGp8pK1VguaHEJ3y0bUl7O2eXTxOKXN/uuIGhGOVnLKyd7Y/VUgIf9
	 kyp7bLL5BJ+NA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65a6dfd50001>; Wed, 17 Jan 2024 08:58:13 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 17 Jan 2024 08:58:13 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Wed, 17 Jan 2024 08:58:13 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>, Srinivas Kandagatla
	<srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>, "linux-sound@vger.kernel.org"
	<linux-sound@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>, Sean Anderson
	<sean.anderson@seco.com>
Subject: Re: [PATCH v3 5/5] i2c: muxes: pca954x: Allow sharing reset GPIO
Thread-Topic: [PATCH v3 5/5] i2c: muxes: pca954x: Allow sharing reset GPIO
Thread-Index: AQHaRXWBLMixCZ8WK0+mNOuBScg1h7DbubEAgABOIQA=
Date: Tue, 16 Jan 2024 19:58:12 +0000
Message-ID: <4c6c5d07-ac53-4da9-93e0-1286ca5eb44b@alliedtelesis.co.nz>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
 <20240112163608.528453-6-krzysztof.kozlowski@linaro.org>
 <800d202864c1730622a19998728c5a8b576d1931.camel@pengutronix.de>
In-Reply-To: <800d202864c1730622a19998728c5a8b576d1931.camel@pengutronix.de>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <E5E79E64E8AE744098FF4C08FB92D028@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=LZFCFQXi c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=dEuoMetlWLkA:10 a=KKAkSRfTAAAA:8 a=62ntRvTiAAAA:8 a=VwQbUJbxAAAA:8 a=vE6nA0IPAAAA:8 a=uLhZSfaJXi4u2qP_6tYA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=pToNdpNmrtiFLRE6bQ9Z:22 a=AjGcO6oz07-iQ99wixmX:22 a=_s8P6U4_B6QeRRtK5oEG:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAxNy8wMS8yNCAwNDoxOCwgUGhpbGlwcCBaYWJlbCB3cm90ZToNCj4gT24gRnIsIDIwMjQt
MDEtMTIgYXQgMTc6MzYgKzAxMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+PiBGcm9t
OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+Pg0K
Pj4gU29tZSBoYXJkd2FyZSBkZXNpZ25zIHdpdGggbXVsdGlwbGUgUENBOTU0eCBkZXZpY2VzIHVz
ZSBhIHJlc2V0IEdQSU8NCj4+IGNvbm5lY3RlZCB0byBhbGwgdGhlIG11eGVzLiBTdXBwb3J0IHRo
aXMgY29uZmlndXJhdGlvbiBieSBtYWtpbmcgdXNlIG9mDQo+PiB0aGUgcmVzZXQgY29udHJvbGxl
ciBmcmFtZXdvcmsgd2hpY2ggY2FuIGRlYWwgd2l0aCB0aGUgc2hhcmVkIHJlc2V0DQo+PiBHUElP
cy4gRmFsbCBiYWNrIHRvIHRoZSBvbGQgR1BJTyBkZXNjcmlwdG9yIG1ldGhvZCBpZiB0aGUgcmVz
ZXQNCj4+IGNvbnRyb2xsZXIgZnJhbWV3b3JrIGlzIG5vdCBlbmFibGVkLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5u
ej4NCj4+IEFja2VkLWJ5OiBQZXRlciBSb3NpbiA8cGVkYUBheGVudGlhLnNlPg0KPj4gUmV2aWV3
ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9y
Zz4NCj4+IExpbms6IGh0dHBzOi8vc2Nhbm1haWwudHJ1c3R3YXZlLmNvbS8/Yz0yMDk4OCZkPThw
Nm01VGZpMnlZSldZVjl4WUdjWW56N1VZeEI2V1RHVFBrbUd1N2I4QSZ1PWh0dHBzJTNhJTJmJTJm
bG9yZSUyZWtlcm5lbCUyZW9yZyUyZnIlMmYyMDI0MDEwODA0MTkxMyUyZTcwNzgtMS1jaHJpcyUy
ZXBhY2toYW0lNDBhbGxpZWR0ZWxlc2lzJTJlY28lMmVueg0KPj4gU2lnbmVkLW9mZi1ieTogS3J6
eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPj4NCj4+
IC0tLQ0KPj4NCj4+IElmIHByZXZpb3VzIHBhdGNoZXMgYXJlIGZpbmUsIHRoZW4gdGhpcyBjb21t
aXQgaXMgaW5kZXBlbmRlbnQgYW5kIGNvdWxkDQo+PiBiZSB0YWtlbiB2aWEgSTJDLg0KPj4NCj4+
IENjOiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+
PiBDYzogQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4NCj4+IENjOiBTZWFuIEFu
ZGVyc29uIDxzZWFuLmFuZGVyc29uQHNlY28uY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvaTJj
L211eGVzL2kyYy1tdXgtcGNhOTU0eC5jIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0eC5j
IGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMNCj4+IGluZGV4IDIyMTkwNjIx
MDRmYi4uMTcwMmU4ZDQ5YjkxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJj
LW11eC1wY2E5NTR4LmMNCj4+ICsrKyBiL2RyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0
eC5jDQo+PiBAQCAtNDksNiArNDksNyBAQA0KPj4gICAjaW5jbHVkZSA8bGludXgvcG0uaD4NCj4+
ICAgI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+DQo+PiAgICNpbmNsdWRlIDxsaW51eC9yZWd1
bGF0b3IvY29uc3VtZXIuaD4NCj4+ICsjaW5jbHVkZSA8bGludXgvcmVzZXQuaD4NCj4+ICAgI2lu
Y2x1ZGUgPGxpbnV4L3NsYWIuaD4NCj4+ICAgI2luY2x1ZGUgPGxpbnV4L3NwaW5sb2NrLmg+DQo+
PiAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9tdXgvbXV4Lmg+DQo+PiBAQCAtMTAyLDYgKzEwMyw5
IEBAIHN0cnVjdCBwY2E5NTR4IHsNCj4+ICAgCXVuc2lnbmVkIGludCBpcnFfbWFzazsNCj4+ICAg
CXJhd19zcGlubG9ja190IGxvY2s7DQo+PiAgIAlzdHJ1Y3QgcmVndWxhdG9yICpzdXBwbHk7DQo+
PiArDQo+PiArCXN0cnVjdCBncGlvX2Rlc2MgKnJlc2V0X2dwaW87DQo+PiArCXN0cnVjdCByZXNl
dF9jb250cm9sICpyZXNldF9jb250Ow0KPj4gICB9Ow0KPj4gICANCj4+ICAgLyogUHJvdmlkZSBz
cGVjcyBmb3IgdGhlIE1BWDczNXgsIFBDQTk1NHggYW5kIFBDQTk4NHggdHlwZXMgd2Uga25vdyBh
Ym91dCAqLw0KPj4gQEAgLTQ3Nyw2ICs0ODEsMzUgQEAgc3RhdGljIGludCBwY2E5NTR4X2luaXQo
c3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwgc3RydWN0IHBjYTk1NHggKmRhdGEpDQo+PiAgIAly
ZXR1cm4gcmV0Ow0KPj4gICB9DQo+PiAgIA0KPj4gK3N0YXRpYyBpbnQgcGNhOTU0eF9nZXRfcmVz
ZXQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgcGNhOTU0eCAqZGF0YSkNCj4+ICt7DQo+PiAr
CWRhdGEtPnJlc2V0X2NvbnQgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX3NoYXJl
ZChkZXYsIE5VTEwpOw0KPj4gKwlpZiAoSVNfRVJSKGRhdGEtPnJlc2V0X2NvbnQpKQ0KPj4gKwkJ
cmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGRhdGEtPnJlc2V0X2NvbnQpLA0KPj4g
KwkJCQkgICAgICJGYWlsZWQgdG8gZ2V0IHJlc2V0XG4iKTsNCj4+ICsJZWxzZSBpZiAoZGF0YS0+
cmVzZXRfY29udCkNCj4+ICsJCXJldHVybiAwOw0KPj4gKw0KPj4gKwkvKg0KPj4gKwkgKiBmYWxs
YmFjayB0byBsZWdhY3kgcmVzZXQtZ3Bpb3MNCj4+ICsJICovDQo+IGRldm1fcmVzZXRfY29udHJv
bF9nZXRfb3B0aW9uYWxfc2hhcmVkKCkgd29uJ3QgcmV0dXJuIE5VTEwgaWYgdGhlDQo+ICJyZXNl
dC1ncGlvcyIgcHJvcGVydHkgaXMgZm91bmQgaW4gdGhlIGRldmljZSB0cmVlLCBzbyB0aGUgR1BJ
Tw0KPiBmYWxsYmFjayBpcyBkZWFkIGNvZGUuDQoNCkhtbSwgSSB3YXMgYXR0ZW1wdGluZyB0byBo
YW5kbGUgdGhlIGNhc2Ugd2hlcmUgQ09ORklHX1JFU0VUX0dQSU8gd2Fzbid0IA0Kc2V0IG9yIHRo
ZSByZXNldCBjb3JlIHdhc24ndCBlbmFibGVkLiBJdCBkb2Vzbid0IGFwcGVhciB0aGF0IHRoZSBs
YXR0ZXIgDQppcyBldmVuIHBvc3NpYmxlIHNvIG5vIG5lZWQgdG8gd29ycnkgYWJvdXQgdGhhdC4g
Rm9yIHRoZSBmb3JtZXIgaXQgbG9va3MgDQpsaWtlIHdlJ2QgZ2V0IC1FUFJPQkVfREVGRVIuIEkg
Y291bGQgY2hhbmdlIHRvIGNoZWNrIGZvciB0aGF0IG9yIGp1c3QgDQpyZW1vdmUgdGhlIEdQSU8g
ZmFsbGJhY2sgZW50aXJlbHkuIEFueSBwcmVmZXJlbmNlPw0KDQo+DQo+PiArCWRhdGEtPnJlc2V0
X2dwaW8gPSBkZXZtX2dwaW9kX2dldF9vcHRpb25hbChkZXYsICJyZXNldCIsIEdQSU9EX09VVF9I
SUdIKTsNCj4+ICsJaWYgKElTX0VSUihkYXRhLT5yZXNldF9ncGlvKSkgew0KPj4gKwkJcmV0dXJu
IGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGRhdGEtPnJlc2V0X2dwaW8pLA0KPj4gKwkJCQkg
ICAgICJGYWlsZWQgdG8gZ2V0IHJlc2V0IGdwaW8iKTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlyZXR1
cm4gMDsNCj4+ICt9DQo+PiArDQo+IHJlZ2FyZHMNCj4gUGhpbGlwcA==

