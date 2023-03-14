Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 219856BA1B5
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Mar 2023 23:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbjCNWA6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 14 Mar 2023 18:00:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbjCNWAy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 14 Mar 2023 18:00:54 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F6E22124
        for <linux-i2c@vger.kernel.org>; Tue, 14 Mar 2023 15:00:51 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4A1092C049B;
        Wed, 15 Mar 2023 11:00:48 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1678831248;
        bh=bhRZH6ArNTX6Ir6Rz8T9nnCS9vjfRfzm+2m5HLjgrpg=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RbJ0Nx7UyKQfC4a3XBrqQju/1ax0ZQfhAORuzxu5XpyRq8P7WTEozxGHD9Tn+y4ws
         88UdQEG7REqTLPiV8ARFOs86jjhcY5P5xHzbyJXkNn840NYRsLCx2z0WeH/xo5Obhe
         Z6ZEQ07PYoqwwyuZOZyyUBeqrr4z/yHmJrb1KltoT8U0XQRhzepgTU1MQW64l4/lzA
         uJwSUQlExYuVKHqXWGHnBTWkkw5zmgXKmmnN9/QlKwBtLCgNaAU2ZD8oJ6YZNQOXgY
         YwAgGiqQ3EdL17DW7u10uk5+yTJ0JmlVNj0L4ebnKa9OnuA5IBlU9aQ35j5bFJDcSp
         eo2nPuXXhcvng==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6410ee900001>; Wed, 15 Mar 2023 11:00:48 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.47; Wed, 15 Mar 2023 11:00:47 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.047; Wed, 15 Mar 2023 11:00:47 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andi Shyti <andi.shyti@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH v4 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Thread-Topic: [PATCH v4 3/3] i2c: mpc: Use i2c-scl-clk-low-timeout-ms i2c
 property
Thread-Index: AQHZVsARq7Ombt5eKUqwMpFyaK5E6K75+W6A
Date:   Tue, 14 Mar 2023 22:00:47 +0000
Message-ID: <326adcc5-a9d1-d8dc-70b8-56d8f80d4d41@alliedtelesis.co.nz>
References: <20230314215612.23741-1-andi.shyti@kernel.org>
 <20230314215612.23741-4-andi.shyti@kernel.org>
In-Reply-To: <20230314215612.23741-4-andi.shyti@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <60921DBD9A9E254AA5D5F2A98DD28AFE@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GdlpYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=k__wU0fu6RkA:10 a=VwQbUJbxAAAA:8 a=wGBd0DG7BR80vmoGwPEA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SnVzdCB0byBiZSBhIHBhaW4gdGhlIHN1YmplY3QgbGluZSBzdGlsbCBzYXlzICJtcyINCg0KT24g
MTUvMDMvMjMgMTA6NTYsIEFuZGkgU2h5dGkgd3JvdGU6DQo+ICJmc2wsdGltZW91dCIgaXMgbWFy
a2VkIGFzIGRlcHJlY2F0ZWQgYW5kIHJlcGxhY2VkIGJ5IHRoZQ0KPiAiaTJjLXNjbC1jbGstbG93
LXRpbWVvdXQtdXMiIGkyYyBwcm9wZXJ0eS4NCj4NCj4gVXNlIHRoaXMgbGF0dGVyIGFuZCwgaW4g
Y2FzZSBpdCBpcyBtaXNzaW5nLCBmb3IgYmFjaw0KPiBjb21wYXRpYmlsaXR5LCBjaGVjayB3aGV0
aGVyIHdlIHN0aWxsIGhhdmUgImZzbCx0aW1lb3V0IiBkZWZpbmVkLg0KPg0KPiBTaWduZWQtb2Zm
LWJ5OiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGtlcm5lbC5vcmc+DQo+IFJldmlld2VkLWJ5OiBD
aHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMuY28ubno+DQo+IFRlc3Rl
ZC1ieTogQ2hyaXMgUGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0K
PiAtLS0NCj4gICBkcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jIHwgMTIgKysrKysrKysrKyst
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMgYi9kcml2ZXJzL2ky
Yy9idXNzZXMvaTJjLW1wYy5jDQo+IGluZGV4IDg3ZTVjMTcyNTc1MGYuLmU4Nzk4ZjljMjNmY2Mg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMNCj4gKysrIGIvZHJp
dmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYw0KPiBAQCAtODQzLDggKzg0MywxOCBAQCBzdGF0aWMg
aW50IGZzbF9pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3ApDQo+ICAgCQkJbXBj
X2kyY19zZXR1cF84eHh4KG9wLT5kZXYub2Zfbm9kZSwgaTJjLCBjbG9jayk7DQo+ICAgCX0NCj4g
ICANCj4gKwkvKg0KPiArCSAqICJmc2wsdGltZW91dCIgaGFzIGJlZW4gbWFya2VkIGFzIGRlcHJl
Y2F0ZWQgYW5kLCB0byBtYWludGFpbg0KPiArCSAqIGJhY2t3YXJkIGNvbXBhdGliaWxpdHksIHdl
IHdpbGwgb25seSBsb29rIGZvciBpdCBpZg0KPiArCSAqICJpMmMtc2NsLWNsay1sb3ctdGltZW91
dC1tcyIgaXMgbm90IHByZXNlbnQuDQo+ICsJICovDQo+ICAgCXJlc3VsdCA9IG9mX3Byb3BlcnR5
X3JlYWRfdTMyKG9wLT5kZXYub2Zfbm9kZSwNCj4gLQkJCQkgICAgICAiZnNsLHRpbWVvdXQiLCAm
bXBjX29wcy50aW1lb3V0KTsNCj4gKwkJCQkgICAgICAiaTJjLXNjbC1jbGstbG93LXRpbWVvdXQt
dXMiLA0KPiArCQkJCSAgICAgICZtcGNfb3BzLnRpbWVvdXQpOw0KPiArCWlmIChyZXN1bHQgPT0g
LUVJTlZBTCkNCj4gKwkJcmVzdWx0ID0gb2ZfcHJvcGVydHlfcmVhZF91MzIob3AtPmRldi5vZl9u
b2RlLA0KPiArCQkJCQkgICAgICAiZnNsLHRpbWVvdXQiLCAmbXBjX29wcy50aW1lb3V0KTsNCj4g
Kw0KPiAgIAlpZiAoIXJlc3VsdCkgew0KPiAgIAkJbXBjX29wcy50aW1lb3V0ICo9IEhaIC8gMTAw
MDAwMDsNCj4gICAJCWlmIChtcGNfb3BzLnRpbWVvdXQgPCA1KQ==
