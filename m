Return-Path: <linux-i2c+bounces-8705-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 087AE9FC4DA
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Dec 2024 11:56:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BBC6188266E
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Dec 2024 10:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D72175562;
	Wed, 25 Dec 2024 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N3cUDAta"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2073.outbound.protection.outlook.com [40.107.103.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4011255896;
	Wed, 25 Dec 2024 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735124205; cv=fail; b=S74tAOxlvrn9eH259GPz8watcM0+oDB1LGAKiWE2QGmbPrgK5p4zEv9CEKmbMR05enVq8CniO6dgOAVufJLgVC8KbIBqMezYvRXGorrbNgbfRu7r6su7pJ0zrJXNkgbLKyc9emYrjLGwAfOu6qnp1FqtVgYDB+YNWYZm5ngdy3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735124205; c=relaxed/simple;
	bh=BqpgVoWIVLV38Qs2/v8SDhMxMHM8Df9uuBNLvvQavIg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=n/seKPHQDGE6YGlp7WupiNDX3Vb3sMfTs5q9pp0mfWn6Qez/I1PVpqWJGtBzwPCp94T+m3r7Z+PdYnHFO5JyCSui+zllf+15EbjklQ28PbViVr6Eg+JLdeuPiCrbAy2/cJCv8mBUAhxmyukG/lDZtXu9D97REkJvHeAKwGqqgtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N3cUDAta; arc=fail smtp.client-ip=40.107.103.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvXZfESqsYb8fgSlHdovnWpcKndo1Fq3SdMaWOL4o2LChGwKrFN4orhZb4PXQBtR+wfxRE+Kj0Bc80ALiF68z2VEuW34olMrSl11i6YPcNayTF+Z2LqxX+x3DdnNdTjI/IwjdeVXn/2LBRT1SbQlHDNS4ZKju3/vIogNs7cguunpqpLEcolkuOBB1xbBRfcTV4mN5xdBt6vpn7W8UEzbJ920VGDXwn4PpWwRqcujNcpwC1SrkQ+Hb4UUi2IBkIZHgTPO9ndPFDNt9PnjSZIt5EXAOX//ihb2Qk+m2+kHnxXl1u9JpuoUOX/F6q2zimaixoUNiAA1jvBVifeNCX5vbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DukUi20ribtoY0zuPUunG62SHCrXAH2H0r6BkF99hRA=;
 b=pcoaqZzdV+U7z0K2Sj6tBsn5jFUZco5xcImBQYpXT2zEXiGEnzqXGTYKPUYhtZM2C5lu1M0eI11CYdHjR2fhrpdSs7TDsIeBGu1Ci2uKjHXCPXVdi71P8mE7bU1bLCE1KVmEGzRBJnYC3vM2Ena5rDvjB1v36hQrua1Q7eBh9wn1LdDTHOgj9zVCP5u4vJH63ItwMnYUPUY4CuYdgDZJEKJTMUlNeP4Riq/MVU3q9UhnnxwPNz+NmdrMBDo8ZsldXdpzcK7vF0H/s8NQpzsFHU9pYBGUnIL1SWPyCGeOUDLfiwdyK/+77oPqNm/0qpci34zwRLjHqjeFEaTEIy2dkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DukUi20ribtoY0zuPUunG62SHCrXAH2H0r6BkF99hRA=;
 b=N3cUDAtaayPXx60PZ/dBNubea2ffDGMy3hG3kg5LFkrxxsG+SPXJ+1gkV+B6SiO+Uxvtyjdj47xezmm9Y1BarymNG10zlehkdJRorANvreGaoUb5aP5gol0Kmx7uFXRqyeMOYPrkV5PApVy53nhY2BEbDiDcHsxukOvhgwGOxqLom58rL+DZhdvIizdxhOUomo67ApNny9AODRDxCuXDQKtrvE4lML6kLjuzMJcpsYbsTt2H7JdyIUSTX/IuT7L6EHeIV3S0PBgn0DSJi7Bku4PBAC9+IoSKU3fb7WZs1p7Z09ujGzFhhxhcdAAL2cPtMeaebWqKG4HsTU5Y9tfLYw==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by GVXPR04MB9760.eurprd04.prod.outlook.com (2603:10a6:150:114::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Wed, 25 Dec
 2024 10:56:34 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.013; Wed, 25 Dec 2024
 10:56:34 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Clark Wang <xiaoning.wang@nxp.com>, Ahmad
 Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v6] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v6] i2c: imx: support DMA defer probing
