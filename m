Return-Path: <linux-i2c+bounces-3267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C9F8B4922
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 03:45:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 51F20B21C96
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 01:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEAC10E3;
	Sun, 28 Apr 2024 01:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="H9SAFM83"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2079.outbound.protection.outlook.com [40.107.22.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCAA818;
	Sun, 28 Apr 2024 01:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714268718; cv=fail; b=JBxQ9ccQSJ7wjuscjw4+R8nPqi3bfqbDvqB0X97EvIef7qFw1Q7hUUm1g8tXxyGurJP97lro4F+OqVKD2JFi1+DwVXuxI9lcCpiFi6I0I3SABloGKUTOGWC0o89rTyCNZSXKTKCX5vpy3t6W5Wyll58kLUeVYcIuYNYczAO7ZsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714268718; c=relaxed/simple;
	bh=jcSJU3OFg0dlIayqvZn1aYZH8zZpDXNOri9WwUaiEak=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LFT6/beSAtKq7nawu00zjXGbS+gJdCS2R0b8vqcwBFGAHLsuVlruI3VdW1IxJgNssBsymlXvATI2wwDQRgozrGkemo4WisR+n00o4W786rqVYvCaI2L9tIuZXjd00P/5w/eLO4iY5lVuWb85Y2egpZQgTPej2yTsAOjMXkEyrrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=H9SAFM83; arc=fail smtp.client-ip=40.107.22.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P8Ysv7Z/U7dJeXd/P5W/kbxRKxsitF9BMCI5Xt38TKdDblX2LXxW0JRuIFnth/AW1W6dyzAGBmlo6C74WY/7JiIcZaLfxPBYzdEb10aL8iklWKDR4zxSkDsSiZ4urAk7wVpsqnINpW2wofiM3cgcvmfBbivxEMpaI9WxwBtxzDM15jE+tunngVXDCgHFqfHXT1RS3xG3GS9Mq2y7WHioFrO9QEoghFs6DzTAF9wAICse+t6LtN92XPppYzRYBavoR62lKHnpZs7SkDu1PU/2ngFabV4POeOrg1T/2gVLMifd7DSYOabI83UIhRxsYZqWq6HR/BfL52+yMSsBH026qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aiP2cNvGvsAQGiDRNJECPgzwKGIQO09RKf5kwnbjWLQ=;
 b=J+eAptQVIxMuvM0NaqfyEuVDekW6uLRi4ZUFjzMuAapZoUbxluOe8PGp5m4EX2S4qHJk5h51X023+SCaTdUjlY/kDD4qNpSr/ArUBW038nVWJliU0XR6qCOJ8Cg/odEPwtQ+qfejyxAA8AMNh1HqgK1gk+6ijbtWpXc+CjxzwkBGwy8AhudNV3Y00hjSanmsgXj+1xVa4lFZtBIslsfMJdiu+dCjn0vyzYwfevFTcwxnQge8nFga0CpJ2dCbh4DK663dW3d6STXDSDFkx9CuQthzSJaAnEgVPbKSjmG6TLJh+rk3s/hmHo9lbrLk+/5VsSYMItwyO7mimEewmqXjaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aiP2cNvGvsAQGiDRNJECPgzwKGIQO09RKf5kwnbjWLQ=;
 b=H9SAFM83QaLfH3sLi6imBbVXwDQynGXXlVqkkk4e/Z1PfCwf+qEiGnqJ9sCkKEDHJEtHE/IhDkntE2aiq3JCRd8189XitTCwt5vcSotiGwC6ScRvXuzWQgacwN5MgGHNHXi4rjSxXJ8TQUgKtVcbUDT2Z3Wp+yYGE94cYD7sVBA=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by AS1PR04MB9502.eurprd04.prod.outlook.com (2603:10a6:20b:4d0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Sun, 28 Apr
 2024 01:45:13 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7519.031; Sun, 28 Apr 2024
 01:45:13 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
CC: Aisheng Dong <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 05/15] i2c: imx-lpi2c: use 'time_left' variable with
 wait_for_completion_timeout()
Thread-Topic: [PATCH 05/15] i2c: imx-lpi2c: use 'time_left' variable with
 wait_for_completion_timeout()
Thread-Index: AQHamOLBM1HAo2q+mUaE1E5f9ItMOLF86Y3Q
Date: Sun, 28 Apr 2024 01:45:12 +0000
Message-ID:
 <DU0PR04MB941778B81FB5524CF943E96888142@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
 <20240427203611.3750-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240427203611.3750-6-wsa+renesas@sang-engineering.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|AS1PR04MB9502:EE_
x-ms-office365-filtering-correlation-id: c88ca1a6-8ed5-476c-91a7-08dc6724d895
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|7416005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?wws6lLxSnD0VLaIsOzfJz23mdGLXOFOPyxKFTagIGPufhuV2e52ZeRL2PLQB?=
 =?us-ascii?Q?RZ5ireghNfLctN9UPxLJf1PMGV+gfL4WyWGOFkKZxKkHvf/j/wZw9EpKRTTR?=
 =?us-ascii?Q?cK15EZsbQPpebQG7PIOc37lgyQIF6O9gitJd1QJyf4nLrfvw9J1/e4mKkhXi?=
 =?us-ascii?Q?zVDPp6xhRFVDjevKY/X7DKFOut4guQtJXjAETTFHxBrunxhSu3zXcLKi5/q7?=
 =?us-ascii?Q?Tg8kperDojt6XtnBs6ABIen/QRFoxlm4VsuwsIJVHq/fFb7noMpbXeNBMk+E?=
 =?us-ascii?Q?nm03YMLAxdwKkRt2XHGhJFZAvwZwqz52kCsi1OC6p7illeR70gMftZbjUCD5?=
 =?us-ascii?Q?Xxg5uwC+4rTP14/JUZerknAclq5K78PsajsMjSrwthTfuH+w1qvONCtzVqjV?=
 =?us-ascii?Q?56jSRKNmc+omXxFaEFhi5QKUXwJeWDnw3lYrgKvwUIddPdZDpYSYpwJ5jhlc?=
 =?us-ascii?Q?ER69cR+W7gXA2Sy55HP6fSvxoL5vYHsKXweJ+8VlelOH4RQByRacWfWpk7Er?=
 =?us-ascii?Q?qBuhU0HQMxDP6hUsEEzX2VbS+D2/1Nh8DgxQBGMswSkHQZ2xsgp3lj0ZJUcU?=
 =?us-ascii?Q?YQaPWKS20zPSgRo38YfB6+lziR3edDQNWaIxFd3TNVxm2syqmXfyc7NxXKJr?=
 =?us-ascii?Q?EdDHU1dJjyQdFSU5WeYz11uj1XordMD7+lHczVsqrZoViPzXEKWdZc7VMR1x?=
 =?us-ascii?Q?VYUm0DiSPw3khZyLCs3G2ne5hcgrIi0mXDlZ7bPxJ6tAcFsqDc6ETiwtjd6C?=
 =?us-ascii?Q?U7XKqbQ/4Q/UFW4iUP0VpybNNpDls16swudHKUZhx3xBt/H6A8PUJPrupxJo?=
 =?us-ascii?Q?zUu1nV+Wr1kW3P9OPR/UuFbf+KUjCrEnbV8bK4SoQE6U0+z1zKY+kLg7o92O?=
 =?us-ascii?Q?jDN0VRYDzcNgqtiEjuKaOFMnl/ufu7uZSL/DML90rpQl5gxa55efX6yR/vjq?=
 =?us-ascii?Q?Kmu2dA5nNMh+0J273rBGDltNUGsZsz2RMXDGBIFhhDEiLNLWLsSuMaGX6vfv?=
 =?us-ascii?Q?MxEwJqNIb0y+dQPtWPeieLqoytymYQjGpppEA6L/iccWVdvGDohGaNAytIBg?=
 =?us-ascii?Q?jg2tKDjC+ziza7KE9s7rz8t+iQjgKq34fcAVJE84Hnr2GlkDBfnZk6ZirTrA?=
 =?us-ascii?Q?WOwcmBWWWzkX8lDtcTcZpiJEanOEME0EYqZdEzO5cEJ/MwuAg5tW0IqUtCds?=
 =?us-ascii?Q?6Vsbm9S3xhdDuiBh96NdLWBd8rlC9daiTq9dugtaR6tFG9yd2p0DrEjnsGOI?=
 =?us-ascii?Q?WRuGxX8b8nksqZWyzO5wGHwcMRfKqoq3SwyYF04LRmUtBx46ErjkznL7GNiT?=
 =?us-ascii?Q?E3FWo3ID5sGGGwy/gRvH2ZyoNmEKAiUDyXb8kOIgOKnPoA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9417.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xbMq4gw417YiGd4TQEZn7m4387pyhLGYwbJUpvfK5iERBeirXm2tHQiICtZb?=
 =?us-ascii?Q?Z58x7r5BDBB/q6/INx1M+DnfFm7OLWL9bjGQvpQ/rYqDSMisG+ZoQGNovAdl?=
 =?us-ascii?Q?6nEKogCX3X5iq0DCYjOiX+U3baqvUKl29MC1LWcx9x0bxmFKw7w6PVMcUmqq?=
 =?us-ascii?Q?1aKaxNfpGna9wNeWqo6q6k6nV2j9Tj30fTKGuvpub/Ae0j0b/M7IFME8Rxcx?=
 =?us-ascii?Q?7YpZF1rSUYTnb44WqnwRcHL9dfp8r4YaCQr4ZCWI+tFK3W9JXbyDMgFGP9JO?=
 =?us-ascii?Q?SoWLm4Hdh7eTwSu6SpMsRG5pUinQHQUldkHHHzv26iirEMu9FdMe7PPSvnaW?=
 =?us-ascii?Q?b28DOPtJGaF4hNqG1GwvZhZ+jMlfFSp3VI4asZ0GcPBr2VngBCrtBG4Vceba?=
 =?us-ascii?Q?CvzuKnIPRI4OBLldslXw3w7iDe1Q+AGx4mkF/c0TLA2iWV/htlPvziFGUXz6?=
 =?us-ascii?Q?bZG2MqLrspD8ZPmV83soqL0bpMN1ZMMBofNDxYmL5sQuobzN5KQcviUgsBNR?=
 =?us-ascii?Q?p43ZPxXM+UebSk22DOJTkg64ZdenoneU7uwshIqa52jsS5i1OLzw2BnMSrPj?=
 =?us-ascii?Q?5A/RHFy6vSJRrQAyeMnNaxteOG1bAUqkGG8TsSsf5f7PM+NvHJj/XYY1Ys9h?=
 =?us-ascii?Q?L/oZUGu1a5V5rPAeDFA7fUtTZI+tfJmiM2ypBOnkKwa+ndABQSUuxMmJs5ko?=
 =?us-ascii?Q?lFKij5AMci8HY/G/I6Nnnrk4FWYpbIXoLz1rInWj/uCN4JQpoJw+nWWGPji7?=
 =?us-ascii?Q?eZeRSN67YM/DXRu4KH1T/nzTa8Lc+LP+Ub9CNzwP/yzoLheU/hf+VCfHD4U7?=
 =?us-ascii?Q?28kOhsfOmxMtquXmIFv8fxNQKoatcloQ+CgaHBwqd91G67ZxM+511uaZ3F9+?=
 =?us-ascii?Q?0Tq+fd5/g/SuDtYBDY62xiY7LoVGmQjuYy+LV62+nUUjR6I1S7My1UDhvVqm?=
 =?us-ascii?Q?iLkrDemnmjpBydrFH/e32ZiSt+EV3+U412rJ3D8QUSqsv+YhX3mg/XneR7v4?=
 =?us-ascii?Q?9tU7c2iwkZGgZmqz5G5oiOMWvJh+wGwpetWTVBkXxNfpQSCA64JlY+PGTrbr?=
 =?us-ascii?Q?jWRw6amWzYR6MW5CBir6dq6To6aDqNx9/Ba27SdyfHBwbIn6VQho9gd6k+TW?=
 =?us-ascii?Q?NgryHaHe9fIEQVXFRcjTJh/Vz4FXEIbud7Y54zcJyegk3+gvM/vbkP6t/8TQ?=
 =?us-ascii?Q?4ORx10AwdeCio2I21AHE383nCJ1OoO5LoAnHrQZYwayngttjqh8OFrGyZPKT?=
 =?us-ascii?Q?PMX57jn25etVDz0zAfDNVS4qzWOVbxMsaPEbjvOL7Gjqd0OChUOLFlJDtBcy?=
 =?us-ascii?Q?KwGW7BBUiR2C5ZECjojgC28hlBQHiJihAQkksE54WWdpBuOeaWz7VRY1/jB8?=
 =?us-ascii?Q?lIZizQXr2I/UR275H/Zup9b7fJD5NSU5zXWlRVI0ymZDvBm89mtwLZi9kDtd?=
 =?us-ascii?Q?dFzpGoGr7oE0tq5EpiXE9AxNoF0MAdh4Wf5Eia8hleqJaJBPPZL+5pzIJVKJ?=
 =?us-ascii?Q?ZvZaV461zWmVawqGDE2WIIIdzDCt/nV+ZtImzn+s9TXl5bTJU6wVppVi3oZA?=
 =?us-ascii?Q?G5G0mHNxl48ApVSbHwo=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88ca1a6-8ed5-476c-91a7-08dc6724d895
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2024 01:45:12.9650
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: en6A4ptLhQNe2QSqY4UszmizeY2pn9E6oO0W2t/rLe2G4b2vVGIEdVrg9D8ENKKKcJgfMd1QBKunA6FVaG0lAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9502

> Subject: [PATCH 05/15] i2c: imx-lpi2c: use 'time_left' variable with
> wait_for_completion_timeout()
>=20
> There is a confusing pattern in the kernel to use a variable named 'timeo=
ut' to
> store the result of wait_for_completion_timeout() causing patterns like:
>=20
> 	timeout =3D wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
>=20
> with all kinds of permutations. Use 'time_left' as a variable to make the=
 code
> self explaining.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/i2c/busses/i2c-imx-lpi2c.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-
> lpi2c.c
> index 36e8f6196a87..0197786892a2 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -307,11 +307,11 @@ static int lpi2c_imx_master_disable(struct
> lpi2c_imx_struct *lpi2c_imx)
>=20
>  static int lpi2c_imx_msg_complete(struct lpi2c_imx_struct *lpi2c_imx)  {
> -	unsigned long timeout;
> +	unsigned long time_left;
>=20
> -	timeout =3D wait_for_completion_timeout(&lpi2c_imx->complete, HZ);
> +	time_left =3D wait_for_completion_timeout(&lpi2c_imx->complete, HZ);
>=20
> -	return timeout ? 0 : -ETIMEDOUT;
> +	return time_left ? 0 : -ETIMEDOUT;
>  }
>=20
>  static int lpi2c_imx_txfifo_empty(struct lpi2c_imx_struct *lpi2c_imx)
> --
> 2.43.0
>=20


