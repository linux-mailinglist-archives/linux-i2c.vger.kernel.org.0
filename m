Return-Path: <linux-i2c+bounces-8648-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D999F8C3B
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 07:00:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 948857A0285
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 06:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECDB4199E84;
	Fri, 20 Dec 2024 05:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jkKAI8FD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2077.outbound.protection.outlook.com [40.107.22.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26E441442F2;
	Fri, 20 Dec 2024 05:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734674384; cv=fail; b=PIswnWvbFwDezkwGk+ph+3BQgP+sPBHz+adnhgBYhM5/OY8EOcqmqAhwi3XIPQIycC3Wzm3FjS5lncniQjGmakesHBaK+D7e9YGq14Q6HNHzQ4eUyvMFhyEiG+ud9YLVdCKybTEx5tVkwtXJjRZwFGGpPSVI9iHHVaauBg6/If0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734674384; c=relaxed/simple;
	bh=v2K0WehWmG4o3y5Dch0fCEghXSOPPhAO5Ga8fnPVZsQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SyUyjHSuTE/F/jVAilq3Vpd97M7lgzKA8WhlD2SL0LsGDasRe/eHhuDHLNteeKQ0QxBKy5DCYA+f7X2fmh2YHlWoC1KZfuRHyw1EMaZSloqBbIpuR95WGQwCtpZ/LnMs1jQP070S7yo5FGNIDb4rfUCYnIdDvDsd8kx/fPsXtfE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jkKAI8FD; arc=fail smtp.client-ip=40.107.22.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D0qijIH+Swe3MFbn/okRQPOJFwc7SOnb/b2e5z4ctpeNmFogfgAcBzn2U3QRefB72vlNHDoxu7kAZD0nYYNob6sU+oLZgtpWyPXSQx7id5EgW74exYryhI9LJ24x4yPUmeugdgdCPsMNsHedHL9fpuhTjFxtzRg+K6xfDpVMWDcdqZ7dnqc0ajhzdLGCqxfWDcArm7BtYxxsOoGOdYWGONx4ZLiRat/tzt0hX210mEGB6OFU7/zITaCWbHj2wtTMsVb/Mv5YMsIM0LRAk5UdXnq/UNUwddihlPA2okV9C9wTraAewfZvVPTJVBi1PZO29LbwJ9uH0jkOw5llKqcZEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1L2G8JB77d38ETNx4IbKVjXNlJVWYLiXYeR3EJslE4=;
 b=p5cs4STBcqg5z5Fqw2C7zA22wR1OiymqXWGt5CAE4Eoa5gB/shWNy7DNfNvfIrgSkkQP9NXl2WkSEFg8s4e+e7yKAVInCMTqHygOg/5cQC0KExdjss1AfR2mDuQ4sWOzN6qkK4Yqz6dBORhqgpCt+8sZT5B8y5YJcEej4AxKFrUcoS+dSPY09NtPoScdzDFe4oYnKLvlIMaBYAHvYy859V15TZxf7WMK7UfLv2sju/7MXRcLNQ1AMpc3RYaGkh+vxwOpngXWAUKBKS8CUcrD6Es9bbJfZv+VBcIbz96bezgOCuejPsRWHuR9ijj5PjkmxGLGYui4lCt4TTGMJET8Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1L2G8JB77d38ETNx4IbKVjXNlJVWYLiXYeR3EJslE4=;
 b=jkKAI8FDrtovPPznLO+C4bQ/0XSH4GLq+2DyBlMJQoVQ/+gH5zotgU6VlUNMv3xBvDWjbWz3z10PsyBYKU5PZ/Wzrx8TW85Q+7RAipl/xPqvX5nRx3/xGfg8yTMioEYuqtDMiNcNZu/qpBm9Qzejj0m3D3zdfJL+fYngJ8TiDm66E8Z7rCxAPqmass3mGg6T1oBo2kttv2aeibE2kLwgdx55+Fs4bU7S8yel6CuTdqiiFlsR79avAFFmSaEvUHyO0VyCJXbzXCpQ71yLNfhxGrV3YJhFzWPXsg7S7JRTBpCCPVhy5Dwfy2+F4BHn2FbMRKZPny6LR9NUqwztlzwrqw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DBBPR04MB7753.eurprd04.prod.outlook.com (2603:10a6:10:1e1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 05:59:38 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 05:59:38 +0000
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
Thread-Index: AQHbUqRa55S7HlSjEEWdB1QSFj/Jrw==
Date: Fri, 20 Dec 2024 05:59:38 +0000
Message-ID:
 <AM0PR0402MB3937347200BF1967EB677123E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241218043541.143194-1-carlos.song@nxp.com>
 <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <Z2UBfcq6pE-JMUrb@pengutronix.de>
In-Reply-To: <Z2UBfcq6pE-JMUrb@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|DBBPR04MB7753:EE_
x-ms-office365-filtering-correlation-id: 9cf4be81-7367-455c-85cf-08dd20bb7d2e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NTq2GNYOyAK+EdP1h63VteMUdo4HzxpOxZmujzyJzNN3dIjO52DUIH0l7XwG?=
 =?us-ascii?Q?rx5KOo190skRr4P9QSGYuDMbLwZKOITvfBNWZeV2Wn5atb0ggiGHzpPNRYOd?=
 =?us-ascii?Q?AZobqBpM6rZYDuNKzylszBuuGAsJrDOSP2C0EDBuPoHQdehY6gJSy2gu3Ng9?=
 =?us-ascii?Q?yTYbFJPpiWR6o1BnBlvitRAqSkPlwygVBcx+jcOtpVuaDbF/naX9iYnYFTQN?=
 =?us-ascii?Q?7M/MG9tEi4UpnMo94BJqqDkMbgBxeeIqUfaCdTxNKqJF0LJC1VILXbD7WZcg?=
 =?us-ascii?Q?g/PNYtXVDJNUTTEElTZje40hwX3OsoWE4ZHJ0+kjlooSWGxjKJygyAotGnHc?=
 =?us-ascii?Q?G30ciDdnr7ApLw5hslveFuTTbZdiwSQTVgtvnW0FfWP+hQsIZJXs2nkscrsW?=
 =?us-ascii?Q?QINV2oa+GYVyxTjKstZHBq6eA6Qggk6fygJRzCRUDRE3yZ/JsPnZ63NSMqZm?=
 =?us-ascii?Q?YJhYny6feCvTSuSFJg1Yv7PM2SCYMEYwY2bkRaDWVcU1rNbl71Vsn6nlhmvo?=
 =?us-ascii?Q?RaH/hQJ17g5Y8GtC7g9QNc4GB3BMuinotE8RfkxvoFFB91ESlHFXV5do4WBq?=
 =?us-ascii?Q?KQKMOkLOy8NB5LMYyQkziXlB8UWyJaFcugrAT4vUjgs+yEM9R0jnZqWdQ4vD?=
 =?us-ascii?Q?NizDaiVcZVYt4WBbt+r55e1YKz7zR6moQJn3dDgL6gQgoMNjdP1070cT6iID?=
 =?us-ascii?Q?DzyHCALtajDwLDVBUxrh+NrdGuDP9PceT8KOo+oBUV9/f1QFfsKZgDxochpl?=
 =?us-ascii?Q?P2czzITtHJgGQikTUPElNUo8ozT/aqT4gW/uvalV5wYzJawUhhMU7P3h/7yu?=
 =?us-ascii?Q?aaXXUmSLD53H8HpcjODjseJ4QbAscrtzKkpfoDptFWQn/UzFSnzECxDxe3Ht?=
 =?us-ascii?Q?O+Zptg49TZl2u07dlLu31ybg9+BeFJ/kXxQAHWN1DAFvuD8u6mN+SMcfzkiJ?=
 =?us-ascii?Q?k5JpZ/sbVWX0oeAQ7ypThX/WafxPjco1Mq9nX+dSc8RWOwyrExAOa+Bbgk6U?=
 =?us-ascii?Q?QFHiw4RzU2cEAQoTGjx01ofDJotvEf5F+Tz/TFAzhIVGw3MakW0QXEEMLS4G?=
 =?us-ascii?Q?GUxCRzTwTO6Zv5q6W/3lkyRykUzVdLaSrG+QSNmn6snTODHSx1HMCq4pBJux?=
 =?us-ascii?Q?uIv2eWdZuoKnh2QjjPSkkIsjiS61lOY2wHpKwyrmuUDbktDfRip3AiFR+Hgx?=
 =?us-ascii?Q?DKokz6fOSUbPsQg0K1REtEOZ74xiWfxw44fHJ0BBmRjHCg3291E6kAF+ofJ6?=
 =?us-ascii?Q?lw/NFCI0SjL/6Glj+i7bYhn970EG9hDyhqTsoJVkS7yBhXfg7GRjq/cNxavX?=
 =?us-ascii?Q?Yhr6CoZkssK/Zkh2y/4PIsD78sexyVPJF5XXigGzRaDU01T326qn6b5Pk5PE?=
 =?us-ascii?Q?keR4hTyEMQx7gaz0ze1mIj3bHh56?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?XzqofyK/R9P4QGOp2DJQ/a1fkR4vfJf7uMa9essb5sVjf8HpG97Db35LVEYi?=
 =?us-ascii?Q?LAocxg3L3ATtsGVhIP7LbtQYBE4gTqePK1qBgjh+se8Q8V0Wac5ZOPdBxBMQ?=
 =?us-ascii?Q?0ZHx0jN2iykDeWjIBKvr9Eq2pb/f/nSAZ4ps5LNpj4KWEHO7vpNfFBzxoNW9?=
 =?us-ascii?Q?+xaLxngQ8G5PUYtkk+E/+1UtQlyJe52fQUc9l/eRXBnXatrbI1UIYtQm5psz?=
 =?us-ascii?Q?TN+alZjPshyZXvze6YuXsEVK7XhGpMc5coJT3f+OYIM0fI3aR2VwwoZlTYKR?=
 =?us-ascii?Q?gZVU0RZFgPq/Cjr+j2UcYHaH2rHvyzgGpUarDq4F/1nkQbUpH8ebfmWxk27j?=
 =?us-ascii?Q?y5WB4tpbzCqsyJ2X6CUb9Z5sEmnohSJVYeE8YngkhzXme46qtPiZj2yeSChw?=
 =?us-ascii?Q?zU2en8Y9kBW3BgIklBZ3tlq59Vg2xucaJAJSbz71rArox5U0MD34eyVOW2u7?=
 =?us-ascii?Q?etAjxsOiOLCSyQGfiRybzMJgPeuen5tAxfhlCU4snc0Ah9LalxDenurYNVO9?=
 =?us-ascii?Q?EmBe8jFLe2UqtrUzevRB+wcSRfVPNw2xPyHaOfYVQDlxvfq6QxTEfT+kl8gq?=
 =?us-ascii?Q?d/32ta3hhdHjbw71HhsECCShOVdVsDV60FqX5iuNlat7ZXFbHKJ43EUCsHKm?=
 =?us-ascii?Q?/xn9gKOBkZy+JZKuPiM37X4JLDqS+tQpQDKtAUw8ntKloB6RBR1eL7kSl019?=
 =?us-ascii?Q?VzNqxuQcEqTMU/c+vRB1QCKN2loDJb4zOu0F33CoP19+qdxXOxPKt9zo7X1+?=
 =?us-ascii?Q?xLhs6Rlj9YBiETf/s1Z7j/bCiTE2DxC+gEPd84VY5drXW4982DTGQ/PuopEW?=
 =?us-ascii?Q?pmG5XVPFEdE4ztWLMS7cWJDdBHO45js5AXTc71rQzKyB4i/huf4I1U32pcBb?=
 =?us-ascii?Q?R6m01iDQLwOhv0dpYh7XkoBFGDTd0swtw3paEzXt8SX7jVPeonU21m6nKGJd?=
 =?us-ascii?Q?gc5NP6IxAeNWAnYkrwARg0lnuGA12TR4A5Q6C2xj0LYUtJylN7TKJa0Vmb1M?=
 =?us-ascii?Q?D35+4uQ7xkREPkrqv9nHM3MOrT4LMddLBgFFJNJMY3vrMc40qLG5Bxq9f4gw?=
 =?us-ascii?Q?br4epotsSQzLtQZlwg0ZtyfdDbXJkfu19ZdLUmfK1fYxdQ/mnEnsI1aSqxwB?=
 =?us-ascii?Q?FV1exWOPiMNdrcgzQcIEMv48mLxyYWkTQSx9MG/XjiwlMnLmPW3+12JJsyke?=
 =?us-ascii?Q?1navC7NAvDvaiMthX3PSENAredzH5Xgrgke0WV2UvNyIqCRsGoIfh0RI5ii8?=
 =?us-ascii?Q?/Jw3oIEmBl+9T06c7c+GSIh76Gx8bDLYIUdkEDGizPpTNighUhSNLljTb7dy?=
 =?us-ascii?Q?KikOb4+1I2eibioN9x5n8y2tS7PkCPO7sGpojrdjli2meT0AQ1yyzgnVHT+e?=
 =?us-ascii?Q?IOMqQAVHg+lrBknnFL3QvZp4pbwYFKbhpkwNCuWmkTjlhU23QpA6VjFPRcno?=
 =?us-ascii?Q?zr7EMBWU9gXo0GzBj933ftA5RrMy9bGf0+lyaPsE3A4DBF+DbR+an2C3U6GY?=
 =?us-ascii?Q?Rc7o5Y0yZ5IOJuY29hEAgCBoW3EBl49rEjyjINXkfi5XeOlnBIowx00AMVJu?=
 =?us-ascii?Q?RnyzHIlvlMjlSSJ9+fz+XYvx1nwdc4xeCmpl9mWv?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cf4be81-7367-455c-85cf-08dd20bb7d2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 05:59:38.7117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WnQQkvW5skK0XwkY3vf8YcJGEpbmi5LcavelDOcVzdHoeLWnQpspDnCrsWRWhqSie3hwU+wucW8MhN7GrKqSng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7753



> -----Original Message-----
> From: Oleksij Rempel <o.rempel@pengutronix.de>
> Sent: Friday, December 20, 2024 1:33 PM
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
> On Fri, Dec 20, 2024 at 02:45:09AM +0000, Carlos Song wrote:
> >
> >
> > > -----Original Message-----
> > > From: Oleksij Rempel <o.rempel@pengutronix.de>
> > > Sent: Thursday, December 19, 2024 8:23 PM
> > > To: Andi Shyti <andi.shyti@kernel.org>
> > > Cc: Carlos Song <carlos.song@nxp.com>; Frank Li <frank.li@nxp.com>;
> > > kernel@pengutronix.de; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> > > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org;
> > > Clark Wang <xiaoning.wang@nxp.com>; Ahmad Fatoum
> > > <a.fatoum@pengutronix.de>
> > > Subject: [EXT] Re: [PATCH v5] i2c: imx: support DMA defer probing
> > >
> > > Caution: This is an external email. Please take care when clicking
> > > links or opening attachments. When in doubt, report the message
> > > using the 'Report this email' button
> > >
> > >
> > > On Thu, Dec 19, 2024 at 01:02:29PM +0100, Andi Shyti wrote:
> > > > Hi Carlos,
> > > >
> > > > > +   /*
> > > > > +    * Init DMA config if supported, -ENODEV means DMA not enable=
d
> at
> > > > > +    * this platform, that is not a real error, so just remind "o=
nly
> > > > > +    * PIO mode is used". If DMA is enabled, but meet error when
> request
> > > > > +    * DMA channel, error should be showed in probe error log. PI=
O
> mode
> > > > > +    * should be available regardless of DMA.
> > > > > +    */
> > > > > +   ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > > > +   if (ret) {
> > > > > +           if (ret =3D=3D -EPROBE_DEFER)
> > > > > +                   goto clk_notifier_unregister;
> > > > > +           else if (ret =3D=3D -ENODEV)
> > > > > +                   dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > > > > +           else
> > > > > +                   dev_err_probe(&pdev->dev, ret, "Failed to
> > > > > + setup DMA, only use PIO mode\n");
> > > >
> > > > Just for understanding, should we quit in this last case, as well?
> > > >
> > > > Before we were ignoring ENODEV and EPROBE_DEFER, but now you are
> > > > making it clear that other failures like ENOMEM might happen.
> > >
> > > Good point, dev_err_probe() would not print an error in case of
> > > EPROBE_DEFER, but in this case we should only print error and continu=
e with
> PIO.
> > >
> > Hi,
> >
> > Thank you all very much! As I comment at previous mail:
> > DMA mode should be optional for i2c-imx, because i2c-imx can accept
> > DMA mode not enabled, because it still can work in CPU mode.[1]
> > [1]https://l/
> >
> ore.kernel.org%2Fimx%2FAM0PR0402MB39374E34FD6133B5E3D414D7E82F2
> %40AM0P
> >
> R0402MB3937.eurprd04.prod.outlook.com%2F&data=3D05%7C02%7Ccarlos.song
> %40
> >
> nxp.com%7C5bfbfc0a74184fa1620808dd20b7c4db%7C686ea1d3bc2b4c6fa92c
> d99c5
> >
> c301635%7C0%7C0%7C638702695851431182%7CUnknown%7CTWFpbGZsb3d
> 8eyJFbXB0e
> >
> U1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIl
> d
> >
> UIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DF28DC7RUwlqd5OIyh5QMVyqa1%2
> F%2BcX2p%2
> > FsFWftgDaliA%3D&reserved=3D0
> >
> > Also we don't want to annoy current user without DMA[2] [2]
> > https://lore/
> > .kernel.org%2Fimx%2F20241127-analytic-azure-hamster-727fd8-mkl%40peng
> u
> >
> tronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C5bfbfc0a74184fa
> 162
> >
> 0808dd20b7c4db%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638
> 7026958
> >
> 51449521%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiI
> wLjAuM
> >
> DAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%
> 7C&s
> >
> data=3Dy6pkewfVx7Mb0ZrPfRwDdAo69TV1eHOkRMnRq91Ec9Q%3D&reserved=3D0
> >
> > So we make this logic. Anyway we let the I2C controller registered whet=
her
> DMA is available or not(except defer probe).
> > Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing happened i=
f
> DMA is defer probed or not enabled(This is an expected).
> > However we still need i2c DMA status is known when meet an unexpected
> error, so we use dev_err_probe() to print error.
>
> Why dev_err_probe() instead of dev_err()?
>
Hi,
In patch V2 discussion, Marc suggested just return dev_err_probe(), but I d=
on't accept it so I choose to use dev_err_probe() to print error in V3.[1]
In this case, the two APIs have the same function, do you mean dev_err() is=
 more suitable?

[1]https://lore.kernel.org/imx/AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@AM0=
PR0402MB3937.eurprd04.prod.outlook.com/#t
> --
> Pengutronix e.K.                           |
> |
> Steuerwalder Str. 21                       |
> http://www.pen/
> gutronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7C5bfbfc0a7418
> 4fa1620808dd20b7c4db%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C638702695851464654%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO
> nRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%
> 3D%3D%7C0%7C%7C%7C&sdata=3DX2AuLskzqYH9g34wfb4%2B%2Bs2OdZEW3q5
> i49V8OwKmgtw%3D&reserved=3D0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |

