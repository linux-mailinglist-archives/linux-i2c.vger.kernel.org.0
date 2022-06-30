Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B74E8561B86
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jun 2022 15:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235010AbiF3NnZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jun 2022 09:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230223AbiF3NnY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Jun 2022 09:43:24 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 482F61900F;
        Thu, 30 Jun 2022 06:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkE7RyOxIm4Oj44RzLr7ninPAmM1jDcMQUu3rbpUSnBQJxVqwfYax8QyMtg12G9FY4cVim96gn0ql0BdWUdElVofWMh5C35dn+CXw+Od/2ckqQ4+Y2n4+LtfoXu0mRvs799xBRV3nytsfVmRsjDss57qbPrgslmkyLeq1oxatYZFDWvI9ky2ckZ9yfiwYwzAV7v9hetZry2S1PrGKy5J7Tkasbyl4s9dMmCzqExawnCE5A37NQkOCNTPqoEuLAAILGg2LQMjiNh9tdCkhxJBeJHLGBp2DSp9oMcKRuLR7VDsUVesLKcWmwp5Hr2BP5rApuj5f7qSHavzjVrGvQxm5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvS1JFsp0rjVFktM4kKz4lG/nVL29WUIfvUGq+F4fXQ=;
 b=dV/jln9kLuZpKyYQoOVFvenKnmvLMOhamw5gR2yQ1eBX7HqIv+rfKHijr+0QYSMilxwERbluQIBaJQSM+gi95opDaFG34eS0NShuBoaTzcvzOCW99KcdOWtJy32rL6sDtMsIxF7451F3uzGpgzIht3s44OCRmf4fUAQZQGJ/TnAEWTxvlO+XGtgND6tGi036Lp9Am55QaTf/9yQOijIZ3QVzud+40A9ZWxF00kn5C7yAQ9Ka8tD0GJeHasAJ5uWRZSLWfQU25YVDpbsyKD7z0J8r8uchRU83kb+ewA+RNndEGJZbk1aGQZ87NitgFY0kJSj//Jjqb1aFMd7RG5BGkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvS1JFsp0rjVFktM4kKz4lG/nVL29WUIfvUGq+F4fXQ=;
 b=DlOxAissP5KzzQUFf1P0us+7QVkEcojSxDG+Jk0jVA9r5i7kVsj3PTFKG8MeAqOSFscgYo3btyJmxpPZGFjaj6O8fSgYRK+3JWogjdkMPetobgRnfx95tBH0GoxGWjSo4vr8jXvnED4COpqrYNc8f5wJ1R7xommZKgfrWVSDcb0=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSAPR01MB1988.jpnprd01.prod.outlook.com (2603:1096:603:1b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 13:43:19 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 13:43:19 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sven Peter <sven@svenpeter.dev>, Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/2] i2c: Add new driver for Renesas RZ/V2M controller
Thread-Topic: [PATCH v2 0/2] i2c: Add new driver for Renesas RZ/V2M controller
Thread-Index: AQHYiyeuOazIOKkpQEybI7nuneMbcK1mkhuAgAAQCACAAVE6EA==
Date:   Thu, 30 Jun 2022 13:43:19 +0000
Message-ID: <TYYPR01MB7086706381CDCEF4F582690CF5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <c168df990e1187bf44a5c46be53aa6b20d30d14d.camel@pengutronix.de>
 <CAMuHMdXV72_BWOpU=O13Fa3-t001YSRdsFePSHBS=Xvh1jY1EQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXV72_BWOpU=O13Fa3-t001YSRdsFePSHBS=Xvh1jY1EQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ccecdbf8-ad30-458b-cade-08da5a9e7e0e
