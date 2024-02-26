Return-Path: <linux-i2c+bounces-2011-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5DF8681DA
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 21:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DEF2F1C235EF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 20:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F8B7130AC2;
	Mon, 26 Feb 2024 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="HEKEP5zn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916F012F39F
	for <linux-i2c@vger.kernel.org>; Mon, 26 Feb 2024 20:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708978834; cv=none; b=nAyWMFVioV1EnGszkGPnVZPIBg6sVfl3BKqV5oHvZMDrWsNbRfFUFb4cFvGdg338jXEVeiX2CEmG1iRNrLUW30nBs1hxdkC/6xit0r/UZ0L22JkqCaePqYm7H3RJS41zNkk+K0GIbJ7ue5Y1PFkw9voSTGFM67u4yasygf6u2gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708978834; c=relaxed/simple;
	bh=eeyyePzAcRyfPyMQ0qx2GLi/jnbTg2jTyBTddGvFstc=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yd1ufR8F3c6RzeD5rmYerXpBGffvSl5T4nR5f9jrRMyHnLiaK4AH/Ug/2973OFQqGkPkb4dw6HQeMAInRz4IHs5paZPVIrs45Nkek/ILkLmQf1+/GYowDMzI36GuPULAz9N0ukgebeXtYWcWgsGRRYZPN+28bhWtLtNs2z23Xy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=HEKEP5zn; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5003E2C0546;
	Tue, 27 Feb 2024 09:20:30 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1708978830;
	bh=eeyyePzAcRyfPyMQ0qx2GLi/jnbTg2jTyBTddGvFstc=;
	h=From:To:Subject:Date:References:In-Reply-To:From;
	b=HEKEP5zndgnrMUCE1YR3MSiSjs37fZd+W8dkubZM88yRIQ/yiSCQXKFjQ4THZ24Ok
	 s2jkmJ3KZq9kwJv4P6snAN3KAsTE/7Tv5nOiLZ2rGZ70Qj3PmjyyJnLy+TLmQZTyJT
	 RPGC7EbKVAIUvaD4WI+930xV+APpggFpS52p8cjlXwx3tO9Nyzg3H3TSaVZs51/2ul
	 Lbgm930tHurqY8x8GE1QFsnwiBPsAP6YMG+GyLXS4NcETU9Z/eMqD+H28QRk82dB/R
	 bleG9PzZ0Oie0FQGKNdiZidlFT82vwa5lQeXWgboQQ7QNb1/7vswNvQuKHe20H+1GD
	 +ke2ghuE7OK7g==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B65dcf28e0001>; Tue, 27 Feb 2024 09:20:30 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.40; Tue, 27 Feb 2024 09:20:30 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Tue, 27 Feb 2024 09:20:29 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.040; Tue, 27 Feb 2024 09:20:29 +1300
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Wolfram Sang <wsa@kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "devicetree-spec@vger.kernel.org"
	<devicetree-spec@vger.kernel.org>, Andi Shyti <andi.shyti@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
Subject: Re: dtschema: i2c: messy situation about timeouts
Thread-Topic: dtschema: i2c: messy situation about timeouts
Thread-Index: AQHaaJvCKHBBBoL76kSB/VWxr+DQa7EcN1WA
Date: Mon, 26 Feb 2024 20:20:29 +0000
Message-ID: <ccb58633-5981-4b91-a6ca-a57ea1ce5e40@alliedtelesis.co.nz>
References: <ZdxjGwvGXlDGkYs0@shikoro>
In-Reply-To: <ZdxjGwvGXlDGkYs0@shikoro>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBB2453B9C729143AB91DB57748C88BA@atlnz.lc>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BKkQr0QG c=1 sm=1 tr=0 ts=65dcf28e a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=k7vzHIieQBIA:10 a=vU4aOG_U7roDcmFACGEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0

