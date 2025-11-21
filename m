Return-Path: <linux-i2c+bounces-14205-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF64C76FBD
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 03:16:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB2964E6E87
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Nov 2025 02:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6E624DD15;
	Fri, 21 Nov 2025 02:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hP1HYBG5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B975123D7DC;
	Fri, 21 Nov 2025 02:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763691257; cv=fail; b=CvgC3rk5hDU3qWt5R28/ZyL5aHwyg8BBjNMITQP66R5fJp+LIfaWUrWoP++VGLubjOASgGxvh2THjqE6UNLJ1oP1MjjmFp1CgqevlLav9lgBwbWTEeKYpdE5AKMg8SGwbsAms6jyIOk+KrVVOxo2rlReoKxGX0XTSuShq50hbRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763691257; c=relaxed/simple;
	bh=49picvbKQm0rSDgoUX4maIt8Do3JYIGamKLu46YyDs4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P+7kCU4e9d51zWcHscf1Tx1fTlAyv5u2TGsmC4gCmGx4ipP6AqQvvLJXBOTerjnVsJ65b88Ac92+IkuBbDv8DzSmBmdfVW1TAJEJgN2mDMnYoHtVJqB/iAOt5ReN90ZV4aJw9zi1n4o5U4E0VJryP936mB8L+ZAFRvoZIz+tcZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hP1HYBG5; arc=fail smtp.client-ip=52.101.65.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHzgDQcyL4EHCXag/YeEQ/P0+MxCyw6vzkknJcPqWG9pLv2PHUEzjABPNvR+BgGgqA1F73RU7pSEbPCf5L2LgNr7voD7Hbl+Xw14zEYDvFe4kK47UdZBFjx/NuRjEYdbl2AotyiWE7yRA+Lg5fN8VHAsbt2Xsgc3/3aMyOFy9Pmas/IHNpM1+fn5d0B5O/znC9Ei9TT8DB0/f+CWCwSMlb/DwLROWK/6ApdYd5AqwvjCZz9G9EnshZZLUkTZyxX4BNBAixm6vj+PVlRwYYT0iMqBIaCFCuQbtlhrsHKnz/EGoEvIvt0T1vS+aROnaDAJmTcYQWKKRyoq3cGF/9eR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlIDTseVVxJaz/1++6u7aFw4BAkiI0WVNwf/G9TzGg4=;
 b=grX8gtolaqdPMWwl8Fbb+kswfjjcHfD9CL972U+KnsIcaey8Uy81G+iTEWkX75eCHICAQvAQCQIlEfduUvoY0k/P2ZK4dgTPyKFzVoGxb9s6xXZ0q8kp41rzv2wzyknXQo0KlQISwhiK0EGh1RUXDluHdS9tP4nCuQS28jRlKnDQcW/0kQbtC/lCHA5nAfHiSu2uYDwILhIpxUFeWuKRWfcOIzVYvtiDuXwnuNKOxXfd2Fo6X54pnVXFr+GuWo4W3CVCiUQC79z5DaTzG9ljvk20i5i+r45fp4U7GXdKTkD8qMZEcz5t5ShI0uCzmk4WqlvQTIq5IDcJKC1Fx2Fxxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlIDTseVVxJaz/1++6u7aFw4BAkiI0WVNwf/G9TzGg4=;
 b=hP1HYBG5Wnj6THjwlEbNFKRX4/qsPJPMfOtHtbkpixTkf/IZygeniHm3P2/8O7ZeOqy0UiUaGMH5T342daezvwqAVi8vNvXNmcaIb/g/QmhiagXnDpUoMdvhS1fVkvgvm54swyB4XGNrG4Qz34g8vqk9+6SU83tzdUfe/Ux+J0+9SBcH9+r8xYGAZpVXIwvZFsCnXdsOl4ZQPpknKqH4Scc1mo+jG9aoikMTqwVTsuiXfUZTOAysFkhC+CG1DgrhVI/GxrTpqnrp5DeCrP3KJG7dl62zrTk8CvygYhUKcpn9Gk0hqyQ7swWnl2mlY7qe598LSqFXBGqwyq2x8q7ucw==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AS1PR04MB9311.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 02:14:11 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%6]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 02:14:11 +0000
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
Thread-Index: AQHcWHxqlWTPlh5Ac0iXNEld6mAcI7T6NoMAgACgHJCAAOqmAIAAo5Mg
Date: Fri, 21 Nov 2025 02:14:11 +0000
Message-ID:
 <VI2PR04MB11147E62979D837F193A345D1E8D5A@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20251118111323.1452329-1-carlos.song@nxp.com>
 <aR3z4PBN0+0fKqz5@lizhi-Precision-Tower-5810>
 <VI2PR04MB11147CD601B6A9EC8598E13BDE8D4A@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <aR8/Bt77UWb9G6oI@lizhi-Precision-Tower-5810>
