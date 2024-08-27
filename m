Return-Path: <linux-i2c+bounces-5822-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 708CA95FFFE
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 05:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E5B221F22DCD
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2024 03:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0E0770F5;
	Tue, 27 Aug 2024 03:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="iTpcc11m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11010015.outbound.protection.outlook.com [52.101.128.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A679257CAC;
	Tue, 27 Aug 2024 03:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724730548; cv=fail; b=mnJZsDFIJertqMlm1QWqieuomWkpira4irfpD8YOei2WtkFVZoGRxa8MeefVv3H65JHkKZOpqzmJZ0h16WJkTGrpOIGUpGYFsgJQAudsyP6nwuQG5gWwvVpalQidldHhejJ+gtEqCTfJl1SouLfnMV3ZjHm8fAxB7d7IoUuKbak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724730548; c=relaxed/simple;
	bh=NqHJNC6wnB7+4GZP9jq/byOKxN3JJ9f9FElFA94FvBg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S/mv9e8N6LrAnNAfRAd7MhSFJluUQWRzhDk/2Sa9SNOhG19BEfrZp+nLSz+gfF1JRY7mxPXPONqxhgjLAQgSZu5UHFKh/rhl7bg93inlJfWrYOoME0wEpYapzby0CI6UHXMeWrTk1xmuKmBqXjhKp+V4TUp9zAY/A3QEu+zxTEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=iTpcc11m; arc=fail smtp.client-ip=52.101.128.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Co3vkHbit0yMd5tQPWJinspgDT1ISSKCPTgOwpEV419oa5ZJZrxZaE3QJo9LyWCv5aiLSCauYhtIpprWSP7J8J7LSwHtTIPE9Hn8JiyBihLeWg5prGDtu7sIanPfd155co3IkCIO6c+/6nzcSkqJsDCUDE/qQaNljvGAnzhpGxW0SneVOV2mY/k//HhBLE2O/CHRie9kiRfm72qwScht8ZphU5c/fPfFDwTKm8jIJlo5nONbW/MUkYnifdHxkQXqdz3S7fQAKR45C8f7pwDeRhvPRuHZ2K5FliXS2+3SHUDbbHJXHkvIeNe3XAfTymn0GNz4MgMuiBbXOKyqUv3NHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B2wsPYT2IZRii9Och4mlfhJpBSQygjtpkDFM2UKw5v8=;
 b=gJVxuHBOsq2Ocr/K/OFbpfvcs428g05fB4EoURNh3SNjVcjDWtTIe/5N+KIQbkFq+3Uq8/z0Jo0BebivB6YJc5rTg1HXIo7UraO222UiOkNRYFrHRou4uMSX4q/KvA6fE3txEaUbr+kHE+Tjns9V3BpIwTq3AUGvxMwrPpxjxATtHj96/34O8FqhmGONPxEoO41QqrPf5kNeFhrKSId819VVsCXo7tVIGfsrHC1KdK18wa4dAUr1F5rrlc9AhiqDWwurBVKsxXH9nKb3PB3qmAQxxxwSP/rJFLaw9KiaY/S/k7vMpzrlBmYX5KAqLPTJ7WL77yK3mgXO87Szy7zECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B2wsPYT2IZRii9Och4mlfhJpBSQygjtpkDFM2UKw5v8=;
 b=iTpcc11mOPy1xcHehJx1M9NyUSQcrjzPA8gUgOrXVG7pzEWE6nPpl6nnrYOXImYQeq26U9ejnHK8tAg+ma6eWBnQ6EdBkps1idd1LXjyM3vblRvWHrZCXvo1YON3JmbSTjXRSHM0+/LXP9NraqB+/lZNOymPX2HhkkOxeHrJqffPl4bqroeUJ9gqXt/XUVQpnRKbRQbr9aY7/RrGCDHWpKteWKUd6jXYmT9YRpU3UFTov9fLXywGz98z//TshaS6nv/ActkjVyL9CauGMkIkAbU5LOUoU+vRwfBibUwaxZv9v3EC5QD2Q/8F6sO7oaTmR2afals0DvUykNGtwZt+Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEZPR06MB6531.apcprd06.prod.outlook.com (2603:1096:101:184::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 03:49:03 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 03:49:03 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: andriy.shevchenko@intel.com,
	biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v4 2/3] i2c: jz4780: Use devm_clk_get_enabled() helpers
