Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6967CCEC1
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Oct 2023 22:50:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233862AbjJQUuk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Oct 2023 16:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233940AbjJQUuh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Oct 2023 16:50:37 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB09CED
        for <linux-i2c@vger.kernel.org>; Tue, 17 Oct 2023 13:50:34 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 3B3432C0543;
        Wed, 18 Oct 2023 09:50:31 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1697575831;
        bh=rMWV0jyGCO+AKrUkZbNvOflU06QVWZ/Z9MmLH8xjquo=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=cLBTd6Jj8yKTQluuy/XCTqDmqeOBSKml6ieETdIJYyJsGHRd6u7rvkXSCcl3Od1Go
         LiAftSgNhTzvBJgKcvZkVfw+pdJDitAsgB1kyk9k94+A0hdzTHBzYn9Ddc0e0fqt3s
         mc4OcTVpWE84VUSVZtQDHR6E8+Uow0oPPro/1gLIPnZgD9RWI8LRW2qvbtUdLAKCSt
         DztoeW6bmeP17UqrY6epbjtKcMk1E1pcHVuspnBOD4FH9lzhFqoplFo4e669HwYUGf
         8z2joNfoIf4cFvupjhHFltgsoCqelxPPzwpb4zM2HfEsvN9y6Io1Jd9eXc0XuHyOI0
         wgAcDAl5WkArw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B652ef3970001>; Wed, 18 Oct 2023 09:50:31 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Wed, 18 Oct 2023 09:50:30 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.037; Wed, 18 Oct 2023 09:50:30 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Peter Rosin <peda@axentia.se>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] i2c: mv64xxx: add an optional reset-gpios property
Thread-Topic: [PATCH v2 2/2] i2c: mv64xxx: add an optional reset-gpios
 property
Thread-Index: AQHZ/9lgLUsoMd2MBUeuXVjl3I+fzrBNmGUAgAAFGwA=
Date:   Tue, 17 Oct 2023 20:50:30 +0000
Message-ID: <95b1661f-82eb-4542-95a5-aaf0c6b64afe@alliedtelesis.co.nz>
References: <20231016023504.3976746-1-chris.packham@alliedtelesis.co.nz>
 <20231016023504.3976746-3-chris.packham@alliedtelesis.co.nz>
 <4ece4a98-ff35-6a95-6f06-cbb9eaa50e8c@axentia.se>
