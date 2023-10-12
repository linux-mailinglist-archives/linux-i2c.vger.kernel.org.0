Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3119D7C7842
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 22:55:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442919AbjJLUzw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 16:55:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442920AbjJLUzu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 16:55:50 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ACB4DD
        for <linux-i2c@vger.kernel.org>; Thu, 12 Oct 2023 13:55:48 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 18B572C0276;
        Fri, 13 Oct 2023 09:55:47 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1697144147;
        bh=afGf/ekp/+BiFhRA6dIQoU+1zIdLF/hdLKv9nMLUZP8=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=RNrYXny9qfH9AkwWpZHUp5+bKbQLwm5+nucH3TgmVH52EB5yVntX11jVLxvbDvt1q
         YAt5vjw3G4jcOu7Iq23ZXzkMNwso6g+7VQtpWP8SBOoaawX5xhD6iQTF4pZKRCIuma
         XyTO4HX3nAbqKl5yu1RjMPV+yaBhkkeNbdibFXk1UZA/4jW/Eft5eqxP1GdMduf6t9
         abclx89rY2FmtS1omtpOMqyIMl/8NTYZFbI/iM4XCKpbBYG8yx9ZElA+0Pu9N2dG7s
         bPDujPdf1smN5xi8zgpBt4VD5yG7mbqe1kYWBcvCVuY72e4aLAuHu7/+fXsm7uy+yH
         aZw+LTlNNqKnA==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B65285d530000>; Fri, 13 Oct 2023 09:55:47 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.37; Fri, 13 Oct 2023 09:55:46 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.48; Fri, 13 Oct 2023 09:55:46 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.037; Fri, 13 Oct 2023 09:55:46 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: mv64xxx: add reset-gpios property
Thread-Topic: [PATCH 1/2] dt-bindings: i2c: mv64xxx: add reset-gpios property
Thread-Index: AQHZ/MBi6XZX9Kqut0uImsVd7sO7BrBE69CAgADdsgA=
Date:   Thu, 12 Oct 2023 20:55:46 +0000
Message-ID: <993b78a0-81b6-4822-ac55-4ae9612e3f55@alliedtelesis.co.nz>
References: <20231012035838.2804064-1-chris.packham@alliedtelesis.co.nz>
 <20231012035838.2804064-2-chris.packham@alliedtelesis.co.nz>
 <cfc9b2cc-e0a8-4115-a7c5-a75654adb84a@linaro.org>
In-Reply-To: <cfc9b2cc-e0a8-4115-a7c5-a75654adb84a@linaro.org>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <85692065B7E2834BBD1D64626840E5CE@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=Ulsmse5NmTHuyaPRj18A:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgS3J5c3p0b2YsDQoNCihyZXNlbmQgYXMgcGxhaW4gdGV4dCkNCg0KT24gMTIvMTAvMjMgMjA6
NDIsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+IE9uIDEyLzEwLzIwMjMgMDU6NTgsIENo
cmlzIFBhY2toYW0gd3JvdGU6DQo+PiBBZGQgYSByZXNldC1ncGlvcyBwcm9wZXJ0eSB0byB0aGUg
bWFydmVsbCxtdjY0eHh4LWkyYyBiaW5kaW5nLg0KPiBXaHk/DQoNClNvcnJ5IGFib3V0IHRoYXQu
IEkgcHV0IGEgYmV0dGVyIGV4cGxhbmF0aW9uIGluIHRoZSBjb3JyZXNwb25kaW5nIGRyaXZlciAN
CmNoYW5nZSBidXQgdGhlbiBvdmVyLWVkaXRlZCB3aGVuIGRvaW5nIHRoZSBkZXZpY2UtdHJlZSBj
aGFuZ2UuIEknbGwgdHJ5IA0KYW5kIGV4cGxhaW4gdGhpbmdzIGEgYml0IGJldHRlciBpbiB2Mi4N
Cg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgUGFja2hhbTxjaHJpcy5wYWNraGFtQGFsbGllZHRl
bGVzaXMuY28ubno+DQo+PiAtLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4=
