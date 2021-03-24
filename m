Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E408347030
	for <lists+linux-i2c@lfdr.de>; Wed, 24 Mar 2021 04:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235069AbhCXDgt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 23:36:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235113AbhCXDgT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 23:36:19 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83374C061763
        for <linux-i2c@vger.kernel.org>; Tue, 23 Mar 2021 20:36:18 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A2A00891AF;
        Wed, 24 Mar 2021 16:36:14 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616556974;
        bh=I49K3YD6NHlH2qBa13eW2ZFKUP83cYW5CjpG3xy/dH4=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=VyHDjidGhiKIN5bJLQONjRd5ofbYTOO4Viz3lEfcMM+k+d8APlq9D/zQgyr5Qaxem
         L7MFlJU32mJYSfT7eENc/Fl/W1c6jl/C2LlzAXduXbR96g4VsadziLfN7PSo7QzRua
         r1Kx4+ABFCCMsmhIWmZLED+YVSG1LDiGdIEU6J18pM/xL/k5dkc9UM6eV4ATOg/CB/
         HXG0F4JC9Pr7FVAZr3D3khhb6vgKQbSo8tE/FJP423JgxK4inuKBDqrOkgl1l5kwLd
         UbUl87zWXS2UfO2UJkXraE2B83b2Mi8pC2GvbRXqu5X5bbNWEVv+O4UYtzxfApyoKs
         wm9wf/Uv0AxCw==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[2001:df5:b000:bc8::77]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B605ab3ae0001>; Wed, 24 Mar 2021 16:36:14 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) by
 svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8::77) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Wed, 24 Mar 2021 16:36:14 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1497.012; Wed, 24 Mar 2021 16:36:14 +1300
From:   Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To:     Rob Herring <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Thread-Topic: [PATCH 2/6] dt-bindings: i2c: convert i2c-mpc to json-schema
Thread-Index: AQHXH5233LnDPck5U0iG88OvYj8e5KqROi+AgAAMNQCAAF4fgA==
Date:   Wed, 24 Mar 2021 03:36:13 +0000
Message-ID: <00052125-3dc3-aad5-35df-957bc09a0840@alliedtelesis.co.nz>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
 <20210323043331.21878-3-chris.packham@alliedtelesis.co.nz>
 <20210323211539.GB1326908@robh.at.kernel.org>
 <7ef36459-e23a-64cd-e9e1-35fb6cb9279f@alliedtelesis.co.nz>
