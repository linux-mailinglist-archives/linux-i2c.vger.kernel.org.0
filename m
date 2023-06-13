Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6553372EC01
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jun 2023 21:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232576AbjFMTb5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jun 2023 15:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232224AbjFMTb4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Jun 2023 15:31:56 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4522AEA;
        Tue, 13 Jun 2023 12:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g7oOddZADmii0AAN2Yzun3EE03ShXtIyQ+Gm6rSV1jkLsVBp/71t0cUOtWVfWSu/qR2YqZhH4Y2f2B1v8iJ44omq7M7Y86TRbkF7eBibgn6HMikkALtKKizhc/+GIMBLcVNuxvDkghhE2FlhcrbBgX3M9MStSfmSq8mPs0erU2GT+DQN0+f1X/BvSDdor6E5PvYfbxCmjk9owPL08ueML74USVLp16qKYRcp/P4wC5A341ZOF/kfWEtDpfvBJpKJyz/VhW38lHMkmAH6EdV+GBaiLVCOr6cv41axY3sh3tsOqBfKvnGVSfLAfSPVCeEHoyA4z+IjhTOC/Nj6g2idrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VoPlEpsC0YDhCZRSbbrNb5kCWpCm4F4RXmsUOLtIA4=;
 b=YbB4Qk9j+ROXFIktYNkfbOhE3cozWlC/sPsyz6qZaiXCL4tdPpixY7Xprl4rSAp6MW/6H2W+ah/jTs39Kye4gfImgPLBqq9l0emRqJZum9j+OcwPz6dw0d9u/utG935zYncIMQt8F5vjivqNTvujXHH1xTSrHF6xlrGjneOxrMlss+z8fM9+sOZNM07fr7feFU9GSD3cPTj2bJfutmr3L+DRxBHbX/2rrb8NlYhqqlbzKw3KOelLOQoY1etmLAV4THJy7xVc5rE3v6vNttFB/RpfVXn0WB4Y0ZKBXWzWCMCUtDCha5ir1/1NXyUS+4IGMYYLzzoMSSdxCFCCMBDLCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VoPlEpsC0YDhCZRSbbrNb5kCWpCm4F4RXmsUOLtIA4=;
 b=ZWv4w5Arcz+b7keQi2o42JmJ3dZN+SE7o3xPQtf1aXqSkGgjGd1V6Cd+IWAbTKF+rylWoLa1wZm04jRotgg/OM0MOAwLpFli9uchrt//PhnKWm+vrv0AdiIn+0QfeH9MYh73Lk/aRFVFmwJGw11I1Wt9C7M+As/Xax7+MMPiKu8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB9607.jpnprd01.prod.outlook.com (2603:1096:604:1cc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Tue, 13 Jun
 2023 19:31:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.047; Tue, 13 Jun 2023
 19:31:46 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mark Brown <broonie@kernel.org>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAQNsAgAq9ooCAACGi4IABRk1QgABIHYCAAALdsIAAIbGAgAAAqmCABhKw0IAAMfIAgAADgjKAAAM7gIAAgX6AgACwEcCAAD30wIAAjmJQ
Date:   Tue, 13 Jun 2023 19:31:46 +0000
Message-ID: <OS0PR01MB59220D794AED55A6B795C3EF8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <OS0PR01MB5922AA27B212F610A5E816138650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608103929.GO5058@pendragon.ideasonboard.com>
 <OS0PR01MB592259E6A7ACED4A0548DD228650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230608125019.GD26742@pendragon.ideasonboard.com>
 <OS0PR01MB5922ECEABE4D6FC385D184008650A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592265BFDF18F860E1EB4CFE8654A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <ZIcRKl3PDy0+yZS9@ninjato>
 <CAMuHMdV_iwdP+K1us86OB4VtDDqA=P_vNeCP15kqRuXqcYr3hg@mail.gmail.com>
 <ZIcUEdctlgRsGxJ3@ninjato>
 <CAMuHMdVOkBeKOEW9PkWB3Tqwa6-rC3BQj=W9VAEgeZfgqvQmWQ@mail.gmail.com>
 <ZIeDcVcfxfcMx/BP@shikoro>
 <OS0PR01MB592220CCA081848A711D75328655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <OS0PR01MB592210CE54A9CF953980DFEE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592210CE54A9CF953980DFEE8655A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB9607:EE_
