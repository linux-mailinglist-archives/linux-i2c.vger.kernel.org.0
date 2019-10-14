Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B29CD5BD8
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 09:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730171AbfJNHGe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 03:06:34 -0400
Received: from mail-eopbgr70125.outbound.protection.outlook.com ([40.107.7.125]:43588
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726500AbfJNHGe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 03:06:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIkqvLGIkd/t13VKCnDeOW5jn3Uh7OUpfcquss7CmEv8sMjUiUQPlr/zcX2fjLgRoPlsuKPPtjv/Yb1gPTttQE+ghcWZLkxHst5RUusGl0kqreCRy/H582LkSrCyU6TRfcWGieEgZsSWtcqw+RIMJ4tiUwjrlqn0C4FyOw9efuk6OSDyIA1x0+0im+eB04xxK+vJ1+ZqSHnB+VQFA5vinFGpscEeXSR2halvKwguisEfgGlFQ/DLLBMKiofsnmvGdZBwuanEsl9oGez+s+x8vQogWcUcnEcZPTakc2HTn9cttjZjiPYgmN31tAA59E5U8n4/J4Kfyqq/ykBD6RlIMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VF1bQYAERY9fvsq9v1kGWMg3kC6mcZbbi65RUQFUwY=;
 b=Kr8byimu0HYjHqLqUqKhLmQjnpkf9aaKTx7LbUrqol4/yfzHYBMD4aDuXXUte48/6MgyEO427ls0RJ34CrybAFb8KnxIYD550g+vMTJN6NR6vRg9xdKzJIBPBZqAHiuoAGC4iJLS6veQtleVdJAN8lLyEATPinWaKGhIaDSnMdJxlEiVVTdexd4BHzU4op6y5kInTMTprc4Qw6RO1RoJf1LrsBoxrQYUWobQyZWvModrbvEjNohRfPWCEz3p5jw5bxJbwzw5+ksVtNY3KLFsiOnNQonWUXKcmkV1a21GvTs0svPzsfS4BGdU8O6h5DJSu9QB8usdGzEmv89kWOJ+pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6VF1bQYAERY9fvsq9v1kGWMg3kC6mcZbbi65RUQFUwY=;
 b=W96FDWMmFAJKE+EDD4ThKQWDJpWYPKoqlkq6QhsxQxnEZu5nxhpaLemsqYPPLbe/VaiVcPZy+Iq2PQeS4grCgnxLXAkQ3MMKFsEx16odtGSSaWEXOGVSKNqP6FUB36MwfYS+ZZLxmqLoO/YsR9ac25VRpD/r7C008vAE6FM9/Tw=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3321.eurprd02.prod.outlook.com (52.134.70.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.22; Mon, 14 Oct 2019 07:06:26 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 07:06:26 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>, Rob Herring <robh@kernel.org>
CC:     Leo Li <leoyang.li@nxp.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [EXT] Re: [v2,2/2] dt-bindings: i2c-mux-pca954x: Add optional
 property i2c-mux-never-disable
Thread-Topic: [EXT] Re: [v2,2/2] dt-bindings: i2c-mux-pca954x: Add optional
 property i2c-mux-never-disable
Thread-Index: AQHVd0AksaVJuyFZf06jXLHgcXrzT6dVlliAgAP4BQCAAA+KgIAAL16A
Date:   Mon, 14 Oct 2019 07:06:26 +0000
Message-ID: <1f0c4d52-03d5-2947-f701-a0b5ab46c8e0@axentia.se>
References: <20190930032503.44425-1-biwen.li@nxp.com>
 <20190930032503.44425-2-biwen.li@nxp.com> <20191011144445.GA2340@bogus>
 <DB7PR04MB44908DE0F57E985ED40C401A8F900@DB7PR04MB4490.eurprd04.prod.outlook.com>
 <DB7PR04MB4490094F26EA412D4D9F5CF98F900@DB7PR04MB4490.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB4490094F26EA412D4D9F5CF98F900@DB7PR04MB4490.eurprd04.prod.outlook.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR05CA0270.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::22) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87be8c44-25af-4fcd-dd95-08d75075073c
x-ms-traffictypediagnostic: DB3PR0202MB3321:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DB3PR0202MB332172E54716D63EC7291E31BC900@DB3PR0202MB3321.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(136003)(346002)(376002)(39830400003)(189003)(199004)(37524003)(8936002)(6306002)(2906002)(54906003)(76176011)(52116002)(6512007)(58126008)(81156014)(81166006)(71200400001)(71190400001)(110136005)(31696002)(99286004)(6436002)(229853002)(7736002)(8676002)(305945005)(6486002)(5660300002)(4326008)(316002)(14444005)(256004)(31686004)(508600001)(6246003)(66446008)(64756008)(66556008)(66946007)(66476007)(26005)(186003)(11346002)(446003)(476003)(2616005)(486006)(4001150100001)(6116002)(3846002)(966005)(36756003)(102836004)(14454004)(386003)(66066001)(53546011)(65806001)(86362001)(6506007)(65956001)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3321;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IJK7wTs42chxV1j+vHCxB0ow3277f69ujpCBAd422l8ixw5BZQz1dSKAJG08gCoCHUwYrn+GgHl9f1HqOnmaiF3Io70IXonKaY3TPBFZGwSTL4wu1iQF2kLE01yfVOzJur4RRxzArewyng7PZE9TC54gUlWQa/4Daa/aOusGeFm/PICDg+YHAflpNbsNx8czZUCRlumdLoLo7alWx66mvqZivFj30tBm2aMRKulkK4teCa387JLxE4UxkbxQd+XdgczZakW1oie7YzlL4Mm8Ay8X7fjbtQtUqnOxUnHSKjwuC5t6zLKbodOfHd4ao5GzqwONck6mTLK0maRWKg/ksgFiI8fXQE/gktQz391jgnoy/m3P680iWTrZwLNTBJZOqxb5aZjV0+yBr0kfqZFV5iiiaYsrDh2NpCgIaIzLcqIb/lQYnOE9jAwC9DgfT6heKlUh4QlulX1jnXEC3L4JQQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <4074ED54FDB7FC42ADE235FE75FB49A8@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 87be8c44-25af-4fcd-dd95-08d75075073c
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 07:06:26.1288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bim349/zSwdlKnqXlKvrq+JHKCm4m7l2twulRWhAfhqGux7t/0rs3jCN8RIVlw+/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3321
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMC0xNCAwNjoxNiwgQml3ZW4gTGkgd3JvdGU6DQo+Pg0KPj4+DQo+Pj4gT24gTW9u
LCBTZXAgMzAsIDIwMTkgYXQgMTE6MjU6MDNBTSArMDgwMCwgQml3ZW4gTGkgd3JvdGU6DQo+Pj4+
IFRoZSBwYXRjaCBhZGRzIGFuIG9wdGlvbmFsIHByb3BlcnR5IGkyYy1tdXgtbmV2ZXItZGlzYWJs
ZQ0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4N
Cj4+Pj4gLS0tDQo+Pj4+IENoYW5nZSBpbiB2MjoNCj4+Pj4gICAgICAgLSB1cGRhdGUgZG9jdW1l
bnRhdGlvbg0KPj4+Pg0KPj4+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ky
Yy9pMmMtbXV4LXBjYTk1NHgudHh0IHwgMSArDQo+Pj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdA0KPj4+PiBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW11eC1wY2E5NTR4LnR4dA0KPj4+PiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW11eC1wY2E5NTR4LnR4dA0KPj4+PiBp
bmRleCAzMGFjNmE2MGYwNDEuLjcxYjczZDBmZGI2MiAxMDA2NDQNCj4+Pj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1NHgudHh0DQo+Pj4+
ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJjLW11eC1wY2E5
NTR4LnR4dA0KPj4+PiBAQCAtMzQsNiArMzQsNyBAQCBPcHRpb25hbCBQcm9wZXJ0aWVzOg0KPj4+
PiAgICAgIC0gZmlyc3QgY2VsbCBpcyB0aGUgcGluIG51bWJlcg0KPj4+PiAgICAgIC0gc2Vjb25k
IGNlbGwgaXMgdXNlZCB0byBzcGVjaWZ5IGZsYWdzLg0KPj4+PiAgICAgIFNlZSBhbHNvDQo+Pj4+
IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9p
bnRlcnJ1cHRzLnR4DQo+Pj4+IHQNCj4+Pj4gKyAgLSBpMmMtbXV4LW5ldmVyLWRpc2FibGU6IGFs
d2F5cyBmb3JjZXMgbXV4IHRvIGJlIGVuYWJsZWQuDQo+Pj4NCj4+PiBFaXRoZXIgbmVlZHMgdG8g
aGF2ZSBhIHZlbmRvciBwcmVmaXggb3IgYmUgZG9jdW1lbnRlZCBhcyBhIGNvbW1vbg0KPj4+IHBy
b3BlcnR5Lg0KPiBJIGNob29zZSB0byBiZSBkb2N1bWVudGVkIGFzIGEgY29tbW9uIHByb3BlcnR5
Lg0KDQpDYW4gd2UgcGxlYXNlIGp1c3QgZHJvcCB0aGUgbmV2ZXItZGlzYWJsZSBhcHByb2FjaCBh
bmQgZm9jdXMgb24gaWRsZS1zdGF0ZQ0KaW5zdGVhZD8NCg0KPj4+DQo+Pj4gSUlSQywgd2UgYWxy
ZWFkeSBoYXZlIGEgcHJvcGVydHkgZm9yIG11eCBkZWZhdWx0IHN0YXRlIHdoaWNoIHNlZW1zDQo+
Pj4gbGlrZSB0aGF0IHdvdWxkIGNvdmVyIHRoaXMgdW5sZXNzIHlvdSBuZWVkIHRvIGxlYXZlIGl0
IGluIGRpZmZlcmVudCBzdGF0ZXMuDQo+PiBPa2F5LCB5b3UgYXJlIHJpZ2h0LCB0aGFuayB5b3Ug
c28gbXVjaC4gSSB3aWxsIHRyeSBpdCBpbiB2My4NCj4gRG8geW91IG1lYW4gdGhhdCB0aGUgcHJv
cGVydHkgaXMgaTJjLW11eC1pZGxlLWRpc2Nvbm5lY3QgaW4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2kyYy9pMmMtbXV4LXBjYTk1NHgudHh0Pw0KPiBJZiBzbywgdGhlIHByb3Bl
cnR5IGkyYy1tdXgtaWRsZS1kaXNjb25uZWN0IGlzIG5vdCBnb29kIGZvciBtZS4NCj4gQmVjYXVz
ZSBjb25kaXRpb24gb2YgdGhlIHByb3BlcnR5IGkyYy1tdXgtaWRsZS1kaXNjb25uZWN0IGlzIGlu
IGlkbGUgc3RhdGUoc29tZXRpbWVzKS4NCj4gQnV0IEkgbmVlZCBhbHdheXMgZW5hYmxlIGkyYyBt
dWx0aXBsZXhlciBpbiB3aGF0ZXZlciBzdGF0ZShhbnl0aW1lKSwgc28gSSBhZGQgYSBjb21tb24g
cHJvcGVydHkgaTJjLW11eC1uZXZlci1kaXNhYmxlLg0KDQpObywgSSBkbyBub3QgdGhpbmsgYW55
IG5ldyBwcm9wZXJ0eSBpcyBuZWVkZWQuIEFGQUlDVCwgaWRsZS1zdGF0ZSBmaXRzDQpwZXJmZWN0
bHksIGFuZCBJIHdpbGwgbm90IGNvbnNpZGVyIHRoaXMgaTJjLW11eC1uZXZlci1kaXNhYmxlDQph
cHByb2FjaCB1bnRpbCBzb21lIGNvbXBlbGxpbmcgcmVhc29uIGlzIHByZXNlbnRlZCB3aHkgaWRs
ZS1zdGF0ZQ0KaXMgbm90IGFwcHJvcHJpYXRlLiBZb3UgcHJvbWlzZWQgdG8gdGFrZSBhIHN0YWIg
YXQgaXQsIGFuZCB1bnRpbA0KSSBoZWFyIGJhY2sgb24gdGhhdCwgdGhpcyBzZXJpZXMgaXMgb24g
aG9sZC4gQXMgaW5kaWNhdGVkIGhlcmUgWzFdLg0KDQpZb3UgbmVlZCB0byBwYXRjaCB0aGUgZHJp
dmVyIHRvIGxvb2sgYXQgdGhlIGlkbGUtc3RhdGUgcHJvcGVydHkNCmluc3RlYWQgb2YgaW52ZW50
aW5nIGEgbmV3IChhbmQgbGVzcyBmbGV4aWJsZSkgcHJvcGVydHkuIElmIHlvdQ0KaW1wbGVtZW50
IGlkbGUtc3RhdGUgZm9yIHRoaXMgZHJpdmVyIGFuZCBzZXQgdGhlIGlkbGUtc3RhdGUgdG8NCnNv
bWUgY2hhbm5lbCBpbiB0aGUgZHRzLCB0aGUgbXV4IHdpbGwgbmV2ZXIgZGlzY29ubmVjdC4gUHJv
YmxlbSBzb2x2ZWQuDQpQZXJoYXBzIG5vdCB5b3VyIGZpcnN0IHNvbHV0aW9uLCBidXQgaXQgZG9l
cyBzb2x2ZSB5b3VyIHByb2JsZW0gYW5kDQptYXkgYWN0dWFsbHkgYmUgdXNlZnVsIGZvciBvdGhl
ciBwdXJwb3NlcyB0aGFuIHlvdXIgYnJva2VuIGhhcmR3YXJlLg0KQW5kIGl0IGlzIGNvbnNpc3Rl
bnQgYWNyb3NzIG90aGVyIGkyYy1tdXhlcy4gSSBzZWUgbm8gZG93bnNpZGUuDQoNCkNoZWVycywN
ClBldGVyDQoNClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzA3ZDg1NzQ4LTA3MjEt
MzlkNC1kMmJlLTEzZWIxNmIwZjFkZUBheGVudGlhLnNlLw0K
