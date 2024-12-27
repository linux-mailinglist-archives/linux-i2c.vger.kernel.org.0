Return-Path: <linux-i2c+bounces-8736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFEA9FCF9A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 03:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C78018836A3
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 02:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42CC33224;
	Fri, 27 Dec 2024 02:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T84lYoGb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2085.outbound.protection.outlook.com [40.107.105.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC84EAF9;
	Fri, 27 Dec 2024 02:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735266024; cv=fail; b=Gn9g0Gm/GrbkKyhoioi10VHs8gATXpiSTCcPgWNr8XsWO+2SN1ljH6HtDJ8+YeHLIYpnxxgLaDI+4SQHSYxjwKRD4kgRL5HnJk/9p6llFXw28UOCYPOJvUv/WdaotOLA8LwBggKUWi4nKeJKl1Rt3WY2RglYbknOyXlyylhPR0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735266024; c=relaxed/simple;
	bh=EgpxHyzbZfBevTqUq61j5VkaVSHye1yyBP4Ut0gcELk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Oyy+blxkq6cRYxul1uRIg1Mej3UMOT9i8idcx2GUaNuRAbrlcTJuMzLPE5JPOdlZqE+hA88UYdBH9RFPa1Ib2R3an+AaQEe5nWjFdvbu3btyhlZux9gqZ+0OFudZQ29c+8DGY0uxk7v9m511M9u7JuncP2vSuSDOjRPRm7wZoPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T84lYoGb; arc=fail smtp.client-ip=40.107.105.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tvxbvV6GcITmoynC8uv2Cz/B+BYW+DcTnIj3InDjdSL2D66L/lR4PZUDZGO1B8hdxzMvbUc55MDDvZvQLp3wAjXQF/BVlbeMnjjWyF91gy2XoysXx5vSvgw43Fcqdjy95Hd/dVYHSMyY+OlykorIH2TqjIbpIFfmdn6657p/V1ODlbiGVNU8yanj0xsJlNKpPDlMsU3N21SeqDGacBAWg1GzwiLBPnjqumYHzh2S3wIlkXAT9fzVVLvfQ0n1FycoNMWer/2ra5DFXGylaPUQ1k9CeAYjPBeuh3LcJxMhrk4fnGb+eyRp78q7/ogxdIKANDCQtml0l+NEQST7FW9bJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2kuRrH86kd3ehtlfsGCmQsndZNzt2N5y/NPYO5rsL0=;
 b=Fz/NOzHcF6/b/FDG8/qfIMcSI2Dfgytesw+GX0p8Yvmkzdj/G97EiUb/ADFV29sCs5C3nmfB5P3eIipOP8yDnedfXrx5UQQqCOKzF0I7scE6Vd//ty9+zBCRwxUYV+ZQf0B/5E4iPLwW92kh62IXy1ftN4XDOTjFQ1Qz2UnNmksJv7He35HWKmrohq01Y9SSqrecN1OyyJoRJTDVktAv/orEAAWzdlfN3QG1ArH2cuFdFfXtYxglUbfeiHoWHC/93APZUzuQNoK1u9htuIjBc27yDFZg35qDVdkkucJWWyjTkTxNBj+IXIxBJEM6LkzEGdPY82SAjutxHWXpDlLkWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2kuRrH86kd3ehtlfsGCmQsndZNzt2N5y/NPYO5rsL0=;
 b=T84lYoGb1LQyao/iYRQOq0AIvMKowvsGszV1Xkm3sOWvNzKlie3SFehCFRoIKHUw34YpX11+6bW7OURXq2VcbXdoq3fjwP0l5R0QDElozhbwnAsDX+E9se3sSvGeRM7e+wQWs0Sx1hZVDR22q6KuB81gEZdsi5wtyD34Yv2Wywr9qTqwOuDv30c9dv499bHsY4RG3Tsw8dcqkBia34QY4msfNbHa933+NoCSgcs+nUIGo+kTwUNqia6/RmRxraxqsn2vzhaLUPesW5XBb48sSouq+iLqAjqbTLtabX9ePf/Mxr3hzlXr5irmloX84scvgjuQ/bP/BcJ2iQq3CnpEvQ==
Received: from AM6PR0402MB3944.eurprd04.prod.outlook.com
 (2603:10a6:209:1c::19) by AS8PR04MB8166.eurprd04.prod.outlook.com
 (2603:10a6:20b:3fa::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Fri, 27 Dec
 2024 02:20:13 +0000
Received: from AM6PR0402MB3944.eurprd04.prod.outlook.com
 ([fe80::4ff3:c2bb:2605:b72e]) by AM6PR0402MB3944.eurprd04.prod.outlook.com
 ([fe80::4ff3:c2bb:2605:b72e%6]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 02:20:13 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Aisheng Dong <aisheng.dong@nxp.com>, "shawnguo@kernel.org"
	<shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] i2c: imx-lpi2c: add target mode support
Thread-Topic: [PATCH v5] i2c: imx-lpi2c: add target mode support
Thread-Index: AQHbWAXcbn692cFIIU+5wUvSEOkwjQ==
Date: Fri, 27 Dec 2024 02:20:13 +0000
Message-ID:
 <AM6PR0402MB3944A4CA255230C2D62D7B5DE80E2@AM6PR0402MB3944.eurprd04.prod.outlook.com>
References: <20241125143140.1613282-1-carlos.song@nxp.com>
 <vfesmhe47tj5cwib4dl5zxxy7sn5g4swjg7tozcv2otcqgsjpd@sjj35a7c5fhu>
In-Reply-To: <vfesmhe47tj5cwib4dl5zxxy7sn5g4swjg7tozcv2otcqgsjpd@sjj35a7c5fhu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR0402MB3944:EE_|AS8PR04MB8166:EE_
x-ms-office365-filtering-correlation-id: ad1bb9a6-e6b0-4b9f-c4c5-08dd261cfedb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?ryTVQ8v2afRgglU+lvOtBlb7M2ganWFSmkWf6OHoyns4ylKJUqMBZpfDi3SM?=
 =?us-ascii?Q?vRRWJGSOnpEpxtKFAUWw+QEup/1iKbK3OiFWTHdrNvWoiBQfXnnoMX67/8JE?=
 =?us-ascii?Q?EGuX3WG1p8rQZ4xN6VXnnGL3kCbCO7hWgxiJBmYUYHUrYNR55tXS1UWaknDd?=
 =?us-ascii?Q?KuKI5ZRrNulvgF9v+up4J2TRFUc+B73a5uEfhkYLevdDehWG2vGolv+hN8WW?=
 =?us-ascii?Q?X7wUVXvJGFEmn4MMzI/HGKy3lQ30pSN0D4B1cD7ajq2bUc604gwuLi+aZC2z?=
 =?us-ascii?Q?yfiw+y02Fnu83rghz41LaB5nAVPtoPr3GtcbjGzqNv6RMx1wXoA80HCeHE+e?=
 =?us-ascii?Q?kuIsnc+nq4MlEkSMBqbdPC61Ih8hN0Ebf0iXKkQUpJJnG6bbGomj9o45wBb1?=
 =?us-ascii?Q?TKfpQSz0WWq15mMYlEy+I3YSfnJiziJyRSK7ObCD1UU6QvJ5teM/oz8qu3qd?=
 =?us-ascii?Q?tx8mpKHJzh0iOLSUGFa0dutmuc0YSGyDJTUKnFEhl9ase4Olkp+SwPOCk+g4?=
 =?us-ascii?Q?/PlTzeMKzGTot0bP8LJEAHMYzAxbXchdmHiQsu6ZSMxRTch48rN2nGGWZGsc?=
 =?us-ascii?Q?xAhGlnt+M/KxAXI5cVkZQkTqqCh8dJVXwHwcbBalnO9H9HR5SFLMFMMQwwAG?=
 =?us-ascii?Q?1QUCmULcKrkz59hq+aZyjUJgmrMSeCDDc7Y5qQy3VHA/0rwh96QE6ltPC90d?=
 =?us-ascii?Q?E0AO8C/hXfyjHG36/7i4/R4rbgfOpm/ppwUDoDRDkMlUrTjGQfMVaQPLLbim?=
 =?us-ascii?Q?SjpWup060K4V24vcu0GijvZDBmQfsu9DE1laYDwRaZVuHZCnA/vlfu+yAtiq?=
 =?us-ascii?Q?f50e8BJ1P7Zp86FQvIPDbRDliZCi0aj5056ubKqWl0LckepKqqxuRaBYvdx1?=
 =?us-ascii?Q?S/9k2EIhKMo/zJhYS+SVW9cf2kT30hZLTA1uvH8q1Kbe3p9zpm3J5ocR/hF4?=
 =?us-ascii?Q?IvJyCb4jFx4y5aHd6pPc/Ya7oFd7fSiepyAE8gQTdTlTiGipdgpZSGTth0Jo?=
 =?us-ascii?Q?JBQkhiH7ROjtk+IMp3Hc7fWu8yLDenXg7PW98K1ORRBgrfMjHdWAyx/zHF+F?=
 =?us-ascii?Q?I2FCgTHZeKsXT/t7Sja0Ymb0ZK83Z4NZH27+TV2naUrzx+Se4kas0D8qySgO?=
 =?us-ascii?Q?94uyohcx1Nn/NbnXjC0fxzoxrHrvGHMbdwn04lVQJMOBZ/VVb7GqoQwXSnUa?=
 =?us-ascii?Q?WCyy+IIqgwit29PeG04d9sizs4Da5EziKPfkxV3WAKxREiMiHK4+Y/JZxW7m?=
 =?us-ascii?Q?ljD9AwMXEvL/unVcslFUcjZLHjEI7+P5ExlNMBJaTsXtS+Ib7xv3Kwe7keI1?=
 =?us-ascii?Q?dRWCDpXkms0HzEdSeY5yUKej5oNWaQ05DX2raPzmQUtj4DKekX+OdLhS+PYP?=
 =?us-ascii?Q?Z5PMofYv4gBKGUUWzYuWLvFYWZ8WGuvf4yeFh+4OhlUmJotguA7GrqidYKCz?=
 =?us-ascii?Q?qiyNdTu8nWE5TeYeYPbMdkyKplkPVehq?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR0402MB3944.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FbCVSETlG1FqZler+KfcPK5x3T4QI72cavHXfdHzghhgXyQ3j93KR0lJ5FDX?=
 =?us-ascii?Q?r+TQDMABinOKqJQMg0puexJ/BARyO8mARb4Tnayb8mjyNTAZ/ad2izfip/tr?=
 =?us-ascii?Q?tcwnUncT703GUhrKjoHbOJWSd0pUMBuLhmmFJcoz0tH4KcIqRWATZsAgnWWJ?=
 =?us-ascii?Q?UKpRipVC7hlarbB1lgn85iG4E4ACFD2XOg+k5B5rmr1T57ooezsWbLZ9//Wl?=
 =?us-ascii?Q?Y+aPfRYKsZctPsBssYFgbHC6nbbL/+qoDmZOl/D7ePQRrMzKnP6FOFK62+VV?=
 =?us-ascii?Q?gymXIdtyvikMMchl9CUXbTwO6dHxg6WXOHSklXrxCjFPkB+VqHPZT+n4I2R3?=
 =?us-ascii?Q?rQIC0hrlv87w567bpeimHjd2u6QOvEQv43V+DmibwwVNi95HnzvTfc7vKDOm?=
 =?us-ascii?Q?BAiqRJ3hE732IN1lFL54LRRGd4WxTeiPdyoFy4Dek94nmJkmiITtYDSMnpYI?=
 =?us-ascii?Q?2spGhjgSWfyXWWhsYFZ7bAIDkuOH5Bs9kz+LkUSM6Hbkyq9XdoFe4/z4/8tl?=
 =?us-ascii?Q?z8j0SidSXFVVS2N92DXfNCKoczi+37RqIU7VLUi2dJDey3AiZz5cepdhrWt0?=
 =?us-ascii?Q?+7+pyP+3Yvr7vIi52ltbqZm9juwuJpXiUGtjuQ1X2B1xz8HekVubftk0cDyl?=
 =?us-ascii?Q?382b6wxMTPwabQZAZK+0oQSXLPC7nieEH+4ujXb8XrVgOiCTuTbL/n0EqSZi?=
 =?us-ascii?Q?6BpyDUvWoiOAwBCXm8os77Ol/7L6mZ9aNR/U7E5/TvGHJKMwP++/vXddq08v?=
 =?us-ascii?Q?rnkvwvtb6sU3kF7xfa/ajpuR/RNnTOtXLoZTd55josquUzIdswRq22wXV2HG?=
 =?us-ascii?Q?AN0ouzvYwFNG6HY2MjQNHkKsFmrHlGsKH26YHFrh5WZWK60Kqu3LfaPfTr/w?=
 =?us-ascii?Q?m7Fdqn+L/hZRsvCZ3PGY9Ylt+jfY9WGjRmAB/EPo4/t/zj4Rh24zVFbHnSfR?=
 =?us-ascii?Q?2JNEo3uco9yoFCV0AJqrQnSB9TA3Oq4Zsu006uOgXUeTH4fiNt3US8dmHicv?=
 =?us-ascii?Q?jRXekIUU/BGAyDA6byyKbVmEU7D32v6miswgxkOsOdVI6ZVKqlZDrHlRadin?=
 =?us-ascii?Q?zTWWjtJdsOEU+nWFst63PnJMWYC3Uu4UNW/9OxKgheYExmb99oN8jDJjyf2E?=
 =?us-ascii?Q?bhP7UfAvoiB7hqnx0nMeQ4TExtphV5Z975mDNG/JSiGyUa/POhVC+75Vs5Ju?=
 =?us-ascii?Q?k+OGk/yG1ic3L3t/+2heFz3SvU2p5NOyqoSATSvnF2MzHMwwV7oNCa6rhYng?=
 =?us-ascii?Q?FM9pSJ1R5ZB6rM6veDaDGTwIKImZwJlw6NVipSnTDUB1ApMYZBpNgFDmoFQA?=
 =?us-ascii?Q?FDVNmeN92oJ1meLhstMdezMhv4pb4OMF5cNwg1SHlUctPcnyWR7n32vCIx2F?=
 =?us-ascii?Q?7ylWXxbWTlhLx/0lQLbRbjWj7AKFOrQSWvX4ju6Z56zfwxAV5bRxAcL0XI36?=
 =?us-ascii?Q?RnHcwLL/mlurKLx0KKKb4qk9dy/lKZrpb1KD7hap26nVnogzdCYagWMccld9?=
 =?us-ascii?Q?LZ9qTz5SNWZDK4ZyITxCc6UNOjC6TBy0AUyI/P4e6DDYmViFjoJRu1j83XsQ?=
 =?us-ascii?Q?XSmz93m3juVkPgbU4ZM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AM6PR0402MB3944.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad1bb9a6-e6b0-4b9f-c4c5-08dd261cfedb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2024 02:20:13.2617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wz92DcaDXiLCYS0NTc6yRtUot2/neef0NAnyYe2nJ+yjntmaCZVFJyTut0dsuTqUO9h9kw0Z4XEyOlMbyoNZxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8166



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Friday, December 27, 2024 8:34 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; shawnguo@kernel.org;
> s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH v5] i2c: imx-lpi2c: add target mode support
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
> ...
>=20
> > +static irqreturn_t lpi2c_imx_isr(int irq, void *dev_id) {
> > +     struct lpi2c_imx_struct *lpi2c_imx =3D dev_id;
> > +
> > +     if (lpi2c_imx->target) {
> > +             u32 scr =3D readl(lpi2c_imx->base + LPI2C_SCR);
> > +             u32 ssr =3D readl(lpi2c_imx->base + LPI2C_SSR);
> > +             u32 sier_filter =3D ssr & readl(lpi2c_imx->base +
> > + LPI2C_SIER);
> > +
> > +             /*
> > +              * The target is enabled and an interrupt has been
> triggered.
> > +              * Enter the target's irq handler.
> > +              */
> > +             if ((scr & SCR_SEN) && sier_filter)
> > +                     return lpi2c_imx_target_isr(lpi2c_imx, ssr,
> > + sier_filter);
>=20
> you have answered my question here and thanks for that.
>=20
> I was trying to apply this patch but it didn't apply. Do you mind resendi=
ng it?
>=20
Thank you! I will resend it:).
> Thanks,
> Andi

