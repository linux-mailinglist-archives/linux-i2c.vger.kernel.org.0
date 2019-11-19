Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 028D3102EF4
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Nov 2019 23:17:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727233AbfKSWRP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Nov 2019 17:17:15 -0500
Received: from mail-eopbgr00134.outbound.protection.outlook.com ([40.107.0.134]:4771
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726196AbfKSWRO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 Nov 2019 17:17:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gKl0mz9lsSR+5Nzx5nUQspNVnKqpvZvsp/uIQQARna7CwbjUf6PgFyh1hNF6f16JxoSvCUj1wuEwnyFGy5wlcPE1I7ppyfWV7P9YLmPTvuZphu58cKZd9deq74B6+peNmP3xmgBrSzQjmPkdyKPKy5fHRjZ/8KEjZUucpjg0XRh5vCqXfZm1oFM0M4ZJwjxEDGltqOL05ydzcXhyfPGBDD1EppE006oM2GZPzFbrkTH9noZNxHjP5uTK3XF1kCJGh+2Eo2bZ3hnhvjusCeYtFDbw8HylUO/AxA+ErYneLJQy/GLjE5H4z8D4GBzFfYEkE5Ac7Zqlhg/m5pUMD7kDCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6261hKsaPmBnWl/jAYODLSefshuuAhEcIiQocgLx8tk=;
 b=Ha6/j+1RAsFWEhWFEwZ4I8WDYeknn8s10YnwcMdJyOrUeadYDJqv9ihnpZ+vRuRMfXBd3+XTIMw83G6umBCGh1KQ7JPkNmjZrKeCpX5oVwOr+2ll8yqqSiBCFE3HExJVyF8eyhSdX1KsOwGjtxt/CXHmGZXbLa8JK38cY17AZYapdLWyca1bzkruQ8cg+lzuY+zpqCIxomkL979XlsMMsvHRDPrVtcKrfCzWjtnLhFFMbjbxvQlaEp9whdbdOFW4xf2ggTEN0pPBb+BHs/IqXYUPtMbZbLvuOht3DCZ080xSKfltW+pXbduFpkgHR8zn0jDJ5zksDpw0AbdDNXfrLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6261hKsaPmBnWl/jAYODLSefshuuAhEcIiQocgLx8tk=;
 b=ckSUHC1bG04SD8g8CX07KwsnR4FJkXXG5iob8Tig8P5U5ReIPMdbTpPWUpZFYpEpKvOCBgR5NJ2/y4dS0TGKRcRgYXhbH5xOzIKYTBu65M7WJPqGUBkFAMAiDp34qp3ULumNoSwl/oI9z0X1qJKTClEBszw3SR9gzJDhncuQpDo=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3580.eurprd02.prod.outlook.com (52.134.66.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Tue, 19 Nov 2019 22:17:07 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::477:9510:3e3:f8ca%7]) with mapi id 15.20.2474.015; Tue, 19 Nov 2019
 22:17:07 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [v5,2/3] i2c: mux: pca954x: support property idle-state
Thread-Topic: [v5,2/3] i2c: mux: pca954x: support property idle-state
Thread-Index: AQHViJBm+lcMepwMLU+ndX3u4pkJDaeTPQQA
Date:   Tue, 19 Nov 2019 22:17:07 +0000
Message-ID: <34f48838-be4f-57d6-c9fd-a8e0f6150129@axentia.se>
References: <20191022041152.3663-1-biwen.li@nxp.com>
 <20191022041152.3663-2-biwen.li@nxp.com>
In-Reply-To: <20191022041152.3663-2-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR0701CA0089.eurprd07.prod.outlook.com
 (2603:10a6:3:64::33) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dba1ad1e-3f4b-453f-dbad-08d76d3e36c6
x-ms-traffictypediagnostic: DB3PR0202MB3580:
x-microsoft-antispam-prvs: <DB3PR0202MB3580262C4CE9040BEEEA64AABC4C0@DB3PR0202MB3580.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 022649CC2C
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(366004)(39830400003)(346002)(136003)(51444003)(31014005)(189003)(199004)(6436002)(186003)(256004)(14444005)(54906003)(58126008)(4326008)(110136005)(6246003)(386003)(6506007)(102836004)(3846002)(6116002)(65956001)(65806001)(316002)(53546011)(36756003)(66066001)(81166006)(2906002)(81156014)(8936002)(8676002)(26005)(305945005)(2501003)(4001150100001)(7736002)(76176011)(52116002)(25786009)(14454004)(508600001)(476003)(229853002)(6486002)(446003)(99286004)(5660300002)(2616005)(11346002)(6512007)(71190400001)(86362001)(71200400001)(31696002)(66476007)(66946007)(31686004)(66556008)(64756008)(66446008)(486006);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3580;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JlHZqkpdoK+acr4fofOh4/qFYpkfD7TI6umpfzBR/YshO1jKMP3ukStjVT7T9Ar+3NrQmCsvjUbo6QjqPFiOFRtuPaMksijZypdZP+xmC+PylYVoQ+hBGxH3kZ9ZtSjF+oz4giFeWTEBQgNI4dc3y6yj2XOwwL+GdfVpUpdCihCOpENFMdLtXaK12FM2Gnb13Ia0BiuH40HNkDjdR1jo4Fu5gSsdPVyaSMeEW4ns4zpH0r3Ljd1eNdxjLoT0YCBbaU+jvjvFIq7EMaOHA4KKn0vL/0XEMrHEwlqThIq92o+hlrmiGUe1OFPW/gyiKLJNFsjACXyZk31uexMNEDA+Qy14p1q74Zer/xhOVHsLot/0VICc7MXsEpg/iHk90jAa6GEqJ8bZMbA66LWZlyd5UhP52Ih/TMx7g2mEltfqny8tyh02KstFTEfN01m5XHJO
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0BEE7C1AC42D94D9E836388A39F7571@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: dba1ad1e-3f4b-453f-dbad-08d76d3e36c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2019 22:17:07.2505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uahzkJ97fb32DvHdaO5YwCzXQpL6GK0I0Ibhfh57YqBM8hDRP9r68iZJP/HhgSnX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3580
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkhDQoNCkkgaGFkIGEgc2Vjb25kIHJlYWQgb2YgdGhpcyBwYXRjaCwgYW5kIGZvdW5kIGEgbmV3
IGlzc3VlLg0KDQpPbiAyMDE5LTEwLTIyIDA2OjExLCBCaXdlbiBMaSB3cm90ZToNCj4gVGhpcyBz
dXBwb3J0cyBwcm9wZXJ0eSBpZGxlLXN0YXRlLGlmIHByZXNlbnQsDQo+IG92ZXJyaWRlcyBpMmMt
bXV4LWlkbGUtZGlzY29ubmVjdC4NCj4gDQo+IE15IHVzZSBjYXNlczoNCj4gCS0gVXNlIHRoZSBw
cm9wZXJ0eSBpZGxlLXN0YXRlIHRvIGZpeA0KPiAJICBhbiBlcnJhdGEgb24gTFMyMDg1QVJEQiBh
bmQgTFMyMDg4QVJEQi4NCj4gCS0gRXJyYXRhIGlkOiBFLTAwMDEzKGJvYXJkIExTMjA4NUFSREIg
YW5kDQo+IAkgIExTMjA4OEFSREIgcmV2aXNpb24gb24gUmV2LkIsIFJldi5DIGFuZCBSZXYuRCku
DQo+IAktIEFib3V0IEUtMDAwMTM6DQo+IAkgIC0gRGVzY3JpcHRpb246IEkyQzEgYW5kIEkyQzMg
YnVzZXMNCj4gCSAgICBhcmUgbWlzc2luZyBwdWxsLXVwLg0KPiAJICAtIEltcGFjdDogV2hlbiB0
aGUgUENBOTU0eCBkZXZpY2UgaXMgdHJpLXN0YXRlZCwgdGhlIEkyQyBidXMNCj4gCSAgICB3aWxs
IGZsb2F0LiBUaGlzIG1ha2VzIHRoZSBJMkMgYnVzIGFuZCBpdHMgYXNzb2NpYXRlZA0KPiAJICAg
IGRvd25zdHJlYW0gZGV2aWNlcyBpbmFjY2Vzc2libGUuDQo+IAkgIC0gSGFyZHdhcmUgZml4OiBQ
b3B1bGF0ZSByZXNpc3RvcnMgUjE4OSBhbmQgUjE5MCBmb3IgSTJDMQ0KPiAJICAgIGFuZCByZXNp
c3RvcnMgUjIyOCBhbmQgUjIyOSBmb3IgSTJDMy4NCj4gCSAgLSBTb2Z0d2FyZSBmaXg6IFJlbW92
ZSB0aGUgdHJpLXN0YXRlIG9wdGlvbiBmcm9tIHRoZSBQQ0E5NTR4DQo+IAkgICAgZHJpdmVyKFBD
QTk1NHggYWx3YXlzIG9uIGVuYWJsZSBzdGF0dXMsIHNwZWNpZnkgYQ0KPiAJICAgIGNoYW5uZWwg
emVybyBpbiBkdHMgdG8gZml4IHRoZSBlcnJhdGEgRS0wMDAxMykuDQo+IA0KPiBTaWduZWQtb2Zm
LWJ5OiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4NCj4gLS0tDQo+IENoYW5nZSBpbiB2NToN
Cj4gCS0gYWRkIGV4dHJhIHByZWNhdXRpb24gZm9yIHBjYTk1NHhfaW5pdCAJDQo+IA0KPiBDaGFu
Z2UgaW4gdjQ6DQo+IAktIHJlbmFtZSBmdW5jdGlvbg0KPiAJICBwY2E5NTR4X2NhbGN1bGF0ZV9j
aGFuIC0+IHBjYTk1NHhfcmVndmFsDQo+IA0KPiBDaGFuZ2UgaW4gdjM6DQo+IAktIHVwZGF0ZSBz
dWJqZWN0IGFuZCBkZXNjcmlwdGlvbg0KPiAJLSBhZGQgYSBoZWxwZXIgZnVuY3Rpb24gcGNhOTU0
eF9jYWxjdWxhdGVfY2hhbigpDQo+IA0KPiBDaGFuZ2UgaW4gdjI6DQo+IAktIHVwZGF0ZSBzdWJq
ZWN0IGFuZCBkZXNjcmlwdGlvbg0KPiAJLSBhZGQgcHJvcGVydHkgaWRsZS1zdGF0ZQ0KPiANCj4g
IGRyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0eC5jIHwgNjcgKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspLCAyMyBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4
LXBjYTk1NHguYyBiL2RyaXZlcnMvaTJjL211eGVzL2kyYy1tdXgtcGNhOTU0eC5jDQo+IGluZGV4
IDkyM2FhM2E1YTNkYy4uMjE4YmExYTVlZDdlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2kyYy9t
dXhlcy9pMmMtbXV4LXBjYTk1NHguYw0KPiArKysgYi9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4
LXBjYTk1NHguYw0KPiBAQCAtODYsNyArODYsNyBAQCBzdHJ1Y3QgcGNhOTU0eCB7DQo+ICANCj4g
IAl1OCBsYXN0X2NoYW47CQkvKiBsYXN0IHJlZ2lzdGVyIHZhbHVlICovDQo+ICAJLyogTVVYX0lE
TEVfQVNfSVMsIE1VWF9JRExFX0RJU0NPTk5FQ1Qgb3IgPj0gMCBmb3IgY2hhbm5lbCAqLw0KPiAt
CXM4IGlkbGVfc3RhdGU7DQo+ICsJczMyIGlkbGVfc3RhdGU7DQo+ICANCj4gIAlzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50Ow0KPiAgDQo+IEBAIC0yMjksMjAgKzIyOSwyMyBAQCBzdGF0aWMgaW50
IHBjYTk1NHhfcmVnX3dyaXRlKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwNCj4gIAkJCQlJMkNf
U01CVVNfQllURSwgJmR1bW15KTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIHU4IHBjYTk1NHhfcmVn
dmFsKHN0cnVjdCBwY2E5NTR4ICpkYXRhLCB1OCBjaGFuKQ0KPiArew0KPiArCS8qIFdlIG1ha2Ug
c3dpdGNoZXMgbG9vayBsaWtlIG11eGVzLCBub3Qgc3VyZSBob3cgdG8gYmUgc21hcnRlci4gKi8N
Cj4gKwlpZiAoZGF0YS0+Y2hpcC0+bXV4dHlwZSA9PSBwY2E5NTR4X2lzbXV4KQ0KPiArCQlyZXR1
cm4gY2hhbiB8IGRhdGEtPmNoaXAtPmVuYWJsZTsNCj4gKwllbHNlDQo+ICsJCXJldHVybiAxIDw8
IGNoYW47DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBpbnQgcGNhOTU0eF9zZWxlY3RfY2hhbihzdHJ1
Y3QgaTJjX211eF9jb3JlICptdXhjLCB1MzIgY2hhbikNCj4gIHsNCj4gIAlzdHJ1Y3QgcGNhOTU0
eCAqZGF0YSA9IGkyY19tdXhfcHJpdihtdXhjKTsNCj4gIAlzdHJ1Y3QgaTJjX2NsaWVudCAqY2xp
ZW50ID0gZGF0YS0+Y2xpZW50Ow0KPiAtCWNvbnN0IHN0cnVjdCBjaGlwX2Rlc2MgKmNoaXAgPSBk
YXRhLT5jaGlwOw0KPiAgCXU4IHJlZ3ZhbDsNCj4gIAlpbnQgcmV0ID0gMDsNCj4gIA0KPiAtCS8q
IHdlIG1ha2Ugc3dpdGNoZXMgbG9vayBsaWtlIG11eGVzLCBub3Qgc3VyZSBob3cgdG8gYmUgc21h
cnRlciAqLw0KPiAtCWlmIChjaGlwLT5tdXh0eXBlID09IHBjYTk1NHhfaXNtdXgpDQo+IC0JCXJl
Z3ZhbCA9IGNoYW4gfCBjaGlwLT5lbmFibGU7DQo+IC0JZWxzZQ0KPiAtCQlyZWd2YWwgPSAxIDw8
IGNoYW47DQo+IC0NCj4gKwlyZWd2YWwgPSBwY2E5NTR4X3JlZ3ZhbChkYXRhLCBjaGFuKTsNCj4g
IAkvKiBPbmx5IHNlbGVjdCB0aGUgY2hhbm5lbCBpZiBpdHMgZGlmZmVyZW50IGZyb20gdGhlIGxh
c3QgY2hhbm5lbCAqLw0KPiAgCWlmIChkYXRhLT5sYXN0X2NoYW4gIT0gcmVndmFsKSB7DQo+ICAJ
CXJldCA9IHBjYTk1NHhfcmVnX3dyaXRlKG11eGMtPnBhcmVudCwgY2xpZW50LCByZWd2YWwpOw0K
PiBAQCAtMjU2LDcgKzI1OSw3IEBAIHN0YXRpYyBpbnQgcGNhOTU0eF9kZXNlbGVjdF9tdXgoc3Ry
dWN0IGkyY19tdXhfY29yZSAqbXV4YywgdTMyIGNoYW4pDQo+ICB7DQo+ICAJc3RydWN0IHBjYTk1
NHggKmRhdGEgPSBpMmNfbXV4X3ByaXYobXV4Yyk7DQo+ICAJc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCA9IGRhdGEtPmNsaWVudDsNCj4gLQlzOCBpZGxlX3N0YXRlOw0KPiArCXMzMiBpZGxlX3N0
YXRlOw0KPiAgDQo+ICAJaWRsZV9zdGF0ZSA9IFJFQURfT05DRShkYXRhLT5pZGxlX3N0YXRlKTsN
Cj4gIAlpZiAoaWRsZV9zdGF0ZSA+PSAwKQ0KPiBAQCAtNDAyLDYgKzQwNSwyNSBAQCBzdGF0aWMg
dm9pZCBwY2E5NTR4X2NsZWFudXAoc3RydWN0IGkyY19tdXhfY29yZSAqbXV4YykNCj4gIAlpMmNf
bXV4X2RlbF9hZGFwdGVycyhtdXhjKTsNCj4gIH0NCj4gIA0KPiArc3RhdGljIGludCBwY2E5NTR4
X2luaXQoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwgc3RydWN0IHBjYTk1NHggKmRhdGEpDQo+
ICt7DQo+ICsJaW50IHJldDsNCj4gKwlpZiAoZGF0YS0+aWRsZV9zdGF0ZSA+PSAwKSB7DQo+ICsJ
CWRhdGEtPmxhc3RfY2hhbiA9IHBjYTk1NHhfcmVndmFsKGRhdGEsIGRhdGEtPmlkbGVfc3RhdGUp
Ow0KPiArCX0gZWxzZSB7DQo+ICsJCS8qIERpc2Nvbm5lY3QgbXVsdGlwbGV4ZXIgKi8NCj4gKwkJ
ZGF0YS0+bGFzdF9jaGFuID0gMDsNCj4gKwl9DQo+ICsJcmV0ID0gaTJjX3NtYnVzX3dyaXRlX2J5
dGUoY2xpZW50LCBkYXRhLT5sYXN0X2NoYW4pOw0KPiArCWlmIChyZXQgPCAwKSB7DQo+ICsJCWRh
dGEtPmxhc3RfY2hhbiA9IDA7DQo+ICsJCWRldl9lcnIoJmNsaWVudC0+ZGV2LCAiZmFpbGVkIHRv
IHZlcmlmeSB0aGUgbXV4LCBcDQo+ICsJCQl0aGUgbXV4IG1heWJlIG5vdCBwcmVzZW50IGluIGZh
Y3RcbiIpOw0KDQpUaGlzIGRldl9lcnIgd2lsbCB0cmlnZ2VyIG9uIHByb2JlIGZhaWx1cmUsIHdo
aWNoIGFscmVhZHkgcHJpbnRzIGENCm1lc3NhZ2Ugb24gZmFpbHVyZS4gSWYgeW91IHRoaW5rIHlv
dSBuZWVkIGEgbWVzc2FnZSBpZiB0aGlzIGZhaWxzDQppbiByZXN1bWUsIEkgdGhpbmsgdGhhdCBt
ZXNzYWdlIG5lZWRzIHRvIGJlIHByaW50ZWQgaW4gcmVzdW1lDQppbnN0ZWFkIG9mIGhlcmUuIEJ1
dCB0aGUgbWVzc2FnZSBzZWVtcyB0YXJnZXRlZCBhdCB0aGUgcHJvYmUNCmZhaWx1cmUsIHdoaWNo
IGlzIGFuIGFyZ3VtZW50IGZvciBzaW1wbHkgcmVtb3ZpbmcgaXQuIEl0IGlzIGFsc28NCm5vdCBk
ZXNpcmFibGUgdG8gc3BsaXQgYSBzdHJpbmcgd2l0aCB0aGF0IHRlY2huaXF1ZS4gSXQncyBnZW5l
cmFsbHkNCmJldHRlciB0byAidXNlIHRoaXMgdGVjaG5pcXVlIHRvIGRvIHN0cmluZyBjb250aW51
YXRpb24gb24gYSBuZXciDQoibGluZS4iIEhvd2V2ZXIsIHNwbGl0dGluZyBzdHJpbmdzIG92ZXIg
bXVsdGlwbGUgbGluZXMgYXJlIGZyb3duZWQNCnVwb24gc2luY2UgaXQgYnJlYWtzIGdyZXBwaW5n
IGZvciB0aGUgZXJyb3IgbWVzc2FnZS4gVGhlIGxhbmd1YWdlDQppcyBhbHNvIGEgYml0IHN0cmFu
Z2UuDQoNCkFnYWluLCBzb3JyeSBmb3Igbm90IGJlaW5nIGFibGUgdG8gYmUgYXMgcmVzcG9uc2l2
ZSBhcyBJIHdvdWxkIGhhdmUNCmxpa2VkLCBhbmQgdGhhbmtzIGZvciB5b3VyIHBhdGllbmNlIQ0K
DQpDaGVlcnMsDQpQZXRlcg0KDQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4g
Kw0KPiAgLyoNCj4gICAqIEkyQyBpbml0L3Byb2JpbmcvZXhpdCBmdW5jdGlvbnMNCj4gICAqLw0K
PiBAQCAtNDExLDcgKzQzMyw2IEBAIHN0YXRpYyBpbnQgcGNhOTU0eF9wcm9iZShzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50LA0KPiAgCXN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCA9IGNsaWVudC0+
YWRhcHRlcjsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7DQo+ICAJc3Ry
dWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+b2Zfbm9kZTsNCj4gLQlib29sIGlkbGVfZGlzY29u
bmVjdF9kdDsNCj4gIAlzdHJ1Y3QgZ3Bpb19kZXNjICpncGlvOw0KPiAgCXN0cnVjdCBpMmNfbXV4
X2NvcmUgKm11eGM7DQo+ICAJc3RydWN0IHBjYTk1NHggKmRhdGE7DQo+IEBAIC00NjIsMjMgKzQ4
MywyNCBAQCBzdGF0aWMgaW50IHBjYTk1NHhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVu
dCwNCj4gIAkJfQ0KPiAgCX0NCj4gIA0KPiAtCS8qIFdyaXRlIHRoZSBtdXggcmVnaXN0ZXIgYXQg
YWRkciB0byB2ZXJpZnkNCj4gKwlkYXRhLT5pZGxlX3N0YXRlID0gTVVYX0lETEVfQVNfSVM7DQo+
ICsJaWYgKG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAiaWRsZS1zdGF0ZSIsICZkYXRhLT5pZGxl
X3N0YXRlKSkgew0KPiArCQlpZiAobnAgJiYgb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiaTJj
LW11eC1pZGxlLWRpc2Nvbm5lY3QiKSkNCj4gKwkJCWRhdGEtPmlkbGVfc3RhdGUgPSBNVVhfSURM
RV9ESVNDT05ORUNUOw0KPiArCX0NCj4gKw0KPiArCS8qDQo+ICsJICogV3JpdGUgdGhlIG11eCBy
ZWdpc3RlciBhdCBhZGRyIHRvIHZlcmlmeQ0KPiAgCSAqIHRoYXQgdGhlIG11eCBpcyBpbiBmYWN0
IHByZXNlbnQuIFRoaXMgYWxzbw0KPiAtCSAqIGluaXRpYWxpemVzIHRoZSBtdXggdG8gZGlzY29u
bmVjdGVkIHN0YXRlLg0KPiArCSAqIGluaXRpYWxpemVzIHRoZSBtdXggdG8gYSBjaGFubmVsDQo+
ICsJICogb3IgZGlzY29ubmVjdGVkIHN0YXRlLg0KPiAgCSAqLw0KPiAtCWlmIChpMmNfc21idXNf
d3JpdGVfYnl0ZShjbGllbnQsIDApIDwgMCkgew0KPiArCXJldCA9IHBjYTk1NHhfaW5pdChjbGll
bnQsIGRhdGEpOw0KPiArCWlmIChyZXQgPCAwKSB7DQo+ICAJCWRldl93YXJuKGRldiwgInByb2Jl
IGZhaWxlZFxuIik7DQo+ICAJCXJldHVybiAtRU5PREVWOw0KPiAgCX0NCj4gIA0KPiAtCWRhdGEt
Pmxhc3RfY2hhbiA9IDA7CQkgICAvKiBmb3JjZSB0aGUgZmlyc3Qgc2VsZWN0aW9uICovDQo+IC0J
ZGF0YS0+aWRsZV9zdGF0ZSA9IE1VWF9JRExFX0FTX0lTOw0KPiAtDQo+IC0JaWRsZV9kaXNjb25u
ZWN0X2R0ID0gbnAgJiYNCj4gLQkJb2ZfcHJvcGVydHlfcmVhZF9ib29sKG5wLCAiaTJjLW11eC1p
ZGxlLWRpc2Nvbm5lY3QiKTsNCj4gLQlpZiAoaWRsZV9kaXNjb25uZWN0X2R0KQ0KPiAtCQlkYXRh
LT5pZGxlX3N0YXRlID0gTVVYX0lETEVfRElTQ09OTkVDVDsNCj4gLQ0KPiAgCXJldCA9IHBjYTk1
NHhfaXJxX3NldHVwKG11eGMpOw0KPiAgCWlmIChyZXQpDQo+ICAJCWdvdG8gZmFpbF9jbGVhbnVw
Ow0KPiBAQCAtNTMxLDggKzU1Myw3IEBAIHN0YXRpYyBpbnQgcGNhOTU0eF9yZXN1bWUoc3RydWN0
IGRldmljZSAqZGV2KQ0KPiAgCXN0cnVjdCBpMmNfbXV4X2NvcmUgKm11eGMgPSBpMmNfZ2V0X2Ns
aWVudGRhdGEoY2xpZW50KTsNCj4gIAlzdHJ1Y3QgcGNhOTU0eCAqZGF0YSA9IGkyY19tdXhfcHJp
dihtdXhjKTsNCj4gIA0KPiAtCWRhdGEtPmxhc3RfY2hhbiA9IDA7DQo+IC0JcmV0dXJuIGkyY19z
bWJ1c193cml0ZV9ieXRlKGNsaWVudCwgMCk7DQo+ICsJcmV0dXJuIHBjYTk1NHhfaW5pdChjbGll
bnQsIGRhdGEpOw0KPiAgfQ0KPiAgI2VuZGlmDQo+ICANCj4gDQoNCg==
