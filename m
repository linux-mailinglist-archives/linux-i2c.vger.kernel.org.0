Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6FEDED5C
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 15:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728922AbfJUNVG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 09:21:06 -0400
Received: from mail-eopbgr70139.outbound.protection.outlook.com ([40.107.7.139]:1774
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728753AbfJUNVF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Oct 2019 09:21:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USz7txnVNxpWhxGcmem3YVJOSF0AK8XL86C7tbfvj19gOAxOWcOwNCt4g2ujFZsdWOq/HVbhTrmeBl2hYTqOuk6ecx5cQOqAfZOhPmPYnwQ+RUF85xrP2e4AbkNBdjvdxYgE25UUE71ZieiO36wM1V39hJsHFsWuIf0Jml0VgUfaMJTxjrPkjhLJtkgZ6mGoT+T0cHH1yRgGWJrQ9CbOvXArmqqwLA/DQQ0rBN4/ApD8yzy/sjFXHmwb2BBnuvZ1gOTwB459z/wcuP7k98j6mOTtOyOgPvM+RsmTpP8rizlopTtk8vIwoqiQZ4w9rJfKZDsZummUniEbhqCRwUV81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0le0XmMCz2FDWL9z2VMi85Nf/kGhO+Ofknp32/NLmY=;
 b=libwt47TdhoPkE7UB0EU5h2UU9UyuO+0059HBezsF9eIAg9CNNKRGXUlhgLA5r1K8SuiAYpYpcB3fpo6gKmrGF5xGAiLTZzC+CxnDjMLiYapVGhWrhNEuXYREJNZPrMd4UY/22m1ihvXjgojOyh5nf0ZzlzkjJv+9uUYo4vwdbklU+ReqwbwyMASpdPwCzBrHdResk4fgU1hWNpxPn5T64Wti9Sxi+k9EG+OXzu6Tpo03LWRixa3eAz7638oS4KS32i77uGYqzNlto5+wh8Ifw4b32LFt5BIfCrmmYGi3S7sbdfAdHiOSJGjNXF+laHNXFVX9wuVufye0+7l/iGrmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I0le0XmMCz2FDWL9z2VMi85Nf/kGhO+Ofknp32/NLmY=;
 b=cfSL4qBLOXSrorI8Vl9EPck95Zvhq7NeGLoEWeNnXWhYAVljXhyH5mM/E3nOmMrAoLAfuQfqdlih/duCobx8tEN6ABLg1BvJLfnU7kNN+Gva/uXWYADDZDuMBg0nvIrZt9U/cQt8eaGNCCTquvA/fCEw607kPaH+M5v6IzXEaFw=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3403.eurprd02.prod.outlook.com (52.134.71.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 21 Oct 2019 13:20:58 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.029; Mon, 21 Oct 2019
 13:20:58 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [v4,2/2] i2c: mux: pca954x: support property idle-state
Thread-Topic: [v4,2/2] i2c: mux: pca954x: support property idle-state
Thread-Index: AQHVh+cyjaomJenpPUeREnQ0DR7+C6dlFOwA
Date:   Mon, 21 Oct 2019 13:20:58 +0000
Message-ID: <07b1e1d8-4112-d9b1-2a05-21da09fa020c@axentia.se>
References: <20191021080048.47189-1-biwen.li@nxp.com>
 <20191021080048.47189-2-biwen.li@nxp.com>
In-Reply-To: <20191021080048.47189-2-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR09CA0074.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::18) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 64408f06-f603-4281-0dd8-08d756298294
x-ms-traffictypediagnostic: DB3PR0202MB3403:
x-microsoft-antispam-prvs: <DB3PR0202MB3403521D3CFB1B391E23205ABC690@DB3PR0202MB3403.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0197AFBD92
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(39830400003)(346002)(366004)(396003)(199004)(189003)(64756008)(3846002)(66556008)(66476007)(229853002)(6116002)(14454004)(71190400001)(71200400001)(6486002)(81166006)(81156014)(8676002)(76176011)(52116002)(99286004)(6246003)(4326008)(2501003)(36756003)(6436002)(508600001)(66946007)(66446008)(4001150100001)(256004)(14444005)(25786009)(54906003)(486006)(86362001)(8936002)(186003)(31696002)(2906002)(102836004)(6506007)(5660300002)(476003)(2616005)(58126008)(66066001)(65956001)(65806001)(26005)(446003)(316002)(53546011)(386003)(7736002)(6512007)(31686004)(305945005)(110136005)(11346002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3403;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Nm4b/zGc1Fcsac402X0m5QKlZ0OFEmmk2Ka8FLmDl5HAzRklUv6Fb+I8JSq/EnFHme8NK7K6DwnPZUKtB4KVxwp1Y+Euk1gEkO3iht8dlqhtdaUj9ccFRW90Xy7oTq+dO30545ev1ynztr7wLpcsmuvgIRjTrdM30rC3RA6DkeiQhcU/xaVEPNMKgEGT4bSFzdzZM8yrzSHdqL+1AFdrfoU+HGbYyWIzuVK5Yck/U/niHn9ZuwhwTm0gIVVPdxRxNxi8sburNhJHkTrxiag+p0Bgl6uqtwzc4SsDDt/2AVKudk3Au/FNRCt+YZisdQu+lMvHDO1XhBFXXU5J+EqA3gwrmv+GjYMZlzrAodtvzjttrBko1T1wWlwqDYy04eoZc2Ct6Qg6r4guKPdqpxd6mlzZxGE1U8bBPN0v+XRCfY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <93F84E40E2746042ADF351B71338A870@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 64408f06-f603-4281-0dd8-08d756298294
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2019 13:20:58.2652
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UnoshOIgmy6VrDVeKYZZehuK68G2PED61IfKQr7UHNOUCBInCcyWSIC+4RdCFtkb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3403
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMC0yMSAxMDowMCwgQml3ZW4gTGkgd3JvdGU6DQo+IFRoaXMgc3VwcG9ydHMgcHJv
cGVydHkgaWRsZS1zdGF0ZQ0KPiANCg0KWW91IHNob3VsZCBleHBhbmQgdGhpcyBhIGxpdHRsZSBi
aXQgdG8gZXhwbGFpbiB0aGF0IGlkbGUtc3RhdGUsIGlmIHByZXNlbnQsDQpvdmVycmlkZXMgaTJj
LW11eC1pZGxlLWRpc2Nvbm5lY3QuIFlvdSBjb3VsZCBhbHNvIG1lbnRpb24geW91ciB1c2UgY2Fz
ZQ0Kd2hlcmUgeW91IG5lZWQgdG8gYXZvaWQgZGlzY29ubmVjdHMgb24gcHJvYmUvcmVzdW1lLg0K
DQo+IFNpZ25lZC1vZmYtYnk6IEJpd2VuIExpIDxiaXdlbi5saUBueHAuY29tPg0KPiAtLS0NCj4g
Q2hhbmdlIGluIHY0Og0KPiAJLSByZW5hbWUgZnVuY3Rpb24NCj4gCSAgcGNhOTU0eF9jYWxjdWxh
dGVfY2hhbiAtPiBwY2E5NTR4X3JlZ3ZhbA0KPiANCj4gQ2hhbmdlIGluIHYzOg0KPiAJLSB1cGRh
dGUgc3ViamVjdCBhbmQgZGVzY3JpcHRpb24NCj4gCS0gYWRkIGEgaGVscGVyIGZ1bmN0aW9uIHBj
YTk1NHhfY2FsY3VsYXRlX2NoYW4oKQ0KPiANCj4gQ2hhbmdlIGluIHYyOg0KPiAJLSB1cGRhdGUg
c3ViamVjdCBhbmQgZGVzY3JpcHRpb24NCj4gCS0gYWRkIHByb3BlcnR5IGlkbGUtc3RhdGUNCj4g
DQo+ICBkcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYyB8IDU5ICsrKysrKysrKysr
KysrKysrKy0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwg
MjMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvbXV4ZXMvaTJj
LW11eC1wY2E5NTR4LmMgYi9kcml2ZXJzL2kyYy9tdXhlcy9pMmMtbXV4LXBjYTk1NHguYw0KPiBp
bmRleCA5MjNhYTNhNWEzZGMuLmU1NjZjNGNkOGJhNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9p
MmMvbXV4ZXMvaTJjLW11eC1wY2E5NTR4LmMNCj4gKysrIGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJj
LW11eC1wY2E5NTR4LmMNCj4gQEAgLTg2LDcgKzg2LDcgQEAgc3RydWN0IHBjYTk1NHggew0KPiAg
DQo+ICAJdTggbGFzdF9jaGFuOwkJLyogbGFzdCByZWdpc3RlciB2YWx1ZSAqLw0KPiAgCS8qIE1V
WF9JRExFX0FTX0lTLCBNVVhfSURMRV9ESVNDT05ORUNUIG9yID49IDAgZm9yIGNoYW5uZWwgKi8N
Cj4gLQlzOCBpZGxlX3N0YXRlOw0KPiArCXMzMiBpZGxlX3N0YXRlOw0KPiAgDQo+ICAJc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudDsNCj4gIA0KPiBAQCAtMjI5LDIwICsyMjksMjMgQEAgc3RhdGlj
IGludCBwY2E5NTR4X3JlZ193cml0ZShzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsDQo+ICAJCQkJ
STJDX1NNQlVTX0JZVEUsICZkdW1teSk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyB1OCBwY2E5NTR4
X3JlZ3ZhbChzdHJ1Y3QgcGNhOTU0eCAqZGF0YSwgdTggY2hhbikNCj4gK3sNCj4gKwkvKiB3ZSBt
YWtlIHN3aXRjaGVzIGxvb2sgbGlrZSBtdXhlcywgbm90IHN1cmUgaG93IHRvIGJlIHNtYXJ0ZXIg
Ki8NCg0KSSBrbm93IHlvdSBhcmUganVzdCBtb3ZpbmcgdGhlIGNvbW1lbnQgYXJvdW5kLCBidXQg
cGxlYXNlIGZpeCB0aGUgc2VudGVuY2UNCnRvIHN0YXJ0IHdpdGggYSBjYXBpdGFsIGxldHRlciBh
bmQgZW5kIHdpdGggYSBwZXJpb2QuIFNvcnJ5IEkgZGlkbid0DQpjYXRjaCB0aGlzIGluIHYzLg0K
DQo+ICsJaWYgKGRhdGEtPmNoaXAtPm11eHR5cGUgPT0gcGNhOTU0eF9pc211eCkNCj4gKwkJcmV0
dXJuIGNoYW4gfCBkYXRhLT5jaGlwLT5lbmFibGU7DQo+ICsJZWxzZQ0KPiArCQlyZXR1cm4gMSA8
PCBjaGFuOw0KPiArfQ0KPiArDQo+ICBzdGF0aWMgaW50IHBjYTk1NHhfc2VsZWN0X2NoYW4oc3Ry
dWN0IGkyY19tdXhfY29yZSAqbXV4YywgdTMyIGNoYW4pDQo+ICB7DQo+ICAJc3RydWN0IHBjYTk1
NHggKmRhdGEgPSBpMmNfbXV4X3ByaXYobXV4Yyk7DQo+ICAJc3RydWN0IGkyY19jbGllbnQgKmNs
aWVudCA9IGRhdGEtPmNsaWVudDsNCj4gLQljb25zdCBzdHJ1Y3QgY2hpcF9kZXNjICpjaGlwID0g
ZGF0YS0+Y2hpcDsNCj4gIAl1OCByZWd2YWw7DQo+ICAJaW50IHJldCA9IDA7DQo+ICANCj4gLQkv
KiB3ZSBtYWtlIHN3aXRjaGVzIGxvb2sgbGlrZSBtdXhlcywgbm90IHN1cmUgaG93IHRvIGJlIHNt
YXJ0ZXIgKi8NCj4gLQlpZiAoY2hpcC0+bXV4dHlwZSA9PSBwY2E5NTR4X2lzbXV4KQ0KPiAtCQly
ZWd2YWwgPSBjaGFuIHwgY2hpcC0+ZW5hYmxlOw0KPiAtCWVsc2UNCj4gLQkJcmVndmFsID0gMSA8
PCBjaGFuOw0KPiAtDQo+ICsJcmVndmFsID0gcGNhOTU0eF9yZWd2YWwoZGF0YSwgKHU4KShjaGFu
ICYgMHhmZikpOw0KDQpCb3RoIGEgbWFzayBhbmQgYSBjYXN0IHRvIGRvIHdoYXQgdGhlIGNvbXBp
bGVyIHNob3VsZCBiZSBkb2luZyBhbGwgYnkgaXRzZWxmPw0KSWYgeW91IG5lZWQgdG8ga2lsbCBh
IHdhcm5pbmcsIG9yIHNvbWV0aGluZywgcGxlYXNlIGRvIGp1c3Qgb25lIG9yIHRoZW0uIEJ1dA0K
cGVyc29uYWxseSBJIHByZWZlciB0aGUgc2hvcnQsIHN3ZWV0IGFuZCB1bmNsdXR0ZXJlZDoNCg0K
CXJlZ3ZhbCA9IHBjYTk1NHhfcmVndmFsKGRhdGEsIGNoYW4pOw0KDQo+ICAJLyogT25seSBzZWxl
Y3QgdGhlIGNoYW5uZWwgaWYgaXRzIGRpZmZlcmVudCBmcm9tIHRoZSBsYXN0IGNoYW5uZWwgKi8N
Cj4gIAlpZiAoZGF0YS0+bGFzdF9jaGFuICE9IHJlZ3ZhbCkgew0KPiAgCQlyZXQgPSBwY2E5NTR4
X3JlZ193cml0ZShtdXhjLT5wYXJlbnQsIGNsaWVudCwgcmVndmFsKTsNCj4gQEAgLTI1Niw3ICsy
NTksNyBAQCBzdGF0aWMgaW50IHBjYTk1NHhfZGVzZWxlY3RfbXV4KHN0cnVjdCBpMmNfbXV4X2Nv
cmUgKm11eGMsIHUzMiBjaGFuKQ0KPiAgew0KPiAgCXN0cnVjdCBwY2E5NTR4ICpkYXRhID0gaTJj
X211eF9wcml2KG11eGMpOw0KPiAgCXN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQgPSBkYXRhLT5j
bGllbnQ7DQo+IC0JczggaWRsZV9zdGF0ZTsNCj4gKwlzMzIgaWRsZV9zdGF0ZTsNCj4gIA0KPiAg
CWlkbGVfc3RhdGUgPSBSRUFEX09OQ0UoZGF0YS0+aWRsZV9zdGF0ZSk7DQo+ICAJaWYgKGlkbGVf
c3RhdGUgPj0gMCkNCj4gQEAgLTQwMiw2ICs0MDUsMTcgQEAgc3RhdGljIHZvaWQgcGNhOTU0eF9j
bGVhbnVwKHN0cnVjdCBpMmNfbXV4X2NvcmUgKm11eGMpDQo+ICAJaTJjX211eF9kZWxfYWRhcHRl
cnMobXV4Yyk7DQo+ICB9DQo+ICANCj4gK3N0YXRpYyBpbnQgcGNhOTU0eF9pbml0KHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQsIHN0cnVjdCBwY2E5NTR4ICpkYXRhKQ0KPiArew0KPiArCWlmIChk
YXRhLT5pZGxlX3N0YXRlID49IDApIHsNCj4gKwkJZGF0YS0+bGFzdF9jaGFuID0gcGNhOTU0eF9y
ZWd2YWwoZGF0YSwgKHU4KShkYXRhLT5pZGxlX3N0YXRlICYgMHhmZikpOw0KDQpEaXRvLg0KDQo+
ICsJfSBlbHNlIHsNCj4gKwkJLyogRGlzY29ubmVjdCBtdWx0aXBsZXhlciAqLw0KPiArCQlkYXRh
LT5sYXN0X2NoYW4gPSAwOw0KPiArCX0NCj4gKwlyZXR1cm4gaTJjX3NtYnVzX3dyaXRlX2J5dGUo
Y2xpZW50LCBkYXRhLT5sYXN0X2NoYW4pOw0KDQpIZXJlJ3MgYW5vdGhlciB0aGluZyBJIG1pc3Nl
ZCBpbiB0aGUgZWFybGllciBpdGVyYXRpb25zLiBJZiBpMmNfc21idXNfd3JpdGVfYnl0ZQ0KZmFp
bHMgaGVyZSwgSSB0aGluayB5b3Ugc2hvdWxkIHNldCBkYXRhLT5sYXN0X2NoYW4gdG8gemVyby4g
Rm9yIHRoZSBjYWxsIGZyb20NCnByb2JlIGl0IG9idmlvdXNseSBkb2Vzbid0IG1hdHRlciBtdWNo
LCBidXQgSSB0aGluayB0aGUgY2FsbCBkdXJpbmcgcmVzdW1lIGlzDQpiZXR0ZXIgb2ZmIHdpdGgg
c3VjaCBleHRyYSBwcmVjYXV0aW9uIGluIHBsYWNlLg0KDQpDaGVlcnMsDQpQZXRlcg0KDQo+ICt9
DQo+ICsNCj4gIC8qDQo+ICAgKiBJMkMgaW5pdC9wcm9iaW5nL2V4aXQgZnVuY3Rpb25zDQo+ICAg
Ki8NCj4gQEAgLTQxMSw3ICs0MjUsNiBAQCBzdGF0aWMgaW50IHBjYTk1NHhfcHJvYmUoc3RydWN0
IGkyY19jbGllbnQgKmNsaWVudCwNCj4gIAlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAgPSBjbGll
bnQtPmFkYXB0ZXI7DQo+ICAJc3RydWN0IGRldmljZSAqZGV2ID0gJmNsaWVudC0+ZGV2Ow0KPiAg
CXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAgPSBkZXYtPm9mX25vZGU7DQo+IC0JYm9vbCBpZGxlX2Rp
c2Nvbm5lY3RfZHQ7DQo+ICAJc3RydWN0IGdwaW9fZGVzYyAqZ3BpbzsNCj4gIAlzdHJ1Y3QgaTJj
X211eF9jb3JlICptdXhjOw0KPiAgCXN0cnVjdCBwY2E5NTR4ICpkYXRhOw0KPiBAQCAtNDYyLDIz
ICs0NzUsMjQgQEAgc3RhdGljIGludCBwY2E5NTR4X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQsDQo+ICAJCX0NCj4gIAl9DQo+ICANCj4gLQkvKiBXcml0ZSB0aGUgbXV4IHJlZ2lzdGVy
IGF0IGFkZHIgdG8gdmVyaWZ5DQo+ICsJZGF0YS0+aWRsZV9zdGF0ZSA9IE1VWF9JRExFX0FTX0lT
Ow0KPiArCWlmIChvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgImlkbGUtc3RhdGUiLCAmZGF0YS0+
aWRsZV9zdGF0ZSkpIHsNCj4gKwkJaWYgKG5wICYmIG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwg
ImkyYy1tdXgtaWRsZS1kaXNjb25uZWN0IikpDQo+ICsJCQlkYXRhLT5pZGxlX3N0YXRlID0gTVVY
X0lETEVfRElTQ09OTkVDVDsNCj4gKwl9DQo+ICsNCj4gKwkvKg0KPiArCSAqIFdyaXRlIHRoZSBt
dXggcmVnaXN0ZXIgYXQgYWRkciB0byB2ZXJpZnkNCj4gIAkgKiB0aGF0IHRoZSBtdXggaXMgaW4g
ZmFjdCBwcmVzZW50LiBUaGlzIGFsc28NCj4gLQkgKiBpbml0aWFsaXplcyB0aGUgbXV4IHRvIGRp
c2Nvbm5lY3RlZCBzdGF0ZS4NCj4gKwkgKiBpbml0aWFsaXplcyB0aGUgbXV4IHRvIGEgY2hhbm5l
bA0KPiArCSAqIG9yIGRpc2Nvbm5lY3RlZCBzdGF0ZS4NCj4gIAkgKi8NCj4gLQlpZiAoaTJjX3Nt
YnVzX3dyaXRlX2J5dGUoY2xpZW50LCAwKSA8IDApIHsNCj4gKwlyZXQgPSBwY2E5NTR4X2luaXQo
Y2xpZW50LCBkYXRhKTsNCj4gKwlpZiAocmV0IDwgMCkgew0KPiAgCQlkZXZfd2FybihkZXYsICJw
cm9iZSBmYWlsZWRcbiIpOw0KPiAgCQlyZXR1cm4gLUVOT0RFVjsNCj4gIAl9DQo+ICANCj4gLQlk
YXRhLT5sYXN0X2NoYW4gPSAwOwkJICAgLyogZm9yY2UgdGhlIGZpcnN0IHNlbGVjdGlvbiAqLw0K
PiAtCWRhdGEtPmlkbGVfc3RhdGUgPSBNVVhfSURMRV9BU19JUzsNCj4gLQ0KPiAtCWlkbGVfZGlz
Y29ubmVjdF9kdCA9IG5wICYmDQo+IC0JCW9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwgImkyYy1t
dXgtaWRsZS1kaXNjb25uZWN0Iik7DQo+IC0JaWYgKGlkbGVfZGlzY29ubmVjdF9kdCkNCj4gLQkJ
ZGF0YS0+aWRsZV9zdGF0ZSA9IE1VWF9JRExFX0RJU0NPTk5FQ1Q7DQo+IC0NCj4gIAlyZXQgPSBw
Y2E5NTR4X2lycV9zZXR1cChtdXhjKTsNCj4gIAlpZiAocmV0KQ0KPiAgCQlnb3RvIGZhaWxfY2xl
YW51cDsNCj4gQEAgLTUzMSw4ICs1NDUsNyBAQCBzdGF0aWMgaW50IHBjYTk1NHhfcmVzdW1lKHN0
cnVjdCBkZXZpY2UgKmRldikNCj4gIAlzdHJ1Y3QgaTJjX211eF9jb3JlICptdXhjID0gaTJjX2dl
dF9jbGllbnRkYXRhKGNsaWVudCk7DQo+ICAJc3RydWN0IHBjYTk1NHggKmRhdGEgPSBpMmNfbXV4
X3ByaXYobXV4Yyk7DQo+ICANCj4gLQlkYXRhLT5sYXN0X2NoYW4gPSAwOw0KPiAtCXJldHVybiBp
MmNfc21idXNfd3JpdGVfYnl0ZShjbGllbnQsIDApOw0KPiArCXJldHVybiBwY2E5NTR4X2luaXQo
Y2xpZW50LCBkYXRhKTsNCj4gIH0NCj4gICNlbmRpZg0KPiAgDQo+IA0KDQo=
