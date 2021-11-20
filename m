Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7178457C2E
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Nov 2021 08:36:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237096AbhKTHjm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Nov 2021 02:39:42 -0500
Received: from mail-bn8nam11on2085.outbound.protection.outlook.com ([40.107.236.85]:14720
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237130AbhKTHjY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Nov 2021 02:39:24 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zz9f1sAMHdpGSK8uBD6qiqUb+uHvvNT+511YNzJbNxBDkr/MWhamV0dTGf6vezd+OJeLAExCKTy8R5TK0dR0fg2zWj7VkV/PKsMEkMWpOczUyv7sEJQ/WYiUHMvtHTgJt04D3Z+2VFkbgibaeMVXniFGvnpn1UWNKWd5N6Ze9Tozt+Mm7epZA7XgO4TJjZqn8iQFa9AMQt+y3o1dprZNZaGS5kR1OSAC0HTr2HnwCowKl+jTpx+Xw0dqhV0Nk5mNDH5iVVjtTTup5W02/oznGUQ1JAG+44T9BzyTfjRJbDvhU95v+X0pj13BwTu+jFwm8eZ9UjUf2jYWz04N/7aRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0Wn3mnP6D7Dz49GIs4eYrHl2DpyWvQVPc2Jyh4yjAs=;
 b=VFaDhm99LzfyGyL2dhBfQ2dbV3oc89GcXEEzxi1lDne4sNTqaGT2giXEk5HMoKS99NfQVP+BxbHXLiBTuPZjoOi6pwpqGp/BGuggYJfPd3e9Law9xM0gX4JEkRenmMGBkAcmxhP0UGIFKpSXEhTP9P1Y+/VHlSf79gfOFnaa6nUAuJhcQM7h4JTnXCW9mefDbWy07uglhxmX7a2KFbXHQHmtryW9H2W7khAik3aTm/nJ31CLK9FOGq31i3tohacvDQG1F1rstCjerqmGZ1Fs1pM/y95cnyRpajb0eFiA++/ucaEMZi/rr20KdXeUEcO3qlHOSp7gGkUzuA2Prf2h0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0Wn3mnP6D7Dz49GIs4eYrHl2DpyWvQVPc2Jyh4yjAs=;
 b=LUBpbghIVFDHSqILddjyN31lohD08RNo7ULa78tXw5Gw25moL0khZi6qHnXQNKEIXT9O4wBGsZPPJZmoEQNvHACJfXfGeHihIhdm7gZ1c0w5Ve2e8r+pP6VXeNoVCKGXw/eQfnRUqg2QglINoqMQ2mxynsOXlGJsh2uhiSfBzC2SEF0c0AKsidwXoR28Lbb3JrieTzvY63X/1sfZ00KV2xQARHgQgAo3r4Ju3wIXmB1j16Q283NNzWC6Wl9Ka4rr9MMjSEBUjf9fKOpsLTpHsFU3C2+KBMW7DkUzwB/5mLg7EVR2ItNPxdG8+uNRoi8PjSAPbSnK5xxvr3We0BJPkg==
Received: from BN9PR12MB5273.namprd12.prod.outlook.com (2603:10b6:408:11e::22)
 by BN9PR12MB5258.namprd12.prod.outlook.com (2603:10b6:408:11f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Sat, 20 Nov
 2021 07:36:20 +0000
Received: from BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::d170:24c:2ca0:7e1e]) by BN9PR12MB5273.namprd12.prod.outlook.com
 ([fe80::d170:24c:2ca0:7e1e%7]) with mapi id 15.20.4713.022; Sat, 20 Nov 2021
 07:36:19 +0000
From:   Akhil R <akhilrajeev@nvidia.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Laxman Dewangan <ldewangan@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: RE: [PATCH] i2c: tegra: Add ACPI support
Thread-Topic: [PATCH] i2c: tegra: Add ACPI support
Thread-Index: AQHX3UqXVOelLVy4LEmtnEDNS2GBkqwK7mGAgAESluA=
Date:   Sat, 20 Nov 2021 07:36:19 +0000
Message-ID: <BN9PR12MB5273620B5C397CD425130704C09D9@BN9PR12MB5273.namprd12.prod.outlook.com>
References: <1637328734-20576-1-git-send-email-akhilrajeev@nvidia.com>
 <CAHp75Vfi5gw4jnJg2bmubKMB_H8s09PfNWVVZWwewuCnW5_+hg@mail.gmail.com>
