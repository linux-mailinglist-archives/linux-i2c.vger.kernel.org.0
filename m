Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02926143901
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jan 2020 10:06:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgAUJFi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jan 2020 04:05:38 -0500
Received: from mail-am6eur05on2125.outbound.protection.outlook.com ([40.107.22.125]:62013
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727360AbgAUJFi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jan 2020 04:05:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2FAVtorIw5PIhebiJLlKetXPWkct0Pg9iuLPwj50Vnd5ryNW6k108b9KzTw1hbkw9tkGONYcPLFuZ3E42oqAbO37XAv+Q6vwH5sEX55u3mo5yeL8gqhww0lF7OlizZa1h/cbCLV+IkilOHo0bOnVVsA/a8qskqkbctRH7YtQQgEpcillgZ0bLdiuQb/lAJxZn4S/JJ08y44Tfg21+N1hUTkZsTeC88yW2ugDKTg54YB1GNLjl/7T8mzIfedFoO6FmRb5vu23L+GprUQWlS3w4TXJ5BkpXOBkQdJNQHtfX127+6otkvObGEytv1YzyN9n7sxfOxS/hVUJ6JgpAqUEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7606mIP/6B3+wF9wQby+WufMFA7YwtDQf8kK6Erzknk=;
 b=XeOJelQfhJq+5RMo3o3dp3VlRUNJZpBQU8YYJ3hXbelfg0MPXqnZ9nvxWfcbEF6E/X/h3YmLK+yBtGRJgjMXHa8t88VZOx+NoEICNhl9xdZzSB1ZVeNWxZZaEDehwQffuRxOPlZUwz5ddMlOksI90202dkOdIJABwVgqGd6hjXAjsVbeBpoiYnQckrZw9i5Rt/Hkm1mNoyzTxGkzoAWiXFDdj64PZ87ou0zUlpGHKuCZEpaEYUFEamrTdwONhzIVgAq3fsOpE122OshCuSEoiO0wTVtRHKc855OPDfbHW3cmN3cUZgp8vYEk5kLrl4K+OMtPt9tT/mnDbQ5eEkmNhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7606mIP/6B3+wF9wQby+WufMFA7YwtDQf8kK6Erzknk=;
 b=JifiJAuCLmE1K96uvogrB6pRVQ/bGFnpBJWGVrQykKN8Mrbb6E6DSYFRdX4ysJenLj7IsZs1N8xm9Dnf2mLO7i0PEU+pXSl8C90Kq44uK3Tp9Yy93Qp7DqC8RUDVhhV5hvDMPARW5wngMTBC/h0e3xJmHxkiGud7DNXzOFHIJe4=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3401.eurprd02.prod.outlook.com (52.134.73.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.25; Tue, 21 Jan 2020 09:05:33 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::cd85:a8a5:da14:db13%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 09:05:33 +0000
Received: from [192.168.13.3] (213.112.138.4) by AM6P195CA0097.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend Transport; Tue, 21 Jan 2020 09:05:32 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
Thread-Topic: [RFC PATCH 3/5] i2c: core: add function to request an alias
Thread-Index: AQHVv/V/wRv0SjIo8EmIFT3G5i0lAafWCI+AgB7rYoA=
Date:   Tue, 21 Jan 2020 09:05:33 +0000
Message-ID: <f0eeb661-dc6c-7f11-fca3-cdf1a6e1b953@axentia.se>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
In-Reply-To: <20200101165515.GC6226@pendragon.ideasonboard.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
x-originating-ip: [213.112.138.4]
x-clientproxiedby: AM6P195CA0097.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::38) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e22bb21-c4de-43ed-a6a9-08d79e51125f
x-ms-traffictypediagnostic: DB3PR0202MB3401:
x-microsoft-antispam-prvs: <DB3PR0202MB34015E410E4114E6358E6232BC0D0@DB3PR0202MB3401.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39830400003)(346002)(136003)(376002)(396003)(366004)(199004)(189003)(508600001)(36756003)(8676002)(186003)(81166006)(2616005)(81156014)(71200400001)(26005)(53546011)(16526019)(52116002)(54906003)(956004)(110136005)(316002)(8936002)(16576012)(31696002)(86362001)(4326008)(66946007)(2906002)(66476007)(66446008)(5660300002)(31686004)(6486002)(66556008)(64756008);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3401;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oUtwUxk/2iWKtlgmRLWe8S3pf6vdGzCwZMPjd6/DMH2ih3OVFNWtk5nbPx2upNnZLS57OBKKcMjSISun17h3uFtBZ0z7L0ViDYuUkiOcQw1ZnuZ8ZNYBvElmEnClv2wtWxNVPV2oKrWy3qBlwzN9CQfaLHkKVmQxv8jZM7/8cYODnZUWNT3ptks/RtGhw8kWJomIqsCed+EFvZYayv8delfuyOf11E5l4asreAn31aDXUIm9ZiGJGeJZbpuS0p60epv9lf7G8WdSuT2b1IgM85OnQQbuo/3tiiyzcbr7jtMODUnV/zI6cU5bG4SuN6uiXs4wLnXF67ux7iXbvotxBArwX4KHkPV3bua4zYJIn87qRvNLc/btkDTnOol4CoGDkK5iLrpYEAkatjoiclcEqAV8dBCmLPiKbzwy6xjME0mvnCsP0KaDLmdvN+S6ikeO
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F7A47D78CD61FF4397E30120020A8A10@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e22bb21-c4de-43ed-a6a9-08d79e51125f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 09:05:33.5821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZoIOdgfxetWl1B8+aSbdHNvjJELFNKFwcRCtTawYFeBEBIMhrEsl744dZQXxsrY1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3401
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAyMC0wMS0wMSAxNzo1NSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gSGkgV29sZnJh
bSwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gVHVlLCBEZWMgMzEs
IDIwMTkgYXQgMDU6MTM6NThQTSArMDEwMCwgV29sZnJhbSBTYW5nIHdyb3RlOg0KPj4gU29tZSBk
ZXZpY2VzIGFyZSBhYmxlIHRvIHJlcHJvZ3JhbSB0aGVpciBJMkMgYWRkcmVzcyBhdCBydW50aW1l
LiBUaGlzDQo+PiBjYW4gcHJldmVudCBhZGRyZXNzIGNvbGxpc2lvbnMgd2hlbiBvbmUgaXMgYWJs
ZSB0byBhY3RpdmF0ZSBhbmQNCj4+IHJlcHJvZ3JhbSB0aGVzZSBkZXZpY2VzIG9uZSBieSBvbmUu
IEZvciB0aGF0IHRvIHdvcmssIHRoZXkgbmVlZCB0byBiZQ0KPj4gYXNzaWduZWQgYW4gdW51c2Vk
IGFkZHJlc3MuIFRoaXMgbmV3IGZ1bmN0aW9ucyBhbGxvd3MgZHJpdmVycyB0byByZXF1ZXN0DQo+
PiBmb3Igc3VjaCBhbiBhZGRyZXNzLiBJdCBhc3N1bWVzIGFsbCBub24tb2NjdXBpZWQgYWRkcmVz
c2VzIGFyZSBmcmVlLiBJdA0KPj4gd2lsbCB0aGVuIHNlbmQgYSBtZXNzYWdlIHRvIHN1Y2ggYSBm
cmVlIGFkZHJlc3MgdG8gbWFrZSBzdXJlIHRoZXJlIGlzDQo+PiByZWFsbHkgbm90aGluZyBsaXN0
ZW5pbmcgdGhlcmUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVu
ZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvaTJjL2kyYy1j
b3JlLWJhc2UuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysNCj4+ICBpbmNsdWRlL2xpbnV4
L2kyYy5oICAgICAgICAgfCAgMiArKw0KPj4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgYi9k
cml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCj4+IGluZGV4IDUxYmQ5NTNkZGZiMi4uNWEwMTBl
N2U2OThmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jDQo+PiAr
KysgYi9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCj4+IEBAIC0yMjQxLDYgKzIyNDEsMjgg
QEAgc3RhdGljIGludCBpMmNfZGV0ZWN0KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcHRlciwgc3Ry
dWN0IGkyY19kcml2ZXIgKmRyaXZlcikNCj4+ICAJcmV0dXJuIGVycjsNCj4+ICB9DQo+PiAgDQo+
IA0KPiBNaXNzaW5nIGtlcm5lbGRvYywgYnV0IHlvdSBhbHJlYWR5IGtub3cgYWJvdXQgdGhpcy4N
Cj4gDQo+PiArc3RydWN0IGkyY19jbGllbnQgKmkyY19uZXdfYWxpYXNfZGV2aWNlKHN0cnVjdCBp
MmNfYWRhcHRlciAqYWRhcCkNCj4+ICt7DQo+PiArCXN0cnVjdCBpMmNfY2xpZW50ICphbGlhcyA9
IEVSUl9QVFIoLUVCVVNZKTsNCj4+ICsJaW50IHJldDsNCj4+ICsJdTE2IGFkZHI7DQo+PiArDQo+
PiArCWkyY19sb2NrX2J1cyhhZGFwLCBJMkNfTE9DS19TRUdNRU5UKTsNCj4+ICsNCj4+ICsJZm9y
IChhZGRyID0gMHgwODsgYWRkciA8IDB4Nzg7IGFkZHIrKykgew0KPj4gKwkJcmV0ID0gaTJjX3Nj
YW5fZm9yX2NsaWVudChhZGFwLCBhZGRyLCBpMmNfdW5sb2NrZWRfcmVhZF9ieXRlX3Byb2JlKTsN
Cj4+ICsJCWlmIChyZXQgPT0gLUVOT0RFVikgew0KPj4gKwkJCWFsaWFzID0gaTJjX25ld19kdW1t
eV9kZXZpY2UoYWRhcCwgYWRkcik7DQo+PiArCQkJZGV2X2RiZygmYWRhcC0+ZGV2LCAiRm91bmQg
YWxpYXM6IDB4JXhcbiIsIGFkZHIpOw0KPj4gKwkJCWJyZWFrOw0KPj4gKwkJfQ0KPj4gKwl9DQo+
IA0KPiBUaGlzIGxvb2tzIHF1aXRlIGluZWZmaWNpZW50LCBlc3BlY2lhbGx5IGlmIHRoZSBiZWdp
bm5pbmcgb2YgdGhlIHJhbmdlDQo+IGlzIHBvcHVsYXRlZCB3aXRoIGRldmljZXMuIEZ1cnRoZXJt
b3JlLCBJIHRoaW5rIHRoZXJlJ3MgYSBoaWdoIHJpc2sgb2YNCj4gZmFsc2UgbmVnYXRpdmVzLCBh
cyBhY3F1aXJpbmcgYSBmcmVlIGFkZHJlc3MgYW5kIHJlcHJvZ3JhbW1pbmcgdGhlDQo+IGNsaWVu
dCB0byBtYWtlIHVzZSBvZiBpdCBhcmUgc2VwYXJhdGUgb3BlcmF0aW9ucy4gQW5vdGhlciBjYWxs
IHRvDQo+IGkyY19uZXdfYWxpYXNfZGV2aWNlKCkgY291bGQgb2NjdXIgaW4tYmV0d2Vlbi4gVGhl
cmUncyBhbHNvIHRoZSBpc3N1ZQ0KPiB0aGF0IEkyQyBoYXNuJ3QgYmVlbiBkZXNpZ25lZCBmb3Ig
c2Nhbm5pbmcsIHNvIHNvbWUgZGV2aWNlcyBtYXkgbm90DQo+IGFwcHJlY2lhdGUgdGhpcy4NCj4g
DQo+IFdoYXQgaGFwcGVuZWQgdG8gdGhlIGlkZWEgb2YgcmVwb3J0aW5nIGJ1c3kgYWRkcmVzcyBy
YW5nZXMgaW4gdGhlDQo+IGZpcm13YXJlIChEVCwgQUNQSSwgLi4uKSA/DQoNCkFub3RoZXIgYXJn
dW1lbnQgYWdhaW5zdCBwcm9iaW5nIChwZXJoYXBzIHdlYWssIGJ1dCBzdGlsbCkgaXMgdGhhdCB0
aGUNCnByb2JlZCBhZGRyZXNzIG1pZ2h0IGFscmVhZHkgYmUgcHJvZ3JhbW1lZCBpbiAob25lIG9m
KSB0aGUgcmVwcm9ncmFtbWFibGUNCmNoaXAocykgbWFraW5nIGl0IHJlc3BvbmQgdG8gdGhlIHBy
b2JlIGFuZCB0aHVzIHByZXZlbnRpbmcgdGhlIHVzZSBvZiBhDQpwZXJmZWN0bHkgZ29vZCBhbGlh
cyBhZGRyZXNzLg0KDQpJbiAvZXh0cmVtZS8gc2l0dWF0aW9ucyB0aGlzIC9taWdodC8gcHJldmVu
dCBmaW5kaW5nIGEgbmVlZGVkIGFsaWFzIGF0DQphbGwuDQoNCkNoZWVycywNClBldGVyDQo=
