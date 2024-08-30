Return-Path: <linux-i2c+bounces-5953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CD9965C1D
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 10:53:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AD081F22326
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Aug 2024 08:53:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2389C16DC34;
	Fri, 30 Aug 2024 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Uf0hAkPs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0268B13635E;
	Fri, 30 Aug 2024 08:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007986; cv=fail; b=WTk40Pqsd6RbIQfaQYJi+G5WrQ9b6Noa5T3Y3WAKc58IvgpIZxFYgyrD5zBBIPCqIHpT0gjH2s/fG+3TgqEHrsRNvb5pSYd+bO6oYpgoYUV0xFsg6ab+GLucI8dRA8p8b1xWFGgPP8DC3gqk12cUakKccLbftIMxPTA/WuHh1Iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007986; c=relaxed/simple;
	bh=Hyk1H2/XMv6pe55Q7vrtdMk6kM2wJMEgpxPAi3VYIqw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=eKFqJ7e7iBM2s53hhO6mZdiwdpqPUoLVbW+XrvpagMaQIpPW7C9iWofIOgxxby1lfehh2YcTpeQ43ZFtd7XmtWvdyoDnb5Dt6Lk9XkPOHrPWK0RKWlFaAxrJ8smhk1FjtBR0YKR3BWxPmbTw47gNJOqPQe/fLnaK1ZBbiTkS6V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Uf0hAkPs; arc=fail smtp.client-ip=40.107.20.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zzhdhj+iTQLdVNovwgnt9mjLVkXqIzzfttBPRKYWhyOMOiNxug6NVmvZp+gu6jf9i8G+T5cqtvgAKxMbtNbzl45080U3UcGUozdi74zGz+OD2VjjbPt5xRdhOK6xql9LPInBanzX4TfvleCGhr+L/iqwkLZ/0LSbsQmrUrWiaEHiSzGlTQLhR5FXUCmioggZKm+nE4AnmrokcWSUX+WbVMZmtl3Lub/KbA7aHPEs1z7uw/10Mcjkm0DCr00TkojFcCH1QnKJCUygfgs3CYqzrJUr96Fs40gKfpvoAmm2p6M+vBqc8N3MjVv9KpxEy4EUB1rZG8sTIs+3RxT9s3p70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NQys/gnm/STIiA8jdD6lM+0xkEZ0ziLP6Lwg10NFRlo=;
 b=tY6NOz0muP1feXozkRexL+41INGhfq4aNSN/dHE8O1AhHhTDuImeMcNz1wcYTBgO6/iaEaN0NvlkIiVMHi1ih1Y/pEBBsu15I59n0PgRpxOifRukWaLrpBtzNkaeLNMHhG0qNsa2uQARZYcu0hEs1h0vPh9lI1vNm2EiKYV23Nl7AK6OsNw6fo0Ia7nTaCdpuA4ZABeq6P1Z3GkukdlkfsAr49kjzKI0wBOKDBFn6l7NLG/jqOBPshP3vHA73XtmPNjaVe6ypte22yAD3TNSiaYCjfKdmSESWdIbkc5gLygJH5Xz8cIpGIL4tydFX/LFuF5VZPz9vWf4A1OukGlosQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NQys/gnm/STIiA8jdD6lM+0xkEZ0ziLP6Lwg10NFRlo=;
 b=Uf0hAkPsPAOa/ebtJNGs0E/D0AAMddNxKmudNWoxWunsVAZ+D+QNIBLU5N1n3xHp6dJdWss1IQKBEA0GGEZlK+n30eOaUfLvBJUPcR9mHe4kn9s8W754Pbbu7NKdsO8HOqslg7fIh9VZJE4/BXzBqQYxRjSUmdWq6vEvMwOTr4OH9+Ky1LZss/m6PhZtkuyr0DuYz7HBzd1xAF3Jpr3hEwlEfV9lXQ6q337cZxXR53Lpbzb20Beut3tJD8tlHSeFsEemd8jN4zFHxvev0qrKa4DDwbXpRDx04VEL8ys4HwEINtN6/rOJ6wMVBVaKMfEZvVmfkijR0vlb+MqrnN70Qw==
