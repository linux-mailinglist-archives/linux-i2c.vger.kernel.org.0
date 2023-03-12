Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCF486B6ACD
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Mar 2023 20:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230333AbjCLTzr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 12 Mar 2023 15:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbjCLTzr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 12 Mar 2023 15:55:47 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9F5298D5
        for <linux-i2c@vger.kernel.org>; Sun, 12 Mar 2023 12:55:45 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1E5802C05F6;
        Mon, 13 Mar 2023 08:55:40 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1678650940;
        bh=D+CUjM6MWQg2jgZFYfQzXO9KbaVOzahqlxdZ2q8+aa8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=AGVVjeA/Zsw+suniN9qZ+9jQ73DLjExGZY0Ii3qE/7bSROcSjOaEaSKvJVEd9C5s2
         30OyQhqMaNbVLXoJlNXb3O2BYe5EC7yEZwabKQ1gjtjFshW/BdtaOrx0QtF+P9laCU
         iB8KoCetPcS/meYqTJ87vv/pqgFrf4FGBCybQAKwCoBiUq2bBzfF+Wp1NyDrQOodjj
         yDf2RB5f27qIFjPbI4gY1ITQrpgeWlnmjz+8KvvH8ARTbOLzUUJFKQg9X4CfCmHojA
         ENYLfet0DsrMj9gV9iIU2o/SjVEu2PpptxCzIpE/mGCINTm5+RHrEP5z7GPnebKSPx
         vTWe/sbA/o4Qg==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B640e2e3c0000>; Mon, 13 Mar 2023 08:55:40 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.47; Mon, 13 Mar 2023 08:55:39 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.047; Mon, 13 Mar 2023 08:55:39 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: Use of_property_read_bool() for boolean properties
