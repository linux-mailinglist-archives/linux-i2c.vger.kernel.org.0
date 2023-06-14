Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2389272FC78
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jun 2023 13:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243988AbjFNLaz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 14 Jun 2023 07:30:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235869AbjFNLay (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 14 Jun 2023 07:30:54 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2122.outbound.protection.outlook.com [40.107.114.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129EFE55;
        Wed, 14 Jun 2023 04:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NhmzcvK3AaZ+1IzyjE10hKxE/OQw1dZ7rGFtVW7eZd8hxtFXdik6lsNDHulI1/YpHvm135FPv2hDzi1yCLmdVc4NpXoMF39WPgQWbmlTLmm5PCuO+x/a6nWB6AXjKSBEN7iCQnL+zDvPGMRWQFnJoHoDP8FdRy+woXFO0O85jW76rO0qxshUz8XEFgagQ2fvhhxx3Z5XIVBKFkOLxNara5whZjMee9OCUdtNYpOvG6UnmQDScKqH/wG9GwlVoKoZyzTgychw3Z21mgOBIzWLNP1hE4INVt0QaiMh/Nmxilv0m3v+5VYl9Dfe8rfJyJIQ+1vMCtUFSgun8ZKHgkdXQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cylED55HABWBIyUtOep8tCJ4RXBxPpO7h0dDMnNTACk=;
 b=Bv0zB3Hq9Y36kJFtz4KYdztpeaGV7FhT0JLMqLlRtJR3zX2kip7r3jj0lFuqWmOHAxTAj94HdgSUn6wPN6u13Pz6x42X8d3FTClGGgd8PIYpsGgEDN6Pon1KvDV+Gj9tVmuqRfWgIeMIC+35X1MIp2Z3yPRN/kSVqdOqR+qKJ7aBcAaWbGM7fn0LozBMzwqeh+NRcvzixAXkn5TSFdyz7axgFr+BgCoHoHoW4l0Ktk1xglw9BTd0MjsSfnLHowtvwtOu+gID8nO4KgYp0tbzHThuGCEWhmkjZwdtR/V+uP0ugnkxolF3/MvDH/ZMg8uxujlZdjmV6GdJAi+tspNvTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cylED55HABWBIyUtOep8tCJ4RXBxPpO7h0dDMnNTACk=;
 b=JZut+0VD1Rpm96NS8M7ERxNiPpE6vy2E1cjMCZ6NU5yD2sw9mMSBgcWwrSfWNLNzZFc1zsfXukH4y/LPbTkEGv70YW/ubc1wqTmqmMD1mxP6Pow8UYd6U0pc3n/GzWxD1bcnONA8SEwP0SBGtt0T0DYLBPDMpSNgcPhG1fkd9Fo=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5364.jpnprd01.prod.outlook.com (2603:1096:604:a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 11:30:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.047; Wed, 14 Jun 2023
 11:30:48 +0000
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
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAADgjKAAAM7gIAAgX6AgACwEcCAAD30wIAAjmJQgADWpQCAAAETwIAAGzEAgAAT4OA=
Date:   Wed, 14 Jun 2023 11:30:48 +0000
Message-ID: <OS0PR01MB592279423F94849882512AED865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <OS0PR01MB592220CCA081848A711D75328655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210CE54A9CF953980DFEE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB59220D794AED55A6B795C3EF8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230614081314.GD17519@pendragon.ideasonboard.com>
 <OS0PR01MB59225C45554667D342454923865AA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230614095424.GJ28480@pendragon.ideasonboard.com>
In-Reply-To: <20230614095424.GJ28480@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5364:EE_
x-ms-office365-filtering-correlation-id: 4993d10b-c50f-4bb1-e42f-08db6ccacd2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aeMk3XZ0v7Kx8vdd1y/5sUIJoxqaNXu1lGUfvAuaUbqCrT+735JAK+ZkECivEHBBeSIettPryhvpM9eUgNlFh8BkvkprK+DmrQOqia4zbJ8kiUjireI+ZpL+WXpM7oRfzouSIuYQ5VOR+6k9aoVLzPPQD0gbqX0cNGMAy4UMlpiAQA3KSNdAiucuN4LjhP4O8ZZHAdQgVLI6V5pKvw1kdqbuZggvCqc2shV8oAe6IcD9akQON8MPY2XYpCBBAhKWFhDdgK8dqttumVET+i2f/oaj7K1KhqGjTVb1YTEkQtFQ5+VET6o6KwpRYx6EsZ+HYGu0yFcuQBDpfwG/L0brhXqbvS0suHEc0OJSK7m593+qmuAh6FI9OomVDWmSUOY63SPdaMMEM0T3fE6xhadIx83rJY7YVd3UcK975qsDK5ujl7Ix7swH0TkxoKZHDxtWfDMXV4URZM7fbrh5Y1ZSLmpHpfsxJ9YFFMdMun+gTUE/SXThJ66MxcsI444yRuoQXQJSojIYM8LhMy8aJ0AGlxkhOvAim/ds99Afh/J8DomRAaO9psW5c8oZuP6oA2FEN9ZmLtohmNcLgwi4I0p6LHpqaR1nKnnmxm6dQJLQ0M1xB67ARsitRlVGkyYBwu2ZSZWTBNdXlSa4DfDdOMfMOCvQJT0cEMA2A57zGaYGLf0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(39860400002)(136003)(396003)(376002)(451199021)(7696005)(86362001)(9686003)(83380400001)(38100700002)(38070700005)(122000001)(33656002)(6506007)(26005)(55016003)(186003)(2906002)(54906003)(66556008)(316002)(66476007)(7406005)(4326008)(66446008)(76116006)(41300700001)(7416002)(6916009)(52536014)(5660300002)(66899021)(478600001)(71200400001)(66946007)(64756008)(8676002)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tzhhb3c5OXQwd2tINEovNmlLYmNSb0pTakZvWWt1eEFEaTZ1L1l0eXBnRUI0?=
 =?utf-8?B?eVVaSVNqcHhQSWlJbnpvdytzU2F2enU3UldNbjd4SXF5QXNVN3Q3S3IrdnQ5?=
 =?utf-8?B?WXE2QXFCSVBlNGhFd0crcDBXREtMRTh0blppc1IrRFZPNEgzVTlYV2p0WnVu?=
 =?utf-8?B?TXJWY2lvU0xPK1JEUHJBODBlaGx6MHdTZ2xiTkRiMFFVcGRzWXlRMjQwYzYv?=
 =?utf-8?B?MS9WUm1CMHhzeWlRQTA2c01RVkYxZU1tbGxSVFRZd0h0YmJFcE9kOVAvSWQv?=
 =?utf-8?B?aTNDQmFLSlhpMHpTN0cyZktZRml6ZTMvK0ZKS2w2ZFl1R3Z4VFBTNGJaNUI4?=
 =?utf-8?B?bXVDWHdwRk1rQkVUTHBRSkR5L0d0NjF0NXZSdUkxc2RGblZTbzdCVXFVT1lw?=
 =?utf-8?B?N1dQMUlKWkY0TTdPdEozVGsyS2hoamJhY1lqVkhFZU5rNzhOSEtCWTRwOGJk?=
 =?utf-8?B?RzA5QUV5UEJGSENBeGM2NmV6RmdpdjY4TkpsWEFvQXpOMzJYc29IZjRSN3B1?=
 =?utf-8?B?SlVTaFM0MndEcFByRHBENnVIRXg2ZTRWUjVPSGNlSWVDUWhtZDlMNFF6UHcz?=
 =?utf-8?B?elhOb3JSU3U5bWpzUXhpZ0JwdVBVckdhVkNGMlhsWlBBVTdvVG96MW5JWW50?=
 =?utf-8?B?WFpCZmZSN0RBa1M5NnBGS1Uwakc5Z0NCOEFwUWxnQXV1dHdWTjAwdGNhMmYz?=
 =?utf-8?B?Q0MvODR6NldtNm5oOHIxckhRVnpsck9zWmlWV29aRnlMYnNqaDJDcW5ld2tV?=
 =?utf-8?B?Nk81Zm1YdGpObHUwYytDb2dGZUFTSGsvMWxjenBHK2p6a0x1UDRSUllRMUls?=
 =?utf-8?B?UW5GTVRZS0dSWUR1UU5pYVB1K053eklxS2pzZHlQTGhtZUV3NVhCdnRsOEQr?=
 =?utf-8?B?aXIzbGczK2t2Z3VjNGpGdm9CdzIzcVVabE1WMkhUM0hwdlpzVjNLdHhxazBj?=
 =?utf-8?B?dndPLzN2VzZ2Wjc4ZVltdG93TkQvajN1K20rVmxVOGVnY1BjS1hzUXhDNGRT?=
 =?utf-8?B?Y3djNHAxSFFZQWRQbmUwUWh4UTlJQTd6eGZQQU9WYnN5YWtiakdkeG1aSFNG?=
 =?utf-8?B?eHlwZ1k1V09FcmxlL3l3aUM5bGlrc0F4QzcwbmdrOU85UzJoQW15N0Z6NmM4?=
 =?utf-8?B?WFRjUUJ0RHRzRUFpMWhock5QR0dpMm9keW5XR05nL0hxUW1MK29vdDRkaFFJ?=
 =?utf-8?B?NE1yUiszRGYzSzhrRzlid2xVSklmeEJ4czVuZkd3WmNrNkgyeWFWL3d6TWR2?=
 =?utf-8?B?WDlWK3VIbHlBYko3d28xRFNtTFR0Z0kybk1XV2ZTZEN1ZnJ6aGkvdnNYL2xT?=
 =?utf-8?B?aGRvaVNybUNxNFRTSmZYd1oyQzNqdnQzQytOdkdzM3kwalorR1laVmZScHZV?=
 =?utf-8?B?bWdqU2pyQkNyUGM0VkhjM2tzL3E4eVpVNE14VUg0V3JrT3hwT0NDVUIvS1dr?=
 =?utf-8?B?S1Q3MHU2YkFSQmlCcTIyRVY4MEM5TG5Xb3JmMUNnNUUwZDkyNXhmYUs1eXRy?=
 =?utf-8?B?cmNnK0ltY0RnVWVSY3hQa0dsdnJjTFUyZE1scVBhcnlCV09JL2JrSWZFaytI?=
 =?utf-8?B?Z0xVbmQzcFNSWHppQmV6V3FvSWs2a2VudWYrSk9yRTdOeVlFbm0zUDhXOWpD?=
 =?utf-8?B?YmdtK0RWRTJWR0lVekdGL05XMWFBeDUyN2pDY3c0ZnpwM0pJZGlHNi9NTi8x?=
 =?utf-8?B?dG1rKzRBVTR6MmR3TThuSEcvYTdjS2FucUFCZjdja2NRTy9jalBVNWoyVEE0?=
 =?utf-8?B?ZGdGbEQzbksyVndsbUdLV2NxWmsvM3hKZWozNFNibVB2TzJpU0R6T05WNUhv?=
 =?utf-8?B?UkkyeWhUKzArNERoMStMTmRMWWNlbDJRdlJKSE9iVnNQNEtzRi8wcW05a2Rv?=
 =?utf-8?B?UU8zdWdaNXBaYW03Q05zOGhTQnBRZjl3ZkVPc1d5WGFySHRkek8vdDFZY010?=
 =?utf-8?B?M2doZ0ZmbWpJU0FLb09La1hTZ0F6RWxBQ0ZqMWJJT1o0R2ZXNGNlWkU3c0Ro?=
 =?utf-8?B?Z3RiT2FmaEVwbGFuYXBIeHkwWE1xYS9PMWgzTXRpQkU3SHNneDJPa29Jb2h4?=
 =?utf-8?B?bEZoeEFKNkM1aXAxWFI5NDN3dEc3eXRiQzV2ZXlaQUtUSndVYnZGb0ZRTG51?=
 =?utf-8?B?a3lqeHdRVGhoVXRDWUliRzFxdmtwNE55aVJuVFdVeDM4R0I3cmllc1RGQjh0?=
 =?utf-8?B?NWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4993d10b-c50f-4bb1-e42f-08db6ccacd2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2023 11:30:48.4322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WLxsHE/yaPZDiANTcdxEOrLvdVejyqyZcd/EgaRTWcsEqBq12sYWrLATtSQHF4GhaThyhe+Y+gVmhhA578cUkoCA3g1IvI2wpOQNpPqj/JM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5364
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
UEkNCj4gDQo+IE9uIFdlZCwgSnVuIDE0LCAyMDIzIGF0IDA4OjIxOjM4QU0gKzAwMDAsIEJpanUg
RGFzIHdyb3RlOg0KPiA+IEhpIExhdXJlbnQsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHRoZSBmZWVk
YmFjay4NCj4gPg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhh
bmNlIGkyY19uZXdfYW5jaWxsYXJ5X2RldmljZQ0KPiA+ID4gQVBJDQo+ID4gPg0KPiA+ID4gT24g
VHVlLCBKdW4gMTMsIDIwMjMgYXQgMDc6MzE6NDZQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+
ID4gPiA+ID4gU3ViamVjdDogUkU6IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhhbmNlDQo+ID4g
PiA+ID4gaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlIEFQSQ0KPiA+ID4gPiA+ID4gU3ViamVjdDog
UkU6IFtQQVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhhbmNlDQo+ID4gPiA+ID4gPiBpMmNfbmV3X2Fu
Y2lsbGFyeV9kZXZpY2UgQVBJDQo+ID4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUg
MDEvMTFdIGkyYzogRW5oYW5jZQ0KPiA+ID4gPiA+ID4gPiBpMmNfbmV3X2FuY2lsbGFyeV9kZXZp
Y2UgQVBJDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEhpIGV2ZXJ5b25lLA0KPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiA+IFBlcmhhcHMgd2Ugc2hvdWxkIGZpcnN0IHRoaW5rIHRo
cm91Z2ggd2hhdCBhbiBhbmNpbGxhcnkNCj4gPiA+ID4gPiA+ID4gPiBkZXZpY2UgcmVhbGx5IGlz
LiAgTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGl0IGlzIHVzZWQgdG8NCj4gPiA+ID4gPiA+ID4g
PiB0YWxrIHRvIHNlY29uZGFyeSBhZGRyZXNzZXMgb2YgYSBtdWx0aS1hZGRyZXNzIEkyQyBzbGF2
ZQ0KPiBkZXZpY2UuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEFzIEkgbWVudGlvbmVk
IHNvbWV3aGVyZSBiZWZvcmUsIHRoaXMgaXMgbm90IHRoZSBjYXNlLg0KPiA+ID4gPiA+ID4gPiBB
bmNpbGxhcnkgZGV2aWNlcyBhcmUgd2hlbiBvbmUgKmRyaXZlciogaGFuZGxlcyBtb3JlIHRoYW4g
b25lDQo+IGFkZHJlc3MuDQo+ID4gPiA+ID4gPiA+IEV2ZXJ5dGhpbmcgZWxzZSBoYXMgYmVlbiBo
YW5kbGVkIGRpZmZlcmVudGx5IGluIHRoZSBwYXN0DQo+ID4gPiA+ID4gPiA+IChmb3IgYWxsIHRo
ZSB1c2VzIEkgYW0gYXdhcmUgb2YpLg0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBZZXQs
IEkgaGF2ZSBhbm90aGVyIGlkZWEgd2hpY2ggaXMgc28gc2ltcGxlIHRoYXQgSSB3b25kZXIgaWYN
Cj4gPiA+ID4gPiA+ID4gaXQgbWF5YmUgaGFzIGFscmVhZHkgYmVlbiBkaXNjdXNzZWQgc28gZmFy
Pw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiAqIGhhdmUgdHdvIHJlZ3MgaW4gdGhlIGJp
bmRpbmdzDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gT0ssIGl0IGlzIGlubGluZSB3aXRoIERU
IG1haW50YWluZXJzIGV4cGVjdGF0aW9uIGFzIGl0IGlzDQo+ID4gPiA+ID4gPiBtYXRjaGluZyB3
aXRoIHJlYWwgaHcgYXMgc2luZ2xlIGRldmljZSBub2RlIGhhdmluZyB0d28gcmVncy4NCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+ICogdXNlIHRoZSBzZWNvbmQgcmVnIHdpdGggaTJjX25ld19j
bGllbnRfZGV2aWNlIHRvIGluc3RhbnRpYXRlDQo+IHRoZQ0KPiA+ID4gPiA+ID4gPiAgIFJUQyBz
aWJsaW5nLiAnc3RydWN0IGkyY19ib2FyZF9pbmZvJywgd2hpY2ggaXMgb25lDQo+IHBhcmFtZXRl
ciwgc2hvdWxkDQo+ID4gPiA+ID4gPiA+ICAgaGF2ZSBlbm91Z2ggb3B0aW9ucyB0byBwYXNzIGRh
dGEsIGUuZyBpdCBoYXMgYQ0KPiBzb2Z0d2FyZV9ub2RlLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+IE9LLCBJIGNhbiBzZWUgdGhlIGJlbG93IGNhbiBiZSBwYXNzZWQgZnJvbSBQTUlDIHRvIG5l
dyBjbGllbnQNCj4gZGV2aWNlLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IAljbGllbnQtPmFk
ZHIgPSBpbmZvLT5hZGRyOw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+IAljbGllbnQtPmluaXRf
aXJxID0gaW5mby0+aXJxOw0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+
ID4gU2hvdWxkIHdvcmsgb3IgZGlkIEkgbWlzcyBzb21ldGhpbmcgaGVyZT8NCj4gPiA+ID4gPiA+
DQo+ID4gPiA+ID4gPiBJIGd1ZXNzIGl0IHdpbGwgd29yay4gV2UgaW5zdGFudGlhdGUgYXBwcm9w
cmlhdGUgZGV2aWNlIGJhc2VkDQo+ID4gPiA+ID4gPiBPbiBQTUlDIHJldmlzaW9uIGFuZCBzbGF2
ZSBhZGRyZXNzIGFuZCBJUlEgcmVzb3VyY2UgcGFzc2VkDQo+ID4gPiA+ID4gPiB0aHJvdWdoICdz
dHJ1Y3QgaTJjX2JvYXJkX2luZm8nDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gV2lsbCBjaGVj
ayB0aGlzIGFuZCB1cGRhdGUgeW91Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gaW5mby5pcnEgPSBp
cnE7IC0tPklycSBmaW5lDQo+ID4gPiA+ID4gaW5mby5hZGRyID0gYWRkcjsgLS0+c2xhdmUgYWRk
cmVzcyBmaW5lIHNpemUgPQ0KPiA+ID4gPiA+IHN0cnNjcHkoaW5mby50eXBlLCBuYW1lLCBzaXpl
b2YoaW5mby50eXBlKSk7IC0tPmluc3RhbnRpYXRpb24NCj4gPiA+ID4gPiBiYXNlZCBvbiBQTUlD
IHZlcnNpb24gZmluZS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IDEpIEhvdyBkbyB3ZSBzaGFyZSBj
bGsgZGV0YWlscyBvbiBpbnN0YW50aWF0ZWQgZGV2aWNlIHRvIGZpbmQgaXMNCj4gPiA+ID4gPiBp
dCBjb25uZWN0ZWQgdG8gZXh0ZXJuYWwgY3J5c3RhbCBvciBleHRlcm5hbCBjbG9jayBzb3VyY2U/
IGFzIHdlDQo+ID4gPiA+ID4gY2Fubm90IHBhc3Mgb2Zfbm9kZSBiZXR3ZWVuIFBNSUMgYW5kICJp
MmNfYm9hcmRfaW5mbyIgYXMgaXQNCj4gPiA+ID4gPiByZXN1bHRzIGluIHBpbmN0cmwgZmFpbHVy
ZS4gaW5mby0+cGxhdGZvcm1kYXRhIGFuZA0KPiA+ID4gPiA+IENsaWVudC0+ZGV2LnBsYXRmb3Jt
ZGF0YSB0byByZXRyaWV2ZSB0aGlzIGluZm8/Pw0KPiA+ID4gPg0KPiA+ID4gPiBPcg0KPiA+ID4g
Pg0KPiA+ID4gPiBJMkMgaW5zdGFudGlhdGlvbiBiYXNlZCBvbiBhY3R1YWwgb3NjaWxsYXRvciBi
aXQgdmFsdWUsIGllLCB0d28NCj4gPiA+ID4gaTJjX2RldmljZV9pZCdzIHdpdGggb25lIGZvciBz
ZXR0aW5nIG9zY2lsbGF0b3IgYml0IGFuZCBhbm90aGVyDQo+ID4gPiA+IGZvciBjbGVhcmluZyBv
c2NpbGxhdG9yIGJpdA0KPiA+ID4gPg0KPiA+ID4gPiBQTUlDIGRyaXZlciBwYXJzZXMgdGhlIGNs
b2NrIGRldGFpbHMuIEJhc2VkIG9uIGZpcm13YXJlIHZlcnNpb24NCj4gPiA+ID4gYW5kIGNsb2Nr
LCBJdCBpbnN0YW50aWF0ZXMgZWl0aGVyIGkyY19kZXZpY2VfaWQgd2l0aCBzZXR0aW5nDQo+ID4g
PiA+IG9zY2lsbGF0b3IgYml0IG9yIGNsZWFyaW5nIG9zY2lsbGF0b3IgYml0Lg0KPiA+ID4NCj4g
PiA+IEkgZG9uJ3QgbGlrZSB0aGF0IGhhY2suIEkgc3RpbGwgdGhpbmsgdGhhdCB0d28gRFQgbm9k
ZXMgaXMgdGhlIGJlc3QNCj4gPiA+IG9wdGlvbiwgSSB0aGluayB5b3UncmUgdHJ5aW5nIGhhcmQg
dG8gaGFjayBhcm91bmQgYSBwcm9ibGVtIHRoYXQgaXMNCj4gPiA+IGFjdHVhbGx5IG5vdCBhIHBy
b2JsZW0uDQo+ID4NCj4gPiBXaHkgZG8geW91IHRoaW5rIGl0IGlzIGEgaGFjaz8gSSBiZWxpZXZl
IHJhdGhlciBpdCBpcyBhY3R1YWwgc29sdXRpb24NCj4gPg0KPiA+IFBNSUMgaXMgYSBzaW5nbGUg
ZGV2aWNlLCB3aXRoIDIgcmVncywgY2xvY2tzLCBwaW5jdHJsIGFuZCBJUlENCj4gcHJvcGVydGll
cy4NCj4gPiBTbyBpdCB3aWxsIGJlIHJlcHJlc2VudGVkIGFzIHNpbmdsZSBub2RlIHdpdGggc2lu
Z2xlIGNvbXBhdGlibGUuDQo+IA0KPiBUaGUgY2hpcCBpcyBhIHNpbmdsZSBwYWNrYWdlIHRoYXQg
Y29udGFpbnMgdHdvIGluZGVwZW5kZW50IGRldmljZXMuIFRoaXMNCj4gaXMgbm90IGRpZmZlcmVu
dCB0aGFuIGJ1bmRsaW5nIG1hbnkgSVAgY29yZXMgaW4gYW4gU29DLCB3ZSBoYXZlIG9uZSBEVA0K
PiBub2RlIHBlciBJUCBjb3JlLCBub3QgYSBzaW5nbGUgRFQgbm9kZSBmb3IgdGhlIFNvQy4gVGhl
IGZhY3QgdGhhdCB3ZSdyZQ0KPiBkZWFsaW5nIHdpdGggYW4gZXh0ZXJuYWwgcGh5c2ljYWwgY29t
cG9uZW50IGhlcmUgaXNuJ3QgcmVsZXZhbnQuDQoNCkRUIG1haW50YWluZXIncyBuZXcgcmVxdWly
ZW1lbnQgaXMgYSBzaW5nbGUgZGV2aWNlIG5vZGUgZm9yIGEgZGV2aWNlLg0KSWYgYSBkZXZpY2Ug
c3VwcG9ydHMgbW9yZSBmdW5jdGlvbmFsaXRpZXMganVzdCBpbnN0YW50aWF0ZSBhbmQgYmluZCBp
dC4NCg0KSSBhbHJlYWR5IGdvbmUgdGhyb3VnaCBtYWlubGluaW5nIE1UVTNhIGRldmljZSwgd2l0
aCAzIHNlcGFyYXRlIGR0IG5vZGVzDQphbmQgZmluYWxseSBlbmRzIHVwIGluIHNpbmdsZSBkZXZp
Y2Ugbm9kZSBpbnN0YW50aWF0aW5nIFBXTS9Db3VudGVyL1RpbWVyIG5vZGVzLg0KDQpIZXJlIGFs
c28gSSBzdGFydGVkIHdpdGggMiBkZXZpY2Ugbm9kZXMsIGFuZCBlbmRzIHVwIGluIHNpbmdsZSBk
ZXZpY2Ugbm9kZQ0KYXMgaXQgaXMgYSBzaW5nbGUgZGV2aWNlLg0KDQpJIHRoaW5rIGZyb20gZHQg
cG9pbnQgaXQgaXMgY29ycmVjdCB0byBoYXZlIHNpbmdsZSBkZXZpY2Ugbm9kZSBmb3INCmEgZGV2
aWNlLiBldmVuIHRob3VnaCBkZXZpY2UgY29udGFpbnMgUE1JQyBhbmQgUlRDIGFzIHNlcGFyYXRl
IGZ1bmN0aW9uYWxpdHkNCldpdGggc2hhcmVkIHJlc291cmNlcyBsaWtlIElSUSwgUElOUyBhbmQg
Q2xvY2tzIGFzIGF0IHRoZSBQTUlDIGRldmljZSBpcyB0aGUgb25lDQpleHBvc2VzIHRvIHRoaXMg
dG8gb3V0c2lkZSB3b3JsZC4NCg0KPiANCj4gPiBCeSBpbnN0YXRpbmcgYSBjbGllbnQgZGV2aWNl
LCB3ZSBhcmUgc2hhcmluZyB0aGUgcmVsZXZhbnQgcmVzb3VyY2VzIHRvDQo+ID4gUlRDIGRldmlj
ZSBkcml2ZXIuDQo+IA0KPiBCeSBpbnN0YW50aWF0aW5nIGEgY2xpZW50IGRldmljZSwgeW91IGNy
ZWF0ZSBhIHNlY29uZCBzdHJ1Y3QgZGV2aWNlLCB3aGljaA0KPiBpcyB0aGUga2VybmVsIGFic3Ry
YWN0aW9uIG9mIGEgaGFyZHdhcmUgZGV2aWNlLiBUaGlzIHNob3dzIGluIG15IG9waW5pb24NCj4g
dGhhdCB3ZSdyZSBkZWFsaW5nIHdpdGggdHdvIGRldmljZXMgaGVyZSwgaGVuY2UgbXkgcmVjb21t
ZW5kYXRpb24gb2YgdXNpbmcNCj4gdHdvIERUIG5vZGVzLg0KDQpUd28gRFQgbm9kZXMgaXMgdGhl
IHByb2JsZW0uIERUIG1haW50YWluZXIncyBkb24ndCBsaWtlIGl0LCBmb3IgdGhlbSBpdCBpcyBq
dXN0DQpvbmUgZGV2aWNlIHdoaWNoIHByb3ZpZGVzIFBNSUMvUlRDIGZ1bmN0aW9uYWxpdHkuDQoN
Cj4gDQo+IEFzIHlvdSd2ZSBub3RpY2VkLCB3aXRoIHR3byBkZXZpY2VzIGFuZCBhIHNpbmdsZSBE
VCBub2RlLCBwaW5jdHJsDQo+IGNvbXBsYWlucy4gWW91IGNhbiBoYWNrIGFyb3VuZCB0aGF0IGJ5
IG1vdmluZyB0aGUgcGluY3RybCBjb25maWd1cmF0aW9uDQo+IGZyb20gdGhlIFBNSUMgRFQgbm9k
ZSB0byBhbm90aGVyIERUIG5vZGUsIGFuZCB0aGF0J3Mgb25lIGZpcnN0IGhhY2suDQoNClBNSUMg
ZGV2aWNlIGV4cG9zZSBwaW5zIGFuZCBpdCBiaW5kcyB0aGUgcGlucyBkdXJpbmcgcHJvYmUuIFNp
bmNlIGl0IGlzIGEgc2luZ2xlIGRldmljZSwNCndlIGRvbid0IG5lZWQgdG8gc2hhcmUgdGhpcyB0
byBSVEMgZGV2aWNlLiBXZSBqdXN0IG5lZWQgdG8gYWRkIHBpbmN0cmwgZGVmaW5pdGlvbnMNCmlu
IFBNSUMgZGV2aWNlIG5vZGUuIFRoaXMgaXMgbm90IGEgaGFjay4NCg0KPiBUaGVuLCB5b3UnbGwg
bmVlZCB0byBoYXZlIHR3byBkaWZmZXJlbnQgZGV2aWNlIElEcyBkZXBlbmRpbmcgb24gdGhlIFBN
SUMNCj4gdmVyc2lvbiB0byBsZXQgdGhlIFJUQyBkcml2ZXIgc2V0IHRoZSBvc2NpbGxhdG9yIGJp
dCBjb3JyZWN0bHksIGFuZCB0aGF0J3MNCj4gYSBzZWNvbmQgaGFjay4NCg0KUE1JQyBoYXMgYWxs
IHRoZSBpbmZvcm1hdGlvbiwgc28gaXQgY2FuIGluc3RhbnRpYXRlIGFuZCBiaW5kIHdpdGggdGhl
IGNvbmZpZ3VyYXRpb24NCm5lZWRlZCBmb3Igc2Vjb25kIGRldmljZS4gU28gaXQgaXMgbm90IGEg
aGFjay4NCg0KPiANCj4gQSBzb2x1dGlvbiB3aXRoIHR3byBEVCBub2RlcyBtb2RlbHMgdGhlIGhh
cmR3YXJlIGJldHRlciBhbmQgaXMgY2xlYW5lci4NCg0KQnV0IGxvb2tzIGxpa2UgYWxsIG90aGVy
IHBlb3BsZSBhcmUgaGFwcHkgd2l0aCBzaW5nbGUgRFQgbm9kZS4gDQoNCkNoZWVycywNCkJpanUN
Cg==
