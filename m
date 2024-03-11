Return-Path: <linux-i2c+bounces-2330-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCFB878949
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 21:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1DD0281745
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Mar 2024 20:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D248156745;
	Mon, 11 Mar 2024 20:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="ta82aQfn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0A55467F
	for <linux-i2c@vger.kernel.org>; Mon, 11 Mar 2024 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710187678; cv=none; b=GakscFODdPT1sP7aBGlbtv6KpvWdaRlUm3PiMJKIY1PO5aOjLJVTLtfj+EerzW37Ud6QRWEYP3SXsNCQ8XHAxWQzo3udTOZXv01ACUVySZ2HY94s1GFyVs/aaQkUKle3RbB71crOQJ+Wk1JrilRdNWeisGdb1nVPd++2Sr1crBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710187678; c=relaxed/simple;
	bh=8fQwCuN/+qRxC7V+5kGbCzfB1rEYODqY/eXLigY+gc0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sO/HaYXqiE7VhMRoBaYuW258XtHutDTp0Y4l5LcFNNXJc9sGPoRQvkiK7jDtlsFeB6uNzZBLO9rNKYiGGIEGNbQ4epvQUjO7Ocb0zcMPH4aQIX29zYRoMcoDQWbhBz1Q3ix/lvAwxlLkwZ0H65nSCSudqYfEBqcLfDOfIRLd2qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=ta82aQfn; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4F7B42C0480;
	Tue, 12 Mar 2024 09:07:53 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1710187673;
	bh=8fQwCuN/+qRxC7V+5kGbCzfB1rEYODqY/eXLigY+gc0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ta82aQfnIIJAIjLYqLygkGvNqbMyKMF14W0UqCZyQBuo7F8LlFUMYukMQ3RjO4eWl
	 ryLcGmZa6bhIW89bb33HrhdCeLQRMNfgi6ZVLE8nX24GX77zRNikkZY+IpvZiZZIS1
	 CxEh83+ycWoT8qkU+9DxgNKfnNjhExcV9qukYsO6INAUJzw4baMCxdbQLgLqZcwQYk
	 LK7wseQk/QnyKrlVuQjxWLW2WtH5kvdVIACuqWeKnJ3PQKdWqI1Xhsb7emWTb5gL+l
	 ujIakJiV8h60RENOD9ADdbUmhqkAl1/uPIUDQs3mTNsRJJFmO1pvmH4n6WmyNhxmn7
	 AG1+Wd7pk88FA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65ef64990001>; Tue, 12 Mar 2024 09:07:53 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.40; Tue, 12 Mar 2024 09:07:53 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Tue, 12 Mar 2024 09:07:52 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Tue, 12 Mar 2024 09:07:52 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "peda@axentia.se"
	<peda@axentia.se>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: muxes: pca954x: Allow sharing reset GPIO
Thread-Topic: [PATCH] i2c: muxes: pca954x: Allow sharing reset GPIO
Thread-Index: AQHac2qWYbaNBCqYJEeV389q3R11L7ExORAAgADlxQA=
Date: Mon, 11 Mar 2024 20:07:52 +0000
Message-ID: <d1dd05d6-46cc-4288-9aa3-91e9159ae750@alliedtelesis.co.nz>
References: <20240311041412.3858710-1-chris.packham@alliedtelesis.co.nz>
 <6785b149-a2bc-44ea-aec3-8477222d338b@linaro.org>