In-Reply-To: <CAHp75Vfi5gw4jnJg2bmubKMB_H8s09PfNWVVZWwewuCnW5_+hg@mail.gmail.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: db93db7a-4c63-4fa9-c85d-08d9abf871d3
x-ms-traffictypediagnostic: BN9PR12MB5258:
x-microsoft-antispam-prvs: <BN9PR12MB5258FCFF6409D6B2464D0CA5C09D9@BN9PR12MB5258.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iIX3dOzw4tUVjLpwnWnxi96lYLewpeiMs9wDcRyVij2f8p2u0hdQ1p2XCvQOV2oO6NztmDVug9hVb6HgNfGbrXCwXE5CEEMHWxQkEHJgRT7ehGACzk6+HfJdl2056OOo9RS+yOqj0sLcclNC7y1GBquSwLPB82ML80ISIBPrcCdb7gP6B0sgL3O1br9v9aOsLRtW1k2TDi8YGRskXTw/mY8w3pC3JeyleFCYSzV4R/I938mu+QR0xY3fKK4bMjo0IyKBX1Z3P8g9Pc1CwTPC7sQZY9FOctn9lD9L/zUC5aVWFCBe11f6Gjv5FyxBgkqRqpDq+qmM9pL86IvaGUI7p+oVKbXrB3cTZdMqh/hOJMmNhrRTbrJv8QaXp+hjM329w64l4MTn6B7rfkJ3WI5endMj+N7UgLfpvZCU7qXkQxVA/mvlaHy5BTJBnbuwiA+1ixk38fd/GNqVpgNMXM82zKvooxZQBhxjrPqDN6JZOePQ3XOdVkGAN65kdXauKw1uyCgKxH55NKppu49vchr3U+gPbAx30WfcLExVpNwjzL2VipoXuNhtI/ZA37N2jJX6n51l8abMqrdwp8171uz/BmknIrDRjRWEeFyrxejWcROLdH2zNn73E90q8dkKH2Ws0ACd1IKxnCA6OwSlzm8C2GlmGWZWIJAS3c+hhHxg7nFlwWrKZW/7+u5wMWw8QP4fVGn27sLgyzCNmHRMFvjGvw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5273.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(55016002)(8936002)(86362001)(26005)(66446008)(54906003)(38070700005)(38100700002)(508600001)(33656002)(7696005)(52536014)(2906002)(9686003)(4326008)(7416002)(83380400001)(64756008)(71200400001)(316002)(6506007)(8676002)(5660300002)(55236004)(53546011)(6916009)(66946007)(66476007)(186003)(122000001)(66556008)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UzVXYWNGWUh1Slhsazg2WjhUamtFYlJoVklvSDJ3SzhJZ1pYMGF3YUcrcnV6?=
 =?utf-8?B?UW0vd3JoTEZkS21zY3kxTkRWbW1hdXZoSUlacm5wdHhYcFpYWUdWM3NiWWlJ?=
 =?utf-8?B?clBDQzFTT0oyV1pUbG90R2RYSm9NYVhocXB2Z0hsSnNycUtFRENuQ3kzS1Yz?=
 =?utf-8?B?bDhRNHdwQzRCTEt2ellPSExQWlEwMFZYYjhRSS9SVEdaK2NKQWgvcmMzV1BK?=
 =?utf-8?B?cjEvQU5HL2VVUmhXMmpCdk1XN0pRbWJnVFNwcHMwM2pMaUFUYzFrcFF4NWRj?=
 =?utf-8?B?K09ydUtnNW9rV1NWQkxocjRGeGEvNE9SWjdJbmxzbkc0bnpOOWRPVFkrdnVY?=
 =?utf-8?B?SXZRSnI4RE91TXBwMGREUVVvanRlVG1kVzdkTi9rZ2hDUDVxdGRrcUJRTVY0?=
 =?utf-8?B?OENvUXByckdDeExEOUNDcXJSTm1TUEJSb3VoRTgwOFgwTXN6K1krUi9PSXBz?=
 =?utf-8?B?K2pyeUJCQ1dCUFpScW1RTVhvMnRqb0xhelREOW1tc25JRTF3dHNzQ2NPNnZ6?=
 =?utf-8?B?VkI1Nm5KRVNxeUpWbElsRTQ5eWpMODJ5MEVnZ3RFN1lQMjA3QWhRUzZNZHFv?=
 =?utf-8?B?S2M3UmNZN3h3b2hnalVSVlIrVzZZbmF0NGRQK21WRmNhc1I2YXhmN2hYWHNC?=
 =?utf-8?B?N0ZRWmU1eWF4d0xHaFpXa1VJdmFYMHl4UDM0VzAyVVROcWJPUjhFck5TUFFK?=
 =?utf-8?B?WjVIQ3pxL1ZuK0pCVnFqNHd4UG9tcWI4QWlpeC9DZmszSXdLVENHMlh3Q1JE?=
 =?utf-8?B?NEkwRVQxT2R1cDlnWXQxUmRmVURjcWUvUGM2MzdOU0NoQWtqeDIzamd2dHYv?=
 =?utf-8?B?enpTNlhOS1VOaTRlajF2bXBoZXJtRkxIZGQrM0R1MTJ0eEFKNFdHZEdieTJB?=
 =?utf-8?B?ZGFZTTJiNWdhejVvSHFtanZ1UTZFMUEyTG9tYXluV3h5LzVlcXNiR2dqZFFU?=
 =?utf-8?B?K1E4VE1mS2tRRkpvbkJxTTJlQ2pReUp0QkpoVnB3ZENvZVF5T1NJbndnZEZX?=
 =?utf-8?B?akQxYXlnMkZtaVR6aVJHVGp3THp5VEpHM2dUTGxhUnlCQjBPMFl3ajN1YU5Y?=
 =?utf-8?B?RzZZK1ZYVGROQjljWmFwSE4rRFRMMmFlUmdKSkxmaExCcFBSOWgvT3pFNk5R?=
 =?utf-8?B?OEpqQ0JMblJsRGxwZGpUZ0dvY3R4bWw1YzlKdno5aEc5ZTl2WHM2dEhSR0ZU?=
 =?utf-8?B?N3ZrcjBiRUdOVElPU01XN0FJcEwvekNEYlMwa1lrbE02RlNlMlNhTldNNCs4?=
 =?utf-8?B?ODkvNVhyMWk4cUp2TndHWjZmZzNYNTRVVmwwWDJlWmxrMGJHWE9IMGFGaXRT?=
 =?utf-8?B?ZDAwNmtPRlpVTko5NTRBSFBlbHdBNkZnbFBIZ3MrT2FwaE8wVm4wS1E2U0V5?=
 =?utf-8?B?TEI2L3FOVGJiZFlUWW14ZlRDOUVCWGhRWlVwaHNJTlh6WE5hSENBRjZ1RFRt?=
 =?utf-8?B?MERTZVVTUlc4ZVYrOThiUjhLTXJCZ1QzVSszbmhPbURoZVY5TGc3V3Q2SDhX?=
 =?utf-8?B?NzRhcXFISVpuRis3Zyt6VU9FWktaaW55YUZjOWlPbUpjZTFXQnFoUm1NWTN1?=
 =?utf-8?B?R1pQMitVM2ZFQnh3aFBPc0dzWEhwSEszcE45RmZTdkx2eDNiaGNCNXZMQ1hh?=
 =?utf-8?B?UlBiSW1mc21SS0ZaWTJ5T3Z0ZFZ1RlQwcUZpRUN6SHBGSXN2YnFTeWMwU2dr?=
 =?utf-8?B?bDFQUmRab1FqTTA5eWJSU2tTcE8zM2pIblNMSG02RE12Z0J4KzNDV2JCWmlq?=
 =?utf-8?B?cm50VDVldWFLaEdkMHpkMU9lOVZLZitpWHdiK2FsREVPSGRYZDBubUl6RzFI?=
 =?utf-8?B?Q1FLMWdHS2xoM0VnVFp1cWxLV1VzMHIwd004MkkwNklKQmVvaGhiWFZQV1d1?=
 =?utf-8?B?YmhtdWZYVWY2cjBXaDBwMFlkcXk1VHlRem9tRWxWZkliMm5DazR0QnMveGZZ?=
 =?utf-8?B?MTU1Q2dPb0gzMnpVTFVKOXVhTXpHYU5sQ0NFZEQ2MXA0SDBSMjNwWWtJdlpG?=
 =?utf-8?B?SjFkaEFjQy9VZlA3Sm81VjBSeVE5NnJObzZ5NnlvV3RzNEl5clNoU0NWdkwx?=
 =?utf-8?B?VW10V2hTUnczVkZlTDZ6Tm5hQ0tzbHUyYUx4QXVmOUQxWFVnMEhSeUVjdFpC?=
 =?utf-8?B?aUQ4TklrR2FYV0I5bGVQMWdTazNxY3g2d2wrTkdyei9XOVl3VDJONXFvWXAr?=
 =?utf-8?Q?Tht/FW3hzpcIGI5q2Ab+Zw0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5273.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db93db7a-4c63-4fa9-c85d-08d9abf871d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2021 07:36:19.8245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t9J5oU8VHcRUZo3rF8kHtRZCi/sEcJN/FLY5sXFi7FleX33Oul7k2s2lmBQna7XJLIOgYH1VCL8zTsybUjypwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5258
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

