Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E714672BE76
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Jun 2023 12:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234484AbjFLKNU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 12 Jun 2023 06:13:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjFLKNF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 12 Jun 2023 06:13:05 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2109.outbound.protection.outlook.com [40.107.113.109])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA8505B9C;
        Mon, 12 Jun 2023 02:53:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpKrXtKjcK4X1tJhluW11U8UzYWfX70ITENUJSqQjZGznp/ux6wwbCHypKkK9Bo4SjxhgFGbmSNg4JqcnY0ebTQ0jGH8TA+fKAGJ+UhhNKdzpFTuNaREiHG1eOPRl1QifLTbwj6OF2KC86h3GxuzZoFh/OA68K6NyMpg3r5fscD+RbxNjccfSNh2cW7KsCIpMw+W+E9V5zx6Qu/8NATWZpG2xKPiFw12iN3Hwl7MW5K7chGSruuCFyP1xUpdCpnwfl8+NmA7h8s5LI8Ilc0QkxKQlAZugI0ISh2/1GVxBea543059oxO+SaDbiE1eSc/xVWdT+o9m+Q+WGXJ/Wng3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rxpzoudn9K5eUXJpigJOsjOKjYgNT/I24fnp7hztdo=;
 b=WV1SqaTEs8XzgTl7UQfpvUFhgScn24g7srlKtF+AhsOV/HQxtrdD13erJUps/OZ3i/a3llBRe2q+vOTOfnj84eDWaxGNOnqS8ty4xGW0KWv415Oejb53X1AGZAj2Ol8jpY9Ll7XELZYONF6hxgv4OjBnSW85kXiyZwOhFeh6u7NNOuDTdTtOGX9hOoIe1K0mACPwTW8W5zQJ2zAp+gGo2TccWrTVBacR1la9lJuijaOd5Mu3lxh11fxjC20Grdu/unvKra960nfvSjY5ZizhfbMb4T0J69KWBSfQsqe4jL+c9/IU3iIDMq4QENWow7Q9RrWjkYyzrA76+fDXSQ6OxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rxpzoudn9K5eUXJpigJOsjOKjYgNT/I24fnp7hztdo=;
 b=ZC3zc2NeP/VVJhtGMbTq0KbUoUX77DzPEswqM6wAQU6PEodc8qLvsGFc7zGtfsKQiKR3iEGHDxniE2VKX2gTt9sJ12Vkzfda9YKwTCGXFgPQpKnipO33AAEZPjEL446dK2H8+wWkmUjdxGuCb2/S0krCZYwF8WyHijFoEXmrc1s=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS7PR01MB12080.jpnprd01.prod.outlook.com (2603:1096:604:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 09:53:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.045; Mon, 12 Jun 2023
 09:53:02 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0A==
Date:   Mon, 12 Jun 2023 09:53:02 +0000
Message-ID: <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS7PR01MB12080:EE_
x-ms-office365-filtering-correlation-id: 55cab173-2936-4687-a66f-08db6b2acfc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zOSFBPu1+U42/Gqycix97scquT0xjD/3V2zEAw6SuVPj//TtndB9e2QjJzcF1OmYamN/9RZvOtAOfZ5Vxu8DPQpMHD/GCa98B8tMItvWpJXpua59fZxzDo4kDONPZh7XO3aO66DNsfySOQFSpH58b2C7WrVIyxXB7eLcoyTgpA/qE2bwUasPmZok4Ww2U1Z+6WsyV0TAexK0iPG1X43t84lYMWT5tKv2jzE4CiSPuiJUO+YT9R/NLaTKzcjukuQQur0TxKfIiiWp2ltkIRYySDuQ9gnCW2r7067/Du8qPRA25dvvryfv3UzUArIOeSYIuKXVgK3EME9uKJUCpxVM1BZOf52xXpABC8Z/SeMBjcRmowMWuffET+MFqBNuY3X+7De2CuMTavEltor7IhZcg6GoUT620FKKk2AGOwEdpDhm9VOXkjLudPf52pcTDc15kNS2MP75sMJlE3qHztU8hcal4XV1CqZOdfcbIqGeN4/+QgivQKNGvCLrB1uHPQphopbDEQQFtvB6aJVKFakGKKXMyCu1mXQzHBbcuKVwX9uUGtMSwD4N/oLSbT8etMTv8Pw7LmPGNquEpYweB90rDK/6BsEsj9OOjGNdTO1FbrPkcfYuUCGFotQ4DKqCB1fI
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(451199021)(316002)(41300700001)(7696005)(83380400001)(86362001)(66574015)(38070700005)(9686003)(53546011)(6506007)(186003)(7406005)(7416002)(26005)(33656002)(2906002)(122000001)(38100700002)(55016003)(5660300002)(52536014)(8676002)(8936002)(76116006)(66946007)(110136005)(54906003)(64756008)(66556008)(66476007)(66446008)(478600001)(71200400001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RklCWHUzZnpta3BvNUh5cmwvbTlaSHVXYzk2WWdyWlFJVDVBSENtQytYYkFR?=
 =?utf-8?B?b1FIOXBiU0txNWI0L1pSTHBXWWt6ZzJEczh5d2Vzcm1pK05YTjVSbktEblNU?=
 =?utf-8?B?dDJHbTFlWEx4UmliMlFEUXc2SHFqMy8xMnF2SzU4L2JIaUJEcGVZVmIvdm5o?=
 =?utf-8?B?b2kwS0RwdkVzUlF6bnE0eHZHSWlYQ29pZDRndXMrak1QYTlTYmUxeFg1YmRV?=
 =?utf-8?B?U3JnQ05hTklRVDVPMmJnalN5UU1DTTVDbEhycFExOERFZUFlS3l2V1dwSnpP?=
 =?utf-8?B?QXROR2laeUlPR2U0dnUzaEt4T3ZiUjB2eThKREtRZWRwbU92N2VNSU81MVhW?=
 =?utf-8?B?OTFPN01NSmxkdTZtUzQ2SU9lTDg1cE5pLzdnUW9mSnlkQkhwR0VVMGJOK0RT?=
 =?utf-8?B?OUtKZlUzU0sxK0plUnhNMHk1MHhXaUxrNEZKMStVMnd0OUtLVjBWN2M3MDFN?=
 =?utf-8?B?QTdmS1NXNXpoUmNpbmRhRWVDK3p1Ny8vY3N0U3h2VjhtWmZiVFp6TWVYaWdJ?=
 =?utf-8?B?OWpldUFyeThGcHdSVjk4NDNkVzIrbnA4Vk5tM3JrSUN6b1VKMW9ScTFoQnp6?=
 =?utf-8?B?dlE4eTBTbnB6N3hoOEY4eDhmUVhvSHBwQUpqbWFRL0NTdUxqMFhJQ0Ixdnc4?=
 =?utf-8?B?K0N6SklQSDJvSTNRcytGQ1NFaEd2b05VRS8wbmZpUmhYeXIxc2xXbGdZM2Fv?=
 =?utf-8?B?NnpQSFdEQTA5K1BqVGRmdldycFRPWXptVmFYU3YvVXBGVTQwL2djR1lTVHJ5?=
 =?utf-8?B?bzZlUWZCejUvZmRmKzdJWUdtSUc5clRQNkszWkcrVW10dit4aWh5c09XRWhu?=
 =?utf-8?B?dm1OdmJMWVRleDJkNXd6eURNckpyRlJWN0tsTGFuV3NBc2FtL3dmQUlFR3Qz?=
 =?utf-8?B?cGQyQnpRMmN3VUJwSFFDY1hPZVRJUVBJQVU1NGxDbjZJRklJLzRZeHUwZmVu?=
 =?utf-8?B?cFNIZnhXbnNzTnBpWTlSdUdXZDZwMDNUeGRhK3dXbWd2VnZYQ3BaeitEUGJ3?=
 =?utf-8?B?NjNqZThXUHV1Zjd2am9xUmpoNjF3SXQzMEdtcGxUcnlieHJjSUlzM0M3NkJT?=
 =?utf-8?B?MHZzOTFEWWJtV094aGczSzVKQkd5QmRvb1FBaG52dXRkRURYYkxHODVaS25a?=
 =?utf-8?B?dFJPVGR3NUxlV01pSFdZZkkxc3VOVVBscmVoeW5TT1BJV3dEWG5kMWJFRWt2?=
 =?utf-8?B?NVl5SWpKcTRJWWpJWVFDb2pUY0N4TzZ3czJJSGorQk1rQ0IyUHhlWjFUblhp?=
 =?utf-8?B?cG1heGxYL29BcnA2OUFnV0wyZlpzbUk1eEFMTU1NK3JkRXBmTk5BVS9NY3pm?=
 =?utf-8?B?TzJKelJaVjNOZEpvNWdaNUJpZjdVaHV6RlFFblg5OW9xQ0pjaDRmSjF1SzNL?=
 =?utf-8?B?S29PdmptbytITHFTTDJubGxNN2o0eEUySEdWUUFIUGptZ2VBRUpSUEhoN2FB?=
 =?utf-8?B?YmpMZm9nTm9BUDVFQ3d3K2ZPTnc2dXVxamZJRzlhZTJoTXpvUkVzQzRESnJI?=
 =?utf-8?B?QzJVSzFxanZpUDM5VzdqUWx6Vk14emxQSGNQR2R5dDVqSXJHY09ycm1wdlNy?=
 =?utf-8?B?aFFDMDRpNmVTU1ExSE9LN2lBRmpXaHhvNENzaFhka0ZFT2F4M2tPSGYvVjhi?=
 =?utf-8?B?bklWR1Z4RDIvN0gzZXlzTlplOFRZa2wyNElNbFI1VzB3b2hoMUZ5N0xwZzQ3?=
 =?utf-8?B?WE5JWDMrdzVndmgxWVdzYkJCSHVxYkp0ZzZXSTJIMHB5bUxWRkdZVS9PZGxC?=
 =?utf-8?B?ekh2aXJZNzQ4bnBNVFVETmxBeDlKa3hvNlkxdEE4RjVVNWY5TW4zVkprTTZN?=
 =?utf-8?B?Q3BSNDFTSFFyRGtpbHM4alMrZFdkUk05clM1RHF1MFh0N2syVGdRYlVJZnJN?=
 =?utf-8?B?MlhYbFRicnhQM2puM2pEdURueVU2NWhPc1h5aXNqNVl5dWVnU1NOUjIvLzli?=
 =?utf-8?B?Q3ROdDk1V3dKUWE0SFZvR1FEOGVqbFVwL0hCUFRPd0FwYlZ3V3BEQ0RLd1U0?=
 =?utf-8?B?TXdNdGduMmZmVkJrMFgwb25ZbzRwT2diWHNIQVVEMlp3cnd2am9RbVoyQVFK?=
 =?utf-8?B?QU9qMnc1MVE5dHhhYXNiZUFseXRFbnpjNjdBZlBOSlIvTUxMTUw1bGt6dU5Q?=
 =?utf-8?Q?uyBq+ogxSQyAMAPh2M85jsJdG?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55cab173-2936-4687-a66f-08db6b2acfc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 09:53:02.1175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GRVqS1ncD8lNwS0JeVcOaX2gPBtCcSpVIaqNmKDFXZSa3A027p+V1JNBJkeLub0vJ3qT+Zucyws7IgFtgNR0DUTwVQba1mNJD2Twll1hHVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12080
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SGkgQWxsLA0KDQpIb3cgZG8gd2UgcHJvY2VlZCBoZXJlIGJldHdlZW4gWzFdIGFuZCBbMl0/DQoN
CkRULU1haW50YWluZXJzIHN1Z2dlc3Rpb246DQpbMV0NCnJhYTIxNTMwMDogcG1pY0AxMiB7DQoJ
Y29tcGF0aWJsZSA9ICJyZW5lc2FzLHJhYTIxNTMwMCI7DQoJcmVnID0gPDB4MTI+LCA8MHg2Zj47
DQoJcmVnLW5hbWVzID0gIm1haW4iLCAicnRjIjsNCg0KCWNsb2NrcyA9IDwmeDI+Ow0KCWNsb2Nr
LW5hbWVzID0gInhpbiI7DQoJLyogQWRkIE9wdGlvbmFsIHNoYXJlZCBJUlEgcmVzb3VyY2UgYW5k
IHNoYXJlIGl0IHRvIGNoaWxkIGFuZCBoYW5kbGUgaXQgYm90aCBpbiBwYXJlbnQgYW5kIGNoaWxk
ICovDQp9Ow0KDQpMYXVyZW50L1dvbGZyYW0gc3VnZ2VzdGlvbiB0byBzcGxpdCBpdCBpbnRvIHR3
byBub2RlcyBhbmQgZ2V0IHJpZCBvZiB0aGlzIHBhdGNoOg0KWzJdDQoJcmFhMjE1MzAwOiBwbWlj
IEAxMiB7DQoJCWNvbXBhdGlibGUgPSAicmVuZXNhcyxyYWEyMTUzMDAiOw0KCQlyZWcgPSA8MHgx
Mj47DQoJCQ0KCQkvKiBBZGQgT3B0aW9uYWwgc2hhcmVkIElSUSAqLw0KCQlyZW5lc2FzLHJhYTIx
NTMwMC1ydGMgPSA8JnJ0Y19yYWEyMTUzMDA+OyAvKiBQYXJzZSB0aGUgaGFuZGxlIGFuZCBFbmFi
bGUgUlRDICwgaWYgcHJlc2VudC4qLw0KCX07DQoNCglydGNfcmFhMjE1MzAwOiBydGNANmYgew0K
CQljb21wYXRpYmxlID0gInJlbmVzYXMscmFhMjE1MzAwLWlzbDEyMDgiOw0KCQlyZWcgPSA8MHg2
Zj47DQoNCgkJLyogQWRkIE9wdGlvbmFsIHNoYXJlZCBJUlEgKi8NCgkJY2xvY2tzID0gPCZ4Mj47
DQoJCWNsb2NrLW5hbWVzID0gInhpbiI7DQoJCXJlbmVzYXMscmFhMjE1MzAwLXBtaWMgPSA8JnBt
aWM+OyAvKiBQYXJzZSB0aGUgaGFuZGxlIHRvIGdldCBQTUlDIHZlcnNpb24gdG8gY2hlY2sgT3Nj
aWxsYXRvciBiaXQgaXMgaW52ZXJ0ZWQgb3Igbm90ICovDQoJfTsNCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEJpanUgRGFzDQo+IFNlbnQ6
IFRodXJzZGF5LCBKdW5lIDgsIDIwMjMgMTo1NyBQTQ0KPiBUbzogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBDYzogV29sZnJhbSBTYW5nIDx3
c2FAa2VybmVsLm9yZz47IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtDQo+IG02OGsu
b3JnPjsgS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8u
b3JnPjsgUm9iDQo+IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEFuZHJ6ZWogSGFqZGEg
PGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPjsNCj4gTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ry
b25nQGxpbmFyby5vcmc+OyBSb2JlcnQgRm9zcw0KPiA8cmZvc3NAa2VybmVsLm9yZz47IERhdmlk
IEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBEYW5pZWwgVmV0dGVyDQo+IDxkYW5pZWxAZmZ3
bGwuY2g+OyBLaWVyYW4gQmluZ2hhbSA8a2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT47
DQo+IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgSGFucyBWZXJr
dWlsIDxodmVya3VpbC0NCj4gY2lzY29AeHM0YWxsLm5sPjsgQWxlc3NhbmRybyBadW1tbyA8YS56
dW1tb0B0b3dlcnRlY2guaXQ+OyBBbGV4YW5kcmUNCj4gQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxv
bmlAYm9vdGxpbi5jb20+OyBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Ow0KPiBKZXJu
ZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPjsgVXdlIEtsZWluZS1Lw7ZuaWcg
PHUua2xlaW5lLQ0KPiBrb2VuaWdAcGVuZ3V0cm9uaXguZGU+OyBDb3JleSBNaW55YXJkIDxjbWlu
eWFyZEBtdmlzdGEuY29tPjsgTWFyZWsgQmVow7puDQo+IDxrYWJlbEBrZXJuZWwub3JnPjsgSmlh
c2hlbmcgSmlhbmcgPGppYXNoZW5nQGlzY2FzLmFjLmNuPjsgQW50b25pbyBCb3JuZW8NCj4gPGFu
dG9uaW8uYm9ybmVvQGZvc3Muc3QuY29tPjsgQWJoaW5hdiBLdW1hciA8cXVpY19hYmhpbmF2a0Bx
dWljaW5jLmNvbT47DQo+IEFobWFkIEZhdG91bSA8YS5mYXRvdW1AcGVuZ3V0cm9uaXguZGU+OyBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBsaW51eC1pMmNAdmdlci5rZXJuZWwu
b3JnOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IEdlZXJ0DQo+IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBGYWJyaXppbyBDYXN0cm8NCj4gPGZhYnJpemlvLmNh
c3Ryby5qekByZW5lc2FzLmNvbT47IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsg
TWFyaw0KPiBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPg0KPiBTdWJqZWN0OiBSRTogW1BBVENI
IHY1IDAxLzExXSBpMmM6IEVuaGFuY2UgaTJjX25ld19hbmNpbGxhcnlfZGV2aWNlIEFQSQ0KPiAN
Cj4gSGkgTGF1cmVudCwNCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KPiANCj4gPiBT
dWJqZWN0OiBSZTogW1BBVENIIHY1IDAxLzExXSBpMmM6IEVuaGFuY2UgaTJjX25ld19hbmNpbGxh
cnlfZGV2aWNlDQo+ID4gQVBJDQo+ID4NCj4gPiBIaSBCaWp1LA0KPiA+DQo+ID4gT24gVGh1LCBK
dW4gMDgsIDIwMjMgYXQgMTE6MDA6MTlBTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiA+
IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMDEvMTFdIGkyYzogRW5oYW5jZQ0KPiA+ID4gPiBpMmNf
bmV3X2FuY2lsbGFyeV9kZXZpY2UgQVBJIE9uIFRodSwgSnVuIDA4LCAyMDIzIGF0IDA2OjQxOjM1
QU0NCj4gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPiA+ID4gU3ViamVjdDogUkU6IFtQ
QVRDSCB2NSAwMS8xMV0gaTJjOiBFbmhhbmNlDQo+ID4gPiA+ID4gPiBpMmNfbmV3X2FuY2lsbGFy
eV9kZXZpY2UgQVBJDQo+ID4gPiA+ID4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgMDEvMTFd
IGkyYzogRW5oYW5jZQ0KPiA+ID4gPiA+ID4gPiBpMmNfbmV3X2FuY2lsbGFyeV9kZXZpY2UgQVBJ
DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IEhpIGFsbCwNCj4gPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ID4gc29ycnkgZm9yIG5vdCBiZWluZyBhYmxlIHRvIGNoaW1lIGluIGVhcmxpZXIu
DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+ID4gSW4gQmlqdSdzIHBhcnRpY3VsYXIgdXNl
IGNhc2UsIHRoZSBpMmMgZGV2aWNlIHJlc3BvbmRzIHRvDQo+ID4gPiA+ID4gPiA+ID4gdHdvIGFk
ZHJlc3Nlcywgd2hpY2ggaXMgdGhlIHN0YW5kYXJkIGkyYyBhbmNpbGxhcnkgdXNlDQo+IGNhc2Uu
DQo+ID4gPiA+ID4gPiA+ID4gSG93ZXZlciwgd2hhdCdzIHNwZWNpYWwNCj4gPiA+ID4gPiA+ID4N
Cj4gPiA+ID4gPiA+ID4gTm90IHF1aXRlLiBhbmNpbGxhcnkgaXMgdXNlZCB3aGVuIGEgKmRyaXZl
ciogbmVlZHMgdG8gdGFrZQ0KPiA+ID4gPiA+ID4gPiBjYXJlIG9mIHR3byBhZGRyZXNzZXMuIFdl
IGFscmVhZHkgaGF2ZSBkZXZpY2VzIGJ1bmRsaW5nIHR3bw0KPiA+ID4gPiA+ID4gPiBmZWF0dXJl
cyBpbnRvIHRoZSBzYW1lIGNoaXAuIEkgcmVjYWxsIGF0IGxlYXN0IFJUQyArIEVFUFJPTQ0KPiA+
ID4gPiA+ID4gPiBzb21ld2hlcmUuIEFuZCBzbyBmYXIsIHdlIGhhdmUgYmVlbiBoYW5kbGluZyB0
aGlzIGJ5DQo+ID4gPiA+ID4gPiA+IGNyZWF0aW5nDQo+ID4gdHdvIG5vZGVzIGluIERUIGFuZCBo
YXZlIHByb3BlciBiaW5kaW5nIGRvY3MuDQo+ID4gPiA+ID4gPiA+IEkgdGhpbmsgdGhpcyBpcyBj
bGVhbmVyLiBGaXJzdCwgeW91IGNhbiBzZWUgaW4gRFQgYWxyZWFkeQ0KPiA+ID4gPiA+ID4gPiB3
aGF0IHRoZSBjb21wb3VuZCBkZXZpY2UgcmVhbGx5IGNvbnNpc3RzIG9mLiBJbiB0aGlzIGNhc2Us
DQo+ID4gPiA+ID4gPiA+IHdoaWNoIFJUQyBhbmQgUlRDIGRyaXZlciBpcyBleGFjdGx5IG5lZWRl
ZC4gU2Vjb25kLCB0aGUgY29kZQ0KPiA+ID4gPiA+ID4gPiBhZGRlZCBoZXJlIGFkZHMgY29tcGxl
eGl0eSB0byB0aGUgSTJDIGNvcmUgd2l0aCBhbm90aGVyDQo+ID4gPiA+ID4gPiA+IGxheWVyIG9m
DQo+ID4gaW5kZXJlY3Rpb24gZm9yIGR1bW15IGRldmljZXMuDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gRllJLCBwbGVhc2Ugc2VlIFsxXSBhbmQgWzJdDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+
ID4gQXMgcGVyIERUIG1haW50YWluZXJzLCBtb3N0IG9mIFBNSUNzIGFyZSBkZXNjcmliZWQgd2l0
aCBvbmUNCj4gPiA+ID4gPiA+IG5vZGUsIGV2ZW4gdGhvdWdoIFJUQyBpcyBvbiBzZXBhcmF0ZSBh
ZGRyZXNzLiBBY2NvcmRpbmcgdG8NCj4gPiA+ID4gPiA+IHRoZW0gdGhlIERUIHNjaGVtYSBhbGxv
d3MgbXVsdGlwbGUgYWRkcmVzc2VzIGZvciBjaGlsZHJlbi4NCj4gPiA+ID4gPiA+IEJ1dCBjdXJy
ZW50bHkgd2UgbGFja3MgaW1wbGVtZW50YXRpb24gZm9yIHRoYXQuIFRoZQ0KPiA+ID4gPiA+ID4g
ZW5oYW5jZW1lbnQgdG8gdGhpcyBBUEkgYWxsb3dzIHRoYXQuDQo+ID4gPiA+ID4gPg0KPiA+ID4g
PiA+ID4gPiA+IEFzIHNvbWUgcmVzb3VyY2VzIGFyZSBzaGFyZWQgKGtub3dsZWRnZSBhYm91dCB0
aGUgY2xvY2tzKSwNCj4gPiA+ID4gPiA+ID4gPiBzcGxpdHRpbmcgdGhpcyBpbiB0d28gZGlzdGlu
Y3QgZGV2aWNlcyBpbiBEVCAod2hpY2ggaXMNCj4gPiA+ID4gPiA+ID4gPiB3aGF0IEJpanUncyBp
bml0aWFsIHBhdGNoIHNlcmllcyBkaWQpIHdvdWxkIG5lZWQgcGhhbmRsZXMNCj4gPiA+ID4gPiA+
ID4gPiB0byBsaW5rDQo+ID4gYm90aCBub2RlcyB0b2dldGhlci4NCj4gPiA+ID4gPiA+ID4gPg0K
PiA+ID4gPiA+ID4gPiA+IERvIHlvdSBoYXZlIGEgYmV0dGVyIGlkZWEgaG93IHRvIHJlcHJlc2Vu
dCB0aGlzPw0KPiA+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBOb3Qgc3VyZSBpZiBJIHVuZGVy
c3Rvb2QgdGhpcyBjaGlwIGNvcnJlY3RseSwgYnV0IG1heWJlOiBUaGUNCj4gPiA+ID4gPiA+ID4g
UE1JQyBkcml2ZXIgZXhwb3NlcyBhIGNsb2NrIGdhdGUgd2hpY2ggY2FuIGJlIGNvbnN1bWVkIGJ5
DQo+ID4gPiA+ID4gPiA+IHRoZQ0KPiA+IFJUQyBkcml2ZXI/DQo+ID4gPiA+ID4NCj4gPiA+ID4g
PiBMZXQgbWUgZ2l2ZSBtZSBzb21lIGRldGFpbHMgb2YgdGhpcyBQTUlDIGNoaXAuDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBQTUlDIGRldmljZSBoYXMgMiBhZGRyZXNzZXMgIjB4MTI6LSBQTUlDIiAs
ICIweDZmIi0gcnRjLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSXQgaGFzIFhJTiwgWE9VVCwgSU5U
IyBwaW5zIGFuZCBhIHJlZ2lzdGVyIGZvciBmaXJtd2FyZQ0KPiByZXZpc2lvbnMuDQo+ID4gPiA+
DQo+ID4gPiA+IElzIHRoZSBmaXJtd2FyZSByZXZpc2lvbiByZWdpc3RlciBhY2Nlc3NlZCB0aHJv
dWdoIGFkZHJlc3MgMHgxMg0KPiA+ID4gPiAoUE1JQykgb3IgMHg2ZiAoUlRDKSA/DQo+ID4gPg0K
PiA+ID4gMHgxMihQTUlDKS4NCj4gPiA+DQo+ID4gPiA+ID4gQmFzZWQgb24gdGhlIHN5c3RlbSBk
ZXNpZ24sDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJZiBYSU4gYW5kIFhPVVQgaXMgY29ubmVjdGVk
IHRvIGV4dGVybmFsIGNyeXN0YWwsIEludGVybmFsDQo+ID4gPiA+ID4gb3NjaWxsYXRvciBpcyBl
bmFibGVkIGZvciBSVEMuIEluIHRoaXMgY2FzZSB3ZSBuZWVkIHRvIHNldCB0aGUNCj4gPiA+ID4g
PiBvc2NpbGxhdG9yIGJpdCB0byAiMCIuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJZiBYSU4gaXMg
Y29ubmVjdGVkIHRvIGV4dGVybmFsIGNsb2NrIHNvdXJjZSwgSW50ZXJuYWwNCj4gPiA+ID4gPiBv
c2NpbGxhdG9yIGlzIGRpc2FibGVkIGZvciBSVEMuIEluIHRoaXMgY2FzZSB3ZSBuZWVkIHRvIHNl
dCB0aGUNCj4gPiA+ID4gPiBvc2NpbGxhdG9yIGJpdCB0byAiMSIuDQo+ID4gPiA+DQo+ID4gPiA+
IFNhbWUgaGVyZSwgd2hpY2ggYWRkcmVzcyBpcyB0aGUgb3NjaWxsYXRvciBiaXQgYWNjZXNzZWQg
dGhyb3VnaCA/DQo+ID4gPg0KPiA+ID4gUlRDICgweDZGKS0tPiB0byBzZXQgb3NjaWxsYXRvciBi
aXQuDQo+ID4NCj4gPiBBbmQgZG9lcyB0aGUgUE1JQyBwYXJ0IGRlcGVuZCBvbiB0aGUgb3NjaWxs
YXRvciBiaXQgYmVpbmcgc2V0DQo+ID4gY29ycmVjdGx5LCBvciBpcyB0aGF0IHVzZWQgZm9yIHRo
ZSBSVEMgb25seSA/DQo+IA0KPiBQTUlDIHBhcnQgZG9lcyBub3QuIEl0IGlzIHVzZWQgb25seSBp
biBSVEMuDQo+IA0KPiBCYXNlZCBvbiBQTUlDIHJldmlzaW9uLCB3ZSBuZWVkIHRvIHNldCB0aGUg
b3NjaWxsYXRvciBiaXQgaW4gUlRDIGJsb2NrDQo+IGZvciBQTUlDIHJldiBhMCBhbmQgcmVzdCBv
ZiB0aGUgUE1JQyBjaGlwcy4NCj4gDQo+IE9uIFBNSUMgcmV2MCwgb3NjaWxsYXRvciBiaXQgaXMg
aW52ZXJ0ZWQuDQo+IA0KPiBDaGVlcnMsDQo+IEJpanUNCj4gPg0KPiA+ID4gPiA+IElmIFhJTiBh
bmQgWE9VVCBub3QgY29ubmVjdGVkIFJUQyBvcGVyYXRpb24gbm90IHBvc3NpYmxlLg0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gSVJRIyAob3B0aW9uYWwpIGZ1bmN0aW9uYWxpdHkgaXMgc2hhcmVkIGJl
dHdlZW4gUE1JQyBhbmQgUlRDLg0KPiA+ID4gPiA+IChQTUlDIGZhdWx0IGZvciB2YXJpb3VzIGJ1
Y2tzL0xET3MvV0RUL09UUC9OVk0gYW5kIGFsYXJtDQo+ID4gY29uZGl0aW9uKS4NCj4gPiA+ID4N
Cj4gPiA+ID4gSVJRcyBjYW4gYmUgc2hhcmVkIGJldHdlZW4gbXVsdGlwbGUgZGV2aWNlcyBzbyB0
aGlzIHNob3VsZG4ndCBiZSBhDQo+ID4gPiA+IHByb2JsZW0uDQo+ID4gPg0KPiA+ID4gT0suIEhv
dyBkbyB3ZSByZXByZXNlbnQgdGhpcyBJUlEgaW4gRFQ/DQo+ID4NCj4gPiBZb3UgY2FuIHNpbXBs
eSByZWZlcmVuY2UgdGhlIHNhbWUgSVJRIGZyb20gdGhlIGludGVycnVwdHMgcHJvcGVydHkgb2YN
Cj4gPiBkaWZmZXJlbnQgRFQgbm9kZXMuDQo+ID4NCj4gPiA+ID4gPiBUaGUgYm9hcmQsIEkgaGF2
ZSBkb2Vzbid0IHBvcHVsYXRlIElSUSMgcGluLiBJZiBuZWVkZWQgc29tZQ0KPiA+ID4gPiA+IGN1
c3RvbWVycyBjYW4gcG9wdWxhdGUgSVJRIyBwaW4gYW5kIHVzZSBpdCBmb3IgUE1JQyBmYXVsdCBh
bmQNCj4gPiA+ID4gPiBSVEMNCj4gPiBhbGFybS4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEFsc28s
IGN1cnJlbnRseSBteSBib2FyZCBoYXMgUE1JQyByZXYgYTAgd2hlcmUgb3NjaWxsYXRvciBiaXQg
aXMNCj4gPiA+ID4gPiBpbnZlcnRlZCBhbmQgaW50ZXJuYWwgb3NjaWxsYXRvciBpcyBlbmFibGVk
IChpZTogWElOIGFuZCBYT1VUIGlzDQo+ID4gPiA+ID4gY29ubmVjdGVkIHRvIGV4dGVybmFsIGNy
eXN0YWwpDQo+ID4NCj4gPiAtLQ0KPiA+IFJlZ2FyZHMsDQo+ID4NCj4gPiBMYXVyZW50IFBpbmNo
YXJ0DQo=
