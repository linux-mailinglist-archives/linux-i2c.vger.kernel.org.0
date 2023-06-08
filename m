Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8321B727780
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 08:41:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234224AbjFHGlo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 02:41:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233781AbjFHGln (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 02:41:43 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2110.outbound.protection.outlook.com [40.107.113.110])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDBD2113;
        Wed,  7 Jun 2023 23:41:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B/sEPiqC3rWITj2gaQFoAv4towKOdPnf1nOmCdnEAzC1xBt80z4NHNkGpIcZ1cN//B4RIvExjqvZ8/7ZGaOrYRI6U2vX5Dux0P073qGST3Oytvv7SjTssy7pmGovdjY9GLUmCIDKuK5txLn7DXFV268b2SZg8/NyT4ZcgBJoygwVkvy9Goxu3CWEyQv2yeVCHA/iY85mV4L/ZG/fCem1itsyj41QVF6OT3zFuj6p2aWFTQw5dI7sSbFu733pWJASHziXURkg8SyMINeL2aEFGoJR+ELwGycnrWJa9wvakwlbWFaxScF7YO+8d6TVTiZqZSz7CGboi6k8FPEuv5PGDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVIZ+09yb5PbF9m7Bx9Hf5uLImpMZuKCkH4TUOVq51s=;
 b=Y5MJw8RfMHDc/GLAowIOfumOQhRSaZZZMfiSDB2+hGOUcMbIwvJovt1pOXKvkmwLCr44hw0rRIdEJHxxtr/Rc3wFa97ouL+JBsiA/FfFRm9IEGPgODWsJMJmGrNiL4TnCQdr3gl9HWBNSSQ/Xq7O6XVcRuRAdDu3QQkc2PM5anchffw5BQrgrq9kkxD5UhMc+SMWL8AVigO9eWPmBjNFbUD8HYbywOlz032L6+w2sAvSPwt+dUF5i7vCJ0dJIfVvMaKLgVyZUzq814XPW1J96wu3g2u3gFQ+tpD1JHfIEKSAn05E95dyevJNPKcE34ZliaDp6yAMBHRbuOiJKYQgsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVIZ+09yb5PbF9m7Bx9Hf5uLImpMZuKCkH4TUOVq51s=;
 b=ebxBaYmZ/LVE6VK+4JNGLN6EGvs1g1ak5GS/1r1Pfe2LIqzMpoimjNIDxUOyzos3zMJ0VxpPS6Ol4xJUZhipE8hJ6q0LscoWhiTRcYI/b+0dsWpvRsk/JhlGZnPH0BCebNLVyRNEZ4Zv3Nai4WU/0COzZOAa3j1TuGsHjF8RCWE=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9415.jpnprd01.prod.outlook.com (2603:1096:604:1c6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19; Thu, 8 Jun
 2023 06:41:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.039; Thu, 8 Jun 2023
 06:41:35 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Corey Minyard <cminyard@mvista.com>,
        =?iso-8859-1?Q?Marek_Beh=FAn?= <kabel@kernel.org>,
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
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1Q
Date:   Thu, 8 Jun 2023 06:41:35 +0000
Message-ID: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
 <CAMuHMdXywnxO6cL5R84mryFuyVMswj6EniY-bZx7m_2L3iUY9A@mail.gmail.com>
 <ZIBFc3y9jD59lZ3A@shikoro>
 <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922A3A97439EA2F976940B28653A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9415:EE_
x-ms-office365-filtering-correlation-id: 78e44bb5-87db-4bc9-1e45-08db67eb67a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LcK/76SDKIQhbl+mK+cxjMK5fL/KBw8PH8HqM3Dny0SdbY5tYtcxnchB7GTvRHoH5EDMHvOZzMBcuuldP7Qg+GomoGYz5LsfIr82niHld7d9E/umcQmBFpBMDUjGej8b09CEvRcRmOfCVRnr1qlIzbOFgkQlAOsZfTfqZLxafeJDM75I8jNVaYMSypFld48uLlR5y53M+RP6Z1Jlm4ng9fivzcXDDYtkaMZUKUbRNTME92LNRkd2V6YzMb/3YFBeDXyI1+JQX4+OXveyqui6rMVvp2MdwGg2p/gEOMAWC996dM0c1mOTQa/qXlqEGHPk2dqif9afWtfPZjgHMwyqL8WQJTxhvRouH8tDnCFSzEpjHfdKgpsttyE932FbFjApSZLuVjC8++mgeOA5EZAFXcUDSnklNSDToa/To/f59evXDe6sS5OMNeGcevDgHybvkC4bJ0Ye1vTrEjA0/Wfx+HfkJBiwFHtKqEBROFVRA1Qvft4uIYJadZVdQWMaEopKzqfZXAtCTjNwAsMloH3Sbh2Z0sXyeaCpoO8m9cHnWIjmNAIioNUFVMOB6RRqlE/SyUrFm1Gs/APG/xFFYnVtAftWzC/XmrIEILrtvN1hQmtQrItuiMI+AxlwVm51LgZJ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(396003)(366004)(346002)(376002)(451199021)(55016003)(86362001)(7416002)(7406005)(2906002)(54906003)(110136005)(41300700001)(38100700002)(8676002)(8936002)(52536014)(5660300002)(122000001)(66446008)(76116006)(4326008)(316002)(64756008)(66476007)(66946007)(66556008)(7696005)(71200400001)(38070700005)(478600001)(33656002)(186003)(83380400001)(9686003)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qGBJYn5TngrLhOg+jX2CVoB2d1SnuYI2FAfv0K4vF4AZj5yk4UzQrK6Gdi?=
 =?iso-8859-1?Q?1K85yCfZ4EMVXW47Ve/lQiZF2yfAdaJs/AS+7SK7pSZYM6qeEoWfbpVb+P?=
 =?iso-8859-1?Q?J78JMuEgclhvRDAF/wJQ4iMvjD5vt8Io4IzzXIPXZVw0XIZYe4qBZgZUFQ?=
 =?iso-8859-1?Q?x2fOIcxygz1gNxtGrhdrP+lo8PYb1n2G0WKQymzxC+QjjAidzZNNrT9cef?=
 =?iso-8859-1?Q?goIuuypePhr6FV7DX0/FDUqxrD3ozipNC5u2vgh2lA2LbOH8qlobU5XyFJ?=
 =?iso-8859-1?Q?DFUgABIiQTLDscKJlIkh659X5vUZmq47ouYjJiU91Askm5QcbLCiFvIBVH?=
 =?iso-8859-1?Q?jLkdFN/LhlB5cQcWB9qkJOyvdVZEi3LkVMEaXJfZdaTMJpOET+YSp+AhfR?=
 =?iso-8859-1?Q?40P0c8dTOCzMCKcfApsY6naFn9jElp1Vd41Xcw3FJN5KU9xF1R1R66lPZg?=
 =?iso-8859-1?Q?QYq5YP4cN/2nMmY1QtVInSDEMlxn4eYGmd0Hrr0nlcARi32KW+D3AoUI3p?=
 =?iso-8859-1?Q?DGM3bGRIXmzwe65M6tLNWsUCHsqsiSQtZB/krzgaosJDZEIPuXZvSxRlhq?=
 =?iso-8859-1?Q?BYjssgUXwpXsTT8jfXekgHmlJyr2asVzpCwJ9d2e12nx593z7FOIn8f7TZ?=
 =?iso-8859-1?Q?P3QVlBvBBXvAplmENm0yZzEB6jcSTdWGM0Mz9A79yrHCkkfC7B2sSVL5fC?=
 =?iso-8859-1?Q?O3B4/0GkxxohDkoLViA8lk6pgeeVoT1qOQvCmam7oRF1F7EUlltozWdttm?=
 =?iso-8859-1?Q?Ca4Rxui6VkEtzGm0UbaOq3jF9MxHa9IBJ5/BRnazHvyArlDGscNn80SgLA?=
 =?iso-8859-1?Q?krWvo1sxBbVqw4kpmmrVO712op0beYLhrbQ9JzMCFYgDetXk/PmWyhpgT9?=
 =?iso-8859-1?Q?2BxKKPxseZY6/wAipJCi8hFsSrIRckoeY1y/yGYL3+4AZOqU3x9XJ6DpWd?=
 =?iso-8859-1?Q?vZ8ncYL6kzEzbp0gpHl02MfFmXg2s0hFGaTAmKJEE+Uumr4jDR3G3Q6biy?=
 =?iso-8859-1?Q?qoRofshZ7+n3kE/G6Bpm1EMUFVMaF0bgg1XD+Smp/P6jIIZd9FMoAMi6Sz?=
 =?iso-8859-1?Q?c5gTGZfpaYREostD+lDI3hTpNj8gZ8nuQCRfu9YYDizrkKmcmb7VSI1uMf?=
 =?iso-8859-1?Q?WAieMxBmkOp5rDmha2hWMf6O1L9YCIKfkiQLTZ4IEcilqxaMOU4h48/ANZ?=
 =?iso-8859-1?Q?V8H7eZCFK4OQ7CkCR8Ax7+09ZF/X4iPurcptUoZE1BwrJWkkH84JoXZ7hb?=
 =?iso-8859-1?Q?V8d7m7hGnQ52vnnxVpU0J5jlaMlXdASN6SeDP8B2WoR/ZlRwY4OhM1vFuE?=
 =?iso-8859-1?Q?kd3V2KuDdnaulj+UuClPtkefcoq7sL46k15CrqqBFqTiVTn2vrmPFCqpDN?=
 =?iso-8859-1?Q?i+KKgyGJLvX3RagYO9dwajohBUgXBDiUWR5aRbsPW7MSINn1vuV7LSBq9z?=
 =?iso-8859-1?Q?aFMBuYTgC98+RydSOqb9TUZ6aVbvOrKqCX0PpJZWQyFLsKEQShQweUtl3Q?=
 =?iso-8859-1?Q?vO4lPrTkMJs7fJzpVA+zrwCwrTWx7tqoY21Q2aWaQ+/erwpl0eXEdFrtRv?=
 =?iso-8859-1?Q?XfKfr5UpwoqcbzIoqguzIjcq8+adc++ZlpFrkexL7mMhRDeoCew3pzMqx1?=
 =?iso-8859-1?Q?F4ppPI/XDt/ZD0Wr0Mhk0C4CNJe4V3+9tY?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78e44bb5-87db-4bc9-1e45-08db67eb67a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2023 06:41:35.6400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wR1rOVIMlCNmxchfc1rueg41WT0yLWGseXxHlGSlpZzpFkun2KqmwmZrmr8Q7yZ5jrGtodCGBHQ8m8OQV/n4cmEbFJ21bQxL3rAberiglRg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9415
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
>=20
>=20
> Hi Wolfram,
>=20
> > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > API
> >
> > Hi all,
> >
> > sorry for not being able to chime in earlier.
> >
> > > In Biju's particular use case, the i2c device responds to two
> > > addresses, which is the standard i2c ancillary use case.  However,
> > > what's special
> >
> > Not quite. ancillary is used when a *driver* needs to take care of two
> > addresses. We already have devices bundling two features into the same
> > chip. I recall at least RTC + EEPROM somewhere. And so far, we have
> > been handling this by creating two nodes in DT and have proper binding
> docs.
> > I think this is cleaner. First, you can see in DT already what the
> > compound device really consists of. In this case, which RTC and RTC
> > driver is exactly needed. Second, the code added here adds complexity
> > to the I2C core with another layer of inderection for dummy devices.
>=20
> FYI, please see [1] and [2]
>=20
> As per DT maintainers, most of PMICs are described with one node, even
> though RTC is on separate address. According to them the DT schema allows
> multiple addresses for children.
> But currently we lacks implementation for that. The enhancement to this
> API allows that.
>=20
>=20
> >
> > > As some resources are shared (knowledge about the clocks), splitting
> > > this in two distinct devices in DT (which is what Biju's initial
> > > patch series did) would need phandles to link both nodes together.
> > >
> > > Do you have a better idea how to represent this?
> >
> > Not sure if I understood this chip correctly, but maybe: The PMIC
> > driver exposes a clock gate which can be consumed by the RTC driver?

Let me give me some details of this PMIC chip.

PMIC device has 2 addresses "0x12:- PMIC" , "0x6f"- rtc.=20

It has XIN, XOUT, INT# pins and a register for firmware revisions.

Based on the system design,

If XIN and XOUT is connected to external crystal, Internal oscillator is en=
abled for RTC.
In this case we need to set the oscillator bit to "0".

If XIN is connected to external clock source, Internal oscillator is disabl=
ed for RTC.
In this case we need to set the oscillator bit to "1".

If XIN and XOUT not connected RTC operation not possible.

IRQ# (optional) functionality is shared between PMIC and RTC. (PMIC fault f=
or various bucks/LDOs/WDT/OTP/NVM or alarm condition).

The board, I have doesn't populate IRQ# pin. If needed some customers can p=
opulate IRQ# pin and use it for PMIC fault or RTC alarm.

Also, currently my board has PMIC rev a0 where oscillator bit is inverted a=
nd internal oscillator is enabled (ie: XIN and XOUT is connected to externa=
l crystal)

Cheers,
Biju