In-Reply-To: <7ef36459-e23a-64cd-e9e1-35fb6cb9279f@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA36D5CF4617A449BC7D4C379335296A@atlnz.lc>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=Xf/6aR1Nyvzi7BryhOrcLQ==:117 a=xqWC_Br6kY4A:10 a=oKJsc7D3gJEA:10 a=IkcTkHD0fZMA:10 a=dESyimp9J3IA:10 a=gEfo2CItAAAA:8 a=YU5wBylNl02igCwKOGgA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=RBBcRewTFc8P4JkPnay6:22
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQpPbiAyNC8wMy8yMSAxMDo1OSBhbSwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4NCj4gT24gMjQv
MDMvMjEgMTA6MTUgYW0sIFJvYiBIZXJyaW5nIHdyb3RlOg0KPj4gT24gVHVlLCBNYXIgMjMsIDIw
MjEgYXQgMDU6MzM6MjdQTSArMTMwMCwgQ2hyaXMgUGFja2hhbSB3cm90ZToNCj4+PiBDb252ZXJ0
IGkyYy1tcGMgdG8gWUFNTC4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IENocmlzIFBhY2toYW0g
PGNocmlzLnBhY2toYW1AYWxsaWVkdGVsZXNpcy5jby5uej4NCj4+PiAtLS0NCjxzbmlwPg0KPj4+
IC0tLSAvZGV2L251bGwNCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL2kyYy1tcGMueWFtbA0KPj4+IEBAIC0wLDAgKzEsOTkgQEANCj4+PiArIyBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+Pj4gKyVZ
QU1MIDEuMg0KPj4+ICstLS0NCj4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1h
cy9pMmMvaTJjLW1wYy55YW1sIw0KPj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcv
bWV0YS1zY2hlbWFzL2NvcmUueWFtbCMNCj4+PiArDQo+Pj4gK3RpdGxlOiBJMkMtQnVzIGFkYXB0
ZXIgZm9yIE1QQzgyNHgvODN4eC84NXh4Lzg2eHgvNTEyeC81Mnh4IFNvQ3MNCj4+PiArDQo+Pj4g
K21haW50YWluZXJzOg0KPj4+ICvCoCAtIENocmlzIFBhY2toYW0gPGNocmlzLnBhY2toYW1AYWxs
aWVkdGVsZXNpcy5jby5uej4NCj4+PiArDQo+Pj4gK2FsbE9mOg0KPj4+ICvCoCAtICRyZWY6IC9z
Y2hlbWFzL2kyYy9pMmMtY29udHJvbGxlci55YW1sIw0KPj4+ICsNCj4+PiArcHJvcGVydGllczoN
Cj4+PiArwqAgY29tcGF0aWJsZToNCj4+PiArwqDCoMKgIGFueU9mOg0KPj4+ICvCoMKgwqDCoMKg
IC0gaXRlbXM6DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIC0gZW51bToNCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgIC0gbXBjNTIwMC1pMmMNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZnNsLG1wYzUy
MDBiLWkyYw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBmc2wsbXBjNTIwMC1pMmMNCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgIC0gZnNsLG1wYzUxMjEtaTJjDQo+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoCAtIGZzbCxtcGM4MzEzLWkyYw0KPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqAgLSBmc2wsbXBj
ODU0My1pMmMNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgIC0gZnNsLG1wYzg1NDQtaTJjDQo+Pj4g
Kw0KPj4+ICvCoMKgwqDCoMKgwqDCoCAtIGNvbnN0OiBmc2wtaTJjDQo+Pj4gKw0KPj4+ICvCoMKg
wqDCoMKgIC0gY29udGFpbnM6DQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBjb25zdDogZnNsLWky
Yw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBtaW5JdGVtczogMQ0KPj4+ICvCoMKgwqDCoMKgwqDCoCBt
YXhJdGVtczogNA0KPj4gQ2FuJ3Qgd2UgZHJvcCB0aGlzIGFuZCBsaXN0IG91dCBhbnkgb3RoZXIg
Y29tcGF0aWJsZXM/DQo+DQo+IEknbSBzdHJ1Z2dsaW5nIGEgbGl0dGxlIGJpdCB3aXRoIGhvdyB0
byBnZXQgdGhlIHNjaGVtYSByaWdodCB0byBhbGxvdyANCj4gb25lIG9yIG1vcmUgb2YgYSBzZXQg
b2YgY29tcGF0aWJsZSB2YWx1ZXMuDQo+DQo+IEJhc2ljYWxseSBJIHdhbnQgdG8gYWxsb3cgJ2Nv
bXBhdGlibGUgPSAiZnNsLWkyYyI7JyBvciAnY29tcGF0aWJsZSA9IA0KPiAiZnNsLG1wYzg1NDQt
aTJjIiwgImZzbC1pMmMiOycgYnV0IGRpc2FsbG93ICdjb21wYXRpYmxlID0gImZvb2JhciIsIA0K
PiAiZnNsLWkyYyI7Jw0KDQpUaGlzIGlzIHdoYXQgSSd2ZSBlbmRlZCB1cCB3aXRoDQoNCnByb3Bl
cnRpZXM6DQpjb21wYXRpYmxlOg0Kb25lT2Y6DQogwqDCoMKgwqDCoCAtIGl0ZW1zOg0KIMKgwqDC
oMKgwqDCoMKgwqDCoCAtIGVudW06DQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBtcGM1
MjAwLWkyYw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZnNsLG1wYzUyMDAtaTJjDQog
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmc2wsbXBjNTEyMS1pMmMNCiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAtIGZzbCxtcGM4MzEzLWkyYw0KIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0gZnNsLG1wYzg1NDMtaTJjDQogwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBm
c2wsbXBjODU0NC1pMmMNCiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGZzbC1pMmMNCiDC
oMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogZnNsLWkyYw0KIMKgwqDCoMKgwqAgLSBpdGVtczoN
CiDCoMKgwqDCoMKgwqDCoMKgwqAgLSBjb25zdDogZnNsLG1wYzUyMDBiLWkyYw0KIMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGNvbnN0OiBmc2wsbXBjNTIwMC1pMmMNCiDCoMKgwqDCoMKgwqDCoMKgwqAg
LSBjb25zdDogZnNsLWkyYw0KDQpJdCBwYXNzZXMgYG1ha2UgZHRfYmluZGluZ19jaGVja2AgYW5k
IHJlamVjdHMgdGhpbmdzIHdoZW4gSSBhZGQgb3RoZXIgDQpub24tZG9jdW1lbnRlZCB2YWx1ZXMg
dG8gdGhlIGNvbXBhdGlibGUgcHJvcGVydHkuIEkgZGlkIHN0cnVnZ2xlIHdpdGggaXQgDQpzbyBJ
J20gbm90IGNvbmZpZGVudCBpdCdzIHRoZSBiZXN0IGFwcHJvYWNoIGJ1dCBpdCBzZWVtcyB0byB3
b3JrLg0K
