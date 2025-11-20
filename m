Return-Path: <linux-i2c+bounces-14186-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DBCC71E9C
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 04:02:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id EEF862CB84
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Nov 2025 03:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15B62F6903;
	Thu, 20 Nov 2025 03:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BXa7rWkc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013036.outbound.protection.outlook.com [52.101.72.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29001FF61E;
	Thu, 20 Nov 2025 03:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763607753; cv=fail; b=WFBtaaj//rjKGrDEwpeHiw07rd9KRQxNhjeOE6pZcppi6KyTJeXScqzRSjIVe7hPOiCuW9wH1Sm72xr12/jvbAdK9pZAPwIg5DSi0/wjn6hnKzU1A5lEXSTjRNcZYqrd/RpjutETnUR8TyVi4/kP3xIRtKxk7IQW5vXs1/1GNDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763607753; c=relaxed/simple;
	bh=E82BLd4JIhXNxKqEFM9ZHDUZvgS16BBDJd/c3WfagWA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=E6CD9ZypLpF+Dh1aeh7Wf2riYdB/1sEDhFumRG1Cy4Cv3Y041FTeV9Z/NpCNpwOCygGCz+iymzAzlUismc8fmktfYHx1+0Qx0xbN4ZoabIFk9pgMXAIVcnV18m4SkCR8YRn0Tt5UE+QD6Jlqkr7UCVbZrCzft0xVZCW6bQ8yqkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BXa7rWkc; arc=fail smtp.client-ip=52.101.72.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XS+BrZ8SX//Pf2+1dlX/4qjKpngQU6P30aZE1THdgUJ5NKRyZ0CgLSShBuWeCCWbd9C5UQ/70dJE+G6WKfONU+n2QjUeJAtvSm1rkT8MMcg3Nd8Oyxew+6F95stlDmEaKOPaVwCobhZqEghYMjjCCQYrO0YieeVNEi9YA7/tCnbK5VVUX5cDAq9oPgQA0LNcOiXvdxucgliZT/a0QLlUhruQQZ07VMDlksFjytx8RMVeKlHQoSYTQO0r+nBNrkqw4weAjh57cMqgU3T0g8IdyzYN+C9ZeZV2AKcVydUhKPf+td1/fm7sIB8DD+B9VLJ8MkSU+JGLv/S7iFUJLOsNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqmaQ9i2tELFE9Pkb/FtVzuavEL4VQpSqGiYKOTpxg0=;
 b=G/OD8ru7gGEZ78UGRwENrALxl4ZaJk6egZXHObUYOjne8ponKTb4r0rcwC49boOVDQ4VutmFSNSVuQebgyyktk2Eo4N3sti1+E4yS3QF/9Ja3qNhu3c6qrq9Qb1Dr+tC/moAiM2uGN9qsFm/xqETZ/e/BRvSIQfaEhq2H4LBihq4Z+Q7WOth91wxwvwsap2vnXGB4XxA3u2KIWLNf8gKlUGkQ4FaqMXqRcJkl0g+2AEMyPbWZjiH5ATs+9v4tBocRLS46L1eY1KnYCmS6acLbB21+LYIgXRVCShteHX6/nBpmH9FjAXaLq1vq5gr4C0SybREmmsy46JCaCb3QOBItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqmaQ9i2tELFE9Pkb/FtVzuavEL4VQpSqGiYKOTpxg0=;
 b=BXa7rWkcC7AI5QFFxJVTgbWfdnbVOcq2w7rK1Y15Q30X9Jff6y6iukjijDDYx4WuSN6mcNktcwaIgULxqKkpSZY4iBv0bPUenU/u7uxg27BRpNTgvWz1T1XUJQhvSJeowdRLQ0sOMc0NSw/DpOR1MzFO8ba/WQgvW3P53GndfFd8JZCmqfMzsmT8YgmTyt4IknOp831RVAGxuX34Ibp1RfEFuqEYizSTlYODO0HxB1ePDM2gpf9rxsCpR3srvQQvSDDFqTsYbl3G4KQyrb2VdsbL1AlTeslJBiT/NqESj1s0iYfcgNMSOBjHracNkJV9ET/TGtOojq9PFs2e2Go6cA==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PA4PR04MB9318.eurprd04.prod.outlook.com
 (2603:10a6:102:2a5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Thu, 20 Nov
 2025 03:02:27 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 03:02:26 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Frank Li <frank.li@nxp.com>
CC: Aisheng Dong <aisheng.dong@nxp.com>, "andi.shyti@kernel.org"
	<andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
	"pandy.gao@nxp.com" <pandy.gao@nxp.com>, "wsa@kernel.org" <wsa@kernel.org>,
	"vz@mleia.com" <vz@mleia.com>, "B38611@freescale.com" <B38611@freescale.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i2c: imx-lpi2c: support smbus block read feature
Thread-Topic: [PATCH] i2c: imx-lpi2c: support smbus block read feature
Thread-Index: AQHcWHxqlWTPlh5Ac0iXNEld6mAcI7T6NoMAgACgHJA=
Date: Thu, 20 Nov 2025 03:02:26 +0000
Message-ID:
 <VI2PR04MB11147CD601B6A9EC8598E13BDE8D4A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20251118111323.1452329-1-carlos.song@nxp.com>
 <aR3z4PBN0+0fKqz5@lizhi-Precision-Tower-5810>
In-Reply-To: <aR3z4PBN0+0fKqz5@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|PA4PR04MB9318:EE_
x-ms-office365-filtering-correlation-id: 32dd301f-b483-4464-b25f-08de27e13c66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|7416014|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?5YV53T8yNhjD45DzxyEBCR7ov1NSl1QgZD+SV+RRLyVVdJbGObKXC0piOYaI?=
 =?us-ascii?Q?0krgCmm4yrn4hhRAdclKAwuPxAmqFoBbbxKvippjizExiSamfbXEvnX1bcjS?=
 =?us-ascii?Q?bih/qiGLWsbJPFrZ0h/4nuA4OIJdBhKFGB4uXME0/7PKuRM6TtY0CpOgkKH0?=
 =?us-ascii?Q?RzNQxBeMKTRiygiG7NJxyyf9dXP5j1F+kjDxNhyevf7wkNj5gLJiTA4cK745?=
 =?us-ascii?Q?ECLEAwVcK5edp1aX+ZMWClPDnE11ikqSW1wdjcMDYpD1I56qtC4mh72sZLlQ?=
 =?us-ascii?Q?QQnpdY0el7icD0i40g4SQ+gTjteVoFGCRhK69jkWzw4Yst3nPeeu0lzvSA69?=
 =?us-ascii?Q?grpKQ7q3dakmUqnKr4pwQZo7ajEXjNY8yH9SMw6Y/rIIzRDkHdiKrC2wqVtI?=
 =?us-ascii?Q?f52yINQJRzYW0W5TSkF0yclvJYyDGuWLqQxXIJJbCD3FLoQBEWlUTgPqgzU+?=
 =?us-ascii?Q?GmLMXuOrPGicSaoTmm8Ey82QgROSvz3VCXJxDQ5og0WnYbNUzQ7fElnYUjPg?=
 =?us-ascii?Q?/lr0AAN+9IShJynrlylYbs8j2u//AzQLRPnOkIZA1NcskvOkXd92eRE0qnaA?=
 =?us-ascii?Q?qXYuI/Ydjad3flCU963RQQu1uwNa50xDdDXt77dbHnfAj1qucGR/vQ5+jqIP?=
 =?us-ascii?Q?FucbEQ376rGIqaYCW4YEqngCPhEbQEjYc1LZyk9EV84GyrL/0cw4+Ds2+L9c?=
 =?us-ascii?Q?BYkOjX0elIGD+stjTn04tv3TfsbLNyqNBCpdK5KGRqLnUZtLtNtYMT/Kim1F?=
 =?us-ascii?Q?jKts+UR8UER4ApqlZhClhiiHFIoDk32OooEwm9bT9fAKFZpvjfIAXDm2G6cN?=
 =?us-ascii?Q?3xjXi90fB+IM2QFgwqNRDTziVf8RJdi13zhPTZkZw2/pRKqAWcefsjA0ru1u?=
 =?us-ascii?Q?yTqi1KQZwyviausxigfyC0n8byEFSb72YRYd/SAiF8OARn1Q752lmLCz9CAJ?=
 =?us-ascii?Q?D1EMXD2KsehYuRabrBALWGdiEBERsndunT25mZYMpvlKUS18ncsxA1Moy/I+?=
 =?us-ascii?Q?9WriaaFpaMahpwYT1zAx4+Lc2UUya6iz0wlW2R3peJfNvQBIya2otivwWVu4?=
 =?us-ascii?Q?v18ZnZfPMdZsj8OCBIVwmtSoSPAqS6qVcJbZKZZHdwz3OW0HoWzrpYFGi8TL?=
 =?us-ascii?Q?plXXOhOd2EXxynamlZdI0twUVlS8h+86l3yxUDnJs8+9tVKWYo5qvFYO8gjz?=
 =?us-ascii?Q?CAtcI0dQ14Wwzbox8jpqKbRBrVw83MrRg4mfTpIILXbpwy4dGdBXzDlDb2iE?=
 =?us-ascii?Q?YWMQYVMwYtOfwHBJvVsNHRrfSy/9atVrt2VypiQbfl5C1NLbWhduJpyUBMtU?=
 =?us-ascii?Q?fElvvEe8+3+gbeYRZ6nrCAiQJL9680wOKBkzhTxpNWN7FuazEuK13Lftn9sJ?=
 =?us-ascii?Q?SzCsHRS60GiVMFGt8YxxVweOzt9yUf+ihNslhDMrZPGPqhieMxnHZ7mS0Gd7?=
 =?us-ascii?Q?nX4L1q9UWA4neTqqjz0IWE/1H7YBMqXUIp/wv2OT305c3knUwvfQoIuMFAfE?=
 =?us-ascii?Q?/J+TuSGyEHP4kylzy4qPlQ+Yusf1hEdbdIVN?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(7416014)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zSiubGBBCxRm8+vNuqZF0NGWuJ+PV5eSJUoa6WgnqpsHCo6UX5OVo2eEyjIH?=
 =?us-ascii?Q?6Vw2jk/gfpBdx3xM2FVzU0Dmk5sIFO3M6Mc7DR+Wvi0fUWw8hKADJMlv8UJq?=
 =?us-ascii?Q?tYYDNkaD4NLCyQi5GU79HA9vWGojtODFVWreaG/THDNPcfmS7TaRpXC1Bzrn?=
 =?us-ascii?Q?1SGl0EFy6B+7m2HcVp/0TTInvxxZOZ1Idj3duqzX33AbPUESnBrqMHEFDoGz?=
 =?us-ascii?Q?aRB5+7FMZnnD9Fsnd/CVfneRUBgyaAg3DvIJo5nT2c3w1KIvrCDB9Lw1zTOD?=
 =?us-ascii?Q?9IlStIVQkL0tXfsPKZUZiV3GkEBUXdmSiW2l0xyel+3b/V5Ifso0JfgdttrF?=
 =?us-ascii?Q?F5Vs4bkqNEcbQ0GX3hXyekf9efBSNp4sOpWpAfP1o/ZHtN6FTc0TMQQloVVd?=
 =?us-ascii?Q?HJlXg32UNOcnUenWHB9JXKRzPVTEUKoFFKs0BlG2RkOOS+6p2o3/zhUPr0qP?=
 =?us-ascii?Q?q6iK+d+lYGLv8Gp1Zqb3p3QtGkOAUaiuPnuXafpv8Mlqy90kuhyrwSNX8Jm4?=
 =?us-ascii?Q?qN6aneU5DJUpw/O8ZcNNY62sXoZQbjTqINK2onA6cXp1JlG6zX3Vefda0Ug1?=
 =?us-ascii?Q?YJ4ofjDZgHZQcaOMEAyvijF7Oo6TZ2Oo3mfR/sWty6nCZz47SDZuKKAnSaWV?=
 =?us-ascii?Q?kCnyjEO6yyTkbRMxPyuNI34yRUJJh0c5hZ8G2xyeynj7J5m7cr1TM7T1H3Ig?=
 =?us-ascii?Q?rh41LDfG0dE6mzmv3JwIjN5BiLAhSZ570+ZMg41YcxaZKTqloF/e0PYOiQ+7?=
 =?us-ascii?Q?Q1yGzLhCpSmjpYr+4A5qS0cFOX6cdxnMs0NpJLmUL7AlL13QH7SH/v+nasz8?=
 =?us-ascii?Q?EuwWKJvW6+HNX1qL+zKDYsZuafveR/LH7QMyvwBCudnhooq5S6Xi22T7RoUi?=
 =?us-ascii?Q?Pd1d+CDEkY3AhpOvycnxrFgydC33vqGm2qkyumFk8gZJK8m+ECeAkEtgPzbW?=
 =?us-ascii?Q?Gn3KARC5W4L+aYZ6WPIodcNVkp+MgrbFsrNUGbZD4FcY/EVamMn1j3gV5C4Z?=
 =?us-ascii?Q?13uGrjNqwn6duveZymRs1Tbu0KTF29/Z855+hWq5IVUya+iACdEb+xr+yBvX?=
 =?us-ascii?Q?0Cvm5DSakS5C5apu0IGt3kiwJ0mHEn1iC1Ud2NrdKKV9MeJFQQ8SPl1N/cUe?=
 =?us-ascii?Q?Y2rqw5Z2caIcg4rDrLdRjqiubvi6IMm5YeUoXN2y0zHWNEEUoSvSm2lcMmEm?=
 =?us-ascii?Q?dQi6fONkqMqj9IwdLs97uEKOvG7q4TqZhxJ1u31/0RUdrDEWvb2wL5QCzDL+?=
 =?us-ascii?Q?OflnKVQiv5WJDSLJiQ0yGy5+U5UpoRKlo/xwEYc8sGpsk6UIWYS5GSh711aJ?=
 =?us-ascii?Q?Q71rI+vTdbRbh+iKDRtPvvpsUpaa/LNkqJuICCcqyU8LgKBXfqZ2qDhuGUYM?=
 =?us-ascii?Q?P+q8EMVO7xHhd8chvL54rkJzyO80C6KGgpErEYOxezGT4qPEVwRiNlQWFvS5?=
 =?us-ascii?Q?bdnJlxriYqy8MocJez88WDu10jcJrIFLhbLDua6BlFh5c5kjUWjHpFqc128S?=
 =?us-ascii?Q?QX1RfK33IFJfC6JDQPQVRkGRpoj0NbS/HJP568XgY4C1oe5j5nDZCyjZ98Kq?=
 =?us-ascii?Q?dcGZd66nrxUNmNH8MRI9LS96Q59pYuWlmvTD+Fw9?=
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
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32dd301f-b483-4464-b25f-08de27e13c66
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 03:02:26.7332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cr4yos2JBcOfipm3oBUPpafAFXt5WtEDnNLrByy3z7aGJlTVirZrVFPbXUH6Rt6axL3fX0wNjVj+9VLTNVX1UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9318



> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Thursday, November 20, 2025 12:44 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; andi.shyti@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; pandy.gao@nxp.com; wsa@kernel.org; vz@mleia.com;
> B38611@freescale.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] i2c: imx-lpi2c: support smbus block read feature
>=20
> On Tue, Nov 18, 2025 at 07:13:23PM +0800, Carlos Song wrote:
> > The LPI2C controller automatically transmits a NACK on the last byte
> > of a receive data command. It transmits the NACK unless the next
> > command in the TXFIFO is also a receive data command. If the transmit
> > FIFO is empty when a receive data command completes, a NACK is also
> > automatically transmitted.
> >
> > Specially set read 2 bytes command initially. When the RXFIFO receives
> > count data, controller should immediately read out this value and
> > update MTDR register to keep the TXFIFO not empty. Set new receive
> > data command to read other data before the 2nd byte is returned.
> >
> > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus driver")
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> >
> > ---
> > I setup an env to test this feature change:
> >
> > On I.MX93-EVK:
> > LPI2C5 as slave device and use i2ctool to redesign the slave-eeprom mem=
:
> >
> > hexdump -C /sys/bus/i2c/devices/5-1064/slave-eeprom
> >
> > root@imx93evk:~# hexdump -C /sys/bus/i2c/devices/5-1064/slave-eeprom
> > 00000000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
> > |................|
> > 00000010  20 00 01 02 03 04 05 06  07 08 09 0a 0b 0c 0d 0e  |
> > ...............|
> > 00000020  0f 10 11 12 13 14 15 16  17 18 19 1a 1b 1c 1d 1e
> > |................|
> > 00000030  1f ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
> > |................|
> > 00000040  08 00 01 02 03 04 05 06  07 ff ff ff ff ff ff ff
> > |................|
> > 00000050  00 ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
> > |................|
> > 00000060  40 ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
> > |@...............|
> > 00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff
> > |................|
> >
> > case1: SMBus block read 0x10 register. SMBus len =3D 32 bytes.
> > case2: SMBus block read 0x40 register. SMBus len =3D 8 bytes.
> > case3: SMBus block read 0x50 register. SMBus len =3D 0 bytes. It break
> > the SMBus spec(len =3D 0).
> > case4: SMBus block read 0x60 register. SMBus len =3D 64 bytes. It break
> > the SMBus spec(len >=3D 32bytes).
> >
> > LPI2C3 as master controller to smbus block tead the slave device at 0x6=
4.
> > Not apply this fix:
> > root@imx93evk:~# i2cget -f -y 3 0x64 0x10 s
> > Error: Read failed
> > root@imx93evk:~# i2cget -f -y 3 0x64 0x40 s
> > Error: Read failed
> > root@imx93evk:~# i2cget -f -y 3 0x64 0x50 s
> > Error: Read failed
> > root@imx93evk:~# i2cget -f -y 3 0x64 0x60 s
> > 0x00
> >
> > After apply this fix:
> > root@imx93evk:~# i2cget -f -y 3 0x64 0x10 s
> > 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 0x08 0x09 0x0a 0x0b 0x0c 0x0d
> > 0x0e 0x0f
> > 0x10 0x11 0x12 0x13 0x14 0x15 0x16 0x17 0x18 0x19 0x1a 0x1b 0x1c 0x1d
> > 0x1e 0x1f root@imx93evk:~# i2cget -f -y 3 0x64 0x40 s
> > 0x00 0x01 0x02 0x03 0x04 0x05 0x06 0x07 root@imx93evk:~# i2cget -f -y
> > 3 0x64 0x50 s [  184.098094] i2c i2c-3: Invalid SMBus block read
> > length
> > Error: Read failed
> > root@imx93evk:~# i2cget -f -y 3 0x64 0x60 s [  179.722105] i2c i2c-3:
> > Invalid SMBus block read length
> > Error: Read failed
> >
> > ---
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 93
> > +++++++++++++++++++++++-------
> >  1 file changed, 73 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > index d882126c1778..39088567db59 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -90,6 +90,7 @@
> >  #define MRDR_RXEMPTY	BIT(14)
> >  #define MDER_TDDE	BIT(0)
> >  #define MDER_RDDE	BIT(1)
> > +#define MSR_RDF_ASSERT(x) FIELD_GET(MSR_RDF, (x))
> >
> >  #define SCR_SEN		BIT(0)
> >  #define SCR_RST		BIT(1)
> > @@ -461,7 +462,7 @@ static bool lpi2c_imx_write_txfifo(struct
> > lpi2c_imx_struct *lpi2c_imx, bool atom
> >
> >  static bool lpi2c_imx_read_rxfifo(struct lpi2c_imx_struct *lpi2c_imx,
> > bool atomic)  {
> > -	unsigned int blocklen, remaining;
> > +	unsigned int remaining;
> >  	unsigned int temp, data;
> >
> >  	do {
> > @@ -472,15 +473,6 @@ static bool lpi2c_imx_read_rxfifo(struct
> lpi2c_imx_struct *lpi2c_imx, bool atomi
> >  		lpi2c_imx->rx_buf[lpi2c_imx->delivered++] =3D data & 0xff;
> >  	} while (1);
> >
> > -	/*
> > -	 * First byte is the length of remaining packet in the SMBus block
> > -	 * data read. Add it to msgs->len.
> > -	 */
> > -	if (lpi2c_imx->block_data) {
> > -		blocklen =3D lpi2c_imx->rx_buf[0];
> > -		lpi2c_imx->msglen +=3D blocklen;
> > -	}
> > -
> >  	remaining =3D lpi2c_imx->msglen - lpi2c_imx->delivered;
> >
> >  	if (!remaining) {
> > @@ -493,12 +485,7 @@ static bool lpi2c_imx_read_rxfifo(struct
> lpi2c_imx_struct *lpi2c_imx, bool atomi
> >  	lpi2c_imx_set_rx_watermark(lpi2c_imx);
> >
> >  	/* multiple receive commands */
> > -	if (lpi2c_imx->block_data) {
> > -		lpi2c_imx->block_data =3D 0;
> > -		temp =3D remaining;
> > -		temp |=3D (RECV_DATA << 8);
> > -		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> > -	} else if (!(lpi2c_imx->delivered & 0xff)) {
> > +	if (!(lpi2c_imx->delivered & 0xff)) {
> >  		temp =3D (remaining > CHUNK_DATA ? CHUNK_DATA : remaining) - 1;
> >  		temp |=3D (RECV_DATA << 8);
> >  		writel(temp, lpi2c_imx->base + LPI2C_MTDR); @@ -536,18 +523,80
> @@
> > static int lpi2c_imx_write_atomic(struct lpi2c_imx_struct *lpi2c_imx,
> >  	return err;
> >  }
> >
> > +static unsigned int lpi2c_SMBus_block_read_single_byte(struct
> > +lpi2c_imx_struct *lpi2c_imx) {
> > +	unsigned int val, data;
> > +	int ret;
> > +
> > +	ret =3D readl_poll_timeout(lpi2c_imx->base + LPI2C_MSR, val,
> > +				 MSR_RDF_ASSERT(val), 1, 1000);
> > +	if (ret) {
> > +		dev_err(&lpi2c_imx->adapter.dev, "SMBus read count timeout %d\n",
> ret);
> > +		return ret;
> > +	}
> > +
> > +	data =3D readl(lpi2c_imx->base + LPI2C_MRDR);
> > +	lpi2c_imx->rx_buf[lpi2c_imx->delivered++] =3D data & 0xff;
> > +
> > +	return data;
> > +}
> > +
> >  static void lpi2c_imx_read_init(struct lpi2c_imx_struct *lpi2c_imx,
> >  				struct i2c_msg *msgs)
> >  {
> > -	unsigned int temp;
> > +	unsigned int temp, ret, block_len;
> >
> >  	lpi2c_imx->rx_buf =3D msgs->buf;
> >  	lpi2c_imx->block_data =3D msgs->flags & I2C_M_RECV_LEN;
> >
> >  	lpi2c_imx_set_rx_watermark(lpi2c_imx);
> > -	temp =3D msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
> > -	temp |=3D (RECV_DATA << 8);
> > -	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> > +
> > +	if (!lpi2c_imx->block_data) {
> > +		temp =3D msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len - 1;
> > +		temp |=3D (RECV_DATA << 8);
> > +		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> > +	} else {
> > +		/*
> > +		 * The LPI2C controller automatically transmits a NACK on the last
> byte
> > +		 * of a receive data command.
>=20
> looks like transfer STOP? You get data, it should be ACK when received da=
ta.
>=20

According to LPI2C RM MTDR register shows:
When controller need to read data, we should send command word first.=20
     Bit10| bit9 | bit8 |          bit7~0
Receive (DATA[7:0] + 1) bytes    byte counter

DATA[7:0] is used as a byte counter. Receive that many bytes and check each=
 for a data match (if configured) before storing the received data in the r=
eceive FIFO.
We can prefill the bytes count to controller, controller will auto ACK afte=
r every bytes until count is exhausted. Then controller send auto NACK.

> > It transmits the NACK unless the next
> > +		 * command in the TXFIFO is also a receive data command. If the
> transmit
> > +		 * FIFO is empty when a receive data command completes, a NACK is
> also
> > +		 * automatically transmitted.
>=20
> Add empty line here.
> > +		 * So specially set read 2 bytes read command initially. First byte =
in
> > +		 * RXFIFO is SMBus block data length, when the data enter the
> RXFIFO,
> > +		 * controller should immediately read out and update MTDR register
> to keep
> > +		 * the TXFIFO not empty.
>=20
> Remove "should",
> why keep TXFIFO no empty here, data should be in RXFIFO.
>=20

When controller read, we should write command to MTDR(TXFIFO) first. Then r=
ead data from RXFIFO.
But LPI2C controller HW behaviour always send NACK when finished the comman=
d.
According to SMbus spec, controller shouldn't send NACK when first bytes re=
ceived. So continued read commands are needed.
But if next new command has been prefilled to MTDR(TXFIFO) before current r=
ead command finished, controller will continue ACK not NACK when first comm=
and finished. So two read commands are connected with ACK.
So we keep TXFIFO not empty. If confusing, I can change to "MTDR not empty"=
(MTDR and TXFIFO is the same register).

> Frank
> > Second byte is the first byte of block data.
> > +		 * So the data length of the subsequent block data read command
> should be
> > +		 * block_len - 1, because in the first read command, the first byte =
of
> block
> > +		 * data has already been stored in RXFIFO.
> > +		 */
> > +		writel((RECV_DATA << 8) | 0x01, lpi2c_imx->base + LPI2C_MTDR);
> > +
> > +		/* Read the first byte as block len */
> > +		block_len =3D lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
> > +		if (block_len < 0) {
> > +			dev_err(&lpi2c_imx->adapter.dev, "SMBus read data length
> timeout\n");
> > +			return;
> > +		}
> > +
> > +		/* Confirm SMBus transfer meets protocol */
> > +		if (block_len =3D=3D 0 || block_len > I2C_SMBUS_BLOCK_MAX) {
> > +			dev_err(&lpi2c_imx->adapter.dev, "Invalid SMBus block read
> length\n");
> > +			return;
> > +		}
> > +
> > +		/* If just read 1 byte then read out from fifo. No need new command
> update */
> > +		if (block_len =3D=3D 1) {
> > +			ret =3D lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
> > +			if (ret < 0)
> > +				dev_err(&lpi2c_imx->adapter.dev, "SMBus read data
> timeout\n");
> > +			return;
> > +		}
> > +
> > +		/* Block read other length data need to update command again*/
> > +		writel((RECV_DATA << 8) | (block_len - 2), lpi2c_imx->base +
> LPI2C_MTDR);
> > +		lpi2c_imx->msglen +=3D block_len;
> > +	}
> >  }
> >
> >  static bool lpi2c_imx_read_chunk_atomic(struct lpi2c_imx_struct
> > *lpi2c_imx) @@ -599,6 +648,10 @@ static bool is_use_dma(struct
> lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
> >  	if (pm_suspend_in_progress())
> >  		return false;
> >
> > +	/* DMA is not suitable for SMBus block read */
> > +	if (msg->flags & I2C_M_RECV_LEN)
> > +		return false;
> > +
> >  	/*
> >  	 * When the length of data is less than I2C_DMA_THRESHOLD,
> >  	 * cpu mode is used directly to avoid low performance.
> > --
> > 2.34.1
> >

