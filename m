Return-Path: <linux-i2c+bounces-8650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D25899F8CF4
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 07:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 505201880905
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 06:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6230D195811;
	Fri, 20 Dec 2024 06:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HqQL7FK7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A567F13B58D;
	Fri, 20 Dec 2024 06:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734677902; cv=fail; b=HW5nb3MSEw71P6jiyqr0TPOcKR54JFPodyYqp7iUoU+lg5jhQQdPUdwKqyjcTrT1iGwNIlea/nCcKjwdWNk8hkCAMZcR4peBNKPCiqkO+7NkO6kSQMnAsSGfNRQXs5xyfmDu3k/kpR5eu9C5OqGTyNCv3XOHZmpuSV9m+QZcfLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734677902; c=relaxed/simple;
	bh=A6HvIJ1LXF//xFcynjWU0RfsFQ7t5MNnL3+iKBloCjM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rlUvV318rv6jY9JT0Qc7Crh9F7ot2WcyQ1mzkUOcRqFywMnHDpDLLhr/+oklqpGzl4iPPh6zgaEaw43zvXRQYEVJx2K0PEtkU10Fp0sR9MzNL9e9p8oqmgJJUwt5wCZ8tylHOWKIbREQrXdGUpjUCyQXIFE34MqDgjDPMzAdrSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HqQL7FK7; arc=fail smtp.client-ip=40.107.21.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QiTgeljGT1YL/O/CJTpYGhdwitb/AWxdb82+mj1/gtfRQQGBx08YaisT4IpVqf70CiOkiJf/Zm0nd8impH/QJuODUMtayZMyUNCS+bBOM0aBlbCgEgfFcxBrMZMxC4yi2baNYk0sS6L93XZ2F1LCwYFKZJ7ONK9AtPpTG/+uTk2IUyGwte8SyDaMLEOdXY2mKM6q5/AMu/v06v7hjM/qEB7TV6WVh2o82BF8ytlDyR3VTq9ziyU4Wyxx1SLjFNkIncf4sEuJS60Ti+bILX6OblApXXAJO+XlN8ZVj3GoXpSAEPt0P+xCp7L/DfiIPOIncTeSxuJzSlUQNsN7miMZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TY81vIHRnBXf+OI+5XhrCOHNSWZ0LTW6G706Yyamms4=;
 b=ySIWfF0YoJWwkKG3QDV0VqPZIQqpt2g1SGEW4SxzX+mrIT6BfLGg4d6womEE+LtdEQUX/uPTsIln5vldy+uRyZoxtUU7gioNf1i0Yy+KIcNdCL0LOpshCp54M7u0TtKHlxmDD/YhBUkq33detYzM/8n4O46e6nTROqZjA0RBiRjFS0uxbYbgDnPJPFLX6hJrQ0z7zjEKSc2e+ljqdPrua1shYNTO1+3Oz3NEKvFumcr1uzLg9IDE0pgbRNsfsZ8pZTFtG8fsK9MXlZwKImJTDdLRLKi7x5lHNeZ6o+TrXHxYOtaS9eJkulQ/y4X8e3vPeXMwBpVppwXRxlZq7Ux1/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TY81vIHRnBXf+OI+5XhrCOHNSWZ0LTW6G706Yyamms4=;
 b=HqQL7FK77ULakP4mP8i75XnRMD3ZXNBCmRknwWsjs6FBTN6RI692pdIOXg+cZ2TfFjNkt/H96ukj9CjAEPhZn71MVPNYOTBDO7ICG9HEz4Y7j7QUtOwIxlxbGtJHo2ow1v3UFY/njS0+ATPunpkRshhxfH09nnpkdx85DQKrBO0+4kjD4uSMb6JP1IkcJtGcgHmrOv2Jm9ScsfaS0E42vr1yqBFc1yb+8Uo3J+l5X02jEeQ44iu3xGTrsOehVKTxUIJsE+hukZA1y63jcwYcbwbwRvhTBEjfCkCpRQXBXkUgsK1SmAzTOWE0e1a6Evw++/TM4LMeGKXMM+CpLXBcnw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by PA1PR04MB10698.eurprd04.prod.outlook.com (2603:10a6:102:492::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 06:58:16 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 06:58:16 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Andi Shyti <andi.shyti@kernel.org>, Frank Li <frank.li@nxp.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Clark Wang <xiaoning.wang@nxp.com>, Ahmad
 Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Index: AQHbUqyLfXdPeS6Lg02Kvo5iqL4MRQ==
Date: Fri, 20 Dec 2024 06:58:16 +0000
Message-ID:
 <AM0PR0402MB393781D3109B1B3FF3C2529FE8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241218043541.143194-1-carlos.song@nxp.com>
 <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UK4rMxrtNsPw5V@pengutronix.de>
In-Reply-To: <Z2UK4rMxrtNsPw5V@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|PA1PR04MB10698:EE_
x-ms-office365-filtering-correlation-id: e030791e-7bd8-477c-2bd6-08dd20c3adc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?+9+QtpI69ecRwBd8jokZxbZbogeM/KDYJeaRj7ykbSReWKs4oq+gHp6w463o?=
 =?us-ascii?Q?CVa1YuBxd35OFCE48OZwh45oBAuOEVIZ4IGYV+0sqcxY9pCZ+f58SSGIZnJW?=
 =?us-ascii?Q?dsH/AztiEz7Oe1Cqg9Qg6vqd2kozJeLLSyHiul4wQdjOLDqgoKFwxunlLr8A?=
 =?us-ascii?Q?woZ6OLEUedimMaIKrxX5l1tmwSKt3hMkRd/PH2LGJ7bHGWB3qu1ca9tA+pJe?=
 =?us-ascii?Q?mJ2OVghPICng8rLkW21BLtJzVEwqemmNSDa6dXM5qTKU/BwTeVqXa5AxpMWN?=
 =?us-ascii?Q?XkW7Z3bxY3+nGQRrHZELtK9npgwU+9zSKCqcl1rmnI/ngk6fUfFdYjsqy+DK?=
 =?us-ascii?Q?qnFrl0ozJUTShys1inBxzaVo7xI9EA54nZCEg5yEWOE5SmPc6kqfoCkjGZSe?=
 =?us-ascii?Q?XhiNUwWqI3UNMkq6dQTiHOVn3DfmxwyVzYL5b29LgZj0vNzZvXJlRyXO+Tby?=
 =?us-ascii?Q?hfprygcLRaqT6OvIUGwRsP8KBryuybxecItNBhqxXpkRUqJF2rZOOLP7x93A?=
 =?us-ascii?Q?DOfVqcpNZbyufmhu0rPlS7JutuOrs81kBuRkooqn35l4GDleJQcELgFJN/dm?=
 =?us-ascii?Q?fc5kZ5M6L1ThrNuNCzbdp7mJCbRc20GzeW1FAUqmNBYu1tjtC7Rn9wtw4xPj?=
 =?us-ascii?Q?QyxgCN9/aCjE4zY6w2uwLWziXR5ak+1cw5QGe+x12bNtEkDnvnrFEl3MNaus?=
 =?us-ascii?Q?yLwZDYOStkQ1y4a4VBT8LWw/llbUiHSPHIgiU/vc3BSQY/6QLL6shP82A4bC?=
 =?us-ascii?Q?aIFXalUDsUwUHDUBEptelyCpvez0FkaEGbWvUmrAUGeFxqG+PJ9kR/lEZlFq?=
 =?us-ascii?Q?506WCOUeBjVzU4/h0hhsSNHAyKOjVUReHQX0NMy+FAYsaf/A7AijCW19SA33?=
 =?us-ascii?Q?CcjTY/gCq7Uu430hfa5VRvF049iZZIAIhCeodrXGY3+tCSEscy3z5Sh0voZk?=
 =?us-ascii?Q?p4xr4WrzL+tpsWiN0Pztf8gFuBKN4szkaLzktYcG2eOJql+wR1ErmeNbtYLC?=
 =?us-ascii?Q?UBXJdhjket3+FY3XVieKraZQjh1fzNII6Sc9FCNMw+7c0PZaeuitw6KI0mwS?=
 =?us-ascii?Q?9yYhfztrSUQRHyLbue+jgKnMdPYJ7UtfPRRRBtxb7bAH/uMhOC7aeF9VOX1l?=
 =?us-ascii?Q?QaIf0i11kQt7WxFSY2UFHBQp+gdszwOrze9ZsJsDbiZirNwXC9Al2EZJpBW8?=
 =?us-ascii?Q?Na9uC8O0rK1pC0QovDHywul25wdhakYI6OyNcshywwLwic+xDJ9eyAZnpytS?=
 =?us-ascii?Q?JVzoqOsu46J/wACDSUpinBBFEG9/+lJBVfvyhVF9rhfWfx6kFR1oS4a7Rh1p?=
 =?us-ascii?Q?A/SFH99+5tyiIXYjJBe/FDpeTic5TI5UTPKsmr+jSsph0KyC171MUSJLRvlk?=
 =?us-ascii?Q?hNn6CZGQ0oGMNMfobhoX7SPBxb35?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?+s66YsRKMdYYXdKuD/K151CvZiAobyPNxYibdN7shJfr4T9rpF0WyxFoB8na?=
 =?us-ascii?Q?ovhffL+ZX+F2nZFdEjQskLBIk4w3+imGFJwLheathFRIRdaU1ZNeNP8FKtOZ?=
 =?us-ascii?Q?TOWfy7dLJzI71FcfgO3v+luO19rr0hTJmhpUoM0lQp4Y0lE8+zd5xEOBX3do?=
 =?us-ascii?Q?WP6QQtDg5yiv/tfNcnm+lJbrLkvIrlzvFDyz2SrqC0Bdf0oiqZAsFCaZZUTK?=
 =?us-ascii?Q?I13HvbaMVs4GIsJTgRHpyAck2TOqjTwO71/DIeQwOyr+wP8xpQfBE+YYgwk7?=
 =?us-ascii?Q?3AtwDT/lyX2vNifUJ29kgXenghh/9KBuvOraQTevXhgV0iTsWulkWSfrFFs+?=
 =?us-ascii?Q?YJ9Z17eRW8PNYsRyygnEAtGVuLJZiUKsudbfOZ3xdHRkUpE5SfgWIwajD/xH?=
 =?us-ascii?Q?l2p1SbMNWFPj6NYxLLEHIbkprJlKnk97zg6K1k8b4ESAbpUiZsLfnFw8ajje?=
 =?us-ascii?Q?fJC+MI9R5DmeZQYuP1SjRCBx8qDFWR96OtGjg706A8P5vIFBIQa04+CiRQX9?=
 =?us-ascii?Q?s50CHCfGLjvbPiF9hAigJjyAEQ6EthvVGAjVSH2noqrCQuhSxKX4Q62JJtZT?=
 =?us-ascii?Q?ATrgHziWESL1hpf3+XHywN1VINpDzHo0nvqXpcc4R/4DsX9Ph4vzhEbuPhyq?=
 =?us-ascii?Q?EC0BbP/TUNDW6sZ5NyWPxeSIwBsBz/LlIYh2Gk0QBbdziOhoRux82L6YfKxc?=
 =?us-ascii?Q?F6ErzPfu69+6cwNhwWnlpNKYZ4spnyxaLeFjXFo2c1WdVjNhkARi3CdUtk5N?=
 =?us-ascii?Q?8aQMWfLG7wKHISFMZAT2hoA7v/f1xu60q7f9Vt3hScHVdIm0kKa5a61JYusy?=
 =?us-ascii?Q?CCKyICCfpxZ4Mxm9XwDiyFm3RCiFthg80EGZ5d32MGZeFYGB/31tHLe/Gytr?=
 =?us-ascii?Q?CTZG0mDFDOGWpx+6MvLwgJzdF+Kt7G3k4LbZgvhTAZKq2IzePIiNFWS4VqFp?=
 =?us-ascii?Q?NZOtF3erffGvksebhBO5Aafbl5tZZxTTwjaajOKToNCvlPJ6VnQVB6Dd8/AE?=
 =?us-ascii?Q?o1mzx+VrTspRoUz38XH6Jp4lYeyn2adp47HefWrmYChQSSXCQC+OSG99J+NW?=
 =?us-ascii?Q?TNbILg7b4vW5qTBGnHZ1rCx+TQcLv6/g0/oo/XqQ7qpIfU+Uwr0Vax+RRRnw?=
 =?us-ascii?Q?KT5SwdSup+KdqWP52x7Xu9xpyePavEAp9m+3gVqnG3hOavR0Imzjsry7Cq8s?=
 =?us-ascii?Q?OQDcfzITDAi/SLzzvdGfD85HRQ+n8SsX7wssdb/xz0K+EYMs1DUrEAuWF6Wt?=
 =?us-ascii?Q?NAAnDWw1rMMwpC5CRh5WZsq8jI5e8HPj/DPTpjTyiHScU2QRFfmb6yq0WA2j?=
 =?us-ascii?Q?cRGPgmTFX4N4LxGilZ0ZSpuDv5Ht3UL3Kb0afOKAvgytZ/PaIhXHnbU3jRXm?=
 =?us-ascii?Q?lHS0l2i+ivdbA9hsCn2miPNDHlDnMs6TLl0BrxiQ9RqpcdvrbBrhvVz4nNTw?=
 =?us-ascii?Q?FjziqUlXyibhNg2H4/t8l04JKKZlTyF8hKWgS0NIm0iwla+Z41pKaA7S6XO8?=
 =?us-ascii?Q?NGCeq1VF+ZXoTjfbKg5pLptVkMyVZRbMCYcGAXW2uu9Ls7DanzGWOFobqZ+6?=
 =?us-ascii?Q?PBFEY9HWiCozLVCA5TFd7Lkqhq3iAti0Zf1rwzGB?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e030791e-7bd8-477c-2bd6-08dd20c3adc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 06:58:16.1610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MFCtINW2CQ5/WMFHCmTTW/WiL6x+bqiMwFw+A3LassS18xmz5JWyXFhYgfO1tDnnOdqT+LFoX0stYhLRCCkk/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10698



> -----Original Message-----
> From: Oleksij Rempel <o.rempel@pengutronix.de>
> Sent: Friday, December 20, 2024 2:13 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Andi Shyti <andi.shyti@kernel.org>; Frank Li <frank.li@nxp.com>;
> kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de;
> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Clark=
 Wang
> <xiaoning.wang@nxp.com>; Ahmad Fatoum <a.fatoum@pengutronix.de>
> Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
>
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>
>
> On Fri, Dec 20, 2024 at 05:59:38AM +0000, Carlos Song wrote:
> > > > So we make this logic. Anyway we let the I2C controller registered
> > > > whether
> > > DMA is available or not(except defer probe).
> > > > Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing
> > > > happened if
> > > DMA is defer probed or not enabled(This is an expected).
> > > > However we still need i2c DMA status is known when meet an
> > > > unexpected
> > > error, so we use dev_err_probe() to print error.
> > >
> > > Why dev_err_probe() instead of dev_err()?
> > >
> > Hi,
> > In patch V2 discussion, Marc suggested just return dev_err_probe(),
> > but I don't accept it so I choose to use dev_err_probe() to print error=
 in V3.[1]
> In this case, the two APIs have the same function, do you mean dev_err() =
is more
> suitable?
>
> Yes, dev_err_probe() should be used in combination with return. For
> example:
>   return dev_err_probe(...);
>
> It will pass the return value on exit of the function and optionally prin=
t of the
> error message if it is not EPROBE_DEFER. Practically it replace commonly =
used
> coding pattern:
>   if (ret =3D=3D -EPROBE_DEFER) {
>     return ret;
>   } else if (ret) {
>     dev_err(..);
>     return ret;
>   }
>
Hi,

Get your good point. I will change my code in V6:
+       ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
+       if (ret) {
+               if (ret =3D=3D -EPROBE_DEFER)
+                       goto clk_notifier_unregister;
+               else if (ret =3D=3D -ENODEV)
+                       dev_dbg(&pdev->dev, "Only use PIO mode\n");
+               else
+                       dev_err(&pdev->dev, "Failed to setup DMA, only use =
PIO mode\n");
+       }

I think this is what you want to see, right?

> --
> Pengutronix e.K.                           |
> |
> Steuerwalder Str. 21                       |
> http://www.pen/
> gutronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C2950266755a
> 241c00a9208dd20bd5cf2%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0
> %7C638702719862691439%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGki
> OnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ
> %3D%3D%7C0%7C%7C%7C&sdata=3DaIuzJP0v5C6HzOCGnCHobK9Llml3thHclTwu
> CjD13IM%3D&reserved=3D0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |

