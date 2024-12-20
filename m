Return-Path: <linux-i2c+bounces-8646-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD989F8A2C
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 03:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BC841885864
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 02:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11A613BB48;
	Fri, 20 Dec 2024 02:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oCEj8Mil"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2040.outbound.protection.outlook.com [40.107.241.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC4A29429;
	Fri, 20 Dec 2024 02:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734662717; cv=fail; b=oxyJ2LG+QaKoIsizSYouoABYo7WVt9E/jsUWbKfcBZt8FjGOPK/qEtpC+ra22S8pqo6NZM7i5Ik07p07UyCXowjUr86WiKX2Pl3zi28eeKSgLbjXmWmoBUn/EPBkXl0s5fRVFcPCmqLwuyWtAF3SpSd+sQNX3sWKfMlWK5Sgg/Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734662717; c=relaxed/simple;
	bh=QQE4WRPR6A3gMHAAaKvkuHZtUy0AC37kby+lpUtAGM8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JG4B21HnDmYgXIaxfjC5zmeRR+5I48bceS6SvzfAGGxxtEDFQIzjvvRS2omPanEN4ee/otZnrRj2GSORE8VSUocOawTFab5S/90hL92ZzGaSsaj+YEJGa6ziI323ni5pQ70pFQEE8dLMdSOHImOdevvK4R8ITdyLQG/i3rhZZIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oCEj8Mil; arc=fail smtp.client-ip=40.107.241.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DY9VBJj1w2RwOdGkT7kQPm5/wjfXW8e/plTxw2XnxXZ9IMXSQpNzP1WX/1LO8WVLvKyJ2VlVYcCd7xErpOLoq8kSUkgHM+XishOaOHl994IiEEY18hClsRUIVAM1IOrxu4Rh6qafQ25Xpb5/ypHwdjvNLZerBgeJOivxUpthcQEWJj9QAzCzpF5j3OVE6T2M5LmmEszi4WSsvf5LZxhfr8TXL/LMuqm/scbCOw8dXg9Sf4WOUDNjDTMGAp5IMgd1K27WO0G7UmF7D1FN/ThlRcVMxwBG8QvWyFyMCsI/1EIuitHtNrJjqWK5dcxJC4492y+FOW46o2sdsPCvakazOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tfdx6dGS/5Q1+ycHgaryilGRCpL638tP4TIpSXzD3o=;
 b=Ncbnm18sOGXuqOSJ4/h38Vrxr0ir0yy/qEtq9tKJhXUvw5oh7bbm16J1mbTVGoPzsjLENZ++6ArIWkEHKtUYxT5QDrRzeXyqyQe8pP2itNFt8Y4GlTY0ybN2aNL8G5jvwvUDgjsV970VX0gK5Uh8yXgpTtWaX5ScKslQdo7QaX+HUTxMVqzkrBjXBFIQMlTDvijhQySMj0JU+9MmLG9vTRdCZYLCxeoPotha6WS+N/t2tBfUSFgxkInXYXgy3szjqYa/t7mQ18Sm1AhK4iuuKlOHaue+ffOZzhdQIgtBXVJrUQB2GilQOgLwhygdKKsfXxLdYYbAJxIwMRTYGyuSyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tfdx6dGS/5Q1+ycHgaryilGRCpL638tP4TIpSXzD3o=;
 b=oCEj8MilzlNElZjjHF6OXtQF8nFJCZeBIhaIehx3zYBZd86fAYhfi6WYiuqs5JGj3lwEtvoHtNt7yl3QhJs7JJgKD/v0iuJNHtY5TbWpzKxDO4mW8OybPEFbzxLICOV/ZVAMywhsZfJ4l7+ZQyC7Yrbg5yDtD/QAWt9jmGn0mVwl/YZL3fpp3ghqWCpyCDbCu2S9ncoJwGh8cA2/TA4kMePrKVY6g8UR+R/lJ033EhDYAUs+rysM3NWNr7wnOFGM7i9WBPGfKM2mOST8x1Nq737vQ94/TyDsqOa2K0QRi9qphSWS3Zb8QPZF4+kCDRnhEBacUDmHQfWY8FKlOkNPtg==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by VI2PR04MB10666.eurprd04.prod.outlook.com (2603:10a6:800:27f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 02:45:09 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 02:45:09 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, Andi Shyti
	<andi.shyti@kernel.org>
CC: Frank Li <frank.li@nxp.com>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Clark Wang <xiaoning.wang@nxp.com>, Ahmad
 Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Topic: [PATCH v5] i2c: imx: support DMA defer probing
Thread-Index: AQHbUokvFkUV6RKhsU+/99LW49W+fQ==
Date: Fri, 20 Dec 2024 02:45:09 +0000
Message-ID:
 <AM0PR0402MB3937C9A79C55BF4C279F8099E8072@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241218043541.143194-1-carlos.song@nxp.com>
 <dhn3f2xpdpu757pizdhcksqiqo53szeh65gtmddfxfhotimh2z@dfxfpl3int53>
 <Z2QQI2gJNLjI-fam@pengutronix.de>
In-Reply-To: <Z2QQI2gJNLjI-fam@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|VI2PR04MB10666:EE_
x-ms-office365-filtering-correlation-id: e2af1676-c8d6-4b36-a7c9-08dd20a051de
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7aueyRK7Q25ES9p3EIbzjkb0Hv5Vs+jddYswnQcDMRkiUVfCaM211Ql5RPwS?=
 =?us-ascii?Q?Cto3zg6gk8KVVWj/xjd/bixuCKabS3F4hZKeYTRjJ56WsgitAt48Zkqny5rM?=
 =?us-ascii?Q?HX6Tp4HHME5wMmlt4S6AtUyKNsXFY9zo2mW+g/kI4NY42BqNptrRqwOC/+fj?=
 =?us-ascii?Q?8l3H7vC3SxXZNqLG0ctmzHye1f7zvlrpK8oCW8Pdevimpkq1lv/JlIxPY4kP?=
 =?us-ascii?Q?9d3m340Af7eEtSYJcUNwtiJv0stFX/97zRNpr/Wp6weDMdH4jYiRNhK6qYAO?=
 =?us-ascii?Q?7cMAtg8qMAm7vG2YCwG9WfsOKjqyeBp9yxS1I+cd5d5SDPNARQdY2zVP/fX+?=
 =?us-ascii?Q?AWPbOqTKasPtTiCwSG+MbTwCdI6CPCJ/qv/JetGVnIhuFFejsc6yM9ByMD3D?=
 =?us-ascii?Q?gp6TFX+M9b55sRPa4UL0UoW4RU6kmWXuz/KTcsPlt6slH6UN1eXMMAStKSJr?=
 =?us-ascii?Q?O5l5IjgebhJYb8DVfOtKOIe/SBbMVw5HYqH2k8DH/XrdbKYAcbcn2PrtjaoA?=
 =?us-ascii?Q?kCcPixVG1lIEcHS0ZvXtnmar+R4L9O+vae42A0ngAvd0/vwZJhH8KuOtFyBR?=
 =?us-ascii?Q?OFe7FhvtCmVeZ9RD0SepZeZvGcDo7uRciVoIvaHWwSE7+BIgyIkmvViOJ8+n?=
 =?us-ascii?Q?3+izMxtOkAa91O4/5i0lGuX+zBhbNCzIfktEWEmcYsX27G0VGadqMoHppibD?=
 =?us-ascii?Q?+9JMtpbR6pZqb0JVIE4We4c90IQUMLG/Y5rnFowcZgBMuF9Mk6J11buWoLhi?=
 =?us-ascii?Q?FjFFljhWMvzxF0cVcHJrAhsxnhxzea0r4YqQqkjfjZZh+EmKm/os1nfmr1so?=
 =?us-ascii?Q?VuDzhY5GXNK/13EpNoINb8Es/U+cNE5AZ2a1leonSXy1SY4xSfxCp7TuEl/h?=
 =?us-ascii?Q?T4L5GXBRzZF8hHsBfLDv1/gA6FIC7q4pihQSucWyACdNHhLIz1e/DZv9TJTt?=
 =?us-ascii?Q?5RxdxidHxAuTWxPPmSLSxjP9rvxLQf41Kt5vQuUXP3Khkxy6lIWzuKDi/96p?=
 =?us-ascii?Q?UL7h4RF+k1JKB312yf6Rx7MAwDkFQV6w09aXchUWenNnIH+bO4kKUZO6EyYP?=
 =?us-ascii?Q?zHFURmxE0zhDNDX7J2Mqr8LBzedG9YyCSw1RYGAxl9DrrZ+XiNytlZAAyfR8?=
 =?us-ascii?Q?jTwK3e2gLgSWRgBOVeu0w69BWC4xmfYd9edRAffhgcmucUHL8epnLe+LxkkB?=
 =?us-ascii?Q?5GW/j1vnKu8XR0KMF5lh47olBbgN9p2Cwc2D2KAyYQFW4cKCZpMww6vDVuHU?=
 =?us-ascii?Q?PonbHikOKB99dMLZfN2CvBqI/O3NiXqlfzcqZ+pQYDHI4ExnGT7fGzCGWJQk?=
 =?us-ascii?Q?92+yqt2PS5jRThYhYzKqRTPGnXkEQH6w/JbDk9wm7v9VGoay6ZR/HQfGPK2a?=
 =?us-ascii?Q?bM2eRqhvqyjgiJ3/HU1ijMuAQnL98X0Y08YDeds8MvJlC8VFDg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?AwYGiEy8VQT4vEFFHBg3HEHGUck0meeHU3hXR7C7zN+PpKLDaBYBbOjyIoop?=
 =?us-ascii?Q?nqseu9PJEb5wosFrdCJokwsiQ7jDySulDI4uPsLerr61LSbPCJVJYLkmtkfI?=
 =?us-ascii?Q?lFjk72MY/37kDl2pC0qpn0VSnSFBq4LtG30MD/sFsBZnYgqIWS+w9oQo6hul?=
 =?us-ascii?Q?1BmAV1Z1f873Itc8cA51HzGUYpuLRBjNg3HjcHZxiWekfwNNTYOllAc1PcIO?=
 =?us-ascii?Q?6zpVeOlQ8IfEYNShz5jRi9XKEywBZCa1D1DC3dGP7149/cIzSZHvd+f/D8wi?=
 =?us-ascii?Q?4+D4C8o4J6aQIiSBbDfS5uoWl7O5HtXXIE/hDvQO3Ezo5yxhVOZJSgLqsUO2?=
 =?us-ascii?Q?L6ZpMG2+vh/DJalfjlZ1dnAPQPF+4kFSOGrdnMa3DvqOhUgFSPAEd/n09WbC?=
 =?us-ascii?Q?qWHEi78xEGTiYpUKRfW+sOxkP3VaDx3meHaaeJMiwPjVCBf+jc9HY/Kay+05?=
 =?us-ascii?Q?4Z2XdZrMocDAdlobSG/a7O4WEIsTIMCQ7FAHqUlON88uaDONBUDaPwcMPrJT?=
 =?us-ascii?Q?pMwfou+UTiFSfUY77iMpYe96WrodChC4BAGooo6Lhv/f+gqI8PfHHNGh70oB?=
 =?us-ascii?Q?v03o/CUpZOMu8xGz6QW44/4QJewRjkbg1pdc9Drjr0AIFWGdTStIxP2oY7RR?=
 =?us-ascii?Q?Gzs3R0sBv9QL1BNwQXyPWrowwveC4VsWcV84zDWYJSTPsOoseOg3qjCLCsLU?=
 =?us-ascii?Q?Xd3aJn75hBpaPpR2tVGmCJrZXK77y6olB5NNdZx69ucB1/O8sfO8eadQc/JP?=
 =?us-ascii?Q?KM3rKKhrAuJyy5QQlWhdbA8E+PhmujK6E1HRbF3z7q0dNJjdkOjM9XlhyL/T?=
 =?us-ascii?Q?qXMBFmaz3bqd7uLI2LhCpagZIsZqw36BcD/yRTDHX9/taaUv6SRFIX21UljS?=
 =?us-ascii?Q?wNRASnzitU8cjL4HFhEMxWPvoPl0qMfauqKGCn0A05qg9chjLpGVjpdwc8cq?=
 =?us-ascii?Q?QRwgKMDYTxwPlRyhB2gYVBK+Ujz40dmBnzkG+OO6mLjms++pXiR3Y0a4KXjI?=
 =?us-ascii?Q?4jiyu55gPKMSuPUtQp2BNI1qB223etAilnp0up/6FHFl7zQsfOUU63vfLpRH?=
 =?us-ascii?Q?rEgxg21odVyrCfJknkhY1jLzU0sF3NhP8XpHTOKy8hl2EFKTnDbVGuizb0fB?=
 =?us-ascii?Q?ewo+d4ocZ5ETIYPxdfiWnAgJMoYivGVncNnLRqhFJLbblnNXORZCKxypMgtF?=
 =?us-ascii?Q?dscWRmxq93AZdU7zWwEXtl3B+cVumhqXa4BoMQgRqrA3VKkVOW5Y44JzSZcZ?=
 =?us-ascii?Q?DWTfxmJ99s2g0dNnrQVd3baBvtOjWXZhwFCVv5Yfn91B4E6Ga3UOvv73hKiO?=
 =?us-ascii?Q?2xBwzmwRSslaYhQ23Xa9Wcu25jzGNbkRO2GqVN9nYNAX5aZml4Zp89pJJNHr?=
 =?us-ascii?Q?lXYO1EzrZa9+/DlmVRG1vPjOa8hydRiXNhiZ4nJDMXU+gxAFDN1+VLzdNh8H?=
 =?us-ascii?Q?jiXBuv7x1KYZFgSQvEThBaLmo0ANOh/aXorBlP6xaccrKD677Lkl2bvWgnVs?=
 =?us-ascii?Q?kDSdLGfO+ffoXS/mjFcGAzRadoFxkdYM0Wz+vNyvYKaAEyD4l3PkMQeRmrx7?=
 =?us-ascii?Q?pgTuiosHTHtxDwso/Nk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e2af1676-c8d6-4b36-a7c9-08dd20a051de
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2024 02:45:09.6663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3FMJZQrjoVBFH3CN2yWlUIIlegmhMtQ2oNRuI1AZWpOfLAN3AED8QOWRHWdzCmTQb1McVylyi4TkKb8n+SEcMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10666



> -----Original Message-----
> From: Oleksij Rempel <o.rempel@pengutronix.de>
> Sent: Thursday, December 19, 2024 8:23 PM
> To: Andi Shyti <andi.shyti@kernel.org>
> Cc: Carlos Song <carlos.song@nxp.com>; Frank Li <frank.li@nxp.com>;
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
> On Thu, Dec 19, 2024 at 01:02:29PM +0100, Andi Shyti wrote:
> > Hi Carlos,
> >
> > > +   /*
> > > +    * Init DMA config if supported, -ENODEV means DMA not enabled at
> > > +    * this platform, that is not a real error, so just remind "only
> > > +    * PIO mode is used". If DMA is enabled, but meet error when requ=
est
> > > +    * DMA channel, error should be showed in probe error log. PIO mo=
de
> > > +    * should be available regardless of DMA.
> > > +    */
> > > +   ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > +   if (ret) {
> > > +           if (ret =3D=3D -EPROBE_DEFER)
> > > +                   goto clk_notifier_unregister;
> > > +           else if (ret =3D=3D -ENODEV)
> > > +                   dev_dbg(&pdev->dev, "Only use PIO mode\n");
> > > +           else
> > > +                   dev_err_probe(&pdev->dev, ret, "Failed to setup
> > > + DMA, only use PIO mode\n");
> >
> > Just for understanding, should we quit in this last case, as well?
> >
> > Before we were ignoring ENODEV and EPROBE_DEFER, but now you are
> > making it clear that other failures like ENOMEM might happen.
>
> Good point, dev_err_probe() would not print an error in case of EPROBE_DE=
FER,
> but in this case we should only print error and continue with PIO.
>
Hi,

Thank you all very much! As I comment at previous mail:
DMA mode should be optional for i2c-imx, because i2c-imx can accept DMA mod=
e not enabled, because it still can work in CPU mode.[1]
[1]https://lore.kernel.org/imx/AM0PR0402MB39374E34FD6133B5E3D414D7E82F2@AM0=
PR0402MB3937.eurprd04.prod.outlook.com/

Also we don't want to annoy current user without DMA[2]
[2] https://lore.kernel.org/imx/20241127-analytic-azure-hamster-727fd8-mkl@=
pengutronix.de/

So we make this logic. Anyway we let the I2C controller registered whether =
DMA is available or not(except defer probe).
Ignoring ENODEV and EPROBE_DEFER makes it looks like nothing happened if DM=
A is defer probed or not enabled(This is an expected).
However we still need i2c DMA status is known when meet an unexpected error=
, so we use dev_err_probe() to print error.

> --
> Pengutronix e.K.                           |
> |
> Steuerwalder Str. 21                       |
> http://www.pen/
> gutronix.de%2F&data=3D05%7C02%7Ccarlos.song%40nxp.com%7Cf0f2b14d05e4
> 4bb9581408dd2027ef82%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
> 7C638702078063818207%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO
> nRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%
> 3D%3D%7C0%7C%7C%7C&sdata=3Dq355QWfiCHuoREtM4pkuovpn%2F6MeXynD
> hrpSEpWeCXk%3D&reserved=3D0  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0
> |
> Amtsgericht Hildesheim, HRA 2686           | Fax:
> +49-5121-206917-5555 |