x-ms-office365-filtering-correlation-id: 5844b9aa-36c6-4132-9971-08db6c44d3b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +A5o/FXDxNxLW0u/BLGloCaV3ASeWHs3zhk3PUe+lyiavfZxnbAgbdSnu8Yeh77zrc20UU7tE/hFhnYGaNvcOgu0IJy2dfxyEDVtgJL8vEBoMLri9IiWM4m2k7P6LfIvwMWxPHbXSOUy3jGZ1upSvr4DSzgbWDn7Hn4QP50kznDgux4JMMmb6eSV1erZa7PBOW/7Ksfv+SmDnvVXINwQVHvw32B1SJan0V6/8k1NDbgDVTwW8QTyk56jtZ90yYQKIKrZrPVWmSg7uY7incPJj63jkzSrAUvKifrBeQK/hJa3AqKRdUSiAE2WMLc2vLLkYpD5Eyh28S1i8cyzbWOe+cL3nF3pA5PeI9NrlVpXJi6tdnuxXV3geLVQSYOqyG2Qh0xWCeqBCXqkLJJUuQekxYKxZh7JLG4w2koF0lM0ZXNlECAE9AUaHzTZR5W6TSHje3ZKFbomZjXJ70OJ9Xj8gC4FQBXV5Q7ErcCwRy3aYB5f/7NpuZBesXf16EYFFP6cT2jGMBsn8nsddxIaKG9ZA2wKtDJPpTcOcxUVjNeYDvIRMtYXff0DIW1IXt5xdLIhVyi8hnshPkWLuEcO8xKaVMt5DVQdEmeVKZYkEbdWN7y3QqPGwrP7bVnfh9+6ciMF
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(451199021)(2940100002)(186003)(6506007)(9686003)(41300700001)(38100700002)(316002)(7696005)(83380400001)(33656002)(478600001)(71200400001)(86362001)(54906003)(110136005)(2906002)(38070700005)(8676002)(52536014)(5660300002)(7416002)(8936002)(7406005)(122000001)(55016003)(66946007)(4326008)(66476007)(76116006)(66446008)(64756008)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?P3y9uu2nKLWnZ6fwleXxoUamtnbTz5S7kr5YgoBU2msEliXmOeAQ+uQ9tz?=
 =?iso-8859-1?Q?E/2nv3yR4FzSajEyxfpy4os4dqgscLgmEugji8FYpDG4nCJa92I8u3QSh9?=
 =?iso-8859-1?Q?XdJVNi2PaNpVaP6v291UG7CjrlUQi3VHV/H5pDUdZpaDWmwRrTKmOoXJ9W?=
 =?iso-8859-1?Q?RFkblhQFPthvk42DbnjF9LGclkIEmsCtCCL9wa8gmDirVMxfZQtirzSPNL?=
 =?iso-8859-1?Q?apyrtsi2fdtjWvuOYXNV+uDNT9Xa89BaIUwbeoXrB6r3dNG48ZCuyyY5YF?=
 =?iso-8859-1?Q?zWqYIIZ9v7BI7grKQo4N8BW9MatmV38OapzcqffSr43Es0iiTAV1oUtn/C?=
 =?iso-8859-1?Q?59NI4sF+Oh23MywKLovMMoMpXjzHA1JC3HhmnK3sHahnDNiSc7Pjv0Oi59?=
 =?iso-8859-1?Q?hx0Z5ansnR8svWGdCRTKTIOSBgXOjdGkXFZ8L4aT2plwnHMIj64YeUSO/2?=
 =?iso-8859-1?Q?rkaBYMOTRLvUMRamNoegWf4PTc4z8RLEQPoVq7kSbarRTg/D/pqRR7jHaX?=
 =?iso-8859-1?Q?rQL9riQLT1Ow2+kS2fru+IA+ZzPE8EarkVRJexSxNp3qoIBa9xGCRIeAEX?=
 =?iso-8859-1?Q?CrJifHt6UyjdXK/kjNYvIQ3WHg7deRLH08nwnInaoFNcQCgM99JiDjZG78?=
 =?iso-8859-1?Q?QJni7MdidL5RwskGstVa3bDxSMDlVXadMfeqZYGfUUrPPHuVHSbE4I6Fxj?=
 =?iso-8859-1?Q?jbx06iXBA2qD2LMlziqS76XwLtHfIIXEpfPjRf7BjVWv6ZflxyMAAMt/ct?=
 =?iso-8859-1?Q?PsFl6mAOsVOCBHiRrgCqyGHnfBQzqKQSX8XcDH46u3WgvFn6Tp6PYhEu+o?=
 =?iso-8859-1?Q?Ez0Si4+U6xwE3TuN0oQYNuCOd8QzX+oRk3fFtb7IbiuEYO9Oyb52i0gRTN?=
 =?iso-8859-1?Q?aRs+DnnEUULAUaqeV/pwZrVaJVY/rA34F53CBZybvPpDybG6gd5DvlcjyD?=
 =?iso-8859-1?Q?RccMRsqTih0Ob1FOp+NBbZf9wmo+DTOPoFhg1RC6BRUspfAxOz5LoLOo7Q?=
 =?iso-8859-1?Q?aLVEXow5eLCzg82Gp6cHtwdBVNiZYuW14K/32GDr0DCqQenhoDGs1U6m8d?=
 =?iso-8859-1?Q?9lGdq7RJQqod5pJ01blO/bRCLLnWCJ8Emz3cqev2RlJWhlBZaCN3F353Vr?=
 =?iso-8859-1?Q?/wIIFtrF2tsGhrSkIsD25QrtM9i/28BVpAZuLprwloMQBTQmBasPHvmBKa?=
 =?iso-8859-1?Q?FrQiUZN7CtcKxQIBcAaqDUbaZBKr4k8N/WEYLDqQGhp6//v71E1F8EvrhU?=
 =?iso-8859-1?Q?zGJ5XArWp/MyWexzjfLHpNpa4nWurNX6QbvQrf4q+cIId2BLnZkZwTBHqW?=
 =?iso-8859-1?Q?RmqG6x2b6XdZU5eswWGa3/lLo470NtdziXp9UZyyuDkQvyfh+AWkluJJ4X?=
 =?iso-8859-1?Q?4pE3VHIkN/cAsLeMzdAxhc1IybMB7b9J+GjLgZ7UgraOogOMOpUGXcTr6o?=
 =?iso-8859-1?Q?xBZ5UgLtfsEoiJAhnFUYqA51ch9joWUlRb9v8ZU2/VF9oAIKSDnJYDg4uJ?=
 =?iso-8859-1?Q?1/RuyW1Yq7xn+hbD7PgXHroelPNINdYzHwCRrzBOySNLBoztiLdzxl/3uG?=
 =?iso-8859-1?Q?vZGaQ+t1Jj8LIOWbhN9lFtNRMvkilHOap36GYuW7JXJyCbWkCU1BieLSkN?=
 =?iso-8859-1?Q?cFp834Vqq8T+s=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5844b9aa-36c6-4132-9971-08db6c44d3b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2023 19:31:46.7958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vjw9D8+CKYbPbtct/NPd8JUCrfMOJMwpxgoXanYONzMsdqWRFfWojNkDTyIP9mrfaZ56UGBOsNcRtoOPjG4Bno6jWOen/33L1FAyrfHOMns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9607
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

> Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
>=20
> Hi Wolfram,
>=20
> Thanks for the feedback.
>=20
> > Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > API
> >
> > Hi Wolfram,
> >
> > Thanks for the feedback.
> >
> > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > > API
> > >
> > > Hi everyone,
> > >
> > > > Perhaps we should first think through what an ancillary device
> > > > really is.  My understanding is that it is used to talk to
> > > > secondary addresses of a multi-address I2C slave device.
> > >
> > > As I mentioned somewhere before, this is not the case. Ancillary
> > > devices are when one *driver* handles more than one address.
> > > Everything else has been handled differently in the past (for  all
> > > the
> > uses I am aware of).
> > >
> > > Yet, I have another idea which is so simple that I wonder if it
> > > maybe has already been discussed so far?
> > >
> > > * have two regs in the bindings
> >
> > OK, it is inline with DT maintainers expectation as it is matching
> > with real hw as single device node having two regs.
> >
> > > * use the second reg with i2c_new_client_device to instantiate the
> > >   RTC sibling. 'struct i2c_board_info', which is one parameter, shoul=
d
> > >   have enough options to pass data, e.g it has a software_node.
> >
> > OK, I can see the below can be passed from PMIC to new client device.
> >
> > 	client->addr =3D info->addr;
> >
> > 	client->init_irq =3D info->irq;
> >
> > >
> > > Should work or did I miss something here?
> >
> > I guess it will work. We instantiate appropriate device based On PMIC
> > revision and slave address and IRQ resource passed through 'struct
> > i2c_board_info'
> >
> > Will check this and update you.
>=20
> info.irq =3D irq; -->Irq fine
> info.addr =3D addr; -->slave address fine
> size =3D strscpy(info.type, name, sizeof(info.type)); -->instantiation ba=
sed
> on PMIC version fine.
>=20
> 1) How do we share clk details on instantiated device to find is it
> connected to external crystal or external clock source? as we cannot pass
> of_node between PMIC and "i2c_board_info" as it results in pinctrl
> failure. info->platformdata and
> Client->dev.platformdata to retrieve this info??

Or=20

I2C instantiation based on actual oscillator bit value, ie, two i2c_device_=
id's
with one for setting oscillator bit and another for clearing oscillator bit

PMIC driver parses the clock details. Based on firmware version and clock,=
=20
It instantiates either i2c_device_id with setting oscillator bit or
clearing oscillator bit.

Cheers,
Biju
