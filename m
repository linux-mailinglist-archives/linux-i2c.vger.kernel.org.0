Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63DA47D49A3
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 10:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233115AbjJXIPH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 04:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232924AbjJXIPG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 04:15:06 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA75AE9
        for <linux-i2c@vger.kernel.org>; Tue, 24 Oct 2023 01:15:03 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5D9782C0547;
        Tue, 24 Oct 2023 21:15:01 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698135301;
        bh=a7rNjQU28ksuExI8JtKe/7t79lDDXhncoO0YZS25u08=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=UbL6YWnQAR2ss1kkQh2SNlqiUghE7jiH+nPoIpn25rsuIEUhkfG2zx0hD6c2joj+C
         sLf4+7WRWf7Ov1DMP64p4CeThlE8YetKH+jQehTyumsH0hxtn0w/1TTQjVu4QHP1Uj
         toPkblITZQERvlXQ8KzvmcB5BkWhVkinV2tHghmkkULE8Zkl2bYd9SonxrBleQKIUI
         3m4PambrY8cXDA4M4rImGe/IURLsC1sSjLigWltPmdaq2CVZs34IXSd9Ml2Ee/wUGU
         XGtKSfrmcR1U9I0LqomZDT2JQ4eyLL1sSAdnoAC9ouhsiUH/imF/dCsVAz9XbobIFm
         QZKFAIq5J/cvw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B65377d050001>; Tue, 24 Oct 2023 21:15:01 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.39; Tue, 24 Oct 2023 21:15:01 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Tue, 24 Oct 2023 21:15:00 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.039; Tue, 24 Oct 2023 21:15:00 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] i2c: mv64xxx: add an optional reset-gpios property
Thread-Topic: [PATCH v3 2/2] i2c: mv64xxx: add an optional reset-gpios
 property
Thread-Index: AQHaAgcy5mKiozoBFUuv9b6R9rUkyLBXxl+A
Date:   Tue, 24 Oct 2023 08:15:00 +0000
Message-ID: <78c5eeb7-214d-43d2-91e7-7eb50a1543de@alliedtelesis.co.nz>
References: <20231018210805.1569987-1-chris.packham@alliedtelesis.co.nz>
 <20231018210805.1569987-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20231018210805.1569987-3-chris.packham@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.32.14.96]
