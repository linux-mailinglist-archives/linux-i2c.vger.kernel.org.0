Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD91372F7AD
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 10:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbjFNIVr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 04:21:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234114AbjFNIVq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 04:21:46 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2093.outbound.protection.outlook.com [40.107.113.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A5FCCA;
        Wed, 14 Jun 2023 01:21:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jd5+/DYruh83ds37CY9mwM4p45rRls8yAG4hSKQzG8QWpKeOqJyqxvob+QI835Muq33xVz5gBJGM+xRCdFjjT0wKI/ftla6s70B+o12vcZZBME9yzs0mDHmzhkJL8ZcJJ/Gq669pbKJBTYb2G/7ab0QUykbq47u1GEOOYhLiDvS/AxCCM+rHoXzT66SVrIOVJHg3Mpg+TsNADAtreuD/5WbMT5N9g6CFYjCHpp98uMeTh/+9XrRanLbF7WEvpZEl01glNvMG37Tfm2lv5RtrkO2so7yVKqZ/2Zi029JT4CILlxQU24cUqdNbbAEd2Y2NbyZm0mulU0Oth0TEe8DjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=huFXzedHiWbpvRUjmybKB9z89Nhvw5v2A5QXf5JO0iM=;
 b=O4DxSNNKqFp6fgmqX8d4xrDdUexp3a7whPFVOnMK3DrEGSahOtf4M2EYRcN0B+C3RAI+a5EPgagspeEpMOlKqzYmk1Rrcx6RdXKRhmnLAdoPAmfY2uN4YMOM2ih2eabkl5+cAN9Pttk6rwEUGZSd2iSjGuKHNXRR3gejGcQ3HMAvG3/JTsxqSxOUbMv6NqmhL46i7mpkqqvDaHtvYRRLx5FRiN3lTWqCqVKEHjhdmwnX8bF5JX0lyVt1JwQatOMubl7bfeMlmtpJamKGKWGrZAJ7lG5uYjcjRmhXjwdRy2ify9qN5c7fMEDWZh04yhKrhACOhkkLcdMUwTFJyowZkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=huFXzedHiWbpvRUjmybKB9z89Nhvw5v2A5QXf5JO0iM=;
 b=h+fw7gyTMH0e5C2hVdMSi30Z/Y5ZQsLJkmaHblgPsrhEelDdCgg+S2SIL2iah1ETpzFAa2f2Z9H6vB0OLBr0I0lU2RhBZjZvGMvfCtr7LuvNYxICMLG6+03vKhSKzsCsJjLa1AxcCTWf9jGvxDVvkzvvjSr9UWe6LRDYx5IVUQ0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB10611.jpnprd01.prod.outlook.com (2603:1096:400:30b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Wed, 14 Jun
 2023 08:21:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.047; Wed, 14 Jun 2023
 08:21:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
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
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAADgjKAAAM7gIAAgX6AgACwEcCAAD30wIAAjmJQgADWpQCAAAETwA==
Date:   Wed, 14 Jun 2023 08:21:38 +0000
Message-ID: <OS0PR01MB59225C45554667D342454923865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <OS0PR01MB592220CCA081848A711D75328655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210CE54A9CF953980DFEE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220D794AED55A6B795C3EF8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230614081314.GD17519@pendragon.ideasonboard.com>
In-Reply-To: <20230614081314.GD17519@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB10611:EE_
x-ms-office365-filtering-correlation-id: 406f005a-de4f-4311-2518-08db6cb05fe6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Uvj3SRH49KIYmCXZQ3H/lfJJ9OQsbVcha6ioaMOkNJLOFwQIoiWnqmSQsBwjlOeVYd+g5baz8mCujB42nlr7G4ZLeJQ2+9sWoF1KwhWZVn6+OZV5J1MGT1FEREGf4mT1N300iLd01gATC0xrG9O7RPya1V2YM98FHAe56QMeTXhszp59wjQN8SUDa24qFT7Occqoh//LG7KIyyl3vj84ktlzY8S+ROGjyfrXqXran/CiI2n47KnoMCNcxdGiDVokZJeQ1JJK4oKXtpgGJcvOOMPiivL/H+wk9733tE24XAiT3WRqrQTYmm6KK57EubYM8sWv4NWDBHZBKKiPEgEms9MMK9/vyMAAwfK5Kr0rt7KoXoNULJuQSeWRa525YC33BZCfN4MutCEx1yl2dt7j1IzH/iqxvirY3UF/DE5QMcU5Ml/CWdBujaDIM1UYfwMTcsyWhf7SKAhdUEJ/1YJrpEy1kEZVs7cBIpavpZFT03f09KrLFnxDn2Ah0UvcwxvhJEc5BjX0nELQUIojnArW35pHb6vWA/lAJDMYJrjTmgaCe8xFgJjLMcVYD27Mc2ekYcEjjYt7Ke11BErhK1Dy3WR7/b1GTqYHNibbTbOquEUft2ZtKrerB9gdGHeKbCSJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(7406005)(7416002)(4326008)(66556008)(66446008)(52536014)(6916009)(5660300002)(8936002)(41300700001)(2906002)(316002)(66946007)(76116006)(54906003)(8676002)(66476007)(83380400001)(6506007)(9686003)(64756008)(186003)(26005)(86362001)(38070700005)(122000001)(478600001)(7696005)(71200400001)(55016003)(38100700002)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SlYvRnhYQ3lVczIvWmxjT2ZLdkF5d29mZm1MbWIzRmZ5ZGRHQ21kbnJmOTZt?=
 =?utf-8?B?cnNBdjVpbHJyTDJpQTljWFJSWjJiYS9HY2VUOWVkR3R0RzJsU21QVXBBNjF1?=
 =?utf-8?B?cDNSVXFyUWZRd2YxWDFvSnJIWngrUzF2dmMwSC9Gc0huUlV6aGp3RDBWdm9Y?=
 =?utf-8?B?RU1jQVJKOE03Skp1emRvdk1EU081VXg4UGJuTU84eWFJV0wrUmVzTVhIVDdr?=
 =?utf-8?B?cUo2RDhBUGFtVHA1UFRnT0s4dFNjeHNGNTFBQmhVYUhXSEZtVkhoY042ZUdQ?=
 =?utf-8?B?SzRBYWh3L0M3Z0YyWnlxcDM2S0MwTHZUUklpRnV2MTVUZlBCM0p4NDVrdHhI?=
 =?utf-8?B?VmVlVXRldmNMeHhIbDdhc3o2TVV2RFU4Y0tWM3BnRldvMGg0RVZyV2pQWU43?=
 =?utf-8?B?M3ZJUit6ZlZKL085RTdaMmdFQUV2MUNBQTA3ZmNSSHUyVWFhbGFsK282eEJj?=
 =?utf-8?B?aklMUjQ4MkNsQ2Y4YzhhL01JZzFHbktwRHY0b2w1YkdLMTBuSlNERXl3RTNH?=
 =?utf-8?B?bko1YXl2STdpRzl4MVc5cnN3S0U1NVkxdVltd1BMRVdxM3FiTXdkYXpGcStu?=
 =?utf-8?B?eGU3dmE4N1A3YlhmU0NVZlBJZnp6UzFpak43aHJ4NXA3WTVQQTg3cGszOVVw?=
 =?utf-8?B?aDZJdEV4eS9EUE5CYkxCRm5qd2ZoMlZISzJjLzgxWUh0ZHV3V0NETlRETUpy?=
 =?utf-8?B?OVVTYXhiSkxyb3FvTWZIcENhTC9xdHM3UmZFRmQxU3VuOFRYZ3ExQmZiWlJE?=
 =?utf-8?B?eXlCdFlienJoZXQzaDdZSzhNelpySG1Xb2ltam40MGlvejZmWlRNamdXaXBT?=
 =?utf-8?B?b3NQQXNvWjZ1Zk05ZUl4K0MvUzN1dmtBaytPdW1id3p5L0RtZ0JyMEhnM3ZY?=
 =?utf-8?B?czdZY1c5VlA3UU8zZ3E0ellEaWdpeXh1Z3kyeWk4ZU5Cc2VTL1pXL2lEWFZ6?=
 =?utf-8?B?NEEzNnhsdkx0K2VkMjhRUFJiejBvMk1NeEFMNjNrNTVBaTVnYUNCZHEybHpz?=
 =?utf-8?B?RkdVRjVlSVREZEZEU2JsVkUzTVFqSnY3NW15SDdQc2UwZDRGWVd2TEg3Ykpm?=
 =?utf-8?B?QlNHRmVKQ2EvOG10ZVRWZWVUU1U2K1Jlb3gyTmJpZTh3TFFYdC8wcHNsQ0VI?=
 =?utf-8?B?dzN3UTRPSUphS1RMTnF6S2htSEV4WExEZjFvT3lTV3B2d2p6c1UyR3BnZ0lC?=
 =?utf-8?B?eXVLTTZaUHIzQXU4MUJZcm55U0JWSE5LS0tQMEhCWnYzNS8wYVVtTXJ2VUtY?=
 =?utf-8?B?dUlvZ0hFRDNydGVtMHVnbmZHY3JzV2NoRC9SMlhFRWlsSVoxdHFzeThlcnR1?=
 =?utf-8?B?akpJdFpDeDBXVG44VUVlRzVWcXA5RzhxNndRbkpSZHNTMk13LzR5eTUrUDFj?=
 =?utf-8?B?b2dRRTJEZW9CRUhhMlVhL3BQclBiYllieEZWUlFGam9LTWJqQnJQNTU2OTRL?=
 =?utf-8?B?U0RzSUxZL2grU1ZncUFieUwwQ0R5YjZHNjUvaVZTVmRBWE5tKy8ybTQ3M1FB?=
 =?utf-8?B?U2tiMk53Q2xsdEk0a3RtK3ZNYVZ3WHlndkV4dlJxVjJnV2xZRHlBbmV4MG1z?=
 =?utf-8?B?Y2tBelhmK1h3UFgwaFZ3REVoUGVySzh4Z0xoMlNhSndSbE5NQkowelNPK2dV?=
 =?utf-8?B?Z0RXTi95K1doR3VCNG1ualdXRjY5T3VJQm9KcWQ1UktWaU5UVEI0RWpWZnha?=
 =?utf-8?B?cDZuVDVsdmdwUEtmaXV5dWZ6T1Q4S0g3QU0rUzNwOXIwYXNFZnM0MThPNnhk?=
 =?utf-8?B?M0pIMkpXWkgySXFSSWR3VEIvSEJ1cFdTNlhJRU1YRERZOWczR1Z5RjFqdXB6?=
 =?utf-8?B?eWNwRUxYdXpDUC9OZzF3TkhpYU5lUnlaMHJUMzdkRDZrUVdsMmU3MkwvOWxm?=
 =?utf-8?B?SFZVY0hIbTBTbnZqUXc2aWpZVFM3RGRlTnRJVjR2TnJ1YUwrZnFXUjZNclFl?=
 =?utf-8?B?NWcxTjVMc3pWNmQxbmZQYU4vYzMySDFka1luMmZGaEhUV0FWSVVvTXU2aFRN?=
 =?utf-8?B?NFFKRFJ6WitrU2o1c2F0S09FMnRBdzBBWWMwMVJOM1JMLzExUEhRbXpudmNQ?=
 =?utf-8?B?b1ZHb0RCcHFDMzBQOEozNnFIRXVZNEhnSHpvczdrVGx4ejg3MUNDTkxFcWpa?=
 =?utf-8?Q?vW7RBd2bqA1mhvx3r9VmcqX01?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 406f005a-de4f-4311-2518-08db6cb05fe6
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 08:21:38.1951
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7HHBE1cwTdGlt+bgiIvIthis1YkkpotQQ2gCEfjJkn+6son3cYso8/m+MmWWHa26sZ45CrKYa7PJ5bG9gLoWP2y8E6LQsgd4RDsrcVjA2kA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10611
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhhbmNlIGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZSBB
UEkNCj4gDQo+IE9uIFR1ZSwgSnVuIDEzLCAyMDIzIGF0IDA3OjMxOjQ2UE0gKzAwMDAsIEJpanUg
RGFzIHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUkU6IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhh
bmNlIGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZQ0KPiA+ID4gQVBJDQo+ID4gPiA+IFN1YmplY3Q6
IFJFOiBbUEFUQ0ggdjUgMDEvMTFdIGkyYzogRW5oYW5jZQ0KPiA+ID4gPiBpMmNfbmV3X2FuY2ls
bGFyeV9kZXZpY2UgQVBJDQo+ID4gPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMS8xMV0g
aTJjOiBFbmhhbmNlDQo+ID4gPiA+ID4gaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlIEFQSQ0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4gSGkgZXZlcnlvbmUsDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IFBl
cmhhcHMgd2Ugc2hvdWxkIGZpcnN0IHRoaW5rIHRocm91Z2ggd2hhdCBhbiBhbmNpbGxhcnkgZGV2
aWNlDQo+ID4gPiA+ID4gPiByZWFsbHkgaXMuICBNeSB1bmRlcnN0YW5kaW5nIGlzIHRoYXQgaXQg
aXMgdXNlZCB0byB0YWxrIHRvDQo+ID4gPiA+ID4gPiBzZWNvbmRhcnkgYWRkcmVzc2VzIG9mIGEg
bXVsdGktYWRkcmVzcyBJMkMgc2xhdmUgZGV2aWNlLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gQXMg
SSBtZW50aW9uZWQgc29tZXdoZXJlIGJlZm9yZSwgdGhpcyBpcyBub3QgdGhlIGNhc2UuIEFuY2ls
bGFyeQ0KPiA+ID4gPiA+IGRldmljZXMgYXJlIHdoZW4gb25lICpkcml2ZXIqIGhhbmRsZXMgbW9y
ZSB0aGFuIG9uZSBhZGRyZXNzLg0KPiA+ID4gPiA+IEV2ZXJ5dGhpbmcgZWxzZSBoYXMgYmVlbiBo
YW5kbGVkIGRpZmZlcmVudGx5IGluIHRoZSBwYXN0IChmb3INCj4gPiA+ID4gPiBhbGwgdGhlIHVz
ZXMgSSBhbSBhd2FyZSBvZikuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBZZXQsIEkgaGF2ZSBhbm90
aGVyIGlkZWEgd2hpY2ggaXMgc28gc2ltcGxlIHRoYXQgSSB3b25kZXIgaWYgaXQNCj4gPiA+ID4g
PiBtYXliZSBoYXMgYWxyZWFkeSBiZWVuIGRpc2N1c3NlZCBzbyBmYXI/DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiAqIGhhdmUgdHdvIHJlZ3MgaW4gdGhlIGJpbmRpbmdzDQo+ID4gPiA+DQo+ID4gPiA+
IE9LLCBpdCBpcyBpbmxpbmUgd2l0aCBEVCBtYWludGFpbmVycyBleHBlY3RhdGlvbiBhcyBpdCBp
cyBtYXRjaGluZw0KPiA+ID4gPiB3aXRoIHJlYWwgaHcgYXMgc2luZ2xlIGRldmljZSBub2RlIGhh
dmluZyB0d28gcmVncy4NCj4gPiA+ID4NCj4gPiA+ID4gPiAqIHVzZSB0aGUgc2Vjb25kIHJlZyB3
aXRoIGkyY19uZXdfY2xpZW50X2RldmljZSB0byBpbnN0YW50aWF0ZSB0aGUNCj4gPiA+ID4gPiAg
IFJUQyBzaWJsaW5nLiAnc3RydWN0IGkyY19ib2FyZF9pbmZvJywgd2hpY2ggaXMgb25lIHBhcmFt
ZXRlciwNCj4gc2hvdWxkDQo+ID4gPiA+ID4gICBoYXZlIGVub3VnaCBvcHRpb25zIHRvIHBhc3Mg
ZGF0YSwgZS5nIGl0IGhhcyBhIHNvZnR3YXJlX25vZGUuDQo+ID4gPiA+DQo+ID4gPiA+IE9LLCBJ
IGNhbiBzZWUgdGhlIGJlbG93IGNhbiBiZSBwYXNzZWQgZnJvbSBQTUlDIHRvIG5ldyBjbGllbnQN
Cj4gZGV2aWNlLg0KPiA+ID4gPg0KPiA+ID4gPiAJY2xpZW50LT5hZGRyID0gaW5mby0+YWRkcjsN
Cj4gPiA+ID4NCj4gPiA+ID4gCWNsaWVudC0+aW5pdF9pcnEgPSBpbmZvLT5pcnE7DQo+ID4gPiA+
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBTaG91bGQgd29yayBvciBkaWQgSSBtaXNzIHNvbWV0aGlu
ZyBoZXJlPw0KPiA+ID4gPg0KPiA+ID4gPiBJIGd1ZXNzIGl0IHdpbGwgd29yay4gV2UgaW5zdGFu
dGlhdGUgYXBwcm9wcmlhdGUgZGV2aWNlIGJhc2VkIE9uDQo+ID4gPiA+IFBNSUMgcmV2aXNpb24g
YW5kIHNsYXZlIGFkZHJlc3MgYW5kIElSUSByZXNvdXJjZSBwYXNzZWQgdGhyb3VnaA0KPiA+ID4g
PiAnc3RydWN0IGkyY19ib2FyZF9pbmZvJw0KPiA+ID4gPg0KPiA+ID4gPiBXaWxsIGNoZWNrIHRo
aXMgYW5kIHVwZGF0ZSB5b3UuDQo+ID4gPg0KPiA+ID4gaW5mby5pcnEgPSBpcnE7IC0tPklycSBm
aW5lDQo+ID4gPiBpbmZvLmFkZHIgPSBhZGRyOyAtLT5zbGF2ZSBhZGRyZXNzIGZpbmUgc2l6ZSA9
IHN0cnNjcHkoaW5mby50eXBlLA0KPiA+ID4gbmFtZSwgc2l6ZW9mKGluZm8udHlwZSkpOyAtLT5p
bnN0YW50aWF0aW9uIGJhc2VkIG9uIFBNSUMgdmVyc2lvbg0KPiA+ID4gZmluZS4NCj4gPiA+DQo+
ID4gPiAxKSBIb3cgZG8gd2Ugc2hhcmUgY2xrIGRldGFpbHMgb24gaW5zdGFudGlhdGVkIGRldmlj
ZSB0byBmaW5kIGlzIGl0DQo+ID4gPiBjb25uZWN0ZWQgdG8gZXh0ZXJuYWwgY3J5c3RhbCBvciBl
eHRlcm5hbCBjbG9jayBzb3VyY2U/IGFzIHdlIGNhbm5vdA0KPiA+ID4gcGFzcyBvZl9ub2RlIGJl
dHdlZW4gUE1JQyBhbmQgImkyY19ib2FyZF9pbmZvIiBhcyBpdCByZXN1bHRzIGluDQo+ID4gPiBw
aW5jdHJsIGZhaWx1cmUuIGluZm8tPnBsYXRmb3JtZGF0YSBhbmQNCj4gPiA+IENsaWVudC0+ZGV2
LnBsYXRmb3JtZGF0YSB0byByZXRyaWV2ZSB0aGlzIGluZm8/Pw0KPiA+DQo+ID4gT3INCj4gPg0K
PiA+IEkyQyBpbnN0YW50aWF0aW9uIGJhc2VkIG9uIGFjdHVhbCBvc2NpbGxhdG9yIGJpdCB2YWx1
ZSwgaWUsIHR3bw0KPiA+IGkyY19kZXZpY2VfaWQncyB3aXRoIG9uZSBmb3Igc2V0dGluZyBvc2Np
bGxhdG9yIGJpdCBhbmQgYW5vdGhlciBmb3INCj4gPiBjbGVhcmluZyBvc2NpbGxhdG9yIGJpdA0K
PiA+DQo+ID4gUE1JQyBkcml2ZXIgcGFyc2VzIHRoZSBjbG9jayBkZXRhaWxzLiBCYXNlZCBvbiBm
aXJtd2FyZSB2ZXJzaW9uIGFuZA0KPiA+IGNsb2NrLCBJdCBpbnN0YW50aWF0ZXMgZWl0aGVyIGky
Y19kZXZpY2VfaWQgd2l0aCBzZXR0aW5nIG9zY2lsbGF0b3INCj4gPiBiaXQgb3IgY2xlYXJpbmcg
b3NjaWxsYXRvciBiaXQuDQo+IA0KPiBJIGRvbid0IGxpa2UgdGhhdCBoYWNrLiBJIHN0aWxsIHRo
aW5rIHRoYXQgdHdvIERUIG5vZGVzIGlzIHRoZSBiZXN0DQo+IG9wdGlvbiwgSSB0aGluayB5b3Un
cmUgdHJ5aW5nIGhhcmQgdG8gaGFjayBhcm91bmQgYSBwcm9ibGVtIHRoYXQgaXMNCj4gYWN0dWFs
bHkgbm90IGEgcHJvYmxlbS4NCg0KV2h5IGRvIHlvdSB0aGluayBpdCBpcyBhIGhhY2s/IEkgYmVs
aWV2ZSByYXRoZXIgaXQgaXMgYWN0dWFsIHNvbHV0aW9uDQoNClBNSUMgaXMgYSBzaW5nbGUgZGV2
aWNlLCB3aXRoIDIgcmVncywgY2xvY2tzLCBwaW5jdHJsIGFuZCBJUlEgcHJvcGVydGllcy4NClNv
IGl0IHdpbGwgYmUgcmVwcmVzZW50ZWQgYXMgc2luZ2xlIG5vZGUgd2l0aCBzaW5nbGUgY29tcGF0
aWJsZS4NCg0KQnkgaW5zdGF0aW5nIGEgY2xpZW50IGRldmljZSwgd2UgYXJlIHNoYXJpbmcgdGhl
IHJlbGV2YW50IHJlc291cmNlcyB0byBSVEMgZGV2aWNlIGRyaXZlci4NCg0KQ2hlZXJzLA0KQmlq
dQ0KDQoNCg==
