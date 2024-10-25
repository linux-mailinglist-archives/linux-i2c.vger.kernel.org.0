Return-Path: <linux-i2c+bounces-7559-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB8319AF646
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 02:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 509C51F216EE
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 00:39:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3D522FB6;
	Fri, 25 Oct 2024 00:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="Xe87zI7C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023095.outbound.protection.outlook.com [40.107.44.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B37522B64E;
	Fri, 25 Oct 2024 00:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729816784; cv=fail; b=rROEGbxvjP4p8RSx0rl+64u7HhyjjTsuGikleGrn/pI40O9eXJVxzUkMvPbTmckvvbL5ZuX6oxAWxWS5+GGfkB8u4/PwHHzYE3xABbtmB7DcFwyOHjSabV8y9YEJLbnx2VYnu0n0tkvoe69ljQd+J+tjXIqmEsYVc1wiaFAUy1A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729816784; c=relaxed/simple;
	bh=DPxqBbZhL69DKhi363+QODrVtKf4GLLhJD5Z55PDpM4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b8OCQEcyJBtLVyNTrkuKiu/XcBgXqbYUly52nHiV27VH6xiKtjjpVn/6xiUdPNBWcN4Sxt7UTaN8tvr2wXEue1QuuLmXdYFPprU/eiiLeo780J9FwiNeiPOLbpe3n1WE1BeTVfnlS967hYUSTWzkZ+Mzq6R6e1nqaep9qnGCULE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=Xe87zI7C; arc=fail smtp.client-ip=40.107.44.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N201OLJByOK86O9USq0iSocrfAyvyD+at5bmlfbsYswQbOk8Ex+glX2puVWmWkTxZNKlC59DX55nmx5JnRjOTx4R9ylI1y81HsIjE5S8JzpmQs3V+H9M3vjUtQJXozVUidc5oDlzYIvlVxPNCcLNiOaBeLA05z7/UWUEdTWlif2FsvGy649Xf1Ofv281zdK7hSvn4VuSrLhVqtZzcCjVyawS4Ssz17NMjjS/rRTKc2nW1TAfrmZ2f/YlwtwQiLBHyCF35/cp+6ZH8lEO3g/uXWOenjAQxumt9HKUkqZGc7AMtcI/1i6cziR7yxovgY23whKgf310KzAPYMLPouyzAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIfnPqHfdWVwYekGgMpEcXxrVJUQDmCKp6dluc7N0HI=;
 b=JiA30Ls/LyIgts6cHu6kx9lN2aIE8MC16iuVVlzw7m691twViVDBWfF+JYPDaygtRimC9yk2+ulhE68dI/HoS5LKRMPQqbFcJ+bfGN/8bjbFyMXnjCVppLhHDTtPoaxgm+RlM9Apr3otUPXy9tHgjtWzND4JHT6aFPxLpiPayH4xxAd4nq7CtM0eaLcuW4nYsIkio/Rizr7GXz5ya7Ej2OkzMMjLhPh3ZtPjkCjX9/Xv2Ee/0GXNxz8kk6ZuNo4TYbuwjxsydIIAAlYozAD1GngCDN4pw70xm+Tr6Mdn7kSUnggzu6cxBEnCKGbFbcMUBkxTgr8mud2K27rnuIFj3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIfnPqHfdWVwYekGgMpEcXxrVJUQDmCKp6dluc7N0HI=;
 b=Xe87zI7C9kOF31bjJAnH8wH4p+5RPLY2/oHuJbAMk2rlEnNvaOl9TeyKjpO3G7AwlZyefcmFcU1PDYfmUP6bJ/dtL4DZFCbvtRv3ll9kQSGQJXdcuh1yi2n8zKZPl4fLzAnyzSlAAwfc955Aw08nI7zj1nuRZpRtC4AnUsdwzHajjWXMcDBSKYea/jqHFIXEj3GkkT7JYmdMx0v0K61PlNjR5/Lc51RBV+DUgze6Iul/WLTBQ4gGoTas7Y6PN+2dFB6O8m5OAs9X4/441+qleJx2pctB+Ea+P44XVyDufGwiRfXP+rFa6bcmHI1ESV97XCjIU/RRhUgdFkFv6PfF+Q==
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com (2603:1096:400:33d::12)
 by TYZPR06MB7216.apcprd06.prod.outlook.com (2603:1096:405:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.14; Fri, 25 Oct
 2024 00:39:26 +0000
Received: from TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2]) by TYZPR06MB6191.apcprd06.prod.outlook.com
 ([fe80::cc07:35e3:9143:c8e2%3]) with mapi id 15.20.8093.013; Fri, 25 Oct 2024
 00:39:26 +0000
