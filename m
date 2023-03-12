Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 674306B6AFC
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 21:20:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbjCLUUO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 16:20:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230281AbjCLUUM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 16:20:12 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3BFC2ED64
        for <linux-i2c@vger.kernel.org>; Sun, 12 Mar 2023 13:20:10 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 9AA9A2C05FE;
        Mon, 13 Mar 2023 09:20:08 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1678652408;
        bh=uUF/1pble7F539MwsUkR85V+kpulh5teeVs3SK26iik=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=mVnwgfh5mEStD1ms6N9kGxK+/yGTGYoF6LJqR94FRC7Kg72d3O1bWKVX+Fy+ioBIi
         d7kE08Y5e/IDtzyECe22/dwFDfaxKOdpnrayB5/28O4f99/5aQVmxgO51O4THRbLM0
         d+19sUTjlFYOC65AHpcyiTCtixKbzgSHx2oCYEog4c7BGIrVUTNa5SAI20IqfNfyC/
         qSvy1S/JeQUvaW2avgm3Q3fGIk9lr2ulyYtd2kvgsNaPqCBHbBhWl5+q/oa9Fz9gJz
         Z6Fkcdkh/jB72fxEZRK2R/FNvEyjKGL6qcEcTH2W4EITlj/HRShiTDVAqokvgD580i
         /w5A7Ii50gNhQ==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B640e33f80001>; Mon, 13 Mar 2023 09:20:08 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.47; Mon, 13 Mar 2023 09:20:08 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.047; Mon, 13 Mar 2023 09:20:08 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v2 2/2] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Thread-Topic: [PATCH v2 2/2] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Thread-Index: AQHZVPLSDhbvKPyNJUy5rboXnTrOMK72vD+A
Date:   Sun, 12 Mar 2023 20:20:07 +0000
Message-ID: <5c90f0d3-3085-e71a-3277-99ab2d694fcd@alliedtelesis.co.nz>
References: <20230312145546.262492-1-andi.shyti@kernel.org>
 <20230312145546.262492-3-andi.shyti@kernel.org>
In-Reply-To: <20230312145546.262492-3-andi.shyti@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <915834EA617A70429216594E14688EA4@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GdlpYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=k__wU0fu6RkA:10 a=VwQbUJbxAAAA:8 a=qz-aMfjk3hbnPCHNPXAA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxMy8wMy8yMyAwMzo1NSwgQW5kaSBTaHl0aSB3cm90ZToNCj4gImZzbCx0aW1lb3V0IiBp
cyBtYXJrZWQgYXMgZGVwcmVjYXRlZCBhbmQgcmVwbGFjZWQgYnkgdGhlDQo+ICJpMmMtc2NsLWNs
ay1sb3ctdGltZW91dC1tcyIgaTJjIHByb3BlcnR5Lg0KPg0KPiBVc2UgdGhpcyBsYXR0ZXIgYW5k
LCBpbiBjYXNlIGl0IGlzIG1pc3NpbmcsIGZvciBiYWNrDQo+IGNvbXBhdGliaWxpdHksIGNoZWNr
IHdoZXRoZXIgd2Ugc3RpbGwgaGF2ZSAiZnNsLHRpbWVvdXQiIGRlZmluZWQuDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlAa2VybmVsLm9yZz4NCj4gLS0tDQo+ICAg
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyB8IDExICsrKysrKysrKystDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LW1wYy5jDQo+IGluZGV4IDgxYWM5MmJiNGY2Zi4uZmU2Mjc5YTM1M2M2IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQo+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nl
cy9pMmMtbXBjLmMNCj4gQEAgLTg0Niw3ICs4NDYsMTYgQEAgc3RhdGljIGludCBmc2xfaTJjX3By
b2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9wKQ0KPiAgIAkJCW1wY19pMmNfc2V0dXBfOHh4
eChvcC0+ZGV2Lm9mX25vZGUsIGkyYywgY2xvY2spOw0KPiAgIAl9DQo+ICAgDQo+IC0JcHJvcCA9
IG9mX2dldF9wcm9wZXJ0eShvcC0+ZGV2Lm9mX25vZGUsICJmc2wsdGltZW91dCIsICZwbGVuKTsN
Cj4gKwlwcm9wID0gb2ZfZ2V0X3Byb3BlcnR5KG9wLT5kZXYub2Zfbm9kZSwNCj4gKwkJCSAgICAg
ICAiaTJjLXNjbC1jbGstbG93LXRpbWVvdXQtbXMiLCAmcGxlbik7DQo+ICsNCj4gKwkvKg0KPiAr
CSAqIGVuc3VyaW5nIGJhY2sgY29tcGF0aWJpbGl0eSBhcw0KPiArCSAqICJmc2wsdGltZW91dCIg
aXMgbWFya2VkIGFzIGRlcHJlY2F0ZWQNCj4gKwkgKi8NCj4gKwlpZiAoIXByb3ApDQo+ICsJCXBy
b3AgPSBvZl9nZXRfcHJvcGVydHkob3AtPmRldi5vZl9ub2RlLCAiZnNsLHRpbWVvdXQiLCAmcGxl
bik7DQo+ICsNCj4gICAJaWYgKHByb3AgJiYgcGxlbiA9PSBzaXplb2YodTMyKSkgew0KPiAgIAkJ
bXBjX29wcy50aW1lb3V0ID0gKnByb3AgKiBIWiAvIDEwMDAwMDA7DQo+ICAgCQlpZiAobXBjX29w
cy50aW1lb3V0IDwgNSkNCg0KV2hpbGUgeW91J3JlIGhlcmUgaXQgbWlnaHQgbWFrZSBzZW5zZSB0
byBjbGVhbiB0aGlzIHVwIHRvIHVzZSANCm9mX3Byb3BlcnR5X3JlYWRfdTMyKCkuDQoNCldpdGgg
b3Igd2l0aG91dCB0aGF0IGFkZGl0aW9uYWwgY2xlYW51cDoNCg0KUmV2aWV3ZWQtYnk6IENocmlz
IFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCg==
