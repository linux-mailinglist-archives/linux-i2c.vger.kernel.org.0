Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7BD87146C8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 May 2023 11:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjE2JBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 May 2023 05:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjE2JA5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 May 2023 05:00:57 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2100.outbound.protection.outlook.com [40.107.114.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3E0591;
        Mon, 29 May 2023 02:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SsMZv14zCLg+peClmbsstK1Hsj0XFX7UtNcQjlOdPV8VgTMWlWi4K+HAH89Xaq+fsx+IMv5qOAWI1XY1pZv9az05pqtjte/gGWxP8aMdnPLQfbDWyM6ROcHlGObVyGt6CvmnUshOKtqCQvp42Zte0R306Klqv8Olvr0r9oz3M6WUjpxL5Xi1gOymssG2QHqCkGCZWlGeBOfe9gG1JeDM4lJk884byLb36XG4jYaQ98WgugdbvMBJ0Omlp7Q6lreLgKMVKOfPmShqIMfzro5A+UToX/qvzfTjEte5+nkcNylL65L//hKeE6MrLY/mewfldjtkZHdXVijWOhRqdWTCQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xw7FHspnVq+8w/sQjDhakYBGvLVCpqhMutp2xktIZ+4=;
 b=gZKIZP3j1D1Z10DWB60sAGwYs9QVjAwn84Yxc3ZgdVzS90gmBcSHJCMmlMbL+81yNU2pEMC0i5qdaoM8/YExeCNBk99NzMJHqR+Y7lRhfy7B8vBrJ3stBD4LXWyOIUt5mS109ZXq7nxSQOkcNjkYH0jT2A5GAcd0JSpLhdnY7E2hqolTBpSR3VP6Ar1MayBACfr3XBjdtxJTZCBnHBZsYTK9+xqTkR1zX5TH94tcLyeCezxxWQoGVHrrj/r9ghJ66tSuGp/RzOrg0pFc3VGXu06LfuWt/EuBY+D5RcjXiqsKxHwMHgUY+jM6zISXauFtxgNGG+JZC9aD1hZioEnnuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xw7FHspnVq+8w/sQjDhakYBGvLVCpqhMutp2xktIZ+4=;
 b=bkSMHMTAkNd3ytBheu8WhUs6gy05jcO7T6fq/kTUIfdtCTja38kyEXHFj8HQwtZJwH0YzLq5R6uFvvJzc4Mqccj3cylbXRVx7UxzWs5878wFUTRHX1dtiDdS43LtAxpAZeTThrWr3OxnGKU7jnTsly3IHbBdtvGpok/7idiOrcA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11280.jpnprd01.prod.outlook.com (2603:1096:400:3d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 09:00:43 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6433.020; Mon, 29 May 2023
 09:00:43 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Andrzej Hajda <andrzej.hajda@intel.com>,
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
Thread-Index: AQHZjJbXGsyu+Gf1qUyolpKmZgFmTa9w75gAgAALD6A=
Date:   Mon, 29 May 2023 09:00:43 +0000
Message-ID: <OS0PR01MB592283E55078298EEA30C6B9864A9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-2-biju.das.jz@bp.renesas.com>
 <20230529080552.GJ25984@pendragon.ideasonboard.com>
In-Reply-To: <20230529080552.GJ25984@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11280:EE_
x-ms-office365-filtering-correlation-id: 3013e79b-0eb9-485f-e5fd-08db60232f51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4e2Gy1n6XvxLDY018rwUzHT7Ud1Q6ncXo8J26hjkB0QANt5o/qqwns3wuIPHVoy7WfPUCunSh9oQd7ybMn/OOcNRDejG7f66F8Rb+Hi6dTSAL8+he3z4pkbjs+YlQZhcDkmePJxObB56VKFawatd+lv88f22H9+lGBQrY5dZS+FzK8tCtIVf/T2wnNyrGifVjoPmoeiKuN4UuGt+GN3EgXu162bpsuenqbBAqzRzCDBDTFzS8xtjTIgorXbEprwF0cVnsgmcXf2Pvi6a6PLUfHmgiDN8RMNowxfKn56c9kDzbsWJ6gX7xjUUjA+9wSu0q+BysMjEYtsaeoVektxHL+ixTq/zxlyyliAjjW2c0MCZJ6OaidjxNgV9rM02Jl1aeqRoGtIq3qxWp99t5+M+5BBtJPLKoaFKrVErzp6Y5lDblq9jbwn/W9aLAgKxGgeTpcxnzrWElnvqrrW1xdRHpH8uzWTSAa3DK7pOyQRvPw7xX2hG0CDNUe9w90KAX7kpjedqnFIWIWLb20DPhAUaeW7Nucl+Ayib/eEJlpY/6eGAlauQSrlW/ep0ddBQNzMVhqiGwBp1JZ44HVeBHdI8lMduptRutQFwr2JNvGCDoN0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199021)(7696005)(86362001)(41300700001)(38070700005)(966005)(55016003)(4326008)(71200400001)(316002)(33656002)(45080400002)(66556008)(66446008)(66476007)(64756008)(66946007)(76116006)(7416002)(52536014)(5660300002)(186003)(2906002)(30864003)(9686003)(6506007)(26005)(83380400001)(38100700002)(478600001)(54906003)(110136005)(8676002)(122000001)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?UrrwaCmLtbqtbzTWLckeXFocAknDyGdf8cFXFoikeFIL/vGoODOFgL/ASi?=
 =?iso-8859-1?Q?761N1ofuR9AVAJ6trfMuofKDhbQynO685gGqkGhzLHtEg5W0zfzCJOBaRN?=
 =?iso-8859-1?Q?REsAv4rZp+J4TrmI3JEpaLCHFlHbS1rt49h0NDRd+e6q2gdRgiWYsXFibN?=
 =?iso-8859-1?Q?lh/EzWLPBT0VN8G8KHXMoMHrVagP2oRR9aIBK3hQNPmgKR8nBRlmsXnwUh?=
 =?iso-8859-1?Q?5NrjZQnzlXkaVSjFveNrX/gUfleCSy5lplpsOSBnTlsdBaIY3TJTK8kWSO?=
 =?iso-8859-1?Q?l7vPMh2fzjNT7dvi1fH6FlILaEuku365Z6NwqS6MH+CeJc04wzUEJRZNCd?=
 =?iso-8859-1?Q?aYCjfZ24k7BWFY4aqzYbX9beagHZGrVxSUcCtcS28evOhIA7ZB9aM80d1K?=
 =?iso-8859-1?Q?VMCgCfDDnpi+k+yuHetJDzdmvkrO3I5DYlZQTcE+LIUjvNg79A6q1D9WXS?=
 =?iso-8859-1?Q?r2T9d+F0cnyw8MpY2ZWiW+pOukzQkgrhTWdSmxKgQ4S/ArMVauwgxwDxbF?=
 =?iso-8859-1?Q?VspWWdTXU80E7krU9VT6K4XKkKGRLCNsBPwL2FbOc9PtJvPjihrCvYIniB?=
 =?iso-8859-1?Q?pUSqkm9TXazJ8uDNjhdTeHLtQzhs4+yrWgmiBPjqgJWWbmeMYHHXaGqZUm?=
 =?iso-8859-1?Q?S7wHtFQp+G7690pf+d1bmCdNF/aLr88XOFnoDQHSepHSPV/tgH+w51MhtZ?=
 =?iso-8859-1?Q?MqndpDceLapYERLLp6c5s1Arvn2Seg63VwXjEIFz5CSlR/UtzEBlW+dAa/?=
 =?iso-8859-1?Q?wGl9iRMZG7Y25U7QY0eGMwrsUsGVK/T65FKlOCvaPWc5qj4izw4uNBaDin?=
 =?iso-8859-1?Q?YgwMuYA97m9ydvvManBaerHRUx3bj2VgomxVU/lvF54GzSMuvkEjcLoA44?=
 =?iso-8859-1?Q?xoV80S846FeYz0/7DD0aun2P9wP8UaLD5AagmDjtyU/2n+VVT+mdd32JnG?=
 =?iso-8859-1?Q?UaG4yjtVL3gZ83kvyCnrpB4AM8RrgwpVC3EEXhDbbNFVAd+KYbRPHYCL5L?=
 =?iso-8859-1?Q?SBllAaVjPGc3ZSj/7t+X/BN4XiyGA3JEFKZe5EU3o/Iu8DymeMORnPsmfO?=
 =?iso-8859-1?Q?HppHpkIxy9NmOq7U1qyYxkQAAIJhhgZti1bGBBdqd+o86b8JXSjPo/GSSY?=
 =?iso-8859-1?Q?WOaM1NIY6lSP6H7OsdLjDGoao3Wvw7gudKn0zqYnLRX7I3G2xsPx3AVAd1?=
 =?iso-8859-1?Q?vNPML1J1Vr37YgoT7AivJzFWzJl6HcqUiw1HPZUoIwgNxb4e5ak7CbyX6R?=
 =?iso-8859-1?Q?6m1TmJ68wMAwJHiJK6nNCAPxNTBgpvOpR+4oYd63hlt5TYOuYeC5IYRYC4?=
 =?iso-8859-1?Q?8qxn5wKspHrk/z8febkzeZ1+zB4qM50oB1hyrUvRL/c6N45UVpUpj9ud3Z?=
 =?iso-8859-1?Q?bjVDVSSwwKZWx7SFNS9EahAs72pd1qpEN0dSdM5S1dXkC3BjSbyFgU8Qp0?=
 =?iso-8859-1?Q?XTT3QjBB2+qVe1XBUbEa24RA6pjrnfU5/24uxGr7jFrQmlcwSuvovRRCdq?=
 =?iso-8859-1?Q?0gXt6zfqie9ZRoB4x/EgB54oJfHqq49ZfvgakchmpEJSdeE5eb0imD/H/N?=
 =?iso-8859-1?Q?RDwgwwBvGUWdYE/JBmxtXDji29O8Z4IkbRde4JnsiL8t1c1BwQe32DX9UL?=
 =?iso-8859-1?Q?TeesYSwpJ3DtsbTq+1vCC56yEfP+AVzjZv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3013e79b-0eb9-485f-e5fd-08db60232f51
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 09:00:43.6831
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W5ofwPf279CfYFpjYp/9rfRhsNbNe3z7o4+xzCaww4YjJq2YbQFLf3BYC8g/zjWmEOI1qP5nudMvkTJksiJTJiN020bJq95+HXd4YMAG+xI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11280
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
> Thank you for the patch.
>=20
> On Mon, May 22, 2023 at 11:18:39AM +0100, Biju Das wrote:
> > Renesas PMIC RAA215300 exposes two separate i2c devices, one for the
> > main device and another for rtc device.
> >
> > Enhance i2c_new_ancillary_device() to instantiate a real device.
>=20
> Doesn't it already instantiate a real device ?

No, as per the code it instantiates dummy device[1]
[1] https://elixir.bootlin.com/linux/latest/source/drivers/i2c/i2c-core-bas=
e.c#L1156

>=20
> > (eg: Instantiate rtc device from PMIC driver)
> >
> > Added helper function __i2c_new_dummy_device to share the code between
> > i2c_new_dummy_device and i2c_new_ancillary_device().
> >
> > Also added helper function __i2c_new_client_device() to pass parent
> > dev parameter, so that the ancillary device can assign its parent
> > during creation.
> >
> > Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v4->v5:
> >  * Replaced parameter dev->parent in __i2c_new_client_device() and
> >    __i2c_new_dummy_device().
> >  * Improved error message in __i2c_new_dummy_device() by printing
> device name.
> >  * Updated comment for ancillary's device parent
> >  * Dropped aux_device_name check in i2c_new_ancillary_device().
> > v3->v4:
> >  * Dropped Rb tag from Geert as there are new changes.
> >  * Introduced __i2c_new_dummy_device() to share the code between
> >    i2c_new_dummy_device and i2c_new_ancillary_device().
> >  * Introduced __i2c_new_client_device() to pass parent dev
> >    parameter, so that the ancillary device can assign its parent
> during
> >    creation.
> > v3:
> >  * New patch
> >
> > Ref:
> >
> > ---
> >  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c |  6 +-
> >  drivers/i2c/i2c-core-base.c                  | 92 +++++++++++++------
> -
> >  drivers/media/i2c/adv748x/adv748x-core.c     |  2 +-
> >  drivers/media/i2c/adv7604.c                  |  3 +-
> >  include/linux/i2c.h                          |  3 +-
> >  5 files changed, 69 insertions(+), 37 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > index ddceafa7b637..86306b010a0a 100644
> > --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> > @@ -1072,7 +1072,7 @@ static int adv7511_init_cec_regmap(struct
> adv7511 *adv)
> >  	int ret;
> >
> >  	adv->i2c_cec =3D i2c_new_ancillary_device(adv->i2c_main, "cec",
> > -						ADV7511_CEC_I2C_ADDR_DEFAULT);
> > +				    ADV7511_CEC_I2C_ADDR_DEFAULT, NULL);
> >  	if (IS_ERR(adv->i2c_cec))
> >  		return PTR_ERR(adv->i2c_cec);
> >
> > @@ -1261,7 +1261,7 @@ static int adv7511_probe(struct i2c_client *i2c)
> >  	adv7511_packet_disable(adv7511, 0xffff);
> >
> >  	adv7511->i2c_edid =3D i2c_new_ancillary_device(i2c, "edid",
> > -					ADV7511_EDID_I2C_ADDR_DEFAULT);
> > +					ADV7511_EDID_I2C_ADDR_DEFAULT, NULL);
> >  	if (IS_ERR(adv7511->i2c_edid)) {
> >  		ret =3D PTR_ERR(adv7511->i2c_edid);
> >  		goto uninit_regulators;
> > @@ -1271,7 +1271,7 @@ static int adv7511_probe(struct i2c_client *i2c)
> >  		     adv7511->i2c_edid->addr << 1);
> >
> >  	adv7511->i2c_packet =3D i2c_new_ancillary_device(i2c, "packet",
> > -					ADV7511_PACKET_I2C_ADDR_DEFAULT);
> > +					ADV7511_PACKET_I2C_ADDR_DEFAULT, NULL);
> >  	if (IS_ERR(adv7511->i2c_packet)) {
> >  		ret =3D PTR_ERR(adv7511->i2c_packet);
> >  		goto err_i2c_unregister_edid;
> > diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> > index ae3af738b03f..3442aa80290f 100644
> > --- a/drivers/i2c/i2c-core-base.c
> > +++ b/drivers/i2c/i2c-core-base.c
> > @@ -893,24 +893,10 @@ int i2c_dev_irq_from_resources(const struct
> resource *resources,
> >  	return 0;
> >  }
> >
> > -/**
> > - * i2c_new_client_device - instantiate an i2c device
> > - * @adap: the adapter managing the device
> > - * @info: describes one I2C device; bus_num is ignored
> > - * Context: can sleep
> > - *
> > - * Create an i2c device. Binding is handled through driver model
> > - * probe()/remove() methods.  A driver may be bound to this device
> > when we
> > - * return from this function, or any later moment (e.g. maybe
> > hotplugging will
> > - * load the driver module).  This call is not appropriate for use by
> > mainboard
> > - * initialization logic, which usually runs during an arch_initcall()
> > long
> > - * before any i2c_adapter could exist.
> > - *
> > - * This returns the new i2c client, which may be saved for later use
> > with
> > - * i2c_unregister_device(); or an ERR_PTR to describe the error.
> > - */
> > -struct i2c_client *
> > -i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info
> > const *info)
> > +static struct i2c_client *
> > +__i2c_new_client_device(struct i2c_adapter *adap,
> > +			struct i2c_board_info const *info,
> > +			struct device *parent)
> >  {
> >  	struct i2c_client	*client;
> >  	int			status;
> > @@ -944,7 +930,7 @@ i2c_new_client_device(struct i2c_adapter *adap,
> struct i2c_board_info const *inf
> >  	if (status)
> >  		goto out_err;
> >
> > -	client->dev.parent =3D &client->adapter->dev;
> > +	client->dev.parent =3D parent ? parent : &client->adapter->dev;
> >  	client->dev.bus =3D &i2c_bus_type;
> >  	client->dev.type =3D &i2c_client_type;
> >  	client->dev.of_node =3D of_node_get(info->of_node); @@ -984,6
> +970,28
> > @@ i2c_new_client_device(struct i2c_adapter *adap, struct
> i2c_board_info const *inf
> >  	kfree(client);
> >  	return ERR_PTR(status);
> >  }
> > +
> > +/**
> > + * i2c_new_client_device - instantiate an i2c device
> > + * @adap: the adapter managing the device
> > + * @info: describes one I2C device; bus_num is ignored
> > + * Context: can sleep
> > + *
> > + * Create an i2c device. Binding is handled through driver model
> > + * probe()/remove() methods.  A driver may be bound to this device
> > +when we
> > + * return from this function, or any later moment (e.g. maybe
> > +hotplugging will
> > + * load the driver module).  This call is not appropriate for use by
> > +mainboard
> > + * initialization logic, which usually runs during an arch_initcall()
> > +long
> > + * before any i2c_adapter could exist.
> > + *
> > + * This returns the new i2c client, which may be saved for later use
> > +with
> > + * i2c_unregister_device(); or an ERR_PTR to describe the error.
> > + */
> > +struct i2c_client *
> > +i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info
> > +const *info) {
> > +	return __i2c_new_client_device(adap, info, NULL); }
> >  EXPORT_SYMBOL_GPL(i2c_new_client_device);
> >
> >  /**
> > @@ -1054,6 +1062,26 @@ static struct i2c_driver dummy_driver =3D {
> >  	.id_table	=3D dummy_id,
> >  };
> >
> > +static struct i2c_client *__i2c_new_dummy_device(struct i2c_adapter
> *adapter,
> > +						 u16 address, const char *name,
> > +						 struct device *parent)
> > +{
> > +	struct i2c_board_info info =3D {
> > +		I2C_BOARD_INFO("dummy", address),
> > +	};
> > +
> > +	if (name) {
> > +		ssize_t ret =3D strscpy(info.type, name, sizeof(info.type));
> > +
> > +		if (ret < 0)
> > +			return ERR_PTR(dev_err_probe(&adapter->dev, ret,
> > +						     "Invalid device name: %s\n",
> > +						     name));
> > +	}
> > +
> > +	return __i2c_new_client_device(adapter, &info, parent); }
> > +
> >  /**
> >   * i2c_new_dummy_device - return a new i2c device bound to a dummy
> driver
> >   * @adapter: the adapter managing the device @@ -1074,11 +1102,7 @@
> > static struct i2c_driver dummy_driver =3D {
> >   */
> >  struct i2c_client *i2c_new_dummy_device(struct i2c_adapter *adapter,
> > u16 address)  {
> > -	struct i2c_board_info info =3D {
> > -		I2C_BOARD_INFO("dummy", address),
> > -	};
> > -
> > -	return i2c_new_client_device(adapter, &info);
> > +	return __i2c_new_dummy_device(adapter, address, NULL, NULL);
> >  }
> >  EXPORT_SYMBOL_GPL(i2c_new_dummy_device);
> >
> > @@ -1122,15 +1146,19 @@ EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
> >   * @client: Handle to the primary client
> >   * @name: Handle to specify which secondary address to get
> >   * @default_addr: Used as a fallback if no secondary address was
> > specified
> > + * @aux_device_name: Ancillary device name
> >   * Context: can sleep
> >   *
> >   * I2C clients can be composed of multiple I2C slaves bound together
> in a single
> >   * component. The I2C client driver then binds to the master I2C
> > slave and needs
> > - * to create I2C dummy clients to communicate with all the other
> slaves.
> > + * to create I2C ancillary clients to communicate with all the other
> slaves.
> >   *
> > - * This function creates and returns an I2C dummy client whose I2C
> > address is
> > - * retrieved from the platform firmware based on the given slave
> > name. If no
> > - * address is specified by the firmware default_addr is used.
> > + * This function creates and returns an I2C ancillary client whose
> > + I2C address
> > + * is retrieved from the platform firmware based on the given slave
> > + name. if
> > + * aux_device_name is specified by the firmware,
>=20
> Unless I'm missing something, aux_device_name isn't specified by the
> firmware, it's a function parameter.

It is specified in the platform firmware(device tree firmware).

>=20
> > the ancillary's device parent
> > + * will be set to the primary device.
>=20
> This doesn't seem to match the implementation. With this patch the
> ancillary device's parent is always the primary device. Are you sure
> this won't cause any regression ?=20

There is no regression as existing users only instantiate dummy device.

> And why do you need this ?

As per Krzysztof [2],

The DT schema allows multiple addresses for children. But we lack
implementation of parent child relationship, As parent owns the resources.
Child device needs to parse parent node to get some resource
like clocks.

[2]
https://lore.kernel.org/linux-renesas-soc/TYCPR01MB5933BFFD4EB556F5FB4EA821=
86729@TYCPR01MB5933.jpnprd01.prod.outlook.com/


Cheers,
Biju

>=20
> > If no address is specified by the firmware
> > + * default_addr is used. If no aux_device_name is specified by the
> > + firmware, it
>=20
> Same here regarding firmware.
>=20
> > + * will create an I2C dummy client.
> >   *
> >   * On DT-based platforms the address is retrieved from the "reg"
> property entry
> >   * cell whose "reg-names" value matches the slave name.
> > @@ -1139,8 +1167,9 @@ EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
> >   * i2c_unregister_device(); or an ERR_PTR to describe the error.
> >   */
> >  struct i2c_client *i2c_new_ancillary_device(struct i2c_client
> *client,
> > -						const char *name,
> > -						u16 default_addr)
> > +					    const char *name,
> > +					    u16 default_addr,
> > +					    const char *aux_device_name)
> >  {
> >  	struct device_node *np =3D client->dev.of_node;
> >  	u32 addr =3D default_addr;
> > @@ -1153,7 +1182,8 @@ struct i2c_client
> *i2c_new_ancillary_device(struct i2c_client *client,
> >  	}
> >
> >  	dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name,
> addr);
> > -	return i2c_new_dummy_device(client->adapter, addr);
> > +	return __i2c_new_dummy_device(client->adapter, addr,
> aux_device_name,
> > +				      &client->dev);
> >  }
> >  EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
> >
> > diff --git a/drivers/media/i2c/adv748x/adv748x-core.c
> > b/drivers/media/i2c/adv748x/adv748x-core.c
> > index 4498d78a2357..5bdf7b0c6bf3 100644
> > --- a/drivers/media/i2c/adv748x/adv748x-core.c
> > +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> > @@ -186,7 +186,7 @@ static int adv748x_initialise_clients(struct
> adv748x_state *state)
> >  		state->i2c_clients[i] =3D i2c_new_ancillary_device(
> >  				state->client,
> >  				adv748x_default_addresses[i].name,
> > -				adv748x_default_addresses[i].default_addr);
> > +				adv748x_default_addresses[i].default_addr,
> NULL);
> >
> >  		if (IS_ERR(state->i2c_clients[i])) {
> >  			adv_err(state, "failed to create i2c client %u\n", i);
> diff --git
> > a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c index
> > 3d0898c4175e..63fa44c9d27c 100644
> > --- a/drivers/media/i2c/adv7604.c
> > +++ b/drivers/media/i2c/adv7604.c
> > @@ -2935,7 +2935,8 @@ static struct i2c_client
> *adv76xx_dummy_client(struct v4l2_subdev *sd,
> >  	else
> >  		new_client =3D i2c_new_ancillary_device(client,
> >  				adv76xx_default_addresses[page].name,
> > -				adv76xx_default_addresses[page].default_addr);
> > +				adv76xx_default_addresses[page].default_addr,
> > +				NULL);
> >
> >  	if (!IS_ERR(new_client))
> >  		io_write(sd, io_reg, new_client->addr << 1); diff --git
> > a/include/linux/i2c.h b/include/linux/i2c.h index
> > 13a1ce38cb0c..0ce344724209 100644
> > --- a/include/linux/i2c.h
> > +++ b/include/linux/i2c.h
> > @@ -489,7 +489,8 @@ devm_i2c_new_dummy_device(struct device *dev,
> > struct i2c_adapter *adap, u16 addr  struct i2c_client *
> > i2c_new_ancillary_device(struct i2c_client *client,
> >  			 const char *name,
> > -			 u16 default_addr);
> > +			 u16 default_addr,
> > +			 const char *aux_device_name);
> >
> >  void i2c_unregister_device(struct i2c_client *client);
> >
>=20
> --
> Regards,
>=20
> Laurent Pinchart
