Return-Path: <linux-i2c+bounces-10263-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CB4A85C51
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 13:56:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2F463A3DE5
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Apr 2025 11:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 454DE298CA5;
	Fri, 11 Apr 2025 11:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n6deGYEz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2071.outbound.protection.outlook.com [40.107.105.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1482E1DE3C7;
	Fri, 11 Apr 2025 11:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744372538; cv=fail; b=BSlQqO0dSVoZQ6scg+ocngqUV/w/OYduk2SpCfs02RGyUdOgHvkxQTsSuDsGKqGPlrczdeLNACyF4OIuFY0SU831PN2DKcEQgOftZiTZi/6f4vku6BJ0qT/2Zw7b5OCrdfGaTsoHcNU6kLyghqQXzxghlqHC4jRm9M63/zFAMqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744372538; c=relaxed/simple;
	bh=0//UVewGhuyKBto1zgoDdVH8hLVfYM6enMe2AY8QWXA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NbGGCd15vJPlImCy7pMOpuc3M2VcCWV/kp1PlkhWhgW8coA+mAi36Xo6LcKjZuQKe4YsYkQrr+wgSHttRvagF1ClMbnCITM3yHclhudqzt21SVxxhXoFYFrQTQSK6hWfe0NyBOoTep+mjouNGtcy47TMfTtIG+tM/bEtbFYPTKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n6deGYEz; arc=fail smtp.client-ip=40.107.105.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vcQbGi5CfGrhARQvzLuNk1xB4BAzKRgvLMnS96y6hCBpkEhXhe7l8sry9j/p1XdipW61OD+ZiOFzhLYRdbJtq1pmKVpK0grTGVJ8U6SM/gBsLbjySiNu3QP6nZTtnPXKRXZucYC4wzIa5bHktxyFt66onxPJsoQjtZnlkfoDQw6XCtK/ku7/KYEXY3XqP6v9a2C2eIcjkiX/g/8+mtkGfbLmten0hQRS7VsGtNxhex/okdeASResmpAaUc2F/mGXIbdqXKZv0s63DCzoStTmJ7keFI5lX5WFIkEJAuM0LZv3VVriujzj9Pi1WGSLYXa++25m60p5oZ+OK8Mm0gF9FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0//UVewGhuyKBto1zgoDdVH8hLVfYM6enMe2AY8QWXA=;
 b=Cy4vQtznpSxOAu4Wqn4Z69bmv5l11bUzltmU/YfqzJddAa6kjU0RzAHW46zR4lMpaqiIKVBaCyemcCO0vzdmdETYv6vPKK4NpVu/vhEAcNpxKxI4w//XLNRjDvMhq48WSBUqgTIJ+ArYkIL86OEYrkBzqDV4v2kmgdTf8XdtUdMAxhz7zr/IUf5UjK5zIY3xtqCTIgGfICnVthT75JpRK/eVm+6lcy5wyovAip2JTOXOtjcm/GaS3GlG+voaKuGytwFGfUdD0b2MiN/sC4VrOjKGy/Bj4EFFwqaWzizKTgBlk/It6zDUgOoZl35w4mcjYrO+aoMLGo09OYGYbQ9hkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0//UVewGhuyKBto1zgoDdVH8hLVfYM6enMe2AY8QWXA=;
 b=n6deGYEzojNzJlC6QJ4rYuJo2+CnZOhIRC/MQRQ/93EywIMbvgDEQQq85BTsTWEpSm4nsiI8kXPdFb6v9FGzAKNe665LXYT/RQOqNZIZk0zCC/fZxz22ehn89VymJ7AucH2IvH6KfBIk10GzYiTaAcgHZLG2polSIvmexjaWxMCGYHy0YSN+FXad1Ho2ddMjlKrvsVtkPX2VC03zJfulY2bXo3JQMOkakZEy796WtOlAJl/VWD2fwIkO7oc6Ra34mYWu69FXtIMAC24TdEeX3biBab99MYhLBJF9MhpQz99vpecH/8gI8u/ASclG5nrcbcEKZ0faUB3ypB+SB3QlsA==
Received: from FRWPR04MB11150.eurprd04.prod.outlook.com
 (2603:10a6:d10:173::11) by GV1PR04MB9053.eurprd04.prod.outlook.com
 (2603:10a6:150:1c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 11:55:31 +0000
Received: from FRWPR04MB11150.eurprd04.prod.outlook.com
 ([fe80::3e8d:a3c2:53b1:d586]) by FRWPR04MB11150.eurprd04.prod.outlook.com
 ([fe80::3e8d:a3c2:53b1:d586%5]) with mapi id 15.20.8606.033; Fri, 11 Apr 2025
 11:55:31 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>, Aisheng Dong
	<aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Francesco Dolcini
	<francesco.dolcini@toradex.com>
Subject: Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Thread-Topic: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic callback
Thread-Index: AQHbqtigSj13alsMDU6r8ZwC+mAwiw==
Date: Fri, 11 Apr 2025 11:55:31 +0000
Message-ID:
 <FRWPR04MB11150B555044300A70102DAF5E8B62@FRWPR04MB11150.eurprd04.prod.outlook.com>
References: <20250319145114.50771-1-francesco@dolcini.it>
 <20250411114738.GA43965@francesco-nb>
In-Reply-To: <20250411114738.GA43965@francesco-nb>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FRWPR04MB11150:EE_|GV1PR04MB9053:EE_
x-ms-office365-filtering-correlation-id: 34d988dc-8644-40ea-aa3f-08dd78efc29c
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?OpC+gCbYuZWuy/3csFBIWlGKZIqVPLLgVtGoA67gWyyD83sCJwSlrN9EH2kv?=
 =?us-ascii?Q?eygKbbVTuJ7NEJEhyRh2A5BGf1KMZI80eQgNOBJiGC/uOkpyv795Q2oTKKkm?=
 =?us-ascii?Q?bB+c9QqY/xyEKhrstDQaG1eey6/I1+b1JEZJPS/gj/HeG+6BdzQU0d1VZP7/?=
 =?us-ascii?Q?XB/xvZS0p2Q8CWz87Wsyzw3CaYS5knoiQ9zngm2ADHjPj9mgvo9UbtiGrxC4?=
 =?us-ascii?Q?h5t1fp/OFSTefUlvXAiJWmVRGUMmQISlR7CMlzEOr4JOw0/yRTpLMk3iNXz5?=
 =?us-ascii?Q?3oxz4FXYorBZ9Ez7grbHqszSdh9Pb98dbWkrP8RjofssETWQd/PgLrx9fP0X?=
 =?us-ascii?Q?6YkPBq6pG6JwOfaP9Onpm09V1w/BO+9kZbvVsDTixwBYDLzb7kEMcKyGZ6iS?=
 =?us-ascii?Q?jI5nFI9eQP+Hcg3RGIJF6CxM23UDP+kq57YvNT8URcZXEKg7hmOkuT8JG3uU?=
 =?us-ascii?Q?rEyjfnwWYWcgknUHjoTPTyUnf9CHn2QvO5uF00XMKSYP8d8nMTZDIpKWalqX?=
 =?us-ascii?Q?j/zfo7AGt3e1XBtT6isueQA6JmNQ8V6kO6mnlZWbYdTZYR38VkPOGWsR4oJH?=
 =?us-ascii?Q?rWQGXRC6WyGkHLAxXGX0YaJtqdEjQmKdvs8BbY/LQ7y7qaQ4WVF02vo6NKMY?=
 =?us-ascii?Q?7UZ0cFGUl2iPE9zdMetMuSX/evKQOk8bEaCe4Qu0m2c2paWynEZZZsHCUvRp?=
 =?us-ascii?Q?21rjXl11e+EA8knS+Fe4FPB38xPc12crizlGjIvg781mWqbWYC1TCqrUqxO3?=
 =?us-ascii?Q?edP4BdR956U788dmox5VaQNdg7uYu/O63d80cqefTfJlZPqcuTm3VQBmwjPc?=
 =?us-ascii?Q?LI6wZKDgBzy9d4bE7C6Qoh2qctkFtosvn7UM7ET18+ZHr6DB9VTd2Sum8B/e?=
 =?us-ascii?Q?MlRAfAs/8E1OGMj23NBjao0+I5FZvmTox5SVJrYcjTyHDwhGsoYzdhhEJs2t?=
 =?us-ascii?Q?UqnYjValW2rZMO2lw+cEqM4GNaQ7UaeA/6RB2rnU8BvNxhj2l2gv8bNwZCsK?=
 =?us-ascii?Q?QgvkjbYQrZukKCDbDfAGDcvoO1rD+KfGkiz4moYG7LHJ6V1AsiF6973KSj/e?=
 =?us-ascii?Q?f7nVVkcD1IDXQE+8ab8VEGFMfW8U4JRd0DPGg7ghR0xUce7uiImaVOEMfzr6?=
 =?us-ascii?Q?8d0DCMfmhcKa6w4hSXUfMzIpk9S9ehUgdU5LxHAHktVnj77TO+nGhAjS/8cN?=
 =?us-ascii?Q?59NS863gkqZrIr6BOwIO2Pvc8NOuBl1HbthwryOgHvN3o4OXzftgIgnJ2/rF?=
 =?us-ascii?Q?MB/1kTQZSxIaIeQ46R/48R4HHR2o1+uQYFFtCT+ntFeKYJzRrBC/p3wY0B+s?=
 =?us-ascii?Q?DpFKy3t9Bx4WWdahU2QveGUAxHrPSGF3D6Vm3MV8TQk8zvt8ZLfrGxPtxusB?=
 =?us-ascii?Q?7lsLPZWRfSqX9uQPCbA++TuEjbZ5h1ZQcyQ4DZvN/JP9+lV2tTH2RGGZz05H?=
 =?us-ascii?Q?Jb/FKFR/Cb/szcIpNy+CNDOwc4TE21Ipwq0j0fOgavDevZRzulZClWpk2MlY?=
 =?us-ascii?Q?8tA2rS2eMN89NHU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FRWPR04MB11150.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6u1XUia6ZElrIA7tl5zPBpyhBRWaaHIvMnGAeIhJRyzQv41wQz8086Lqby0q?=
 =?us-ascii?Q?lkQIF6SyeUzwiwg1T97M2bj+/xvAo7NL9MyoFo8PCMwgedJFJr3JNOwtPtB8?=
 =?us-ascii?Q?Lq3+qyfbsONF9Zx8akGBzQdw6oxRS8gV3DvMDHivVohEnZSGrGgIRqDQ9VsU?=
 =?us-ascii?Q?3DgrCMFrnPzVteduHQimxyUCpil+8bsoUXRe3Ghh1RtzsKTLQeIy7IbuLZ5O?=
 =?us-ascii?Q?IzFq0O9DcgB4e40JpigMd26i0AyOk87BBU4aGBq7ysj9V1JXUdCScJoj1VV7?=
 =?us-ascii?Q?aPvH6gBEAsgNbgxKsodh5GgzwIX8wo8ljXpTwKcGVK0QFXK+/C4GmeSQZTAL?=
 =?us-ascii?Q?VQbHKDJ2FZrWYuvz3M83RfYT2dIBf9rMZ7iW7lwfn8iDZAmn3ShC2oE7ek7D?=
 =?us-ascii?Q?BzJ0OZz06hfys8mvcex4wYjm+tjVSKQCUz3POaNpSnjCzNQikLA7bNOy2UVG?=
 =?us-ascii?Q?ecuyAjj7OKlzKzrHvCprs9XcowxL2VCwdFPlHgcBMvB/owYbsd94BluNqog9?=
 =?us-ascii?Q?Vat/Xvusbg52t7/0Loi02FJzPwWeJnfA5bj9xMLHEqpQH7c6kC8sTdpCupZx?=
 =?us-ascii?Q?MjkuV8wLpS2p7B8r8WovAN0ki1Uv0R88wrXj8xF79Rnx8w8mpvdYJegksyGT?=
 =?us-ascii?Q?smweT3hAqiaEOPT8fZFiwNUNIATdmPXhe5Sc4gUIqQRJOBytUymhnCX5YOs2?=
 =?us-ascii?Q?gJ5FlzEyCWmAcYPmiHJzbtRpC3YG++Xu1nfvhpY6CSqzFEiV2Q8ZgZCBzT9x?=
 =?us-ascii?Q?0OoXWrXba9oj9usyA1CXYmfRb3f4EjlVsJT5IkzBLOo1ZM6kaenECWsSp2gJ?=
 =?us-ascii?Q?AwsXWcOmUvJOcBzG90ekw89NtcT2Pa7mQP7hbewj7UZ2+46sRYZKy/xb7+SP?=
 =?us-ascii?Q?2s3DWxb+04GmoeSi7sIHbnhMh2X0ANdBCGguT6SmnO0R/xP7bawJv0JxnfSe?=
 =?us-ascii?Q?3SUbm/PBgt8u2fRTpooJqSe+3PkT0bBFcWTHK3BSZPhCOGHozICN6ckULIUI?=
 =?us-ascii?Q?1i45svL2MusHc3hxaQi4IOe+VLXI4sFDLWO9t4PqUg7JvbJIwzpXDbOgNMNY?=
 =?us-ascii?Q?9mEC9N/m8RKPgVxtyyxDRca1a2yE6QX9SYu1Ex6kHonf0/kC/IzVd3w4lalP?=
 =?us-ascii?Q?JUGh4vQAAB91OhmJdwu5bVA05qGiHymZnr3FLgnGiZ3spIQ7lyJrFh3YKczZ?=
 =?us-ascii?Q?iDy24FpjGDBLEVTm0EqtOyoaZAJPA9oA2CbxWlt6e3/XKDnTUGop4Cjw6Z0b?=
 =?us-ascii?Q?buFCz4vY18EFMWmNrE0cCynKFT5FtY/y6HlD74GNLks1HCH/NcZm4GfziEG5?=
 =?us-ascii?Q?HolW6HMV6dSnPjq42eBV4AW5WJXTur3tzTMJ1rTzltJ0rVKudu4OplfEILLg?=
 =?us-ascii?Q?uw3uBXCNWaKu2LVlHcQU+/UnoQ5e/dPlhWSA09VuWJ/nQmvHcV6DHc2ZCwOB?=
 =?us-ascii?Q?v3gYwqZC6uf7W3s5PG+FAD5CXjMR9ZA564OiAgae1zp1Q75X5wv7eRPCKMUm?=
 =?us-ascii?Q?zC+UxKGXXZBTKvghjGketI6+Qo29lSg/+/uLOzw4u2D8mMJug7UxMtCef9J1?=
 =?us-ascii?Q?GGDrLAScf7mjShrlZfM=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: FRWPR04MB11150.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34d988dc-8644-40ea-aa3f-08dd78efc29c
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 11:55:31.3586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R8uka4Ldl39SvNDDOeCob9rbiLvgNZQ/b53OIUTPr9FWOUyjGcIAW05DxEQbozJfWn8P+AllYr7z2Oz9MtrhyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9053



> -----Original Message-----
> From: Francesco Dolcini <francesco@dolcini.it>
> Sent: Friday, April 11, 2025 7:48 PM
> To: Aisheng Dong <aisheng.dong@nxp.com>; Andi Shyti
> <andi.shyti@kernel.org>; Shawn Guo <shawnguo@kernel.org>; Sascha Hauer
> <s.hauer@pengutronix.de>
> Cc: Francesco Dolcini <francesco@dolcini.it>; Pengutronix Kernel Team
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Emanuele
> Ghidoli <emanuele.ghidoli@toradex.com>; linux-i2c@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; Francesco Dolcini
> <francesco.dolcini@toradex.com>
> Subject: [EXT] Re: [PATCH v1] i2c: lpi2c: implement master_xfer_atomic ca=
llback
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hello,
>=20
> On Wed, Mar 19, 2025 at 03:51:14PM +0100, Francesco Dolcini wrote:
> > From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> >
> > Rework the read and write code paths in the driver to support
> > operation in atomic contexts. To achieve this, the driver must not
> > rely on IRQs or perform any scheduling, e.g., via a sleep or schedule
> > routine. Even jiffies do not advance in atomic contexts, so timeouts
> > based on them are substituted with delays.
> >
> > Implement atomic, sleep-free, and IRQ-less operation. This increases
> > complexity but is necessary for atomic I2C transfers required by some
> > hardware configurations, e.g., to trigger reboots on an external PMIC c=
hip.
> >
> > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> Any comment on this?
>=20
> Francesco

Hi,

Looks good. Thank you for your work!
Do you test it at some board? How can we test simply?

BR
Carlos



