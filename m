Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D32E2A656C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Nov 2020 14:44:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730152AbgKDNoL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Nov 2020 08:44:11 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15830 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726608AbgKDNoL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 4 Nov 2020 08:44:11 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa2b02d0000>; Wed, 04 Nov 2020 05:44:13 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov
 2020 13:44:10 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 4 Nov 2020 13:44:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Id5loCt0UGtoD2fNW2gMSQ0DdclVsn4VlmsLmQPIwlNfmck3b2Ue94a4hnXBMJ88XrMQOMXvp8QTVhGWEM9wOjhrcb5AHsmjmrDZ9Um+KtqyebXw9gr12UyOzPNloufb8IM1AqAUQCUVd6nnXscSGU2l6CalrbrFcUYnWwj+5rKr4M00UakVoXm+rukYLxty3EA0Px9YjjUJILS8ggGfHOqWXMAaJgMTkwI9+c0l6TU8mF0QN54A+YD6/Ec0TuV01t7vjrQz2qR1SVh4qDQzBDeDcZ7GnsD31p60WvDyoXdJPZ0jH3fD0dDDV33WVXTugiHOAKyPE08SmHsE7vV8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EbkKF+6lgo92dW8WzmspAMBbYpRYsqNY+TW6T+LJ6B0=;
 b=LmPzYBy0/lHtzXjjlw19barh59UvEJXN2nV/dBYLZgvGO/dISD0oNnjvPH7aQDVDGo9IPVBxmILogZ/yi+cPxF3rx3+mQnOj0gkTi1nPkA0K9PKmg1ezl6PWX6HHeD9oP/Cngkk9XZSeRAD13FhQ1utCD4kl686X/OeaN+Lf5bbKsFbe+w4a19MeTpc4jZ7SoVCtYS2jQcdq71W9lpv6yGB8SoBWMFhqLR7q5GJg7S5zQBulKQqPbMZb9BWvpedU/pztVO7L7jMrMj1L+2U4lIbHbZWqSl3+zbzsPqAjMrn/oCF5TLnWZXlctU1v4nFXSeMsy5B7oBiFwBMFxUBacg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from MN2PR12MB3616.namprd12.prod.outlook.com (2603:10b6:208:cc::25)
 by MN2PR12MB3584.namprd12.prod.outlook.com (2603:10b6:208:c9::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.30; Wed, 4 Nov
 2020 13:44:09 +0000
Received: from MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f]) by MN2PR12MB3616.namprd12.prod.outlook.com
 ([fe80::89a:e4ad:708f:363f%5]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 13:44:09 +0000
From:   Khalil Blaiech <kblaiech@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Linux I2C <linux-i2c@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH i2c-next v2 6/6] dt-bindings: i2c: Convert DT file to YAML
 schema
Thread-Topic: [PATCH i2c-next v2 6/6] dt-bindings: i2c: Convert DT file to
 YAML schema
Thread-Index: AQHWshttx8StFjJLf0+yuj2kGuzED6m3SMiAgACz8tA=
Date:   Wed, 4 Nov 2020 13:44:09 +0000
Message-ID: <MN2PR12MB3616B19658725BC33D61FBF3ABEF0@MN2PR12MB3616.namprd12.prod.outlook.com>
References: <cover.1604432921.git.kblaiech@nvidia.com>
 <c81a0679413dd77e68bdf7e3023d1a54e62f26ea.1604432921.git.kblaiech@nvidia.com>
 <CAL_JsqLC5nzPmNK41s3fB6nnRqjC3DXPfYn1uqdytrEKqFBpXQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLC5nzPmNK41s3fB6nnRqjC3DXPfYn1uqdytrEKqFBpXQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [173.48.75.27]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d68f8354-e7d2-433e-6ab8-08d880c7b4ba
