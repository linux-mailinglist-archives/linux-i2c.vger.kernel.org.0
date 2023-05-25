Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 34DB671108D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 May 2023 18:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231596AbjEYQLc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 May 2023 12:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbjEYQL3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 25 May 2023 12:11:29 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2130.outbound.protection.outlook.com [40.107.113.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 527BD10CE;
        Thu, 25 May 2023 09:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEMeMiSkqcwQjM3quWtL7b4ISri2Ts7QRFazUJavzxnAGxe5aFiZE14hka4oLvo1Q/2Rf97lMQ2mr5S/xME7SipNQXirq6L1YVwlqzJRnvlhvTxzgupyW/C6btrLpr9GjF7NLhiRIWlsNFPJM/uiF51FIyBFiyw8W5v6JFRFzu1tQKilzvI89JVw3143gFX01NKC4kcMOG90YIxuwbY8M6RakbyAREgLMKTPxQrQNmFjhaqwvZPnTVm58MFop8YplCNy7Aa9n65wsQLwBByPSKgX+9t0ACNz22Xl+1SYXShvfBLSMOlNCDP1v0OuqEJi6mfKqb0g817k0peNIfqUZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JLgOJN7wNfM0iDz/1dcSg7XQv8PotJQfXU9rfUcoRcA=;
 b=WDMKA74I/7qYLl/br90ijrByxdsFW2IzrEjGt46bQU5s96D/5+GWxLV4MQs9k9z5+obFlPMuNGJml/gf9b47fxPW/xMPWe5kBaB1hnDpVKpUem4KA680gbNVhCYMWnL5orKRa0xjhhu077+wC7p165ohJvFtru/AiuS6AU389WvStmJeXlQdA9Cemb03ICtJYR1e2cX0Sy0w9DqKsEZgDaE1I5UG6i+LPCZsL7Fj6yzR+mup22xlzkdxi2uNkw0eQMKsBEIgtVovSPVmcsUak0+naGLvBEtReYKW1HaaKOrK2y73RkmZd6qX9Y/k/9yYY7GsN/DFX+KFGvJjifWwxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JLgOJN7wNfM0iDz/1dcSg7XQv8PotJQfXU9rfUcoRcA=;
 b=kh8wOcS1y0k7wOyLqWMJnemB9wMBSW9X0jmRj1aAbhR6whN+Z+ArLfqyn2OCp+0By2NrnNEJZuY2XC3pfEkFgG0LduTtwO8h3M+h4J1nh0eo9H3SRG5iqTY4trJFs2//0wzx/0gj3Rl/l3Qy8YT8qZiu1o0kwpg/TCqf3MUDTGs=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8883.jpnprd01.prod.outlook.com (2603:1096:400:189::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 16:10:40 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 16:10:40 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Pavel Machek <pavel@denx.de>
Subject: RE: [PATCH 2/3] i2c: rzv2m: Rename macro names in all uppercase
Thread-Topic: [PATCH 2/3] i2c: rzv2m: Rename macro names in all uppercase
Thread-Index: AQHZjw/+QL9QcxGdvUCeaEV87IrllK9rJ6uAgAAAwHA=
Date:   Thu, 25 May 2023 16:10:40 +0000
Message-ID: <OS0PR01MB59223F18E2C5D3B6DE5C86CD86469@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230525135108.240651-1-biju.das.jz@bp.renesas.com>
 <20230525135108.240651-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdVMPnXiHk2CYPEnoVKFnN5jF1W3efdwVJAoOrF1TB56+A@mail.gmail.com>
In-Reply-To: <CAMuHMdVMPnXiHk2CYPEnoVKFnN5jF1W3efdwVJAoOrF1TB56+A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8883:EE_
x-ms-office365-filtering-correlation-id: 2b6aa48d-cff5-48b5-83fa-08db5d3a95a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ACbO7ndMlklOt3rCXOiYQHJqMe54asUxY1NXsRJruGF8ptR7Ts6err/8W71RLsOTBbh+6jXh33zO4x2+Z4If638eToebY1nKVnhDt/+YM81NUM10b7aF4in4LLoanioou5aYoIBms+P4unQMAuA+3dJrdOQNbsUTj4kWE57QpKeJEpDpQEbVJDQMC73zubwL7qbeuzkfa4ATNICT77SyrlMODHAB1cL+2/66TcyUNXhLjeZ0UDGcRVuL/kicfw/+zPoiYLegCNMamkW7ePVyuTfB0z1M616UYXYIuy6w/OyqwdzXBS6ZFja2nFL5qRj+LVv9mTvAFKrfzNzSRKuD9P+LSFmxaqvY9jxoABrelK7UAjqOOFutDGD9tkLfjRYMiUdnlPmL1W8a+Oe7hL6YDa4R4xQx3XPjbmBnzfuN+h6n1xSCYrkyNKsg+TRNEowdXcSL+YqeniaklDiSAuuktTBl2/OwE39jWtlhYcaoJcxA7+3H1++l6FxuKcLlGPyOgGPW05uxY8lNQ3y4veL2erb3nGhq2ruQ3mwtHsTPCZSd1+fMyH8D6RiTMkR0tRyMZcHCJZhKJ5JhUqSTCgGtFFzyVeYu6gqqf8609APHrT3xeg3W5/U4n3Hl/QJ78mO5
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(451199021)(83380400001)(54906003)(38100700002)(2906002)(478600001)(53546011)(55016003)(38070700005)(9686003)(33656002)(86362001)(26005)(71200400001)(6506007)(7696005)(122000001)(186003)(76116006)(8676002)(8936002)(64756008)(66446008)(66476007)(66556008)(66946007)(4326008)(6916009)(316002)(41300700001)(52536014)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZVpDWDJIWVFPU3FTa3hMVEJwZDcwMnc5SUFFVndWMngxZHJOMGlYUkJpSDlZ?=
 =?utf-8?B?SG9CVXE0ejdHL09xNVZhdU52djRYTGM3ZHlDQ0tPd2loRnNML2FGVngrNUxK?=
 =?utf-8?B?VlR4SzlzYzhGUjdBZDlJMlk4c2dKT1UxNGppVWt5NE9BbEJWb1dZRWRyelIx?=
 =?utf-8?B?c1Yrc3g2SlQ1WE42WGdtZVlsWExkTFdKejN2NkVRSDIxcjJUZTQ3RjliU251?=
 =?utf-8?B?eTdsNFBGRDdoUG1YMDdnaUFpOUp6aDlwYXM5WWQ1bTFLak1kRjVkSnlEYjQ4?=
 =?utf-8?B?Y0tRbWpMbHdXS2lmdTR0eGNISjVLN3hCS2pGUk9LaERraUFDRXI4Um04c2Vh?=
 =?utf-8?B?anpHRk94UjJDV0UrVlNFcU0yVTNMTS9aeXl3c0duWS96dWRuWjBCVHVwc2R1?=
 =?utf-8?B?aXNIcWpOMVFQQWhJZ0xrZk9QZkZNbyt6ckpUOVQ4cVFyK2RFZ3hxczg5Y2x3?=
 =?utf-8?B?NEdOUzlMMGhuWE1ibzUwWGtucVRWSzFqS2VrT1hVakFMcEFqaE91eWxuSjU4?=
 =?utf-8?B?WFlVRURXQ3ByUzJReEwrRFNmOFh3cVRFZlA2eEdmaEtHdVc2TkxVM0dmOUJi?=
 =?utf-8?B?U2VJUlJxdDRLRGlaOFVTNCtMZnVJcEkxQU1rTWwxeDdjUDhtc2VoakFnM0Ny?=
 =?utf-8?B?RlA5V2ZhVTc2dXN1dmw2aEpBUmlKSkplY2taNVFiQmdRVWxkNDkzZU5YdjR3?=
 =?utf-8?B?VTVNV2RDUDJoUzV6T2Z0cGxISGlNVnpPbGZQdW1qV0JVU0JUVWZxMHVzam12?=
 =?utf-8?B?NFR0RjhFQ3Q0TTVid2xXcTc1d1VScythMmJUd0prdVhHa2xObXVjTGpzdlYy?=
 =?utf-8?B?cFFKSlBLVEVieWhqTWREKzdlTWdsUEJGYXR4bFVRMW5GZExRVjM1S3BvT1o4?=
 =?utf-8?B?Qy9sMTNXZ2MvUjRIRDBwNDVIelRxMW95a1NJd2VYUm9aSmtDWDVSamhoUmh0?=
 =?utf-8?B?TnN2VU5zK081RzV5V3RiSjIzTkYzYUdERWJKS2JDcG5TenNNaDFlc1IzVkVQ?=
 =?utf-8?B?cjNNV1JrRE9oVDJIV1NQK0VHSVFXZjNpcEN0cUxXZzhlbzEyMlpKTjdrRkQy?=
 =?utf-8?B?YjU4SDJkRVYzOUZaRkFRak1pam5weU9jUHVoeWxXK1ZBUEFWVzRoT25HY016?=
 =?utf-8?B?ZjQ0OFRMaTBkazMrYS9NZ0ZxUi9id2U2WWptbkxPQzlMQnpteEhVSWhFc280?=
 =?utf-8?B?UVRBREg4MHlNc0dQWGVRQml1NXVqcytSQVdjV2U5SUd6QWNVRXk3cU5yUFBk?=
 =?utf-8?B?dC9peWNlWEdGdStRaWNvMTIrNXRMQ25CT1NnQTR1YzRhREpPV1ZIaFcyaFh0?=
 =?utf-8?B?NU5CWGRoYmc5Y0oyMjZ3Y1FzOHIxcXpYWS9aNVlQU2ZsTS9EOGZMemJ4Y0Jj?=
 =?utf-8?B?Vnd4MkMvQTZGQktJOTdmZ01ZRkdSZitLZ1l4TEhLSm1DRnlwWFZYU2g4Tngr?=
 =?utf-8?B?cGVSR0N4aWFjcUFGSDNReUs4K2lXb2loRWp2K3pHZjVqQ2d1RXlwbG5yaC9P?=
 =?utf-8?B?ODRONERueWo1WWl3dnFrb0FnUVRYNCt0SEtkV3NnLzIvQXVJMzBtT1c3dXRo?=
 =?utf-8?B?VVJVWUdHM0tDdDYrUnJuZzEwWWt1SlpjcE54Z3ZtMWprb0F2YVMrZHVmb3A3?=
 =?utf-8?B?enYwbC9KYVAyNzNuUXpQR0R4bjkrVVhWRjV6VnpOQWl5TjJQV1BYMTdtMVpO?=
 =?utf-8?B?KzZZMmNhMkxlTWlvK3R2VXVCZ2lOVnV5R09QN2hOZ2psWVRPVEZ5bGJ1c3J3?=
 =?utf-8?B?RzN4enVXQkprb0ZMWXZ6SVJDV0dJQXVNeE82V3lsT0ZieCtTdk9KNUpuTlky?=
 =?utf-8?B?MFozOE9Pb0ExYWJIYTJZSUJrNmhBTGlRU3ppNzk3WVI5MUFLZVdxbzNaM1RJ?=
 =?utf-8?B?NmkzVU8ySmZ5ejgrbVFCS0NZN2JzRGZuLzg0YXNqdUZ5RkNqLyt3elVsQTJ2?=
 =?utf-8?B?MmlqTTdnOU9jeXBZclBrMWtkblBaRnkxZWZpYXRiLzF4YithYVpJTW5uTnRD?=
 =?utf-8?B?NklhK1NCbTFFYUJTTm9TN09TZGtDMi9ubWhNWjdFZEtrV0dTaUJMeHUxUzhC?=
 =?utf-8?B?cUFmTStBVU9oZmFSbm4rTEhyUlB6NGJwbnAxbzZSTm5pNXRmQzNSTkFicHlt?=
 =?utf-8?Q?s8QAUtUhv0sgeJiNOix6qeNvv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6aa48d-cff5-48b5-83fa-08db5d3a95a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2023 16:10:40.3431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XHCU7oU0bzrxr414NIqHEimlk/B4W4Tqbpx9uigbYXNToVoAA8Yog3YTpxqVNHgx6+iuS9mrlfUHA/PPiooiE4RCDWOGhMViXgPbnfNqe5g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8883
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXkgMjUsIDIwMjMgNTowNyBQTQ0KPiBUbzogQmlq
dSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiBDYzogV29sZnJhbSBTYW5nIDx3
c2FAa2VybmVsLm9yZz47IEFuZHkgU2hldmNoZW5rbw0KPiA8YW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tPjsgUGhpbGlwcCBaYWJlbA0KPiA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47
IGxpbnV4LWkyY0B2Z2VyLmtlcm5lbC5vcmc7IEdlZXJ0IFV5dHRlcmhvZXZlbg0KPiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+OyBQcmFiaGFrYXIgTWFoYWRldiBMYWQgPHByYWJoYWthci5tYWhh
ZGV2LQ0KPiBsYWQucmpAYnAucmVuZXNhcy5jb20+OyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtl
cm5lbC5vcmc7IFBhdmVsIE1hY2hlaw0KPiA8cGF2ZWxAZGVueC5kZT4NCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAyLzNdIGkyYzogcnp2Mm06IFJlbmFtZSBtYWNybyBuYW1lcyBpbiBhbGwgdXBwZXJj
YXNlDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBNYXkgMjUsIDIwMjMgYXQgMzo1MeKA
r1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4g
Tm9ybWFsbHkgd2UnZCBwdXQgbWFjcm8gbmFtZXMgaW4gYWxsIHVwcGVyY2FzZS4NCj4gPiBSZW5h
bWUgYml0X3NldGwtPkJJVF9TRVRMIGFuZCBiaXRfY2xybC0+QklUX0NMUkwuDQo+ID4NCj4gPiBS
ZXBvcnRlZC1ieTogUGF2ZWwgTWFjaGVrIDxwYXZlbEBkZW54LmRlPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBm
b3IgeW91ciBwYXRjaCENCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yenYy
bS5jDQo+ID4gKysrIGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1yenYybS5jDQo+ID4gQEAgLTUw
LDggKzUwLDggQEANCj4gPiAgI2RlZmluZSBJSUNCME1EU0MgICAgICBCSVQoNykgICAgICAgICAg
LyogQnVzIE1vZGUgKi8NCj4gPiAgI2RlZmluZSBJSUNCMFNMU0UgICAgICBCSVQoMSkgICAgICAg
ICAgLyogU3RhcnQgY29uZGl0aW9uIG91dHB1dCAqLw0KPiA+DQo+ID4gLSNkZWZpbmUgYml0X3Nl
dGwoYWRkciwgdmFsKSAgICAgICAgICAgIHdyaXRlbChyZWFkbChhZGRyKSB8ICh2YWwpLA0KPiAo
YWRkcikpDQo+ID4gLSNkZWZpbmUgYml0X2NscmwoYWRkciwgdmFsKSAgICAgICAgICAgIHdyaXRl
bChyZWFkbChhZGRyKSAmIH4odmFsKSwNCj4gKGFkZHIpKQ0KPiA+ICsjZGVmaW5lIEJJVF9TRVRM
KGFkZHIsIHZhbCkgICAgICAgICAgICB3cml0ZWwocmVhZGwoYWRkcikgfCAodmFsKSwNCj4gKGFk
ZHIpKQ0KPiA+ICsjZGVmaW5lIEJJVF9DTFJMKGFkZHIsIHZhbCkgICAgICAgICAgICB3cml0ZWwo
cmVhZGwoYWRkcikgJiB+KHZhbCksDQo+IChhZGRyKSkNCj4gDQo+IEknZCByYXRoZXIgY2hhbmdl
IHRoZW0gdG8gc3RhdGljIGlubGluZSBmdW5jdGlvbnMgaW5zdGVhZC4NCg0KT0ssIHdpbGwgY2hh
bmdlIGl0IHRvIHN0YXRpYyBpbmxpbmUgZm5zLg0KDQpDaGVlcnMsDQpCaWp1DQo=