Date: Tue, 27 Aug 2024 11:48:40 +0800
Message-Id: <20240827034841.4121-3-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240827034841.4121-1-rongqianfeng@vivo.com>
References: <20240827034841.4121-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEZPR06MB6531:EE_
X-MS-Office365-Filtering-Correlation-Id: 261908ad-49a5-4ddc-778e-08dcc64b315c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9sLHas63k2HoAN9YC7wcwH2+G5fGzxJnX/7GFy3XPJJymaPOI3FY1wGzuKzm?=
 =?us-ascii?Q?4g2n/ASelHOzVtJzSM0VrACP8n7zVZRfAZI920VlkX8h5rDg746ZrJqsSYcm?=
 =?us-ascii?Q?IIbw340MU6DB2cGOS936buBVEVhxP9C0XQa5XL1B7a+iVTkIYzoCHr9G9xza?=
 =?us-ascii?Q?G0BQeshz/6dlA0KPIIVQ2Lx4ng37+d5blUzmarjLO7cksNdwEz54ZXWasKNx?=
 =?us-ascii?Q?F6RlqLunupfUYx14/edTM9XQFmy0go9lmbovGROLMx2SINZzUQ/U+MtOq2ZS?=
 =?us-ascii?Q?Vw2U6v63HI8ENe74f+j8kVXCoSFSFa2HgoEKfpsnZh3kIyrhuqquL/sV/qeW?=
 =?us-ascii?Q?b8RNImp7/TcDLSQRLj45JLGleSd3pVhjCc2x0hFYG7lDX0GIKMyhVPhf9uVJ?=
 =?us-ascii?Q?BLden/LFN7mvJa4Ovn5lR9lRjwGPd2XrCH17a/9UlAdVU5UvB0hhqsDjvdsf?=
 =?us-ascii?Q?67aiL46DBz4P1YIg3QbjjXHKGHtlt3jdxikCprXA85xMeHijP9U/3BjHt7Pw?=
 =?us-ascii?Q?owcNK1lKRo/Z+shhTtjXPE4LL38kEruH87Z3/Ia4mEydcof0UexmzqarHk1P?=
 =?us-ascii?Q?x5VtU3/xQZ0lwSeE6L22y0YVtAITUNtQA/S8Sp4d0RP3DPU5jSGHx03qneHv?=
 =?us-ascii?Q?ahk+o9likpXUbp1iUcBD8QWRHcS0reDV93cGWpkZsNqfvTUcvutimo0oz/rD?=
 =?us-ascii?Q?pH+m72m2OV9ohhjq/cJWJJHBU/T/PkcNRUhj3SM4a86u8KixBxwPzxoRxB0y?=
 =?us-ascii?Q?5EX2m7+cBxPbRACmOfQUOEvZ8m5tsYJbDdk0fK2bGivxgfeGCJ9DUGgZxVLM?=
 =?us-ascii?Q?Mrnj0YJhpV3dkK+mZ2Z/GwBLczr3Zv1CGlK9zLl+RKhI+zmCDh8xXe95kt8Y?=
 =?us-ascii?Q?DIbL8Iv2iFRtpgnNBuO0VjH20zAo75lD7chvYCAKBmFXgR4TArZCTEIuqZ8y?=
 =?us-ascii?Q?+wMXDdH3+9WdNbIv7bVB2XXScHUlnLDGaQPdjg+dPEHhfKys9VEr7rpOy/dU?=
 =?us-ascii?Q?3dpHNnsyfkxby+tBkATjiB5ZqqyaUoOOz9w+QgNVkgENTyN/g/5x4/NvMUB5?=
 =?us-ascii?Q?YQsUK2ECfI5m+SayemCDAzluQWUw3H+8BBvo2l39SGi0KHVVKbcy3ivwl0Do?=
 =?us-ascii?Q?jSu0pTvNHVYoHM5a5cAXtNTTOPedyUhLyPrg2L2DXLEEFT1gaVYNRKoTIS0g?=
 =?us-ascii?Q?Z7v83B7NBcQO5proFpIXcx8vsbA937ycBqIYZlZVtYU3L/RaVt3pms98x2fm?=
 =?us-ascii?Q?Xi+MC631plvePHVjdwkmJHZS9cOdHzEMxas4NoO4W1vQxnF9jnqMk3plFVJS?=
 =?us-ascii?Q?YMOapYJlkKxdmKLtxEcL4qe0inED5i/Np3UGBC+oSZZEpC998ffOz4jH5pmW?=
 =?us-ascii?Q?QNqYN8nwPcksubVnh0ThiMOxic57x6qpoymMowwv9dLsW2//3w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CiRglgMbnbUCYuD3xXGEV5XX5a/uCjPxyy67HhirJnka0uDP13odzZgy8vEC?=
 =?us-ascii?Q?pfCkpuqgXqoHnQzSvZYzeHXJhk+ljHYlfAC8RVmnBlcSz+/9E+s+Vc3unb0e?=
 =?us-ascii?Q?LWbnCqRcw8g74k+821kOKjj73Fuio0APQOS/aJoXFFh/P0eFIDsSEwFwvjzM?=
 =?us-ascii?Q?3kS+ht0wCksuke8mCxklOAELR8uAfvJ1X0/JU6cXBjScAsIFsdQPsns83DIF?=
 =?us-ascii?Q?PDzAhvuoUigGs4ghqo8664DcYSuumCM+bwp69uZBmPSAQf5eSvDbEARUU1Zy?=
 =?us-ascii?Q?OeVrvwXmJB3vyUqAe9/4nj/Bm8a6E77iOyJLvgd/oj7bpUmvRJMfNw0zg2/L?=
 =?us-ascii?Q?0R1286pUtVJ/rrYPUJi8/SQQK/UTg2hHm0L8VMT9F6qUBbtJtwYa9PQlabCT?=
 =?us-ascii?Q?aHn0qzrHTcdHDFfRIw6GL39MKO9u/v+Yt7XiXYGWbEaGE/3p6sHW+vREsXFG?=
 =?us-ascii?Q?0dRxUaiPwxk18sppo6Kxq8W27NaAzyX+ekHX6i29Uivo77LpDloJgyzZNbQq?=
 =?us-ascii?Q?A6k/YqLtdFqgqGWk6VS+v0U+wJhkrqtQMGJTOaTrPU/P/Jijme10SKRyN6wL?=
 =?us-ascii?Q?y5lD/lUq+N2CrPVTFs0pKo1XuKC9J63KQYQzo278WZ6MoKRQ1cd9P5j16ZDC?=
 =?us-ascii?Q?Zccn7clB3Pf2nkcEN/9fmVir98S/KlkNQe1QmxIsI+Bd2Ymv7GUu8g5aQXDc?=
 =?us-ascii?Q?otk7FSeEx+e31NPPWL277ngLO+8JPgSqS5XV2cUGnk8TGpDn3oOnsYFUQBLn?=
 =?us-ascii?Q?EdHwcKCJxJCiyTo3UHi/qRNVaoNPeewOVirhwVKoVeqwvS2Jsqo7Mt/78psB?=
 =?us-ascii?Q?qpT7PFAOBNWbAuTFd62G5qIkOlZ70XB5uxnN2U09/dq1iKU3X4fAcBxwdATz?=
 =?us-ascii?Q?5sd5KtXrkPsbcZSBA6dwUgtVuPJVhf80AlNES1EjOHaBFwtSTyhEHOe1D5Ii?=
 =?us-ascii?Q?xvuXvVcypqlrp1xBymba3Wgwfbriv2ou7towveAfGG2O1Z7l5cHfYLZ0cZZC?=
 =?us-ascii?Q?LdkYFzwt/WHI9UdS4WOL6UVdSn8fbCg9Uu7l9/s9d0QvpIG96vd/g9sb9+l5?=
 =?us-ascii?Q?G6xXbIa2MQyPtEXWoqmECxZ/57sjE0mHRP+Znz9d5JjJCYZGtumIfyGl7tT0?=
 =?us-ascii?Q?xwz+7OJ1NoLNK5le0ojw6ijw0dUSsp7x7ExPIkmXaAsUb1IWi2yUnEaVBcZ0?=
 =?us-ascii?Q?otJUUQ/qhnvtmuMLBJP3s9yTI9eFCZezMI+iPyjXwDpv+6/lcDmTo+I4/M6n?=
 =?us-ascii?Q?u2TYGwHxFpV/nmSr0cQ32Q+QaJQ3CcqwdOjwf7RnHpQxSoS4IQiu87Hpz2DO?=
 =?us-ascii?Q?eI8sUKAxvgZlqGyoymEILPvVuqSMl9vtHc9N9jWuQmhCSnuJs1EWVf7wDDKy?=
 =?us-ascii?Q?Gy40/XyjfkinmJBo2t3/WoM4W6/Do/Iw29g7wI+uTAZsxAEBiS6maOpNg1nE?=
 =?us-ascii?Q?FKao1dy4fDbjnCemkNtmZaIj6D3Hjdh+XjrPPvcsBzuX576K+G0sGv6XfLhb?=
 =?us-ascii?Q?nM+7qxXQTkKRn8V+Oe7xW3NUGHL3DjWekx3aFpIntEMDBh644JrztXSghnxz?=
 =?us-ascii?Q?sq8e3agJNYBs51QsYnbiKus6MLy4pweuVNqg6gt/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 261908ad-49a5-4ddc-778e-08dcc64b315c
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 03:49:03.5279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: goFvqpxq7YlqGG1n23iYhjtWvfTIak9NGHGytxj2V4yKthHOxpeXbROMIsc/tJRDR9+LvYq7//LQQXk4TlWY0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6531

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

While at it, no more special handling needed here, remove the goto
label "err:".

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
Acked-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/i2c/busses/i2c-jz4780.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 4aafdfab6305..92cc5b091137 100644
--- a/drivers/i2c/busses/i2c-jz4780.c
+++ b/drivers/i2c/busses/i2c-jz4780.c
@@ -792,26 +792,22 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, i2c);
 
-	i2c->clk = devm_clk_get(&pdev->dev, NULL);
+	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
 	if (IS_ERR(i2c->clk))
 		return PTR_ERR(i2c->clk);
 
-	ret = clk_prepare_enable(i2c->clk);
-	if (ret)
-		return ret;
-
 	ret = of_property_read_u32(pdev->dev.of_node, "clock-frequency",
 				   &clk_freq);
 	if (ret) {
 		dev_err(&pdev->dev, "clock-frequency not specified in DT\n");
-		goto err;
+		return ret;
 	}
 
 	i2c->speed = clk_freq / 1000;
 	if (i2c->speed == 0) {
 		ret = -EINVAL;
 		dev_err(&pdev->dev, "clock-frequency minimum is 1000\n");
-		goto err;
+		return ret;
 	}
 	jz4780_i2c_set_speed(i2c);
 
@@ -827,29 +823,25 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err;
+		return ret;
 	i2c->irq = ret;
+
 	ret = devm_request_irq(&pdev->dev, i2c->irq, jz4780_i2c_irq, 0,
 			       dev_name(&pdev->dev), i2c);
 	if (ret)
-		goto err;
+		return ret;
 
 	ret = i2c_add_adapter(&i2c->adap);
 	if (ret < 0)
-		goto err;
+		return ret;
 
 	return 0;
-
-err:
-	clk_disable_unprepare(i2c->clk);
-	return ret;
 }
 
 static void jz4780_i2c_remove(struct platform_device *pdev)
 {
 	struct jz4780_i2c *i2c = platform_get_drvdata(pdev);
 
-	clk_disable_unprepare(i2c->clk);
 	i2c_del_adapter(&i2c->adap);
 }
 
-- 
2.39.0


