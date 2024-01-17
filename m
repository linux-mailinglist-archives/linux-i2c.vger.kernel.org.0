Return-Path: <linux-i2c+bounces-1360-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1118B830D87
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 20:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 770681F25F3F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 19:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5B924A18;
	Wed, 17 Jan 2024 19:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ef9bnGvR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0534822F0D
	for <linux-i2c@vger.kernel.org>; Wed, 17 Jan 2024 19:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705521408; cv=none; b=DG5M3m6u4QV7nnf7N6BbKkix/Ik+anjnbf0EsmQ5o/ct6QYqd5c8EQS3iYUpfo36BRDLK7FPG1rphsqGr+wJvfZhu2rJOZIkLmqfVnF/43Jz25VGRxE+zHBOEeQU0hLFahUm87Ldv+11B6frF/ZHdHEgBLx9bhHRDX2lkZ+bx2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705521408; c=relaxed/simple;
	bh=UnsoBdnewPOL7DDxcUet3o5sW68t4dgCvhX11poPbWQ=;
	h=Received:DKIM-Signature:Received:Received:Received:Received:From:
	 To:CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
	 In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
	 X-MS-TNEF-Correlator:x-originating-ip:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-SEG-SpamProfiler-Analysis:
	 X-SEG-SpamProfiler-Score; b=Tv6PdmlBrps+bhHdtOrn/XGaDTSea/QG+wW0JbrGMfAES4ZA4czlQjHZjOlauvIkzVS9aHLHEciC+YrZy+2774ndyMWUp31vmkMcNTJsYIDYDNs2T8lmPU5IFxexsz5prEvhf68cqeGLtTX4tGLo2Wffwtzei4vv6Hg2BvmUIx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ef9bnGvR; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id BBB132C04E6;
	Thu, 18 Jan 2024 08:56:36 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1705521396;
	bh=UnsoBdnewPOL7DDxcUet3o5sW68t4dgCvhX11poPbWQ=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ef9bnGvRZCxcrYnEP1osWxaxpbjkxMrHjlaXz8raZD8qdt3NCMflKhk91SSN+2Hpf
	 tBk0vO44r038CodJCMTETl+9GmfKdDsDNByxWamHn4yu80LsA7SwNVdkFnzYVNR3Pb
	 qO/aoP32vmq9yHQ1OYh58L6jaELwrkLQYh2+ZUk9rSY4FrTtrS/rP3XfaNiXzvbsBh
	 oxe6aAH01HYHMOMU58bJaCATR401QA0oon/FZWIYBbx46TMguZJcYlpZZEA/lPv9gL
	 cI9uMZx+/uMsiAcJYYgiONmhsvTgOfmdT42xGVLGRGRwuiEPqb8ipLUEGAgDIUy0MN
	 f0wFRio3G2D5Q==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65a830f40001>; Thu, 18 Jan 2024 08:56:36 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.40; Thu, 18 Jan 2024 08:56:36 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Thu, 18 Jan 2024 08:56:36 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Thu, 18 Jan 2024 08:56:36 +1300
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
Thread-Index: AQHaRXWBLMixCZ8WK0+mNOuBScg1h7DbubEAgABOIQCAAQBzAIAAkW6A
Date: Wed, 17 Jan 2024 19:56:36 +0000
Message-ID: <273168dc-2cb8-4d00-b8d0-b68d4e766410@alliedtelesis.co.nz>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
 <20240112163608.528453-6-krzysztof.kozlowski@linaro.org>
 <800d202864c1730622a19998728c5a8b576d1931.camel@pengutronix.de>
 <4c6c5d07-ac53-4da9-93e0-1286ca5eb44b@alliedtelesis.co.nz>
 <568f2bcb1bea01c36f59650d5cc5a84612197f8b.camel@pengutronix.de>