Thread-Index: AQHbVrup5nlogFqAQUSHF44KCSSX2A==
Date: Wed, 25 Dec 2024 10:56:34 +0000
Message-ID:
 <AM0PR0402MB3937C3087A22A1DB8FAE91ECE80C2@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241223034416.544022-1-carlos.song@nxp.com>
 <gfjir4qyyptxjizkc2k5r2elwn74fndia644evv6acwyuj3fr5@3pl3xt7rqntw>
 <AM0PR0402MB3937905A3108833DD8F52982E8032@AM0PR0402MB3937.eurprd04.prod.outlook.com>
 <ltb3ywaz2req4yqdqmtq4ejbzh4esjszbx4x6ab3k5zmqxhdpg@qqjetty6fs3q>
In-Reply-To: <ltb3ywaz2req4yqdqmtq4ejbzh4esjszbx4x6ab3k5zmqxhdpg@qqjetty6fs3q>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|GVXPR04MB9760:EE_
x-ms-office365-filtering-correlation-id: 02ad3d95-e2b0-4c03-5a7b-08dd24d2cc0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?JFlpuhiOkH8UUsi2OquhlObSpjby6mvWaWFFxusi4wHkfjhB2duAuOmJzFKe?=
 =?us-ascii?Q?Buqy4JZjq2pU8vQXgdQ4VEGWcPexBF+rPPS36TLL7dvtCJmahIZv/2Hwqxsk?=
 =?us-ascii?Q?nnhBumsXpLco7xN/bwvNc19+lZQBVyr9J4BKRn4O8hdPihgwFqWS0zwXk+2G?=
 =?us-ascii?Q?oqOk5bKeaCiH2qKrqhCwtW9OfISGloAYfABGPS0WBhx00R8/gVAI3+dv2l4M?=
 =?us-ascii?Q?3r7BrVfYYtETI8F/frw8kY1EAWavjAvzHAznY24CCZkDimUATjl2mjhtuF2P?=
 =?us-ascii?Q?UZ8+Mpa23hIQFp7ko0omSVKw6iIrAk8K9UJOj4FQIe6+UE/xNYI3uxX9+b92?=
 =?us-ascii?Q?rCxkMZ5nC5AGMAeHtk53VZcFiGQoxB3bzeMLIfDMAPZbUhmRVV+4/OH9smdq?=
 =?us-ascii?Q?R38WjfTUTXDf8ZpzBG9hdJqahexTeUKfqDCcT6f9k7ycEMMu8tV6u5rBiPHG?=
 =?us-ascii?Q?ilSs61ZoLw7M8kpTjJrqUH34O5fdc9BJ/myNs7LKBI9SU9IcYaHJFXLZVVcX?=
 =?us-ascii?Q?7zIH1DY2SWWt0jW5qUEdf4coprEmeaPIRG6HrnYOGQFcqjgvgmpVGHZ7mtwE?=
 =?us-ascii?Q?Drq3oE6pkRege1Esx79/VkSbTxdX22S+QqV7hmLmlyKF28eH46u2UF4aUwzS?=
 =?us-ascii?Q?hbB4S5lmPA2++pPKuVRFvxJx23PIdTYe429wnXd4m7OKbxyPQDOYxbPZM1T7?=
 =?us-ascii?Q?toqLHl35TAx1SIm3jp0xL4sqTaygd2y0bPLPQOCRvEtLmzArsnxtoTRVPEXH?=
 =?us-ascii?Q?FByWrFoWBu6wJ+JDWpJf6z5k7U8G5c94tkfHKYSCca09v3vvm3Mq0sJpHD5v?=
 =?us-ascii?Q?VL8fXa76WAYS7uAqr7mfbS8EAJc7ejXcTGw/cAYJUedC2NvO0t5fG6Bsc4Ix?=
 =?us-ascii?Q?e8WBcF0rZgk6hx7BoCa6o/axCYD/vZfp13lM+gF3G6GNoPMckKkc40wJyrRW?=
 =?us-ascii?Q?Ch3J3Y+SntzOrKSbF9EiprXajdBaDThodZ+TjToz/JYRj27fqlDe5keg084d?=
 =?us-ascii?Q?WpOsA9VELhjUFMU6/87vNM1a6Q61i9sgytiWxH4xpXC/taFWCKYpJ3yzzGKi?=
 =?us-ascii?Q?Z93iWCkIO/Lk2YeLIc6jKpkJkAeX8RRR8PJYUd9OiiplA0ABn0b6UJNdCp77?=
 =?us-ascii?Q?YfOGhk+X4znkk1FYT7ThcN5JADhKWn7TAUGXKXLXjRdpyHBWRwN3RwRpHcdL?=
 =?us-ascii?Q?bUOFydZATmB9A5XjFU6EvxaziS/4P6E+tt4mRjH6LPvF6qMoEHuXtUFLw9Hk?=
 =?us-ascii?Q?yRFBGvVuVgftT2DdV5asdkX6AhjaCmfVa6+DpKrpEga6thzGK48Q9qy8Rhe3?=
 =?us-ascii?Q?n91DtwIE9ec1VVj7uNh0+Amc4TfePoxRUB3JI7lM9sqUzf9vNHAQ/PeN/uIg?=
 =?us-ascii?Q?EQm6YKfaK1LyljX5O9xU6123czQ892XF34AuVam8dkYYAv6PB+Pp1e4UOJlM?=
 =?us-ascii?Q?Uzv9HM80Cob7n4KE4gSpr1WeNLwwWIUq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9DYG0DkjMzdnZzY989MZlngAHjjFSf4AXRSOYe2nudoCH3DQN2v7jiA1OsHL?=
 =?us-ascii?Q?0A89/AZOhGMUB+QBQtOlcNLR/kKULwnFUnaW/14LihJVA2v14JUUwrI/9qZW?=
 =?us-ascii?Q?iT5YctHb1ohYt4mtXhpqepU1qfQMV0ZNc6SA8tH4O+L8fBIDddV8lVYwhSr5?=
 =?us-ascii?Q?mAaUbWY5gv/zIA4uZqazHXu5v9RH3Qn0WZkaDG/0kM1p5KKQYICEAp4FroE4?=
 =?us-ascii?Q?kqv1Rv/p+7oNCv4srt06UL2ASY/JrKxk6Hk6cP5DitSoqveeYsK9wcqJZKGG?=
 =?us-ascii?Q?fT3PVuLZL57xniDEbMYrmav9z7+dgy9ZFzeV8j+pL0SvhNDIInUoSrNzuajQ?=
 =?us-ascii?Q?x0xxrT3SG0DLPiTaWwRfq4aNGIsUjIrVALKJZHzr3rn55EeTz5Mtf9aVvdho?=
 =?us-ascii?Q?Nkpte+SEjaWglYixJD04zFP0WE2aZxh6Yb+xOvGHb5I7fqWBW8pPfWy3xtyA?=
 =?us-ascii?Q?7cwjHgEr7xHqEsI0lk9v2asUjv5ZMgMPWMr2a3KDccsXFmSoliheyT2JdckM?=
 =?us-ascii?Q?UTRYNCMzzDhzG9llMbzy3M7vKPgm+B9RPj3l82NOF6V6xy5rHs99nAChyQxA?=
 =?us-ascii?Q?pgHj87QJbvdk9UDuT7Ki9WmfJLtyqL+qkVaKxPR3Cgeecn9hYnEJp4hrrH4t?=
 =?us-ascii?Q?QRqINNNgYkLzTzNRAsOAwVXY2dLQbf65TDPzy9VF2HIL4KO+NnXZdAnETiOP?=
 =?us-ascii?Q?1Nnju8Yh6gnA6W5A4tL64va8pGZUmdEf1oBJArU2Uib87+RBat60BKln+Zqv?=
 =?us-ascii?Q?x5CqVF632KJM58KNyfGVpK0MUjEVDijo3+j0Ppl9zR6UdQMOVe9YiXLAEj6I?=
 =?us-ascii?Q?eQfwAaEnNkRCOdoCArVn+8AfzGbPta5bn2Y5I1+DRLzgHH/Z7Oc5Xr9YAmd7?=
 =?us-ascii?Q?FyovIQiuK16cN4zYDjPVuN47yGJe+9QJxtOJ+LNpoFBZog4wb6/DdFdLVkSl?=
 =?us-ascii?Q?Q1DrgsVnznIDGLQpk6NbH1ToJ2VNUjiSK0LzD/62Y3Zfjz+SLYv3kAbAbT7S?=
 =?us-ascii?Q?AMbLcRLCr21HZEaA1bj4KjdTpoxwYP6RJOrHw+aPYnUlgMEuh0t0iunrUY3D?=
 =?us-ascii?Q?PHL0iNbpZe2ZK2MpHyNQbfIzCACTIfqv7kFo+uxhArptjPzqVnFEqoEXD+2k?=
 =?us-ascii?Q?7mQY+EjMdw4dnpiYMqn6PAO5CGMjUzXHybxBq8rSlem2mXn/ezjcmX9FPHeR?=
 =?us-ascii?Q?IFX5FRGZGdkkLjEmpcokqxA4vGue3ZHjHBHncRYdY4vdOKJUKE1hSFNnSJ5o?=
 =?us-ascii?Q?qQq4aTVBtzp5yJzfJJ7hVolTYYpjs8r2Gz5bugGeXeIVixo7+DP713yZ3CfY?=
 =?us-ascii?Q?tkRlpUfj/SRdOqf3cTludur/cbeDYQQmfTI6qeLdPC64DZ+XLQ7vQ8aZfipb?=
 =?us-ascii?Q?6GmTdr8LfU20V5juum6VWYKexCKK5XMHL8wYgQjmYIuevBIec2WBaukvR/4d?=
 =?us-ascii?Q?hJ3iZgbWxSUYZa29wsvUgm1Jc3rcU31XN34ivV0WfcG02wqAc1U5pLrbWoc4?=
 =?us-ascii?Q?XRHv6/ZDz2jBZ3j1gwqbTQzIyIHQqRKRvuO/4ocnQw7lP2G73Cd75UPA2oyQ?=
 =?us-ascii?Q?4KyPr6ROC4dxUTfuyRw=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ad3d95-e2b0-4c03-5a7b-08dd24d2cc0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Dec 2024 10:56:34.1726
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iEr+dwX3iupeb/G3PUuyVxrNpiiFXNy0z47VARYQA/Te7CkoqHBJOJShmWZYqCVsMD4oPPS2TnvWi22WsjSDxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9760



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Tuesday, December 24, 2024 4:33 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: o.rempel@pengutronix.de; kernel@pengutronix.de; shawnguo@kernel.org;
> s.hauer@pengutronix.de; festevam@gmail.com; linux-i2c@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; Clark Wang <xiaoning.wang@nxp.com>; Ahmad
> Fatoum <a.fatoum@pengutronix.de>
> Subject: [EXT] Re: [PATCH v6] i2c: imx: support DMA defer probing
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> > > > @@ -1802,6 +1803,18 @@ static int i2c_imx_probe(struct
> > > > platform_device
> > > *pdev)
> > > >       if (ret =3D=3D -EPROBE_DEFER)
> > > >               goto clk_notifier_unregister;
> > > >
> > > > +     /* As we can always fall back to PIO, let's ignore the error
> > > > + setting up
> > > DMA. */
> > > > +     ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > > +     if (ret) {
> > > > +             if (ret =3D=3D -EPROBE_DEFER)
> > > > +                     goto clk_notifier_unregister;
> > > > +             else if (ret =3D=3D -ENODEV)
> > > > +                     dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > > > +             else
> > > > +                     dev_err(&pdev->dev, "Failed to setup DMA
> > > > + (%pe),
> > > only use PIO mode\n",
> > > > +                             ERR_PTR(ret));
> > >
> > > My question here is not just about the use of dev_err vs
> > > dev_err_probe, but why don't we exit the probe if we get an error.
> > >
> > > We should use PIO only in case of ENODEV, in all the other cases I
> > > think we should just leave. E.g. why don't we exit if we meet ret =3D=
=3D
> -ENOMEM?
> >
> > Hi, Andi
> >
> > Thank you! From my point, I2C is critical bus so it should be available=
 as much
> as possible.
> > -ENOMEM or other unknown errors all are from i2c_imx_dma_request(). So
> error happened in enable DMA mode process.
>=20
> OK, makes sense, it's the idea of "let things fail on their own, I'll mov=
e forward as
> much as I can"; we need to be aware of the choice. Please add a comment
> above.
>=20
> But then it's not an error, but a warning. With errors we bail out, with =
warnings
> we tell users that something went wrong.
>=20
> Sorry for keeping you on this point for so long, but do you mind swapping=
 this
> dev_err in dev_warn, with a comment explaining the reason we decided not =
to
> leave?
>=20

Hi, Andi

It doesn't matter! I am very happy to receive so many suggestions to help e=
nhance the patch.
I will do following things at V7:
1. Change dev_err to dev_warn
2. Use a more detailed comment to explain why we decided not to leave when =
meet DMA error.

Thank you.
Carlos

> Thanks,
> Andi

