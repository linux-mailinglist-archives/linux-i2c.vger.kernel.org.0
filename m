Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 265B87DD6D5
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Oct 2023 20:59:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235049AbjJaT7f (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Oct 2023 15:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbjJaT7f (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 Oct 2023 15:59:35 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41DDBC9
        for <linux-i2c@vger.kernel.org>; Tue, 31 Oct 2023 12:59:31 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1F94B2C01BE;
        Wed,  1 Nov 2023 08:59:28 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698782368;
        bh=S/pfkRH68yVx3hWmEG6BUZFthc8VRNCK7zHVAa7ID0E=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=W8ZZZHTMs/LdXojZXS41MnnaIEJQ+U/wM8gGESmd9oIen6ivrR9UyxafAhS8hXSZx
         m+A+riGU/c5/FiQUxQjBlm6w/J3Opa6q71YcUvi+UIQlrp593aKEOFbhFNq4HeJA7F
         QmIXX5mM9oVQyKLjCciTvP1MEGt5Z/17xSdNlRTvAi17tjtBOEhcynH3JIr+bxB+Gc
         pvVXqSzOcn+XXitqCB1thxB2tP6GyLp/IOTgAEFUlX6pIrcG09IqlcMCeW2Ld1SNVt
         +6FFwRPEBmC2MQgpA/VZvYeRgH6O60q1e/FHI9dMc82orwMF6FB3RHyrn8pYLqHOFs
         3usviZsigx1CA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B65415ca00000>; Wed, 01 Nov 2023 08:59:28 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.39; Wed, 1 Nov 2023 08:59:27 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Wed, 1 Nov 2023 08:59:27 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.039; Wed, 1 Nov 2023 08:59:27 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Mark Brown <broonie@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 2/2] i2c: mv64xxx: add an optional bus-reset-gpios
 property
Thread-Topic: [PATCH v5 2/2] i2c: mv64xxx: add an optional bus-reset-gpios
 property
Thread-Index: AQHaCIYGLKsizTKN0UyQHbkVO99aL7BcpjeAgAACoICAA762AIACLMeAgADqM4A=
Date:   Tue, 31 Oct 2023 19:59:27 +0000
Message-ID: <89088ff0-d2c7-4270-bb2b-26f90d6c3e3c@alliedtelesis.co.nz>
References: <20231027033104.1348921-1-chris.packham@alliedtelesis.co.nz>
 <20231027033104.1348921-3-chris.packham@alliedtelesis.co.nz>
 <65911ec0-e073-435f-846a-c5501dd5d3a9@linaro.org>
 <9eebec9b-e6fd-4a22-89ea-b434f446e061@linaro.org>
 <b91223a3-d835-47c0-976b-3ebdfe84d1f8@alliedtelesis.co.nz>
 <22c74d90-19f8-4a68-ad01-1b7ed833cf91@linaro.org>
In-Reply-To: <22c74d90-19f8-4a68-ad01-1b7ed833cf91@linaro.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <C754409B998D01428E2408B0D6697ECD@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10 a=62ntRvTiAAAA:8 a=g14jhrGyAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=-msGNS_7CClV5aHoOmwA:9 a=QEXdDO2ut3YA:10 a=pToNdpNmrtiFLRE6bQ9Z:22 a=P511sJaWzJIkUf5biGsp:22 a=AjGcO6oz07-iQ99wixmX:22 a=cvBusfyB2V15izCimMoJ:22
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAzMS8xMC8yMyAxOTowMSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gT24gMjkv
MTAvMjAyMyAyMTo0OCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+IE9uIDI4LzEwLzIzIDAwOjM3
LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4+IE9uIDI3LzEwLzIwMjMgMTM6MjcsIEty
enlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4+IE9uIDI3LzEwLzIwMjMgMDU6MzEsIENocmlz
IFBhY2toYW0gd3JvdGU6DQo+Pj4+PiBTb21lIGhhcmR3YXJlIGRlc2lnbnMgaGF2ZSBhIEdQSU8g
dXNlZCB0byBjb250cm9sIHRoZSByZXNldCBvZiBhbGwgdGhlDQo+Pj4+PiBkZXZpY2VzIG9uIGFu
ZCBJMkMgYnVzLiBJdCdzIG5vdCBwb3NzaWJsZSBmb3IgZXZlcnkgY2hpbGQgbm9kZSB0bw0KPj4+
Pj4gZGVjbGFyZSBhIHJlc2V0LWdwaW9zIHByb3BlcnR5IGFzIG9ubHkgdGhlIGZpcnN0IGRldmlj
ZSBwcm9iZWQgd291bGQgYmUNCj4+Pj4+IGFibGUgdG8gc3VjY2Vzc2Z1bGx5IHJlcXVlc3QgaXQg
KHRoZSBvdGhlcnMgd2lsbCBnZXQgLUVCVVNZKS4gUmVwcmVzZW50DQo+Pj4gQ2M6IE1hcmssDQo+
Pj4NCj4+PiBBbHNvIHRoaXMgcGFydCBpcyBub3QgdHJ1ZS4gSWYgdGhlIGJ1cyBpcyBub24tZGlz
Y292ZXJhYmxlLCB0aGVuIGl0IGlzDQo+Pj4gcG9zc2libGUgdG8gaGF2ZSByZXNldC1ncGlvcyBp
biBlYWNoIHByb2JlZCBkZXZpY2UuIFlvdSBjYW4gc2hhcmUgR1BJT3MsDQo+Pj4gc28gbm8gcHJv
YmxlbSB3aXRoIC1FQlVTWSBhdCBhbGwuDQo+PiBMYXN0IHRpbWUgSSBjaGVja2VkIHlvdSBjb3Vs
ZG4ndCBzaGFyZSBHUElPcy4gSWYgdGhhdCdzIG5vIGxvbmdlciB0aGUNCj4+IGNhc2UgdGhlbiBJ
IGNhbiBwcm9iYWJseSBtYWtlIHdoYXQgSSBuZWVkIHRvIGhhcHBlbiB3b3JrLiBJdCBzdGlsbA0K
Pj4gY3JlYXRlcyBhbiBpc3N1ZSB0aGF0IEkgaGF2ZSBtdWx0aXBsZSBQQ0E5NTR4IG11eGVzIGNv
bm5lY3RlZCB0byBhDQo+PiBjb21tb24gcmVzZXQgR1BJTyBzbyBhcyBlYWNoIG11eCBpcyBwcm9i
ZWQgdGhlIFBDQTk1NHggZHJpdmVyIHdpbGwNCj4+IHRvZ2dsZSB0aGUgcmVzZXQuIFRoYXQncyBw
cm9iYWJseSBPSyBhcyB0aGUgUENBOTU0eCBpcyBzdWZmaWNpZW50bHkNCj4+IHN0YXRlbGVzcyB0
aGF0IHRoZSBleHRyYSByZXNldHMgd29uJ3QgZG8gYW55IGhhcm0gYnV0IGlmIGl0IHdlcmUgYSBt
b3JlDQo+PiBjb21wbGljYXRlZCBkZXZpY2UgdGhlbiB0aGVyZSB3b3VsZCBiZSBpc3N1ZXMuDQo+
IEkga25vdywgYnV0IHRoaXMgaXMgYSBicm9hZGVyIHByb2JsZW0sIG5vdCByZWFsbHkgc3BlY2lm
aWMgdG8gdGhpcyBvbmUNCj4gZGV2aWNlLiBJIGFsc28gYXJndWUgdGhhdCB5b3VyIEkyQyBjb250
cm9sbGVyIGRvZXMgbm90IGFjdHVhbGx5IGhhdmUNCj4gdGhpcyByZXNldCBsaW5lLg0KDQpZZXMg
YWJzb2x1dGVseS4gQmVjYXVzZSB0aGUgcmVzZXQgbGluZSBpcyBjb21tb24gdG8gbXVsdGlwbGUg
cGNhOTU0eCANCm11eGVzIHRoZSBvbmx5IG9wdGlvbiBJIGhhdmUgKEkgdGhpbmspIGlzIHRvIGFz
c29jaWF0ZSB0aGUgcmVzZXQgbGluZSANCndpdGggdGhlIGNvbnRyb2xsZXIuIEl0IGhhcHBlbnMg
dG8gYmUgdHJ1ZSBmb3IgbXkgY2FzZSB0aGF0IGV2ZXJ5dGhpbmcgDQpjb25uZWN0ZWQgdG8gdGhh
dCBidXMgaXMgYWZmZWN0ZWQgYnkgdGhlIHJlc2V0IGxpbmUgYnV0IEkgY2FuIGNvbXBsZXRlbHkg
DQpzZWUgdGhhdCB0aGVyZSBtYXkgYmUgb3RoZXIgZGVzaWducyB3aGVyZSB0aGVyZSBhcmUgYSBt
aXggb2YgbXV4ZXMgYW5kIA0Kb3RoZXIgZGV2aWNlcyBvbiB0aGUgcm9vdCBidXMuDQoNClNvIGFz
c29jaWF0aW5nIHRoZSByZXNldCBsaW5lIHdpdGggdGhlIEkyQyBjb250cm9sbGVyIGlzIGEgcHJh
Z21hdGljIA0Kc29sdXRpb24gKG9yIGFuIGVncmVnaW91cyBoYWNrIGRlcGVuZGluZyBvbiB5b3Vy
IHBvaW50IG9mIHZpZXcpIHRoYXQgDQp3b3JrcyB3aXRoIHRoaXMga2luZCBvZiBoYXJkd2FyZSBk
ZXNpZ24uDQoNCkFub3RoZXIgY29tcGxldGUgaGFjayBJJ3ZlIGV4cGVyaW1lbnRlZCB3aXRoIGlz
IGFkZGluZyB0aGUgbXV4ZXMgZGVmaW5lZCANCndpdGggYHN0YXR1cyA9ICJkaXNhYmxlZCI7YCBp
biB0aGUgZHRzIGFuZCBoYXZpbmcgYSBjdXN0b20gZHJpdmVyIHRoYXQgDQpyZXF1ZXN0cyB0aGUg
R1BJTyBhbmQgbWFuaXB1bGF0ZXMgdGhlIGxpdmUgZGV2aWNlIHRyZWUuIEl0IHdvcmtzIGJ1dCBp
cyANCnF1aXRlIGEgbG90IG1vcmUgY29kZSBhbmQgd2lsbCBpbnZhcmlhYmx5IGJyZWFrIGlmIEkg
bmVlZCB0byB0d2VhayB0aGUgDQpkZXZpY2UgdHJlZS4NCg0KPj4gSGF2aW5nIHNvbWUga2luZCBv
ZiByZWYtY291bnRlZCByZXNldCBjb250cm9sbGVyIHRoYXQgaXMgaW1wbGVtZW50ZWQNCj4+IHdp
dGggR1BJT3MgaXMgcHJvYmFibHkgdGhlIGJldHRlciBzb2x1dGlvbi4gSSB3YXMga2luZCBvZiBz
dXJwcmlzZWQgdGhhdA0KPj4gbm90aGluZyBleGlzdGVkIGxpa2UgdGhhdCBpbiBkcml2ZXJzL3Jl
c2V0Lg0KPiByZXNldCBjb250cm9sbGVyIGZyYW1ld29yayBhbHJlYWR5IHN1cHBvcnRzIHRoaXMu
IFRoZSBwb2ludCBpcyB0aGF0IEdQSU8NCj4gcmVzZXQgaXMgbm90IGEgcmVzZXQgY29udHJvbGxl
ciwgc28gaW4gdGVybXMgb2YgYmluZGluZ3MgInJlc2V0cyINCj4gcHJvcGVydHkgZG9lcyBub3Qg
Zml0IGl0Lg0KDQpTbyBJIG5lZWQgc29tZSB3YXkgb2YgcmVwcmVzZW50aW5nIGEgR1BJTyBsaW5l
IGFzc29jaWF0ZWQgd2l0aCBtdWx0aXBsZSANCmRldmljZXMgdGhhdCBtdXN0IGJlIHJlcXVlc3Rl
ZCBhbmQgZHJpdmVuIGFwcHJvcHJpYXRlbHkgYmVmb3JlIHRoZSANCmRldmljZXMgYXJlIHByb2Jl
ZC4gSW4gbGlldSBvZiBhbnl0aGluZyBlbHNlIGEgImJ1cy1yZXNldC1ncGlvcyIgDQpwcm9wZXJ0
eSByZWNvZ25pemVkIGJ5IHRoZSBnZW5lcmljIEkyQyBmcmFtZXdvcmsga2luZCBvZiBzb3VuZHMg
bGlrZSB0aGUgDQpiZXN0IHNvbHV0aW9uIHNvIGZhci4gVW5sZXNzIG1heWJlIHRoZXJlJ3Mgc29t
ZSBraW5kIG9mIHBpbmN0cmwgdHlwZSANCnRoaW5nIHRoYXQgd291bGQgYWxyZWFkeSB3b3JrLg0K
DQo+Pj4gVGhlIHByb2JsZW0gaXMgZG9pbmcgcmVzZXQ6DQo+Pj4gMS4gaW4gcHJvcGVyIG1vbWVu
dCBmb3IgYWxsIGRldmljZXMNCj4+PiAyLiB3aXRob3V0IGFmZmVjdGluZyBvdGhlciBkZXZpY2Vz
IHdoZW4gb25lIHVuYmluZHMvcmVtb3ZlKCkNCj4+Pg0KPj4+IFRoZSAoMikgYWJvdmUgaXMgbm90
IHNvbHZlYWJsZSBlYXN5IGluIGtlcm5lbCBhbmQgd2UgYWxyZWFkeSBoYWQgbmljZQ0KPj4+IHRh
bGtzIGFib3V0IGl0IGp1c3QgZmV3IGRheXMgYWdvOg0KPj4+IDEuIEFwcGxlIGNhc2U6DQo+Pj4g
aHR0cHM6Ly9zY2FubWFpbC50cnVzdHdhdmUuY29tLz9jPTIwOTg4JmQ9dFpqQTVSNzd5c2xpUnlX
ZkR2Z1g5Sm5tTFpyLVRxaFJXcFlqc05PLTVBJnU9aHR0cHMlM2ElMmYlMmZzb2NpYWwlMmV0cmVl
aG91c2UlMmVzeXN0ZW1zJTJmJTQwbWFyY2FuJTJmMTExMjY4NzgwMzExNjM0MTYwDQo+Pj4NCj4+
PiAyLiBteSBXU0E4ODR4Og0KPj4+IGh0dHBzOi8vc2Nhbm1haWwudHJ1c3R3YXZlLmNvbS8/Yz0y
MDk4OCZkPXRaakE1Ujc3eXNsaVJ5V2ZEdmdYOUpubUxaci1UcWhSV3BaOXRJN3Z2dyZ1PWh0dHBz
JTNhJTJmJTJmbG9yZSUyZWtlcm5lbCUyZW9yZyUyZmFsc2EtZGV2ZWwlMmY4NGY5ZjFjNC0wNjI3
LTQ5ODYtODE2MC1iNGFiOTk0NjliODElNDBsaW5hcm8lMmVvcmclMmYNCj4+IEFwb2xvZ2llcyBm
b3IgdGhlIG1hbmdsZWQgbGlua3MgKHRoZXkncmUgbW9yZSBzZWN1cmUgbm93IGF0IGxlYXN0IHRo
YXQncw0KPj4gd2hhdCBvdXIgSVMgdGVhbSBoYXZlIGJlZW4gc29sZCkuDQo+Pj4gTGFzdCwNCj4+
PiBJIHdvdWxkIGxpa2UgdG8gYXBvbG9naXplIHRvIHlvdSBDaHJpcy4gSSB1bmRlcnN0YW5kIHRo
YXQgYnJpbmdpbmcgc3VjaA0KPj4+IGZlZWRiYWNrIGF0IHY1IGlzIG5vdCB0aGF0IGdvb2QuIEkg
aGFkIHBsZW50eSBvZiB0aW1lIHRvIHNheSBzb21ldGhpbmcNCj4+PiBlYXJsaWVyLCBzbyB0aGlz
IGlzIG5vdCByZWFsbHkgcHJvZmVzc2lvbmFsIGZyb20gbXkgc2lkZS4gSSBhbSBzb3JyeSwNCj4+
PiBqdXN0IG15IGJyYWluIGRpZCBub3QgY29ubmVjdCBhbGwgdGhlc2UgdG9waWNzIHRvZ2V0aGVy
Lg0KPj4+DQo+Pj4gSSBhcG9sb2dpemUuDQo+PiBBY3R1YWxseSBJIGtpbmQgb2YgZXhwZWN0ZWQg
dGhpcyBmZWVkYmFjay4gSSBmaWd1cmVkIEkgY291bGQgc3RhcnQgd2l0aA0KPj4gdGhlIGRyaXZl
ciB0aGF0IGlzIGN1cnJlbnRseSBjYXVzaW5nIG1lIGlzc3VlcyBhbmQgb25jZSB0aGUgZHQtYmlu
ZGluZw0KPj4gd2FzIGNvbnNpZGVyZWQgZ29vZCBlbm91Z2ggaXQgbWlnaHQgbWlncmF0ZSB0byB0
aGUgaTJjIGNvcmUuDQo+Pg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPg==