Received: from DB7PR04MB5003.eurprd04.prod.outlook.com (2603:10a6:10:1a::19)
 by VI1PR04MB9785.eurprd04.prod.outlook.com (2603:10a6:800:1dc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Fri, 30 Aug
 2024 08:53:01 +0000
Received: from DB7PR04MB5003.eurprd04.prod.outlook.com
 ([fe80::68ea:5937:4fa7:db2b]) by DB7PR04MB5003.eurprd04.prod.outlook.com
 ([fe80::68ea:5937:4fa7:db2b%5]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 08:53:01 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Stefan Wahren <wahrenst@gmx.net>, Aisheng Dong <aisheng.dong@nxp.com>,
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>
CC: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 4/5] i2c: imx-lpi2c: improve i2c driver probe
 priority
Thread-Topic: [EXT] Re: [PATCH 4/5] i2c: imx-lpi2c: improve i2c driver probe
 priority
Thread-Index: AQHa+fXUwthV+Zh2hk2uvyNG6aoBGrI+BQeAgAE7teA=
Date: Fri, 30 Aug 2024 08:53:01 +0000
Message-ID:
 <DB7PR04MB5003297FAC3474F41638C50AE8972@DB7PR04MB5003.eurprd04.prod.outlook.com>
References: <20240829093722.2714921-1-carlos.song@nxp.com>
 <20240829093722.2714921-4-carlos.song@nxp.com>
 <fce999af-3613-4704-81a8-048159288b59@gmx.net>
In-Reply-To: <fce999af-3613-4704-81a8-048159288b59@gmx.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB5003:EE_|VI1PR04MB9785:EE_
x-ms-office365-filtering-correlation-id: bd6195af-d28d-4524-fa5c-08dcc8d12770
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?j6hdUVPjzF8SQesyMz3j6GEd+hwQ2TDhRpzHCAuhUPq++cmfxJQnkEOHrZEU?=
 =?us-ascii?Q?ph+zHDblQn+KZUPeoJW7wVO6LQvsFQckLuenSzn3qtkmFTG8ncDZtLglUy2z?=
 =?us-ascii?Q?6CUdKrSv1oM/TGzYAOCG3npluiXZBOb5/24PGnl/IIRKNucQutxGnZosw4BG?=
 =?us-ascii?Q?Vx/ktDXaC8+S+YZ3nbxDWS6RTImrT45LNJuuvhXD/c6xbhz14v7fnrR+om8z?=
 =?us-ascii?Q?ar+w1SwKQfbJuOGiPOhTu82/ko8qsWUKQMwaw39zedoFoqciwKdQECQ5PJkq?=
 =?us-ascii?Q?afz2Lh4xSH6F3rSWG1lDXT6hlZDMOs0v2tniQvPdZVW4Gwjm7XhB/VHcfrFi?=
 =?us-ascii?Q?yl90d2vif8l1pCbolp11a0+6+Sc8xGmN56155zHIH+POqUL0GKx5YozaEehA?=
 =?us-ascii?Q?p8eTy/6qXBOgpN9wi59XgNWPTnO3oJWrw8nr9pHxFK8v933/ysx7ZTPjYR/5?=
 =?us-ascii?Q?JLrxSfaJddlUfFoghNGgXRzrQlJgmaD0pEx6fOcHcHBJsXY6H6yyjsLaFUYa?=
 =?us-ascii?Q?Wr0bgMWfZ54li267s3c7ZVykrMaeda6UyGOsWQL87e1ifdcDviYJDw063QXx?=
 =?us-ascii?Q?iu02V8Dnc9jw7LPp84Q0LzNrxY0AAdZGtIyCMFr8c/b4FmAf6x5p3oRgY7Wd?=
 =?us-ascii?Q?+qILhZbfF8rsV74caabRzIFl4/fBJRPhHwYwQptXR9Jr+YsPdMoOkylSd3GN?=
 =?us-ascii?Q?NPXlFmZ5DeKnfV8bUSy9XFnLRVI6wLo0Pgc7sJiT0YVhh5li3XMFo5G+r2d+?=
 =?us-ascii?Q?poUetGyIIMztMVUAoIT2e8SWSrflKzuv5XlWfS87tdgVtSJ9DY+Yzdp4l7Zg?=
 =?us-ascii?Q?lu6n2OcJZ+dHLdNH+V7ZkK1JMfCAd3A8MfkeAlrHdZok5SXsddW+ivTe0svB?=
 =?us-ascii?Q?81TAK8gE0wVTd9mzVMqfG531uajl4sIGXhF/HTz21bTxPL5Z02xoe9sGljb+?=
 =?us-ascii?Q?ozSnqX68kteoD2HYGyVNG8LcadVt06XbS5CAuelXNwpF99bBh6Iftcg2Dltj?=
 =?us-ascii?Q?K3O4tr3b1aF2caqUqOEzqtM8bCmpGQS5pqsJ+NLvbgu1JT473Ft7KkoDrMiT?=
 =?us-ascii?Q?DiM4h4josirHLgewzg9BLAs0fcfl/vdYngjoqTwlQkW7pcNdEFEZy4lOOaY0?=
 =?us-ascii?Q?UCJHJYAWeNgzSQXMA6qQ/L9UTUFylYE+fWhS6UsohXhtD9xNJtXEwitkvCyw?=
 =?us-ascii?Q?3x48uueLJl7uCTo6gCYDyhH3Z5d8/I7GDzKdN/fXdGhpl1T6g69/qJEC5UJu?=
 =?us-ascii?Q?68LQz5chAcYQRGI/lcL2UnVIXivSymk5/55tAz4vrecffACst6/eAiCnHPAZ?=
 =?us-ascii?Q?UVE6+17PlPzvyHyPustIkncomkVnRZWWZ9jDbk8eCB2ch8dpTp6UAJSY4LoM?=
 =?us-ascii?Q?dGTles4+sGynLBT+CJbC/frGgE5ZI7t4O5Ksq3olBPmunrRWQg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5003.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sTSFRGoj4QmQoRbY4k8plCBYnpSZ08osxXDTcmITJ5hN6AuAQfrS1FKAok6f?=
 =?us-ascii?Q?uk2g+gP3vaQA9UXF9uzgqWpLpEslaP3LbLnvTpfm5Om52c/KEU/L1CGXwDhy?=
 =?us-ascii?Q?0In59+5Qw+ZpcslAY3GRzD4J3wL9wXel4cF1Iu0UCCcJcWqF0vysN5x0lLX7?=
 =?us-ascii?Q?z7i6AOk/3ek0i9a+tkds2TgY8/J03MTEMN8Cq7kcLy9AuiNjc1TnE6YO/AsQ?=
 =?us-ascii?Q?eN9AaJhFRjwLYPdOS7YRzmbgeI85kSiwLxaX5KEd+rBse8oqOuHtM3ZmmOYl?=
 =?us-ascii?Q?dB5AGoFbnmR1j7jRsxiQotDBM2epWs3KajgTfjFuPBrG//QvQfmnavIbBmpN?=
 =?us-ascii?Q?3WlCwt5Pudyp6HOeleR+fC7JN2Cg5sH5Ui6dvp042ASwZujP+7xV+j/TM5S0?=
 =?us-ascii?Q?PrIuyaKo86Obpx+nHrHpyPlw4rc9PAQFzlegi4xdqv4tbIu2RkYWCXzZaCXm?=
 =?us-ascii?Q?nTmG3Z2FAi20jBb+bkY+4decQmvDHM4sbMm7SmavGV8zC224CtR7oZDbypgq?=
 =?us-ascii?Q?L2lgCpYirN9m5F4hL3XqCoPjDux3vjz0m6PdvsI8mOsrvfaVHOQSH3fEW+M9?=
 =?us-ascii?Q?YMG2/LIwPHQbTAr4sYzkr3fAGbxth7yXxdXJU6rnvzQWjAx9mD4rPNAnugeE?=
 =?us-ascii?Q?oPC8juuFbLyUc+HaCVDFxFc7SRgdM/uVIP+nYXg6dHjCxtuUvpUGKzXUTzYG?=
 =?us-ascii?Q?RtdWIh2HYdNX1nk0k5vKGYsZhW73ufRAstfW5zPt6eX+wx04ctIEF3QQOXMZ?=
 =?us-ascii?Q?aGYA1wLkVKUezRz61M5UzChStDDh7Wi5G9FzVnbL0Gi5w+tv9C/h8STC024M?=
 =?us-ascii?Q?ihge8hyajTSYps2R04IZmUiVUzEDR1M5rMeMWq2RffzPGHO7njKOXJ/qaQ4d?=
 =?us-ascii?Q?aEnqEhfIihtpvIsXEiqkK5z0WwSd+CWZnq5Za3sT9a1shcnxvhuchD4Gkczm?=
 =?us-ascii?Q?5rp5MAr083y/Bz+VvluVScsK3ig0IqXosiXPcdDAPtZyCSTYlvsCrvnT6U2X?=
 =?us-ascii?Q?Q4SfbR9G2rW69FesPqlwwX+4kR1I0henFApY64sTeYW+f24YJyU+3ck1lKmc?=
 =?us-ascii?Q?sJdtYK6mKHu5LYQ97Li5q3QgJTK+xr9Lfk97YAM0QK4aKvE1zW8xk/yXIFg4?=
 =?us-ascii?Q?eunmNh8FyJxhEO4x4OaENYCaYiUePzS27mtd0fo6/p07A1j+2SyYRA8wOQh8?=
 =?us-ascii?Q?kk8vTZsHHiJoX8UGj11CB/teMySKg2J7sALF/YnWf4ic16Ql+fUmSlhCWxs3?=
 =?us-ascii?Q?qFBl69ztMLD6mB7BEePZdyCDrsdLvXm0bZWJhfN88gGpLZlHdYQlMGrQq5WX?=
 =?us-ascii?Q?NJXcbmynVh3s6DWDspjhHdc9YEzX1gimbMPRt/Fr3+xOpEuIQYDLuQ4vTpX1?=
 =?us-ascii?Q?Nc624ZEK59Blum5N16PYLvz40h/sLO8hsIutFnNT5ca4aIIjyV8/9K3rt1ey?=
 =?us-ascii?Q?+n5vMjanRUdVKRWx1EyGhgWLs2gFy76+b+/OH7CPVMXEhp+RP7blVX/+LiJW?=
 =?us-ascii?Q?lXHDpAriOW0iybZljV3KN6DYyntqYVZ6MxmRRGPDARayCPT3eSCk+27m1sJe?=
 =?us-ascii?Q?v4TW09Wbe1TIOFJ1kFO7bfm9mr0s9Na9H6Rv2vrR?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5003.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd6195af-d28d-4524-fa5c-08dcc8d12770
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2024 08:53:01.4832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x+ByY87dOVUyDO8fbhY5iW/iXPuMx5YmxhdnDn0BgWECsQ26k8pS/gOnc6oDX+G9d1fow+rfGPCEF7R8P+DOpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9785



> -----Original Message-----
> From: Stefan Wahren <wahrenst@gmx.net>
> Sent: Thursday, August 29, 2024 6:16 PM
> To: Carlos Song <carlos.song@nxp.com>; Aisheng Dong
> <aisheng.dong@nxp.com>; andi.shyti@kernel.org; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com
> Cc: linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH 4/5] i2c: imx-lpi2c: improve i2c driver probe p=
riority
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Carlos,
>=20
> Am 29.08.24 um 11:37 schrieb carlos.song@nxp.com:
> > From: Carlos Song <carlos.song@nxp.com>
> >
> > Some i2c devices such as PMICs need i2c bus available early.
> > Use subsys_initcall to improve i2c driver probe priority.
> thanks for providing this patch.
>=20
> Please try to be more specific, which devices/platform has been effected =
by this
> issue. It would be nice to provide to kind of link/reference/discussion.
>
Hi, Thanks you!

