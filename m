Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC6C3A7D5E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 10:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728900AbfIDIKs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 04:10:48 -0400
Received: from mail-eopbgr70135.outbound.protection.outlook.com ([40.107.7.135]:57605
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727787AbfIDIKs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 04:10:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HR24wrE12glrplSQSnEUwj/Ce95MMSpZP1ZaBCDFbe4dvAAuAAQLPu9Vw59DNPOMmqQE0fjRPsWGPMsunCAd2TSr3w1j1PGuPRKcatZxtRVY6v4io1Dw6iST6craXFKAbaNmItmQGb7K2kLLozIAYQVzEoXnlCWjE4z9iUn3CKusBioTsfnjueUJbKhKcw1BM+9YyNEJHpXxvPoW7/JTN8nLVonTcAVGeUpHzcOT9wcMVqf6/vSSTNMVymWD9AlWKfAaewabDPc5HB7IwwxOKmEG94pNjHkA8Z5kt1q6BU2HrDCE+t5yEHZlbbt2mVeLaF5eJd3HKyf2ziPSZ4LuTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egU2DaAZL6SybDyLmFKVBGOnHzzauL8DiUr8r+Cbc70=;
 b=AYA1zWtjex3whL8aNQxeF9e2NgbyKi9R2UNZo+OWbcdCxi1iig9JKryHdKw9KRIm+Wy43lNUcBJ7pYk52Yh5TrkJv2kkV3J/MPm4y6zapKKADwpmo4CHy5SxFejsmtAXOgBg9mna9lp6YOeibwnPG2OTQFPdCO1Ek8CBpOTjaQzVk8rfvwzKqaazXkYZVPH0MRbPLs8IpXkvSVtMxIwCBZU5PMNewXgX10gdYemuxk6ws1c2cBBllkckrBvKm0OMzYWwSId1bX6fXCL0mKsuWF2Jt8okrKQK/ALPrjjQeZmgKJakPruGMHPMhZdWLI9+O2O0EKBZZMbh0aj41Xx/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egU2DaAZL6SybDyLmFKVBGOnHzzauL8DiUr8r+Cbc70=;
 b=i2wO8yyudq1nhLB5vklMB5EeKjoIRlFJYqjmrIDNlHue2WXQE7taUh7G6H/0xY57SfQIm8+4FSQBuFUYJoajBIdITL6FPJ2/Fr4hz9GwmoT7wBQ1wQvVny5HyequOcgDh04LHo2DYz9E8vz8bOwx2tV8xy2nfvuYntu+WxUK4dg=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3371.eurprd02.prod.outlook.com (52.134.71.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.21; Wed, 4 Sep 2019 08:09:01 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::e12b:afcb:73e1:5d09%7]) with mapi id 15.20.2220.022; Wed, 4 Sep 2019
 08:09:01 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        jacopo mondi <jacopo@jmondi.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
Thread-Topic: [RFC,v2 2/6] i2c: add I2C Address Translator (ATR) support
Thread-Index: AQHVQZZ8HUEU79hIUkSCEyQvLTUBo6cXIJSAgAKvaICAAZzXgA==
Date:   Wed, 4 Sep 2019 08:09:01 +0000
Message-ID: <51dede3c-545b-b66a-5e89-9e889d784eb9@axentia.se>
References: <20190723203723.11730-1-luca@lucaceresoli.net>
 <20190723203723.11730-3-luca@lucaceresoli.net>
 <20190901143101.humomdehy5ee73sk@vino>
 <20bac324-c4d3-270c-5175-0a7f261fd760@lucaceresoli.net>
In-Reply-To: <20bac324-c4d3-270c-5175-0a7f261fd760@lucaceresoli.net>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR05CA0252.eurprd05.prod.outlook.com
 (2603:10a6:3:fb::28) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 315821f8-7944-4b2b-9db4-08d7310f2521
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:DB3PR0202MB3371;
x-ms-traffictypediagnostic: DB3PR0202MB3371:
x-microsoft-antispam-prvs: <DB3PR0202MB33714371AC8E2AE50CD2365BBCB80@DB3PR0202MB3371.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0150F3F97D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(136003)(396003)(39830400003)(376002)(366004)(346002)(199004)(52314003)(55674003)(189003)(305945005)(81156014)(58126008)(5660300002)(386003)(7736002)(71200400001)(81166006)(86362001)(446003)(66066001)(7416002)(65806001)(65956001)(2616005)(71190400001)(66476007)(66946007)(31696002)(11346002)(53546011)(110136005)(54906003)(6506007)(8676002)(6116002)(25786009)(316002)(8936002)(76176011)(102836004)(26005)(6436002)(31686004)(53936002)(186003)(256004)(52116002)(99286004)(3846002)(36756003)(64756008)(66446008)(229853002)(6486002)(14444005)(6246003)(14454004)(2906002)(4326008)(508600001)(486006)(6512007)(66556008)(476003)(142933001)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3371;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WIvKiVfExkgX6tJ7xagWiFp3zvHq0+Uf17B/bPhJ1/cQQ0jafRdKr2OBfPbcOktc07BLz5yep9r+QoL4z3c1Cj+dicgu0ZoLLoJhblQ9UZ4PIC7ZI/BwlFgk9z/6G0B6MLOKN+Irjlb0I2MhvGFgtXZjGaStZhDRUZSJoYEMkvTrLoZbOjQoIsCZmfeQIyCQmvj3NZBX1S6p4C2vyH21SYUIj4BCRX8hrPjZsvXaul37qQ4FEtspvxiPGopB2iiZpbCRBEtzVl1U5M9YOYvCHgUnhnmaSBWthurKkLvPxCq8pE/veYVBnKxUkoidX5/jSouidjChJp4ayeeTXmHAYQ2enDxHAtDdNQ8X5oDKG8VJhnou5t3ac5H6sHHD1YB+AC+JPUMIOJipVruOTFSpvH83TZefwJPqrEavYUxXaKk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9748AB0EB276CA49B9825CBA97465B46@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 315821f8-7944-4b2b-9db4-08d7310f2521
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Sep 2019 08:09:01.5933
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HpCHqeA9Molz2eVAXa+P/tiDX5ETZ1DO5weUkbf3LvccDefb2LBhTIivjkO9Ns5k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3371
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkhDQoNClsgU29ycnkgYWJvdXQgbXkgYWJzZW5jZS4gSSd2ZSBiZWVuIG1lYW5pbmcgdG8gY29t
bWVudCBvbiB0aGlzIHNlcmllcw0KICBmb3IgYSBsb25nIHRpbWUsIGJ1dCB3b3JrIGFuZCBmYW1p
bHkga2VlcCBpbnRlcmZlcmluZy4uLiBdDQoNCk9uIDIwMTktMDktMDMgMDk6MzEsIEx1Y2EgQ2Vy
ZXNvbGkgd3JvdGU6DQo+IEhpIEphY29wbywNCj4gDQo+IHRoYW5rcyBmb3IgeW91ciBmZWVkYmFj
ay4NCj4gDQo+IE9uIDAxLzA5LzE5IDE2OjMxLCBqYWNvcG8gbW9uZGkgd3JvdGU6DQo+PiBIaSBM
dWNhLA0KPj4gICAgdGhhbmtzIGZvciBrZWVwIHB1c2hpbmcgdGhpcyBzZXJpZXMhIEkgaG9wZSB3
ZSBjYW4gdXNlIHBhcnQgb2YgdGhpcw0KPj4gZm9yIHRoZSAobG9uZyB0aW1lKSBvbi1nb2luZyBH
TVNMIHdvcmsuLi4NCj4+DQo+PiBJIGhvcGUgeW91IHdpbGwgYmUgcGF0aWVudCBlbm91Z2ggdG8g
cHJvdmlkZSAoYW5vdGhlciA6KSBvdmVydmlldw0KPj4gb2YgdGhpcyB3b3JrIGR1cmluZyB0aGUg
Qm9GIFdvbGZyYW0gaGFzIG9yZ2FuaXplZCBhdCBMUEMgZm9yIHRoZSBuZXh0DQo+PiB3ZWVrLg0K
PiANCj4gU3VyZSENCj4gDQo+PiBJbiB0aGUgbWVhbnRpbWUgSSB3b3VsZCBoYXZlIHNvbWUgY29t
bWVudHMgYWZ0ZXIgaGF2aW5nIGEgcmVhZCBhdCB0aGUNCj4+IHNlcmllcyBhbmQgdHJ5aW5nIHRv
IGFwcGx5IGl0cyBjb25jZXB0IHRvIEdNU0wNCj4+DQo+PiBPbiBUdWUsIEp1bCAyMywgMjAxOSBh
dCAxMDozNzoxOVBNICswMjAwLCBMdWNhIENlcmVzb2xpIHdyb3RlOg0KPj4+IEFuIEFUUiBpcyBh
IGRldmljZSB0aGF0IGxvb2tzIHNpbWlsYXIgdG8gYW4gaTJjLW11eDogaXQgaGFzIGFuIEkyQw0K
Pj4+IHNsYXZlICJ1cHN0cmVhbSIgcG9ydCBhbmQgTiBtYXN0ZXIgImRvd25zdHJlYW0iIHBvcnRz
LCBhbmQgZm9yd2FyZHMNCj4+PiB0cmFuc2FjdGlvbnMgZnJvbSB1cHN0cmVhbSB0byB0aGUgYXBw
cm9wcmlhdGUgZG93bnN0cmVhbSBwb3J0LiBCdXQgaXMNCj4+PiBpcyBkaWZmZXJlbnQgaW4gdGhh
dCB0aGUgZm9yd2FyZGVkIHRyYW5zYWN0aW9uIGhhcyBhIGRpZmZlcmVudCBzbGF2ZQ0KPj4+IGFk
ZHJlc3MuIFRoZSBhZGRyZXNzIHVzZWQgb24gdGhlIHVwc3RyZWFtIGJ1cyBpcyBjYWxsZWQgdGhl
ICJhbGlhcyINCj4+PiBhbmQgaXMgKHBvdGVudGlhbGx5KSBkaWZmZXJlbnQgZnJvbSB0aGUgcGh5
c2ljYWwgc2xhdmUgYWRkcmVzcyBvZiB0aGUNCj4+PiBkb3duc3RyZWFtIGNoaXAuDQo+Pj4NCj4+
PiBBZGQgYSBoZWxwZXIgZmlsZSAoanVzdCBsaWtlIGkyYy1tdXguYyBmb3IgYSBtdXggb3Igc3dp
dGNoKSB0byBhbGxvdw0KPj4+IGltcGxlbWVudGluZyBBVFIgZmVhdHVyZXMgaW4gYSBkZXZpY2Ug
ZHJpdmVyLiBUaGUgaGVscGVyIHRha2VzIGNhcmUgb3INCj4+PiBhZGFwdGVyIGNyZWF0aW9uL2Rl
c3RydWN0aW9uIGFuZCB0cmFuc2xhdGVzIGFkZHJlc3NlcyBhdCBlYWNoIHRyYW5zYWN0aW9uLg0K
Pj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogTHVjYSBDZXJlc29saSA8bHVjYUBsdWNhY2VyZXNvbGku
bmV0Pg0KPj4+DQo+Pj4gLS0tDQo+Pj4NCj4+PiBDaGFuZ2VzIFJGQ3YxIC0+IFJGQ3YyOg0KPj4+
DQo+Pj4gIFJGQ3YxIHdhcyBpbXBsZW1lbnRlZCBpbnNpZGUgaTJjLW11eC5jIGFuZCBhZGRlZCB5
ZXQgbW9yZSBjb21wbGV4aXR5DQo+Pj4gIHRoZXJlLiBSRkN2MiBjcmVhdGVzIGEgbmV3IGZpbGUg
b24gaXRzIG93biwgaTJjLWF0ci5jLiBTaW5jZSBtYW55IEFUUg0KPj4+ICBmZWF0dXJlcyBhcmUg
bm90IGluIGEgTVVYIGFuZCB2aWNlIHZlcnNhLCB0aGUgb3ZlcmxhcHBpbmcgaXMgbG93LiBUaGlz
IHdhcw0KPj4+ICBhbG1vc3QgYSBjb21wbGV0ZSByZXdyaXRlLCBidXQgZm9yIHRoZSByZWNvcmRz
IGhlcmUgYXJlIHRoZSBtYWluDQo+Pj4gIGRpZmZlcmVuY2VzIGZyb20gdGhlIG9sZCBpbXBsZW1l
bnRhdGlvbjoNCj4+DQo+PiBJJ20gbm90IGFuIGkyYyBleHBlcnQsIGJ1dCB0aGlzIGxvb2tzIHZl
cnkgc2ltaWxhciB0byBtZSB0byBhbg0KPj4gYXVnbWVudGVkIGkyYy1tdXggd2l0aCB0aGUgZm9s
bG93aW5nIGFkZGl0aW9uYWwgZmVhdHVyZXM6DQo+PiAtIGF1dG9tYXRpYyBzZWxlY3Rpb24gb2Yg
dGhlIGkyYyBhZGRyZXNzIHRvIHVzZSBmb3IgdGhlIGNoaWxkcmVuDQo+PiAgIGJlaGluZCB0aGUg
bXV4DQo+PiAtIGF1dG9tYXRpYyB0cmFuc2xhdGlvbiBvZiB0aGUgYWRkcmVzc2VzIHRoZSBsb2dp
Y2FsIGFsaWFzZXMgdG8NCj4+ICAgdGhlIGFjdHVhbCBwaHlzaWNhbCBhZGRyZXNzZXMgb2YgdGhl
IHNsYXZlcyAod2l0aCB0aGUgaGVscCBvZiB0aGUNCj4+ICAgZGVzZXJpYWxpemVyIGFkZHJlc3Mg
dHJhbnNsYXRpb24gZmVhdHVyZSBpbiB0aGlzIGNhc2UpLg0KPiANCj4gQSBub3RhYmxlIGRpZmZl
cmVuY2UgaW4gdGhlIGhhcmR3YXJlIGlzIHRoYXQgYSBtdXggbmVlZHMgYW4gZXhwbGljaXQNCj4g
cHJvY2VkdXJlIHRvIHNlbGVjdCBhIHBvcnQuIFRoYXQncyB3aHkgdGhlIHNlbGVjdCgpIG9wIGlz
IG1hbmRhdG9yeSBmb3INCj4gbXV4ZXMuIFRoZSBBVFIsIGF0IGxlYXN0IGluIHRoZSBEUzkwVUI5
eHggY2FzZSwgc2VsZWN0cyB0aGUgcG9ydA0KPiBhdXRvbWF0aWNhbGx5IGJhc2VkIG9uIHRoZSBz
bGF2ZSBhZGRyZXNzLiBTbyBJIGFkZGVkIGFuIG9wdGlvbmFsDQo+IHNlbGVjdCgpIG9wIGluIHRo
ZSBhdHIsIGJ1dCBJIHN1c3BlY3QgaXQncyB1c2VsZXNzIGZvciAicmVhbCIgQVRScy4NCj4gDQo+
IE1vcmUgZGlmZmVyZW5jZXMgZGVyaXZlIGZyb20gaG93IExpbnV4IGltcGxlbWVudHMgbXV4ZXMu
IFRoZSBpMmMtbXV4DQo+IGNvZGUgaGFzIHNldmVyYWwgZmxhZ3MgZm9yIGRpZmZlcmVudCBsb2Nr
aW5nIHNjaGVtZXMsIGFuZCBpdCBoYXMgYQ0KDQpJdCdzIHR3byBsb2NraW5nIHNjaGVtZXMgaWYg
eW91IGNvdW50IHRoZW0gY2FyZWZ1bGx5LCBzbyBzZXZlcmFsIGlzDQphIGJpdCBvZiBhbiBleGFn
Z2VyYXRpb24uIEJ1dCBhZ3JlZWQsIHR3byBpcyBtb3JlIHRoYW4gSSBwcmVmZXIuDQoNCj4gZmFp
cmx5IGNvbXBsZXggRFQgcGFyc2luZyBzY2hlbWUuIFRoZXNlIGFyZSBtb3N0bHkgYSBoaXN0b3Jp
Y2FsIGJ1cmRlbi4NCj4gQWRkaW5nIHRoZSBBVFIgZmVhdHVyZXMgdG8gaTJjLW11eC5jIHdhcyB2
ZXJ5IHRyaWNreSBhbmQgZXJyb3ItcHJvbmUgZHVlDQo+IHRvIGFsbCBvZiB0aGlzIGNvZGUsIHRo
YXQncyB3aHkgSSBoYXZlIG1vdmVkIEFUUiB0byBpdHMgb3duIGZpbGUgaW4gUkZDdjIuDQoNCkFu
eXdheSwgdGhlIGxvY2tpbmcgaW4gaTJjLW11eCBtYXkgYmUgY29tcGxleCwgYnV0IGl0IGRvZXMg
c29sdmUgcmVhbA0KcHJvYmxlbXMuIFRoZSB3YXkgSSByZWFkIHRoaXMgc2VyaWVzLCB0aGVzZSBw
cm9ibGVtcyBhcmUgbm90IGRlYWx0IHdpdGgNCmFuZCB0aGVyZWZvcmUgdGhlIEFUUiBjb2RlIHdp
bGwgbm90IGZ1bmN0aW9uIGluIGFsbCBzdXJyb3VuZGluZ3MuDQoNClNvbWUgdGhpbmdzIHRvIHRo
aW5rIGFib3V0Og0KLSBXaGF0IGhhcHBlbnMgd2hlbiB5b3UgcHV0IGEgbXV4IGJlaGluZCBhbiBB
VFI/DQotIFdoYXQgaGFwcGVucyB3aGVuIHlvdSBwdXQgYW4gQVRSIGJlaGluZCBhIG11eD8NCi0g
V2hhdCBoYXBwZW5zIHdoZW4geW91IHB1dCBhbiBBVFIgYmV0d2VlbiB0d28gbXV4ZXM/DQotIERv
ZXMgaXQgbWFrZSBhIGRpZmZlcmVuY2UgaWYgdGhlIG11eCBpcyBwYXJlbnQtbG9ja2VkIG9yIG11
eC1sb2NrZWQ/DQotIFdoYXQgaGFwcGVucyBpZiBjbGllbnQgZHJpdmVycyBsb2NrIHRoZSBhZGFw
dGVyIGluIG9yZGVyIHRvIHNpbGVuY2UgdGhlDQogIGJ1cyBmb3Igc29tZSByZWFzb24gb3IgdG8g
a2VlcCB0d28geGZlcnMgdG9nZXRoZXIgb3Igc29tZXRoaW5nLCBhbmQNCiAgdGhlbiBkbyB1bmxv
Y2tlZCB4ZmVycz8NCi0gQ2FuIHlvdSBwdXQgYW4gQVRSIGJlaGluZCBhbm90aGVyIEFUUj8NCmV0
Yw0KDQpJJ20gbm90IHNheWluZyB0aGF0IHRoZXNlIHRoaW5ncyBtdXN0IGJlIGhhbmRsZWQsIGFu
ZCBtYXliZSB0aGV5IGFyZQ0KaGFuZGxlZCBhbHJlYWR5LCBhbmQgbWF5YmUgc29tZSBvZiB0aGUg
Y29tYmluYXRpb25zIGFyZSBub3QgdmFsaWQgYXQNCmFsbC4gQnV0IHRoZSBwb3NzaWJpbGl0aWVz
IGFuZCBsaW1pdGF0aW9ucyBzaG91bGQgYmUgdW5kZXJzdG9vZC4gQW5kDQpwcmVmZXJhYmx5IGRv
Y3VtZW50ZWQuDQoNCk15IGd1dCBmZWVsaW5nICh3aXRob3V0IHNwZW5kaW5nIG11Y2ggdGltZSBv
biBpdCkgaXMgdGhhdCBBVFIgYXMNCmltcGxlbWVudGVkIGluIHRoaXMgc2VyaWVzIGJlaGF2ZSBh
cHByb3hpbWF0ZWx5IGxpa2UgbXV4LWxvY2tlZCBtdXhlcywNCm1lYW5pbmcgdGhhdCBpdCBpcyBu
b3Qgb2J2aW91c2x5IHNhZmUgdG8gcHV0IGEgcGFyZW50LWxvY2tlZCBtdXggYmVoaW5kDQphbiBB
VFIgYW5kIG1ha2luZyBpdCBpbXBvc3NpYmxlIGZvciBjbGllbnQgZGV2aWNlcyBiZWhpbmQgYW4g
QVRSIHRvIGZvcmNlDQp4ZmVycyB0byBoYXBwZW4gYmFjay10by1iYWNrIGZyb20gdGhlIHJvb3Qg
YWRhcHRlci4NCg0KQW5kIGZpbmFsbHksIEkgZmVlbCB0aGF0IGl0IGlzIG5vdCB3aXNlIHRvIGlu
dHJvZHVjZSBhIHRoaXJkIGxvY2tpbmcNCnNjaGVtZSBpbiB0aGUgSTJDIHRvcG9sb2d5LiBJdCdz
IGJhZCBlbm91Z2ggd2l0aCB0d28uIFdoeSBub3QgbWFrZSB0aGUNCkFUUiBsb2NraW5nIGV4YWN0
bHkgbWF0Y2ggdGhlIG11eC1sb2NrZWQgc2NoZW1lIHRvIHJlZHVjZSB0aGUgbnVtYmVyDQpvZiBj
YXNlcyBvbmUgbmVlZHMgdG8gY29uc2lkZXI/IEJ1dCBtYXliZSB0aGF0J3MganVzdCBtZT8NCg0K
Q2hlZXJzLA0KUGV0ZXINCg==