From: Tommy Huang <tommy_huang@aspeedtech.com>
To: Andi Shyti <andi.shyti@kernel.org>
CC: Andrew Jeffery <andrew@codeconstruct.com.au>, "brendanhiggins@google.com"
	<brendanhiggins@google.com>, "benh@kernel.crashing.org"
	<benh@kernel.crashing.org>, "joel@jms.id.au" <joel@jms.id.au>, BMC-SW
	<BMC-SW@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org"
	<linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
Thread-Topic: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
Thread-Index: AQHbIRC4mm8MiKb1p0WGejEQka9JT7KRHGgAgADqSOCAA+bbAIAAu/qA
Date: Fri, 25 Oct 2024 00:39:25 +0000
Message-ID:
 <TYZPR06MB6191583EC51EE578E1A8910AE14F2@TYZPR06MB6191.apcprd06.prod.outlook.com>
References: <20241018034919.974025-1-tommy_huang@aspeedtech.com>
 <e06a0db538bf62d4aeb7352ecc81a3a679fb9eec.camel@codeconstruct.com.au>
 <TYZPR06MB6191EBA63B87FE5152AF029DE14C2@TYZPR06MB6191.apcprd06.prod.outlook.com>
 <c3ss6ralf4tpyknsda5p745a65xjprlzecdq3s4zy4dpckuxi4@izf7emrzykay>
In-Reply-To: <c3ss6ralf4tpyknsda5p745a65xjprlzecdq3s4zy4dpckuxi4@izf7emrzykay>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR06MB6191:EE_|TYZPR06MB7216:EE_
x-ms-office365-filtering-correlation-id: a51fa328-0642-4d76-08a6-08dcf48d7a59
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?V9QFX2ktq7XxQsROXEEqga90qjfujxSh93dah11AJVIzxdsfx4HQfUUF/s4y?=
 =?us-ascii?Q?e5PKq8psI6H6uRVEqjEsvtpZNsFXSnrEs7R6y0vb+vraioA3/L63l4hBOSDU?=
 =?us-ascii?Q?KFkWV3RGbKn2VpYVL6k3SReLlsITLGXx+ZccyS6PlhBWMD41zsX7o9VABf/H?=
 =?us-ascii?Q?mVk0f8Fzal3YiO0KrFBf4vnJKzq+LA7ZB7er9bJAStGTXtST+vQ4hTLJOtX2?=
 =?us-ascii?Q?/PYkXAVdq5l78aGTKzQnNmw+7EkNN/DG4vvO6GSFjw+3OROwFR/r8kQg++pU?=
 =?us-ascii?Q?rHNd2wZgwyO6ZiGQ+u+9X0B3f1UVPnIfdfvTXt9wENgZ59StY/pVsXIWPoas?=
 =?us-ascii?Q?FFlSsu0GPuC5q88KeWYcAz1C/DCWIR3TNsaJW7Dw+dBteqeDBju4I4LT3Q72?=
 =?us-ascii?Q?tAoRQICf42o6rDZ8OQhMGXbcMLBL+euvp0Zjk19Lg4nhHrXGtSGKXdSZBBQg?=
 =?us-ascii?Q?t1FwulkPATlD5Htd+Nm2ydgAXAH2W9peIVzHhq+R3EAuiqFfcVD1bSE9nUs8?=
 =?us-ascii?Q?VHQaf0/9rVA2iCVV88OY5Nr/3WeAmseUoVqeqZaqEx/rN08OLP7I3aU8c5KM?=
 =?us-ascii?Q?YHj6TrYt+LURqKsApwwd5Ix+Hto4a0mVQnG9N3tYIcOxwv0vASuZmV0+dZiL?=
 =?us-ascii?Q?epRp/E5CrDS9h/KTVkbTG7Qq62luj40iOgjtNWrqmXhiCCRAHCXczqDYxm1Q?=
 =?us-ascii?Q?j2r3ji1WgkqstPXF3T27+GmtSn+pqsYXqTp0uKoWT/IuVdGIFjWHW1S4vibP?=
 =?us-ascii?Q?Rpg+cBxBGvvVHQo1UJ/2LUGO1hb8/wdZQAQDUtj7X9jeNdWCNq3mgeqO352t?=
 =?us-ascii?Q?VPCyPBxqEeZ3V7KGddLtHqI+5sVUWNZnppZIAP0lVjJjT4NebVyhOU3+KjC7?=
 =?us-ascii?Q?gQKdyEqd5zBhsh/2hBB7yB7K3/1W0FbQUX98+4+PIswhMMics7L43d2dtm5O?=
 =?us-ascii?Q?0bDltzlOu/8FtLafbR44MeL5P0vQOE+gBUm2NuLT/BMg3Vj+d6LvimsuvXAu?=
 =?us-ascii?Q?Uy/prdrQ/MqJ2LwneLD672xr1Ymp8qTzzCNwJ3OGvpqKdfj1fkhChWsDqMGA?=
 =?us-ascii?Q?dk+WjRXNF74+NQQ3RjUkxv1v8Aj9QA8Q08vSOwiujItfk+CaR39+TocKOO3S?=
 =?us-ascii?Q?6mMstaz1owF1/KUSDyRY6aOoDWYB42Qng+NmNvMrPUlHoDkbJt5I8RsiA8op?=
 =?us-ascii?Q?Qy4XYdSNhaX30DMvZARPoTP60eyerjs19Daew/mXi9I/ONQXi4wDAJXXTzIm?=
 =?us-ascii?Q?OOeSlSzk1Xoe87AzOt0pESYjFlYEs7sCMoPWwm9pusdO9zAYX1ETS7Zc3YxF?=
 =?us-ascii?Q?HrJFOErO29GvMfP0vdwlnqaqIm6bkk6TduFpDyyXijAlChu7kOgMf9qoNfN4?=
 =?us-ascii?Q?lqMtf0s=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6191.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8ckmcC1yrpcde/UfNNtET/Lpkwt6L5Wo27ySHKNO8EWfPOHxZeY9MMBoLk3q?=
 =?us-ascii?Q?CSMlZGVfEnpQ3f5ynnKKngQYDawOqM5bRZaCcB4L9OdkyjVL6qwBNvJoyCcP?=
 =?us-ascii?Q?sXfyW8JUKu5T25S19mpH82WwB2qIZ0dSFBNbp5p4kgvwRjj1E75PrOZS5gbY?=
 =?us-ascii?Q?OWNp7Jk/vOOQrojui5PBrGxriQs5IBq2JHTqSOOWcg8m9IeRDPtT/71RDx9E?=
 =?us-ascii?Q?LgADc3pq/lw33g0gCW6PXFVnQ1O/T1uyyhmrwKWZFRqNp+A5GrtPWRPIaYVd?=
 =?us-ascii?Q?onyxJffRT8prLRotGDfn9jK88sq1x6P9jZAwOrceG1cVrwK1A3eiiinYqn/k?=
 =?us-ascii?Q?4q8+IAtyqrSR+lP33ASSyXFIHiewEzHhz4XICJRWikgHqZIR8Xin5OKh9EPt?=
 =?us-ascii?Q?ea6Y9QKwkLWcYNiS/nlJLgHYb18L8zbhndDoKhx8AlQxvz40SNar/9sNDEux?=
 =?us-ascii?Q?k+LuXXkngK7cKoYCqvqqXp/bsocG0hPij+a7QotnpsgvTina2P3SC7Wd5O7V?=
 =?us-ascii?Q?IXFkHYO/tc696rBpp19bi6nhE+Z5siJcjRxXvP9mMtn5xLwOBA5WYesQg3bT?=
 =?us-ascii?Q?gN9Cpnxf6YMOzuzW0BY4SfrlYwNxuMTcSF4qqp6B3A1dt5d5gUth/eCNcQmi?=
 =?us-ascii?Q?QGs55o+TNpFLEUCgGeUZJ39HqtjzHlcvumBEgXIWCnkIpd5Al0laFKr4aSuV?=
 =?us-ascii?Q?ohB8f8tl9uB5NLgIUsfM1uFcJGZsmi39Egf6yByUhMWcLl1z0+esLR8vUsRG?=
 =?us-ascii?Q?mZXEFtDTHvrO8zjiab17dGoEnksrsFGOepKd4eZdoY4i8ypiZhPoBVkWhqGB?=
 =?us-ascii?Q?ObdST5vAlMI0pe8YEwBakR7ST6whuvzNyAD9qPSRyC5Xx8SyLZcWL2JcdpBZ?=
 =?us-ascii?Q?e8WPYDCSVbibQbgvnZ2qSe5dAqOZoi+NZ+Clm5Hdn5aHZIJg2yTQg1m3K7Jn?=
 =?us-ascii?Q?+BrOhHKKqKMDjejStBDIJlveSCyohV/yB+hgLfT/1kZIbMfTluGYSf2iCCCm?=
 =?us-ascii?Q?wPGQ6zyv+nXlQ6i42X+UGjyi2HcNSfmTnbe8CenxgZ/vDcvXm8RFdYGwxj+2?=
 =?us-ascii?Q?3tRJ91YlWKlSKK0wuVxIYREjZTu9LIGRTbSWyvZhZDkQC2cVs+tJrhSnI9D4?=
 =?us-ascii?Q?F63F1ynYx5XRzRsVmtD04JCd9XbnImAZpIr1p85zePBIcOwkcsberCyxMAFj?=
 =?us-ascii?Q?U4rc/VzeEX5Ypc5AkFvyibZ4Yx5EQRBTtnSm61nYyfLZccckS2XXv06m9Md4?=
 =?us-ascii?Q?0h/1/b5RyUtFWQmdRazNhPuNdRkqp8tmZsJqKdbN1wyFFhy+65NmkyZZH3mF?=
 =?us-ascii?Q?5rIRUIanQP3g3P5ZvXQYKeMpZKSGri1HHItGBdmJeLBIqJgadSj1JialmAxF?=
 =?us-ascii?Q?uyqBNw+/BcK0IdseBrPc9ZVhjAwK1Ib04tZB1iuxxpz3vLjB2l7syZDT3rQP?=
 =?us-ascii?Q?OkV/I3BaCvyS9TI0M5kenwn1+F/S2KJtnr5W8R0SeTl7NPCfuNhicvlws9Ih?=
 =?us-ascii?Q?n9Nf8gYAxe/XnMoJyhy5EEetsxUQR3/COJ2IXDJ9cF9n/KEHUJOkA8ilh8DR?=
 =?us-ascii?Q?Qei6CzIUrcWxahRbarahHoG2roOHE1sepsykChtNPqtRVtu6gszqkVYB4iY+?=
 =?us-ascii?Q?VQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6191.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a51fa328-0642-4d76-08a6-08dcf48d7a59
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 00:39:25.9482
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nANy4ygpE3DsUdE7Af8865+Um+rWgA3WuG3q10AYg6nEtNwczqno2VjY60wOEw3fO9fEQ9Y7msuwFOM42ISDZ6Lbdp109qiK8P54xBB1aAI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7216