DQpPbiAyNi8wMi8yNCAyMzowOCwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPiBIZXkgZ3V5cywNCj4N
Cj4gd2UgaGF2ZSBxdWl0ZSBhIG1lc3N5IHNpdHVhdGlvbiByZWdhcmRpbmcgSTJDIHRpbWVvdXRz
IGluIHRoZSBkdHNjaGVtYS4NCj4gUGFydGx5IGJlY2F1c2UgSSB3YXMgdG9vIGJ1c3kgdG8gcGF5
IGRldGFpbGVkIGF0dGVudGlvbiwgcGFydGx5IGJlY2F1c2UNCj4gcmV2aWV3aW5nIGR0c2NoZW1h
IGNoYW5nZXMgaGFwcGVuIG9uIEdpdGh1YiB3aGljaCBJIHRvdGFsbHkgbWlzc2VkLiBObw0KPiBj
b21wbGFpbmluZywgdGhvdWdoLCBoZXJlIGFyZSBteSBvYnNlcnZhdGlvbnMgYW5kIHN1Z2dlc3Rp
b25zIHRvIGdldCBpdA0KPiBzdHJhaWdodC4gQ29tbWVudHMgYXJlIG1vcmUgdGhhbiB3ZWxjb21l
Lg0KPg0KPiAtICJpMmMtdHJhbnNmZXItdGltZW91dC11cyINCj4NCj4gRGVzY3JpcHRpb24gc2F5
cyAiTnVtYmVyIG9mIG1pY3Jvc2Vjb25kcyB0byB3YWl0IGJlZm9yZSBjb25zaWRlcmluZyBhbg0K
PiBJMkMgdHJhbnNmZXIgaGFzIGZhaWxlZC4iDQo+DQo+IFRvIG1lLCB0aGlzIGJpbmRpbmcgaXMg
dmVyeSBkZXNjcmlwdGl2ZSBhbmQgbWFrZXMgc2Vuc2UuIFdlIHNob3VsZCBrZWVwDQo+IGl0LiBT
YWRseSwgaXQgaXMgdGhlIG5ld2VzdCBvbmUgYW5kIHdlIGFscmVhZHkgaGF2ZSBvdGhlcnMuDQo+
DQo+DQo+IC0gImkyYy1zY2wtaGFzLWNsay1sb3ctdGltZW91dCINCj4NCj4gQUZBSVUgdGhpcyBi
aW5kaW5nIHRlbGxzIHRoYXQgdGhlIGNvbnRyb2xsZXIgY2FuIGRvIGNsb2NrIHN0cmV0Y2hpbmcu
DQo+IEJ1dCB3aGF0IGZvcj8gSSBkb24ndCBzZWUgd2h5IHRoaXMgaXMgaW1wb3J0YW50IGZvciBj
bGllbnRzLiBJZg0KPiBhbnl0aGluZywgdGhlbiBpdCB3b3VsZCBiZSBpbnRlcmVzdGluZyBpZiB0
aGUgKmNsaWVudCogY2FuIGRvIGNsb2NrDQo+IHN0cmV0Y2hpbmcgYW5kIGlmIHRoZSBjb250cm9s
bGVyIGNhbiBhY3R1YWxseSBoYW5kbGUgdGhhdC4gQnV0IG5vIG5lZWQNCj4gdG8gZGVzY3JpYmUg
aXQgaW4gRFQsIHdlIGhhdmUgdGhpcyBhcyBhbiBhZGFwdGVyIHF1aXJrIGFscmVhZHkNCj4gJ0ky
Q19BUV9OT19DTEtfU1RSRVRDSCcuDQoNCkhtbSBJIGtub3cgb2YgYSBmZXcgYWRhcHRlcnMgdGhh
dCBzaG91bGQgcHJvYmFibHkgc2V0IA0KSTJDX0FRX05PX0NMS19TVFJFVENIIGJhc2VkIG9uIHNv
bWUgRXJyYXRhLiBQcm9iYWJseSBqdXN0IGEgDQpkb2N1bWVudGF0aW9uIGV4ZXJjaXNlLiBJdCB3
b3VsZCBiZSBuaWNlIHRvIHJlamVjdCBjbGllbnRzIHRoYXQgbmVlZCB0byANCmRvIGNsb2NrIHN0
cmV0Y2hpbmcgYnV0IG9mdGVuIGl0IGhhcHBlbnMgYXMgYSBzaWRlIGVmZmVjdCByYXRoZXIgdGhh
biANCmJlaW5nIGludGVudGlvbmFsIChJJ3ZlIHNlZW4gdGhpcyB3aXRoIGkyYyBjbGllbnRzIGlt
cGxlbWVudGVkIGluIA0KbWljcm9jb250cm9sbGVycykuDQoNCj4gICBUd28gY29udHJvbGxlcnMg
dXNlIGl0LCBidXQgbm8gY2xpZW50IGNoZWNrcw0KPiBmb3IgaXQgc28gZmFyLiBDb21pbmcgYmFj
ayB0byB0aGlzIGJpbmRpbmcsIGl0IGlzIGFsc28gdW51c2VkIGluIHRoZQ0KPiBrZXJuZWwuDQo+
DQo+IFN1Z2dlc3Rpb246IGxldCdzIHJlbW92ZSBpdA0KPg0KPg0KPiAtICJpMmMtc2NsLWNsay1s
b3ctdGltZW91dC11cyINCj4NCj4gVGhlIGRlc2NyaXB0aW9uIHNheXMgIk51bWJlciBvZiBtaWNy
b3NlY29uZHMgdGhlIGNsb2NrIGxpbmUgbmVlZHMgdG8gYmUNCj4gcHVsbGVkIGRvd24gaW4gb3Jk
ZXIgdG8gZm9yY2UgYSB3YWl0aW5nIHN0YXRlLiIgV2hhdCBkb2VzICJmb3JjaW5nIGENCj4gd2Fp
dGluZyBzdGF0ZSIgbWVhbiBoZXJlPyBJIGRvbid0IHVuZGVyc3RhbmQgdGhpcyBkZXNjcmlwdGlv
bi4NCj4NCj4gSXQgaXMgdXNlZCBpbiB0aGUgaTJjLW1wYyBkcml2ZXIuIFRoZSB1c2UgY2FzZSBp
cyBzaW1wbHkgdG8gcHV0IGl0IGludG8NCj4gdGhlICdzdHJ1Y3QgaTJjX2FkYXB0ZXIudGltZW91
dCcgbWVtYmVyLiBUaGF0IHRpbWVvdXQgaXMgdXNlZCB0bw0KPiBkZXRlcm1pbmUgaWYgYSB0cmFu
c2ZlciBmYWlsZWQuIFNvLCB0byBtZSwgImkyYy10cmFuc2Zlci10aW1lb3V0LXVzIg0KPiBtYWtl
cyBhIGxvdCBtb3JlIHNlbnNlIHRvIHVzZSBoZXJlLg0KPg0KPiBTdWdnZXN0aW9uOiBsZXQncyBy
ZW1vdmUgdGhpcyBiaW5kaW5nIGFuZCBjb252ZXIgaTJjLW1wYyB0bw0KPiAiaTJjLXRyYW5zZmVy
LXRpbWVvdXQtdXMiLiBZZXMsIG5vdCBuaWNlIHRvIGhhdmUgdHdvIGRlcHJlY2F0ZWQNCj4gYmlu
ZGluZ3MsIGJ1dCB0aGluZ3MgaGFwcGVuZWQuDQoNClNvdW5kcyBsaWtlIGEgZ29vZCBpZGVhLiBX
ZSdkIG9idmlvdXNseSBuZWVkIHRvIGtlZXAgc3VwcG9ydCBmb3IgdGhlIA0KZXhpc3RpbmcgcHJv
cGVydHkgYnV0IGl0IHdvdWxkbid0IGJlIGhhcmQgdG8gYWRkIA0KImkyYy10cmFuc2Zlci10aW1l
b3V0LXVzIi4gSSdsbCB0cnkgdG8gd2hpcCB1cCBhIHBhdGNoIGZvciB0aGF0IHNvbWV0aW1lIA0K
dGhpcyB3ZWVrLCBqdXN0IG5lZWQgdG8gZHVzdCBvZmYgbXkgRnJlZXNjYWxlIGJvYXJkcy4NCg0K
PiBTbywgdGhlc2UgYXJlIG15IHRob3VnaHRzIGFib3V0IHRoZSBjdXJyZW50IHNpdHVhdGlvbi4g
SSBtaWdodCBoYXZlDQo+IG1pc3NlZCBzb21ldGhpbmcsIHNvIGlmIHlvdSBoYXZlIGFueXRoaW5n
IHRvIGFkZCwgSSBhbSBhbGwgZWFycy4NCj4gQ29tbWVudHMgcmVhbGx5IHdlbGNvbWUhDQo+DQo+
IEhhcHB5IGhhY2tpbmcsDQo+DQo+ICAgICBXb2xmcmFtDQo+