Thread-Topic: [PATCH] i2c: Use of_property_read_bool() for boolean properties
Thread-Index: AQHZU184+9ZDm1nkmkaAFtLn1iMzBq72uJCA
Date:   Sun, 12 Mar 2023 19:55:39 +0000
Message-ID: <4621ec34-8778-26c6-ca97-ce72c81d7f77@alliedtelesis.co.nz>
References: <20230310144707.1542595-1-robh@kernel.org>
In-Reply-To: <20230310144707.1542595-1-robh@kernel.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <04295ECB1AD3C5409E3E2C2A3E0466FE@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GdlpYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=k__wU0fu6RkA:10 a=VwQbUJbxAAAA:8 a=62ntRvTiAAAA:8 a=dzFhf6wxAAAA:8 a=a5x3eAS3YDbR8-jfFowA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22 a=pToNdpNmrtiFLRE6bQ9Z:22 a=FELKlmNgCOxk8-i40lfh:22
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAxMS8wMy8yMyAwMzo0NywgUm9iIEhlcnJpbmcgd3JvdGU6DQo+IEl0IGlzIHByZWZlcnJl
ZCB0byB1c2UgdHlwZWQgcHJvcGVydHkgYWNjZXNzIGZ1bmN0aW9ucyAoaS5lLg0KPiBvZl9wcm9w
ZXJ0eV9yZWFkXzx0eXBlPiBmdW5jdGlvbnMpIHJhdGhlciB0aGFuIGxvdy1sZXZlbA0KPiBvZl9n
ZXRfcHJvcGVydHkvb2ZfZmluZF9wcm9wZXJ0eSBmdW5jdGlvbnMgZm9yIHJlYWRpbmcgcHJvcGVy
dGllcy4NCj4gQ29udmVydCByZWFkaW5nIGJvb2xlYW4gcHJvcGVydGllcyB0byB0byBvZl9wcm9w
ZXJ0eV9yZWFkX2Jvb2woKS4NCj4NCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhA
a2VybmVsLm9yZz4NCg0KRm9yIGkyYy1tcGMuYw0KDQpSZXZpZXdlZC1ieTogQ2hyaXMgUGFja2hh
bSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KDQo+IC0tLQ0KPiAgIGRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMgfCAyICstDQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1weGEuYyB8IDYgKystLS0tDQo+ICAgZHJpdmVycy9pMmMvaTJjLWNvcmUtb2YuYyAgICB8IDIg
Ky0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkN
Cj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMgYi9kcml2ZXJz
L2kyYy9idXNzZXMvaTJjLW1wYy5jDQo+IGluZGV4IDgxYWM5MmJiNGY2Zi4uYmVjMGM1ZGMyMGQx
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQo+ICsrKyBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMNCj4gQEAgLTg0Miw3ICs4NDIsNyBAQCBzdGF0aWMg
aW50IGZzbF9pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqb3ApDQo+ICAgCQlkYXRh
LT5zZXR1cChvcC0+ZGV2Lm9mX25vZGUsIGkyYywgY2xvY2spOw0KPiAgIAl9IGVsc2Ugew0KPiAg
IAkJLyogQmFja3dhcmRzIGNvbXBhdGliaWxpdHkgKi8NCj4gLQkJaWYgKG9mX2dldF9wcm9wZXJ0
eShvcC0+ZGV2Lm9mX25vZGUsICJkZnNyciIsIE5VTEwpKQ0KPiArCQlpZiAob2ZfcHJvcGVydHlf
cmVhZF9ib29sKG9wLT5kZXYub2Zfbm9kZSwgImRmc3JyIikpDQo+ICAgCQkJbXBjX2kyY19zZXR1
cF84eHh4KG9wLT5kZXYub2Zfbm9kZSwgaTJjLCBjbG9jayk7DQo+ICAgCX0NCj4gICANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcHhhLmMgYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLXB4YS5jDQo+IGluZGV4IGI2MDViNmU0M2NiOS4uZjlmYTUzMDg1NTZiIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLXB4YS5jDQo+ICsrKyBiL2RyaXZlcnMvaTJj
L2J1c3Nlcy9pMmMtcHhhLmMNCj4gQEAgLTEyNjEsMTAgKzEyNjEsOCBAQCBzdGF0aWMgaW50IGky
Y19weGFfcHJvYmVfZHQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgc3RydWN0IHB4YV9p
MmMgKmkyYywNCj4gICAJLyogRm9yIGRldmljZSB0cmVlIHdlIGFsd2F5cyB1c2UgdGhlIGR5bmFt
aWMgb3IgYWxpYXMtYXNzaWduZWQgSUQgKi8NCj4gICAJaTJjLT5odHRwOi8vc2Nhbm1haWwudHJ1
c3R3YXZlLmNvbS8/Yz0yMDk4OCZkPS1jS0w1RGg4UU1LMFAyS1BVTWhKeFVXSUhHeHJ3RXoyZ2dV
dEluWV9KQSZ1PWh0dHAlM2ElMmYlMmZhZGFwJTJlbnIgPSAtMTsNCj4gICANCj4gLQlpZiAob2Zf
Z2V0X3Byb3BlcnR5KG5wLCAibXJ2bCxpMmMtcG9sbGluZyIsIE5VTEwpKQ0KPiAtCQlpMmMtPnVz
ZV9waW8gPSAxOw0KPiAtCWlmIChvZl9nZXRfcHJvcGVydHkobnAsICJtcnZsLGkyYy1mYXN0LW1v
ZGUiLCBOVUxMKSkNCj4gLQkJaTJjLT5mYXN0X21vZGUgPSAxOw0KPiArCWkyYy0+dXNlX3BpbyA9
IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgIm1ydmwsaTJjLXBvbGxpbmciKTsNCj4gKwlpMmMt
PmZhc3RfbW9kZSA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgIm1ydmwsaTJjLWZhc3QtbW9k
ZSIpOw0KPiAgIA0KPiAgIAkqaTJjX3R5cGVzID0gKGVudW0gcHhhX2kyY190eXBlcykob2ZfaWQt
PmRhdGEpOw0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvaTJjLWNvcmUtb2YuYyBi
L2RyaXZlcnMvaTJjL2kyYy1jb3JlLW9mLmMNCj4gaW5kZXggYmNlNmI3OTZlMDRjLi5hYTkzNDY3
Nzg0YzIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLW9mLmMNCj4gKysrIGIv
ZHJpdmVycy9pMmMvaTJjLWNvcmUtb2YuYw0KPiBAQCAtNTUsNyArNTUsNyBAQCBpbnQgb2ZfaTJj
X2dldF9ib2FyZF9pbmZvKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZV9ub2RlICpu
b2RlLA0KPiAgIAlpZiAob2ZfcHJvcGVydHlfcmVhZF9ib29sKG5vZGUsICJob3N0LW5vdGlmeSIp
KQ0KPiAgIAkJaW5mby0+ZmxhZ3MgfD0gSTJDX0NMSUVOVF9IT1NUX05PVElGWTsNCj4gICANCj4g
LQlpZiAob2ZfZ2V0X3Byb3BlcnR5KG5vZGUsICJ3YWtldXAtc291cmNlIiwgTlVMTCkpDQo+ICsJ
aWYgKG9mX3Byb3BlcnR5X3JlYWRfYm9vbChub2RlLCAid2FrZXVwLXNvdXJjZSIpKQ0KPiAgIAkJ
aW5mby0+ZmxhZ3MgfD0gSTJDX0NMSUVOVF9XQUtFOw0KPiAgIA0KPiAgIAlyZXR1cm4gMDs=
