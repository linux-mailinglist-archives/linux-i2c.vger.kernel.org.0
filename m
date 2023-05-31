Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0DA1718494
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 16:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237464AbjEaORi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 10:17:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236944AbjEaORW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 10:17:22 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on20713.outbound.protection.outlook.com [IPv6:2a01:111:f403:7010::713])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20A421BFC;
        Wed, 31 May 2023 07:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKuLXkx0UA81gEPfEB57FrjaLIUEmqw86/ek7AIIlh0gM4u0cDK4cUOPNItaG06r8ZzSGBBy1Mbq4U5Swpilp6vDtYVMdk2Mnblh+Xfxj4AGSSERwiN/duWRleHAORe6sWHN36kwbjYHfGc3K5Igb6XEvkbt5SqDeK/kathWgIhqU6zMAjjUXWT55Ngy3se7UdxBu+JCbY+9U8iGOM8SGaSE2Ka5B2tYJtebL+/HbwACpzjHvWabeVnS7KPEj4+V2s+QekN2tcpmxcZimwZQAeC/bdegSj/XMVeBKEmGQM1EHNz4iIySf65kaOSuAZi/2a1FZMvscl2lS+HE0hWGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jVTnSOAyyPuZLawbsXNQGYU/akTSGLEZ4v1C9oH1qHg=;
 b=SzeTLT5sj33Lif1pl5qd5Xbyfy5jRtDs5EoRuBUU3UDk2ppk9s5wqzySoxDWsfn8JAtMDID51enyzOjOm6YGebblR6x+iGCAcVpcYKv9GCyn8yElZvuV5god58+W/GcSLUPh17IfbiCnKu5dvJSkc55+K0uNFV6OTRl8z5BfFOzmJwGalXuy9UJvoHaGOuHklxjkoIxVtjfpv6+NatTpOjfiY16SnlJI4xMmvGOrwnyMOByIMNS6TgUgPif0u50q6OqsIBQ69qmQSVz3Z9PF8YTTD2bklamNQy2LB063s9N7qeJ0MYzjsn++emVp7k5JeM1y/I5/gsjqGUlAV8JHdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVTnSOAyyPuZLawbsXNQGYU/akTSGLEZ4v1C9oH1qHg=;
 b=NzJEP1PqFIBJiWy+fiaA0FcLo2E1vtzWUIDf5N69PMnYL1fCj9cWv0jMP9Ej3EjYqankV0uv38GE4BlXKi8+G0T8xjzZe1yx7qVt1GiFHGoFhzQ6a0LaUXU582bF7aJ4AaRTX/tcZcm8xLRxrS9A/ZzCBSeLdGiXOIrP+PKzjzw=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB12016.jpnprd01.prod.outlook.com (2603:1096:400:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Wed, 31 May
 2023 13:47:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 13:47:17 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        =?utf-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        Antonio Borneo <antonio.borneo@foss.st.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAApUwgAAqgYCAAADfgIAAH8OAgAACVaA=
Date:   Wed, 31 May 2023 13:47:17 +0000
Message-ID: <OS0PR01MB5922846C284CD49AF433DBF686489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <OS0PR01MB59226E87241A61A2CB255DEE86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531114103.GD27043@pendragon.ideasonboard.com>
 <OS0PR01MB592217BBDCD7C0072F24493D86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdV56T2P4fGhs-_Sf-N-ow8rf26TAvk77diHc3wQMH7_Zg@mail.gmail.com>
In-Reply-To: <CAMuHMdV56T2P4fGhs-_Sf-N-ow8rf26TAvk77diHc3wQMH7_Zg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB12016:EE_
x-ms-office365-filtering-correlation-id: aa0f15b8-4efb-4139-cdb8-08db61dd8c6d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7c6o38fQOFLcssf0C2XID9R1Gwk0SQDMyT3AXpDn0S224viDwFOYn5sUOcalRlSBjE1LGU6ZPNfI/UOXmZFlH/muF7COFpkWwB+ovsa+yLj6x2CDf2CSOEXmALoNuLN6dd8D/ipAtSHdi+0poOa3BuA+/zS4fKHaP5ji0URMNXnDudexW3rEzcXLFt/+kE2wT7+j/wRR/fIQA5295q6PaL6zDJZg4oQmp1PBP6+dHRGrEfDhp+AxNKT29L187AoVzbPq7mg10n4OnryAN4IH9KmWFBvlVJgI4nlAMn2PPQZiCzpIqbadnhtZ0wS5X3rwQMKmfllMav0t33Eaey67JnsvAX36QuCSX4LiKtZObP68S14iolpStBWNxuLIGq+FppyG1+kbsQcogJZU/2iKWZTEcKqXXPXtVp/GUHZ0Jqytzsv/Wny6OuxsWeQC5n2d15zS/VU1Y4eb3dEY/HKnPgzpF84SgIqftLKR7nDzBz1N1jwUVzwGGfYjycEy0rzsI5HoAX/qCbZKNYsWtuMBZGcWiCg/gAKEDMq9vMrcaRGJ33U4q/73/bLR7KOgvHPFlwrg+isL0HJCTT8Y28sit4727JQ/9xugNQplOJWvV6yazTLcT/YRarjGGqsnyMqJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(451199021)(54906003)(478600001)(71200400001)(8676002)(7416002)(8936002)(7406005)(6916009)(52536014)(38070700005)(33656002)(2906002)(86362001)(76116006)(5660300002)(64756008)(66446008)(66946007)(122000001)(66556008)(4326008)(316002)(55016003)(66476007)(41300700001)(38100700002)(186003)(53546011)(26005)(7696005)(9686003)(6506007)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dUJ4REt5eG9LWkIzdE41UzhzUEFvcWVjRGR2L3E4MnREQ0tESTF0Nllxc09T?=
 =?utf-8?B?eHZGZWR0aUNSSFNabC93azB4MUNJUDFFb25zSnhvWXFtMzd6RmFtMXJUMVpC?=
 =?utf-8?B?bSt5MHVVNTU5eUhKZERFTnlLUEhFemlSM1VzOE45RWVpa2JaanJHZHY3Q3BS?=
 =?utf-8?B?NUREQXkxeDVlaWJ0QXNvamRma0tLWEY3VDZCUFdVaGRJeUZIOUQvWWlUbjB0?=
 =?utf-8?B?b24vRHNvNGgyWkRGUzArc3NXc0Zrc3dYS1hqcmdLaHFIRnMwUWtDbWE5MXo3?=
 =?utf-8?B?Qkcwc1BZaEY5eVdheEF1Q0xVQ1dWay9MZ0RNd3dFV3hXbmFSa2c0QlZRNkFo?=
 =?utf-8?B?TXYrUlhKNVZOQStrWjI5YkJVT3VENVNwdm13eWpEdUJ3RFdpMGJXeHdjVis5?=
 =?utf-8?B?dFk5VHlUZ0hQN0pHckg4eUM5dGJYd0ZpQzlnWGVXNTMvN3JDUEhHWXpQbWNq?=
 =?utf-8?B?WTZ3elRhbk5XaWJZb3pBVStQcmw2RlVhODNoMjd3NHBWOUtZY2t6UW5hdHBx?=
 =?utf-8?B?eTRKSHMrRmdEWTRHT3AzYlpXT2JiWWhEUFRVeEtxRnlMd0dnWDRoWXMxY042?=
 =?utf-8?B?VENFZlFHTVBocVF4Uk5ab0tQZTc4UHhPOTVKQjZJL2c5R3pORGgwT3JaVGtI?=
 =?utf-8?B?QWoxQmc0RHc2N2lYYWNwVlRyUk9JRFhxZ0lsaDdiWkVJN2l3V0FrcXFQNVE2?=
 =?utf-8?B?M3hUa0FmN0dWTitlTHdDU0UxdHhmZ2x4M3dNYktha29JS3Nsc0hvUEp4SEcv?=
 =?utf-8?B?WmZxcUZTand0bTRJeWdLcGs3U0RxUzNNei81bWoxdXlDWFo1RGlvNEE4RnEz?=
 =?utf-8?B?amVrM010cTJmV2ExRWt1KzFCcDFDY1FPYnB1TXl3Zm1NL3NrQkNVeGtCeWJi?=
 =?utf-8?B?MXFMakpWaWlibThmVGRJZUNPREsyMTY2MXhySFoxRzYrMi9Wd3BVNDZLaGFB?=
 =?utf-8?B?WVhZaTNxVU4vb2toRnBkalM1ZkkxRjM2dnM4V0JzUDJ1OUI4UndOWHV4Q3hw?=
 =?utf-8?B?bGZXVHVRV09mTlUyRGp1VWwzOHhvVlVmNk5ISzNOYVlwenNSMXJvb1FybS8r?=
 =?utf-8?B?VnA4aGNNcUlQd3d4eVNjUmFmRGJZcGU5Z3pZckd2Qkc5Q1Q5bFJHTGZ4SWw0?=
 =?utf-8?B?Z0lkZ1VOK3FvckE4bkxhNVM0ZmJQN1JZM05HbE9XZ0d0aHhLNUswbHU5emVV?=
 =?utf-8?B?ZTI5aUFRZ3g3bUs2TGxIUU42UmVBNUc1RjJsYkJ5OTRGY08xaWR0L2N4U2RU?=
 =?utf-8?B?SUQ4TWpMZ2pFbFN4MnpWRGRkQ0VCeHFtVzJ3cnRrVngrNkY5RitIUEZPY3pz?=
 =?utf-8?B?dTJJaXZINmsvVnRiajhib2hSUnVnenJJTG5aUGVTS1pJZ09oN2FkUTc0V0RQ?=
 =?utf-8?B?UWllNkRrVGYzejVkK1ZiYUluVWJ0OW0zODNvL2h6WitkMjB4OStMQnN0NjRI?=
 =?utf-8?B?b0J3cm1SSHh3eGJ1MkxUSjZqYXNRY0dpZk1ML0RCY0lkNVNLNEl3eHp1dXNk?=
 =?utf-8?B?Z0pZckpoZExTdThLL0Ezbm9talJsdU01ZWkvYUFaaEhldWtQNEgvV2JKalp3?=
 =?utf-8?B?ejdTWmxPWVJEK25HZ0R2cEhNQzJpRGdKWFo3VnQ3ak5zM1FBaW50WkY2aWQr?=
 =?utf-8?B?cy9Ub2wyK3ZqZHhhVTgvcE5NdXU4Z1NsdkpYSlBUOTRoOXZYU0dvc0R3YkNY?=
 =?utf-8?B?a0lEcnp4RXFwNFROaVkzSGd6TEJPMmxSb004ZklRMGpEeWo4VUJCRHFzZGpw?=
 =?utf-8?B?ZVVGRGhSVUozTXgxamU3VmdERndBeGhMYm5HYzc0ZnpkY1dudGpoWUlQM3o1?=
 =?utf-8?B?MTZPanN3T1RPcmhMVzJWRXcrUmZ0WWhIZlZya3J3TUpoWVI3WEtFeXp0cXVi?=
 =?utf-8?B?WmxBbFZzQ1g0NEpjRmNiOHFSNjAxMmdjR21qd3ZvOXY4UnFoOG45WExWMXBr?=
 =?utf-8?B?N3o3MXBudEV5eWFJVEoweTNxREFIN1BmMFdLSWxYdVNQYzUra09KWUZhSmFC?=
 =?utf-8?B?WjFVVTd5ZVRkTEk3VmdYd0NKUDlmcjBIem5KMjVkQW01Q0UybndydlpMS0I5?=
 =?utf-8?B?aVZUbGFHWFlVTzE3VlpET2grSVgzVGF0cDBndGJCS0VBSTMwM3FzckxhNDBz?=
 =?utf-8?Q?Q4DxxeSbDW4kH75UMbdDua8hq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0f15b8-4efb-4139-cdb8-08db61dd8c6d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 13:47:17.4605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S1qZJW1mDW/UWPaS8LtIQ232rDZaO4BU40IjpSHJxW7/J5cgLSrDv2iHUE4onmr3hy7aIV+C/9RYpXYTpqQ3bm905oiRYXSc+4oPs4v+4qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12016
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjUgMDEvMTFdIGkyYzogRW5oYW5jZSBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UgQVBJ
DQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCBNYXkgMzEsIDIwMjMgYXQgMjo1M+KAr1BN
IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiA+
ICogVGhpcyBmdW5jdGlvbiBjcmVhdGVzIGFuZCByZXR1cm5zIGFuIEkyQyBhbmNpbGxhcnkgY2xp
ZW50IHdob3NlDQo+ID4gPiA+IEkyQyBhZGRyZXNzDQo+ID4gPiA+ICogaXMgcmV0cmlldmVkIGZy
b20gdGhlIHBsYXRmb3JtIGZpcm13YXJlIGJhc2VkIG9uIHRoZSBnaXZlbiBzbGF2ZQ0KPiA+ID4g
PiBuYW1lLiBJZg0KPiA+ID4gPiAqIGF1eF9kZXZpY2VfbmFtZSBpcyBub3QgTlVMTCwgdGhlIGFu
Y2lsbGFyeSdzIGRldmljZSBwYXJlbnQNCj4gPiA+ID4gKiB3aWxsIGJlIHNldCB0byB0aGUgcHJp
bWFyeSBkZXZpY2Ugb3RoZXJ3aXNlIGl0IHdpbGwgYmUgc2V0IHRvDQo+ID4gPiA+IEkyQw0KPiA+
ID4gYWRhcHRlci4NCj4gPiA+DQo+ID4gPiBUaGUgd29yZGluZyBpcyBiZXR0ZXIsIGJ1dCB0aGlz
IGlzIG5vdCB3aGF0IHlvdSBoYXZlIGltcGxlbWVudGVkIGluDQo+ID4gPiB0aGUgY29kZS4gVGhl
IG5hbWUgZG9lc24ndCBzZWxlY3Qgd2hpY2ggcGFyZW50IGlzIHVzZWQuDQo+ID4NCj4gPiBJdCBp
cyB0aGUgc2FtZSBpbXBsZW1lbnRlZCBpbiB0aGUgY29kZS4NCj4gPg0KPiA+IEZvciB0aGUgZXhp
c3RpbmcgdXNlcnMsIGF1eF9kZXZpY2VfbmFtZSBpcyBOVUxMIC0tPiBUaGUgcGFyZW50IGlzIHNl
dA0KPiBhcyAiSTJDIGFkYXB0ZXIiLg0KPiA+DQo+ID4gRm9yIGluc3RhbnRpYXRpbmcgYSAiaTJj
IGNsaWVudCBkZXZpY2UiLCBhdXhfZGV2aWNlX25hbWUgaXMgbm90IE5VTEwgLQ0KPiAtPiBUaGUg
cGFyZW50IGlzIHNldCBhcyBwcmltYXJ5IGRldmljZS4NCj4gPg0KPiA+IFRoZSBwcmltYXJ5IGRl
dmljZSBpcyB0aGUgb25lIGluc3RhbnRpYXRlZCB0aGUgImkyYyBjbGllbnQgZGV2aWNlIg0KPiA+
IHVzaW5nIGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSgpLg0KPiA+DQo+ID4gUGxlYXNlIGNvcnJl
Y3QgbWUgaWYgYW55dGhpbmcgd3JvbmcgaGVyZS4NCj4gPg0KPiA+ID4NCj4gPiA+ID4gKiBJZiBu
byBhZGRyZXNzIGlzIHNwZWNpZmllZCBieSB0aGUgZmlybXdhcmUgZGVmYXVsdF9hZGRyIGlzIHVz
ZWQuDQo+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gdGhlIGFuY2lsbGFyeSdzIGRldmljZSBwYXJl
bnQNCj4gPiA+ID4gPiA+ID4gPiArICogd2lsbCBiZSBzZXQgdG8gdGhlIHByaW1hcnkgZGV2aWNl
Lg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBUaGlzIGRvZXNuJ3Qgc2VlbSB0byBtYXRj
aCB0aGUgaW1wbGVtZW50YXRpb24uIFdpdGggdGhpcw0KPiA+ID4gPiA+ID4gPiBwYXRjaCB0aGUg
YW5jaWxsYXJ5IGRldmljZSdzIHBhcmVudCBpcyBhbHdheXMgdGhlIHByaW1hcnkNCj4gPiA+ID4g
PiA+ID4gZGV2aWNlLiBBcmUgeW91IHN1cmUgdGhpcyB3b24ndCBjYXVzZSBhbnkgcmVncmVzc2lv
biA/DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gVGhlcmUgaXMgbm8gcmVncmVzc2lvbiBhcyBl
eGlzdGluZyB1c2VycyBvbmx5IGluc3RhbnRpYXRlDQo+ID4gPiA+ID4gPiBkdW1teQ0KPiA+ID4g
PiA+IGRldmljZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNvcnJ5LCBJIGRvbid0IGZvbGxvdyB5
b3UgaGVyZS4gRXhpc3RpbmcgY2FsbGVycyBvZg0KPiA+ID4gPiA+IGkyY19uZXdfYW5jaWxsYXJ5
X2RldmljZSgpIHRvZGF5IGdldCBhbiBpMmNfY2xpZW50IGRldmljZSB3aG9zZQ0KPiA+ID4gPiA+
IHBhcmVudCBpcyB0aGUgSTJDIGFkYXB0ZXIuIFdpdGggdGhpcyBwYXRjaCB0aGV5IHdpbGwgZ2V0
IGFuDQo+ID4gPiA+ID4gaTJjX2NsaWVudCBkZXZpY2Ugd2hvc2UgcGFyZW50IGlzIHRoZSBtYWlu
IGkyY19jbGllbnQuIFRoYXQncyBhDQo+ID4gPiA+ID4gY2hhbmdlIGluIGJlaGF2aW91ciwgd2hp
Y2ggY291bGQgY2F1c2UgYWxsIHNvcnRzIG9mIGlzc3Vlcy4NCj4gPiA+ID4NCj4gPiA+ID4gUGxl
YXNlIHNlZSB0aGUgcGF0Y2ggc25pcHBldCBiZWxvdywgdGhlcmUgaXMgbm8gcmVncmVzc2lvbi4N
Cj4gPiA+ID4NCj4gPiA+ID4gY2xpZW50LT5kZXYucGFyZW50ID0gcGFyZW50ID8gcGFyZW50IDog
JmNsaWVudC0+YWRhcHRlci0+ZGV2Ow0KPiA+ID4NCj4gPiA+IFdoZW4gY2FsbGVkIGZyb20gaTJj
X25ld19hbmNpbGxhcnlfZGV2aWNlKCksDQo+ID4gPiBfX2kyY19uZXdfZHVtbXlfZGV2aWNlKCkg
YXMgYSBub24tTlVMTCBwYXJlbnQgYXJndW1lbnQuIFRoZXJlIGlzIG5vDQo+ID4gPiBjaGFuZ2Ug
b2YgYmVoYXZpb3VyICpmb3IgaTJjX25ld19kdW1teV9kZXZpY2UoKSosIGJ1dCB0aHJlIGlzIGEN
Cj4gPiA+IGNoYW5nZSBvZiBiZWhhdmlvdXIgKmZvciBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2Uo
KSouDQo+ID4NCj4gPg0KPiA+IEkgZG9uJ3QgdGhpbmsgSSB1bmRlcnN0YW5kIHdoYXQgeW91IG1l
YW4uDQo+ID4NCj4gPiBGb3IgZXhpc3RpbmcgdXNlcnMsIGkyY19uZXdfYW5jaWxsYXJ5X2Rldmlj
ZSguLi4sDQo+IGF1eF9kZXZpY2VfbmFtZT1OVUxMKSB0aGUgYmVoYXZpb3VyIGlzIG5vdCBjaGFu
Z2VkLg0KPiA+DQo+ID4gQ291bGQgeW91IHBsZWFzZSBlbGFib3JhdGUgZnVydGhlcj8NCj4gDQo+
IExhdXJlbnQgaXMgcmlnaHQsIHRoZXJlIGlzIGEgc21hbGwgaXNzdWU6DQo+IA0KPiAgICAgc3Ry
dWN0IGkyY19jbGllbnQgKmkyY19uZXdfYW5jaWxsYXJ5X2RldmljZShzdHJ1Y3QgaTJjX2NsaWVu
dA0KPiAqY2xpZW50LA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnN0IGNoYXIgKm5hbWUsDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdTE2IGRlZmF1bHRfYWRkciwNCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBjaGFyDQo+ICphdXhfZGV2aWNlX25h
bWUpDQo+ICAgICB7DQo+ICAgICAgICAgICAgIC4uLg0KPiAgICAgICAgICAgIHJldHVybiBfX2ky
Y19uZXdfZHVtbXlfZGV2aWNlKGNsaWVudC0+YWRhcHRlciwgYWRkciwNCj4gYXV4X2RldmljZV9u
YW1lLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZjbGllbnQt
PmRldik7DQo+ICAgICB9DQo+IA0KPiBUbyBwcmVzZXJ2ZSBiYWNrd2FyZHMgY29tcGF0aWJpbGl0
eSwgdGhlIGxhc3QgcGFyYW1ldGVyIHNob3VsZCBiZQ0KPiANCj4gICAgICBhdXhfZGV2aWNlX25h
bWUgPyAmY2xpZW50LT5kZXYgOiBOVUxMDQoNCk9LLCB3aWxsIGZpeCB0aGlzIGluIG5leHQgdmVy
c2lvbi4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo=
