Return-Path: <linux-i2c+bounces-885-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBBC8190B3
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 20:29:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CC782882F9
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 19:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7942938FBB;
	Tue, 19 Dec 2023 19:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="zuVlHzPR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C2238F94
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 19:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3E2882C04C7;
	Wed, 20 Dec 2023 08:28:44 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1703014124;
	bh=tvMk96Xvb4gcD09CjBZE7bcSGGH4HaxjXg3tNU39+ek=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=zuVlHzPRfBziFqomB77rWV/gYvYy72KlrMLD33qp5DmqFHcYBVZUcGxYCCwl8uCj9
	 dWNJz69N8TZ3L92REQsJJ67q5c3zI4kIF6NmixokchsFXSuaPRSF/ezs6tMcsnKb7f
	 vr54b7PjGdrYPN+MUsW80H1CE0McweJoFyJSeaj3SS4ywzJK8JqY0b2py0cDJfgqTd
	 ZKIiwFD7bKwn1mF1kXHi7N6jaF9zGOzYLIdNAgIFv4Ary+BzebUfL5i56UjfjvNX7c
	 RpjBq4gN8TCyx2AGC70bIb+oXGY4NMvCf7w8YQdBYiwtlCr24aULJ4SdGmMs9zhDxN
	 xwdf5S99usdyQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B6581eeec0001>; Wed, 20 Dec 2023 08:28:44 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 20 Dec 2023 08:28:43 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Wed, 20 Dec 2023 08:28:43 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "wsa@kernel.org" <wsa@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "gregory.clement@bootlin.com"
	<gregory.clement@bootlin.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: add bus-reset-gpios property
Thread-Topic: [PATCH v6 1/2] dt-bindings: i2c: add bus-reset-gpios property
Thread-Index: AQHaF3ftbmVMkvsnVUGkUfJZcnXixrB7DOKAgAAGpwCANR4BgIAAKL+A
Date: Tue, 19 Dec 2023 19:28:43 +0000
Message-ID: <601d07b5-264d-4322-b92e-63d58b3d69fa@alliedtelesis.co.nz>
References: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
 <20231115035753.925534-2-chris.packham@alliedtelesis.co.nz>
 <f24b9b2d-aeb1-47f7-bf21-4383fdcf94aa@linaro.org>
 <5a52b0c9-8858-4f55-8dd7-9269c29c10a7@alliedtelesis.co.nz>
 <ZYHMvZ3plIQ0zXWa@shikoro>
In-Reply-To: <ZYHMvZ3plIQ0zXWa@shikoro>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <C91AAF41735B5546A22CFC7736B51905@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=CYB2G4jl c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=e2cXIFwxEfEA:10 a=VwQbUJbxAAAA:8 a=1yuvT08Q3_qmqAvlgogA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0

DQpPbiAyMC8xMi8yMyAwNjowMiwgd3NhQGtlcm5lbC5vcmcgd3JvdGU6DQo+Pj4gUHV0dGluZyBp
dCBpbnRvIHRoZSBjb250cm9sbGVyIGJpbmRpbmdzIGxvb2tzIGxpa2Ugc29sdmluZyBPUyBpc3N1
ZSB3aXRoDQo+Pj4gaW5jb3JyZWN0IGhhcmR3YXJlIGRlc2NyaXB0aW9uLg0KPj4gWWVzIHRoYXQn
cyBlbnRpcmVseSB3aGF0cyBoYXBwZW5pbmcgaGVyZS4NCj4gU28sIHRoaXMgc2VyaWVzIGNhbiBi
ZSBkcm9wcGVkPw0KPg0KSSBwZXJzb25hbGx5IHdvdWxkIGxpa2UgdG8gc2VlIGl0IGFjY2VwdGVk
IGJ1dCBpdCBzZWVtcyB0aGVyZSBhcmUgDQpvYmplY3Rpb25zIHRvIHRoaXMgYXBwcm9hY2guIEkn
dmUgeWV0IHRvIGNvbWUgdXAgd2l0aCBhbnl0aGluZyBiZXR0ZXIgdG8gDQpvZmZlciBhcyBhbiBh
bHRlcm5hdGl2ZS4=

