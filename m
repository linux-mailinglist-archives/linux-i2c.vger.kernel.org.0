Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BFE47D5C38
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Oct 2023 22:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344301AbjJXUOB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Oct 2023 16:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344246AbjJXUOB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Oct 2023 16:14:01 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942BB10D7
        for <linux-i2c@vger.kernel.org>; Tue, 24 Oct 2023 13:13:58 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 62F5D2C0630;
        Wed, 25 Oct 2023 09:13:56 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1698178436;
        bh=rblvtLA85SZ5PGutT03BXnsamdXjHxQuoTmCtyr8kN0=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=SoPh22DqsLo19EKJvKSbefWTX1WZgFqhhK6n77/iqmTIolfAmBtX5SwgnIA4c4P2K
         RJKoSzPgVlIvaUO+4QDr7YlWy546RALXp7KZyLRbc+hHnCCc2/UNdBFCbJpOcxPk6a
         0wB0CfAGwh1LVdyqwASPtcL5bipBw0RwHxdIYWbWb/SaJSFE0EvaPesu0Kl+RMyqcX
         pwxsg1j28GszmCIs+nEPdatnTSLRJof5/SOO3SWB4OiZOrNieGrwCmupTDiNyzlEHz
         HCD1FcWhCYK3ABkptIxwxLBpvHiJUzd2x7CSFVg6e1iJi5vbIOEKCvxpN4gaUSo0JT
         zyJUZhhZpZ4dw==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653825840001>; Wed, 25 Oct 2023 09:13:56 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1118.39; Wed, 25 Oct 2023 09:13:56 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with Microsoft
 SMTP Server (TLS) id 15.0.1497.48; Wed, 25 Oct 2023 09:13:55 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.039; Wed, 25 Oct 2023 09:13:55 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/2] i2c: mv64xxx: add an optional reset-gpios property
Thread-Topic: [PATCH v3 2/2] i2c: mv64xxx: add an optional reset-gpios
 property
Thread-Index: AQHaAgcy5mKiozoBFUuv9b6R9rUkyLBYf5+AgAAPnoA=
Date:   Tue, 24 Oct 2023 20:13:55 +0000
Message-ID: <4b548124-d1d5-4746-a5bd-03757013282d@alliedtelesis.co.nz>
References: <20231018210805.1569987-1-chris.packham@alliedtelesis.co.nz>
 <20231018210805.1569987-3-chris.packham@alliedtelesis.co.nz>
 <20231024191801.kofb6cbczswp7xxn@zenone.zhora.eu>
In-Reply-To: <20231024191801.kofb6cbczswp7xxn@zenone.zhora.eu>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <EFB243D0527FEB4D94CD7B6F69E3B465@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=3z5DDspM-FWoKCHjgUUA:9 a=QEXdDO2ut3YA:10
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

DQpPbiAyNS8xMC8yMyAwODoxOCwgQW5kaSBTaHl0aSB3cm90ZToNCj4gSGkgQ2hyaXMsDQo+DQo+
IGFzIHlvdSBhcmUgd29ya2luZyBvbiB0aGUgdjQuLi4NCj4NCj4gLi4uDQo+DQo+PiArCWlmIChk
cnZfZGF0YS0+cmVzZXRfZ3Bpbykgew0KPj4gKwkJdXNsZWVwX3JhbmdlKHJlc2V0X2R1cmF0aW9u
LCByZXNldF9kdXJhdGlvbiArIDEwKTsNCj4gSSdtIG5vdCBhZ2FpbnN0IHRoaXMsIGJ1dCBpdCdz
IG5vdCBvcHRpbWFsIHVubGVzcyB3ZSBrbm93IG1vcmUgb3INCj4gbGVzcyB3aGF0IHRvIGV4cGVj
dCBmcm9tIHJlc2V0X2R1cmF0aW9uLg0KPg0KPiBEbyB3ZSBoYXZlIGEgcm91Z2ggaWRlYSBvZiB3
aGF0IHJlc2V0X2R1cmF0aW9uIGlzPyBJZiB3ZSBkb24ndA0KPiB0aGVuIHlvdSBjb3VsZCBjb25z
aWRlciB1c2luZyBhIGdlbmVyaWMgImZzbGVlcChyZXNldF9kdXJhdGlvbik7Ig0KPiBXb3VsZCBp
dCB3b3JrPw0KZmxzZWVwKCkgd291bGQgd29yayBmb3IgbWUuIEFsbCBvZiB0aGUgZGV2aWNlcyBJ
J20gdGVzdGluZyB3aXRoIHNlZW0gdG8gDQpiZSBmaW5lIHdpdGggYSB2ZXJ5IHNob3J0IHJlc2V0
IHB1bHNlLCB0aGV5J2QgcHJvYmFibHkgYmUgZmluZSB3aXRoIG5vIA0KZGVsYXkgYXQgYWxsLg0K
Pg0KPiBSZXN0IGxvb2tzIGdvb2QuDQo+DQo+IEFuZGk=
