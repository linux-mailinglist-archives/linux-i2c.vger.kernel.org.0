Return-Path: <linux-i2c+bounces-5719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD3895C3EA
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 05:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F32CE284F03
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 03:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8E85589B;
	Fri, 23 Aug 2024 03:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="WYvCBZPW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2076.outbound.protection.outlook.com [40.107.117.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F2652F9E;
	Fri, 23 Aug 2024 03:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385108; cv=fail; b=dHls/ZROEdtlSa4ru1zP9ceCPwwZjj7W6OleWe03qRFBUE64sBylRlM2kYA4vSw1clKicbOcYdB1pjBK/0NJpWPsPS1X1vRwVlaKuG6ZXyxyt83VBXGFEOitA3QghD1Uq0V8hc4CjxrFiIRoN/cBlFZ7tTMLQNvpw/Rl0dADEEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385108; c=relaxed/simple;
	bh=vnalnjId2K+5bbr4HlD5b3d5EsYOi8iZr3cfDy4oQNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PAi3K5vpiWfU+KhXCjhUiD2BxurfvyTGFW9ekZBz3aH6LwAvsr4XSVwW5jANU02BZ8DeUbW4XgiijhUl/q7lMCH5d08OsUcK0At9Lg61F25vkluhiWzEPIiESkR+4L0pBrCfx/S8t/iGdl3heEkDLDb5FZZitE66aCH0AYtbxOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=WYvCBZPW; arc=fail smtp.client-ip=40.107.117.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMskmwxReQjq6eH4kS2mQWhLVmr3w09HVqsUUL3G9uH2CmWvMdGmj6kQe2o+PGh6XOxtcnb7doiHTEAo9smKC28+vkfs2iVa71TcGbf4W8KHqZlch1SmULbY8iibWNPs1w1EmucUnkCDu/NDlZMeX9xaXJOMbZtBr66wKM7vOYZlmS6shSlu/PBMEPmYXZr9lyjki8yG576AyNOtPu3rU9EWKL8f/7GMhzceLNfZKMmJddyzaMkVfRtrvWB1FL77hgZ9tejPICgjCWcatdJoR64OKt3BNPFhndombrMESR0RPQitLeV84IEF7TotOboB9ULrvODoV+oK9Y+F1pEc4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KD3mAZ47w3g6KpUQoAKSv2PDeCM4yshrE5QmLmclw4A=;
 b=buLR+bwBpKj8AQjnOMP//ts+09UU6bqFaWxEYAiOT+o6qLkQO6KNjv1WT/BIzpl8y1WXfdn4s9kISmDBjNlarRA2jLAHPuQQb61iW3f4vEUbyfTu+DZtGPbYXakGtFTMulxsp4PfqciWYE5IDo0rnNteNSKIPyN4oExV9wUnpyWKmBpwhuRjFcTxbd6W6LZS21g2dX9IKNjyajyGmkzHedn0xkRJ85AXxqCBvF1hw7CmzlF98qjKosTaT43UcpA9299caitb1n6RpPMNdcz3E0mrgfaiYFp3ZN6MsK7EqeBuFBM8w+XmO9y3oI4zBk8BGJrWTWaDu2ZIeU76Om1/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KD3mAZ47w3g6KpUQoAKSv2PDeCM4yshrE5QmLmclw4A=;
 b=WYvCBZPWvEjUg+Mg7AQCiFGjXcRJkNDwJYxFF4+qQs753QQ0oLQ0mtYlV6gUn/eYohLVnMFZwlgqSMt5geN10y13z7gzMapTuSV34kNyZGyttaff1/kvZyLuF5gBwyx/DA7IXS2ofURDZ0iAQukrFkvcPAgWQxyqXl0ls6m8BvBVUVCn8+0j2hj0/2wKxiZ8mZR3UeegtYBunCs/q7jzKDm8axpf91+NDoG3hyTNL6VxACY+vIB4JEgYMdTQsHOZMmIcSJTiah63euOb5Kq4vc5/vnSc6O9BQXVojWANV0H51lxIvVvjLYvY3I+jyVN2jLEUka9dRyeckES2AFpXiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB5949.apcprd06.prod.outlook.com (2603:1096:400:337::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 23 Aug
 2024 03:51:44 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 03:51:44 +0000
From: Rong Qianfeng <rongqianfeng@vivo.com>
To: biju.das.jz@bp.renesas.com,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Rong Qianfeng <rongqianfeng@vivo.com>
Subject: [PATCH v3 3/4] i2c: jz4780: Use devm_clk_get_enabled() helpers
Date: Fri, 23 Aug 2024 11:51:15 +0800
Message-Id: <20240823035116.21590-4-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240823035116.21590-1-rongqianfeng@vivo.com>
References: <20240823035116.21590-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:404:e2::25) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB5949:EE_
X-MS-Office365-Filtering-Correlation-Id: aad497a7-c2d3-4751-11bc-08dcc326e797
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?36MVoks0pco1Hw4qkiwvwefejuNvpPOmyCemGvdGLQxNYmu4ikTuAY8OzZEY?=
 =?us-ascii?Q?gkMgDF6O14BbcTkPNgmipUeudyXyQPIW1CpUNnR3s2w/h9sBBF+gKiM7frkz?=
 =?us-ascii?Q?qtD6cLSyxzjYhYxHaQvSlnPmOn79BlrqzO6u6gpsH7wvvAghalJbkN9GEru2?=
 =?us-ascii?Q?UyrdIAoFF2OyzGNmS/7mnQcRvl51/wMX41yt3+3NbDq7fqb7vstLf7E5XmVR?=
 =?us-ascii?Q?aUf3D8iyDNV0WZ3D+O75GXbklDhfK0KZWxL6MkArG9uwXekv/DizUWr0wh8Q?=
 =?us-ascii?Q?tq/DA6kbCc79X+VHrlsfUupewvxZZJWz4KZGy1ZkQWRzd4MJOeFOmUV5aQUw?=
 =?us-ascii?Q?67rFBHf3v/gdfiWlnUKsgwyKHm7dEzmGjeU3JGxf1sZe+8u2a+/9m4D5mA/m?=
 =?us-ascii?Q?In7PqD9JGGPvZ4lAv79nCdaPfD3wfrga+F9HR+yXRCgA7zEgn7hxrW4qXIKO?=
 =?us-ascii?Q?on05DqB7tlTS0sxLRr9dS+rOHKcciYhP6HHpbLHB5E4l0zYtldPLESqO14eq?=
 =?us-ascii?Q?ESe6hh1h3DVWTCpahqFR7PKQaPXQtKXcJSFThfLxCrCkIN37M7sfKWbS7EeK?=
 =?us-ascii?Q?ENJhkK4DuSo7TIl2/4N5rQJG5NU3iUYUE9QKVyd9yHU2kqpJyl4GkSR4sZP5?=
 =?us-ascii?Q?3BG2Vhk5bGoBa1bTIUq/+4ElI11++S6mdu2aYPVvlq3lX+RbC9A4jcNplIyd?=
 =?us-ascii?Q?oSWApxsjl7WB8vQL81BZd2tRWO0pL9pR3VgW6YPW4IqxmLQI6NjxzcLCmkcg?=
 =?us-ascii?Q?9scr8Fox3VAiMwLwiRF4UkXddTLhGMXyOOBKQMb5p+sXy2O5cpqONjoIkb70?=
 =?us-ascii?Q?lU/VCmrG40u3R4HQaUzFM07q2bbEPj7A0/AjVToJr4ZDLy6F6G5WKm9U2Whk?=
 =?us-ascii?Q?VULyApo7TVhGZdo8o0A+spKUtNzlyVKyw3fDx0weHOEwlSzkbPJ91vn0dXEB?=
 =?us-ascii?Q?asEStlrLO6PeLQ1lY2kqUTcFYsLa3vroSNUI5SBPJI2mK/LW4XLM4uTykp11?=
 =?us-ascii?Q?mbH9Rh/A2jzfCx3QYuXA3jNEPdyQjPP0DqvAY0H+k/6CkSTf0LoCtFfkgITf?=
 =?us-ascii?Q?Z90t4von7tX8Y4ynbCmZjg1PtLTPxN7uQGQDG/t1qIx9uTWnezr4wjPBqUUu?=
 =?us-ascii?Q?fPECG9KmB8hohuzEoV/QURNi9egcjF+eJnSlz2hIi5HmyXgzdJ3lcVNtc9Qe?=
 =?us-ascii?Q?r3jU4utVddxiJLjp5ZEB6L7IIIn7DN/Gh7i/K3nd4nLDy5vPOUM+jYlHoO9U?=
 =?us-ascii?Q?+mhaX6trJ0HGsDCm7vSQAZtl5Su1wTEj1MHeyw+a/YJw3+w0TnG90ZdARTnG?=
 =?us-ascii?Q?kSSYzBHDuDQxwK/FRU+HDESDPyCSnH1PbMZDCDoPr5+fAWanl8pefyFkliel?=
 =?us-ascii?Q?l1bUY72BzjToZktXEJ2nywrqlSB5+I0jwh1Lf7xoPgF19XxIJw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?l7NaGeJTN8txYaCjXraFFgQ7dlnrdUFecRImuPiM9gmcAnl20Pm5bWU3GSq9?=
 =?us-ascii?Q?15gdVGqaJ8/Amuzka5B1GJmKNeRRjVGxlz065l5Lh4A4D0D4/5EsKXOzc3a6?=
 =?us-ascii?Q?SlonLl6t+TG/puD+t0Di7xuXEk0iNeuXUOr04TCDasMzTJMLVDN29OF4oAIO?=
 =?us-ascii?Q?T77gzK0r0qLrwoS113QF9ZUYHLvUfMRtg6lGeFAyIuLxZ6s6JzXcC8NFiS+o?=
 =?us-ascii?Q?vEaiC6A+bvPtg40ExlluB6v8buVGC0tJnVklZqafJXBMa2EBpqmsCNgx2cxm?=
 =?us-ascii?Q?knb1xLTv2MpbWYac2oUYSObR3IZ+2LbrV8nkdLfy9m/l7SR6lwIosWwV1gPK?=
 =?us-ascii?Q?tMWqNvi5txD+rA5xw03pRu74uNzQJdyIIm6/MB5MZm5/4HjB576Mw69mnNxN?=
 =?us-ascii?Q?wF73HQ4IM3z4C9hxkYvwtsrBde32OnYT1Okqh/RfyNAT/8eoNwhozQ0xIhjs?=
 =?us-ascii?Q?WAWQPuFDulnXRn2bzAobmxCgsWFNeKgcB625fBXiyOu8/3Tm+XieHH1iycj4?=
 =?us-ascii?Q?1C/RPQuynDSgeDXgSiFnqbRYnzZfmQLsLEGkxEplEVfOgvtxuHJJpNPaE0qK?=
 =?us-ascii?Q?33sPYIX7MpvM9deAPZY5LjIrBpr5xyaJWPa21XuCOIocj62anxcsgeFG+tHT?=
 =?us-ascii?Q?LWkEoEU6LM394CJJgMnIeSwpyoQPIGzT6TAIr//whcafdnIQZvf5AMkzobOs?=
 =?us-ascii?Q?eWIq/SO9mQSm5kRc5W2psuCmMk0SkAjtb/ULqDeDFEPcfK+y8wXTmEEla6q/?=
 =?us-ascii?Q?OzEdIFBTaYmZEBlThYw3jfXOsNTEYxG5CU2j0XM7J8FSr54pbvpEevMIVsur?=
 =?us-ascii?Q?NeOcNq0TM6kWGDJ+bnaBn3jwX9ZuJ7khKg2fcScfzSu8WVRhhc36wx6b5kxj?=
 =?us-ascii?Q?wu1PVQZbLi4NHgy+EntqTAY8JrLI2rT4sfO+MKAlR685PZz/wJdIRVBeb8rl?=
 =?us-ascii?Q?obVWV1QQ1F/VQ6Ga++L4RHlJRAZxCcxbXmIxXQQK4X2AMmbW6ZiIFpu4ZtJh?=
 =?us-ascii?Q?RxJBW5ESLEDkbkaJ/EigmkhPfn5CGF6a+nfuaR14feBwJln1DDTuKR55Bfm9?=
 =?us-ascii?Q?GnTV6PdB0IcX7d5BlBbZCq8ubAgQ6JdEuMG0hCtaw2sJeZWXYxMXZ/+IFvUf?=
 =?us-ascii?Q?SeJhuHSRHxeXLrXyKH9bEsidjIdoMajj5nfeLjUVi8BUaSIMjyH26l5UdojK?=
 =?us-ascii?Q?jvjBAcPZN0MYfRMDj4lJcLMe8yRoAN3NOUTrpGuNjbZCarwtDmCw9xlWysuh?=
 =?us-ascii?Q?+mMSySB3s4ytepgKcTVFIYjKeXdKX0/UmilkCiMm5nkEXI0WvynQGT+IiHK/?=
 =?us-ascii?Q?GufSCu2EXfI32CRfuCvEf2qhrLD+TY22TTpsCTsYuxAL4M0J+kDKTUK6GTq1?=
 =?us-ascii?Q?iceN9PNVpUhR41FrDCOMFQZDnAC7PGlzET3Tiuoj9f2oP9b8iU2gWwe85fyi?=
 =?us-ascii?Q?1tBGrOP70NwCy9gXKVUzqH+PEKllKOLSv+mX1M5ald4wUv8X5NSSM8dNzV+x?=
 =?us-ascii?Q?DJ5m+/4mICX79NWcYaUMd+lJwMqgDtzPAU1127Sf7Avm147PYICFoFSZhIdJ?=
 =?us-ascii?Q?53JPuGZGwnZ2B3iPv0ERunRh/9gQHQSjojRLmst/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aad497a7-c2d3-4751-11bc-08dcc326e797
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 03:51:44.3054
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DTUbGuMnDAQfEHrCbRHavOUIrRqSar9biArMErdMnAS6W34ftRX3WRsPi0WT4N6gempAo4tskWsF5S3h06gNrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5949

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
 drivers/i2c/busses/i2c-jz4780.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-jz4780.c b/drivers/i2c/busses/i2c-jz4780.c
index 4aafdfab6305..f5362c5dfb50 100644
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
 
@@ -827,29 +823,24 @@ static int jz4780_i2c_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err;
+		return ret;
 	i2c->irq = ret;
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


