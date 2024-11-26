Return-Path: <linux-i2c+bounces-8216-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 007909D91E7
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 07:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8D538165F83
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Nov 2024 06:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D121617E473;
	Tue, 26 Nov 2024 06:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c+AfLUt+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2047.outbound.protection.outlook.com [40.107.241.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7772942A;
	Tue, 26 Nov 2024 06:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732603657; cv=fail; b=P/928juY7eLq5/zSqdKuw3QizqKYuPShT/gFFcgyWObTmgLr9J9LzRPoRLKVqDtBHYMUMnucJ5fKgwwhkT/3icKN5Il7TZUtMZ7xL4JakhmLpyUaAllFa4QR8UuuJ3Ebb8Zpc7nF/0beNHeF4HHEQDz8j/CuQ9fmFisEn0ZgGwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732603657; c=relaxed/simple;
	bh=6BvWFrIv6xH6KoxCsaeNENnEJH/lOY0byvHkhId76Zs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lwsNXMpHQAfaMr6OCZpI5w76phar0OzZQSAz0daeCNpwK3KJqQXiZNQVORkChoSHCmj6O5ZQlPkzS9uALHWrna53lbNdYSUx0N8Jf/bPPhk8K2xeOfskh/Jnb5iY8aHbFboswsEgD7dsB0fiCPJRJSv4NlISnCoWJ6KzWCS8QwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c+AfLUt+; arc=fail smtp.client-ip=40.107.241.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TY5Vn3Ay6amen4WPC8fwBiTfKi09n5kwT4bal4AVIn/fv3UpGxRKleludyX7SPjiK4+H6Uq0AB/gcLdmMbs+pX31RTNrOBad8zUas2EHTJVmEQtJ6+y50xAw825ZE5OgUN7sdakUiANoHOcrQT+pO+TLwm+9ViB2xiv/aRdZfT6UGqiSBLccYdDQ4YfJS8FiiO/FWtKrbhQx/RwvMX6y7l0hqGdCcuARFMDcqQsvhcL8U0FBQdY+fRvHOPYbZhUbHXsfc+D7Saxxz0TaDr5jnqaF0fUsr+oDAHLbiyi2QqX5nS1J2liTVJ5Rd43TjfYL2UBM+wokOwe+Mp0/UoLbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2OE65FalM93oGjSd9h3O9nw7geJXW9d+g6h8IhCoGs=;
 b=kuUzK8z0/GM1QDR1kOi1o7k0wuTWV63L5K3ulEHwqV/W92bdfNCDU8nxubAdY9pl3ZS9Yg10DcfxuyUDhN9I1fdxXutsLKnn8vol5jd9KKuEZU+61HsnfEfahxCaW87QetOimoprCwxRuCOOU9MCwyIwzMXGEDNFYeqvK46bgn15nei/KdLQC/1DxcHlKrp5gy6l5ZVBzHSYEkDWLAKsi/TfYptmSmw2QxDD6BADxVHEq9YS3TNEBi4sjFr+9yXX+lXIU7FwB7W+OP8CvO6JK5IoEEs1sqy62rTG8BCOGnOxg+T1YgCgAAjvrjEecU43YrnR+LlWUEcbHP3L8iK4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V2OE65FalM93oGjSd9h3O9nw7geJXW9d+g6h8IhCoGs=;
 b=c+AfLUt+Nw+NPQaXb/dRU3XMp/pQX0rvszUgR6XNYbECZl3X/UtoBuBi54Ba9AgE9cpz5l4/fT0bYVrBnjMg/qt2Hkc1iExn2FCBszJf3mb2RnpDIH7yjQRII6zpO0N1Qla4fdLno4He0s3Z1XKBLvAEuOjhf5gaPenOCnfYIuD4kDZATqimiOdiPJHYNNrtpXTamW0SplKW6q17/SZ1aInfxwmkUYe8q1Rc9XyTW+shW9ZERlk7smLg/Z2jI7sKG9xsSqOvFuXB5/axoNvh28pitRDYqRXsGWRnS8EI7zkQYaaSas7RYnFmbqFU5B+DvSvEp85eTI4I/prjPavEzw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DB8PR04MB6953.eurprd04.prod.outlook.com (2603:10a6:10:111::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 06:47:31 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Tue, 26 Nov 2024
 06:47:31 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH] i2c: imx: support DMA defer probing
Thread-Index: AQHbP0Abayarc6g4zUiDGbZ32+6OCLLIPSmAgADCxIA=
Date: Tue, 26 Nov 2024 06:47:31 +0000
Message-ID:
 <AM0PR0402MB39372D2666789C4A00001303E82F2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241125135243.1612098-1-carlos.song@nxp.com>
 <Z0SxCcnPOPA60i26@lizhi-Precision-Tower-5810>
In-Reply-To: <Z0SxCcnPOPA60i26@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|DB8PR04MB6953:EE_
x-ms-office365-filtering-correlation-id: 28b418e2-fb2e-4203-546f-08dd0de63392
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HCqsSmURudcLLflHqIbKi/HszhSFQZskLmE5l4alm13YYaOXCR2SRm+VNsqU?=
 =?us-ascii?Q?Pvn+ACH+kHzH2BThXq4ZHk2J04fLRe5r1zgP65dp777ylQPIv080c2nUoZeT?=
 =?us-ascii?Q?iT+atvzKGkMkRsK5sEIO1+gYbdcTnlJxGikiC8XtE4dYcOZjlcNCmgUM3vuI?=
 =?us-ascii?Q?ca3dB141jqyKMMS61exlORuVrGht4PGwnFMeTRY6YEaC91AYFueKhS3xbAjY?=
 =?us-ascii?Q?QkQRPWto8UG0Jtbo58voPSw+GyeuqdHfjpKKobwAKJJN8p2VUewEe0KN01Ud?=
 =?us-ascii?Q?oDlFUIZYb3369PHcpYoFR4TZ36HWmN2L74Hbqn7lAOFnYSQiTDgM6x36Fr1d?=
 =?us-ascii?Q?pxaZ+IYrUTjit1tiqjDgQlMuUeWNDOnp4EJkGOCTNnqjmTeEw/lFD9hrlgif?=
 =?us-ascii?Q?CrbHHfdG1VvN7H2d/lFZdctV6k3MthZJHTYvwLOiFF5ysJ6nd+hGlXgaKRlp?=
 =?us-ascii?Q?xs+pmlxPLXIi+zbdVHBOYV51IcrrG+7WOBXOf2Jf13ML5s8YhMJwZODD8nTL?=
 =?us-ascii?Q?YgGiKTvfzoRVx7Oda6ERazKaQs38lPhR1xqqxvu1Q4XU0o99jzL+FPNFohPW?=
 =?us-ascii?Q?t2aenWgOXGJvOlbdUdNh+nHS7WqY0KZQYF+WDcesSr4tm3k8rKAeSyRt1c4Q?=
 =?us-ascii?Q?GTP/DJJD+HEyM9Z7/ON+UQFbdws9PZ/52Jpo0kBsMYS6LyPg36Pp0ytRSd4Q?=
 =?us-ascii?Q?K+wuhISxyH8c6lULB9RrHIyNCHs+khlW2La2dN/Jwhc61c9pT2G1ROwyJ539?=
 =?us-ascii?Q?G42Q+OispkU3S/iuYczYfuf3WEUIfDapW921XS0/+gvS/7Qu/gTqmXuoHWms?=
 =?us-ascii?Q?tM+H08c+WqBn/QKRct397+etr2Du+yPZbML2P7+JBGP1VHyFX9zz87tZMNrA?=
 =?us-ascii?Q?W79aajycIQViloXD4NUyo8BL8QAwbvJWR+TPXGbem/AIE5pjJD1hAJ/sUfNI?=
 =?us-ascii?Q?H/m/RkPwLVwBQLhVnwuDDV6s89KfanOS7ceK8LAN14+6+Ck85RsQpB0vMLXc?=
 =?us-ascii?Q?cNklcyCjvYGZAbYdRTEw6Q+k0Y/mqgaPdgiiN4Al8gIEVBDwSdDbn/znKELj?=
 =?us-ascii?Q?zClQflKkgW3zRcY4Vjz8XqWKw8KGP5uYI5DFEoHFyTuUeBfDzC43XvtD65wQ?=
 =?us-ascii?Q?lsJ80XjLGPPRQEsKePZbY0oLWI/h7XO2tp05YmnJtOVQePwRMuOd++ow9Pku?=
 =?us-ascii?Q?udxGopxIJ8CmSU8uvnTQq5Aj9ELpG8ixksYy0nswSOPhg1weK/stjg4k4ELd?=
 =?us-ascii?Q?ek4SXiwCjzk7W5f6IMeMUdYmcmNlSlGhSqP1qwXME23i7bh6SkQEyibi79/a?=
 =?us-ascii?Q?oXi1UraJnOoGPpZoLudd/lZLb+t1LPGbETaVHGsffHR7DxPKycrYs5vxn3YN?=
 =?us-ascii?Q?WgwXrB+/Rsbquwz87bIdS/aVJHqEJWsGVMOJZMFEe3cLy+mvAg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6CnL0xn3aJIozfqKCHBjnErgBfcx0p5jDOkFMKbPhU1nr0CJZg0FYfv2C7bN?=
 =?us-ascii?Q?0YTAVzYqYR46uc8tVVsO93w5KnBgQx80X+bGk82va4NCYPtMrvxpZK4q2Llz?=
 =?us-ascii?Q?WQ8JQvxhf1bh3v9yJg597CnHWwCHAbchKyEXnjh9AxtJnkNnsoUcVZUY3nsl?=
 =?us-ascii?Q?g2AUrYDC05UI38AOY+CpNpfX/hYgWOY6NgiPU8Wg9cX735o6iPV3GxgUtlaM?=
 =?us-ascii?Q?38f1pFpgAKd79KQfhJH1zmDPC0H41U5Y4TvXJDBORLBuFe+/tvpfOHN8RLQb?=
 =?us-ascii?Q?jvV2bghsjlJvPaGfe4AjmiTLm/4LmfFh1hHsD/rU6W7vH4PqZwOVHnBHazDK?=
 =?us-ascii?Q?aZ0H+SR5uCD2HVWY7pBJFNydZ0Bvh8OeGB0+QWohvEHDqQCzkFXS8kUhH10V?=
 =?us-ascii?Q?y7GAuTK1Ba9YJNmq2Ru6AXTf72lwtpQ3CzLz7siMMGpAQPEGAfn6aNezF9Mu?=
 =?us-ascii?Q?T+mumydaOPV3b2Ac7UfLVzgKwsEYq5+PNdsj0rb6QTmdU2ITVBn5mlzXp64a?=
 =?us-ascii?Q?aTVF5liSCkmI0gKGLyF3pMA8qw526aWQGfqmL9Vp8xMnVPPu+eh7rkcB43Xb?=
 =?us-ascii?Q?QBSA8k3Ze41lolnZngsOTLYgpxF4esml/HQhObMZvi8V2sqHgj3KFbsIHTxr?=
 =?us-ascii?Q?u9+KgDY/AxOLR+jI6WYdNeQceW3dj7dRRFVsH7ykeGCOyKeydxJxF0FsSztw?=
 =?us-ascii?Q?xb634FiPhJ/H//703RYgZ5rf/ZT/j0gmpzB9g77chLP4ieS7VL0IDx12WyHi?=
 =?us-ascii?Q?5mnJnX0w2mxAgRB9a6gXs1EOj+aLWWHjCTF8A+9QUkYLnvZSV4UWl0OW6GiH?=
 =?us-ascii?Q?uIJAgUZW+V1xCQdCbZ2Db/hcPoCAWceM1ff6/2tvm6P/x1h286HiZk/TIXqN?=
 =?us-ascii?Q?pD6YSgwklpxm6RnfsTju4TF+FgjXPYJXtWI24hPUJGIPvVTfM3n3eOdOoBzh?=
 =?us-ascii?Q?s7GrwLNY7TlgHEDNBVizl6ytSO2bwFPw5Vb59hGk1HSfxKJNX4qYlRJXnO9S?=
 =?us-ascii?Q?PCduQBVK6SSK2KmFODsnWBHOrMWs9O1lZgWAW13FP8PmNOHpm2mlONo2WfD1?=
 =?us-ascii?Q?aMQlD+tS9QEFoL+eoVnpaopPolpDk3Ccb9229aGCTNiOGtlArrFPYATfdMkN?=
 =?us-ascii?Q?l8xGAEckPrCVZPlrLEgn4hXuXH3u9HgzLN4B3rVYhMZyBH6O+YJ0Zu6QZye2?=
 =?us-ascii?Q?KFYkeMBVEZe5wljo8FE3J18/g1wHKj2jcX2X+jO2VPPKelChATFCgmDRQnrN?=
 =?us-ascii?Q?r/Honu89pfy8+rGhNu8TbyV910kVQ8Xhxz7yx9B369mt/yQzP0YwtcLBtjZ+?=
 =?us-ascii?Q?tX8a5C5LDIw1fOPM5dW1P+PLi4VvlggDOSr+eCUihRLI0bHI0lQMV6YFrNtT?=
 =?us-ascii?Q?RUbCd5HHAWtK82upm/EriWrxmLH5ogn0JPgM2NfmwopWgW0TvHErLbYRkUGK?=
 =?us-ascii?Q?CgHBa18g3VotpdwF+sbloPldfa9hFXK9lRXFAXGypxp+IWR5dCaaAGg3/8Zk?=
 =?us-ascii?Q?ZXDXJK67wfGsVYTTOmiQjEMUQeSlNhvMr1cLrDu+ZpdeiU2TR2Ob5TMxcLwk?=
 =?us-ascii?Q?JaESj5zh2ToYeOQQPfJESdQbF4ylMHruZIt7CIR3?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b418e2-fb2e-4203-546f-08dd0de63392
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 06:47:31.4900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0S4vEATJdo4mIK5oStAbxihUJBGfUbql9BvzTIBFoQDMqT2aVJ8RAMAnpe19EAkwHkpB33BOcBSuT9PE3N5cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6953



> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Tuesday, November 26, 2024 1:17 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: o.rempel@pengutronix.de; kernel@pengutronix.de; andi.shyti@kernel.org=
;
> shawnguo@kernel.org; s.hauer@pengutronix.de; festevam@gmail.com;
> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] i2c: imx: support DMA defer probing
>=20
> On Mon, Nov 25, 2024 at 09:52:43PM +0800, carlos.song@nxp.com wrote:
> > From: Carlos Song <carlos.song@nxp.com>
> >
> > Return -EPROBE_DEFER when dma_request_slave_channel() because DMA
> > driver have not ready yet.
>=20
> wrap at 75 char.
>=20