In-Reply-To: <4ece4a98-ff35-6a95-6f06-cbb9eaa50e8c@axentia.se>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <92BD0047AFD7724BA4BB588E388496BA@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=n8WlrThV_vcTH7ry0noA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxOC8xMC8yMyAwOTozMiwgUGV0ZXIgUm9zaW4gd3JvdGU6DQo+IEhpIQ0KPg0KPiAyMDIz
LTEwLTE2IGF0IDA0OjM1LCBDaHJpcyBQYWNraGFtIHdyb3RlOg0KPj4gU29tZSBoYXJkd2FyZSBk
ZXNpZ25zIGhhdmUgYSBHUElPIHVzZWQgdG8gY29udHJvbCB0aGUgcmVzZXQgb2YgYWxsIHRoZQ0K
Pj4gZGV2aWNlcyBvbiBhbmQgSTJDIGJ1cy4gSXQncyBub3QgcG9zc2libGUgZm9yIGV2ZXJ5IGNo
aWxkIG5vZGUgdG8NCj4+IGRlY2xhcmUgYSByZXNldC1ncGlvcyBwcm9wZXJ0eSBhcyBvbmx5IHRo
ZSBmaXJzdCBkZXZpY2UgcHJvYmVkIHdvdWxkIGJlDQo+PiBhYmxlIHRvIHN1Y2Nlc3NmdWxseSBy
ZXF1ZXN0IGl0ICh0aGUgb3RoZXJzIHdpbGwgZ2V0IC1FQlVTWSkuIFJlcHJlc2VudA0KPj4gdGhp
cyBraW5kIG9mIGhhcmR3YXJlIGRlc2lnbiBieSBhc3NvY2lhdGluZyB0aGUgcmVzZXQtZ3Bpb3Mg
d2l0aCB0aGUNCj4+IHBhcmVudCBJMkMgYnVzLiBUaGUgcmVzZXQgbGluZSB3aWxsIGJlIHJlbGVh
c2VkIHByaW9yIHRvIHRoZSBjaGlsZCBJMkMNCj4+IGRldmljZXMgYmVpbmcgcHJvYmVkLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVs
ZXNpcy5jby5uej4NCj4+IC0tLQ0KPj4NCj4+IE5vdGVzOg0KPj4gICAgICBDaGFuZ2VzIGluIHYy
Og0KPj4gICAgICAtIEFkZCBhIHByb3BlcnR5IHRvIGNvdmVyIHRoZSBsZW5ndGggb2YgZGVsYXkg
YWZ0ZXIgcmVsZWFzaW5nIHRoZSByZXNldA0KPj4gICAgICAgIEdQSU8NCj4+ICAgICAgLSBVc2Ug
ZGV2X2Vycl9wcm9iZSgpIHdoZW4gcmVxdWVzaW5nIHRoZSBHUElPIGZhaWxzDQo+Pg0KPj4gICBk
cml2ZXJzL2kyYy9idXNzZXMvaTJjLW12NjR4eHguYyB8IDE1ICsrKysrKysrKysrKysrKw0KPj4g
ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2kyYy9idXNzZXMvaTJjLW12NjR4eHguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMt
bXY2NHh4eC5jDQo+PiBpbmRleCBlZmQyOGJiZWNmNjEuLjUwYzQ3MGU1YzRiZSAxMDA2NDQNCj4+
IC0tLSBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXY2NHh4eC5jDQo+PiArKysgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLW12NjR4eHguYw0KPj4gQEAgLTE2MCw2ICsxNjAsNyBAQCBzdHJ1Y3Qg
bXY2NHh4eF9pMmNfZGF0YSB7DQo+PiAgIAlib29sCQkJY2xrX25fYmFzZV8wOw0KPj4gICAJc3Ry
dWN0IGkyY19idXNfcmVjb3ZlcnlfaW5mbwlyaW5mbzsNCj4+ICAgCWJvb2wJCQlhdG9taWM7DQo+
PiArCXN0cnVjdCBncGlvX2Rlc2MJKnJlc2V0X2dwaW87DQo+PiAgIH07DQo+PiAgIA0KPj4gICBz
dGF0aWMgc3RydWN0IG12NjR4eHhfaTJjX3JlZ3MgbXY2NHh4eF9pMmNfcmVnc19tdjY0eHh4ID0g
ew0KPj4gQEAgLTEwMzYsNiArMTAzNyw3IEBAIG12NjR4eHhfaTJjX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkKQ0KPj4gICAJc3RydWN0IG12NjR4eHhfaTJjX2RhdGEJCSpkcnZfZGF0
YTsNCj4+ICAgCXN0cnVjdCBtdjY0eHh4X2kyY19wZGF0YQkqcGRhdGEgPSBkZXZfZ2V0X3BsYXRk
YXRhKCZwZC0+ZGV2KTsNCj4+ICAgCXN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPj4gKwl1MzIJcmVz
ZXRfdWRlbGF5Ow0KPj4gICAJaW50CXJjOw0KPj4gICANCj4+ICAgCWlmICgoIXBkYXRhICYmICFw
ZC0+ZGV2Lm9mX25vZGUpKQ0KPj4gQEAgLTEwODMsNiArMTA4NSwxNCBAQCBtdjY0eHh4X2kyY19w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZCkNCj4+ICAgCWlmIChkcnZfZGF0YS0+aXJx
IDwgMCkNCj4+ICAgCQlyZXR1cm4gZHJ2X2RhdGEtPmlycTsNCj4+ICAgDQo+PiArCWRydl9kYXRh
LT5yZXNldF9ncGlvID0gZGV2bV9ncGlvZF9nZXRfb3B0aW9uYWwoJnBkLT5kZXYsICJyZXNldCIs
IEdQSU9EX09VVF9ISUdIKTsNCj4+ICsJaWYgKElTX0VSUihkcnZfZGF0YS0+cmVzZXRfZ3Bpbykp
DQo+PiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZSgmcGQtPmRldiwgUFRSX0VSUihkcnZfZGF0YS0+
cmVzZXRfZ3BpbyksDQo+PiArCQkJCSAgICAgIkNhbm5vdCBnZXQgcmVzZXQgZ3Bpb1xuIik7DQo+
PiArCXJjID0gZGV2aWNlX3Byb3BlcnR5X3JlYWRfdTMyKCZwZC0+ZGV2LCAicmVzZXQtZGVsYXkt
dXMiLCAmcmVzZXRfdWRlbGF5KTsNCj4+ICsJaWYgKHJjKQ0KPj4gKwkJcmVzZXRfdWRlbGF5ID0g
MTsNCj4+ICsNCj4+ICAgCWlmIChwZGF0YSkgew0KPj4gICAJCWRydl9kYXRhLT5mcmVxX20gPSBw
ZGF0YS0+ZnJlcV9tOw0KPj4gICAJCWRydl9kYXRhLT5mcmVxX24gPSBwZGF0YS0+ZnJlcV9uOw0K
Pj4gQEAgLTExMjEsNiArMTEzMSwxMSBAQCBtdjY0eHh4X2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZv
cm1fZGV2aWNlICpwZCkNCj4+ICAgCQkJZ290byBleGl0X2Rpc2FibGVfcG07DQo+PiAgIAl9DQo+
PiAgIA0KPj4gKwlpZiAoZHJ2X2RhdGEtPnJlc2V0X2dwaW8pIHsNCj4+ICsJCWdwaW9kX3NldF92
YWx1ZV9jYW5zbGVlcChkcnZfZGF0YS0+cmVzZXRfZ3BpbywgMCk7DQo+IFRoZXJlIGlzIG5vIGxp
bWl0IHRvIGhvdyBzaG9ydCB0aGUgcmVzZXQgcHVsc2Ugd2lsbCBiZSB3aXRoIHRoaXMNCj4gaW1w
bGVtZW50YXRpb24uIFdoYXQgSSB3YXMgcmVxdWVzdGluZyBpbiBteSBjb21tZW50IGZvciB2MSB3
YXMNCj4gYSB3YXkgdG8gY29udHJvbCB0aGUgbGVuZ3RoIG9mIHRoZSByZXNldCBwdWxzZSAobm90
IHRoZSBkZWxheQ0KPiBhZnRlciB0aGUgcHVsc2UpLiBUaGVyZSBhcmUgZGV2aWNlcyB0aGF0IGJl
aGF2ZSB2ZXJ5IGJhZGx5IGlmDQo+IHRoZSByZXNldCBwdWxzZSBpcyB0b28gc2hvcnQgZm9yIHRo
ZWlyIGxpa2luZywgb3RoZXJzIG1pZ2h0IG5vdA0KPiByZWFjdCBhdCBhbGwuLi4NCg0KWWVhaCB5
b3UncmUgcmlnaHQuIEkgb3JpZ2luYWxseSBoYWQgdGhlIHNhbWUgZGVsYXkgYmVmb3JlIGFuZCBh
ZnRlciBidXQgDQpkZWNpZGVkIHRvIHJlbW92ZSBvbmUgKGFuZCBjaG9zZSB3cm9uZykuDQoNCkkg
dGhpbmsgSSBkZWZpbml0ZWx5IG5lZWQgdGhlIGRlbGF5IGJlZm9yZSB0aGlzIHRvIGVuc3VyZSBh
IG1pbmltdW0gDQpyZXNldCBwdWxzZS4gSSdtIG9uIHRoZSBmZW5jZSBhYm91dCB0aGUgZGVsYXkg
YWZ0ZXIsIEkgZG9uJ3QgdGhpbmsgYW55IA0Kb2YgdGhlIGRldmljZXMgSSByZWd1bGFybHkgZGVh
bCB3aXRoIGhhdmUgYSBwYXJ0aWN1bGFyIHRpbWUgdGhleSBuZWVkIHRvIA0KYmUgb3V0IG9mIHJl
c2V0IGJlZm9yZSB5b3UgY2FuIHN0YXJ0IHRhbGtpbmcgdG8gdGhlbS4NCg0KPg0KPiBTb21lIGRl
bGF5IGFmdGVyIHRoZSBwdWxzZSBtaWdodCBhbHNvIGJlIG5lZWRlZCwgb2YgY291cnNlLg0KPg0K
PiBDaGVlcnMsDQo+IFBldGVyDQo+DQo+PiArCQl1c2xlZXBfcmFuZ2UocmVzZXRfdWRlbGF5LCBy
ZXNldF91ZGVsYXkgKyAxMCk7DQo+PiArCX0NCj4+ICsNCj4+ICAgCXJjID0gcmVxdWVzdF9pcnEo
ZHJ2X2RhdGEtPmlycSwgbXY2NHh4eF9pMmNfaW50ciwgMCwNCj4+ICAgCQkJIE1WNjRYWFhfSTJD
X0NUTFJfTkFNRSwgZHJ2X2RhdGEpOw0KPj4gICAJaWYgKHJjKSB7
