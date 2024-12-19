Return-Path: <linux-i2c+bounces-8622-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 800C99F750F
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 08:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 496127A2561
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Dec 2024 07:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BA9420897E;
	Thu, 19 Dec 2024 07:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NkZrn/P/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2044.outbound.protection.outlook.com [40.107.22.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCF7524F;
	Thu, 19 Dec 2024 07:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734591754; cv=fail; b=ed+UTjA4NIoU7Nv6+Pr8xVS9mWwczAkmJ7x0p+raoU8NzNa9OBHnXsm1kz2N9EhFgLCOnOvlkK4rumREYQFe1F3lOBrdtSFVMCRCigqh9OXXdTvVURaho6i1fMn6YulPGXQskFmUlVUh2dyUdJyq4YEU2J83Cl4JtpXjkWPHRac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734591754; c=relaxed/simple;
	bh=WxbgGpzPisH0Y9igWiEHm6BXmuBMo5uKVnW+31C706U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=CjAzXOqtiICQofKelkODxd6eqzkTm5EZW8Py24Ep9zWT0ronLiEuK2ORI6HJRg2DkpDgVIV25NWLj614i9B2QPNOz+2UOxe/jFQeeqcS530vzp98d7NJjA42hy7ogJNfOxS9VijF5EOvfssZSYhKkWZE4/uU3R+Xb3epdPWNoVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NkZrn/P/; arc=fail smtp.client-ip=40.107.22.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zKYR1E9Ln+YxvB+Y+1sxAfHsfjUsnXAPQljtGZMspxqyO3gvlQMhDYowzhzekPQPH0TyXX1VPLc8a4Dv9XZgjY/W1PgNJEl0xMbWmOntYMQbD0OJwOc1liFlswVmwXW2jUzS1pm4nrqPjfzMKx0cHxu7i2GdGMxcmRrKE6dIJV37uuaNUhcc9VUIsperzl9HoaxHsfEoa8YPUZVku6+Q6iFz8E1Yn4AlXrtE/9mRoedZFPr246ETDwAHexBAl06d+UpMU24u1QuL4pNIRYYXf8/FYnQFp/jDqjtobFBL0dLf+QLKuTYww5Viu7ZFSEbb7ZF/JpFmokq3rmuVZ4Yeiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CP+sZ2kTDZmAznJU8Y0O/mGyW1aybA/Ta5X+7PRgOqY=;
 b=dGHQPykJg2T3fRFUF0PlcUe2IZeqJe7PqpC/QBgp57ghNAilM5ch4I+1sTJKNvi23w/v274ZRZNYT8uKWsuOnlc7wQupEk36qGIhGWUrgru05klb178NTQpb7QupG0klr7wErQkFtnU2q1nZIECDkDK+alcRJINxk5valMmIFzvodqS2jhN7DXMRKH2C4ILoZGVlWGp8Wp/e7B9gu++eO4cptMM+B5t7rCF0oDzdkO85kObcTiD+rgE82NssjtsBJTkatx3G7GtMh2m7NQxbXoWvJCMw5OUoLRHCYluxXfp8wdjo7BvvtC4YOSO4gqyF5ZVMyoSS17jU1n2MBjE31Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CP+sZ2kTDZmAznJU8Y0O/mGyW1aybA/Ta5X+7PRgOqY=;
 b=NkZrn/P/ZFCtOowOvSLgNJ6iNnuDYwvukhvjib7o+CiWU/EkCV64XdHewav2excpTNNNaxyyl3jqdG57HfBkKqs6/vE/ewlvu7NN3P39toSURpN28lyA8gq1Ou4+ZcTQeRMTYaZRrV2ZQYC5m48WWRDrBgLjJKTx4gTi2/IC2m1yMLpP8ANbw3OaX66QpVOxUTaTnW2L1N3adfvmmtgBP/t45JMaQHglWRP+OELwzXWTaH2rBIsVwBlYW6zFL/0CZyCNxzEXE6iDCWsmmuuiXoUYgEeKYbEeWzo3GU2AZJ2oFZcdXsAoU5VKCemNli0Rcj+CS0LFtRNzpBtRiNrXfA==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM0PR04MB6979.eurprd04.prod.outlook.com (2603:10a6:208:18b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Thu, 19 Dec
 2024 07:02:28 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 07:02:28 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
CC: "andi.shyti@kernel.org" <andi.shyti@kernel.org>, Frank Li
	<frank.li@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: imx: switch different pinctrl state in different
 system power status
Thread-Topic: [PATCH v2] i2c: imx: switch different pinctrl state in different
 system power status
Thread-Index: AQHbUeP2oTzGjjBADkOP/fNXJCdFFw==
Date: Thu, 19 Dec 2024 07:02:28 +0000
Message-ID:
 <AM0PR0402MB39376D08D11CA4CCF6F88F29E8062@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241218044114.143358-1-carlos.song@nxp.com>
 <Z2O26jWagFtsWJd8@pengutronix.de>
In-Reply-To: <Z2O26jWagFtsWJd8@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|AM0PR04MB6979:EE_
x-ms-office365-filtering-correlation-id: 774ca9cf-e349-4193-d9a8-08dd1ffb197f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4x5gX94nADAB3+z93b8qFSkNG+o3L2NoImtf1eJei/wXzMZZ5ApWnM5lYetQ?=
 =?us-ascii?Q?2lxCjfaNbe8oUyL0OTKnDTw/QbkoklJqoHeanI/CTsXNGAI2FK0loevfCVEC?=
 =?us-ascii?Q?jLLqKUyZ75VIi8XRVMYO/hRDZpCTERTVi7zk9qU731ejKsI5iEDeuGq9TKJp?=
 =?us-ascii?Q?upwD78M/SP5SXy/+08dv3mNiOCnlhxZIvOloKSj19H/KxYWcMopOEuYPNox5?=
 =?us-ascii?Q?H4kQZqXoumGRmQ0QuPNfPh+pj+YFRDvl36mj2vce4TT+jbYJa53BAKQYoR6I?=
 =?us-ascii?Q?LHKkfn471TU32z6Wn0rCqtysfGgtXaqV+EpdIw2AZNrkVJtism00Fc9rLVM/?=
 =?us-ascii?Q?E79KkDk+KFW1Xda1bwPk1B4XJ7HaEU3lHhfLFhyETf8fQffn3AhdYiALlgFM?=
 =?us-ascii?Q?19jJETzdwMSquPJxlhDUKYaMZvVIN03UiOHpaDtIe/PcNKIm4hO1qalVo5n5?=
 =?us-ascii?Q?ELj6ZlaVCAtubN4ESI6/A6fXA7ZIZomFezIUwi3TW10WnayYGQ8BRZYo3tnE?=
 =?us-ascii?Q?4F9A4hfk3HWUq7mQZirIF5CJ1CyMN3WN0U3IMGR2PhFyW8stBZr/9XAIvsH/?=
 =?us-ascii?Q?QGa5ktbpDs9mn61TXixxMLapMGJCXnLa49eCaBLC+s5i0Rc8iLvhDVHBa+Kl?=
 =?us-ascii?Q?DqZtppRnJOVbQrKeIAxfdNyePPOKT9K8g36/VwT1CRkPyz4e4Oj+VHkoUmLG?=
 =?us-ascii?Q?LU1KgLMCQVR1TSO7mi+P4JHBLJFNxMa5ed8dKwleWW8n1avwlauew79xKhsi?=
 =?us-ascii?Q?j1XkxseUYYNyycztaFTTRpGcir+ZeSEBg4yjF8uWsnY001CL0O/jM52ffk6D?=
 =?us-ascii?Q?sttaV+fMe1HrYp63cGiPX9SgV6zLnB1vb/YRuUSj/ZWGNw2X7DeKuBMnmUAc?=
 =?us-ascii?Q?KXVTLwp3jFqJbcy6dJSk+6Cb8+vmjdl8Ex/ERIjyKwjLZeq9d/RuEsVI7L/I?=
 =?us-ascii?Q?YVw7QkbMK3SNKeTeXwT1s4Npxceft2RDSM0ClP2fG/B4BKqZQa4vbnZCGgBv?=
 =?us-ascii?Q?C8gJG34FN7H9ymKV9HY0bnfAopaEqW+hr6LMUqr77bdWz3aNOubmRt+R9DPu?=
 =?us-ascii?Q?qIr2awQsYVpvWO00AOGtd9mvK49yxJ4f3pZm43/wCuro1a2+QxfpcKCbmSSw?=
 =?us-ascii?Q?BgH3HnUxV6hDCiJzl6Q3nrgujZ9geujZR34p8DUXQW5bLwjNBPBJrD9F1SWr?=
 =?us-ascii?Q?LxTTe6jUg34UlPs3GWSJXZ/++GBrB3MC23Mcelcg9UwiolmKr5BjfX1q/C1u?=
 =?us-ascii?Q?nwhKQaFrGnkN79u2Lh5pGws9bLSNqQyi0COiSMxWQjMgtNKVpgBwc3fgnw90?=
 =?us-ascii?Q?nKDlkXWixOnQIk8RKFt7tyb1/bc3YI1edzqKOSzcRqz55WgPrvzW8QpKjVYi?=
 =?us-ascii?Q?wF5x9GGtW1PLEIYA6Yyo3+UgZDDy?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sHPHJEmKcJXU+T+XF4lE/+FHks3c9J6JJmL37Qkk8xf0GBn22jtWWeztHOZK?=
 =?us-ascii?Q?8ebbrf9MLNwJB9YywDwL+oyE9b1K/hjFm09qhl6+QGY+B1y4zoKmxjQUs8de?=
 =?us-ascii?Q?Jd2XP14jE2z5Rlj0HdZDNWfKYqBLmy7ldpAIeLypM6JWSqKjhYc0lDIGVCbk?=
 =?us-ascii?Q?SFCOyksdGJFcJdmA4BdM6vTRU+Dpg9tgMcgZi87gBvlq0TMDzgIU3z0/I8ww?=
 =?us-ascii?Q?j3ULwtPfUv+k203DcBh3ATk+zk8YbLBclZ394v0r1mM493zDN6SqW3UnCYCY?=
 =?us-ascii?Q?MynHIYlXlulk7CtFvoiVdsUsutj2T+gRJzFgA/0YeSNBq/r219znLEafLjkY?=
 =?us-ascii?Q?D7nqK2+W4OZfaxnKlPgRhsUQGed+unuVYN2bww0s3QZNV6Wvlo2RchQ8gO67?=
 =?us-ascii?Q?LgnQQqx+GQ+8rc1/VeC+SksWAVdeOSW/BawTxAHBObdYoNwm2YemhmcdxUkD?=
 =?us-ascii?Q?RIiz2+h5UGj6We1oX3OAMKGxZzdVERE8p9d76juA6yEPowRPmn6ojL7Aes9o?=
 =?us-ascii?Q?dXp/BBG4keA6nzUReS7MkEHe7tHXbozAnMDd7yPvVxHEzxm2eiTHu23UhRmB?=
 =?us-ascii?Q?9LCKiS95SqAqvezRSfR7Ha7vu4FNfDlx4xupB0xv+36Lrn134cit/6fAs+6Q?=
 =?us-ascii?Q?4vgX/OFdh0QRqEEcgInYNFuUiW8deoqaq9J+A39hWDZu6RLZohg9upCVtfwc?=
 =?us-ascii?Q?Nu4WLgralx8N4BDR/ooV17dTa9NkuN03XgY44V7Y8LZQXY13ZzBRXnQBjIdi?=
 =?us-ascii?Q?/sFaCtnDnL13l2l89x4IIWs7k/C7ao69hldTeSEQEChR1K1Mw+LVgZ5/Oa8z?=
 =?us-ascii?Q?k4S6ERvDrN5NajPWQt3XxlHznLWNyLRFWBiiUZcPdAX63AYTCdZA/hXQiC44?=
 =?us-ascii?Q?fP7l1eSBcbDRZSVyN0B/Efjas9/qfeKnk5uyNOUE4ERjYKLAtYfYYOKPigY5?=
 =?us-ascii?Q?WOHWkibESPWysxnXzNJ/MpcPoqn7F2XtS7G53ilvGKr9hOo3K8qg5PawDmmr?=
 =?us-ascii?Q?q0AaxrWhZoRLp7zmbyehW3vdA+I8eNz3gljOk09goZGtaVCzHqGyUMdiPnHG?=
 =?us-ascii?Q?vmFn68TTr6wCAfSJ0nl+JpQupQCIR6zt0GY0mG18+3TpKcjNLGRwuUwCcRSF?=
 =?us-ascii?Q?wpctutXV0dxqu7jXV3fHGdZjqIwIGV/rdi1SoyoPu4L1vsPxkYql+F3h/oDP?=
 =?us-ascii?Q?ngWWUPnSVZLfvS6BP9NN0gFGJrfCFF50ACxK7qtxmnJyygXdrHXRwxKKTUPS?=
 =?us-ascii?Q?7LtELlrFFQVkxneWVjmOs8cyNe4Kfj+WlzL9eUyIsbVTS403TJayZyu2KxnW?=
 =?us-ascii?Q?N/a4LVDKyAjSJInuGkjKJ9u2C2LH0QKv1k0n4IQC6RgcQlEK63vtAf9UDg8O?=
 =?us-ascii?Q?urWkNNgRXptX8+bFTGMYYBEoLqiyjsmZcjmVahCVXXyFJ0+fPgEDKlN5jq5u?=
 =?us-ascii?Q?uLg7JWRPTjaoJukGBxCSTsAUcj3G89H2J5+kyUPH/wXpBVOjfwE5S/5fO2rv?=
 =?us-ascii?Q?7Ybuin8IxObbWfCpeUU0NilEz6PRvdIh4zMnT5hGseQCABfJZmPzQyKs/OgO?=
 =?us-ascii?Q?b9RUoExOdxJh4n8CG5U=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 774ca9cf-e349-4193-d9a8-08dd1ffb197f
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2024 07:02:28.1263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JCOQHfflUTTJ0O2uFmgNBaA5dcrq5WAP/ajYD9iZzyB8Ddn0m8BHLHRv8JZ2kSkAyqSCpKJy36uZAvsGI640ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6979

Thank you! I will fix it at V3.

> -----Original Message-----
> From: Oleksij Rempel <o.rempel@pengutronix.de>
> Sent: Thursday, December 19, 2024 2:02 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: andi.shyti@kernel.org; Frank Li <frank.li@nxp.com>;
> kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de;
> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH v2] i2c: imx: switch different pinctrl state in=
 different
> system power status
>
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>
>
> On Wed, Dec 18, 2024 at 12:41:14PM +0800, Carlos Song wrote:
> > Switch different pinctrl state in different system power status.
> >
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change for V2:
> > - Add Frank reviewed-by. No code change.
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx.c
> > b/drivers/i2c/busses/i2c-imx.c index b6ed270dd04b..350346a7892c 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -1871,6 +1871,7 @@ static int i2c_imx_runtime_suspend(struct device
> *dev)
> >       struct imx_i2c_struct *i2c_imx =3D dev_get_drvdata(dev);
> >
> >       clk_disable(i2c_imx->clk);
> > +     pinctrl_pm_select_sleep_state(dev);
> >
> >       return 0;
> >  }
> > @@ -1880,6 +1881,7 @@ static int i2c_imx_runtime_resume(struct device
> *dev)
> >       struct imx_i2c_struct *i2c_imx =3D dev_get_drvdata(dev);
> >       int ret;
> >
> > +     pinctrl_pm_select_default_state(dev);
>
> Both pinctrl_pm_select_sleep_state() and
> pinctrl_pm_select_default_state() may fail. Please use return values.
>
> --
> Pengutronix e.K.                           |
> |
> Steuerwalder Str. 21                       |
> http://www.pen/
> gutronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C556bac4a4d18
> 45fe9c6e08dd1ff2b262%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7
> C638701849411172324%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOn
> RydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3
> D%3D%7C0%7C%7C%7C&sdata=3DGd6mIwBSMo6f03z3rVIInaPZXQXhCeyFEHYYl
> ctBPZQ%3D&reserved=3D0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |

