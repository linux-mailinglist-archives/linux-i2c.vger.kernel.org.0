Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E87277D02A4
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Oct 2023 21:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346573AbjJSTld (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Oct 2023 15:41:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346568AbjJSTlc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Oct 2023 15:41:32 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E384CA
        for <linux-i2c@vger.kernel.org>; Thu, 19 Oct 2023 12:41:29 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4C0C02C0733;
        Fri, 20 Oct 2023 08:41:27 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1697744487;
        bh=k9X51xVsFNHIlzccLEHxrW4VGA/3GPxE2dX7wBCdsFk=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=lTPRrjGFgbvHx0c1+n1KjoMogHxJYg0pe0G4Qrtoq/zhFeDQPQd2nIMrCJhaSLCL7
         K/9fP9pZ4fEfGxkBhYCZa4Q+gF9BDI5QJZv58DFtA4iUXHdWVO9SRksAg3LM2Q4CSO
         9OzUxkXF6IzqSzuZVQWw5nNtlHxOlwRBDHah/wtuY+wzM+f15UjSyIaAnkcMaEgyg6
         Raf7dX32t2edISCMndzMNlPWf5Tzk7GWlLzQSspWam6nP1faWPYXJPeQXX3ZrPMdjV
         HebKq7wJ5MAUPoTmzEycjjWSgX0n3CPQs1gXSe+6lzLUOcGBSvCkHadOxzxnPDgTmy
         44mM126HgFcww==
Received: from svr-chch-ex2.atlnz.lc (Not Verified[2001:df5:b000:bc8::76]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B653186670001>; Fri, 20 Oct 2023 08:41:27 +1300
Received: from svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) by
 svr-chch-ex2.atlnz.lc (2001:df5:b000:bc8:f753:6de:11c0:a008) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Fri, 20 Oct 2023 08:41:27 +1300
Received: from svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567]) by
 svr-chch-ex2.atlnz.lc ([fe80::a9eb:c9b7:8b52:9567%15]) with mapi id
 15.02.1118.037; Fri, 20 Oct 2023 08:41:26 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "pierre.gondois@arm.com" <pierre.gondois@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: marvell: AC5: use I2C unstuck function
Thread-Topic: [PATCH v2 2/3] arm64: dts: marvell: AC5: use I2C unstuck
 function
Thread-Index: AQHZ9+y534keUpgCdEywg20EPufKTLBQaoWAgABUMgA=
Date:   Thu, 19 Oct 2023 19:41:26 +0000
Message-ID: <1d43b7be-94f4-4d29-a4b0-b5b651c4b70a@alliedtelesis.co.nz>
References: <20231006003321.2100016-1-chris.packham@alliedtelesis.co.nz>
 <20231006003321.2100016-3-chris.packham@alliedtelesis.co.nz>
 <87a5sead6i.fsf@BL-laptop>
