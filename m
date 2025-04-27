Return-Path: <linux-i2c+bounces-10640-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1A5A9E05C
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 09:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63D0B5A3544
	for <lists+linux-i2c@lfdr.de>; Sun, 27 Apr 2025 07:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF700245028;
	Sun, 27 Apr 2025 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LYwXHUQu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013014.outbound.protection.outlook.com [52.101.67.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6E9241122;
	Sun, 27 Apr 2025 07:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745738595; cv=fail; b=Rro6BMe+/hrtKN99Q88z4byjriSPkrT7CEvVg1VDFOd3QDPIvuWyEWAYn9JCCMmWsH/FsexpI9UHg4R/Cfzo36w+wo1+vHMhQkz48oPzz4yO3Ps1fITy6AoLX3evq3pOzC1ebEBJZVEhbpyfhOu1CKEM+wRiA5QVUehg80eoERg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745738595; c=relaxed/simple;
	bh=AuOnKZSyYqKtiDq6H98rgoG+GulpanoU3PBpw0cQi8U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=mgc1x/5pkczUhcP9PcH/cCg7F9IzkRKojRAmbpE9d22JKZan5gFZ2WhW1QgLkyKKY7Wtu7FwIaAZiY0srPkNQrlikLIjI4T5DnDV4L/lufu4zJALA2Ktulmmi24fkZAZdaRp71tfKwuVNQ53BwG2TM+kSYjHIx7bHiJoBK5ThQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LYwXHUQu; arc=fail smtp.client-ip=52.101.67.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PIXExQ7UdgwklW6MHJj5XpZy0eXZoIeMm9aOkyQl6OXDQmb9may+TBUhY4jG7FtdE8dOhXKlyy83JaOEMtesjVSNRO9A7VjxOgSyEPxWzX4aZI+bBfzMRf+PyZTm/7f7w42pCqCvaVLRwY117QOUBAawJ5uScrFfPlOs7XA3AS2iUfklglilUjx3HIt47uKmgiNWXV5HEcRx6cUOko0p7Rb519JRl7JVSZAR6EPysRdLu5N/TDR8llCbJ0x6mjMnlAA67o/GwGokBzzPEFuTWCshTACRcAJo4DFnOx7uTmagmnpsOHDHQ+HNM1GPsASA2aCMQpxMPgqTB55Bx9fN2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GCbgElHZ2CxzCrYryvtDPZlLRR7eip9wa9HUlP9Y90=;
 b=M4FFYiXeh+7TyZ7uRwroQN/9ubkuiiM+Psyy6gHQESxUEaOo5/5NHbusifpALC7kB4ZZu7ZbUl8czbZJbn1AmYuQd1Xq5HH/gABlRjtFLpQvMLBO7BIkkvVVP5xkQ2oX1hKTtzSZhlb+U7XoleU/cYVT/RmxMEhNSw++Y9CIIyQJ6pTnL7bvCEHBAcjmdhUOvogTvmlfToC84jiLfKLwkHkFF3JpMSEAoGln+Qt2BAn8zVyHRRhpyU01FRcIO70+oCNV1kn2xqJ6n7E4U+z6UNBffyah1qXGdvv53FzxFfKIaaY+p1dW4rokRin2NtMd3FBci/xdiw91inaBT/272g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GCbgElHZ2CxzCrYryvtDPZlLRR7eip9wa9HUlP9Y90=;
 b=LYwXHUQuGqMTSZa4o8ihgWOleqIXKXnviKxkC6x4mCw2Vc54+QWeCftQXDzpFGAqNaF7E26yFE61FENRS2V2p/wtCY0Cc6Q7K7EeYUvdUFbK+IP15G+sDzKUoiybPFJ3KLDaLScFZCsFRN66QHsgcVs1unjiUIOjiqP04t1aowQWRM2djQn7i61fXF4uNUxYshcOrSfT3KoKOo25XTAQB+HCf1Y7g3vTSZ+0VIW+pdXvcXdkqzTms4d4dAQ9uM6taApdrfjwwddF8ZGDkdqA+k0lY+1E+LPD9vTPOLr7PvN9CM37pvmqZqtxVDCzKbro2PFDK1BVpcdTY0JzIWSriw==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by DU4PR04MB11032.eurprd04.prod.outlook.com
 (2603:10a6:10:58a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.28; Sun, 27 Apr
 2025 07:23:10 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8678.028; Sun, 27 Apr 2025
 07:23:09 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Aisheng Dong <aisheng.dong@nxp.com>, Frank Li <frank.li@nxp.com>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Thread-Topic: [PATCH] i2c: imx-lpi2c: Fix clock count when probe defers
Thread-Index: AQHbt0U64ghCGMLe5Eig6819ak6AgA==
Date: Sun, 27 Apr 2025 07:23:09 +0000
Message-ID:
 <VI2PR04MB111474EAC1B4DB8EB6DD32628E8862@VI2PR04MB11147.eurprd04.prod.outlook.com>
References: <20250421062341.2471922-1-carlos.song@nxp.com>
 <34ally74jbpae6etevqskr4zmcv5xyac46n4hl2j5ybihwtezn@jd2gvr762gs7>
In-Reply-To: <34ally74jbpae6etevqskr4zmcv5xyac46n4hl2j5ybihwtezn@jd2gvr762gs7>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|DU4PR04MB11032:EE_
x-ms-office365-filtering-correlation-id: 4db59d63-4910-47e8-ecd5-08dd855c5cc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CRmRGCCXl5yAdPKKf2nn5XiMbZWWQ91CjykrtF9mwZ6dljmgFCZqH3T/G+n6?=
 =?us-ascii?Q?60lVBVtaLOvD6/S1ORgadBgBWC0v77/BxKYiGR4CEJjiP/y+bTqSJ6gG0FLk?=
 =?us-ascii?Q?MLbN8RjSNm1LPxulXCu/BGtm+rdWcwwFt9v5vunxv6BFh07g0SUKZXtNM/uf?=
 =?us-ascii?Q?zCLvTSkl6JKWyByTcD5pN2RDlRIKevkdLHVZBbhVonlb3ZsoS9ws9vJsnbgn?=
 =?us-ascii?Q?z6Xc0X81abGvUEJcfwcSl/PCKPiM/3sWaAUFPA6rlcVVzg3/nlQEC2wLmf6m?=
 =?us-ascii?Q?rwthY5gM7O8Eo5eHqU7sUOnNY0dh0RFUXXkHgrT7RcnUkoB+WTG3oBt6frD6?=
 =?us-ascii?Q?Ofkf6aM4m+GnNBHSbYrrL3DGui2msEfIp0+JTECy/3aok31X0fRLlTCteaMg?=
 =?us-ascii?Q?CD1i4//EMgdsDJL3m+EM3EkaMyB/7l4cFOBspyd7zLt8aV/+/DC6B7y/uyNU?=
 =?us-ascii?Q?B61lMqWfzrCMGXUVX7V481Hn0RmhR4a08cQEqXD7Ojl/1rA3ZY3UY2xVI+EM?=
 =?us-ascii?Q?7k2uYCDj3kF/C2bToEQMUF5a7AKdkkBxMnQEcMBZCiNKnODU0K752M1/KA3D?=
 =?us-ascii?Q?d7aRn+qmldzobWg0uNtrFTkvwH2W4TBUDQ+wHxA6NV6WWmFH5D0to1htcBG8?=
 =?us-ascii?Q?oY9WzjozV4NRdNFKqwNGVsIQ6dzVy1+UehIxfw/fvtB2nTpfGaMynlEpa80Y?=
 =?us-ascii?Q?RbepU4OAeGnSyouePJmHyPIGDDqeEdNHIKOc/P1mhrcoCz4gjMwfDW7cr9Eu?=
 =?us-ascii?Q?r83ucV3X4xQwCvTEEJ8qJYorU0pah2zbJnI4EUKqA6FrcKnAw/XdjDbCxayR?=
 =?us-ascii?Q?xay9NYrQ6Sa35fmFHIXIxfRlrz/x196p54cvqNlc7uF2oknVMYYP22YIm7CU?=
 =?us-ascii?Q?NZbMbip51yG5Xnkif9W2EgeNK7PvBaZh4xTA2Krh8SVqhM8GBbqPRJijQj2r?=
 =?us-ascii?Q?GHc959g7IWfzcdHI0EDAQa6tSI6wcQlrVTU+wr8HN3ik4bF7CE06HwXwO9TF?=
 =?us-ascii?Q?pBM60s/bCOcx2tP046hdkAxhATFLQyyScpvm4FlhNyeetN6OBxJRQ1IrvMmE?=
 =?us-ascii?Q?/A6qrAypjsa1xrOYv1s/NXFXG0m3IuMOK0nnQyZ/EN0/hk63XCfVhvqVJCxy?=
 =?us-ascii?Q?Jdx8cToF+aQ0KhJ/Ci5Ix8dqvPvloKhl/JbTr8zz494U2kwY9dw5wnfreSIc?=
 =?us-ascii?Q?igEKBkBgVYW50rKm+sJ7JFAkOXUvIn8lZhiUpT47j7K+R6WAUmbTwvK0uc/3?=
 =?us-ascii?Q?a2H9MNt4ajA1NdxvjddKW0CgQyuieUIHjY1b7vpQ3odzBMqO1vlYd7ZLclYc?=
 =?us-ascii?Q?GDf0/7BMuh7i91Q8k+hGXXvKKCBkLsyJOxqHZzv16ZyYoGNF5/G7b1Pbn4rP?=
 =?us-ascii?Q?/vHBaNaBRrGyELxV7tfLJajyk+FrSa0/lZmJGjLRO9lbl1lFTykJtuJbfR3q?=
 =?us-ascii?Q?FbZhibqIPKlb6o9fSgeL/FOfuL3z4YvkQmPe6y84kSN1FUnxetJokWvfsqto?=
 =?us-ascii?Q?F5Nm//z24POQtkE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/RBfo3m+UWIf9cepVNm0wO8eKc/Jzyb3z3tKm4GH3kuV0RdyW7zgMKL0qlbK?=
 =?us-ascii?Q?Kv3rkqxUi5i+BLdOw0tskkhO3dAIcwZjLHIlSn9uTT+zaYCY873K3utjp6TP?=
 =?us-ascii?Q?lc1Kr6cvWbqNKrRP1+SREC9xuXHHsI63dxEQbYHSwKuQK2pPKJGufxwSVtyf?=
 =?us-ascii?Q?cVD7EJ6pCDoTMq3TXZBxVH/Tb6GrYwEapz87GRk4231mIqZ9RKyapz1HyiRc?=
 =?us-ascii?Q?HkqSUSI/JRBdRu9xQzVv2nghVoqfKXBxmTVO9QaIa/bNlf+gYOQgWFxgg1n4?=
 =?us-ascii?Q?MZ+PEdi8qPzYvLYc3x+lT8la22j8nD/bsSSE6yzpglqYDHEuxCUef6KRolDy?=
 =?us-ascii?Q?EmGmy3C0b0CyPOK+dw26gxj1IbyE/RCOXF9ykSB36fjspTwXCjI3f1nW9JUW?=
 =?us-ascii?Q?UR+pnm89CSjtupwtKl4iPaJmEW2Et8Yc944A/VBjXZXKInikeZGA6nY+MBUm?=
 =?us-ascii?Q?/Lh0oIYY2Dtp3rn+kLGM7MCpsYCJaY7vSifeehcza05Buj91UTc1q1nS/3OR?=
 =?us-ascii?Q?8QgyrqEinlxswrgYsyd28EoxfOlYSo5DF70ppIHldVdaZfEAgeDQMr9VIgkp?=
 =?us-ascii?Q?h23olORQHX3bWKp0jXgFAsIs2h8KMiGBChUhOe3FNZM2yTcRO0Q7v40WX3iT?=
 =?us-ascii?Q?FA1kwb1gYZ/W4VfcKVk5CTP9RQ0qAqjuQSvTJAnvvcZxJNo0pJqRPLwldqC6?=
 =?us-ascii?Q?/KsA/Vqao8y96flGy9h9c0pkPy5fjdYU1ioxyLresbXDADQjmchVeNXyjpUT?=
 =?us-ascii?Q?v/ii7cBJvjvUPw6jrk1XRl10ZL/FitbZnnBl+lvZTh+Kj8Kx9zZ1IwWqAI/L?=
 =?us-ascii?Q?NaxWeBa0PGslHJit57ZjrI/x8BHts38cXoDa+gR0B2XIvnWe2njAOtjaKUjE?=
 =?us-ascii?Q?BPsQDvxDeIE6wRDojIwWgtZ/iwvB+QLPBX3A84h/HqgC0OBRvZHaGhs8QIP1?=
 =?us-ascii?Q?6HreKfVRp9d8Oxgek7LwYLPz8Jt6uGd1RhLDxSYBdzziUfihby8YfMJeHg8s?=
 =?us-ascii?Q?taurJPbX4xoUAu9GIaPHi9GK/EQ9a39lFcQvbptU5B25FE0qe8QSNDD9eILz?=
 =?us-ascii?Q?DYa4Y4hVh4Dktttqo5xzS8BVvBN3u0EgeMhDPL9csFyXIRPAFT5RetIgXaQR?=
 =?us-ascii?Q?fCxItyNs6A2Nf47RcUDzCvjtOETtGnoa7N2Mhet2V9XMPisy8MFQrOBM26i2?=
 =?us-ascii?Q?o9MK59z83GLZRb6UqB4anlPf0VrhlOQvxRA0/KD9K6k45CBAOESf45E5UVMg?=
 =?us-ascii?Q?xp7aavMbobmtX4E0T5OQTeQfmxfzPE6af8eHpz9KQkNDvSrqmTHsZtIHdKff?=
 =?us-ascii?Q?fuGMdDzY+z6Ar7RBMXJ5fldpBXeB/ZFGsS27Kk3pAisWX/5M/je+IEk6pPcQ?=
 =?us-ascii?Q?8vLQmbD/1k1f9R4onwWIUmes44EA0xhmqO4Teh3tHbkfmdt5mOy/1Bb5bY+P?=
 =?us-ascii?Q?q0rurJ3VOvHepLx8gh7UHfrenWW/mUNAS9R9g/5+YGHo9RBBRm8Y+y4GF+Gg?=
 =?us-ascii?Q?dH57IrJPOoOYYtxHBMGLDRWBmMkrr8SKUv5aDYncsUOuCuVdzhIe5oV5sLm5?=
 =?us-ascii?Q?Nel/6nVzyRog8WA+GLo=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db59d63-4910-47e8-ecd5-08dd855c5cc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2025 07:23:09.6268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGmaajJZLqTLlcIgGMLsdad74dUgW5Ao4BeDujkL5EeNPjOzkWUgui5cmkT/hNwjjO1p7DGW81Ai3lie+jnxEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11032



> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Friday, April 25, 2025 7:29 PM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: Aisheng Dong <aisheng.dong@nxp.com>; Frank Li <frank.li@nxp.com>;
> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> festevam@gmail.com; linux-i2c@vger.kernel.org; imx@lists.linux.dev;
> linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH] i2c: imx-lpi2c: Fix clock count when probe def=
ers
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> On Mon, Apr 21, 2025 at 02:23:41PM +0800, carlos.song@nxp.com wrote:
> > From: Clark Wang <xiaoning.wang@nxp.com>
> >
> > Deferred probe with pm_runtime_put() may delay clock disable, causing
> > incorrect clock usage count. Use pm_runtime_put_sync() to ensure the
> > clock is disabled immediately.
>=20
> What is the outcome of the incorrect clock usage count? Do you have any l=
ogs?
>=20

Hi, Andi

Thank you!

At imx943 board, I notice sometimes after boot one of lpi2cs enable count i=
s 1, but now the controller has been suspend(enable count should be 0).

This is a lpi2c4 example:

root@imx943evk:~# cat /sys/kernel/debug/clk/clk_summary
                                 enable  prepare  protect                  =
              duty  hardware                            connection
   clock                          count    count    count        rate   acc=
uracy phase  cycle    enable   consumer                         id

    lpi2c8                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
    lpi2c7                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
    lpi2c6                           0       2        1        24000000    =
0          0     50000      Y      i2c@426c0000                    no_conne=
ction_id
    lpi2c5                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
-->  lpi2c4                           1       2        1        24000000   =
 0          0     50000      Y      i2c@42540000                    no_conn=
ection_id
    lpi2c3                           0       2        1        24000000    =
0          0     50000      Y      i2c@42530000                    no_conne=
ction_id
    lpi2c2                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
    lpi2c1                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id

root@imx943evk:~# cat /sys/devices/platform/soc/42000000.bus/42540000.i2c/p=
ower/runtime_status
suspended

Normal case should be this:
Enable count is 0 and controller is suspended.

root@imx943evk:~#  cat /sys/kernel/debug/clk/clk_summary | grep i2c
                                 enable  prepare  protect                  =
              duty  hardware                            connection
   clock                          count    count    count        rate   acc=
uracy phase  cycle    enable   consumer                         id
    lpi2c8                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
    lpi2c7                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
    lpi2c6                           0       2        1        24000000    =
0          0     50000      Y      i2c@426c0000                    no_conne=
ction_id
    lpi2c5                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
    lpi2c4                           0       2        1        24000000    =
0          0     50000      Y      i2c@42540000                    no_conne=
ction_id
    lpi2c3                           0       2        1        24000000    =
0          0     50000      Y      i2c@42530000                    no_conne=
ction_id
    lpi2c2                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
    lpi2c1                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
root@imx943evk:~# cat /sys/devices/platform/soc/42000000.bus/42540000.i2c/p=
ower/runtime_status
suspended

Add debug log, when defer probe happened on imx-lpi2c 42540000.i2c.
goto rpm_disable path:=20

rpm_disable:
	pm_runtime_put(&pdev->dev);
	pm_runtime_disable(&pdev->dev);
	pm_runtime_dont_use_autosuspend(&pdev->dev);

pm_runtime_put() may not work really sometimes.

[    3.203715] imx-lpi2c 42530000.i2c: defer probe
[    3.208324] imx-lpi2c 42530000.i2c: lpi2c_runtime_suspend
[    3.214801] imx-lpi2c 42540000.i2c: defer probe
---> (No lpi2c_runtime_suspend callback(pm_runtime_put() is not really wrok=
))
[    3.220672] imx-lpi2c 426c0000.i2c: defer probe
[    3.225248] imx-lpi2c 426c0000.i2c: lpi2c_runtime_suspend

After apply this change:
rpm_disable:
	pm_runtime_dont_use_autosuspend(&pdev->dev);
	pm_runtime_put_sync(&pdev->dev);
	pm_runtime_disable(&pdev->dev);

all issues gone.
[    3.093025] imx-lpi2c 42530000.i2c: defer probe
[    3.097592] imx-lpi2c 42530000.i2c: lpi2c_runtime_suspend
[    3.104281] imx-lpi2c 42540000.i2c: defer probe
[    3.108858] imx-lpi2c 42540000.i2c: lpi2c_runtime_suspend
[    3.115278] imx-lpi2c 426c0000.i2c: defer probe
[    3.119818] imx-lpi2c 426c0000.i2c: lpi2c_runtime_suspend

root@imx943evk:~# cat /sys/kernel/debug/clk/clk_summary | grep i2c
                                 enable  prepare  protect                  =
              duty  hardware                            connection
   clock                          count    count    count        rate   acc=
uracy phase  cycle    enable   consumer                         id
    lpi2c8                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
    lpi2c7                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
    lpi2c6                           0       2        1        24000000    =
0          0     50000      Y      i2c@426c0000                    no_conne=
ction_id
    lpi2c5                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
    lpi2c4                           0       2        1        24000000    =
0          0     50000      Y      i2c@42540000                    no_conne=
ction_id
    lpi2c3                           0       2        1        24000000    =
0          0     50000      Y      i2c@42530000                    no_conne=
ction_id
    lpi2c2                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id
    lpi2c1                           0       0        0        24000000    =
0          0     50000      Y      deviceless                      no_conne=
ction_id


> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
> > Signed-off-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
>=20
> Carlo's SoB should be at the end of the chain. Should be nice to know wha=
t these
> are, though, are they co-developed-by? tested-by?
> Why so many SoB's?
>=20

This patch author is not me and they meet similar issue at some boards(Vagu=
e history), now
I meet this issue at new SOC again. I think this local patch is helpful and=
 looks reasonable.
So I send the patch to community adding my SoB.

> (no need to resend for this)
>=20
> Andi