PiANCj4gDQo+IE9uIEZyaSwgTm92IDE5LCAyMDIxIGF0IDM6MzcgUE0gQWtoaWwgUiA8YWtoaWxy
YWplZXZAbnZpZGlhLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBBZGQgc3VwcG9ydCBmb3IgQUNQSSBi
YXNlZCBkZXZpY2UgcmVnaXN0cmF0aW9uIHNvIHRoYXQgdGhlIGRyaXZlciBjYW4NCj4gPiBiZSBh
bHNvIGVuYWJsZWQgdGhyb3VnaCBBQ1BJIHRhYmxlLg0KPiANCj4gdGhlIEFDUEkNCj4gDQo+IC4u
Lg0KPiANCj4gPiArICAgICAgIGlmIChoYXNfYWNwaV9jb21wYW5pb24oaTJjX2Rldi0+ZGV2KSkg
ew0KPiANCj4gWW91IGFyZSBjaGVja2luIGZvciB0aGUgY29tcGFuaW9uIGFuZCB1c2luZyBhIGhh
bmRsZSwgd2h5IG5vdCBjaGVjayBmb3IgYQ0KPiBoYW5kbGUgZXhwbGljaXRseT8NCk9rYXkuDQo+
IA0KPiA+ICsgICAgICAgICAgICAgICBhY3BpX2V2YWx1YXRlX29iamVjdChBQ1BJX0hBTkRMRShp
MmNfZGV2LT5kZXYpLCAiX1JTVCIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIE5VTEwsIE5VTEwpOw0KPiA+ICsgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAg
ICAgICAgZXJyID0gcmVzZXRfY29udHJvbF9yZXNldChpMmNfZGV2LT5yc3QpOw0KPiA+ICsgICAg
ICAgICAgICAgICBXQVJOX09OX09OQ0UoZXJyKTsNCj4gPiArICAgICAgIH0NCj4gDQo+IC4uLg0K
PiANCj4gPiArICAgICAgIGlmIChpMmNfZGV2LT5uY2xvY2tzID09IDApDQo+ID4gKyAgICAgICAg
ICAgICAgIHJldHVybjsNCj4gDQo+IFdoeT8gTWFrZSBjbG9ja3Mgb3B0aW9uYWwuDQo+IA0KPiAu
Li4NCj4gDQo+ID4gLSAgICAgICBpMmNfZGV2LT5yc3QgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0
X2V4Y2x1c2l2ZShpMmNfZGV2LT5kZXYsICJpMmMiKTsNCj4gPiAtICAgICAgIGlmIChJU19FUlIo
aTJjX2Rldi0+cnN0KSkgew0KPiANCj4gPiAtICAgICAgICAgICAgICAgZGV2X2Vycl9wcm9iZShp
MmNfZGV2LT5kZXYsIFBUUl9FUlIoaTJjX2Rldi0+cnN0KSwNCj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAiZmFpbGVkIHRvIGdldCByZXNldCBjb250cm9sXG4iKTsNCj4gPiAtICAg
ICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoaTJjX2Rldi0+cnN0KTsNCj4gDQo+IEJlc2lkZXMg
dGhlIGZhY3QgdGhpcyBzaG91bGQgYmUgYXMgc2ltcGxlIGFzDQo+IA0KPiByZXR1cm4gZGV2X2Vy
cl9wcm9iZSguLi4pDQo+IA0KPiA+IC0gICAgICAgfQ0KPiANCj4gPiArICAgICAgIGlmICghaGFz
X2FjcGlfY29tcGFuaW9uKCZwZGV2LT5kZXYpKSB7DQo+IA0KPiAuLi53aHkgZG8geW91IGRvIHRo
aXM/DQpUaGUgdGhvdWdodCB3YXMgdG8gY2FsbCBvdXQgdGhlIGVycm9yIHdoZW4gdXNpbmcgZGV2
aWNlIHRyZWUgYW5kIHRvIGlnbm9yZSBpZiB1c2luZyBBQ1BJIHRhYmxlLiANCldlIGFyZSBleHBl
Y3RpbmcgdGhlIGNsb2NrcyB0byBiZSBpbml0aWFsaXplZCBmcm9tIHRoZSBib290bG9hZGVyIGFu
ZCB0byB1c2UgdGhlIF9SU1QgbWV0aG9kIA0KKGluc3RlYWQgb2YgcmVzZXRfY29udHJvbCksIHdo
ZW4gYW4gQUNQSSB0YWJsZSBpcyB1c2VkLg0KVGhlIHByb2JsZW0gSSB0aG91Z2h0IHdoZW4gbWFr
aW5nIGl0IG9wdGlvbmFsIGlzIHRoYXQgYW4gZXJyb3IgY291bGQgZ28gdW5ub3RpY2VkIHdoZW4g
dXNpbmcgYSANCmRldmljZSB0cmVlIGFzIHdlbGwuDQoNCkJlc3QgUmVnYXJkcywNCkFraGlsDQo=