Content-Type: text/plain; charset="utf-8"
Content-ID: <726BCCC326F776428AD7BDA67F787942@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oOnywjR1vmkA:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=M7cbq605zZYUMcyVNpMA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxOS8xMC8yMyAxMDowOCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4gU29tZSBoYXJkd2Fy
ZSBkZXNpZ25zIGhhdmUgYSBHUElPIHVzZWQgdG8gY29udHJvbCB0aGUgcmVzZXQgb2YgYWxsIHRo
ZQ0KPiBkZXZpY2VzIG9uIGFuZCBJMkMgYnVzLiBJdCdzIG5vdCBwb3NzaWJsZSBmb3IgZXZlcnkg
Y2hpbGQgbm9kZSB0bw0KPiBkZWNsYXJlIGEgcmVzZXQtZ3Bpb3MgcHJvcGVydHkgYXMgb25seSB0
aGUgZmlyc3QgZGV2aWNlIHByb2JlZCB3b3VsZCBiZQ0KPiBhYmxlIHRvIHN1Y2Nlc3NmdWxseSBy
ZXF1ZXN0IGl0ICh0aGUgb3RoZXJzIHdpbGwgZ2V0IC1FQlVTWSkuIFJlcHJlc2VudA0KPiB0aGlz
IGtpbmQgb2YgaGFyZHdhcmUgZGVzaWduIGJ5IGFzc29jaWF0aW5nIHRoZSByZXNldC1ncGlvcyB3
aXRoIHRoZQ0KPiBwYXJlbnQgSTJDIGJ1cy4gVGhlIHJlc2V0IGxpbmUgd2lsbCBiZSByZWxlYXNl
ZCBwcmlvciB0byB0aGUgY2hpbGQgSTJDDQo+IGRldmljZXMgYmVpbmcgcHJvYmVkLg0KPg0KPiBT
aWduZWQtb2ZmLWJ5OiBDaHJpcyBQYWNraGFtIDxjaHJpcy5wYWNraGFtQGFsbGllZHRlbGVzaXMu
Y28ubno+DQo+IC0tLQ0KPg0KPiBOb3RlczoNCj4gICAgICBDaGFuZ2VzIGluIHYzOg0KPiAgICAg
IC0gUmVuYW1lIHJlc2V0LWRlbGF5IHRvIHJlc2V0LWR1cmF0aW9uDQo+ICAgICAgLSBVc2UgcmVz
ZXQtZHVyYXRpb24tdXMgcHJvcGVydHkgdG8gY29udHJvbCB0aGUgcmVzZXQgcHVsc2UgcmF0aGVy
IHRoYW4NCj4gICAgICAgIGRlbGF5aW5nIGFmdGVyIHRoZSByZXNldA0KPiAgICAgIENoYW5nZXMg
aW4gdjI6DQo+ICAgICAgLSBBZGQgYSBwcm9wZXJ0eSB0byBjb3ZlciB0aGUgbGVuZ3RoIG9mIGRl
bGF5IGFmdGVyIHJlbGVhc2luZyB0aGUgcmVzZXQNCj4gICAgICAgIEdQSU8NCj4gICAgICAtIFVz
ZSBkZXZfZXJyX3Byb2JlKCkgd2hlbiByZXF1ZXNpbmcgdGhlIEdQSU8gZmFpbHMNCj4NCj4gICBk
cml2ZXJzL2kyYy9idXNzZXMvaTJjLW12NjR4eHguYyB8IDE1ICsrKysrKysrKysrKysrKw0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLW12NjR4eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXY2
NHh4eC5jDQo+IGluZGV4IGVmZDI4YmJlY2Y2MS4uMjhmMTFkMmU4MDBiIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW12NjR4eHguYw0KPiArKysgYi9kcml2ZXJzL2kyYy9i
dXNzZXMvaTJjLW12NjR4eHguYw0KDQprZXJuZWwgdGVzdCByb2JvdCBwb2ludHMgb3V0IEknbSBt
aXNzaW5nIGFuIGluY2x1ZGUgb2YgZ3Bpby9jb25zdW1lci5oIA0KSSdsbCBmaXggdGhhdCB3aXRo
IGEgdjQuIEknbGwgZ2l2ZSBpdCBhIGNvdXBsZSBvZiBkYXlzIGJlZm9yZSBzZW5kaW5nIGl0IA0K
b3V0IGp1c3QgaW4gY2FzZSB0aGVyZSBhcmUgYW55IG1vcmUgY29tbWVudHMuDQoNCj4gQEAgLTE2
MCw2ICsxNjAsNyBAQCBzdHJ1Y3QgbXY2NHh4eF9pMmNfZGF0YSB7DQo+ICAgCWJvb2wJCQljbGtf
bl9iYXNlXzA7DQo+ICAgCXN0cnVjdCBpMmNfYnVzX3JlY292ZXJ5X2luZm8JcmluZm87DQo+ICAg
CWJvb2wJCQlhdG9taWM7DQo+ICsJc3RydWN0IGdwaW9fZGVzYwkqcmVzZXRfZ3BpbzsNCj4gICB9
Ow0KPiAgIA0KPiAgIHN0YXRpYyBzdHJ1Y3QgbXY2NHh4eF9pMmNfcmVncyBtdjY0eHh4X2kyY19y
ZWdzX212NjR4eHggPSB7DQo+IEBAIC0xMDM2LDYgKzEwMzcsNyBAQCBtdjY0eHh4X2kyY19wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZCkNCj4gICAJc3RydWN0IG12NjR4eHhfaTJjX2Rh
dGEJCSpkcnZfZGF0YTsNCj4gICAJc3RydWN0IG12NjR4eHhfaTJjX3BkYXRhCSpwZGF0YSA9IGRl
dl9nZXRfcGxhdGRhdGEoJnBkLT5kZXYpOw0KPiAgIAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4g
Kwl1MzIJcmVzZXRfZHVyYXRpb247DQo+ICAgCWludAlyYzsNCj4gICANCj4gICAJaWYgKCghcGRh
dGEgJiYgIXBkLT5kZXYub2Zfbm9kZSkpDQo+IEBAIC0xMDgzLDYgKzEwODUsMTQgQEAgbXY2NHh4
eF9pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGQpDQo+ICAgCWlmIChkcnZfZGF0
YS0+aXJxIDwgMCkNCj4gICAJCXJldHVybiBkcnZfZGF0YS0+aXJxOw0KPiAgIA0KPiArCWRydl9k
YXRhLT5yZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoJnBkLT5kZXYsICJyZXNl
dCIsIEdQSU9EX09VVF9ISUdIKTsNCj4gKwlpZiAoSVNfRVJSKGRydl9kYXRhLT5yZXNldF9ncGlv
KSkNCj4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoJnBkLT5kZXYsIFBUUl9FUlIoZHJ2X2RhdGEt
PnJlc2V0X2dwaW8pLA0KPiArCQkJCSAgICAgIkNhbm5vdCBnZXQgcmVzZXQgZ3Bpb1xuIik7DQo+
ICsJcmMgPSBkZXZpY2VfcHJvcGVydHlfcmVhZF91MzIoJnBkLT5kZXYsICJyZXNldC1kdXJhdGlv
bi11cyIsICZyZXNldF9kdXJhdGlvbik7DQo+ICsJaWYgKHJjKQ0KPiArCQlyZXNldF9kdXJhdGlv
biA9IDE7DQo+ICsNCj4gICAJaWYgKHBkYXRhKSB7DQo+ICAgCQlkcnZfZGF0YS0+ZnJlcV9tID0g
cGRhdGEtPmZyZXFfbTsNCj4gICAJCWRydl9kYXRhLT5mcmVxX24gPSBwZGF0YS0+ZnJlcV9uOw0K
PiBAQCAtMTEyMSw2ICsxMTMxLDExIEBAIG12NjR4eHhfaTJjX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkKQ0KPiAgIAkJCWdvdG8gZXhpdF9kaXNhYmxlX3BtOw0KPiAgIAl9DQo+ICAg
DQo+ICsJaWYgKGRydl9kYXRhLT5yZXNldF9ncGlvKSB7DQo+ICsJCXVzbGVlcF9yYW5nZShyZXNl
dF9kdXJhdGlvbiwgcmVzZXRfZHVyYXRpb24gKyAxMCk7DQo+ICsJCWdwaW9kX3NldF92YWx1ZV9j
YW5zbGVlcChkcnZfZGF0YS0+cmVzZXRfZ3BpbywgMCk7DQo+ICsJfQ0KPiArDQo+ICAgCXJjID0g
cmVxdWVzdF9pcnEoZHJ2X2RhdGEtPmlycSwgbXY2NHh4eF9pMmNfaW50ciwgMCwNCj4gICAJCQkg
TVY2NFhYWF9JMkNfQ1RMUl9OQU1FLCBkcnZfZGF0YSk7DQo+ICAgCWlmIChyYykgew==