x-ms-traffictypediagnostic: OSAPR01MB1988:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 6XMkzms2JGwEQcgu6AQNr/MJOF4qKX550W27EkiLv7KBIDxGphtgzRJ2IVYH/pE3x+OuecBl1Cgx6ZgmUIa/gew+M0KOT/mZbFGThAsY81XjP2pkj4bauJ3YZkfbl/057Jp3g8FeDAkG7yJMKwOIey1wJMy+fG8JI2CmvU/MpB6/Frd/LOhhyE4ImfuDkQ6bQBOD+/sFs3pJ7x1NK6Hpy63CrgOe4T/bAEgXjjFh9PN08vL1a9cghESYMgew6BGON/whT68+CIhKorDkYOVQcS/alj7uhBvVaxly/jKNmYgx81FBbv7I0bZZL5rrJKJFWet1RRwGxXQErufJt9uAgdfhpAsoHYskqbBO7k7Zj4E4Nvn3F1ko+tp0/JaNAH1yp1DKzUuvsvKWMNUb55H/4LuYT4fkG2/ePkQ99f4V8ySp/e6+fUsZquD9In7pvCf+4ntnzdZAGqGtWB2LwWLQ5Kh8Fla2e//LPH9v8wTBvK1+r89fcFPIFOEgibB/OYBrfmEZ/59o3fG86YI98bhcb3yMkEfiBhVp3G7TsEiaFctf+XRzQ8BGVd8ocm7ucifayRPpR5wvQNvhCb+8tTmX7H9+M1GbJUY3XbqvIJEOn19DuS4Z/YzTbXDoM4bhkbOcuT6/1PEDnbuzSGSNWooAgEZL96t+adVXfGR8+FM/vXQwAXlddxU9jMb6cODZcdO6vs0YTNawpOkn7uMNpgGfO2xJujzGAgwrFBLMOMq9VoK3PxY/My8VExSOYRucvyxegV8L1tS1MMYRAM3SfNWtOfNe8Ru4uGIwq/4gNu2+5iHYRty+j6vORob7o7+ERCzH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(86362001)(83380400001)(55016003)(2906002)(110136005)(8676002)(66946007)(64756008)(66446008)(66556008)(76116006)(66476007)(122000001)(4326008)(316002)(38100700002)(54906003)(38070700005)(6506007)(53546011)(7416002)(5660300002)(7696005)(44832011)(33656002)(9686003)(8936002)(26005)(41300700001)(71200400001)(186003)(478600001)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGp1REhCcC9qYUFqUlRhdUdiQnhqenRUYmJYcXBIWVUwSHo4Z0xTZ3NNMFA4?=
 =?utf-8?B?NzVLMzFZQ3F3am8vTFJNSTRzRElnaTRQanNkY1Y4MkMrZXF4SVhENjhwbWRq?=
 =?utf-8?B?Z016aEl4c0pEb25UZ3RXSzlmVTBPWWs3eFUxbTJoSnJxeUVVc2tudjlPb3dv?=
 =?utf-8?B?WUQvd2UxZHB2OEs1elVNbXdHTlBFZlRSamZYWDcxYi8vbGZESnNhMElWK2FM?=
 =?utf-8?B?amNNWXZ5TXplVEVrU2FEaUdHL2lUK0pCQXFlTWpIa1ZKQ3p5bEJXM3IrZjJa?=
 =?utf-8?B?UGR5NUZlK2xOcEdYcUR6bjNKcURlUzUyeTI3UGJqbUlNU0syM1M4TFRmK1Ar?=
 =?utf-8?B?NUgrL0VpVXpYUVNRUktxYmwvdkFHdnZxMFRhS3ZvbWx4SEVxQzNtSUVwcnN4?=
 =?utf-8?B?blhMcE5jekx0WnU1VnBoMVhQZ1dZa3VoNEQ5UWpsa2JvbzhYY3hyc2FrN3NO?=
 =?utf-8?B?aHk1c3N3S2ZzbTFmWFM0M1lnVnkzbVJzSXo3b1ZFelMwbXpxUFJwS1pDRlVt?=
 =?utf-8?B?MW5BNlN4N29Qa2ZEVFp3bHRTUUpnTHhhUmhEeFk2UGpTeGZrNnFUeWZkQnJq?=
 =?utf-8?B?aks4VTlydmNmU2wzNlJudkQvU2RUSDlOSWRzcGdHRmF6Q2o2VHFmR0dZOE96?=
 =?utf-8?B?aFkyQjJ3THFNMEhFK255aUY4b0phaU45NWJpMVM4NDJPeFRESjZBbk93emp6?=
 =?utf-8?B?RkprYUZiRk1FNU44QlVkdFlUUW0vRFg3dktNR0tZQWxiMzM4R3VEcENWMGRS?=
 =?utf-8?B?UlR0U0NZYnJGL3ZubzErT1cvWEVaQkF1TThtQlFSWnpMakhoQURmV1JYWlEv?=
 =?utf-8?B?WEV0UG92V1BvVnB6dzRIN1FTMkxQRU8zbmF1cDZNNWozM0hzbXIwd2FJcnY1?=
 =?utf-8?B?bkcvQi8xRmY4SmNzeTRodUpIUFBKZTg4WnlyQy8rZ2ZXcFFvbUZIUVVpdnA4?=
 =?utf-8?B?bVpGQ1ZheWdPWUg0Z0RFV2h1R205OFBEV2E4bkhRbXVkRXRIWE50MnF5eUJO?=
 =?utf-8?B?b1BXOVpQdnZFSERhN2VEbEVHczRDYUxWc2kzalMvWFNDa2NoRFdYOUlTdWlI?=
 =?utf-8?B?N0QwNTJQSUdjUld6SmlrNHJlV2EycFhtZ1NSMWl0OHJieDlIZkdzd3I1SDgw?=
 =?utf-8?B?NGlteUJRQWgvTnJ4aVErblRDQW9WdklHMVFpRzZxWkcrcER6V1YrZEM4VzFM?=
 =?utf-8?B?VDNmQkMvTlpNdnhoZHd2VU9uS2VWYVJoS3dnRE5NSnNubmZ1aWlETXJuaEMr?=
 =?utf-8?B?VzFyMEVUaDR5cU9GbHFxM2JNQnBhZy9qNUhGQWsva2hpV0cyK2xlWEVIOXdR?=
 =?utf-8?B?M0lZSlcwc2J0R2QyalVIVkNrVmlmVzQwWEw4YmZTOEhjMThISGQ4MHNDdTFT?=
 =?utf-8?B?SHU1dWhKTEg3M2lYRVUvdEFtSDFIRW1KTmoyV3RlQjloODBoRk1lRzNHbkI1?=
 =?utf-8?B?ZnVGWFRHc0RJWGZrbnRFbnFjcjhPTytXdzAwSW9nQVBUU0FpWTdpdzRJM1hl?=
 =?utf-8?B?MGVPYUNPczZOSGtuN0ljRmhwaHduUHdWcFg5MUV2MFFtajBCYmR0QW51b2Mx?=
 =?utf-8?B?SjVMV2QwQzlxWDRzUGhNZ2ozTzB1aGhkc3JZRmdqdUJGdXBDcy9odDhzYUdq?=
 =?utf-8?B?WWR4Q1N5ajczOHlFeWtsZGVCUkpvSlV5di9zUE9TajArc0Y3em9Ld3RYSGhC?=
 =?utf-8?B?amRCZytNdGw3dkhSSHpBalcwZE5VOUpiWUl0WHF5VjFZSkFXM05Lbk5obmhu?=
 =?utf-8?B?S1NsSktLRTQzV3YwbXIvUGltR292S2RYNjRudUlNb0hkYUlSc1A0dnhOVGUv?=
 =?utf-8?B?SXVuejhsUDV3cHlVb3JGZEZYMjU1YTdhVkU3MFlhS0xoWnp2WW9sYVltK1Ji?=
 =?utf-8?B?TmhKRmhXUmlxNDZScGxPUWM2cngrU29JNm1jZ1JqelVIb3hhcVU2ZC9jdHpv?=
 =?utf-8?B?Sk9KdjcrdXo1OVhoWGl4dUxjVkptcThYZ01WRGk2VnMzcm5GdlY1d1QzaWRD?=
 =?utf-8?B?eFowOWthdDEzTjgwWUU4Vmk5RnY0VzFPcS9maFlIT2txVlAxV2VyaWo5cGQ1?=
 =?utf-8?B?SmlBV1VSU2tSakpnRVFwKzZyaUh1OFpScXhSM2l2SUh6YUt6MDdETlFkczAy?=
 =?utf-8?B?Q2M2S2hDd2VwREFzM0NoVW5MTlQxQTVudFgvejhhK0ZuUm5IVFBGakdCVVZC?=
 =?utf-8?B?elE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccecdbf8-ad30-458b-cade-08da5a9e7e0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 13:43:19.2421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ClTflpWobk99zarljWUTgZcNOFbTOTNzBfA+W8F6/Ejsx3mvQHs2STl3sgEq66JEAI+68V6tc6EsXKjxAKXw5qt7fWlvvOCOtBFmoZm8xPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB1988
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgUGhpbGlwcCwgR2VlcnQsDQoNCk9uIDI5IEp1bmUgMjAyMiAxODoxOCBHZWVydCBVeXR0ZXJo
b2V2ZW4gd3JvdGU6DQo+IE9uIFdlZCwgSnVuIDI5LCAyMDIyIGF0IDY6MjEgUE0gUGhpbGlwcCBa
YWJlbCB3cm90ZToNCj4gPiBPbiBEaSwgMjAyMi0wNi0yOCBhdCAyMDo0NSArMDEwMCwgUGhpbCBF
ZHdvcnRoeSB3cm90ZToNCj4gPiA+IFRoZSBSZW5lc2FzIFJaL1YyTSBTb0MgKHI5YTA5ZzAxMSkg
aGFzIGEgbmV3IGkyYyBjb250cm9sbGVyLiBUaGlzDQo+IHNlcmllcw0KPiA+ID4gYWRkIHRoZSBk
cml2ZXIuIE9uZSBhbm5veWluZyBwcm9ibGVtIGlzIHRoYXQgdGhlIFNvQyB1c2VzIGEgc2luZ2xl
DQo+IHJlc2V0DQo+ID4gPiBsaW5lIGZvciB0d28gaTJjIGNvbnRyb2xsZXJzLCBhbmQgdW5mb3J0
dW5hdGVseSBvbmUgb2YgdGhlIGNvbnRyb2xsZXJzDQo+ID4gPiBpcyBtYW5hZ2VkIGJ5IHNvbWUg
ZmlybXdhcmUsIG5vdCBieSBMaW51eC4gVGhlcmVmb3JlLCB0aGUgZHJpdmVyIGp1c3QNCj4gPiA+
IGRlYXNzZXJ0cyB0aGUgcmVzZXQuDQo+ID4NCj4gPiBUaGlzIHNvdW5kcyBzY2FyeS4gSWYgdGhl
IGRyaXZlciBpcyBuZXZlciBsb2FkZWQsIGFuZCB0aGUgcmVzZXQgaXMNCj4gPiBuZXZlciBkZWFz
c2VydGVkLCB3aGF0IGhhcHBlbnMgdG8gdGhlIGZpcm13YXJlIHRyeWluZyB0byBhY2Nlc3MgdGhl
DQo+ID4gb3RoZXIgaTJjIGNvbnRyb2xsZXI/IERvZXMgaXQgaGFuZz8gT3Igd3JpdGUgdG8gdGhl
IHJlc2V0IGNvbnRyb2xsZXINCj4gPiByZWdpc3RlcnMgdG8gZGVhc3NlcnQgdGhlIHJlc2V0PyBJ
ZiBzbywgaXMgdGhlcmUgYW55IHByb3RlY3Rpb24gYWdhaW5zdA0KPiA+IGNvbmN1cnJlbnQgYWNj
ZXNzIGZyb20gZmlybXdhcmUgYW5kIHJlc2V0IGNvbnRyb2xsZXIgZHJpdmVyPw0KV2hlcmUgYSBj
b21tb24gcmVzZXQgaXMgdXNlZCBieSBMaW51eCBhbmQgc29tZSBmaXJtd2FyZSwgSSB0aGluayB3
ZSBoYXZlIHRvDQplbnN1cmUvYXNzdW1lIHRoYXQgYm90aCBvbmx5IGV2ZXIgZGUtYXNzZXJ0IGl0
Lg0KSW4gdGhpcyBwYXJ0aWN1bGFyIFNvQywgdGhlIHJlZ2lzdGVyIHVzZWQgdG8gYXNzZXJ0L2Rl
LWFzc2VydCB0aGUgcmVzZXQNCmhhcyB3cml0ZSBlbmFibGUgYml0cyBpbiB0aGUgdXBwZXIgaGFs
ZiBvZiB0aGUgcmVnLiBUaGVyZSBzaG91bGRuJ3QgYmUgYW55DQppc3N1ZXMgd2l0aCBib3RoIHRy
eWluZyB0byBkZS1hc3NlcnQgdGhlIHJlc2V0IGF0IHRoZSBzYW1lIHRpbWUuDQoNCg0KPiBJbiBy
ZXNwb25zZSB0byB2MSwgSSB3cm90ZQ0KPiANCj4gfCBUaGF0IGlzIGFjdHVhbGx5IGFuIGludGVn
cmF0aW9uIGlzc3VlLCBub3QgYW4gaTJjIGNvbnRyb2xsZXIgaXNzdWUuDQo+IHwNCj4gfCBQZXJo
YXBzIHdlIG5lZWQgYSBSRVNFVF9JU19DUklUSUNBTCBmbGFnLCBjZnIuIENMS19JU19DUklUSUNB
TCwNCj4gfCB0byBiZSBzZXQgYnkgdGhlIHJlc2V0IHByb3ZpZGVyPw0KDQpGcm9tIHdoYXQgSSB1
bmRlcnN0YW5kLCB0aGVyZSBhcmUgdHdvIG1haW4gdXNlIGNhc2VzIGZvciByZXNldHM6DQoxLiBP
ZnRlbiByZXNldCBsaW5lcyBtYXkgYmUgYXNzZXJ0ZWQgYXQgcG93ZXIgb24gYW5kIHNvIGEgZHJp
dmVyIG5lZWRzIHRvDQogICBkZS1hc3NlcnQgdGhlbSBzbyB0aGF0IHRoZSBtb2R1bGUgY2FuIGJl
IHVzZWQuDQoyLiBBIGRyaXZlciBtYXkgbmVlZCB0byByZXNldCB0aGUgbW9kdWxlIGZvciBzb21l
IHJlYXNvbi4gSSBoYXZlIG9ubHkNCiAgIHNlZW4gdGhpcyB3aXRoIHdhdGNoZG9nIHRpbWVycyB3
aXRoIG5vIHdheSBvdXQuDQoNClNvIGlmIGEgZHJpdmVyIGRvZXMgbm90IG5lZWQgdG8gcmVzZXQg
dGhlIG1vZHVsZSwgc2hvdWxkbid0IHRoZSBkcml2ZXINCm9ubHkgZXZlciBiZSBkZS1hc3NlcnRp
bmcgdGhlIHJlc2V0IGxpbmU/DQpJZiBzbywgaXQgYWxzbyBkb2VzbuKAmXQgbWF0dGVyIHdoZXRo
ZXIgdGhlIHJlc2V0IGlzIHNoYXJlZCB3aXRoIG90aGVyDQptb2R1bGVzIG9yIG5vdC4NCklmIGEg
ZHJpdmVyIG5lZWRzIHRvIHJlc2V0IHRoZSBtb2R1bGUsIHRoZW4gdGhlIHJlc2V0IGNhbm5vdCBi
ZSBzaGFyZWQNCndpdGggb3RoZXIgbW9kdWxlcyB1c2VkIGJ5IGZpcm13YXJlIG9yIExpbnV4LCBv
ciB3ZSBjYW5ub3QgdXNlIGFueQ0Kb3RoZXIgbW9kdWxlcyB0aGF0IHNoYXJlIHRoZSByZXNldCBs
aW5lLg0KDQpIYXZlIEkgbWlzc2VkIHNvbWV0aGluZz8NCg0KVGhhbmtzDQpQaGlsDQo=
