Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9F4D665B
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 17:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387684AbfJNPpA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 11:45:00 -0400
Received: from mail-eopbgr70132.outbound.protection.outlook.com ([40.107.7.132]:54596
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731441AbfJNPpA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 11:45:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KH8959pyPBV/Y/4K7tkZfcNkxT8SiRKDZN/rbkWVk64mjhb0kRQWj+dE4uxCimlmv+9KVW9s/mw8IWlgrvOD4Vfis/5EFdQPS3fmbkEqektdfEd27f5c9zWaTzx2CnS9QBb/JKOi88HyeLmgKsR+tDcEEfeJZQfhQym+pegmCzunm7XqAdOMtB6Bj6AycaBbaNO5HiCoj2EkXVOuDwYjMnBgClPAqjsS0gO8ebcdE1qLIhxIJDpOzGCbYYq+iPFctfCstmkVbI5JVjcXbjM6nekvktHMZl7Btu8N0zokwRJqKE6ZFf0Xa3b7m37j0CHVxCLkkauXmBqmN/bwn/LRhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gnetPydixSebPjmtxhIprsT1HkC5LDiSmII5Yp3xMc=;
 b=I4DEunfzY5WNOMnQ4pg2YyCSVvCey6fA0H0j919fT/+TA5RE4s9lwMiVROeKU1/TjQEAdcbB6OhU1ZCAmXK3otftjFHLnOJZkDypO8b+0ukcXCnfToJUz5a9a1ORgqD8TP0JyE97qocF5WJE5nPcDwptFkizgXjD6mOmgeOn8h/BPiUGvXf5ufZ7D2vUfTpAT7kTG1o80J/OEU9h9LERhDdLYNlTjkuJPmVkhPsX+bkJM7K0hX2OXE6eQrlSg7IgD5FdIBEFHHjqQlyWBYZ+uWWI+qZpNlU8FPywqZlRj7arkL6MLH7ljKOHedGT8rCcdFiL8hrbG72TgXpSwOjHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axentia.se; dmarc=pass action=none header.from=axentia.se;
 dkim=pass header.d=axentia.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6gnetPydixSebPjmtxhIprsT1HkC5LDiSmII5Yp3xMc=;
 b=Rf6TfnsfLLiDFQ7eU4buFkzEFtsBBjsGZqvr1sQ5M5jzIrrce+TxLVjn67MvPB8OhsEQGsHGqyprREZ3CLq/TJWGj89+ZNhvvlS4mpaJ7RU7mkCBMHBztWPZcC0/ZdwbDiGMIU9mKLTTMUS8Kh1eJF1vfCPpkPBKA4UauEldexE=
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com (52.134.66.158) by
 DB3PR0202MB3322.eurprd02.prod.outlook.com (52.134.66.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.21; Mon, 14 Oct 2019 15:44:54 +0000
Received: from DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe]) by DB3PR0202MB3434.eurprd02.prod.outlook.com
 ([fe80::c5b8:6014:87a4:1afe%7]) with mapi id 15.20.2347.021; Mon, 14 Oct 2019
 15:44:54 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Biwen Li <biwen.li@nxp.com>,
        "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: replace property
 i2c-mux-idle-disconnect
Thread-Topic: [PATCH 1/2] dt-bindings: i2c: replace property
 i2c-mux-idle-disconnect
Thread-Index: AQHVgoOxjsLBvN5sZEONd8v0noOXt6daR5EA
Date:   Mon, 14 Oct 2019 15:44:54 +0000
Message-ID: <4124752f-19a2-e3c1-7887-07ba66a79c29@axentia.se>
References: <20191014112558.3881-1-biwen.li@nxp.com>
In-Reply-To: <20191014112558.3881-1-biwen.li@nxp.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
x-originating-ip: [213.112.138.100]
x-clientproxiedby: HE1PR09CA0056.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::24) To DB3PR0202MB3434.eurprd02.prod.outlook.com
 (2603:10a6:8:5::30)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19a1f116-51b8-45a6-1e70-08d750bd755e