In-Reply-To: <87a5sead6i.fsf@BL-laptop>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.33.22.30]
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8420570C3E11340A693E430DD2182B9@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=L6ZjvNb8 c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=75chYTbOgJ0A:10 a=IkcTkHD0fZMA:10 a=bhdUkHdE2iEA:10 a=SQ9JNEmy3hBT6fU4eLAA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAyMC8xMC8yMyAwMzo0MCwgR3JlZ29yeSBDTEVNRU5UIHdyb3RlOg0KPiBIZWxsbyBDaHJp
cywNCj4NCj4+IFRoZSBBQzUgU29DIHN1cHBvcnRzIHVzaW5nIGEgY29udHJvbGxlciBiYXNlZCBJ
MkMgdW5zdHVjayBmdW5jdGlvbiBmb3INCj4+IHJlY292ZXJ5LiBVc2UgdGhpcyBpbnN0ZWFkIG9m
IHRoZSBnZW5lcmljIEdQSU8gcmVjb3ZlcnkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXMg
UGFja2hhbSA8Y2hyaXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56Pg0KPj4gLS0tDQo+PiAg
IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWFydmVsbC9hYzUtOThkeDI1eHguZHRzaSB8IDE0ICsrKyst
LS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0
aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwv
YWM1LTk4ZHgyNXh4LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvYWM1LTk4ZHgy
NXh4LmR0c2kNCj4+IGluZGV4IGM5Y2UxMDEwYzQxNS4uZTUyZDNjMzQ5NmQ1IDEwMDY0NA0KPj4g
LS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9tYXJ2ZWxsL2FjNS05OGR4MjV4eC5kdHNpDQo+PiAr
KysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21hcnZlbGwvYWM1LTk4ZHgyNXh4LmR0c2kNCj4+IEBA
IC0xMzcsNyArMTM3LDcgQEAgbWRpbzogbWRpb0AyMjAwNCB7DQo+PiAgIA0KPj4gICAJCQlpMmMw
OiBpMmNAMTEwMDB7DQo+PiAgIAkJCQljb21wYXRpYmxlID0gIm1hcnZlbGwsbXY3ODIzMC1pMmMi
Ow0KPj4gLQkJCQlyZWcgPSA8MHgxMTAwMCAweDIwPjsNCj4+ICsJCQkJcmVnID0gPDB4MTEwMDAg
MHgyMD4sIDwweDExMGEwIDB4ND47DQo+PiAgIAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+
ICAgCQkJCSNzaXplLWNlbGxzID0gPDA+Ow0KPj4gICANCj4+IEBAIC0xNDYsMTcgKzE0NiwxNCBA
QCBpMmMwOiBpMmNAMTEwMDB7DQo+PiAgIAkJCQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgODcgSVJR
X1RZUEVfTEVWRUxfSElHSD47DQo+PiAgIAkJCQljbG9jay1mcmVxdWVuY3k9PDEwMDAwMD47DQo+
PiAgIA0KPj4gLQkJCQlwaW5jdHJsLW5hbWVzID0gImRlZmF1bHQiLCAiZ3BpbyI7DQo+PiArCQkJ
CXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7DQo+PiAgIAkJCQlwaW5jdHJsLTAgPSA8JmkyYzBf
cGlucz47DQo+PiAtCQkJCXBpbmN0cmwtMSA9IDwmaTJjMF9ncGlvPjsNCj4+IC0JCQkJc2NsLWdw
aW9zID0gPCZncGlvMCAyNiAoR1BJT19BQ1RJVkVfSElHSCB8IEdQSU9fT1BFTl9EUkFJTik+Ow0K
Pj4gLQkJCQlzZGEtZ3Bpb3MgPSA8JmdwaW8wIDI3IChHUElPX0FDVElWRV9ISUdIIHwgR1BJT19P
UEVOX0RSQUlOKT47DQo+IEJ5IGRvaW5nIHRoaXMgdGhlbiBvbGRlciBrZXJuZWwgd29uJ3QgYmUg
YWJsZSB0byBkbyByZWNvdmVyeSwgd2hpbGUgaWYNCj4geW91IGtlZXAgaXQsIHRoZSBuZXcga2Vy
bmVscyB3aWxsIHN0aWxsIHVzZSBuZXcgd2F5IHRvIHN1cHBvcnQgcmVjb3ZlcnkNCj4gdGhhbmtz
IHRvIHRoZSBuZXcgcmVnIGZpbGVkIGFkZGVkIGFuZCBvbGQga2VybmVscyB3aWxsIGNvbnRpbnVl
IHRvIHdvcmsuDQo+DQo+IEhvd2V2ZXIsIHdoYXQgd2UgdHJ5IHRvIG1haW50YWluIGlzIHJ1bm5p
bmcgbmV3IGtlcm5lbCBvbiBvbGQgZHRiIG5vdA0KPiB0aGUgb3Bwb3NpdGUgd2hpY2ggaXMganVz
dCBhIG5pY2UgdG8gaGF2ZS4gQXQgdGhlIGVuZCBpdCBpcyB1cCB0byB5b3UsDQo+IGlmIHlvdSBy
ZWFsbHkgd2FudCB0byByZW1vdmUgdGhpcyBjaHVuayBJIHdpbGwgYXBwbHkgaXQgb25jZSB0aGUg
ZHJpdmVyDQo+IHBhcnQgb2YgdGhlIHNlcmllcyB3aWxsIGJlIGFjY2VwdGVkLg0KDQpUaGUgR1BJ
TyByZWNvdmVyeSB0cmlnZ2VycyBhbiBFcnJhdHVtIHdoZXJlIHRoZSBTb0MgbG9ja3MgdXAgc28g
SSdkIA0KcHJlZmVyIHRvIHNlZSBpdCBnb25lIChiYXNpY2FsbHkgYSB2ZXJzaW9uIG9mIHRoYXQg
b2ZmbG9hZCBFcnJhdHVtIGZyb20gDQp0aGUgZWFybHkgQXJtYWRhLVhQcykuDQoNCkkgdGhpbmsg
aXQncyBhbGwgYWNhZGVtaWMgYmVjYXVzZSBJJ20gcHJldHR5IHN1cmUgSSdtIHRoZSBvbmx5IG9u
ZSANCmFjdHVhbGx5IHJ1bm5pbmcgYW4gdXBzdHJlYW0ga2VybmVsIG9uIHRoZSBBQzVYLiBNYXJ2
ZWxsIHN0aWxsIHNoaXAgYSANCmhvcnJpYmx5IG91dCBvZiBkYXRlIGZvcmsgaW4gdGhlaXIgb2Zm
aWNpYWwgU0RLLg0KDQo+DQo+IEdyZWdvcnkNCj4NCj4NCj4+ICAgCQkJCXN0YXR1cyA9ICJkaXNh
YmxlZCI7DQo+PiAgIAkJCX07DQo+PiAgIA0KPj4gICAJCQlpMmMxOiBpMmNAMTExMDB7DQo+PiAg
IAkJCQljb21wYXRpYmxlID0gIm1hcnZlbGwsbXY3ODIzMC1pMmMiOw0KPj4gLQkJCQlyZWcgPSA8
MHgxMTEwMCAweDIwPjsNCj4+ICsJCQkJcmVnID0gPDB4MTExMDAgMHgyMD4sIDwweDExMGE0IDB4
ND47DQo+PiAgIAkJCQkjYWRkcmVzcy1jZWxscyA9IDwxPjsNCj4+ICAgCQkJCSNzaXplLWNlbGxz
ID0gPDA+Ow0KPj4gICANCj4+IEBAIC0xNjUsMTEgKzE2Miw4IEBAIGkyYzE6IGkyY0AxMTEwMHsN
Cj4+ICAgCQkJCWludGVycnVwdHMgPSA8R0lDX1NQSSA4OCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsN
Cj4+ICAgCQkJCWNsb2NrLWZyZXF1ZW5jeT08MTAwMDAwPjsNCj4+ICAgDQo+PiAtCQkJCXBpbmN0
cmwtbmFtZXMgPSAiZGVmYXVsdCIsICJncGlvIjsNCj4+ICsJCQkJcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsNCj4+ICAgCQkJCXBpbmN0cmwtMCA9IDwmaTJjMV9waW5zPjsNCj4+IC0JCQkJcGlu
Y3RybC0xID0gPCZpMmMxX2dwaW8+Ow0KPj4gLQkJCQlzY2wtZ3Bpb3MgPSA8JmdwaW8wIDIwIChH
UElPX0FDVElWRV9ISUdIIHwgR1BJT19PUEVOX0RSQUlOKT47DQo+PiAtCQkJCXNkYS1ncGlvcyA9
IDwmZ3BpbzAgMjEgKEdQSU9fQUNUSVZFX0hJR0ggfCBHUElPX09QRU5fRFJBSU4pPjsNCj4+ICAg
CQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7DQo+PiAgIAkJCX07DQo+PiAgIA0KPj4gLS0gDQo+PiAy
LjQyLjANCj4+