Will fix it at V2.
> >
> > Move i2c_imx_dma_request() before registering I2C adapter to avoid
> > infinite loop of .probe() calls to the same driver, see "e8c220fac415
> > Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
> > and "Documentation/driver-api/driver-model/driver.rst".
> >
> > Use CPU mode to avoid stuck registering i2c adapter when DMA resources
> > are unavailable.
> >
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 21 +++++++++++++--------
> >  1 file changed, 13 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx.c
> > b/drivers/i2c/busses/i2c-imx.c index 5ed4cb61e262..ee7070ee9e6e 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct
> > imx_i2c_struct *i2c_imx)  }
> >
> >  /* Functions for DMA support */
> > -static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
> > -						dma_addr_t phy_addr)
> > +static int i2c_imx_dma_request(struct device *dev, dma_addr_t
> > +phy_addr)
> >  {
>=20
> Not sure why you change "struct imx_i2c_struct *i2c_imx" to "struct devic=
e
> *dev"
>=20
Yes, you are right. I really made the redundant fixes. I just need to using=
 this change.
...
/* Functions for DMA support */
-static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
+static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
                                                dma_addr_t phy_addr)

-       struct device *dev =3D &i2c_imx->adapter.dev;
+       struct device *dev =3D i2c_imx->adapter.dev.parent;
...