x-ms-traffictypediagnostic: DB3PR0202MB3322:
x-microsoft-antispam-prvs: <DB3PR0202MB3322116254A7A498DB5F61CCBC900@DB3PR0202MB3322.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01901B3451
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(346002)(39830400003)(366004)(136003)(199004)(189003)(186003)(6246003)(110136005)(316002)(58126008)(54906003)(2906002)(26005)(6512007)(446003)(11346002)(8936002)(386003)(102836004)(508600001)(6506007)(53546011)(4326008)(66066001)(86362001)(66446008)(66556008)(99286004)(64756008)(256004)(71190400001)(31686004)(4001150100001)(6486002)(65806001)(3846002)(7736002)(52116002)(6116002)(66946007)(71200400001)(486006)(76176011)(65956001)(66476007)(81166006)(476003)(229853002)(36756003)(2616005)(6436002)(81156014)(25786009)(305945005)(14454004)(31696002)(5660300002)(2501003)(8676002);DIR:OUT;SFP:1102;SCL:1;SRVR:DB3PR0202MB3322;H:DB3PR0202MB3434.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZqXjPhUArv+8NAG/OIxQ9bMZ4nlJRagXxgAv1RR2AjAgccOTPngV7gBpegrowL/5ZY0yVKlh11vi7lROy0+2v/TxSoEBYfsDnDPo+hoA8IxIZfmK1AMk49k+ozvKv5l8QpSZ68wQ4S0fOsxfNJHUV+9DgcIqRhZaXNP8evw44jYgy6JACw1bn/PiiZ5wEN17zcziR3xI3nmou5OOllkawXmF4JLkINMH7JiEP9SPRphcYlTx0Qn/7GONpBdZ0PrLmpaDt8MBZ8jcRml3XWtHTxUOOMDPwFTLSikUKR51PlRLspiOkMTbIWnoiVYrhRF3MW3n5QBxqH84Oa3FgGFrXZqNmT6kl9B8u3rEQGQwLTyPfuBBDkWz18fKCZl2Ig3guPm9gKhpPeua9bQUhR9hxIM5JG6cN6J2nIcZSc2g9tU=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <317733F89A582E43892671097717F529@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a1f116-51b8-45a6-1e70-08d750bd755e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2019 15:44:54.7526
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yvZ1b4qtqs2sp32VitXCxwAqzVu0TZDLR+o8W4rNcdqZ5mBx3RDw9/V69Iye41Hv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB3322
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

T24gMjAxOS0xMC0xNCAxMzoyNSwgQml3ZW4gTGkgd3JvdGU6DQo+IFRoaXMgcmVwbGFjZXMgcHJv
cGVydHkgaTJjLW11eC1pZGxlLWRpc2Nvbm5lY3Qgd2l0aCBpZGxlLXN0YXRlDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBCaXdlbiBMaSA8Yml3ZW4ubGlAbnhwLmNvbT4NCj4gLS0tDQo+ICBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2kyYy1tdXgtcGNhOTU0eC50eHQgfCA0ICst
LS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL2ky
Yy1tdXgtcGNhOTU0eC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJj
L2kyYy1tdXgtcGNhOTU0eC50eHQNCj4gaW5kZXggMzBhYzZhNjBmMDQxLi5mMmRiNTE3YjE2MzUg
MTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvaTJj
LW11eC1wY2E5NTR4LnR4dA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvaTJjL2kyYy1tdXgtcGNhOTU0eC50eHQNCj4gQEAgLTI1LDkgKzI1LDcgQEAgUmVxdWlyZWQg
UHJvcGVydGllczoNCj4gIE9wdGlvbmFsIFByb3BlcnRpZXM6DQo+ICANCj4gICAgLSByZXNldC1n
cGlvczogUmVmZXJlbmNlIHRvIHRoZSBHUElPIGNvbm5lY3RlZCB0byB0aGUgcmVzZXQgaW5wdXQu
DQo+IC0gIC0gaTJjLW11eC1pZGxlLWRpc2Nvbm5lY3Q6IEJvb2xlYW47IGlmIGRlZmluZWQsIGZv
cmNlcyBtdXggdG8gZGlzY29ubmVjdCBhbGwNCj4gLSAgICBjaGlsZHJlbiBpbiBpZGxlIHN0YXRl
LiBUaGlzIGlzIG5lY2Vzc2FyeSBmb3IgZXhhbXBsZSwgaWYgdGhlcmUgYXJlIHNldmVyYWwNCj4g
LSAgICBtdWx0aXBsZXhlcnMgb24gdGhlIGJ1cyBhbmQgdGhlIGRldmljZXMgYmVoaW5kIHRoZW0g
dXNlIHNhbWUgSTJDIGFkZHJlc3Nlcy4NCj4gKyAgLSBpZGxlLXN0YXRlOiBQbGVhc2UgcmVmZXIg
dG8gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL211eC9tdXgtY29udHJvbGxlci50
eHQNCj4gICAgLSBpbnRlcnJ1cHRzOiBJbnRlcnJ1cHQgbWFwcGluZyBmb3IgSVJRLg0KPiAgICAt
IGludGVycnVwdC1jb250cm9sbGVyOiBNYXJrcyB0aGUgZGV2aWNlIG5vZGUgYXMgYW4gaW50ZXJy
dXB0IGNvbnRyb2xsZXIuDQo+ICAgIC0gI2ludGVycnVwdC1jZWxscyA6IFNob3VsZCBiZSB0d28u
DQo+IA0KDQpZb3UgY2FuJ3QganVzdCByZW1vdmUgaTJjLW11eC1pZGxlLWRpc2Nvbm5lY3QuIEl0
IG5lZWRzIHRvIHJlbWFpbiwgYW5kIHRoZQ0KZHJpdmVyIG5lZWRzIHRvIG1haW50YWluIHN1cHBv
cnQgZm9yIHRoaXMgaW4gY2FzZSBhIG5ldyBrZXJuZWwgaXMgcnVubmluZw0Kd2l0aCBhbiBvbGQg
ZGV2aWNldHJlZS4NCg0KQ2hlZXJzLA0KUGV0ZXINCg==
