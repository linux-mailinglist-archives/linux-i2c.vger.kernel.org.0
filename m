Return-Path: <linux-i2c+bounces-13474-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2C6BD7919
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 08:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 758034E4C00
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Oct 2025 06:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B4EF29E110;
	Tue, 14 Oct 2025 06:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SPVO3qed"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010040.outbound.protection.outlook.com [52.101.229.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9942BFC8F
	for <linux-i2c@vger.kernel.org>; Tue, 14 Oct 2025 06:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760423341; cv=fail; b=GntUqE4YDXatx+Re9lJI2nnI4yCvbhRnLcl0S4LaD+MuDGppWFONEfwzycNTsAczzv/XjRbi8y5P1lZV724sGdmafcig+WwsVfJDsDE9MCpUNt0LDGPlw212mtvQr7qmE9r0epo6KFAy71iGc30EP6fhQVBHsCZiVCu/dlFzMpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760423341; c=relaxed/simple;
	bh=vg9+gSsspaNTqxqY5E82CYwM320ZVqOrfbCl2PE+mds=;
	h=Message-ID:From:To:Cc:Subject:Content-Type:Date:MIME-Version; b=nILwFcd9a12qNQ4ImSei2Fz1j5bjh5X/4otoGDYeJlZ/s61iFhO+sSp19yjq7aqLoDmVTcXgGB/z+eldFBSMudEJojcoVG+zYMXKgM9x+tK6BkhmxDflrD9qLk2pb0kBdVRvH8Ldj3FIyglWR6SgjziqmKAuKE06dqWh2PV9gd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SPVO3qed; arc=fail smtp.client-ip=52.101.229.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Di2SwVdTVXkFRKypeLDjSgpMZwHRIwYEbyCZvOBf1Xqnf4nQfpF6Wovxs13Bx4xYigRbtNDXde9hue+uCTu/M8eM/FPUws7m0YU8mCXbCeuP7B5PGZa+klgYigL2c+trgvyaHQ8vLKwLkgxIj3wJRGTC6XFYeRr/EHHBslYPZcKET+YhVh3GAk+BQ/QXhPq83NdO0K6EFhSlgWUn/jrmWhhZx7Fy93lsU5q7fsBjE45BStVIYb5VlxL4poN8xWE3VfBv8U0X2JUq/WMI8cUlAosL1VbA4/CyobuX231hWf5hplBjTGOmf8+s99XExdtdd/avQxR0H4q9svNishvRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sxd8IXG623z40jZxPlVY8iFElJVAbUe4nCA0LqbJcxs=;
 b=sfPbkhENYxaHYbe4xngP8bJ4YQ4HZIukvVA2r5bsdWPY/VqDyRsYH/oP5XAvW52WDnehsNdJf8wAf6APCuurw3SMOOW76CZpDgqrLTFCpI7NQApMNpV5437p2IGSoYcg9ZiQ5X/cWvHPSL4KgsPOgI+DRhl+jrCZMJPi1b3/AlmybqgmZ9qHXVVOg2LPqZ4CcAc1Rx4M8+zWYJW+ShiFWc5L2WT8+o4UN84r8QIAaNdJ50B4zYSFsfypbiM13lrpEqkwJ7hSqWp+kr05c7eSkK1F90v0DCepTcRdqAeRn8gPFvm4jMP3b3/IS346v8TKM02zGBUNdgGwBeZb3/12xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sxd8IXG623z40jZxPlVY8iFElJVAbUe4nCA0LqbJcxs=;
 b=SPVO3qedz3x43nwsFa0ZEmkK4G1WbZ8qPV2YmGKdbMLlGRc0X+GsEa+3CcROXIZPEbSD3uo8Hb34gTciwqzzHpaV/f8AnsDRIaZW300zcT3wlXYX3lmpwx2uov+bHJweioqbEFrdE0q/C4ZqvDyF+rtxD1Wz/vb1IJkcOt/Yq3o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12929.jpnprd01.prod.outlook.com
 (2603:1096:604:33f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 06:28:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 06:28:55 +0000
Message-ID: <87a51um1y1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Wojciech Siudy <wojciech.siudy@nokia.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org
Subject: [Bug report]: "i2c: muxes: pca954x: Use reset controller only" makes I2C break
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 06:28:54 +0000
X-ClientProxiedBy: TYWPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12929:EE_
X-MS-Office365-Filtering-Correlation-Id: c6f0853d-d45e-434c-0642-08de0aeaf302
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WIPAXS8ClFAE6gl+sXzTops4aIX8zjtv838ZZ1WMm4ONftrrZpTDM6wW3u4r?=
 =?us-ascii?Q?BCGVCFhFkptzq9Msf34NQXVfLAcFlR6SYiccf9IPeVGJDxLsk1kxXg/bGgSp?=
 =?us-ascii?Q?V9lIZtqf7P3xM3w+RMB5HQR01AhTrSERFd8n/sSUqHRqA3ZdaHOga8sz+fM2?=
 =?us-ascii?Q?t+YCBb1wGb2xICHctZPH+VHR415RaO68s/N8Q1tM0apKbAjX8shF33AdQJI2?=
 =?us-ascii?Q?KrO5XuTGq4mXLtmqYX7+C7NyvmRgqQYiE0UvUgaHBEzyli4nZHwDgbnFryZf?=
 =?us-ascii?Q?ya7F3DjMlBYo1DKFLmF86urW12Ge6hpIyqZNYbzHp0rRnVUbSQNCEu9f1Izb?=
 =?us-ascii?Q?SNG9C9UOp3skmUjY+DS9F/ORh9LowfNhZN14DdUewmTAIk639DbOA3yXnVlQ?=
 =?us-ascii?Q?hkPpV2hpenpXHRMGUqtU0mpmPh4RasJKplCG22aFpYungmm2/JFNNzEjaw5g?=
 =?us-ascii?Q?cesuKBp4ykF6Xn2F0XmPbaIXLA3J2zu/rJGulxKDtxTiSHoByNMrfAI5hQ9H?=
 =?us-ascii?Q?Zo2M3yRIYihf4DbxkIKv/CayFeEH9d1s7ZcANjUbGCfq5y9sHFq6LeH9Kykt?=
 =?us-ascii?Q?1aehuiBlbYSkejM3zTDbqBcYO5ckv7O66y5PhbXvmFLbNYu+NyIOjq9Kp1tl?=
 =?us-ascii?Q?mE8km/8RBASEwx2xIHJ70TttO56oVQ80PcXPRO/oCOCqsCQCi07cg/kM+Hde?=
 =?us-ascii?Q?p6VMnp0RMhnK+BpAaDC5oFP9bNzEdFM2VqjeixFO0Jk+U7eJu9N86Q/00ZJQ?=
 =?us-ascii?Q?RrQ6pU3DkihDP52IerweXvAaYBHSah040ygYmOMrxr47NR5ci7qZneHiZIQ5?=
 =?us-ascii?Q?0tPYDfeDo6ZAM4L+lplcgjoY8wElO1OuH+D6k8Lh38Wgbf3YbOwalI+TRNEs?=
 =?us-ascii?Q?+cWY5mhDBLvIPx70ebLurWJuouDcSnd+EBz4Y5cYY41IrNjDrbkr3c9w/IBe?=
 =?us-ascii?Q?ns1mjJz/ptQY8POpVhWEmWVJy/FX7spN/qpsCGF1GIs5PUC0w5BDKW6dyyeP?=
 =?us-ascii?Q?rXawaBz9WQlmFN5oCsssXZ7xpm7zgW+HnGZKzcudlj0brpNqiDZ8/kZZv1Co?=
 =?us-ascii?Q?hhT3gGotbnQliM2RKBoBEqRBwVicaKb5Gm9aI/YB3Ddg2R1dN64JJZRC0JS9?=
 =?us-ascii?Q?YkONH69ziNN7PowROLL9/dcxX6+2fmn1DzJz8g958XYzDjcqoJN3uIK2hal7?=
 =?us-ascii?Q?OkL/RBVvRTLx0T+aOFzN809xk6JqtUfFp5NtHiihCFmhPPK+j+e68htB/8e0?=
 =?us-ascii?Q?5NM0Xnrn+S5qpNMcgdY3Z4nh5tYvf6r7npommDajA67DZgf5s01w/i0Om4rx?=
 =?us-ascii?Q?JZmK04wnHQ3hg5NkVoYKCXXumFd23ZIkvva0eTApK7471KWIvzkKJLVdPq2W?=
 =?us-ascii?Q?hxBcFbhwhcHug4ae5L8zx9KujPwJdjb4NsnllfvoA65G3i8MXRkKaF8Y7/gT?=
 =?us-ascii?Q?H9B/6avxhuRTpHpXZelf0N9JKFoyvEMOqEmbMN8J7SMfcnIL02H7g8gr+DRW?=
 =?us-ascii?Q?nGHF1osPkVcdHC6hcNXMHcO7lj+Q1J4SFpx5?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0JES8/klBQdelgY5zl71Zms7SuR+lxb/bOvZiTLlqvtWENfu/6LiIhj6pbc6?=
 =?us-ascii?Q?QWp7Bg8yJfuODo/AVF7KjMvwfvlqsWbLobYcw0cXcQprLbR8wOcGAyzeJXEN?=
 =?us-ascii?Q?IHD5MKGOTDwUT2h42B/7SQ/d3bXrEW7X6GJtP+tHPh1JoXex9pd2XVI2xyGi?=
 =?us-ascii?Q?AzhPMWrN3AQoapDHd/mHCtIYpfBIo9OIQUM6plby/Ka7Vw8KxRfaQ8cXRAZg?=
 =?us-ascii?Q?h7Qn5pKpl1akokFiA2QJteFyv7ia/n79E6cqQbbACGS+l/6mjOfthwhgqvq3?=
 =?us-ascii?Q?bf24HzCDrwO3oYUh4RhKjpN8yAb8Mlbv3WocxDtPUR6XKnUh+ZnU9CiTCnhC?=
 =?us-ascii?Q?FCrMtmgLCXtBXfRxaKm5eQ8y0SFc2s3WjQidmrDg2KNsKDQf1RI0E9uLFMEs?=
 =?us-ascii?Q?kGBDb3GdojjuB99pe6Xrjlnq5BWy51BcYJzjBZ26HM3B3dKzN4FZzVZHyh/b?=
 =?us-ascii?Q?uTb3Tohh3qrNjTsl+dKz40UGxTHNGwCC0yLIsgjlqwDdgICMoGr6X8ODMAZY?=
 =?us-ascii?Q?pi6p/FZKDfmG2HsMImtBHL99rUrelOsWgAgOrApRNKSw/ZC5qAdbcecsfdAc?=
 =?us-ascii?Q?K9L9juMB9kBLPUcURkSRlV0xezHbfEBzJ4uuXymRps0eqMx24pdj4FYyDrsG?=
 =?us-ascii?Q?xZjXJYFoP9dGWHv5t2XfiAORhx1WoiwsNMFF8Sdn33SahFrSR4s6IKlMhUbD?=
 =?us-ascii?Q?QtBLz6ykj1daOMCvRvxob/y2BfyGJbYwyzpLmE6wMQOL6/xF7yPwWeDyiXaB?=
 =?us-ascii?Q?rmQOHz4OJWuTfy/zE+2dhe8C4ZKOdq6c26suodeNLF40adkwC3JHepYx9vCY?=
 =?us-ascii?Q?Kb8o/jrUV/Cjgje+iXugIhpUQ0vnAOGkQUUOfmuxHhwauw7m8TaCLFj3NXya?=
 =?us-ascii?Q?MU8Q8/slZxW5TRIJh5u2nvDmo/DX0vYuofKb+MdMUM6y6Q/lmvhDFbvdvx0C?=
 =?us-ascii?Q?478NDEbT1tqIlEWZ1nDj2+dVeB3LmP+IzHv2RLvyFqX7gMgCDDCex27h6P6P?=
 =?us-ascii?Q?xQZbDf2NnFZLTFe3jn+3R6mVWXCDFAi1GjO8yg/x9/eGUgFTO1nseE7G1qC+?=
 =?us-ascii?Q?RWhOEqZOKRL8VPoPhc3FY8YKL3so9jlPN2+IR32rR6x340N9tRy3PHbTFXVS?=
 =?us-ascii?Q?Pi/pd7NdfXQIrXXFWpqiBAY0cp0Ql3QJFqB1h/Hp3pTtJRcCdklpyS4H5x9U?=
 =?us-ascii?Q?efRjyonc/ViojzxnkUropPxuniFEdaorDp2IODsuEvqkPYWMk498UPDf+fCB?=
 =?us-ascii?Q?NUdF24pSiXBKs1Wt1hRe8O8hl1LjzgDfQPfOGXO5nfEADrxhpTu6HtVswxUZ?=
 =?us-ascii?Q?MFKH7pY2ILbTy2BianRiVzIv4wwuUn6XBlBNcobIcLj6QVYmfA1qu0Ut9+zt?=
 =?us-ascii?Q?Uo/hG8E+FsGFfVMpTdU6AkNjaErWAOSV49iKnVMsgSlUFEy2lcGbKbUBfQ20?=
 =?us-ascii?Q?EydSnc7CXIERZJdzItsVW6/aPEm2s+xRJbJb2rSJlrvaqo2h81MYcUJa0eB3?=
 =?us-ascii?Q?ReaR0P5Kp8/WrFLHQwZrWX+ynBt7VRsewFkvpqexLYjAojybvHifgO+uGn78?=
 =?us-ascii?Q?4JxYKfG9o86QITI4uU8zA0fGQ5t9ypmbzslkgMUvBkRYFXXirhgn9/bhEKjD?=
 =?us-ascii?Q?AmqOhYwFY0xHUIqP4u4+yJI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6f0853d-d45e-434c-0642-08de0aeaf302
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 06:28:55.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sjPlhMRxb6BU1jjAFUzubOPL3p6rn0WKPy/9xL9m+e2/sAYK5Re+8aopGe871oFHFVDRg/LC4BGcpmkxTA0r5f3Ex7Cu24p/k787jANE6E3vdKFCx/sc/MLs/j8H4G6I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12929


Hi Wojciech, Wolfram

I noticed that this commit breaks Renesas ULCB board Sound which is using I2C.

	690de2902dca98aec96de004428c020ca902f047 (HEAD)
	("i2c: muxes: pca954x: Use reset controller only")

Before this patch, sound works correctly, but after this patch, sound cann't
work.

Thank you for your help !!

Best regards
---
Kuninori Morimoto

