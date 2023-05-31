Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BCAB717C04
	for <lists+linux-i2c@lfdr.de>; Wed, 31 May 2023 11:34:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235515AbjEaJeP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 May 2023 05:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234720AbjEaJeN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 31 May 2023 05:34:13 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFA14C0;
        Wed, 31 May 2023 02:34:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlVZrFvU8YE3xgO4k/O6Ysbb14YwFRe17jnTIm4G+lYmSTVrOkP7Hhr5QCch1Exkb9I21FzLTCR5PYZI19AlHguQHHysWGw2qqe/0p1Uz3VXHHtw2ny2sD19wiOwRL3RhafWsvFb1pcJkb0U6ctxH5CC3CluXtiOFDwPf7ho6jrMvpdS8OckEpojFfTMYFqnOSx6M5EXRLN3e28THEN8U90XNC9vegPs07EYxersPKaVryAnvo3hNK3J7MTDxl65+cuiz6CYJyGfB2z+zXK5eJSY8PR4UPDggmQRI83rtedr8m2w5e+5PCLyoh1UhFZ1gluSucpygmEoVp+s1JulGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYOAyqb7xWb82o8mgx7+aZ1deIGtfGOBEJ1RK1B97iU=;
 b=HhHGPX+uDOjhWo01QUuaIEBfMxCN97J96eDASk4b48uLqxx/PpaGmt2ha46EiIkfThXDyqdrLiFpG/g2csYw1U6motCFuo/JKCeXFfLhYPCYT/oYgRHPDrlIM7jgAn9VekxIwf6mPacumSBUGYA0BZZt4HRtF8L97x6SHvoo/NEGq57PAKmIh6pSk4SsLs8BCsez5K+H9zMZYl5Lyb9P7WxNjpd8CV9gPusglUAFEA/oQnH8qf7rCLTZqcIuqlFDjHHnjhW3Qy3/bbEgFVAer3gusMjiFhIkrT/ZtaA21ge7N1kHZaJ2M8puCBIGmx6jj+P8xyn5LECwacC7F5QkNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYOAyqb7xWb82o8mgx7+aZ1deIGtfGOBEJ1RK1B97iU=;
 b=r712ChQlQEOw/NOG5YVxhWp0aSbX4YswpDCvgeNMr+1V/cfCkataYLhoERbFlx/+SfEec6OjssyQUZr01i6+ZC43WzdnewOU3Wja3qyvtN8TsKYsJ2jEtv3/mR9gyFS3MnK4T5THuOJmndE5h3gc6xfMXR7Vu/PBg5LjbwNgvGg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS0PR01MB5425.jpnprd01.prod.outlook.com (2603:1096:604:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Wed, 31 May
 2023 09:34:06 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Wed, 31 May 2023
 09:34:06 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, Wolfram Sang <wsa@kernel.org>,
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
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Topic: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6CAAyijgIAAApUw
Date:   Wed, 31 May 2023 09:34:06 +0000
Message-ID: <OS0PR01MB59226E87241A61A2CB255DEE86489@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
 <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <20230531085941.GA27043@pendragon.ideasonboard.com>
In-Reply-To: <20230531085941.GA27043@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS0PR01MB5425:EE_
x-ms-office365-filtering-correlation-id: 99477527-c852-483b-04a7-08db61ba2de6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xF/ApFH8ov+mXKBKjiRjId+W4rN1rfpWzzh8J6YuGDvgVdUFL7CNHZGgJAwGT0Hm7OTDa5Ns+A91rE3DHWZW4RvCpm13eYdC2M9xs8gH4rI/mpuMTEWgemkUrWL0P8v4lz5tKpgN1kxtHsC0WjaNwDB5RgjR6AJL1tfrDS9KI9fa5+EqItpcHmybE6BohuU8w/b9tnEkDUb4x40dfJlFEq6hJ5C6OrMhqiR/DHFaQlMqliuoDvmtIYKahYIhOhRaXO15GFcUYJ6uFq+9IHLY6hakLR1rnWg4sTz9Roor+Vm4pYgFZ5jk9N9UbT8cmWO6yBFmn2t6yBJwlDhbLDAoF5mVJDlxrLaLpyU8uOfzpxBOBflDIC1mWG+6sXQ66jG0AwqjoJbWtxmc2cwwdI3bkfvOI1wfaYnekRfFEoqOFnKttvkPj9E8+UQ8dAzBoIRON5yaiAlG0nbBvx0Ipyq8wjy4XHJSz4wh0qSW0LjF5ptMG0tRu062cSLx9ekbGcPic7Qj6qYpvlOv/AvagxNchbkvOKAgYjMCTMSpailW6Rj2iV90Wzve9yO+j7uxkqmFTd00UMbmO+JIlEeoFjof8/Aq4O+zw1ybG51iq6Hnz/ZWylmxuAUSdWJJHEwsfypf
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(366004)(39860400002)(346002)(396003)(451199021)(83380400001)(2906002)(30864003)(7696005)(66476007)(54906003)(110136005)(52536014)(7416002)(86362001)(76116006)(66946007)(66556008)(66446008)(8676002)(8936002)(38070700005)(33656002)(41300700001)(6506007)(9686003)(26005)(316002)(5660300002)(186003)(122000001)(64756008)(4326008)(55016003)(38100700002)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?urVlx7qpNRXphE/ykIZPhBTY7zbFmGJnhT3Ax+PGc96okrJcgoUimuKjC3?=
 =?iso-8859-1?Q?LvDvBkmxc0dJS/NJeNNRUU+8edzLeO6KCXI/VavWvsvZM85XUt1SKn/00n?=
 =?iso-8859-1?Q?JINb4YWDCqAxl4fev1azez2VxsISMMapFAyWIbx2BCMYe4/XW4nsLpxDhR?=
 =?iso-8859-1?Q?alIcNIJm2xFi0ArS9kbz6dkCUbwWxO2qwJ0sHoFukZyKDOj8stBN8LIFE7?=
 =?iso-8859-1?Q?DS2hg28vOEuw5E0zBQJV2GW51spncWySFhxMJWQfjGjwUAXmacfjMJ+Bv1?=
 =?iso-8859-1?Q?FO0/hXDhesNDAiY45qJUSAd9NbTxPC83rnk2Zak9BL3aNqMc54/7VKxZxn?=
 =?iso-8859-1?Q?KMX1GODKODmvV3IUkYuC2iOuZOm9n0mtuFr7d78MQzyNmVvQzVYvxiXk76?=
 =?iso-8859-1?Q?jDwwYy+FJFcaGDNqlrG3wDt2Ql4iFqOBNw3a5anPjOdsbvFZFhzL9HNhqm?=
 =?iso-8859-1?Q?d+6s9vuy/Psv11S0B3qnAdMrQai9Vt+PQaJ+GtJPaBOvXSRWtJfj3DOo+S?=
 =?iso-8859-1?Q?xXhclD40ENj5TK2B/ekRM5hcsmWu+ARZ938v9F2vEpyaEK7QDYuPU+Vcp2?=
 =?iso-8859-1?Q?3nETZH8dLogTRJ6tT9vABH32+1rvBXfZNVEHbPPS07ocbuCVvrDc+NZ5nE?=
 =?iso-8859-1?Q?7rRaOU7VFTTZPpgCxYP4Qg8hVWG4CTLuwZkdlKBmquTCPkvII8NvNAufAh?=
 =?iso-8859-1?Q?0FoQ297RFC/6jgKUIkMUCbWBxbF9XGnjXZL7N0120HQoJoUaG5/tOjqIvN?=
 =?iso-8859-1?Q?4eZS62aXoVovMnF3fPf3WVYUxZJBNsaLgaebECNoYYMZnT1faoTePXIbzI?=
 =?iso-8859-1?Q?Sjrs0Unc/KipIYITljOXy/Q2ejTu+cDdv86HvVOSNBApYYMO+qMLSktluq?=
 =?iso-8859-1?Q?rr4IeeHqqf2PAX1DKBy+NxOpgXXj5Wex/YPiuh35jFAO0/mArjcy4SaGcu?=
 =?iso-8859-1?Q?NX28YUlS8ZE/oT8y/cRKP30GX2LA6pY//pJkLm7mplF9jAs+9J/r+1A/Ox?=
 =?iso-8859-1?Q?iwyP0fEiog3H68+A4JncI8g8tdUlCs+i4ibHJ6kqeiNGcIMRvGf2NRHrL3?=
 =?iso-8859-1?Q?ZZf5vi0hfGffGo8tRz/a6ZpwoQw35jfTX7x5+ngcUwK0ZOMYbFLrE8f36c?=
 =?iso-8859-1?Q?AdOJBd8pP4Urkyc5xH9Ajiy/rIN+zRMOKKBK30DWX92gVcOhqSgLBuhkd7?=
 =?iso-8859-1?Q?wJ94bVSYKZwjDklm15JZY7FXAezgG15ZfK4LJSzfeqq4CvJdKvwoLp5N1n?=
 =?iso-8859-1?Q?RUwBwZeXQO1aNJ3mV6erquKfpDcYaKuFK4aQvGvfyU/nksWrt/9Kdg68jF?=
 =?iso-8859-1?Q?Ig0hg18UMH3pnQQeR68UtWtCBWI6YdS67t5qQKqsZmjRHwB7B8B86DqTl9?=
 =?iso-8859-1?Q?SjSJbFxeMZMmPsfeXLYReA4AfVSxdulmkHwI4zTPqpjOHzmbOibIPb434g?=
 =?iso-8859-1?Q?QY0Skhcc4bHVnY/rDgSB0rz8cAQeCLW7BLhYIc98pL7isJ/8pA8jUdnp5W?=
 =?iso-8859-1?Q?eAEkEaXaOIlT7VPjF5BJUQlxsFi61zxtLKFW2wch8KRO48pFXxf4+aOFA7?=
 =?iso-8859-1?Q?pshb7V8matdkiujIF57lGV15WrY06apfgJ8ZsGP2ajBVAZkyl7AWhfbpOu?=
 =?iso-8859-1?Q?1zKGUBvsM//e4/SFb5biOoQGpp6bMnhADF?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99477527-c852-483b-04a7-08db61ba2de6
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 09:34:06.4751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RL1n7IxEXugAQXsLuBAsnvCIxL5Aii4Ty77jXLTKdSII3XVgU4bnJDaMzxbXagn/FuanB6Lh4xvPEz1MEKF5TAMq5ZKtYdnC3X4sDhbhNx4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5425
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laurent,

Thanks for the feedback.

> Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device API
>=20
> Hi Biju,
>=20
> On Mon, May 29, 2023 at 09:00:43AM +0000, Biju Das wrote:
> > > Subject: Re: [PATCH v5 01/11] i2c: Enhance i2c_new_ancillary_device
> > > API On Mon, May 22, 2023 at 11:18:39AM +0100, Biju Das wrote:
> > > > Renesas PMIC RAA215300 exposes two separate i2c devices, one for
> > > > the main device and another for rtc device.
> > > >
> > > > Enhance i2c_new_ancillary_device() to instantiate a real device.
> > >
> > > Doesn't it already instantiate a real device ?
> >
> And that function calls i2c_new_client_device(), which allocates a
> struct i2c_client that embeds a struct device, and registers that device
> with the kernel device core. How is that different, in terms of
> instantiating a "real device", from what this patch does ?

There is a difference, right? it instantiates new "i2c dummy client" driver=
 and=20
a "real i2c client device" driver like rtc device client(rtc-isl2108)??

>=20
> > > > (eg: Instantiate rtc device from PMIC driver)
> > > >
> > > > Added helper function __i2c_new_dummy_device to share the code
> > > > between i2c_new_dummy_device and i2c_new_ancillary_device().
> > > >
> > > > Also added helper function __i2c_new_client_device() to pass
> > > > parent dev parameter, so that the ancillary device can assign its
> > > > parent during creation.
> > > >
> > > > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > ---
> > > > v4->v5:
> > > >  * Replaced parameter dev->parent in __i2c_new_client_device() and
> > > >    __i2c_new_dummy_device().
> > > >  * Improved error message in __i2c_new_dummy_device() by printing
> device name.
> > > >  * Updated comment for ancillary's device parent
> > > >  * Dropped aux_device_name check in i2c_new_ancillary_device().
> > > > v3->v4:
> > > >  * Dropped Rb tag from Geert as there are new changes.
> > > >  * Introduced __i2c_new_dummy_device() to share the code between
> > > >    i2c_new_dummy_device and i2c_new_ancillary_device().
> > > >  * Introduced __i2c_new_client_device() to pass parent dev
> > > >    parameter, so that the ancillary device can assign its parent
> during
> > > >    creation.
> > > > v3:
> > > >  * New patch
> > > >
> > > > Ref:
> > > >
> > > > ---
> > > >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  6 +-
> > > >  drivers/i2c/i2c-core-base.c                  | 92 +++++++++++++--
> ----
> > > -
> > > >  drivers/media/i2c/adv748x/adv748x-core.c     |  2 +-
> > > >  drivers/media/i2c/adv7604.c                  |  3 +-
> > > >  include/linux/i2c.h                          |  3 +-
> > > >  5 files changed, 69 insertions(+), 37 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > > b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > > index ddceafa7b637..86306b010a0a 100644
> > > > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > > > @@ -1072,7 +1072,7 @@ static int adv7511_init_cec_regmap(struct
> adv7511 *adv)
> > > >  	int ret;
> > > >
> > > >  	adv->i2c_cec =3D i2c_new_ancillary_device(adv->i2c_main,
> "cec",
> > > > -						ADV7511_CEC_I2C_ADDR_DEFAULT);
> > > > +				    ADV7511_CEC_I2C_ADDR_DEFAULT, NULL);
> > > >  	if (IS_ERR(adv->i2c_cec))
> > > >  		return PTR_ERR(adv->i2c_cec);
> > > >
> > > > @@ -1261,7 +1261,7 @@ static int adv7511_probe(struct i2c_client
> *i2c)
> > > >  	adv7511_packet_disable(adv7511, 0xffff);
> > > >
> > > >  	adv7511->i2c_edid =3D i2c_new_ancillary_device(i2c, "edid",
> > > > -					ADV7511_EDID_I2C_ADDR_DEFAULT);
> > > > +					ADV7511_EDID_I2C_ADDR_DEFAULT,
> NULL);
> > > >  	if (IS_ERR(adv7511->i2c_edid)) {
> > > >  		ret =3D PTR_ERR(adv7511->i2c_edid);
> > > >  		goto uninit_regulators;
> > > > @@ -1271,7 +1271,7 @@ static int adv7511_probe(struct i2c_client
> *i2c)
> > > >  		     adv7511->i2c_edid->addr << 1);
> > > >
> > > >  	adv7511->i2c_packet =3D i2c_new_ancillary_device(i2c,
> "packet",
> > > > -					ADV7511_PACKET_I2C_ADDR_DEFAULT);
> > > > +					ADV7511_PACKET_I2C_ADDR_DEFAULT,
> NULL);
> > > >  	if (IS_ERR(adv7511->i2c_packet)) {
> > > >  		ret =3D PTR_ERR(adv7511->i2c_packet);
> > > >  		goto err_i2c_unregister_edid;
> > > > diff --git a/drivers/i2c/i2c-core-base.c
> > > > b/drivers/i2c/i2c-core-base.c index ae3af738b03f..3442aa80290f
> > > > 100644
> > > > --- a/drivers/i2c/i2c-core-base.cvvccc
> > > > +++ b/drivers/i2c/i2c-core-base.cckvlrgnulkj
> > > > @@ -893,24 +893,10 @@ int i2c_dev_irq_from_resources(const struct
> resource *resources,
> > > >  	return 0;
> > > >  }
> > > >
> > > > -/**
> > > > - * i2c_new_client_device - instantiate an i2c device
> > > > - * @adap: the adapter managing the device
> > > > - * @info: describes one I2C device; bus_num is ignored
> > > > - * Context: can sleep
> > > > - *
> > > > - * Create an i2c device. Binding is handled through driver model
> > > > - * probe()/remove() methods.  A driver may be bound to this
> > > > device when we
> > > > - * return from this function, or any later moment (e.g. maybe
> > > > hotplugging will
> > > > - * load the driver module).  This call is not appropriate for use
> > > > by mainboard
> > > > - * initialization logic, which usually runs during an
> > > > arch_initcall() long
> > > > - * before any i2c_adapter could exist.
> > > > - *
> > > > - * This returns the new i2c client, which may be saved for later
> > > > use with
> > > > - * i2c_unregister_device(); or an ERR_PTR to describe the error.
> > > > - */
> > > > -struct i2c_client *
> > > > -i2c_new_client_device(struct i2c_adapter *adap, struct
> > > > i2c_board_info const *info)
> > > > +static struct i2c_client *
> > > > +__i2c_new_client_device(struct i2c_adapter *adap,
> > > > +			struct i2c_board_info const *info,
> > > > +			struct device *parent)
> > > >  {
> > > >  	struct i2c_client	*client;
> > > >  	int			status;
> > > > @@ -944,7 +930,7 @@ i2c_new_client_device(struct i2c_adapter
> *adap, struct i2c_board_info const *inf
> > > >  	if (status)
> > > >  		goto out_err;
> > > >
> > > > -	client->dev.parent =3D &client->adapter->dev;
> > > > +	client->dev.parent =3D parent ? parent : &client->adapter-
> >dev;
> > > >  	client->dev.bus =3D &i2c_bus_type;
> > > >  	client->dev.type =3D &i2c_client_type;
> > > >  	client->dev.of_node =3D of_node_get(info->of_node); @@ -984,6
> > > > +970,28 @@ i2c_new_client_device(struct i2c_adapter *adap, struct
> i2c_board_info const *inf
> > > >  	kfree(client);
> > > >  	return ERR_PTR(status);
> > > >  }
> > > > +
> > > > +/**
> > > > + * i2c_new_client_device - instantiate an i2c device
> > > > + * @adap: the adapter managing the device
> > > > + * @info: describes one I2C device; bus_num is ignored
> > > > + * Context: can sleep
> > > > + *
> > > > + * Create an i2c device. Binding is handled through driver model
> > > > + * probe()/remove() methods.  A driver may be bound to this
> > > > +device when we
> > > > + * return from this function, or any later moment (e.g. maybe
> > > > +hotplugging will
> > > > + * load the driver module).  This call is not appropriate for use
> > > > +by mainboard
> > > > + * initialization logic, which usually runs during an
> > > > +arch_initcall() long
> > > > + * before any i2c_adapter could exist.
> > > > + *
> > > > + * This returns the new i2c client, which may be saved for later
> > > > +use with
> > > > + * i2c_unregister_device(); or an ERR_PTR to describe the error.
> > > > + */
> > > > +struct i2c_client *
> > > > +i2c_new_client_device(struct i2c_adapter *adap, struct
> > > > +i2c_board_info const *info) {
> > > > +	return __i2c_new_client_device(adap, info, NULL); }
> > > >  EXPORT_SYMBOL_GPL(i2c_new_client_device);
> > > >
> > > >  /**
> > > > @@ -1054,6 +1062,26 @@ static struct i2c_driver dummy_driver =3D {
> > > >  	.id_table	=3D dummy_id,
> > > >  };
> > > >
> > > > +static struct i2c_client *__i2c_new_dummy_device(struct
> i2c_adapter *adapter,
> > > > +						 u16 address, const char
> *name,
> > > > +						 struct device *parent)
> > > > +{
> > > > +	struct i2c_board_info info =3D {
> > > > +		I2C_BOARD_INFO("dummy", address),
> > > > +	};
> > > > +
> > > > +	if (name) {
> > > > +		ssize_t ret =3D strscpy(info.type, name,
> sizeof(info.type));
> > > > +
> > > > +		if (ret < 0)
> > > > +			return ERR_PTR(dev_err_probe(&adapter->dev, ret,
> > > > +						     "Invalid device name:
> %s\n",
> > > > +						     name));
> > > > +	}
> > > > +
> > > > +	return __i2c_new_client_device(adapter, &info, parent); }
> > > > +
> > > >  /**
> > > >   * i2c_new_dummy_device - return a new i2c device bound to a
> dummy driver
> > > >   * @adapter: the adapter managing the device @@ -1074,11 +1102,7
> > > > @@ static struct i2c_driver dummy_driver =3D {
> > > >   */
> > > >  struct i2c_client *i2c_new_dummy_device(struct i2c_adapter
> > > > *adapter,
> > > > u16 address)  {
> > > > -	struct i2c_board_info info =3D {
> > > > -		I2C_BOARD_INFO("dummy", address),
> > > > -	};
> > > > -
> > > > -	return i2c_new_client_device(adapter, &info);
> > > > +	return __i2c_new_dummy_device(adapter, address, NULL, NULL);
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(i2c_new_dummy_device);
> > > >
> > > > @@ -1122,15 +1146,19 @@
> EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
> > > >   * @client: Handle to the primary client
> > > >   * @name: Handle to specify which secondary address to get
> > > >   * @default_addr: Used as a fallback if no secondary address was
> > > > specified
> > > > + * @aux_device_name: Ancillary device name
> > > >   * Context: can sleep
> > > >   *
> > > >   * I2C clients can be composed of multiple I2C slaves bound
> together in a single
> > > >   * component. The I2C client driver then binds to the master I2C
> > > > slave and needs
> > > > - * to create I2C dummy clients to communicate with all the other
> slaves.
> > > > + * to create I2C ancillary clients to communicate with all the
> other slaves.
> > > >   *
> > > > - * This function creates and returns an I2C dummy client whose
> > > > I2C address is
> > > > - * retrieved from the platform firmware based on the given slave
> > > > name. If no
> > > > - * address is specified by the firmware default_addr is used.
> > > > + * This function creates and returns an I2C ancillary client
> > > > + whose I2C address
> > > > + * is retrieved from the platform firmware based on the given
> > > > + slave name. if
> > > > + * aux_device_name is specified by the firmware,
> > >
> > > Unless I'm missing something, aux_device_name isn't specified by the
> > > firmware, it's a function parameter.
> >
> > It is specified in the platform firmware(device tree firmware).
>=20
> What I meant, in the context of the documentation here, is that the
> address is retrieved from the platform firmware by the
> i2c_new_ancillary_device() function, not passed as a parameter, while
> the name is passed as a parameter. It's not relevant, for the
> documentation of this function, where the caller gets the name from.

Are you ok with these wordings?

* This function creates and returns an I2C ancillary client whose I2C addre=
ss
* is retrieved from the platform firmware based on the given slave name. If
* aux_device_name is not NULL, the ancillary's device parent
* will be set to the primary device otherwise it will be set to I2C adapter=
.=20
* If no address is specified by the firmware default_addr is used.

>=20
> > > > the ancillary's device parent
> > > > + * will be set to the primary device.
> > >
> > > This doesn't seem to match the implementation. With this patch the
> > > ancillary device's parent is always the primary device. Are you sure
> > > this won't cause any regression ?
> >
> > There is no regression as existing users only instantiate dummy
> device.
>=20
> Sorry, I don't follow you here. Existing callers of
> i2c_new_ancillary_device() today get an i2c_client device whose parent
> is the I2C adapter. With this patch they will get an i2c_client device
> whose parent is the main i2c_client. That's a change in behaviour, which
> could cause all sorts of issues.

Please see the patch snippet below, there is no regression.

client->dev.parent =3D parent ? parent : &client->adapter->dev;

>=20
> > > And why do you need this ?
> >
> > As per Krzysztof [2],
> >
> > The DT schema allows multiple addresses for children. But we lack
> > implementation of parent child relationship, As parent owns the
> resources.
> > Child device needs to parse parent node to get some resource like
> > clocks.
> >
> > [2]
>=20
> The I2C ancillary clients are not meant to be handled by separate
> drivers.=20

Is it a Linux rule??

>You're supposed to have one device node in DT, which causes the
> I2C core to instantiate a main i2c_client, and bind it to one driver.
> That driver then uses i2c_new_ancillary_device() to create other
> i2c_client instances for the secondary I2C addresses. Those i2c_client
> instances are not bound to a separate driver,=20

Wolfram/Geert, Is it limitation from i2c?

Cheers,
Biju

> so there should be no code
> that needs to look at the parent for resources.
>=20
> > > > If no address is specified by the firmware
> > > > + * default_addr is used. If no aux_device_name is specified by
> > > > + the firmware, it
> > >
> > > Same here regarding firmware.
> > >
> > > > + * will create an I2C dummy client.
> > > >   *
> > > >   * On DT-based platforms the address is retrieved from the "reg"
> property entry
> > > >   * cell whose "reg-names" value matches the slave name.
> > > > @@ -1139,8 +1167,9 @@
> EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
> > > >   * i2c_unregister_device(); or an ERR_PTR to describe the error.
> > > >   */
> > > >  struct i2c_client *i2c_new_ancillary_device(struct i2c_client
> *client,
> > > > -						const char *name,
> > > > -						u16 default_addr)
> > > > +					    const char *name,
> > > > +					    u16 default_addr,
> > > > +					    const char *aux_device_name)
> > > >  {
> > > >  	struct device_node *np =3D client->dev.of_node;
> > > >  	u32 addr =3D default_addr;
> > > > @@ -1153,7 +1182,8 @@ struct i2c_client
> *i2c_new_ancillary_device(struct i2c_client *client,
> > > >  	}
> > > >
> > > >  	dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n",
> name, addr);
> > > > -	return i2c_new_dummy_device(client->adapter, addr);
> > > > +	return __i2c_new_dummy_device(client->adapter, addr,
> aux_device_name,
> > > > +				      &client->dev);
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
> > > >
> > > > diff --git a/drivers/media/i2c/adv748x/adv748x-core.c
> > > > b/drivers/media/i2c/adv748x/adv748x-core.c
> > > > index 4498d78a2357..5bdf7b0c6bf3 100644
> > > > --- a/drivers/media/i2c/adv748x/adv748x-core.c
> > > > +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> > > > @@ -186,7 +186,7 @@ static int adv748x_initialise_clients(struct
> > > adv748x_state *state)
> > > >  		state->i2c_clients[i] =3D i2c_new_ancillary_device(
> > > >  				state->client,
> > > >  				adv748x_default_addresses[i].name,
> > > > -
> 	adv748x_default_addresses[i].default_addr);
> > > > +				adv748x_default_addresses[i].default_addr,
> > > NULL);
> > > >
> > > >  		if (IS_ERR(state->i2c_clients[i])) {
> > > >  			adv_err(state, "failed to create i2c client
> %u\n", i);
> > > diff --git
> > > > a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c index
> > > > 3d0898c4175e..63fa44c9d27c 100644
> > > > --- a/drivers/media/i2c/adv7604.c
> > > > +++ b/drivers/media/i2c/adv7604.c
> > > > @@ -2935,7 +2935,8 @@ static struct i2c_client
> > > *adv76xx_dummy_client(struct v4l2_subdev *sd,
> > > >  	else
> > > >  		new_client =3D i2c_new_ancillary_device(client,
> > > >  				adv76xx_default_addresses[page].name,
> > > > -
> 	adv76xx_default_addresses[page].default_addr);
> > > > +
> 	adv76xx_default_addresses[page].default_addr,
> > > > +				NULL);
> > > >
> > > >  	if (!IS_ERR(new_client))
> > > >  		io_write(sd, io_reg, new_client->addr << 1); diff --
> git
> > > > a/include/linux/i2c.h b/include/linux/i2c.h index
> > > > 13a1ce38cb0c..0ce344724209 100644
> > > > --- a/include/linux/i2c.h
> > > > +++ b/include/linux/i2c.h
> > > > @@ -489,7 +489,8 @@ devm_i2c_new_dummy_device(struct device *dev,
> > > > struct i2c_adapter *adap, u16 addr  struct i2c_client *
> > > > i2c_new_ancillary_device(struct i2c_client *client,
> > > >  			 const char *name,
> > > > -			 u16 default_addr);
> > > > +			 u16 default_addr,
> > > > +			 const char *aux_device_name);
> > > >
> > > >  void i2c_unregister_device(struct i2c_client *client);
> > > >
>=20
> --
> Regards,
>=20
> Laurent Pinchart