> -----Original Message-----
> From: Andi Shyti <andi.shyti@kernel.org>
> Sent: Thursday, October 24, 2024 9:23 PM
> To: Tommy Huang <tommy_huang@aspeedtech.com>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>;
> brendanhiggins@google.com; benh@kernel.crashing.org; joel@jms.id.au;
> BMC-SW <BMC-SW@aspeedtech.com>; linux-aspeed@lists.ozlabs.org;
> openbmc@lists.ozlabs.org; linux-kernel@vger.kernel.org;
> stable@vger.kernel.org; linux-i2c@vger.kernel.org;
> linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH] i2c: aspeed: Consider i2c reset for muti-master case
>=20
> Hi Tommy,
>=20
> On Tue, Oct 22, 2024 at 02:42:08AM +0000, Tommy Huang wrote:
> > Hi Andrew,
> >
> > 	Thanks for your comments.
> > 	I want to fix the situation when our controller is set as target mode =
and
> reading / writing by other i2c host.
> > 	However, this host is stopped by any other reason (DC on/off..etc).
> > 	It will cause the controller is stuck in this situation.
> > 	But I find it might not have clear hints to identify this situation is=
 normal
> or abnormal.
> > 	So, this patch should not be applied into mainstream.
>=20
> Please, avoid top posting, I don't understand which part of the original
> message you are trying to comment on.

Got it.

> Second thing, please, before sending a patch, always always always make s=
ure
> that checkpatch.pl reports '0' errors and '0'
> warnings, except for few sporadic cases.

Sure. Thanks for your suggestion.

>=20
> Andi

