Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD2377FD06
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Aug 2023 19:31:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353815AbjHQRbZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Aug 2023 13:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354013AbjHQRbB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Aug 2023 13:31:01 -0400
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2066.outbound.protection.outlook.com [40.107.104.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E06BF
        for <linux-i2c@vger.kernel.org>; Thu, 17 Aug 2023 10:30:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mAEbX97V2NhEEAhMukQWq+LNgIE60ktk85xX9Y1zvR34oW0m/l1qfc/Wz0kIAc2YFd2gDQPv7B5Y0guJpLa3Y6+D9bw4SNrw0fkoE+WzStzU4KzGwv4z9ogDF3IFMQCCZH2K2K6e+xriM+ai6wrUUiFaMLk0GX7P009sYoznsM4vAXfnfFgss+jmt83t9VISUN1OufK/kFz8Ij3L3Ey7eNzEqFpC5sLPtOIJfZ/CVl2uUKt8c+egMr6yy0F0RtKnL0IzlPDDERCpiFE/+pjJA8rLj5VXvWm8A/zDaeirpJAI6hjVKkgP9skrwoihn36w0YPPRjrsQd1dHqfpV9OmVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6c6g8z5VeYHvZUiD0o8vr8RD3qiu9OGuv2R6mGJHI/M=;
 b=f4A9lyyy8g/HLyuqg4DYadPE6IHdK633My74qxu8nbWAVaFZ3Bx6a+8hNWSJvjPCR5A+mBwXOOOCsEVoQLcrfxP8at5WAmT14rVvEVjmw/HQSols+o2kj9YN6l8+GJ3dB9m/fYekGIL0/1a8mnKfVXZEMzC63Vd0wlmG73sO5I766rim/GPbYzrI0AFR5bACktCqzCX/MPtOwCsvNL63zQpiR2y+gvzCvDoVWP8gHFOneLwNWWKziT1FkJIGKeVXUIUIU6/mPipE1J0ZWdjbPr82FlaIiKocSp8uAy6WZLvGo/cihE3vFzW1kLqfLnpMty7BfvE9wDrqgHX09wCsrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6c6g8z5VeYHvZUiD0o8vr8RD3qiu9OGuv2R6mGJHI/M=;
 b=DXXZRJgoz0Nvx5BSqc2He5OGfW6HmpGGrM4j+Q1AmaKoGdYxe8A5lop3zJKVqE/9zOPa1C5JIHdfHMDxC0qXhIoRE8klcMyXk4TkxKbs5I7zQ6tOKa5jo1nYHiV2X1PcmUExnTQCNtHTlzf6+DMzU0yu8t6jOzXikk31rqWgSvw=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by PAXPR04MB8800.eurprd04.prod.outlook.com (2603:10a6:102:20f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Thu, 17 Aug
 2023 17:30:56 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::75f9:a3c:a9ef:7bac]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::75f9:a3c:a9ef:7bac%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 17:30:56 +0000
From:   Leo Li <leoyang.li@nxp.com>
To:     Ruan Jinjie <ruanjinjie@huawei.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>, Wolfram Sang <wsa@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: RE: [PATCH -next v2] I2C: Fix return value check for
 devm_pinctrl_get()
Thread-Topic: [PATCH -next v2] I2C: Fix return value check for
 devm_pinctrl_get()
Thread-Index: AQHZ0LFuMEglcOG8zUaItZWQHMaHx6/uv1lw
Date:   Thu, 17 Aug 2023 17:30:56 +0000
Message-ID: <AM0PR04MB6289593A2149C9411FA9D5858F1AA@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <20230817022018.3527570-1-ruanjinjie@huawei.com>
In-Reply-To: <20230817022018.3527570-1-ruanjinjie@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|PAXPR04MB8800:EE_
x-ms-office365-filtering-correlation-id: 37087b31-bf51-4f27-08ac-08db9f47b724
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t9hC526NW4A5dKmLiSQ2e9TDiJrniYS89yVef6vSFQsgZJ4WFNoIQzHrsLGG/AUzVSwZ66lK0zcEMxOJFxHH1vz/TOIOfWcQ1lnnwG/uEwo6A15cwZHlMOWs+wealRlk8FTWgeZW3ZzJy20/00FwobY+l3kcZGdfKUisfW9Ic3qYdQGkIj7UWOvGNCAvCCVlzZIfUO4w/Jt1LLdGBIqoDPm6FHWlBq3Felt8pLrRGG5m3Zi4T8CpTYzbMBQFERXTdDGqjk0GqYkxsD9nn2xywj0T+KaGUKbsX17lekwiWPHErdikvLeL5scWNaZenLcYckA65E1pvd4vaBoqyAyDC+JHkVgWDHvwPZOZqAlHXG6phNNQTBHQBz4vhGY5Yv7X0ACOxIsUVVQJAFG4BCrYUnLpF2lNWUofqx7ki78NbH7+khQ8lDax3TxccptAcXjmK+KM4Bx81tsGH9pPXLCnd4kPHCRbzXTip1yM73Ea/bXvKpI8eQvIyb1zvY5pudDoL3cY27OK4OJiayVowtwlHvnn693oLjSuuE18azOzX7xvIwB2CVyijRVzYa3tWzrnPXU/qqn5Ec0vk4jglS3k1k5+ZhpqZzSQgk/fGKYJPhLUJX4QaT6baHyoAZRm/MCO/7cXDhb0xxiClZPcDQPI0A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(136003)(346002)(396003)(376002)(186009)(451199024)(1800799009)(110136005)(66446008)(66946007)(64756008)(66476007)(76116006)(66556008)(5660300002)(55016003)(316002)(2906002)(41300700001)(478600001)(7416002)(8676002)(52536014)(8936002)(71200400001)(7696005)(6506007)(9686003)(53546011)(55236004)(66574015)(83380400001)(33656002)(38100700002)(26005)(86362001)(921005)(122000001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mj3ieRVZL9xdhzrMQMZ2TQezAneHlV8NJDy5iIO9NfCD8jzhIGJweRMop4?=
 =?iso-8859-1?Q?4ZatOrToun5wpJnRyleeceUWpPeeyjvdCqp6YNuHgQY5/FUUMwFY+Wou2x?=
 =?iso-8859-1?Q?WMHzZ5I3lTpxriT34LY23aG8VED8DQdkiaBI9xAAVJ106by9Y6TqYKdCNK?=
 =?iso-8859-1?Q?7DybLIyfOtPLjgMShq3dUQn+759KUfEJbcDJ7aPcMtwpoct6K8sxSRHYuj?=
 =?iso-8859-1?Q?TSnA++5gYp4r/nqtx20pSyK3it8PFjMn4NBg7jRLC+5Nk887Qb+OaeJFCD?=
 =?iso-8859-1?Q?q7oEhv+CJa9aMolZRKEvu+4zhUG9J9N4xAMYJQ8eSbLO8CxqBxpXtzc+tE?=
 =?iso-8859-1?Q?6ScQT5lMhTNNyv8KROxLOIcouzH1UOpllDU+1w9DnG8EQsQUrt96aMfMbh?=
 =?iso-8859-1?Q?bvTvtHCtY8nvZdKeazlgUhE2LOnOQubtcIB/zumokzLp0grlmVFiljSmqp?=
 =?iso-8859-1?Q?ZkK8IRKiQKDcIlkk3TAG19CR3p22Ka3UG4WJ5r5sEcqHK7D4o3Mlzp4GXP?=
 =?iso-8859-1?Q?zYCazofIRotw+BmKIyEYUejCnOeWgZHdKYyqPMvkKQb3xph4IvxJhevYKi?=
 =?iso-8859-1?Q?jCR6DQhvDkhm7r54zlOQ1Iur0Bf57IS+HbDbYSdXIue8QthO2nicI9AHEm?=
 =?iso-8859-1?Q?e9lslFBXVwqSqwz1io334aV/speTLezuvMTndJX29Jc4AWa9XF9pghJY3I?=
 =?iso-8859-1?Q?776wEGk/Ux3d3KyGV7E53DOw/1R4ixjfaGBtFwNJqthJqfc0AL0oWgzBHI?=
 =?iso-8859-1?Q?nVGOXquNBzbzkNrVlWAEWJBHR75LM95tk5/pA8IoJzqHaJ3h2+rcMcz27q?=
 =?iso-8859-1?Q?Dv2KB8cl3yJZBHttVv5uxWizfi6GTzM8hsBvBpqEKFZISrGLUpzSAfz+a8?=
 =?iso-8859-1?Q?l2WI5croJbpkmH9RhCCZzhnh3Rb/hIZ1sdr1IIk/r1eiuOsyCrjl1yYFfb?=
 =?iso-8859-1?Q?3ILMc8xQu+S2J3oGYsKuGsnCN4AQus2a16ziUygTw19T6ZkQcSVu8yviiF?=
 =?iso-8859-1?Q?Qxf0fnvF+x/QwGDfZIWk7N4vRB0HPIQxc0EAe71YtoQwZ4Gbr0GxhKFJqP?=
 =?iso-8859-1?Q?Zp+eddTiLNN+USkaQMbnaubdI+w9HqCrtxoFEFAk9O3/4B0LutahT/D4m7?=
 =?iso-8859-1?Q?TJ/N5bdZdxmlHD20US2IgpbAT/XKvSPvAbhIDot0YvtoQB21FHLx+Hu42V?=
 =?iso-8859-1?Q?TB6ZvJFi1qR45xAC3lQ9mkYibkUcJ1gvPNZ1WkbShYl3TwB63du1IPKFWG?=
 =?iso-8859-1?Q?mcAuW+xd+hAJXO1n/vQI5dHP3JffnBODB0WjWqbmwuQZLBqGMtvWUdJ7Uo?=
 =?iso-8859-1?Q?C3qd6baNzbQE2Rg86FL+YFfVYXLttyFciPuG+Mn1BFoSezEXhhPSAXatwk?=
 =?iso-8859-1?Q?jQCQ9w/tn7kvKY0Pl9lRt4Q9VG5yhGqdCRsIzLqpCNoNOyGS6RNPtldIJv?=
 =?iso-8859-1?Q?nEtV3hMihddEX3bhukc2l1W0ZjgIrd30xBvqjE3JrkFQnAFFTOrqdd11bs?=
 =?iso-8859-1?Q?pi+1iEFkrTaCp5EPFMgAVEmOZyo/2lo5z6pl5Aob8YMZCO6DWtpbOyPuDZ?=
 =?iso-8859-1?Q?O2MEX1lKAtoUUCF+mYIXdoKWW7c8/NoRjXpH+wmIjhXdNSRJZumxD9sHb4?=
 =?iso-8859-1?Q?uVn0RR8Cj1RNQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37087b31-bf51-4f27-08ac-08db9f47b724
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2023 17:30:56.6715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DuT8XUXv8JEVMhxxzplyAQAIXVFF0RjfgyYKbh5tN0DOctJKmJD1qDunaa+XhMW/az6DxFkuXNMbhb3CYdkQPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8800
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



> -----Original Message-----
> From: Ruan Jinjie <ruanjinjie@huawei.com>
> Sent: Wednesday, August 16, 2023 9:20 PM
> To: linux-i2c@vger.kernel.org; linux-arm-kernel@lists.infradead.org; Codr=
in
> Ciubotariu <codrin.ciubotariu@microchip.com>; Andi Shyti
> <andi.shyti@kernel.org>; Nicolas Ferre <nicolas.ferre@microchip.com>;
> Alexandre Belloni <alexandre.belloni@bootlin.com>; Claudiu Beznea
> <claudiu.beznea@tuxon.dev>; Oleksij Rempel <linux@rempel-privat.de>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; Shawn Guo
> <shawnguo@kernel.org>; Sascha Hauer <s.hauer@pengutronix.de>; Fabio
> Estevam <festevam@gmail.com>; dl-linux-imx <linux-imx@nxp.com>;
> Wolfram Sang <wsa@kernel.org>; Linus Walleij <linus.walleij@linaro.org>;
> Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>; Leo Li
> <leoyang.li@nxp.com>
> Cc: ruanjinjie@huawei.com
> Subject: [PATCH -next v2] I2C: Fix return value check for devm_pinctrl_ge=
t()
>=20
> The devm_pinctrl_get() function returns error pointers and never returns
> NULL. Update the checks accordingly.

Not exactly.  It can return NULL when CONFIG_PINCTRL is not defined.  We pr=
obably should fix that API too.

include/linux/pinctrl/consumer.h:
static inline struct pinctrl * __must_check devm_pinctrl_get(struct device =
*dev)
{
        return NULL;
}

Regards,
Leo
>=20
> Fixes: 543aa2c4da8b ("i2c: at91: Move to generic GPIO bus recovery")
> Fixes: fd8961c5ba9e ("i2c: imx: make bus recovery through pinctrl optiona=
l")
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
> v2:
> - Remove NULL check instead of using IS_ERR_OR_NULL() to avoid leaving
> them behind.
> - Update the commit title and message.
> ---
>  drivers/i2c/busses/i2c-at91-master.c | 2 +-
>  drivers/i2c/busses/i2c-imx.c         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2=
c-
> at91-master.c
> index 94cff1cd527e..2bf1df5ef473 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -831,7 +831,7 @@ static int at91_init_twi_recovery_gpio(struct
> platform_device *pdev,
>  	struct i2c_bus_recovery_info *rinfo =3D &dev->rinfo;
>=20
>  	rinfo->pinctrl =3D devm_pinctrl_get(&pdev->dev);
> -	if (!rinfo->pinctrl || IS_ERR(rinfo->pinctrl)) {
> +	if (IS_ERR(rinfo->pinctrl)) {
>  		dev_info(dev->dev, "can't get pinctrl, bus recovery not
> supported\n");
>  		return PTR_ERR(rinfo->pinctrl);
>  	}
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c =
index
> 10e89586ca72..05d55893f04e 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1388,7 +1388,7 @@ static int i2c_imx_init_recovery_info(struct
> imx_i2c_struct *i2c_imx,
>  	struct i2c_bus_recovery_info *rinfo =3D &i2c_imx->rinfo;
>=20
>  	i2c_imx->pinctrl =3D devm_pinctrl_get(&pdev->dev);
> -	if (!i2c_imx->pinctrl || IS_ERR(i2c_imx->pinctrl)) {
> +	if (IS_ERR(i2c_imx->pinctrl)) {
>  		dev_info(&pdev->dev, "can't get pinctrl, bus recovery not
> supported\n");
>  		return PTR_ERR(i2c_imx->pinctrl);
>  	}
> --
> 2.34.1