I will send V2 and fix this.

> > +	struct imx_i2c_struct *i2c_imx =3D dev_get_drvdata(dev);
> >  	struct imx_i2c_dma *dma;
> >  	struct dma_slave_config dma_sconfig;
> > -	struct device *dev =3D &i2c_imx->adapter.dev;
> >  	int ret;
> >
> >  	dma =3D devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
> >  	if (!dma)
> > -		return;
> > +		return -ENOMEM;
> >
> >  	dma->chan_tx =3D dma_request_chan(dev, "tx");
> >  	if (IS_ERR(dma->chan_tx)) {
> > @@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct
> imx_i2c_struct *i2c_imx,
> >  	dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
> >  		dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
> >
> > -	return;
> > +	return 0;
> >
> >  fail_rx:
> >  	dma_release_channel(dma->chan_rx);
> > @@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct
> imx_i2c_struct *i2c_imx,
> >  	dma_release_channel(dma->chan_tx);
> >  fail_al:
> >  	devm_kfree(dev, dma);
> > +
> > +	return ret;
> >  }
> >
> >  static void i2c_imx_dma_callback(void *arg) @@ -1803,6 +1804,13 @@
> > static int i2c_imx_probe(struct platform_device *pdev)
> >  	if (ret =3D=3D -EPROBE_DEFER)
> >  		goto clk_notifier_unregister;
> >
> > +	/* Init DMA config if supported */
> > +	ret =3D i2c_imx_dma_request(&pdev->dev, phy_addr);
> > +	if (ret =3D=3D -EPROBE_DEFER) {
> > +		dev_err(&pdev->dev, "DMA not ready, go defer probe!\n");
> > +		goto clk_notifier_unregister;
> > +	}
> > +
> >  	/* Add I2C adapter */
> >  	ret =3D i2c_add_numbered_adapter(&i2c_imx->adapter);
> >  	if (ret < 0)
> > @@ -1817,9 +1825,6 @@ static int i2c_imx_probe(struct platform_device
> *pdev)
> >  		i2c_imx->adapter.name);
> >  	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
> >
> > -	/* Init DMA config if supported */
> > -	i2c_imx_dma_request(i2c_imx, phy_addr);
> > -
> >  	return 0;   /* Return OK */
> >
> >  clk_notifier_unregister:
> > --
> > 2.34.1
> >

