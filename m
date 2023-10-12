Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 071227C77DE
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Oct 2023 22:25:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442679AbjJLUZZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Oct 2023 16:25:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442277AbjJLUZZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 12 Oct 2023 16:25:25 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9477ABE
        for <linux-i2c@vger.kernel.org>; Thu, 12 Oct 2023 13:25:22 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 383C92C0276;
        Fri, 13 Oct 2023 09:25:19 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1697142319;
        bh=bGXRBGo24BCLP/H5KzYL77QZ41XEWlPwdQq4XcnRZOE=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=hjB+rx/2tBm28QZdKtD44OCs3t1k/7mgOq5HwnYVrKOUtFX8Wqc+3G/sHM4ldY6wT
         4gAnPq04NzB2mTAMl0QcIvxytuNKAGiClTc4Z8PtUlsvtGB7pzl1IueHWRSdUHPOdP
         w/dSnRjIKKN2yDRVloDFo2IQYdKDpVln2NOFb48dj5vpqf6/7wrIm6Tj3H0F6CIHza
         nhPxGpaLB7ZE9yB1FsPT7hNjRZrMWbKRHi9T1EqiXp+uLozYFHlLLQP1B0omVguqHi
         r7WEDDk2Dv32CjIlIkLXVO+D9VUz+itnGzxrYlX5cKrjGgGNPQTp3zwcZjo9jsnwoV
         tRbUW1lMtj6GQ==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B6528562f0001>; Fri, 13 Oct 2023 09:25:19 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8::76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Fri, 13 Oct 2023 09:25:18 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.037; Fri, 13 Oct 2023 09:25:18 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Andi Shyti <andi.shyti@kernel.org>
CC:     "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "pierre.gondois@arm.com" <pierre.gondois@arm.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] i2c: mv64xxx: add support for FSM based recovery
Thread-Topic: [PATCH v2 3/3] i2c: mv64xxx: add support for FSM based recovery
Thread-Index: AQHZ9+y6MiGlK+7sFkG4dtUSaik2ObBFx/eAgAACsAA=
Date:   Thu, 12 Oct 2023 20:25:18 +0000
Message-ID: <d8074039-27b0-40b7-9e67-10c459e2a5d6@alliedtelesis.co.nz>
References: <20231006003321.2100016-1-chris.packham@alliedtelesis.co.nz>
 <20231006003321.2100016-4-chris.packham@alliedtelesis.co.nz>
 <20231012201541.nzlxyjngm3d5asir@zenone.zhora.eu>
In-Reply-To: <20231012201541.nzlxyjngm3d5asir@zenone.zhora.eu>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <AF2702256CB38F4E961DA5B3DC803606@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=PchfyjaiVAwjaaGKlXQA:9 a=QEXdDO2ut3YA:10
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

DQpPbiAxMy8xMC8yMyAwOToxNSwgQW5kaSBTaHl0aSB3cm90ZToNCj4gSGkgQ2hyaXMsDQo+DQo+
IC4uLg0KPg0KPj4gK3N0YXRpYyBpbnQNCj4+ICttdjY0eHh4X2kyY19yZWNvdmVyX2J1cyhzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmFkYXApDQo+PiArew0KPj4gKwlzdHJ1Y3QgbXY2NHh4eF9pMmNfZGF0
YSAqZHJ2X2RhdGEgPSBpMmNfZ2V0X2FkYXBkYXRhKGFkYXApOw0KPj4gKwlpbnQgcmV0Ow0KPj4g
Kwl1MzIgdmFsOw0KPj4gKw0KPj4gKwlkZXZfZGJnKCZhZGFwLT5kZXYsICJUcnlpbmcgaTJjIGJ1
cyByZWNvdmVyeVxuIik7DQo+PiArCXdyaXRlbChNVjY0WFhYX0kyQ19VTlNUVUNLX1RSSUdHRVIs
IGRydl9kYXRhLT51bnN0dWNrX3JlZyk7DQo+PiArCXJldCA9IHJlYWRsX3BvbGxfdGltZW91dF9h
dG9taWMoZHJ2X2RhdGEtPnVuc3R1Y2tfcmVnLCB2YWwsDQo+PiArCQkJCQkhKHZhbCAmIE1WNjRY
WFhfSTJDX1VOU1RVQ0tfSU5QUk9HUkVTUyksDQo+PiArCQkJCQkxMCwgMTAwMCk7DQo+IG1tbWho
aC4uLiBzdGlsbCBhIGJpdCBza2VwdGljYWwgYWJvdXQgd2FpdGluZyAxMDAgdGltZXMgMTB1cyBp
bg0KPiBhdG9taWMuDQo+DQo+IEknbSBzdGlsbCBvZiB0aGUgb3BpbmlvbiB0aGF0IHRoaXMgc2hv
dWxkIHJ1biBpbiBhIHNlcGFyYXRlDQo+IHRocmVhZC4gQW55IGRpZmZlcmVudCBvcGluaW9uIGZy
b20gdGhlIG5ldHdvcms/DQo+DQo+IEJUVywgZmlyc3QgcXVlc3Rpb24sIGNvbnNpZGVyaW5nIHRo
YXQgeW91IGRlY3JlYXNlZCB0aGUgdGltZQ0KPiBjb25zaWRlcmFibHkuLi4gZG9lcyBpdCB3b3Jr
Pw0KWWVzIGl0IHN0aWxsIHdvcmtzLiBJdCBkaWQgc3RvcCB3b3JraW5nIHdpdGggYSByZWFsbHkg
bG93IHRpbWVvdXQgKDEwLCANCjEwMCkgYnV0IEkgZGlkbid0IGxvb2sgaGFyZCBmb3IgYW55dGhp
bmcgaW4tYmV0d2Vlbi4NCj4NCj4gQW5kaQ==
