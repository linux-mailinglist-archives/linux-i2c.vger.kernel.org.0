Return-Path: <linux-i2c+bounces-8815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0379FE244
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 04:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96CD61603B6
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Dec 2024 03:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383A61442F4;
	Mon, 30 Dec 2024 03:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bViIf68/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2067.outbound.protection.outlook.com [40.107.20.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179112594A2;
	Mon, 30 Dec 2024 03:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735529507; cv=fail; b=OQp1pezhngjO19XxDwBLwcSE8RsfT3Q1IvqQHSvzD/XjW7h/YwbwpDGwthgizZzDnJ82pO0N4p9vEDgL1i/avys+dJdol97q8rguSRRe7FTi5nEdRPj7HVUqqAbHwDupwlXEt7+9u/R2Dn9Qeb09GSKDAQKQUPtmM/fBiqJ+MuI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735529507; c=relaxed/simple;
	bh=CK0k1qOhNaCugPbtOaqOePRi/5vrXHzIlQQeJt30ZA0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=A2qPu4VPwvpxq+wh44/N6ZXkcf6IwmHl+puvRZCkXzF4ZG1oWSxPNgRSORpZ7HwaK3pKM4tZpqMHyqEY4v8MrZgETNJcjRVVu67F9nJX4xOnwzUOSauLrw9Fswqjtz7B4aoNEJej4QYJLXmlykWRMBrrHmOlZjVJxRe7/ViO9XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bViIf68/; arc=fail smtp.client-ip=40.107.20.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p3izCzcSiRGrx9T4ZpKLQMloL/mK8rJIHgPqBLMIa92ZP+yAeeeOxHxp7Wyra7VwIobl0BOv1jJ2EQzt3ZFonvQS5NCDkuFbax+Hqv1kSXuQ0RsCv9Fc7DjGizbNcwXEuy5rB39WZVrIAKTgPoasMbiWCsIAid0In7RLkS/7avVDONIb8RzUp8HRlTvwzx3eNgJlMhJYQKQpYOaQxG3JmOKwmKDPIvkWTtnYMBrbr9TY4reZYcDop0LBMYGaqoeESXAKUYMfd0/PVio100pyFcDJbuXzCUtng4gMf3/wuHdAGgWtq1WOobgGgtdvW6PJ5m0aOc2ApKTJHx6i3SyugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CK0k1qOhNaCugPbtOaqOePRi/5vrXHzIlQQeJt30ZA0=;
 b=aF4B0J3cH7UMsvGxoLOQvifsffPJdFx/iWHGkt5mCvqx14MufDu/uR2kPmAy02bVgNCMpZtaOToSPfbDzc7KyQAQkME1b5s7VomEMQ1nAUyrQRzT/kdBPDXTJt6iiupgs6yg2H+rF1NyR2L9rzuW8LbJnpBRi9FJQEIeHmJz6PMg679FHrZc/SJARXR+CXARP7exwUsIuuxS8/JVOhen87VECMqO/KtU+TevN9G3q8RE83wE+pS9w0Irg4ZyeIJ2mNTK+W6RdJBPsBF2v5H0qCVRk6r7ey86e6EKHamfTZ5i1bLERK/tKB7L2FpRV1rNJkY4y/tarc9SCPknTGNBkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CK0k1qOhNaCugPbtOaqOePRi/5vrXHzIlQQeJt30ZA0=;
 b=bViIf68/AhTnRgIXkC4tPOYYfSWJ22t4HLXqzIXlrPXYrSEo8thgPtcGuPi75BWtcP1jvBdGfBIb9RjQcVGaZb/vjocn4yMcrB/0Rq/mSRpeaawqaHbdlH/+IrI/6Nlx8o4kRVbnyD4oy1T5CTb5MENzy9KvKyadLgBRbSnYpTnduoD/xjjTUK6uyTY+Db5iOLhE/zzX+V2ggV+ysYo71PCmF5M6wwNGzDYgyTKYZ3dw717du9lQ3K9tD/IE5RJUXMKxJkCwbjrgPBWgzLO2cq/7yRRtnaPa9Oa014SDw36MsL9DF+nuryrqsAgGF5cgklp7BQftqN8nyRSkGFZX8g==
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DBBPR04MB7707.eurprd04.prod.outlook.com (2603:10a6:10:1f4::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Mon, 30 Dec
 2024 03:31:38 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 03:31:38 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Frank Li <frank.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] i2c: imx-lpi2c: fix build warning "function defined but
 not used"
Thread-Topic: [PATCH] i2c: imx-lpi2c: fix build warning "function defined but
 not used"
Thread-Index: AQHbWmtV2Q4EFmNpBUu+dt9E9TzEfg==
Date: Mon, 30 Dec 2024 03:31:38 +0000
Message-ID:
 <AM0PR0402MB39372A83F672300DC38B3074E8092@AM0PR0402MB3937.eurprd04.prod.outlook.com>
References: <20241228090852.2049321-1-carlos.song@nxp.com>
 <o4hxr2redr6dp4ot35pbc5vyjldiec6sxy72xesharhphsvdsm@mnufmvmpd2dm>
In-Reply-To: <o4hxr2redr6dp4ot35pbc5vyjldiec6sxy72xesharhphsvdsm@mnufmvmpd2dm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR0402MB3937:EE_|DBBPR04MB7707:EE_
x-ms-office365-filtering-correlation-id: e900cffe-101c-4b7f-553c-08dd28827819
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hJ3m+dvghGSE5ziLZ8waWUncZ74gKKXp6MvxyhRGDIvyTzVWB7Y0euVKhh1X?=
 =?us-ascii?Q?DHoUNujIv4v6QZ+Rv3eSXxXOk6daogKU/SkvAi9S73ELDqA07Ke1cI4HK9hm?=
 =?us-ascii?Q?JOidmh5q9M7Lploy41d5+3rF6mnLgv8sYLKH9N1Zgkct4p2Yq7c4/lVXzudo?=
 =?us-ascii?Q?Wrum3ba+sE8X9SHFXdzQq6LqZpMANml2nrw7+QCMhLgLNouX1nZ5cxQ/8rOY?=
 =?us-ascii?Q?tYeBTrnw8Dsw5LATe8TvMuqy/P3dNYx0reGDPAbkAkknCZSs7PxTxr1lnBsn?=
 =?us-ascii?Q?6pdn5N8jGtx5uNH4+tvVPKWLHcp2kpLcQWpGMUBIiA0zE7l9SdMSmoMYQ1n5?=
 =?us-ascii?Q?lZnNIwAnv0iBu6+TCK4TSb228ij3hFJYwHQ8A2aY3b+i2ImheBTA78XQh7iL?=
 =?us-ascii?Q?7YvWMzaTvpKsgDcdyRd4nHX+C825U2dAqxFuyWX9tGo34mvqV9BydP1khV3o?=
 =?us-ascii?Q?fl07/YBdQ5RkEQzsMd4PnUwThWxQ97dd/vYkFQiBakNK/9N109Tm4arO/R0D?=
 =?us-ascii?Q?Movs+3Q9XIOdbvjUMY2MaB0NB7dFEmGXka9IJSJQ+beqDtOXnh3YA3bh9oRk?=
 =?us-ascii?Q?NTCm0WxTsRY+kG29gzu5PWck6WpGBkvRWKEIKnuVg0IG6+Pz1mZ6CFjslkrk?=
 =?us-ascii?Q?l53fbWLTsvEoy75noDVOctu2HpY35Voa3TJ4uSRbZUbfLclIVJuXLoWl27oW?=
 =?us-ascii?Q?hmtKabBW6TdXl5V0s9+BqP/IPFV4oFzHyjCoXzST6KJJzlX7FkwFkBnrS5MI?=
 =?us-ascii?Q?Ck+NlRT6ObLte4mHAk6iYmKWQARAGm8mCv0AD2Q76dDTA4e2N/NEyMv6Eoms?=
 =?us-ascii?Q?NFH5IqMtnZjnUjjbmAUTvwDbXhWhl3ZdzGIhoTQIMm99pT8x+FlS+/AbIuHf?=
 =?us-ascii?Q?P5LqcsDcKfjJeHVfjUZ3EH1IGmrPAIhffbLz0zH8n5c1Hc6jEH4UbW1dmPyP?=
 =?us-ascii?Q?ORwdpu5z5mUF4mLtSFvFlHd//eTlg3FeuPntTZIRtyNj7s4okv1RrOWCfVn5?=
 =?us-ascii?Q?Lje1OTClh1/JwTlWGZo6tnA15pc65Fe7cF65U86Sh7ZIdejcsgg42qhjqs8k?=
 =?us-ascii?Q?ncLvJq7v8UNWBOhAtJSr8eT2xl+rjhnm1ElSgGHBroR8ycOf2sAxN5OWKZqJ?=
 =?us-ascii?Q?hKAhkooiuyIJnw+9J0uVnogWZJSs1sV9v5uuQCvkPfaA47ojSgJbgqDFoPpU?=
 =?us-ascii?Q?IHcR6C7+BCL88jmdxLpuz4TKYLT2hz1PmxAzYC06l7wM/n1yPH8owbQBYf7q?=
 =?us-ascii?Q?8qiKc9lCy568/YZaaae0jBAwKG3W3nDfUJYQSmig98gH+GaLve+dHFCv/kRB?=
 =?us-ascii?Q?mQqB5L7U1Ab0zMfYgsIWFTv4+x2sRrEptFQhSgLbc3IENEh1ekUEVgmN4DPf?=
 =?us-ascii?Q?WenJT/e3O6HwJH6gX1qfS5HRUHLSn9JiAP4WzLK3PQx3hY6YQPvlcBSqDokP?=
 =?us-ascii?Q?DI3l2HO71ogVREddgseMIROIdKoUIYgL?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?17hs7sqhiWA4DVBhJG8pgtM9lc1WNXD7mVlTOv2jPm3DIGZCunBrd/U+qs6F?=
 =?us-ascii?Q?hoyDcr2MlvVtjUGCE3Rw8n5RcJNwNMUi+9Us5oHHiu+IQcfwNIridWzedAL5?=
 =?us-ascii?Q?TRh2Itsl9VYpKMEwDKL+V7FWJy3UfCr14RAQn8LN+4WIqnNAJlIDcQeHFOwy?=
 =?us-ascii?Q?xboH1qNT8VF7uHRnaKyvCoEvhFy5Inmxi+oXgIw5ohM8bjd0nz4ut1GA85qN?=
 =?us-ascii?Q?0WLleZ6mJEpc4kQ1DDhF0sCj8rlBTKjzJqZURXIYmIxvaUVFlDrA8MsqDUyY?=
 =?us-ascii?Q?FEuLyy9VDce1v6Wr92gmTR2jUTvGA+P/FJeOBltartjLxgJH8AiA2tFnmkRK?=
 =?us-ascii?Q?gR1BCZ4k9bCEuPquYilz3GMjreo520Kao7U3RyBRN7xGZep9/ZnAiTStNTUl?=
 =?us-ascii?Q?GHu4vUj8eTFTwobQ0AArzyz4ZS3ffiBBD8x8mEvmpVWLgHKI2dx8OpyPpPgC?=
 =?us-ascii?Q?yZd+eunxGqHNg7ugB04zr2clrBaCjMnso6QA3pm0Tb/LrAcwdu8gZkezyPCa?=
 =?us-ascii?Q?z4QtD6rMK6dN7Km27jLp0gGD3LtPMgQczyhVu0U7ZvNFztmFRnTMx49o3dhB?=
 =?us-ascii?Q?j/JKE/AID3fj0g6ZjJNoVkdwowpFtr0XA2RWABL228l+wBx+xLaWd6Kl3qxZ?=
 =?us-ascii?Q?wkcTtElVCZR89ix71pMHc5DnE5pOOxsIxSfhY6qIxWFqQV/wReeYJRV/J+Fe?=
 =?us-ascii?Q?AW5aZ6h5y3qfr8Wf/UfrKSqhrSUkqnCtz1Ox5U/MNNxdnxo5S5yt0pdjs8VA?=
 =?us-ascii?Q?yFZkRvESj+WKlBLjGrQyjQGxv4TNJkoAoxstT+epFHZgd5PIy8X5Kb7g792S?=
 =?us-ascii?Q?40LFZfkORxh89rdBKGFPS893XOfn/0LFLy0V5NslNqdiCZHwR5pEXjLq61s4?=
 =?us-ascii?Q?oKV+1TddNaRVUBygjU2ESeMvAdYJUePh5PQ4zskdnvXienujTV5G2tAKFTo1?=
 =?us-ascii?Q?9gFWDYWZ4GfcZF880niBLhpTLPvXchgGsc7qUAuzZqsX9UoX+QmazqP+ruhG?=
 =?us-ascii?Q?5cNgKU4+ELX6chC8wYLiqr6G2/MsYdhcW49pzS4g4l41jh/t0pmU+iLdoR8b?=
 =?us-ascii?Q?14jrGZDAUUZMpceHnFqWedP5o7QCCvUOQp8k9NWZYogi+tKUFXXR9vYvm34t?=
 =?us-ascii?Q?fekNds60wxa9Wg+ytLW8ak8P6Fm7N7jRF5ho4KZ+IWVFncfGeFxUA4aJ6cly?=
 =?us-ascii?Q?4l3GDouVDDCq94Psbu0lAyT27cfqIPTyQVYEqfv7zv6FzELCFwutOSyU9x0v?=
 =?us-ascii?Q?vDnRHLiJGbjIxoiLM2ITiNmM5e+BGQtyNWfDo/Kn+PiBXTObGp7Sd2wp+1Ru?=
 =?us-ascii?Q?rIFHS/J2IBYQnZYWh7AdMP3R+hpSljPU3EeD+AMQhtTo4+YAvWQLplpplwDW?=
 =?us-ascii?Q?A2G6hnFZiAsuoxXMb2GvvIM0bPD0W1xKPLVN/ioHSWbXg5tzuZiZNt35oAZ7?=
 =?us-ascii?Q?nFsfcKlqkreEuMAjBhDvArxjjJjjJPfYbYmKAfQnSH7U8T4Bcj2Qb7LcBRW9?=
 =?us-ascii?Q?gmbhKgxpVCOg70qhf7v2g0ci+B36UMBkV/jSxy1PsVdLh8AN/9/xnsywrLNz?=
 =?us-ascii?Q?LlvCnBUC2MJtoZ5es/bmcqalo7XIJp2MM0I8tETx?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e900cffe-101c-4b7f-553c-08dd28827819
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2024 03:31:38.1849
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9WSYCdbVz3UL3n/K49hQr1xfkF+IfswKqVcW/qVaRdx1+mqzd8C/N/Z/3fJYeITc+TVAX9O1kv2Zy6EyGzSODQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7707



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Sunday, December 29, 2024 4:53 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Frank Li <frank.li@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; kerne=
l test
> robot <lkp@intel.com>
> Subject: [EXT] Re: [PATCH] i2c: imx-lpi2c: fix build warning "function de=
fined but
> not used"
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
> On Sat, Dec 28, 2024 at 05:08:52PM +0800, Carlos Song wrote:
> > lpi2c_resume_noirq() and lpi2c_suspend_noirq() are defined but it
> > maybe unused, so should add __maybe_unused to both functions to avoid
> > build warning.
> >
> > Fixes: fa89723f7a78 ("i2c: imx-lpi2c: add target mode support")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .kernel.org%2Foe-kbuild-all%2F202412280835.LRAV3z0g-lkp%40intel.com%2
> F
> >
> &data=3D05%7C02%7Ccarlos.song%40nxp.com%7C0c5764a988ec4915626008dd
> 2781b4
> >
> 9e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638710160215605
> 166%7CU
> >
> nknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMC
> IsIlAiO
> >
> iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D6of
> o%2B
> > sKqDwcvVyfYcbSnnpSGUfT7abr7leD9gJ9qRy4%3D&reserved=3D0
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
>=20
> yeah, I have different PM configuration to catch these kind of error and =
I missed
> this.
>=20
> Rather than applying a fix over a recent patch, I am going to remove your
> original patch and ask you to send a v7 of your
> "imx-lpi2c: add target mode support".
>=20

I also start noticing it just after the robot's report. I don't see the war=
ning at my previous local test so I also missed it:(.
Sorry for this. I have sent V7 with the warning fix.

> Is it OK with you?
>=20
> Andi