x-ms-traffictypediagnostic: MN2PR12MB3584:
x-microsoft-antispam-prvs: <MN2PR12MB358490C84A032513E474AD02ABEF0@MN2PR12MB3584.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IYmAV+lLAjh7XwSbhA1GNPBoS1/zjQhE1tDVXyPx0GRubKGbqSK1SKIoGEkoD5BF0q0vLF7PltyJHl8mp1OHbTDv88SzwD1jbn0QEtIRk9JKF0BLKrvy4XQp29/qnDLDCDS1FGP95eruNUxWCEeUJ2URYdEa/4ehDqweeut35T4ng92+wCGs3WD3VYAsyAJ1AOhAjMKs2ddi+J1qqyPG15EuY8nBLcnR/smzuZ+EvN43NglfT1xOaEFfKfoX/jtJ9bB5ZR6YwKW8rSmiq5qLxTmhneb/6mfIfHqg7dNEY4QEZyvQSpkQux9lIdMMLSHzC+sBLpGa/p7VVxqrwPLQduz9nwu1z9RU7Rh8q7mQAjNgv6VlW4VQhWLx5VBVRXpZCFGUGGl78FrrxL5eVg4u1g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3616.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39860400002)(396003)(366004)(136003)(376002)(66946007)(66476007)(5660300002)(4326008)(64756008)(66446008)(66556008)(52536014)(53546011)(8676002)(76116006)(71200400001)(966005)(478600001)(54906003)(6506007)(316002)(186003)(33656002)(7696005)(26005)(8936002)(2906002)(55016002)(83380400001)(86362001)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: r2jWo27gub3WEZFW+PCbO0uI0EnMjyyeFDRcq0U3hMBxZdsKVCsAz68Uoo2UH2OXq6P9TpRm+y/ziNnQgq/dM1DZ1l0k03ThuqvlAI9VPiqNNH2dMJd12sh7octPB81kwoawysEYxCXDWXRfkb/OOMw/Bz+UNH19dLdXErP3PZEkf+FcDRen+YFjlBe28dRRC4MowifxNG7cK5J5uKTLE5u8StL9pO/O0P0nqR16MoARPiFXqzPHGOMGwuS8+F4VJ/Q84tpSUSmB9CvF196syrLwjdaKx0hrktBQ3GIUQu1eMz9nvIQWij3f+w2oM182z+D4Tuw0WkBptQ1dnShY5XvSPgyx8ht7LmInTTYScB2I8XXUmRGcG6u0ZK805b7+cXTOp2bEbvGoI2eAjppEdg8xzEKHq6uglQlDlSm7lCltAaLWK/oO5PZI7vnkYjLQ4U9DM4FxfcItb/xceeHehzQWYRXridTcJrZ8gJWaHio6yixpCwCc63+Hv6JlSkYL/CfytuBR29rtXULgfWLXEcnFBTqNQkfaqOIkw4m1psqyJyMOeDuM9WofYmQZQgcLs3/2ZX6p8HRFAD2/sf+4pfAQtvYJcu4kxtdKg1OfIS8LYLDiIUvE1z84iDp5+/XDSjkfJoyE4LtWNt4AoRfclw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3616.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d68f8354-e7d2-433e-6ab8-08d880c7b4ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2020 13:44:09.1288
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AeSyqa6aQGYdnX0bV+p34Zqo4Xr0SOQu65bZpJEb5B8JIRi3sojyerzg+GTj5jOvB64IuHIhKk1KUlWME9dkkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3584
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604497453; bh=EbkKF+6lgo92dW8WzmspAMBbYpRYsqNY+TW6T+LJ6B0=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
         x-microsoft-antispam:x-microsoft-antispam-message-info:
         x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
         x-ms-exchange-transport-forked:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=CKJbe1g4vBh5Vecw3PlYqgJIZZqgAaNNMFmUBc/RcG7h1VFhH+brKcJarCKqumg+B
         PYn+16LljW7W5/b2TAypCE5kASXPNvHDXVNgwLsa41SwxyzGCMs59VCIMDjk0ZX1+m
         t7Pi3SSLZB1vn5/B8M6C29L1uHrKKu0mDXaBxVJFHwe+CZpyQL7Uw78Elj0/2fTpXr
         VwoYEh/4s4FATfv/rhBO4+m6EqQd2xRqrJWbyUUWFAR+bUT1sTGzhZrFvdWJ5i//hB
         cp0UsG6D08BAACwBT9tbxhpunU2tL/yfiOIObBYV9TyxdVfJ5WMuoPd9PrHqBvp6i4
         AerHIdqYvk1pg==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

