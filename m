Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79FD16FB926
	for <lists+linux-i2c@lfdr.de>; Mon,  8 May 2023 23:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbjEHVLT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 May 2023 17:11:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229486AbjEHVLS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 May 2023 17:11:18 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59CD96E82
        for <linux-i2c@vger.kernel.org>; Mon,  8 May 2023 14:11:16 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 1AC952C04A0;
        Tue,  9 May 2023 09:11:14 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1683580274;
        bh=YsYmxIj9Dclyo4XdUdv7usP57HgE99/u2Gp0lo1vFmw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=C+SE/6sihmbwYD6Ex03xmPokAbmRrFRP1ZBGt5piKrxy7FusJuGduxl2w4fOvml3p
         ZjHk5eF3XwXB9u+LI+3ylz26QgLxsvL085DjR3qs4jkCIhCg/ZeBwAMe8GY1xzErwR
         qO49z7z0Naj68BBNp/f/dRdA2arN+Jz2QbfNk6iE6P77uYuTTjxG+Qkl+2Par5cL/x
         RQLLpwLbpmrtnGh0ZrU6IJJn7n2/oMMac5haEem2015tkJFy/jfO3vs8+9a3sK12aT
         h24h5enQ7Hizh8t9njyv2TFiueb+wZABM1dLE9EjdFQ1D8XaMVtfcbd7upojV0AACO
         JUK+cIlqv1/Bg==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B645965720001>; Tue, 09 May 2023 09:11:14 +1200
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 9 May 2023 09:11:13 +1200
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.026; Tue, 9 May 2023 09:11:13 +1200
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>, Wolfram Sang <wsa@kernel.org>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: Re: [PATCH 40/89] i2c: mpc: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 40/89] i2c: mpc: Convert to platform remove callback
 returning void
Thread-Index: AQHZge8lCJVxyBzkfUe0/hsXvTXPpa9QFjSA
Date:   Mon, 8 May 2023 21:11:13 +0000
Message-ID: <9755367d-4026-dec4-3b0d-4a236fe25df9@alliedtelesis.co.nz>
References: <20230508205306.1474415-1-u.kleine-koenig@pengutronix.de>
 <20230508205306.1474415-41-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508205306.1474415-41-u.kleine-koenig@pengutronix.de>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0DFF2024225A8C4684470A30679C5DD4@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=VfuJw2h9 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=P0xRbXHiH_UA:10 a=lEpvV5nHEjJGK50ppeoA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgVXdlLA0KDQoodGh1bmRlcmJpcmQgZGVjaWRlZCB0byBzZW5kIG15IGZpcnN0IHJlcGx5IGFz
IGh0bWwuIEhvcGVmdWxseSB0aGlzIA0KbWFrZXMgaXQgYXMgcGxhaW4gdGV4dCkNCg0KT24gOS8w
NS8yMyAwODo1MiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IFRoZSAucmVtb3ZlKCkgY2Fs
bGJhY2sgZm9yIGEgcGxhdGZvcm0gZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzDQo+
IG1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBl
cnJvciBoYW5kbGluZyBieQ0KPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUg
dmFsdWUgcmV0dXJuZWQgaXMgKG1vc3RseSkgaWdub3JlZA0KPiBhbmQgdGhpcyB0eXBpY2FsbHkg
cmVzdWx0cyBpbiByZXNvdXJjZSBsZWFrcy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlzIGENCj4g
cXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmly
c3Qgc3RlcCBvZiB0aGlzDQo+IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJl
bW92ZV9uZXcoKSB3aGljaCBhbHJlYWR5IHJldHVybnMNCj4gdm9pZC4NCj4NCj4gVHJpdmlhbGx5
IGNvbnZlcnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJl
bW92ZQ0KPiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4NCj4gU2ln
bmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWc8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlPg0KUmV2aWV3ZWQtYnk6IENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxsaWVkdGVs
ZXNpcy5jby5uej4NCj4gLS0tDQo+ICAgZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tcGMuYyB8IDYg
KystLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMo
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMgYi9kcml2
ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQo+IGluZGV4IGNmZDA3NGVlNmQ1NC4uYTMwOGFmYjNj
Y2E1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLW1wYy5jDQo+ICsrKyBi
L2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtbXBjLmMNCj4gQEAgLTg5MCwxNSArODkwLDEzIEBAIHN0
YXRpYyBpbnQgZnNsX2kyY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvcCkNCj4gICAJ
cmV0dXJuIHJlc3VsdDsNCj4gICB9Ow0KPiAgIA0KPiAtc3RhdGljIGludCBmc2xfaTJjX3JlbW92
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpvcCkNCj4gK3N0YXRpYyB2b2lkIGZzbF9pMmNfcmVt
b3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKm9wKQ0KPiAgIHsNCj4gICAJc3RydWN0IG1wY19p
MmMgKmkyYyA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKG9wKTsNCj4gICANCj4gICAJaTJjX2RlbF9h
ZGFwdGVyKCZpMmMtPmFkYXApOw0KPiAgIA0KPiAgIAljbGtfZGlzYWJsZV91bnByZXBhcmUoaTJj
LT5jbGtfcGVyKTsNCj4gLQ0KPiAtCXJldHVybiAwOw0KPiAgIH07DQo+ICAgDQo+ICAgc3RhdGlj
IGludCBfX21heWJlX3VudXNlZCBtcGNfaTJjX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQ0K
PiBAQCAtOTU5LDcgKzk1Nyw3IEBAIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2YsIG1wY19pMmNfb2Zf
bWF0Y2gpOw0KPiAgIC8qIFN0cnVjdHVyZSBmb3IgYSBkZXZpY2UgZHJpdmVyICovDQo+ICAgc3Rh
dGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXBjX2kyY19kcml2ZXIgPSB7DQo+ICAgCS5wcm9i
ZQkJPSBmc2xfaTJjX3Byb2JlLA0KPiAtCS5yZW1vdmUJCT0gZnNsX2kyY19yZW1vdmUsDQo+ICsJ
LnJlbW92ZV9uZXcJPSBmc2xfaTJjX3JlbW92ZSwNCj4gICAJLmRyaXZlciA9IHsNCj4gICAJCS5u
YW1lID0gRFJWX05BTUUsDQo+ICAgCQkub2ZfbWF0Y2hfdGFibGUgPSBtcGNfaTJjX29mX21hdGNo
LA==