In-Reply-To: <aR8/Bt77UWb9G6oI@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|AS1PR04MB9311:EE_
x-ms-office365-filtering-correlation-id: 2a5a20c3-dfee-4d0e-abac-08de28a3a8ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|7053199007|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TwFMDgDU6i+GkTjTWr4IQ1VXIIEwN0iIRWbGzfirMbxBb92ZcagSTX5chkfW?=
 =?us-ascii?Q?R2kKzrTUeXX+V3bf1ufwdUxkuAxH2apyZwPkug8hE4WDiczhP6QTTPH0tmvk?=
 =?us-ascii?Q?rfFiFQZ3bxVMbo/AbiK9hDOPrC0mJc69SlyAPYYwCNxj0IAZ/ATDEkf5grcd?=
 =?us-ascii?Q?Ew2McaXhPsAiPX/4eingGbdv3skgFsR6QzjoxA7tPk/oxiETAOzR91/fWHDR?=
 =?us-ascii?Q?lAfvJSZE7kYPyF4fFyI76DpZYPR6OEJHlgdjZoIgqRUpaMzTGLGYyLxSmJIy?=
 =?us-ascii?Q?SpzbRpbc+6sVzhErDdYOkmcm1P03QCqM+mbOXkeROMOxnvfl1a2P7xF6sUAU?=
 =?us-ascii?Q?Y4ZspBlXizX9Uhgnr4HK+miDBlklw8hFrmayFEQ2bC5ZXbF4sT9BebHZY/7m?=
 =?us-ascii?Q?HrS7LzeWNoaR1kEc2C9cTAwcfQHc3jFsUfxKbFQfK1PgVpFFPA5e9sMjN/Lx?=
 =?us-ascii?Q?hTR8gvqeDW7Vo3Cz0/80Sf/ay41avx5oSXeZUgNT0gXj16XCXol9OIHzxwkQ?=
 =?us-ascii?Q?MTnKyJO24qO2rhrWBwBcC6EdYY+8zfXi/51+CHoJV45B27lfiT/T7foCcg4/?=
 =?us-ascii?Q?lbXk7DHytaf32/L++q5IFoRFE1lcfPx6QcWh8z+857idHKbQcKIxV8I4poHX?=
 =?us-ascii?Q?aGt74gg9BzQDXbW7NxIsQ5HIFQ9umD55uimZB/CAFRMdoFQCrYSA/v+HpU1a?=
 =?us-ascii?Q?Wj2xEkABh4UY6xAdm2hMp+++HkOAP9CoMJG0V5OjcZYWCo6RtT+LfAkPKYsN?=
 =?us-ascii?Q?/bKVC63BO9sd8b+idYcNKOCHQbTCVj9qBdLJOxL/aj6maMpiQmciwncjNjRH?=
 =?us-ascii?Q?rnLSa3nEYCDIPceAj8XrNNYMyHefJNJkpvpSYeQuvsEbXMKBP8prr2fc9+uR?=
 =?us-ascii?Q?qGuGPJJEmgeC83RAZjUheK9SGjd1H5zYWerQbR5IKoxXJpAyNbm24o8ovvgF?=
 =?us-ascii?Q?RHO36r6fTXohArzXtJvzUf5i6EsVPqIzsXPqgzpu+J5Y834uwQHUIuTxK6nx?=
 =?us-ascii?Q?3MObUMGC1sPay3pTSdwnq3jC7LiDLPdR/Qq0Eck3P92BOMnaOyfTEimV7FHD?=
 =?us-ascii?Q?gXWu5eKc1M7TWWJRSbTAEcG3MuxK3fXavA54CPyJTFyFChdrGX/868z0dCt4?=
 =?us-ascii?Q?a5MGpTx/bGnEOzxePAYp1AF5S46XHzPi5NHuGitLXJaufAIWEkz1236khNBx?=
 =?us-ascii?Q?zIwvPWkv7esuHCLlCI9XgJ4GOsh0JRU5TstXIv+veuQxvtxwTG/POzCPSmyU?=
 =?us-ascii?Q?y7eAgSg2stzxv7YXQoSKuVH6RjZnT/aeSR1uj++ihv+bN+bTcBHT1ePUOn7t?=
 =?us-ascii?Q?slb0I1Kp9eqcSNkC/Sx8ulwq3orFlRrigjzoew+aZ1wXEhfgKL7ZTfy5al/E?=
 =?us-ascii?Q?ikKfaM4YGc1jUcr91/FUWL2iG89ZL17iS94vuCzHXVfUig38LsFKcO4YtNsu?=
 =?us-ascii?Q?6URyA0tKi+1c9i8hAS0YR6SIiUXJQwdTTnPUiAyubPJHgfza1T0yP3ZyVjFW?=
 =?us-ascii?Q?vvvIq2n2QBvZHlcdvfaCZz3KiattqVPTMS2Q?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hpyxwRYaVk+dxeSVIDhCP3Uw8uJV90q4Qv3aQFiYVQZ0w5IFr4AzwiZTBRBv?=
 =?us-ascii?Q?buRXlbmp1CepG2zSibeNTzVNux6bSpBKameSaCMd/Dht1DVYHOZSUy1++ngw?=
 =?us-ascii?Q?MYaY/nESGI1Bt7KYxyWQxEHNtk7z86jXx/LVZwc3hmyAnCMUE634fOgNQpOd?=
 =?us-ascii?Q?ShmTuT0w8rZ7pAZKOczCJicODyPF9kUemcXqR+QPhl8QCP7FslF0xwnrICp8?=
 =?us-ascii?Q?S0rwNHPgPGNjDuHdgfG/WFALH7KlKZJE6UEy93c2Jql4IYTnWiFVqCmKKuku?=
 =?us-ascii?Q?6wdJGo4DqiRRgy3LjWSrCSfuhiNSlGH3HvdOQpprxg14hcLsCsRoK0GJnak8?=
 =?us-ascii?Q?CsKR/cIAMKc58UCJipePvtFfuKEdXzmFLcgv6axCW9OCoJK1nnG1xJlPppv1?=
 =?us-ascii?Q?fZX+FAqQ+uSyxvybx55xRq5ak6d1ubueDLM+UN0InXwNQQAMz5tAGrPQp138?=
 =?us-ascii?Q?37DdWdVy1gbqjp89w06LaNHE5CsHTOR7FqFlxDNqhkyUHfAaVjtNhEFwNaN7?=
 =?us-ascii?Q?eu34Dznxa4PinqtR1ILoqfeL3juFLKGyTyGAwuwpsjCH8Ay2wRpazYePgD06?=
 =?us-ascii?Q?q6u6FhBKz3v2SrdEd34m+VSyMwUIAwResfXvkew+e6xi9ZOVKE4TtYYoceVG?=
 =?us-ascii?Q?M+MrN2LioIkjAfRVMcXSMtEwsFEIFdH8EBYPdTVQ/1rjtdN8QHRpA85G1rS/?=
 =?us-ascii?Q?Gcy2rEwaAx5qSaC2ao/L7ABsX2z+n7LCy/jvGK9T3xH/vYswrlamW5BpV55J?=
 =?us-ascii?Q?bbZ8/9xMjW2Xk4SWz6Scrwulk2VgqdVkumZe5xwuZpwZIFtNBm50fuzRmFcz?=
 =?us-ascii?Q?eeilF4DSGwpsaSmpF6tL9yBWG8IdJOmCga43c7NN/wYJg1Gfk1NN3xPRJShF?=
 =?us-ascii?Q?r9YDskJJI55zPSKVI4HzcjfU77eI1Lo1IVq56H7TKfgdFRTIr3ZmHt5b8HNN?=
 =?us-ascii?Q?Nzg1AIGWzjY50YpyGj3TYNep1F3QJ1L66+Q+1jBaMrH7XB8lZy3XSseeqbwz?=
 =?us-ascii?Q?mD3swNT/2s90SdRaz84x+xAGpEwSOnertbUDyLLVi3AXZK+XSWZUPl10afIR?=
 =?us-ascii?Q?DQSOH5jTOUkD9Pa4j5YaoMCMYsx4lAthgz5MP0G2t88wjD4g064eKTSb1FLb?=
 =?us-ascii?Q?IF68XU3b323GfJKs4rmO4ZvpSw1s4M1UaiOMBkbfmPSked+sceR5+Ob41kXm?=
 =?us-ascii?Q?hvJfJ1xE3zNBygtqtpZuF3gzGfBq05AWj8jfgz9p3HM4VOD+k8F/m7UTC8Ue?=
 =?us-ascii?Q?Qqfpp8ybWOdqtYc6Lr+EUBzPmI1WAkcKg1q5C8aWoHTJxpbl19zRR+OpxY6e?=
 =?us-ascii?Q?NIVt9Ha8yN9rD9UbtK/vPykuKb/PsmIyTPMZL5LkhZPvlsnO4xXosjzO6S3O?=
 =?us-ascii?Q?LurVL/gPHcIKsqJtlF+yFd3np8rddOTb0B64pF12mJE5QorWbyIueF9CLZ4J?=
 =?us-ascii?Q?5mEjiYEQWRFqKIgfvtBEbuPUSV1edPY14wLVVs5BYl+KqZcjcquy3GzmSoQl?=
 =?us-ascii?Q?9ytuU56+K8SFMxrBM9vN1YAykwIQAnhTe9gxbb0fDeRl2694Zi/x8n1Zwl25?=
 =?us-ascii?Q?ccIlLosw1Nn9wAfWzZGGR+1Fhg/2/FITxKlfpoTl?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a5a20c3-dfee-4d0e-abac-08de28a3a8ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2025 02:14:11.1465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XaBqIIdlZtsranLxnhBckUEZHpXZ0XmXN91dOm46jfl6RC3y2W46Y6h2O+jkA4xjA4bklvkA2JU/ocmKcp+xIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9311



> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Friday, November 21, 2025 12:17 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; andi.shyti@kernel.org;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; pandy.gao@nxp.com; wsa@kernel.org; vz@mleia.com;
> B38611@freescale.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] i2c: imx-lpi2c: support smbus block read feature
>=20
> On Thu, Nov 20, 2025 at 03:02:26AM +0000, Carlos Song wrote:
> >
> >
> > > -----Original Message-----
> > > From: Frank Li <frank.li@nxp.com>
> > > Sent: Thursday, November 20, 2025 12:44 AM
> > > To: Carlos Song <carlos.song@nxp.com>
> > > Cc: Aisheng Dong <aisheng.dong@nxp.com>; andi.shyti@kernel.org;
> > > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > > festevam@gmail.com; pandy.gao@nxp.com; wsa@kernel.org;
> vz@mleia.com;
> > > B38611@freescale.com; linux-i2c@vger.kernel.org;
> > > imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> > > linux-kernel@vger.kernel.org
> > > Subject: Re: [PATCH] i2c: imx-lpi2c: support smbus block read
> > > feature
> > >
> > > On Tue, Nov 18, 2025 at 07:13:23PM +0800, Carlos Song wrote:
> > > > The LPI2C controller automatically transmits a NACK on the last
> > > > byte of a receive data command. It transmits the NACK unless the
> > > > next command in the TXFIFO is also a receive data command. If the
> > > > transmit FIFO is empty when a receive data command completes, a
> > > > NACK is also automatically transmitted.
> > > >
> > > > Specially set read 2 bytes command initially. When the RXFIFO
> > > > receives count data, controller should immediately read out this
> > > > value and update MTDR register to keep the TXFIFO not empty. Set
> > > > new receive data command to read other data before the 2nd byte is
> returned.
> > > >
> > > > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus
> > > > driver")
> > > > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > > >
> > > > ---
> > > > I setup an env to test this feature change:
> > > >
> > > > On I.MX93-EVK:
> > > > LPI2C5 as slave device and use i2ctool to redesign the slave-eeprom=
 mem:
> > > >
> > > > hexdump -C /sys/bus/i2c/devices/5-1064/slave-eeprom
> > > >
> ...
> > > > -	temp |=3D (RECV_DATA << 8);
> > > > -	writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> > > > +
> > > > +	if (!lpi2c_imx->block_data) {
> > > > +		temp =3D msgs->len > CHUNK_DATA ? CHUNK_DATA - 1 : msgs->len
> - 1;
> > > > +		temp |=3D (RECV_DATA << 8);
> > > > +		writel(temp, lpi2c_imx->base + LPI2C_MTDR);
> > > > +	} else {
> > > > +		/*
> > > > +		 * The LPI2C controller automatically transmits a NACK on the
> > > > +last
> > > byte
> > > > +		 * of a receive data command.
> > >
> > > looks like transfer STOP? You get data, it should be ACK when receive=
d data.
> > >
> >
> > According to LPI2C RM MTDR register shows:
> > When controller need to read data, we should send command word first.
> >      Bit10| bit9 | bit8 |          bit7~0
> > Receive (DATA[7:0] + 1) bytes    byte counter
> >
> > DATA[7:0] is used as a byte counter. Receive that many bytes and check =
each
> for a data match (if configured) before storing the received data in the =
receive
> FIFO.
> > We can prefill the bytes count to controller, controller will auto ACK =
after
> every bytes until count is exhausted. Then controller send auto NACK.
> >
>=20
> Thank your for your explain. This may IC design choice or bug, look like =
I2C
> controller should stall SCL to wait for new command?
>=20
> Assume byte counter is 0, (1 bytes transfer)  [0x100]
>=20
> SCL: 1,  2,  3,  4,  5,  6,  7,  8,  9,
> SDA: B0, B1, B2, B3, B4, B5, B6, B7, ACK.
>                                      ^ Do you means here is NACK
> when MTDR empty?
Yes, it is.
>=20
> > > > +		 * command in the TXFIFO is also a receive data command. If the
> > > > +		/* Confirm SMBus transfer meets protocol */
> > > > +		if (block_len =3D=3D 0 || block_len > I2C_SMBUS_BLOCK_MAX) {
> > > > +			dev_err(&lpi2c_imx->adapter.dev, "Invalid SMBus block
> read
> > > length\n");
> > > > +			return;
> > > > +		}
> > > > +
> > > > +		/* If just read 1 byte then read out from fifo. No need new
> > > > +command
> > > update */
> > > > +		if (block_len =3D=3D 1) {
> > > > +			ret =3D lpi2c_SMBus_block_read_single_byte(lpi2c_imx);
> > > > +			if (ret < 0)
> > > > +				dev_err(&lpi2c_imx->adapter.dev, "SMBus read data
> > > timeout\n");
> > > > +			return;
> > > > +		}
>=20
> If irq/schedule happen here, you may not fill MTDR in time, so MTDR maybe
> empty,  You just have 9 SCL time to fill new data to MTDR.
>=20
> Frank
>=20

Hi, Frank

Yes. Your are right. That is normal case. Timeout may happen when read smbu=
s len when system in high stress.
That is not avoidable.

> > > > +
> > > > +		/* Block read other length data need to update command
> again*/
> > > > +		writel((RECV_DATA << 8) | (block_len - 2), lpi2c_imx->base +
> > > LPI2C_MTDR);
> > > > +		lpi2c_imx->msglen +=3D block_len;
> > > > +	}
> > > >  }
> > > >
> > > >  static bool lpi2c_imx_read_chunk_atomic(struct lpi2c_imx_struct
> > > > *lpi2c_imx) @@ -599,6 +648,10 @@ static bool is_use_dma(struct
> > > lpi2c_imx_struct *lpi2c_imx, struct i2c_msg *msg)
> > > >  	if (pm_suspend_in_progress())
> > > >  		return false;
> > > >
> > > > +	/* DMA is not suitable for SMBus block read */
> > > > +	if (msg->flags & I2C_M_RECV_LEN)
> > > > +		return false;
> > > > +
> > > >  	/*
> > > >  	 * When the length of data is less than I2C_DMA_THRESHOLD,
> > > >  	 * cpu mode is used directly to avoid low performance.
> > > > --
> > > > 2.34.1
> > > >

