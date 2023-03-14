Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC92D6B9FF3
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 20:47:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230109AbjCNTrd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 15:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjCNTrc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 15:47:32 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA993B865
        for <linux-i2c@vger.kernel.org>; Tue, 14 Mar 2023 12:47:29 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2D2E62C057F;
        Wed, 15 Mar 2023 08:47:27 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1678823247;
        bh=32RPrOsNxzm9u3tObDahxXuzlRkiprFhZo16+RSnJQM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=1pD3vOuvoKD/xo7OeMESCAKtvhLP86FAMfO7Gb/kdS2LwpaEOpmr1nMEbUh7PPbeG
         6NrKnTa772fGtfXnkigEgPUT67TNFY7uATjRgmLUs5ygQbKw+ZsOoi82gSXDT0X5BN
         WPySdsU5cPfJ427w4NWKmF7WDj3wHWOU343FrNtSduoB9irWdZqHdu2zx3BSVUZWX0
         EkfhuXTpHW9+q7nEIWIoQ85X0+9ZF7e4ML6H27AT7+GZeu+AvF0ncFDQ00yqk4PPQH
         6NXu1ZOVGq5Q63gE9+ydqR2EI4zZTp2iWS5nMnx4AWUVoXd34CzgCfqzGqIKAe55QY
         axyprDYqPFS3g==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6410cf4f0001>; Wed, 15 Mar 2023 08:47:27 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1497.47; Wed, 15 Mar 2023 08:47:26 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.047; Wed, 15 Mar 2023 08:47:26 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andi Shyti <andi.shyti@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v3 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Thread-Topic: [PATCH v3 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Thread-Index: AQHZVTuFDX+DgmEDFk23hBmDkBbcm675fIcAgAAO4QCAAEvNAA==
Date:   Tue, 14 Mar 2023 19:47:26 +0000
Message-ID: <32777854-fbf6-dad2-ef54-1d1c04086f0b@alliedtelesis.co.nz>
References: <20230312233613.303408-1-andi.shyti@kernel.org>
 <20230312233613.303408-4-andi.shyti@kernel.org>
 <ec504c7d-66d4-a4b7-547e-7272e012cdf9@linaro.org>
 <20230314151608.nr7ft7spsbylqclo@intel.intel>
In-Reply-To: <20230314151608.nr7ft7spsbylqclo@intel.intel>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <6358C44943B4A245A2BB15D337B6A19B@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GdlpYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=k__wU0fu6RkA:10 a=VwQbUJbxAAAA:8 a=Rh0-FL4JVTv9qmeE3dMA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQW5kaSwNCg0KT24gMTUvMDMvMjMgMDQ6MTYsIEFuZGkgU2h5dGkgd3JvdGU6DQo+IEhpLA0K
Pg0KPiBPbiBUdWUsIE1hciAxNCwgMjAyMyBhdCAwMzoyMjo1MlBNICswMTAwLCBLcnp5c3p0b2Yg
S296bG93c2tpIHdyb3RlOg0KPj4gT24gMTMvMDMvMjAyMyAwMDozNiwgQW5kaSBTaHl0aSB3cm90
ZToNCj4+PiAiZnNsLHRpbWVvdXQiIGlzIG1hcmtlZCBhcyBkZXByZWNhdGVkIGFuZCByZXBsYWNl
ZCBieSB0aGUNCj4+PiAiaTJjLXNjbC1jbGstbG93LXRpbWVvdXQtbXMiIGkyYyBwcm9wZXJ0eS4N
Cj4+Pg0KPj4+IFVzZSB0aGlzIGxhdHRlciBhbmQsIGluIGNhc2UgaXQgaXMgbWlzc2luZywgZm9y
IGJhY2sNCj4+PiBjb21wYXRpYmlsaXR5LCBjaGVjayB3aGV0aGVyIHdlIHN0aWxsIGhhdmUgImZz
bCx0aW1lb3V0IiBkZWZpbmVkLg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogQW5kaSBTaHl0aSA8
YW5kaS5zaHl0aUBrZXJuZWwub3JnPg0KPj4+IFJldmlld2VkLWJ5OiBDaHJpcyBQYWNraGFtIDxj
aHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+Pj4gLS0tDQo+Pj4gICBkcml2ZXJz
L2kyYy9idXNzZXMvaTJjLW1wYy5jIHwgMTIgKysrKysrKysrKystDQo+Pj4gICAxIGZpbGUgY2hh
bmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LW1wYy5jDQo+Pj4gaW5kZXggODdlNWMxNzI1NzUwLi4yOGYxMWUzMGFjNTAgMTAwNjQ0DQo+Pj4g
LS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0KPj4+ICsrKyBiL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtbXBjLmMNCj4+PiBAQCAtODQzLDggKzg0MywxOCBAQCBzdGF0aWMgaW50IGZz
bF9pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3ApDQo+Pj4gICAJCQltcGNfaTJj
X3NldHVwXzh4eHgob3AtPmRldi5vZl9ub2RlLCBpMmMsIGNsb2NrKTsNCj4+PiAgIAl9DQo+Pj4g
ICANCj4+PiArCS8qDQo+Pj4gKwkgKiAiZnNsLHRpbWVvdXQiIGhhcyBiZWVuIG1hcmtlZCBhcyBk
ZXByZWNhdGVkIGFuZCwgdG8gbWFpbnRhaW4NCj4+PiArCSAqIGJhY2t3YXJkIGNvbXBhdGliaWxp
dHksIHdlIHdpbGwgb25seSBsb29rIGZvciBpdCBpZg0KPj4+ICsJICogImkyYy1zY2wtY2xrLWxv
dy10aW1lb3V0LW1zIiBpcyBub3QgcHJlc2VudC4NCj4+PiArCSAqLw0KPj4+ICAgCXJlc3VsdCA9
IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG9wLT5kZXYub2Zfbm9kZSwNCj4+PiAtCQkJCSAgICAgICJm
c2wsdGltZW91dCIsICZtcGNfb3BzLnRpbWVvdXQpOw0KPj4+ICsJCQkJICAgICAgImkyYy1zY2wt
Y2xrLWxvdy10aW1lb3V0LW1zIiwNCj4+PiArCQkJCSAgICAgICZtcGNfb3BzLnRpbWVvdXQpOw0K
Pj4+ICsJaWYgKHJlc3VsdCA9PSAtRUlOVkFMKQ0KPj4+ICsJCXJlc3VsdCA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyKG9wLT5kZXYub2Zfbm9kZSwNCj4+PiArCQkJCQkgICAgICAiZnNsLHRpbWVvdXQi
LCAmbXBjX29wcy50aW1lb3V0KTsNCj4+IFdhc24ndCBvbGQgcHJvcGVydHkgaW4gdXMgYW5kIG5l
dyBvbmUgaXMgaW4gbXM/DQo+IFRoYW5rcywgS3J6eXN6dG9mISBHb29kIGNhdGNoIQ0KPg0KPiBD
aHJpcywgeW91IGFyZSB0aGUgb25seSB1c2VyIG9mIHRoaXMgcHJvcGVydHksIGFzIG9mIG5vdy4g
SXMgaXQNCj4gT0sgaWYgd2Uga2VlcCBpdCBtcz8gSSB3aWxsIHNlbmQgYSBwcm9wZXIgcGF0Y2gg
dG8gZG8gdGhlDQo+IGNvbnZlcnNpb24uDQo+DQo+IFRvIG1lIGl0IGRvZXNuJ3QgbWFrZSBtdWNo
IHNlbnNlIHRvIGhhdmUgdGhlIHRpbWVvdXQgZGVmaW5lZCBpbg0KPiB1cyBhcyB0aGF0J3Mgb2Yg
dGhlIHNhbWUgb3JkZXIgb2YgdGhlIHJhaXNpbmcgYW5kIGZhbGxpbmcgdGltZQ0KPiBvZiB0aGUg
Y2xvY2suIEFueSBvcGluaW9uPw0KSSB0aGluayBpdCdkIGJlIGVhc2llciB0byBzdGljayB0byB1
cyBhcyB0aGVuIHRoZSBzYW1lIGNvZGUgY2FuIGJlIHVzZWQgDQp0byBwcm9iZSBib3RoIHRoZSBv
bGQgcHJvcGVydHkgYW5kIHRoZSBuZXcgb25lLiBIb3dldmVyIEkgd29uJ3Qgb2JqZWN0IA0KaWYg
eW91IGFkanVzdCBmb3IgdGhlIHVzIHRvIG1zIGNvbnZlcnNpb24gYmV0d2VlbiBoYW5kbGluZyB0
aGUgbmV3IA0KcHJvcGVydHkgdnMgdGhlIG9sZCBvbmUuDQo+DQo+IEFuZGk=
