Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3634B3A6D07
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jun 2021 19:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234176AbhFNRWR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Jun 2021 13:22:17 -0400
Received: from mail-eopbgr1400113.outbound.protection.outlook.com ([40.107.140.113]:17565
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234137AbhFNRWR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Jun 2021 13:22:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N8pAt2kMhVMztOVIt2X5MMoqPpYKAtewPSYTe9BgxDWMND3JZz+SIq/w9YEIZ+ERPPzfxt5Yv1hlKRmkKP6kuSrrGuEJb918I/aFw5hVCjgMEFHhmA7aSgdFSXNWF9gkCDndtQpZUVuOEad7Gj37EjG9s4zDkSZmmxG6YQgnYu6upf+82JCHAT0NlEwu6gc0nYJ4MUNtw1MSiHIhIRRdK2w5wIbSrBy+MuLIFjgDjos4xmnHtOpmxzIk3yw3Wf2iID4h3ds1+322/07IV39LjHV7aqcd60zEnGiVHD4SviUbSwvxG2lGWoyUM0hySLHWsPl4gpo02lEbt1fAurBa5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKookl8ifm1TpwyCzhfvy7ux9jznwR0GKBpiCRzkykg=;
 b=Nh/VTEUj6suv49bVbFarfguNiARs1PZ8JBQ5Zx9yOkum1OP0cRnwDIgMmFmnFvd7MtSroSuHW8hsLecnDDN8p/bFAwwM6rfFRC6t6qSc+0t3jb9lsn6rz8vEFIo3KQkRWSrk20UBDhDMtwwW2/FBHzEJJ2d143EePUTNshThRCCzs4I7kazEd1ecWnVMz55yUajE0IDl1J0CX3tLbpd74ArBusZfp9NhTJ+4qcKd6iJ7TFUYCmvoTE56A8stlQLjSXaBN/7SdP70BDoJ4XM0g+OOb//c1bwDYsm3EF5ZBhSrC+eb83hmprBkxL2hVBeju2BETKFzPw+D+KHrgQHVbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKookl8ifm1TpwyCzhfvy7ux9jznwR0GKBpiCRzkykg=;
 b=P/HvQKxyL4f7Ua/mtFpkQytKwOSuKHFTZXLsP35j8E8TuMJtdvYEWj/uiaPIW/n2/pIah2yehXM6W/N6dWrRmiio/GYUuvIGMPOCtDv1mjoXuBGcgFG6fitbDPPHaDGG/dkzZRbMLMCXlXb6KvX3Q9OHGlP/ZmUzXvisBZw+hIk=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5444.jpnprd01.prod.outlook.com (2603:1096:604:ab::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 17:20:11 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4219.025; Mon, 14 Jun 2021
 17:20:11 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
CC:     Chris Brandt <Chris.Brandt@renesas.com>,
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
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 3/5] i2c: riic: Add RZ/G2L support
Thread-Topic: [PATCH 3/5] i2c: riic: Add RZ/G2L support
Thread-Index: AQHXXuLB0PASyRbiAkKhzTLq+A7wtqsThD0AgABARjA=
Date:   Mon, 14 Jun 2021 17:20:10 +0000
Message-ID: <OS0PR01MB592259E80345CB325B58380186319@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210611165624.30749-1-biju.das.jz@bp.renesas.com>
         <20210611165624.30749-4-biju.das.jz@bp.renesas.com>
 <67e00c18b71875a0aaa7a8a02b2b0507f5d7a575.camel@pengutronix.de>
In-Reply-To: <67e00c18b71875a0aaa7a8a02b2b0507f5d7a575.camel@pengutronix.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [193.141.219.20]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f86bdb35-26f4-4498-9f17-08d92f58aa4d
x-ms-traffictypediagnostic: OS0PR01MB5444:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS0PR01MB5444BC23BA52E341167EA8A486319@OS0PR01MB5444.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EkRiGFfwJoL1L0RzJYQfHr1BDj1qbEQ1xm1SJOI98ZIzexuiSt4+8cMW2D20JuSfLP/9wRVU1zmW6DdR/+ACJXXEkknk0etYk+d+e1BvKAvG67FdsPCgF/R3Baufd5KuId5mrhIuAEON5aZRB0PaYC5vfGLChKyQ6Oet8e1uiNo7Mn0devG4Q/4qNV2zLFcRJxnzqlKYEp7my+HEOEXH+KY56+PK+C9oifIcPRo7oUgz0BQxIIhxqBAEvLXpp/vOjx7gvPm7Z4cWtnqqddOL7MIw77L1DYL8MK3stw5sSS4/x8Y4rYWg/9Bnnjxey6DfUWOvtN0APiUoXPvYQJ3tI6kMrGEM0NvS3lkUONrVB0HKytM0esqTGyafN22dr2j1yxLjjbCv3dTlvZZn1WZlEpqoW00O5vTPN2J5/TAO5ao7Tj5HKKyw/S3CvLC41zYRHsVcquWAoDX7OPX25OCTPsSduE2VeIl0q6ZRN/trwLCQLgO9kXsEItWzUNoWWYvcqwEEI1zFED2sPcNjeTmgKO+rrlL1713FGhxbnwvPvM7a0Zxjyn45wywfFsfmrz+UzktxSJp2aEZT1RUOgYthsEmuMPQPbIOLbjJ9Mg9zyvk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(366004)(396003)(376002)(39850400004)(26005)(38100700002)(7416002)(7696005)(6506007)(122000001)(4326008)(33656002)(76116006)(186003)(6916009)(66946007)(2906002)(66556008)(66446008)(66476007)(86362001)(8676002)(83380400001)(64756008)(54906003)(52536014)(9686003)(478600001)(71200400001)(8936002)(5660300002)(55016002)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?Y2E1T2p5Y2hTNmFHVDFrT3FpMUdYUGRjUlZQU0hEZG5rKzdmVk13MUhOZmFC?=
 =?utf-8?B?N3YvNHFyejloZ0tSVkl3RVF5TDk1SWFGL09YOFBTQXpJWkVnUFEzcWxESDJo?=
 =?utf-8?B?bklFMnJhU3ZKVkVHQVRyMUkrZ3crd3J2aWZiOUZobUFqak5iVzgvRi9BeWFt?=
 =?utf-8?B?UVpzdGVKRFBrYUVTS25EQk55YnVtejEyZ2F2K2hlanp1eGdBK3B0TEpkdWNM?=
 =?utf-8?B?NTlGTlcrWGJabXdYdllWWmltZFFpU0I3Mmkwd2d1THk0N0FXaEZHZEprUHpT?=
 =?utf-8?B?OXBxM3hxRW1tRGRVbEIxRDFHSGg0NEtrbWtFaGZhTFR0KzNPSURiN2M2cUIw?=
 =?utf-8?B?N3gyVWhEaFl1a2E3MFdWSWphVC92WlkrZDczZGVrbjBiVlJ5aWExSXlLRXhV?=
 =?utf-8?B?NHkzWktqaUNCUlhjeDF4cjh1NCtidkMrU202S1FSTjVYRnNOcFFjdUJLZWJR?=
 =?utf-8?B?aUZRbzltSmFJeitCM0tvZ245QmVCZGR4T1BWZ0lwQnJPUWFUQ3FXZjRLU2dY?=
 =?utf-8?B?T0RMV0E1VmtZWUo3ZENZVFZMelhmUHBpZTQ3T2JlS0xFUFk5azZhQ25sUlFM?=
 =?utf-8?B?cGdyOVFObmtjSG1NWFh0T2U0STlnVFo0SGNwVkRLQVFQbm9sSVhrQ1lqdUpT?=
 =?utf-8?B?a1RocXNrRE5IdE1JdWt3cTN4bWhkZjMycVgxVGo0K1RRdHBtMUZhQlJJZnBi?=
 =?utf-8?B?YjFjT2xNM1o3RGNITGNpS01pODh4eVNIN09rNnRJZ3FvbjN1bEVkQS9jMGZH?=
 =?utf-8?B?QU9Cam9IWGN1MDZZU1haVXFVN0c5OHBOTFoxZmkydlAxNy9uNkhha25JajBp?=
 =?utf-8?B?V1dzVm5kQzNMMGlCeEkyR2Zqczh0SVZhYUNpdHZlbjl1ZVRhc3BBWVNtamY3?=
 =?utf-8?B?bDU5TEtrZFovQ0Jkb0ZKN3VVbDZ0MG5sRFVJVEJ0QndlUTdKdVFiTmNPRW1G?=
 =?utf-8?B?dmZMblRUQWRDdmEwZ2R5THJQMDhLMGcyNUt5TnBDemdjMDFOc2ZKdWU4NXA2?=
 =?utf-8?B?RXZtcFlCdmt3eVRkWEd4cmVqMjVTTVdIZTAvMnpzWlpQS1IzOXpGTFBhZGhs?=
 =?utf-8?B?cmExSHZLaEMzZEg5S2tKMnNqQ1VIelBhVXNHWVlKK2w1Z3VzdGVzWE1IU2Ev?=
 =?utf-8?B?NEdtajY0bGJqbkxPanJmeXVLdFlUZUtUYk0yaFg2dVZXMEpUckpiUlJzYW9I?=
 =?utf-8?B?bGxsOVJQMzJsV1grRXArWFdpeU83cEZkSUFUUHgzUGNiUjRIU3htTitxK2l0?=
 =?utf-8?B?Kzhyb21EVWxVRHBxKzluaUxPK3BOVVhPclJKT3MxQzZUM1RYdXJpbTVhbERl?=
 =?utf-8?B?d1A5V1NMUjV0akwxVWVDa2pWN3JEVVNIcENTbm80WFUvSGpLTTFwMHh0THBO?=
 =?utf-8?B?bUw4dUNsakdXN0dmY3QraGs0U3RXV1J6NGNnaWlwemdnVC9EWURZY1lDM2lE?=
 =?utf-8?B?eU44WFBTRXVDVHc2NkFMam5jWlBLUWd6UUowVmNEc3NQTENmUnJ4L2ltU2pX?=
 =?utf-8?B?bk1QSU9tN1F6WCtLQzlYb1YyOG5sd3orUUNCeW1BSXRKNHA4aWtkNjdKV2Vk?=
 =?utf-8?B?Tno0K1JLelJrNHovYm9hUWZJS21DeFZYNjg3MSs1V1I4YTlVeStZOElaZHhy?=
 =?utf-8?B?QTdzQVgzUjhLaDFYallVbWF3SGwxNEF5c1REckY5ZVE0MVppZ1cxMzgrWUIw?=
 =?utf-8?B?eWJtdHArQWVWS3RXK2U3RHR0Z0NQVVorVlNlR08wQW92M1hlWU5jalRrY2h0?=
 =?utf-8?Q?Vxb3Wsb0CIFNUS7T+2NHluRMUsNxYsNms1tjsB8?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f86bdb35-26f4-4498-9f17-08d92f58aa4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 17:20:10.8455
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WWWWG7TZ6orGkgzLRrosp560QMgD1Knw/wmt33DDsZaibrSpzgXfFcGrL31Jos1gMNLZOCU/k5/gf6CQqiXXj4PRJVMiaj4le0OdD96z/Ks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5444
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgUGhpbGlwcCwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggMy81XSBpMmM6IHJpaWM6IEFkZCBSWi9HMkwgc3VwcG9ydA0KPiANCj4gSGkgQmlqdSwN
Cj4gDQo+IE9uIEZyaSwgMjAyMS0wNi0xMSBhdCAxNzo1NiArMDEwMCwgQmlqdSBEYXMgd3JvdGU6
DQo+ID4gUlovRzJMIGkyYyBjb250cm9sbGVyIGlzIGNvbXBhdGlibGUgd2l0aCBSWi9BIGkyYyBj
b250cm9sbGVyLg0KPiA+IEJ5IGRlZmF1bHQgSVAgaXMgaW4gcmVzZXQgc3RhdGUsIHNvIG5lZWQg
dG8gcGVyZm9ybSByZWxlYXNlIHJlc2V0DQo+ID4gYmVmb3JlIGFjY2Vzc2luZyBhbnkgcmVnaXN0
ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhh
ZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9pMmMvYnVz
c2VzL0tjb25maWcgICAgfCAgMSArDQo+ID4gIGRyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcmlpYy5j
IHwgMjEgKysrKysrKysrKysrKysrKysrKysrDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5z
ZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaTJjL2J1c3Nlcy9LY29u
ZmlnIGIvZHJpdmVycy9pMmMvYnVzc2VzL0tjb25maWcNCj4gPiBpbmRleCAyODFhNjVkOWI0NGIu
LjVkYTA5Mjg4YjQ2MSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2kyYy9idXNzZXMvS2NvbmZp
Zw0KPiA+ICsrKyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9LY29uZmlnDQo+ID4gQEAgLTk0MSw2ICs5
NDEsNyBAQCBjb25maWcgSTJDX1FVUA0KPiA+ICBjb25maWcgSTJDX1JJSUMNCj4gPiAgCXRyaXN0
YXRlICJSZW5lc2FzIFJJSUMgYWRhcHRlciINCj4gPiAgCWRlcGVuZHMgb24gQVJDSF9SRU5FU0FT
IHx8IENPTVBJTEVfVEVTVA0KPiA+ICsJc2VsZWN0IFJFU0VUX0NPTlRST0xMRVINCj4gDQo+IFRo
ZXJlJ3Mgbm8gbmVlZCBmb3IgdGhpcy4gVGhlIHJlc2V0IEFQSSBkZWZpbmVzIGlubGluZSBzdHVi
cyBzbyB0aGlzIGNhbg0KPiBiZSBjb21waWxlZCB3aXRob3V0IFJFU0VUX0NPTlRST0xMRVIgZW5h
YmxlZC4NCg0KSG9wZSB5b3UgYXJlIG9rIHdpdGggR2VlcnQncyBzdWdnZXN0aW9uLCBhcyBSWi9B
IGJvYXJkcyBhcmUgcmVzb3VyY2UgY29uc3RyYWluZWQuDQpTbyBpdCBpcyBub3QgZ29vZCB0byBl
bmFibGUgZm9yIHRoZW0uDQoNCj4gDQo+ID4gIAloZWxwDQo+ID4gIAkgIElmIHlvdSBzYXkgeWVz
IHRvIHRoaXMgb3B0aW9uLCBzdXBwb3J0IHdpbGwgYmUgaW5jbHVkZWQgZm9yIHRoZQ0KPiA+ICAJ
ICBSZW5lc2FzIFJJSUMgSTJDIGludGVyZmFjZS4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
MmMvYnVzc2VzL2kyYy1yaWljLmMNCj4gPiBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtcmlpYy5j
IGluZGV4IDRlY2NjMGY2OTg2MS4uYTM4NjA2MzFjNmRiDQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yaWljLmMNCj4gPiArKysgYi9kcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLXJpaWMuYw0KPiA+IEBAIC00Miw4ICs0MiwxMCBAQA0KPiA+ICAjaW5jbHVkZSA8bGlu
dXgvaW8uaD4NCj4gPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPg0KPiA+ICAjaW5jbHVkZSA8
bGludXgvb2YuaD4NCj4gPiArI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPg0KPiA+ICAjaW5j
bHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC9wbV9y
dW50aW1lLmg+DQo+ID4gKyNpbmNsdWRlIDxsaW51eC9yZXNldC5oPg0KPiA+DQo+ID4gICNkZWZp
bmUgUklJQ19JQ0NSMQkweDAwDQo+ID4gICNkZWZpbmUgUklJQ19JQ0NSMgkweDA0DQo+ID4gQEAg
LTg2LDYgKzg4LDExIEBADQo+ID4NCj4gPiAgI2RlZmluZSBSSUlDX0lOSVRfTVNHCS0xDQo+ID4N
Cj4gPiArZW51bSByaWljX3R5cGUgew0KPiA+ICsJUklJQ19SWl9BLA0KPiA+ICsJUklJQ19SWl9H
MkwsDQo+ID4gK307DQo+ID4gKw0KPiA+ICBzdHJ1Y3QgcmlpY19kZXYgew0KPiA+ICAJdm9pZCBf
X2lvbWVtICpiYXNlOw0KPiA+ICAJdTggKmJ1ZjsNCj4gPiBAQCAtMzk1LDcgKzQwMiw5IEBAIHN0
YXRpYyBpbnQgcmlpY19pMmNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZQ0KPiAqcGRldikN
Cj4gPiAgCXN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcDsNCj4gPiAgCXN0cnVjdCByZXNvdXJjZSAq
cmVzOw0KPiA+ICAJc3RydWN0IGkyY190aW1pbmdzIGkyY190Ow0KPiA+ICsJc3RydWN0IHJlc2V0
X2NvbnRyb2wgKnJzdGM7DQo+ID4gIAlpbnQgaSwgcmV0Ow0KPiA+ICsJZW51bSByaWljX3R5cGUg
dHlwZTsNCj4gPg0KPiA+ICAJcmlpYyA9IGRldm1fa3phbGxvYygmcGRldi0+ZGV2LCBzaXplb2Yo
KnJpaWMpLCBHRlBfS0VSTkVMKTsNCj4gPiAgCWlmICghcmlpYykNCj4gPiBAQCAtNDEyLDYgKzQy
MSwxNyBAQCBzdGF0aWMgaW50IHJpaWNfaTJjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UN
Cj4gKnBkZXYpDQo+ID4gIAkJcmV0dXJuIFBUUl9FUlIocmlpYy0+Y2xrKTsNCj4gPiAgCX0NCj4g
Pg0KPiA+ICsJdHlwZSA9IChlbnVtIHJpaWNfdHlwZSlvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEo
JnBkZXYtPmRldik7DQo+ID4gKwlpZiAodHlwZSA9PSBSSUlDX1JaX0cyTCkgew0KPiA+ICsJCXJz
dGMgPSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0KCZwZGV2LT5kZXYsIE5VTEwpOw0KPiANCj4gUGxl
YXNlIHVzZSBkZXZtX3Jlc2V0X2NvbnRyb2xfZ2V0X2V4Y2x1c2l2ZSgpLg0KDQpPSy4gV2lsbCBk
by4NCg0KUmVnYXJkcywNCkJpanUNCg0KPiANCj4gPiArCQlpZiAoSVNfRVJSKHJzdGMpKSB7DQo+
ID4gKwkJCWRldl9lcnIoJnBkZXYtPmRldiwgIkVycm9yOiBtaXNzaW5nIHJlc2V0IGN0cmxcbiIp
Ow0KPiA+ICsJCQlyZXR1cm4gUFRSX0VSUihyc3RjKTsNCj4gPiArCQl9DQo+ID4gKw0KPiA+ICsJ
CXJlc2V0X2NvbnRyb2xfZGVhc3NlcnQocnN0Yyk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+ICAJZm9y
IChpID0gMDsgaSA8IEFSUkFZX1NJWkUocmlpY19pcnFzKTsgaSsrKSB7DQo+ID4gIAkJcmVzID0g
cGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfSVJRLA0KPiByaWljX2lycXNb
aV0ucmVzX251bSk7DQo+ID4gIAkJaWYgKCFyZXMpDQo+ID4gQEAgLTQ3Miw2ICs0OTIsNyBAQCBz
dGF0aWMgaW50IHJpaWNfaTJjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ID4gKnBk
ZXYpICB9DQo+ID4NCj4gPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgcmlpY19p
MmNfZHRfaWRzW10gPSB7DQo+ID4gKwl7IC5jb21wYXRpYmxlID0gInJlbmVzYXMscmlpYy1yOWEw
N2cwNDQiLCAuZGF0YSA9ICh2b2lkDQo+ID4gKyopUklJQ19SWl9HMkwgfSwNCj4gPiAgCXsgLmNv
bXBhdGlibGUgPSAicmVuZXNhcyxyaWljLXJ6IiB9LA0KPiA+ICAJeyAvKiBTZW50aW5lbCAqLyB9
LA0KPiA+ICB9Ow0KPiANCj4gcmVnYXJkcw0KPiBQaGlsaXBwDQo=