Some I2C peripherals, like PMICs for voltage and power supply adjustment, n=
eed to be probed early
in the boot process to configure the system. Additionally, some boards have=
 switches ,where some device need to be
chosen by a GPIO expander manipulating the corresponding GPIO pad. So GPIO =
expander also needs to be probed early
before these switched devices' driver probing. To guarantee their correct f=
unction, this patch was introduced.

This patch has been in our local repository for a long time, so I don't fin=
d any detailed documentation about its purpose or the platforms it affects.
Sorry about it. Since I2C is an important basic bus, many devices rely on i=
t, so probed early seems reasonable, then I send it out.

> Best regards
> >
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   drivers/i2c/busses/i2c-imx-lpi2c.c | 12 +++++++++++-
> >   1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index 0159ade235ef..210d505db76d 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -1487,7 +1487,17 @@ static struct platform_driver lpi2c_imx_driver =
=3D {
> >       },
> >   };
> >
> > -module_platform_driver(lpi2c_imx_driver);
> > +static int __init lpi2c_imx_init(void) {
> > +     return platform_driver_register(&lpi2c_imx_driver);
> > +}
> > +subsys_initcall(lpi2c_imx_init);
> > +
> > +static void __exit lpi2c_imx_exit(void) {
> > +     platform_driver_unregister(&lpi2c_imx_driver);
> > +}
> > +module_exit(lpi2c_imx_exit);
> >
> >   MODULE_AUTHOR("Gao Pan <pandy.gao@nxp.com>");
> >   MODULE_DESCRIPTION("I2C adapter driver for LPI2C bus");