In-Reply-To: <6785b149-a2bc-44ea-aec3-8477222d338b@linaro.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <E0299C5895727D40BDFD8944F0B1AB31@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65ef6499 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=K6JAEmCyrfEA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=P-IC7800AAAA:8 a=55QPhESq7RRwqwG9g2QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22 a=d3PnA9EDa4IxuAV0gXij:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAxMS8wMy8yNCAxOToyNSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMTEv
MDMvMjAyNCAwNToxNCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IFNvbWUgaGFyZHdhcmUgZGVz
aWducyB3aXRoIG11bHRpcGxlIFBDQTk1NHggZGV2aWNlcyB1c2UgYSByZXNldCBHUElPDQo+PiBj
b25uZWN0ZWQgdG8gYWxsIHRoZSBtdXhlcy4gU3VwcG9ydCB0aGlzIGNvbmZpZ3VyYXRpb24gYnkg
bWFraW5nIHVzZSBvZg0KPj4gdGhlIHJlc2V0IGNvbnRyb2xsZXIgZnJhbWV3b3JrIHdoaWNoIGNh
biBkZWFsIHdpdGggdGhlIHNoYXJlZCByZXNldA0KPj4gR1BJT3MuIEZhbGwgYmFjayB0byB0aGUg
b2xkIEdQSU8gZGVzY3JpcHRvciBtZXRob2QgaWYgdGhlIHJlc2V0DQo+PiBjb250cm9sbGVyIGZy
YW1ld29yayBpcyBub3QgZW5hYmxlZC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNr
aGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+PiAtLS0NCj4+DQo+PiBO
b3RlczoNCj4+ICAgICAgVGhpcyBwYXRjaCBnb2VzIG9uIHRvcCBvZiBLcnp5c3p0b2YncyBzZXJp
ZXMgYWRkaW5nIHRoZSBHUElPIGJhc2VkIHJlc2V0DQo+PiAgICAgIGNvbnRyb2xsZXJbMV0gd2hp
Y2ggd2lsbCBiZSBpbiBsaW51eC02LjkuIFdpdGggdGhpcyBJJ20gYWJsZSB0bw0KPj4gICAgICBj
b3JyZWN0bHkgZGVzY3JpYmUgbXkgaGFyZHdhcmUgcGxhdGZvcm0gaW4gdGhlIERUUyBhbmQgaGF2
ZSB0aGUgcmVzZXRzDQo+PiAgICAgIGFwcHJvcHJpYXRlbHkgY29udHJvbGxlZC4NCj4+ICAgICAg
DQo+PiAgICAgIFsxXSAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDEyOTExNTIx
Ni45NjQ3OS0xLWtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZy8NCj4+DQo+IFdoZXJlIGlz
IHRoZSBjaGFuZ2Vsb2c/IEl0IHdhcyB2MyBvciB2NCBhbHJlYWR5PyBXaGVyZSBhcmUgdGhlIHRh
Z3M/DQoNClNpbmNlIHRoaXMgd2FzIHNwdW4gb2ZmIHRoZSBvcmlnaW5hbCBzZXJpZXMgSSBmaWd1
cmVkIGl0IHdvdWxkIGJlIGJlc3QgDQp0byB0cmVhdCBpdCBhcyB2MSBvZiBhIG5ldyBzZXJpZXMu
IEl0J3MgdW5jaGFuZ2VkIHNpbmNlIA0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDI0
MDExMjE2MzYwOC41Mjg0NTMtNi1rcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmcvIA0Kc28g
dGVjaG5pY2FsbHkgdGhpcyBpcyAnW1BBVENIIHJlc2VuZCB2M10nLiBJIGRpZCByZWJhc2UgaXQg
b24gdG9wIG9mIA0KbGludXgtbmV4dCBqdXN0IHRvIG1ha2Ugc3VyZSBpdCBzdGlsbCB3b3JrZWQu
DQoNCj4gSXQgbG9va3MgbGlrZSB5b3UgcmVjZWl2ZWQgYSB0YWcgYW5kIGZvcmdvdCB0byBhZGQg
aXQuDQo+DQo+IElmIHlvdSBkbyBub3Qga25vdyB0aGUgcHJvY2VzcywgaGVyZSBpcyBhIHNob3J0
IGV4cGxhbmF0aW9uOg0KPiBQbGVhc2UgYWRkIEFja2VkLWJ5L1Jldmlld2VkLWJ5L1Rlc3RlZC1i
eSB0YWdzIHdoZW4gcG9zdGluZyBuZXcNCj4gdmVyc2lvbnMsIHVuZGVyIG9yIGFib3ZlIHlvdXIg
U2lnbmVkLW9mZi1ieSB0YWcuIFRhZyBpcyAicmVjZWl2ZWQiLCB3aGVuDQo+IHByb3ZpZGVkIGlu
IGEgbWVzc2FnZSByZXBsaWVkIHRvIHlvdSBvbiB0aGUgbWFpbGluZyBsaXN0LiBUb29scyBsaWtl
IGI0DQo+IGNhbiBoZWxwIGhlcmUuIEhvd2V2ZXIsIHRoZXJlJ3Mgbm8gbmVlZCB0byByZXBvc3Qg
cGF0Y2hlcyAqb25seSogdG8gYWRkDQo+IHRoZSB0YWdzLiBUaGUgdXBzdHJlYW0gbWFpbnRhaW5l
ciB3aWxsIGRvIHRoYXQgZm9yIHRhZ3MgcmVjZWl2ZWQgb24gdGhlDQo+IHZlcnNpb24gdGhleSBh
cHBseS4NCj4NCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNS1yYzMvc291
cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0I0w1NzcNCj4N
Cj4gSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUgd2h5IGFu
ZCB3aGF0IGNoYW5nZWQuDQpPb3BzIG15IGJhZC4gSSB0aGluayBiZWNhdXNlIGJ5IHRoZSB0aW1l
IHYzIHJvbGxlZCByb3VuZCBpdCB3YXMgcGFydCBvZiANCnlvdXIgc2VyaWVzIEkgbmV2ZXIgYWRk
ZWQgdGhlIEFjayBmcm9tIFBldGVyIG9yIHlvdXIgUi1ieSB0byBteSBsb2NhbCANCmNvbW1pdCB3
aGljaCBpcyB3aGF0IEkgc2VudCBvdXQuIEkndmUgYWRkZWQgaXQgbm93IGlmIEkgc2VuZCBhIHY0
IChvciBpcyANCml0IHYyIG9mIHRoaXM/KSBJJ2xsIGluY2x1ZGUgdGhlIHRhZ3MuDQo=