DQoNCj4gT24gVHVlLCBOb3YgMywgMjAyMCBhdCAxOjU2IFBNIEtoYWxpbCBCbGFpZWNoIDxrYmxh
aWVjaEBudmlkaWEuY29tPiB3cm90ZToNCj4gPg0KPiA+IFdyaXRlIHRoZSBkZXZpY2V0cmVlIGJp
bmRpbmcgdGV4dCBmaWxlIGFzc29jaWF0ZWQgd2l0aA0KPiA+IHRoZSBNZWxsYW5veCBCbHVlRmll
bGQgSTJDIGNvbnRyb2xsZXIgaW4gc2NoZW1hIGZpbGUsDQo+ID4gSlNPTiBjb21wYXRpYmxlIHN1
YnNldCBvZiBZQU1MLiBCZXNpZGVzLCBhZGQgYW4gZW50cnkNCj4gPiB3aXRoaW4gTUFJTlRBSU5F
UlMgZmlsZS4NCj4gDQo+IFBsZWFzZSBmaXggdGhlIHN1YmplY3QgYXMgSSBhc2tlZCBpbiB2MS4N
Cg0KV2lsbCBkby4gVmVyeSBzb3JyeSBhYm91dCB0aGF0Lg0KDQo+ID4NCj4gPiBSZXZpZXdlZC1i
eTogTGVvbiBSb21hbm92c2t5IDxsZW9ucm9AbnZpZGlhLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5
OiBLaGFsaWwgQmxhaWVjaCA8a2JsYWllY2hAbnZpZGlhLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvaTJjL21lbGxhbm94LGkyYy1tbHhiZi50eHQgfCA0MiAtLS0t
LS0tLS0tLS0NCj4gPiAgLi4uL2JpbmRpbmdzL2kyYy9tZWxsYW5veCxpMmMtbWx4YmYueWFtbCAg
ICAgICAgICAgfCA4MA0KPiArKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiA+ICAzIGZp
bGVzIGNoYW5nZWQsIDgxIGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQ0KPiA+ICBkZWxl
dGUgbW9kZSAxMDA2NDQNCj4gRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9t
ZWxsYW5veCxpMmMtbWx4YmYudHh0DQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NA0KPiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL21lbGxhbm94LGkyYy1tbHhiZi55YW1sDQo+
ID4NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ky
Yy9tZWxsYW5veCxpMmMtbWx4YmYudHh0DQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2kyYy9tZWxsYW5veCxpMmMtbWx4YmYudHh0DQo+ID4gZGVsZXRlZCBmaWxlIG1vZGUg
MTAwNjQ0DQo+ID4gaW5kZXggNTY2ZWE4Ni4uMDAwMDAwMA0KPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvbWVsbGFub3gsaTJjLW1seGJmLnR4dA0KPiA+ICsr
KyAvZGV2L251bGwNCj4gPiBAQCAtMSw0MiArMCwwIEBADQo+ID4gLURldmljZSB0cmVlIGNvbmZp
Z3VyYXRpb24gZm9yIHRoZSBNZWxsYW5veCBJMkMgU01CdXMgb24gQmx1ZUZpZWxkIFNvQ3MNCj4g
PiAtDQo+ID4gLVJlcXVpcmVkIFByb3BlcnRpZXM6DQo+ID4gLQ0KPiA+IC0tIGNvbXBhdGlibGUg
OiBzaG91bGQgYmUgIm1lbGxhbm94LGkyYy1tbHhiZjEiIG9yICJtZWxsYW5veCxpMmMtbWx4YmYy
Ii4NCj4gPiAtDQo+ID4gLS0gcmVnIDogYWRkcmVzcyBvZmZzZXQgYW5kIGxlbmd0aCBvZiB0aGUg
ZGV2aWNlIHJlZ2lzdGVycy4gVGhlDQo+ID4gLSAgICAgICByZWdpc3RlcnMgY29uc2lzdCBvZiB0
aGUgZm9sbG93aW5nIHNldCBvZiByZXNvdXJjZXM6DQo+ID4gLSAgICAgICAgICAgICAgIDEpIFNt
YnVzIGJsb2NrIHJlZ2lzdGVycy4NCj4gPiAtICAgICAgICAgICAgICAgMikgQ2F1c2UgbWFzdGVy
IHJlZ2lzdGVycy4NCj4gPiAtICAgICAgICAgICAgICAgMykgQ2F1c2Ugc2xhdmUgcmVnaXN0ZXJz
Lg0KPiA+IC0gICAgICAgICAgICAgICA0KSBDYXVzZSBjb2FsZXNjZSByZWdpc3RlcnMgKGlmIGNv
bXBhdGlibGUgaXNuJ3Qgc2V0DQo+ID4gLSAgICAgICAgICAgICAgICAgIHRvICJtZWxsYW5veCxp
MmMtbWx4YmYxIikuDQo+ID4gLQ0KPiA+IC0tIGludGVycnVwdHMgOiBpbnRlcnJ1cHQgbnVtYmVy
Lg0KPiA+IC0NCj4gPiAtT3B0aW9uYWwgUHJvcGVydGllczoNCj4gPiAtDQo+ID4gLS0gY2xvY2st
ZnJlcXVlbmN5IDogYnVzIGZyZXF1ZW5jeSB1c2VkIHRvIGNvbmZpZ3VyZSB0aW1pbmcgcmVnaXN0
ZXJzOw0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIGFsbG93ZWQgdmFsdWVzIGFyZSAxMDAw
MDAsIDQwMDAwMCBhbmQgMTAwMDAwMDsNCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICB0aG9z
ZSBhcmUgZXhwcmVzc2VkIGluIEh6LiBEZWZhdWx0IGlzIDEwMDAwMC4NCj4gPiAtDQo+ID4gLUV4
YW1wbGU6DQo+ID4gLQ0KPiA+IC1pMmNAMjgwNDAwMCB7DQo+ID4gLSAgICAgICBjb21wYXRpYmxl
ID0gIm1lbGxhbm94LGkyYy1tbHhiZjEiOw0KPiA+IC0gICAgICAgcmVnID0gICA8MHgwMjgwNDAw
MCAweDgwMD4sDQo+ID4gLSAgICAgICAgICAgICAgIDwweDAyODAxMjAwIDB4MDIwPiwNCj4gPiAt
ICAgICAgICAgICAgICAgPDB4MDI4MDEyNjAgMHgwMjA+Ow0KPiA+IC0gICAgICAgaW50ZXJydXB0
cyA9IDw1Nz47DQo+ID4gLSAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8MTAwMDAwPjsNCj4gPiAt
fTsNCj4gPiAtDQo+ID4gLWkyY0AyODA4ODAwIHsNCj4gPiAtICAgICAgIGNvbXBhdGlibGUgPSAi
bWVsbGFub3gsaTJjLW1seGJmMiI7DQo+ID4gLSAgICAgICByZWcgPSAgIDwweDAyODA4ODAwIDB4
NjAwPiwNCj4gPiAtICAgICAgICAgICAgICAgPDB4MDI4MDhlMDAgMHgwMjA+LA0KPiA+IC0gICAg
ICAgICAgICAgICA8MHgwMjgwOGUyMCAweDAyMD4sDQo+ID4gLSAgICAgICAgICAgICAgIDwweDAy
ODA4ZTQwIDB4MDEwPjsNCj4gPiAtICAgICAgIGludGVycnVwdHMgPSA8NTc+Ow0KPiA+IC0gICAg
ICAgY2xvY2stZnJlcXVlbmN5ID0gPDQwMDAwMD47DQo+ID4gLX07DQo+ID4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMvbWVsbGFub3gsaTJjLQ0KPiBt
bHhiZi55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9tZWxsYW5v
eCxpMmMtDQo+IG1seGJmLnlhbWwNCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiA+IGluZGV4
IDAwMDAwMDAuLjNlYjc0NTcNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2kyYy9tZWxsYW5veCxpMmMtbWx4YmYueWFtbA0KPiA+
IEBAIC0wLDAgKzEsODAgQEANCj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0y
LjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+ID4gKyVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiAr
JGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9pMmMvbWVsbGFub3gsaTJjLW1seGJm
LnlhbWwjDQo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMv
Y29yZS55YW1sIw0KPiA+ICsNCj4gPiArdGl0bGU6IE1lbGxhbm94IEkyQyBTTUJ1cyBvbiBCbHVl
RmllbGQgU29Dcw0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBLaGFsaWwgQmxh
aWVjaCA8a2JsYWllY2hAbnZpZGlhLmNvbT4NCj4gPiArDQo+ID4gK2FsbE9mOg0KPiA+ICsgIC0g
JHJlZjogL3NjaGVtYXMvaTJjL2kyYy1jb250cm9sbGVyLnlhbWwjDQo+ID4gKw0KPiA+ICtwcm9w
ZXJ0aWVzOg0KPiA+ICsgIGNvbXBhdGlibGU6DQo+ID4gKyAgICBlbnVtOg0KPiA+ICsgICAgICAt
IG1lbGxhbm94LGkyYy1tbHhiZjENCj4gPiArICAgICAgLSBtZWxsYW5veCxpMmMtbWx4YmYyDQo+
ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1pbkl0ZW1zOiAzDQo+ID4gKyAgICBtYXhJdGVt
czogNA0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IFNtYnVzIGJs
b2NrIHJlZ2lzdGVycw0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBDYXVzZSBtYXN0ZXIgcmVn
aXN0ZXJzDQo+ID4gKyAgICAgIC0gZGVzY3JpcHRpb246IENhdXNlIHNsYXZlIHJlZ2lzdGVycw0K
PiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBDYXVzZSBjb2FsZXNjZSByZWdpc3RlcnMNCj4gPiAr
DQo+ID4gKyAgaW50ZXJydXB0czoNCj4gPiArICAgIG1heEl0ZW1zOiAxDQo+ID4gKw0KPiA+ICsg
IGNsb2NrLWZyZXF1ZW5jeToNCj4gPiArICAgIGVudW06IFsgMTAwMDAwLCA0MDAwMDAsIDEwMDAw
MDAgXQ0KPiA+ICsgICAgZGVzY3JpcHRpb246DQo+ID4gKyAgICAgIGJ1cyBmcmVxdWVuY3kgdXNl
ZCB0byBjb25maWd1cmUgdGltaW5nIHJlZ2lzdGVyczsNCj4gPiArICAgICAgVGhlIGZyZXF1ZW5j
eSBpcyBleHByZXNzZWQgaW4gSHouIERlZmF1bHQgaXMgMTAwMDAwLg0KPiA+ICsNCj4gPiArYWRk
aXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAt
IGNvbXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gaW50ZXJydXB0cw0KPiA+ICsNCj4g
PiArdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBmYWxzZQ0KPiA+ICsNCj4gPiAraWY6DQo+ID4gKyAg
cHJvcGVydGllczoNCj4gPiArICAgIGNvbXBhdGlibGU6DQo+ID4gKyAgICAgIGNvbnRhaW5zOg0K
PiA+ICsgICAgICAgIGVudW06DQo+ID4gKyAgICAgICAgICAtIG1lbGxhbm94LGkyYy1tbHhiZjEN
Cj4gPiArDQo+ID4gK3RoZW46DQo+ID4gKyAgcHJvcGVydGllczoNCj4gPiArICAgIHJlZzoNCj4g
PiArICAgICAgbWF4SXRlbXM6IDMNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0K
PiA+ICsgICAgaTJjQDI4MDQwMDAgew0KPiA+ICsgICAgICAgIGNvbXBhdGlibGUgPSAibWVsbGFu
b3gsaTJjLW1seGJmMSI7DQo+ID4gKyAgICAgICAgcmVnID0gPDB4MDI4MDQwMDAgMHg4MDA+LA0K
PiA+ICsgICAgICAgICAgICAgIDwweDAyODAxMjAwIDB4MDIwPiwNCj4gPiArICAgICAgICAgICAg
ICA8MHgwMjgwMTI2MCAweDAyMD47DQo+ID4gKyAgICAgICAgaW50ZXJydXB0cyA9IDw1Nz47DQo+
ID4gKyAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDEwMDAwMD47DQo+ID4gKyAgICB9Ow0KPiA+
ICsNCj4gPiArICAtIHwNCj4gPiArICAgIGkyY0AyODA4ODAwIHsNCj4gPiArICAgICAgICBjb21w
YXRpYmxlID0gIm1lbGxhbm94LGkyYy1tbHhiZjIiOw0KPiA+ICsgICAgICAgIHJlZyA9IDwweDAy
ODA4ODAwIDB4NjAwPiwNCj4gPiArICAgICAgICAgICAgICA8MHgwMjgwOGUwMCAweDAyMD4sDQo+
ID4gKyAgICAgICAgICAgICAgPDB4MDI4MDhlMjAgMHgwMjA+LA0KPiA+ICsgICAgICAgICAgICAg
IDwweDAyODA4ZTQwIDB4MDEwPjsNCj4gPiArICAgICAgICBpbnRlcnJ1cHRzID0gPDU3PjsNCj4g
PiArICAgICAgICBjbG9jay1mcmVxdWVuY3kgPSA8NDAwMDAwPjsNCj4gPiArICAgIH07DQo+ID4g
ZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMNCj4gPiBpbmRleCA1NTE1ODdm
Li40MDU2OWZkIDEwMDY0NA0KPiA+IC0tLSBhL01BSU5UQUlORVJTDQo+ID4gKysrIGIvTUFJTlRB
SU5FUlMNCj4gPiBAQCAtMTExNjYsNiArMTExNjYsNyBAQCBNRUxMQU5PWCBCTFVFRklFTEQgSTJD
IERSSVZFUg0KPiA+ICBNOiAgICAgS2hhbGlsIEJsYWllY2ggPGtibGFpZWNoQG52aWRpYS5jb20+
DQo+ID4gIEw6ICAgICBsaW51eC1pMmNAdmdlci5rZXJuZWwub3JnDQo+ID4gIFM6ICAgICBTdXBw
b3J0ZWQNCj4gPiArRjogICAgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pMmMv
bWVsbGFub3gsaTJjLW1seGJmLnlhbWwNCj4gPiAgRjogICAgIGRyaXZlcnMvaTJjL2J1c3Nlcy9p
MmMtbWx4YmYuYw0KPiA+DQo+ID4gIE1FTExBTk9YIEVUSEVSTkVUIERSSVZFUiAobWx4NF9lbikN
Cj4gPiAtLQ0KPiA+IDIuMS4yDQo+ID4NCg==