In-Reply-To: <568f2bcb1bea01c36f59650d5cc5a84612197f8b.camel@pengutronix.de>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <95D05D6F344ED946A08E474726AD6AA3@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=LZFCFQXi c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=dEuoMetlWLkA:10 a=KKAkSRfTAAAA:8 a=62ntRvTiAAAA:8 a=VwQbUJbxAAAA:8 a=vE6nA0IPAAAA:8 a=8-3aiZTupm_KTbKaFEUA:9 a=QEXdDO2ut3YA:10 a=cvBusfyB2V15izCimMoJ:22 a=pToNdpNmrtiFLRE6bQ9Z:22 a=AjGcO6oz07-iQ99wixmX:22 a=_s8P6U4_B6QeRRtK5oEG:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAxOC8wMS8yNCAwMDoxNiwgUGhpbGlwcCBaYWJlbCB3cm90ZToNCj4gT24gRGksIDIwMjQt
MDEtMTYgYXQgMTk6NTggKzAwMDAsIENocmlzIFBhY2toYW0gd3JvdGU6DQo+PiBPbiAxNy8wMS8y
NCAwNDoxOCwgUGhpbGlwcCBaYWJlbCB3cm90ZToNCj4+PiBPbiBGciwgMjAyNC0wMS0xMiBhdCAx
NzozNiArMDEwMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4+Pj4gRnJvbTogQ2hyaXMg
UGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4+Pg0KPj4+PiBT
b21lIGhhcmR3YXJlIGRlc2lnbnMgd2l0aCBtdWx0aXBsZSBQQ0E5NTR4IGRldmljZXMgdXNlIGEg
cmVzZXQgR1BJTw0KPj4+PiBjb25uZWN0ZWQgdG8gYWxsIHRoZSBtdXhlcy4gU3VwcG9ydCB0aGlz
IGNvbmZpZ3VyYXRpb24gYnkgbWFraW5nIHVzZSBvZg0KPj4+PiB0aGUgcmVzZXQgY29udHJvbGxl
ciBmcmFtZXdvcmsgd2hpY2ggY2FuIGRlYWwgd2l0aCB0aGUgc2hhcmVkIHJlc2V0DQo+Pj4+IEdQ
SU9zLiBGYWxsIGJhY2sgdG8gdGhlIG9sZCBHUElPIGRlc2NyaXB0b3IgbWV0aG9kIGlmIHRoZSBy
ZXNldA0KPj4+PiBjb250cm9sbGVyIGZyYW1ld29yayBpcyBub3QgZW5hYmxlZC4NCj4+Pj4NCj4+
Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxl
c2lzLmNvLm56Pg0KPj4+PiBBY2tlZC1ieTogUGV0ZXIgUm9zaW4gPHBlZGFAYXhlbnRpYS5zZT4N
Cj4+Pj4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dz
a2lAbGluYXJvLm9yZz4NCj4+Pj4gTGluazogaHR0cHM6Ly9zY2FubWFpbC50cnVzdHdhdmUuY29t
Lz9jPTIwOTg4JmQ9X2JhbjVXM3hSektTaW1KOWlqVEo3NHAxMG90ZnE4Wk9OZmpWbkJyNkZ3JnU9
aHR0cHMlM2ElMmYlMmZsb3JlJTJla2VybmVsJTJlb3JnJTJmciUyZjIwMjQwMTA4MDQxOTEzJTJl
NzA3OC0xLWNocmlzJTJlcGFja2hhbSU0MGFsbGllZHRlbGVzaXMlMmVjbyUyZW56DQo+Pj4+IFNp
Z25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGlu
YXJvLm9yZz4NCj4+Pj4NCj4+Pj4gLS0tDQo+Pj4+DQo+Pj4+IElmIHByZXZpb3VzIHBhdGNoZXMg
YXJlIGZpbmUsIHRoZW4gdGhpcyBjb21taXQgaXMgaW5kZXBlbmRlbnQgYW5kIGNvdWxkDQo+Pj4+
IGJlIHRha2VuIHZpYSBJMkMuDQo+Pj4+DQo+Pj4+IENjOiBDaHJpcyBQYWNraGFtIDxjaHJpcy5w
YWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+Pj4+IENjOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxicmdsQGJnZGV2LnBsPg0KPj4+PiBDYzogU2VhbiBBbmRlcnNvbiA8c2Vhbi5hbmRlcnNvbkBz
ZWNvLmNvbT4NCj4+Pj4gLS0tDQo+Pj4+ICAgIGRyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNh
OTU0eC5jIHwgNDYgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0NCj4+Pj4gICAgMSBmaWxl
IGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYyBiL2RyaXZlcnMv
aTJjL211eGVzL2kyYy1tdXgtcGNhOTU0eC5jDQo+Pj4+IGluZGV4IDIyMTkwNjIxMDRmYi4uMTcw
MmU4ZDQ5YjkxIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBj
YTk1NHguYw0KPj4+PiArKysgYi9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYw0K
Pj4+PiBAQCAtNDksNiArNDksNyBAQA0KPj4+PiAgICAjaW5jbHVkZSA8bGludXgvcG0uaD4NCj4+
Pj4gICAgI2luY2x1ZGUgPGxpbnV4L3Byb3BlcnR5Lmg+DQo+Pj4+ICAgICNpbmNsdWRlIDxsaW51
eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4NCj4+Pj4gKyNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0K
Pj4+PiAgICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPg0KPj4+PiAgICAjaW5jbHVkZSA8bGludXgv
c3BpbmxvY2suaD4NCj4+Pj4gICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL211eC9tdXguaD4NCj4+
Pj4gQEAgLTEwMiw2ICsxMDMsOSBAQCBzdHJ1Y3QgcGNhOTU0eCB7DQo+Pj4+ICAgIAl1bnNpZ25l
ZCBpbnQgaXJxX21hc2s7DQo+Pj4+ICAgIAlyYXdfc3BpbmxvY2tfdCBsb2NrOw0KPj4+PiAgICAJ
c3RydWN0IHJlZ3VsYXRvciAqc3VwcGx5Ow0KPj4+PiArDQo+Pj4+ICsJc3RydWN0IGdwaW9fZGVz
YyAqcmVzZXRfZ3BpbzsNCj4+Pj4gKwlzdHJ1Y3QgcmVzZXRfY29udHJvbCAqcmVzZXRfY29udDsN
Cj4+Pj4gICAgfTsNCj4+Pj4gICAgDQo+Pj4+ICAgIC8qIFByb3ZpZGUgc3BlY3MgZm9yIHRoZSBN
QVg3MzV4LCBQQ0E5NTR4IGFuZCBQQ0E5ODR4IHR5cGVzIHdlIGtub3cgYWJvdXQgKi8NCj4+Pj4g
QEAgLTQ3Nyw2ICs0ODEsMzUgQEAgc3RhdGljIGludCBwY2E5NTR4X2luaXQoc3RydWN0IGkyY19j
bGllbnQgKmNsaWVudCwgc3RydWN0IHBjYTk1NHggKmRhdGEpDQo+Pj4+ICAgIAlyZXR1cm4gcmV0
Ow0KPj4+PiAgICB9DQo+Pj4+ICAgIA0KPj4+PiArc3RhdGljIGludCBwY2E5NTR4X2dldF9yZXNl
dChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBwY2E5NTR4ICpkYXRhKQ0KPj4+PiArew0KPj4+
PiArCWRhdGEtPnJlc2V0X2NvbnQgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X29wdGlvbmFsX3No
YXJlZChkZXYsIE5VTEwpOw0KPj4+PiArCWlmIChJU19FUlIoZGF0YS0+cmVzZXRfY29udCkpDQo+
Pj4+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihkYXRhLT5yZXNldF9jb250
KSwNCj4+Pj4gKwkJCQkgICAgICJGYWlsZWQgdG8gZ2V0IHJlc2V0XG4iKTsNCj4+Pj4gKwllbHNl
IGlmIChkYXRhLT5yZXNldF9jb250KQ0KPj4+PiArCQlyZXR1cm4gMDsNCj4+Pj4gKw0KPj4+PiAr
CS8qDQo+Pj4+ICsJICogZmFsbGJhY2sgdG8gbGVnYWN5IHJlc2V0LWdwaW9zDQo+Pj4+ICsJICov
DQo+Pj4gZGV2bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9zaGFyZWQoKSB3b24ndCByZXR1
cm4gTlVMTCBpZiB0aGUNCj4+PiAicmVzZXQtZ3Bpb3MiIHByb3BlcnR5IGlzIGZvdW5kIGluIHRo
ZSBkZXZpY2UgdHJlZSwgc28gdGhlIEdQSU8NCj4+PiBmYWxsYmFjayBpcyBkZWFkIGNvZGUuDQo+
PiBIbW0sIEkgd2FzIGF0dGVtcHRpbmcgdG8gaGFuZGxlIHRoZSBjYXNlIHdoZXJlIENPTkZJR19S
RVNFVF9HUElPIHdhc24ndA0KPj4gc2V0IFsuLi5dDQo+PiBbLi4uXSBpdCBsb29rcyBsaWtlIHdl
J2QgZ2V0IC1FUFJPQkVfREVGRVIuIEkgY291bGQgY2hhbmdlIHRvIGNoZWNrDQo+PiBmb3IgdGhh
dCBvciBqdXN0IHJlbW92ZSB0aGUgR1BJTyBmYWxsYmFjayBlbnRpcmVseS4gQW55IHByZWZlcmVu
Y2U/DQo+IEkgaGFkbid0IGNvbnNpZGVyZWQgdGhpcy4NCj4NCj4gSWYgQ09ORklHX1JFU0VUX0dQ
SU89biwgZGV2bV9yZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9zaGFyZWQoKQ0KPiBwcm9iYWJs
eSBzaG91bGRuJ3QgcmV0dXJuIC1FUFJPQkVfREVGRVIuIElmIHdlIGNoYW5nZSB0aGF0LCB0aGUg
R1BJTw0KPiBmYWxsYmFjayBoZXJlIGNhbiBzdGF5IGFzIGlzLg0KPg0KPiBUaGUgYWx0ZXJuYXRp
dmUgd291bGQgYmUgdG8gZHJvcCB0aGUgZmFsbGJhY2sgYW5kIHNlbGVjdCBSRVNFVF9HUElPLg0K
PiBVc2luZyAtRVBST0JFX0RFRkVSIGZvciBmYWxsYmFjayBkZXRlY3Rpb24gaXMgbm8gZ29vZCwg
YXMgdGhlcmUgY291bGQNCj4gYmUgYSB2YWxpZCBwcm9iZSBkZWZlcnJhbCBpZiByZXNldC1ncGlv
IGlzIGNvbXBpbGVkIGFzIGEgbW9kdWxlIHRoYXQNCj4gd2lsbCBiZSBsb2FkZWQgbGF0ZXIuDQpJ
IGRpZCBjb25zaWRlciBhZGRpbmcgYHNlbGVjdCBSRVNFVF9HUElPYCAob3IgbWF5YmUganVzdCBg
aW1wbHkgDQpSRVNFVF9HUElPYCkgaW5pdGlhbGx5IGJ1dCBkZWNpZGVkIG9uIHRoZSBmYWxsYmFj
ayBhcyBhIHdheSBvZiBhdm9pZGluZyANCnN1cnByaXNlcyBmb3IgZXhpc3RpbmcgdXNlcnMuIEkn
bGwgc2VlIGlmIGFueW9uZSBlbHNlIGhhcyBhIGRpZmZlcmVudCANCnN1Z2dlc3Rpb24gYnV0IGFz
c3VtaW5nIG5vdGhpbmcgZWxzZSBjaGFuZ2VzIEknbGwgd29yayB3aXRoIEtyenlzdG9mIHRvIA0K
Z2V0IGFuIHVwZGF0ZWQgcGF0Y2ggZm9yIHRoaXMgc2VyaWVzLg0K

