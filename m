Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4823C755F1E
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jul 2023 11:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbjGQJUz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jul 2023 05:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbjGQJUy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Jul 2023 05:20:54 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E298EC7;
        Mon, 17 Jul 2023 02:20:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c6pE3lPnXIIO8ezi8ejXz+gYD851SoySjTL1Zb0SmeXxedNySJk2PZoDmAu9TMibMhmw4L3QqQQu9iLAvgLFaSBovZzs+kjCrvwBjiehfiuD6F85HGVxyp354Q1K25jDNVRBlod0eIt5OkDv3AP0f8b6Tk2FSGXB9ypgUob/qCIBhuG/AivmudoovTnCzyCsawHfX865j9W7GJ0xobLcaoBXJPYx7u7VDiq5xxG9yJi6UuwenOGjLBDUkwU3gD+8SUPt8NA2GI6mLFRSXtlbVDirdriO/bmDGSnhbF1DMj/6TD9B7pzoY57bD/oHyxVZvb0A9x1MEi3OosoUYeDvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PKGf0MLilO/9g4Od2IfcBmH2K8QlbIJrcIG4AVFJ/Wo=;
 b=mKJypPq3tFVnziJ5SDt18ev/uOWJ7/KZSrM4u0rWSPeHOv1DvOLU9C+dpqd9BQ+Nd045qUZ/g30ObMowiQnZScLyyKJbZp5K43n5mHHL8tMs0D2Dz6g+5MWxtYSMOvoJxdEITwp6PsJio2Nhbvf57F88CDTdTmvlG6Suxm5I84kyI4Z6/Ml6eQmKprDh+e3+PGJVKqoDERA3GnrevjKm6JTwBvK8iTVA67s4l41vwd7EDf5xwvhShoGoOXBwgW2IcQvjN1XWZ04camZ0CoupKZfve8evWE2sJoj+fpEwp+2ohgMJ5RAtWdpfYGzt18lQVrNkXRZebX0DD5UtgBKG+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PKGf0MLilO/9g4Od2IfcBmH2K8QlbIJrcIG4AVFJ/Wo=;
 b=AFVpGRyMi81E7kDK8Zh5xRTHUiIIzHAlLiiza0FfEn1VM/Dc3q4wkCdtEwyS5DIS3td0+vtWHPGYznP1QRA791zY75ZL0kqciQcrpefDmH4iMSPvfcp4QaI91vc0iY3K1ozIBixhWu5LY4wtqy04g7Y/Mic6VMA1UT6wWZXuxbs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS7PR01MB11666.jpnprd01.prod.outlook.com (2603:1096:604:244::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Mon, 17 Jul
 2023 09:20:50 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::de3f:f3ca:8629:c80d]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::de3f:f3ca:8629:c80d%4]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 09:20:50 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Peter Rosin <peda@axentia.se>,
        Michael Hennerich <michael.hennerich@analog.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] i2c: mux: ltc4306: Simplify probe()
Thread-Topic: [PATCH] i2c: mux: ltc4306: Simplify probe()
Thread-Index: AQHZuBZ/LI78arOrXkaJXFmnnLEQza+9rqEAgAAA3vA=
Date:   Mon, 17 Jul 2023 09:20:50 +0000
Message-ID: <OS0PR01MB5922C742AF9B3C1161BAAC2E863BA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230716185108.283447-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdX2NuqFVW5LBV4xY9ecU1z5oAVwAj=tebiuu+377EBaig@mail.gmail.com>
In-Reply-To: <CAMuHMdX2NuqFVW5LBV4xY9ecU1z5oAVwAj=tebiuu+377EBaig@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS7PR01MB11666:EE_
x-ms-office365-filtering-correlation-id: cb92e557-d95e-404d-d2cc-08db86a71ca8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k1TxS1giUX3butWkSuYXdyMtwvAKjJ4TyKryQstgoZ0JS734mk8R5V12tPgVTNZVclAmV9CM91p0+G/FLMs6TnBQTrPifWbcIQ0jKgyRaMvIGs51J6kczBmW3vdRrpgYQW3KW/Ak6ujXdfQ9wr6Qf/Fz5KO59fr4aqwgxCbcdyIIRkAECMSEmifH38UfIQ7AohDqtU+Az91TQlx2OMGCVmQLOyGD28Fomn/O47xRjn2U0qTFYTBMTBA6DyqGBfBmjuE+kIwKoMZgVruOyF0UGGhSpT7RQ8l3ssX1lINJTjydUdjyad61QWb6wQlluriIUrtkjuCudTfp/4un2LeVzg/esP5gcqjlQL/3DtxvYBLQpNFnio8/ko9rEusR1htAf4OjH1mdFMR22ZFRHy5aAw6/XRYRLmDZwsNNJCL4RdSz7NIGSl0+L/NKMn8nN5oisBGrYW811rkP1HjKtULWLROhj0IUqgIy2V3X/rtWba0g42Uhfcv2bVbefXvuV2LJv+XFYlIOvVJinGJ9n3aTx8J1aeSrhlsW0HtQ7t7Cs38N740jaoc+qUhTDMKuGa0AFmEGA10IO8PzXvGIeRj0niqwgw9/6lY9Oerh+ZuCqiKWtdYK9DODVV4N3OjHyeMH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(451199021)(7696005)(6506007)(26005)(9686003)(53546011)(122000001)(66574015)(83380400001)(38070700005)(86362001)(33656002)(38100700002)(186003)(55016003)(8936002)(8676002)(2906002)(41300700001)(478600001)(5660300002)(52536014)(4326008)(76116006)(6916009)(316002)(66446008)(64756008)(66556008)(66476007)(66946007)(54906003)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cTQ0bGNUdnMxRnRkakRUUnRVUGRTa2VsQkt2QTdaMjI2NmtNUFRCQ0J3THM2?=
 =?utf-8?B?WWliSXkwRS9lZUJSQnpYdlFJMjJpYis0YUpHUTVueUoxMVd1dEIwcjcrNW4y?=
 =?utf-8?B?V2dMTFgxLzlobFJQb1A5WUdPaCtEb0RXOGRiUFQ2M1Q1UmxQclo5TVErUk9Q?=
 =?utf-8?B?OEFiK3RPVFlrM09ncWZZRmpiaStFem45dUd1NEZYdXdjSkp5b0xJeWJGN2FP?=
 =?utf-8?B?bFU3TXRFV1BTSHJ0dFU1OVVwVXJXRkFWZGRQT2RMd24ySnVlNHUvVE9vUWRW?=
 =?utf-8?B?UDJaSWhBa0dQOS9mcmZlOURGMS9GSG1uckVzUysrT0ovVUdEMEFqcDByUFBn?=
 =?utf-8?B?VDArVzBxYU5YOTVoMU9xQW1Da1lyUUcxdnp1S2h0OUtxQlBxaVFLakxWeGlH?=
 =?utf-8?B?K0lWUUM3WHVrSG5qTWdGSHljQVRpNERGdlFtay90Qys3NHJDak5oeFhwaUhM?=
 =?utf-8?B?czdRTld1dVdxYVRUZmtJb0d2cytCaEwyMlNNbHRFREYrVzJoUmQyRVVNZlFU?=
 =?utf-8?B?Wm5MeFhKMkZTeGtwUko2MnJJMEtIYm1tZ1BmTUo4MG03cHRVYm8vYzdNRjlh?=
 =?utf-8?B?d2dyY200dXlVaFhTa1FpejRveWxTSTh5UnZ1eW5KWFhYY29xWVllbmFJYzBE?=
 =?utf-8?B?dDM4ZnJoTnd0ZmJkLyttME9MNlJyTi8xOEVHZzREUG5qQUhZbW9YNW9nTkNx?=
 =?utf-8?B?YVV4ZUU3ckxueHhXSnF0ck5zQ2pNbU5UWTVXTU5XOFBVRm9OUHRWY1JpM2JB?=
 =?utf-8?B?V1d3eFRQV1hNWGZobnorVTMyMGZINU9vZ0NlaEd3SDF3dk1nTFVWVjlHdVM0?=
 =?utf-8?B?b3c1aDd3OGFLQzA2NEI5bmc4MGRuNWFpTjdVenp4SER4bDV0TTQrRFZ1dUNp?=
 =?utf-8?B?SkJXdjkyTGk4Ukk0N2RiOTg2YzFFelBZejgrOHRIaFdwaVl3YWNOV055N1FJ?=
 =?utf-8?B?WmVXS2F0VWNFU21iTDRUa0s0RzlNUFRSSlA1RTE0SkN2WHBiaVhGWDEvekZk?=
 =?utf-8?B?cktmbXJoUUpBYnN5ZVpodlhwKzdrUS96MGlKTG9yR3J3VGdzeHo0cDJqMk02?=
 =?utf-8?B?dWtYNCt5RU9EYXFKOEVwUjl1WVY0VmIvNzdQUEFDWmppeVJDbHV3QkNkN3hI?=
 =?utf-8?B?V3dqb2dhWk1NYmhucExKY3RiRGVkRWNhUlBERE1MVlVadUVlRDV5b0Q3bHI1?=
 =?utf-8?B?cThJaXIrQTg4cm5TQ0dZZUxZbWhEOFRYY2pTSUZtZXJ5dGFvcnJQazRqdlZV?=
 =?utf-8?B?bllOWFU2SzF1WWZCdE02TXJNRXhKYU85RDlXNTNKUlNCR1JodWREMEw3K1ZT?=
 =?utf-8?B?dkl4bW9MaE9PcmFSdzVDZlFZSXJhM3g4RlU5N0lBTEo3Wjk5TzBjSUYydDFa?=
 =?utf-8?B?QkZ2N3JQTDJxbzJZZFFHSHNnMWtPVDF5cFF0Zk5GYkdnTFFzSDJzcHY0MW1J?=
 =?utf-8?B?cVV6YnI0M0dFYzM0RkJLVnRoTFpYVEFSU3BuQjkvS1lFTFJTZXRHMkFhNGt1?=
 =?utf-8?B?MVJUVEg4VDhwSVNCQzhycGlDWDlEUS9JZFdnWjRIVkV1ejhURXY2M2RRRExI?=
 =?utf-8?B?T3ZrUTAwYjZOZ3Vja3hyRWZuU2J1RkZiYWxiMDVVNGhBbEl5N2RsMlR6eURy?=
 =?utf-8?B?K0JSLzlUTVJoL2F5VXBUUEtqOFpIL00xcjJNd3BJbVZPTUp2enhKbzFPQWNO?=
 =?utf-8?B?Rlpzci9ZRWVhSWxFcGZsMEVEMFdNMWlCU3ljOXo4MWkyZi9PZU9LRlovMjRD?=
 =?utf-8?B?T3hmSHZCd3FxSGVDUFNleE51OFlVbkFmTmRodkxsV1Jwa2tjSWVuZ0pQUzRk?=
 =?utf-8?B?aUZWKy9qdXEyaVZBcUxKYktkRmtoMkQ3cGdYR2d5cFh2UUJvQzZaNGFLK2Ju?=
 =?utf-8?B?VlFleXhMOWFVS0k5RGs1ZjRKdC85c29BSmZGQjRVQWhkZktGUkx6Wkp0WWRt?=
 =?utf-8?B?T2Fjc0tQVDVvb2Z4bjNvTHZPSlJzazB5djVzSk5sYWlmY21zaTU4RTVHNi9y?=
 =?utf-8?B?SDA1UDZkWGtKMkE5L3pDT1NMRExieXBmTWxSOTNuR3dwNENxSFpnMTU4Smk5?=
 =?utf-8?B?QitLYllIVmVvZkF4OUo0dHB4bDVFL0RKV1VEcjFOTlFReVdqWjVzZlJpTkM4?=
 =?utf-8?B?RXl3cUNrd0VUSVFJZ2pKbW56N2ppV3Znb3RESE1UcDNuZzhyNkJFcWNJTDhv?=
 =?utf-8?B?RFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb92e557-d95e-404d-d2cc-08db86a71ca8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2023 09:20:50.1272
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qwuTF5sNHX1AxM23f5SfDAJdKm16SB6jyJPuBkSxXj+4lCPyQ9lD/nRtrDg9w4fWTEarCWOIu7Gg64mHcEcK0/z62pfJ19MUadfLN2I7sbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11666
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IE1vbmRheSwgSnVseSAxNywgMjAyMyAxMDoxNyBBTQ0KPiBUbzogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBDYzogUGV0ZXIgUm9zaW4gPHBl
ZGFAYXhlbnRpYS5zZT47IE1pY2hhZWwgSGVubmVyaWNoDQo+IDxtaWNoYWVsLmhlbm5lcmljaEBh
bmFsb2cuY29tPjsgbGludXgtaTJjQHZnZXIua2VybmVsLm9yZzsgUHJhYmhha2FyDQo+IE1haGFk
ZXYgTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+OyBsaW51eC1y
ZW5lc2FzLQ0KPiBzb2NAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGky
YzogbXV4OiBsdGM0MzA2OiBTaW1wbGlmeSBwcm9iZSgpDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4g
T24gU3VuLCBKdWwgMTYsIDIwMjMgYXQgODo1MeKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBi
cC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gVGhlIGx0YzQzMDZfaWRbXS5kcml2ZXJfZGF0
YSBjb3VsZCBzdG9yZSBhIHBvaW50ZXIgdG8gdGhlIGNoaXBzLCBsaWtlDQo+ID4gZm9yIERULWJh
c2VkIG1hdGNoaW5nLCBtYWtpbmcgSTJDIGFuZCBEVC1iYXNlZCBtYXRjaGluZyBtb3JlIHNpbWls
YXIuDQo+ID4NCj4gPiBBZnRlciB0aGF0LCB3ZSBjYW4gc2ltcGxpZnkgdGhlIHByb2JlKCkgYnkg
cmVwbGFjaW5nIG9mX2RldmljZV9nZXRfDQo+ID4gbWF0Y2hfZGF0YSgpIGFuZCBpMmNfbWF0Y2hf
aWQoKSBieSBpMmNfZ2V0X21hdGNoX2RhdGEoKSBhcyB3ZSBoYXZlDQo+ID4gc2ltaWxhciBJMkMg
YW5kIERULWJhc2VkIG1hdGNoaW5nIHRhYmxlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3Vy
IHBhdGNoIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiBBIHN1Z2dlc3Rpb24gZm9yIGltcHJvdmVtZW50ICh3aGlj
aCBjYW4gYmUgYSBzZXBhcmF0ZSBwYXRjaCwgYXMgaXQgd291bGQNCj4gdG91Y2ggbHRjNDMwNl9v
Zl9tYXRjaFtdIHRvbykgYmVsb3cuDQoNCk9LLg0KDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvaTJj
L211eGVzL2kyYy1tdXgtbHRjNDMwNi5jDQo+ID4gKysrIGIvZHJpdmVycy9pMmMvbXV4ZXMvaTJj
LW11eC1sdGM0MzA2LmMNCj4gPiBAQCAtMTkyLDggKzE5Miw4IEBAIHN0YXRpYyBpbnQgbHRjNDMw
Nl9kZXNlbGVjdF9tdXgoc3RydWN0DQo+ID4gaTJjX211eF9jb3JlICptdXhjLCB1MzIgY2hhbikg
IH0NCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgbHRjNDMwNl9p
ZFtdID0gew0KPiA+IC0gICAgICAgeyAibHRjNDMwNSIsIGx0Y180MzA1IH0sDQo+ID4gLSAgICAg
ICB7ICJsdGM0MzA2IiwgbHRjXzQzMDYgfSwNCj4gPiArICAgICAgIHsgImx0YzQzMDUiLCAuZHJp
dmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmNoaXBzW2x0Y180MzA1XQ0KPiB9LA0KPiA+ICsg
ICAgICAgeyAibHRjNDMwNiIsIC5kcml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmY2hpcHNb
bHRjXzQzMDZdDQo+ID4gKyB9LA0KPiANCj4gQXMgYWZ0ZXIgdGhpcyB0aGUgbHRjX3R5cGUgZW51
bSB2YWx1ZXMgYXJlIHVzZWQgb25seSBmb3IgaGFyZGNvZGVkDQo+IGluZGV4aW5nIGluc2lkZSB0
aGUgY2hpcHMgYXJyYXksIHlvdSBjYW4gZ2V0IHJpZCBvZiB0aGVtIGJ5IHNwbGl0dGluZw0KPiB0
aGUgYXJyYXkgaW4gaW5kaXZpZHVhbCB2YXJpYWJsZXMsIHNob3J0ZW5pbmcgdGhlIGxpbmVzIGFi
b3ZlIChhbmQgaW4NCj4gbHRjNDMwNl9vZl9tYXRjaFtdIGJlbG93KSBpbiB0aGUgcHJvY2Vzcy4N
Cg0KQWdyZWVkLiBXaWxsIHNlbmQgc2VwYXJhdGUgcGF0Y2ggZm9yIHRoaXMuDQoNCkNoZWVycywN
CkJpanUNCg==
