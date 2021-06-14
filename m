Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957B63A6B3E
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 18:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234504AbhFNQHC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Jun 2021 12:07:02 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:52897
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233910AbhFNQHC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Jun 2021 12:07:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GxQOjVaccmpOb0qm/0FaL6uupMHQajqhJYVrjowLcrZVUoeb1GgWz/FDRt1zBVwHN5gdPMhV8msJRC2287WAjfPcR6AAYt3H6FJVQGXAFjSfBS30xgCgwasH/mU2dXIO/uDqvV61s+gpnbvH0LE0p8eyRggrirR9WCqK5YLQkRrb0NaJ1WEWBVGZLvfR1dihwMbIPxlFwq4LbrAhASsAItO3GK5pyYXPphaIV41WBFDdTCVXjPynueA5TRCj4GKVOoFHIArulbP9ozbdUfbm+FC3gEjLWPsoJrBXpYcRQsfid/I47YrHE7CYX8++h/ofTemzE4hBIHXAOnSgAcFsFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coaIb/jUJhBM7hAB68i1/dVKPZIo3o3GZnFJ1BenKKs=;
 b=YxznwepTrDdsPxOCa6JTR6cb3YTbaD87oKUcSbBN0zufZsyIHfDtKRVw4z1JEcpmuqXSw6VfOcB+Hw5uHOUWmwDjW7jnHwXrPd6vWQzLV+D0ryLJKyTa7heHdctV8bl4LLBig8l9Vk3+bPZoyAmrQaj3WVARwAoVTldODTpFvKnWlWITJUy2a0oQCK8JT2BS6l4iCmolEY5tDAxPQEhjiB6c0zLy0ymqnUAOPP7crvqmCfFQZbHuhutdkSyBtVSsVI8IJiup72zDAUbyLVfm3bkqvUsSy/IX6q54JiuYH1+heUKfpaMhdk/1uuL3EvPPh5ShlfGQsPSJO4Kj2/eO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coaIb/jUJhBM7hAB68i1/dVKPZIo3o3GZnFJ1BenKKs=;
 b=YPSWIRZERueZ05eymIn6aNBfDQ+fGb973EpgKklquKYKftbxqyjh+v/EOcmx7l3Opum6AgNwv4y3GsZ2qXUjhuEF5UQfe5w3xpIxPAwEmXqeCdfGe5S+RBgmoT1AXGzw4/U6VcUOI7AoQHaZwdRVKqOKlN4F79dzN8BZ79cjb9M=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB4869.jpnprd01.prod.outlook.com (2603:1096:604:7c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Mon, 14 Jun
 2021 16:04:56 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 16:04:56 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Philipp Zabel <p.zabel@pengutronix.de>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?utf-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence98@sch.bme.hu>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Mike Rapoport <rppt@kernel.org>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] i2c: riic: Add RZ/G2L support
Thread-Topic: [PATCH 3/5] i2c: riic: Add RZ/G2L support
Thread-Index: AQHXXuLB0PASyRbiAkKhzTLq+A7wtqsTdo6AgAA5J6A=
Date:   Mon, 14 Jun 2021 16:04:55 +0000
Message-ID: <OS0PR01MB5922831680086DECF7F7920386319@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210611165624.30749-1-biju.das.jz@bp.renesas.com>
 <20210611165624.30749-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdWWgehDTxTcm8=ooq2-4BkY0jgo+hwfrM_PHc6iw6aP8A@mail.gmail.com>
In-Reply-To: <CAMuHMdWWgehDTxTcm8=ooq2-4BkY0jgo+hwfrM_PHc6iw6aP8A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux-m68k.org; dkim=none (message not signed)
 header.d=none;linux-m68k.org; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d18a37b4-2613-4ce9-f943-08d92f4e2740
x-ms-traffictypediagnostic: OSBPR01MB4869:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB486900693A9C6D9FC90FDB9986319@OSBPR01MB4869.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2qU/D2PWlTQsXd9Zg1cHdMq/Mivit0iVrgJBz2LvwKkp1/CRgHQZ/6s1ANGY8BwK6Z/PNxd/mNNFzIuxF+zP/Uo+O3fKmv0tJVRTx8LWWRO42gtafkyqKsnt5lPNCyoWwfGTCLsZABTkDC/EMfSIVwqKstga38fb07a2evycb0gxjwHp3BOowtDlcLmW8e03vpwqCvd/qYm2jkgHFwK3gcjYhovEBLO9we/DwtZSJsbMVQ3aNtnVKWpE3gdupNi/r/mFrSfTdrZUowi48FBKUgzutQk1fs+OloPgPcUR0J/BIK1YnQS4FD9+/d40rpB5NRGJQL/mMRqXLO4swH6p7NMCjSmR3Uv/qthVOR8G8idciKTKQk20xwZnEufWUQ8O4h/baF4Q/cHYGVOkaK5gNv+KslE4lS7+oAc8xQkpKu3ZqPfSVDPZe8Bu/ka7oxWROiDWmiqTOgOH7ERI470mmb3q5YM63Q81GxmaEXU9uuGT8nHfkKtZKWn/EgFVkflCzNQCJMBuadA5Ajbv2xP6vEag9ZfCyHLs4D/zdAAoB747Pt0/a7jHFXrjh0DaU1PZSqBeW3pT/WhA3irfgHOwHQxTQh8q/W0i7hNxqjGzH98=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(366004)(136003)(346002)(4326008)(76116006)(66946007)(122000001)(6916009)(66476007)(54906003)(86362001)(66446008)(66556008)(33656002)(64756008)(8676002)(5660300002)(316002)(7416002)(9686003)(53546011)(6506007)(55016002)(7696005)(478600001)(186003)(52536014)(2906002)(71200400001)(8936002)(38100700002)(83380400001)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?ZGQxaUlKZWpKS2pRSWgyRVRWOE9PTVFVMzk2dklxZnBxNXNaWnk5bUNUOHAx?=
 =?utf-8?B?akM2WGxEYjBBK1ZVbWtTcURnT2YyZHBzQzdOVnZRZGJDL2FrVWw1SW1NS2tT?=
 =?utf-8?B?T3gwMlJGNFJGK3BUQ0oxL1N6ZUtVTUs5U2xFMWZSdXVYZkN1NFllMDNSdzU3?=
 =?utf-8?B?QjZBRVRJbVdablVBREc4R3FGbDV4eHNhU2lvb3RkVHhQRXYySUt5VGZFL1Qv?=
 =?utf-8?B?di9wcGF2RmkzS1c2REM4QnVmRG4vKzNuaWR6cFhySjM2cmp0YkEySkJMaWIw?=
 =?utf-8?B?a2E0Yjgrd2lWeW5HcWJOSTJZU0x4a0E3ek84aTFZZC9SMEZkS2xqZUxrckwr?=
 =?utf-8?B?N1NyUU1VMUQwdzlsU1p6NlB4ZW85QVNCRmwwVUFmSTgySU1CS1RtOGJ1Qnh3?=
 =?utf-8?B?aVpWY1I4aHpZTU1BWVRSZWVOdElqREwvenVhR2tyUGhTbGVSR2p5UVNTN2M4?=
 =?utf-8?B?NWJSOTNQVlZiWDNJRHprSFU5THVMMEFRNFdwejV3cFN5bDczNTMySzVpVTRz?=
 =?utf-8?B?eHJGeDV5UjhSemtQSk9OdWdXSDJDZEFLVm9lOExZNmdMRlRqM29pNUY5c01X?=
 =?utf-8?B?dUZ1MklNZmxrZlVQbmcvbGhvbXhDeU53L0QzUDhKWHpOZHVJT29qN08rZ1Zw?=
 =?utf-8?B?U2RIWVRMdmtORHRkSkJrSkVyVlMyMnNLR2xoNlA2dXZvU3hQWmVGME5QMTQ0?=
 =?utf-8?B?cHM0dVNhYllzMmNndURabTA5MFN0eWwwZUV2RkxTMkxRbmlaR0EyVW8yUDhW?=
 =?utf-8?B?cGdmNEU1eVN3WmczUVNxY3NSOW1XaDF4OXlyS0g1ZncxdEg4ZVZkeHJCQ1Rw?=
 =?utf-8?B?N3RTNjZjN0c2ZEVLV0NVcHFLZ0xLL2FGSElLbDQ2SmRvNHp1RnEvakZIalNu?=
 =?utf-8?B?TURvbFJXU09LY2ZVOC9BZHoxVnpDbmJmcmQzbnJqajFEVzZXcUI3eVhNZWM2?=
 =?utf-8?B?T0NrL1kwc01iajd1Y2xkdHBxWDVKWEpnWWlQYm91KzlYMzdMSE05TFFRUHFK?=
 =?utf-8?B?Ym1kM2FqcHJORklkaGx5WVI2dGdWNS9MWCtHTWRGNi93WUlGeW5wdFJRT1I3?=
 =?utf-8?B?NjcyMHdBLzVNS3ZJK3MxSGpDWWxSeDlnZzdyMUpNZFhOQm9ZbVRzN1BlNnBy?=
 =?utf-8?B?ZlRPQTBFUlF0ZmVQVGhNYUFxWk9CSU42NHdyekd2djAzV3hHRS9BajFsNTcr?=
 =?utf-8?B?VmNELzJrWXFUbUZYYlViZUl2UVlwSy93bnpLTG0zZHRzS1JjTExka3kwcDFB?=
 =?utf-8?B?UngxVlhpaGRBKzJmQmlmZjl1WW5BRndxdjQzWUtCa0tvMmllVTdJMWdUY0Fm?=
 =?utf-8?B?cWVsbjVpNFFhd2pVRE5CcGZsUXhucTA5em1tZGxDZ1NhNTVRT3FNLzhxVytj?=
 =?utf-8?B?VXExYzVaOUJzQUhnZUNLLzViYk1WU2J0djN3WHZVZllwc2V3bnE3bXVGWDVo?=
 =?utf-8?B?QmZ5YjNwdGM1TGRVOGx3MUoxWGpQaVpGakNGemhiOUd1aFc1c0tBREtrN3Nt?=
 =?utf-8?B?SnRVSm9TckRGcW9jOG9XY3lVaXM0QXZrT1ByWVVwcXdBdEppUDdYcjVkSXF6?=
 =?utf-8?B?Z3JIZXh3c09BQ1R3VlZ5cmVKNEdkL2xQaHdqNUJZdE5HSVV2TUVzTytyOXRN?=
 =?utf-8?B?WlFkcDdoeTQyUUFGNDZ6Z3FIbEgrQ1g0aDc4QTMwNGZVSFc5TlFPTjIxd1JT?=
 =?utf-8?B?VDJWUTFMa0FyR0IxZ0FoQUNtSXE0SFNXN3RLQ3pWZzdaT3pBSTJBOVZuUGh6?=
 =?utf-8?Q?Qm0sf3OVKG1zzvLFHljRg0vWEV8XSMy2QuOrbgz?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18a37b4-2613-4ce9-f943-08d92f4e2740
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 16:04:56.0059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eJkpihT3pGS6L0fDOnxL/92GoHURI6LrEKOVeIdRdcFafUDbY+jK8IRN8VsEYv6Iy2qAeqqtmP3tV9vgrqJlOPuMaxyDhKvyEYPVpdUSPf4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4869
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy81XSBpMmM6IHJpaWM6IEFkZCBS
Wi9HMkwgc3VwcG9ydA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIEZyaSwgSnVuIDExLCAyMDIx
IGF0IDY6NTYgUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90
ZToNCj4gPiBSWi9HMkwgaTJjIGNvbnRyb2xsZXIgaXMgY29tcGF0aWJsZSB3aXRoIFJaL0EgaTJj
IGNvbnRyb2xsZXIuDQo+ID4gQnkgZGVmYXVsdCBJUCBpcyBpbiByZXNldCBzdGF0ZSwgc28gbmVl
ZCB0byBwZXJmb3JtIHJlbGVhc2UgcmVzZXQNCj4gPiBiZWZvcmUgYWNjZXNzaW5nIGFueSByZWdp
c3Rlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1h
aGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNo
IQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvS2NvbmZpZw0KPiA+ICsrKyBiL2Ry
aXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnDQo+ID4gQEAgLTk0MSw2ICs5NDEsNyBAQCBjb25maWcg
STJDX1FVUA0KPiA+ICBjb25maWcgSTJDX1JJSUMNCj4gPiAgICAgICAgIHRyaXN0YXRlICJSZW5l
c2FzIFJJSUMgYWRhcHRlciINCj4gPiAgICAgICAgIGRlcGVuZHMgb24gQVJDSF9SRU5FU0FTIHx8
IENPTVBJTEVfVEVTVA0KPiA+ICsgICAgICAgc2VsZWN0IFJFU0VUX0NPTlRST0xMRVINCj4gDQo+
IGlmIEFSQ0hfUjlBMDdHMDQ0Pw0KDQpPSyxBZ3JlZWQuDQoNCj4gDQo+ID4gLS0tIGEvZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1yaWljLmMNCj4gPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LXJpaWMuYw0KPiBfa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKnJpaWMpLCBHRlBfS0VSTkVM
KTsNCj4gPiAgICAgICAgIGlmICghcmlpYykNCj4gPiBAQCAtNDEyLDYgKzQyMSwxNyBAQCBzdGF0
aWMgaW50IHJpaWNfaTJjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4gKnBkZXYpDQo+
ID4gICAgICAgICAgICAgICAgIHJldHVybiBQVFJfRVJSKHJpaWMtPmNsayk7DQo+ID4gICAgICAg
ICB9DQo+ID4NCj4gPiArICAgICAgIHR5cGUgPSAoZW51bSByaWljX3R5cGUpb2ZfZGV2aWNlX2dl
dF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0KPiA+ICsgICAgICAgaWYgKHR5cGUgPT0gUklJQ19S
Wl9HMkwpIHsNCj4gPiArICAgICAgICAgICAgICAgcnN0YyA9IGRldm1fcmVzZXRfY29udHJvbF9n
ZXQoJnBkZXYtPmRldiwgTlVMTCk7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChJU19FUlIocnN0
YykpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKCZwZGV2LT5kZXYsICJF
cnJvcjogbWlzc2luZyByZXNldA0KPiBjdHJsXG4iKTsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gUFRSX0VSUihyc3RjKTsNCj4gPiArICAgICAgICAgICAgICAgfQ0KPiA+ICsN
Cj4gPiArICAgICAgICAgICAgICAgcmVzZXRfY29udHJvbF9kZWFzc2VydChyc3RjKTsNCj4gDQo+
IEp1c3Qgd29uZGVyaW5nOiBkb2VzIGl0IGhhcm0gaWYgdGhlIGRyaXZlciBpcyB1bmxvYWRlZCBv
ciB1bmJvdW5kZWQsIGFuZA0KPiByZWJvdW5kIHdoaWxlIHRoZSBJMkMgY29udHJvbGxlciBpcyBu
b3QgaW4gcmVzZXQgc3RhdGU/DQoNCkkgaGF2ZSB0ZXN0ZWQgYW5kIGl0IHdvcmtzIGFmdGVyIHVu
bG9hZGluZyBhbmQgcmVsb2FkaW5nIGl0IGFnYWluLg0KDQpDaGVlcnMsDQpCaWp1DQoNCj4gDQo+
ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJ
WkUocmlpY19pcnFzKTsgaSsrKSB7DQo+ID4gICAgICAgICAgICAgICAgIHJlcyA9IHBsYXRmb3Jt
X2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX0lSUSwNCj4gcmlpY19pcnFzW2ldLnJlc19u
dW0pOw0KPiA+ICAgICAgICAgICAgICAgICBpZiAoIXJlcykNCj4gPiBAQCAtNDcyLDYgKzQ5Miw3
IEBAIHN0YXRpYyBpbnQgcmlpY19pMmNfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UNCj4g
PiAqcGRldikgIH0NCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBy
aWljX2kyY19kdF9pZHNbXSA9IHsNCj4gPiArICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmVuZXNh
cyxyaWljLXI5YTA3ZzA0NCIsIC5kYXRhID0gKHZvaWQNCj4gPiArICopUklJQ19SWl9HMkwgfSwN
Cj4gPiAgICAgICAgIHsgLmNvbXBhdGlibGUgPSAicmVuZXNhcyxyaWljLXJ6IiB9LA0KPiANCj4g
UGxlYXNlIGZpbGwgaW4gLmRhdGEsIHRvIGF2b2lkIHJlbHlpbmcgaW1wbGljaXRseSBvbiBSSUlD
X1JaX0EgYmVpbmcgemVyby4NCj4gDQo+ID4gICAgICAgICB7IC8qIFNlbnRpbmVsICovIH0sDQo+
ID4gIH07DQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBtNjhrLm9yZw0KPiAN
Cj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2Fs
bCBteXNlbGYgYSBoYWNrZXIuDQo+IEJ1dCB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3Rz
IEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZw0KPiBsaWtlIHRoYXQuDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg==
