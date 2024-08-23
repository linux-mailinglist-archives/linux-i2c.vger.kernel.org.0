Return-Path: <linux-i2c+bounces-5717-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F423695C3E2
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 05:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC740284FDF
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 03:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A726D3BB59;
	Fri, 23 Aug 2024 03:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="EtluJSyh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2059.outbound.protection.outlook.com [40.107.215.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEFF383B2;
	Fri, 23 Aug 2024 03:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385099; cv=fail; b=BHCtWpZWLO5HyvHvI+VB4GjBpSEUu98P7K4T7FlPxyeZASVCXAfkClfnr/EcLSKa0xTnBCPKIWxAsxmsCG/7kmrt06Hb4c/JV0zhqicDggwTxgds4K8rCCNVftau/L6du76scSfka5nHzUPSMZL6DghTUxPrn2TN2rk/MMJSpho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385099; c=relaxed/simple;
	bh=a0zLsE1j2Gf3/rVV9f8v3hrhEfqyf2LjHP7E5KBlJDk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rlt+2vuqVqC4lRU/1VgLWYB2S31jJm8Djv7q2pn+IsOw0ytSjFuRI7LxnBSbU/wQfz2cFCH2+a/qw5sQ0obfrhand9RO3AEE6BcUskzleQLu9pn9iBM8DYC1ws2UTZ3jzelfMVztzaXB+F4xfC8dysBXU2nrN1P0Fhef4I+c1ug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=EtluJSyh; arc=fail smtp.client-ip=40.107.215.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PE3Q6KGwchK52HvZVPASh6HNlJ2AVDoEDnF2XPmpEuk3qZHxnx79YRKsUlxZHX63SK2M66NyfKeJt7Df2Whwc6BAcn8s2RSisuTusI30lSp9bSDRB1QA0nLbM9r7e7QW0aWgw1Iafq2Zu0IcbsX9HSGf8fTxvJJpjnzNfWLk+dukk/K20jROIrcWT7mTSzBZZsb716OaeGIhfmSOwZabNrwd0DiJjXm7UV8QOarY/t+hfegYNZjn97lXq5Haky+Q7dJ55c4UtrD4sebor7DWkcv7SvooUoAeXKOiMtNGgpcYzfyCgacCkmT6hQppPgb4ydPg1ZpNHm2qI6L/w7OvMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fh6gqHwq0sI6K+2JpXOAiq7ZlnK3XNIqM+42FuvrmE8=;
 b=dHZGplsN+FjjgxoxVQpkgqj9Wvq7aq+3uRonnHdxKxLAAxu+iVX9HVs46SUnkJEFbllokMQ6EI39ajpIreGI4w1gKBxAN1Ykce574gqLsd7/aNIdT43ks03cXNHesLGjV6/+91FLo1y57O3/yl0WjklqcchmsuV/wXneCjNHP7AGxx5PkyzpZgkGzCwYg7+eGSyxIvFLAA8PPmQQjl1sn5NEInaX9G8+VPm/aCJX7izImkbKAfTWQTr4EZSmR+XD9FbM4aSBmTXnsDR/Vivw7wwTVP1HtGHyGkqDUYYiGJQwrjcNgiECa5wlSAN0gWnTrtt7LXtKIhbV8K4pq6KvWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fh6gqHwq0sI6K+2JpXOAiq7ZlnK3XNIqM+42FuvrmE8=;
 b=EtluJSyhk0JkdhyJPEY+UMNtWAmj4JceqfV4XhpeVEIz78z431ffV/LbjMrm+EGIrPA6tdVtZOL4daRIfsnEUdsMLemmcVGJj8r3ny+PV+NqFl6L6rWkpw9wn6l5wpMm4OMXznwHagXYDkpHjYlB9WDT4xTziGfM1j2v2hD+7Q2aQuBec7Vo2+DKY2GphTed2+2NHe9CPmf27fUZv0+hTJlT316KWzi0cWPv8hG0b5oOqvt0JaTgSbc0UVRdDq2wmKUr4ZrtLYX7CgXKhF/x0BwwUmEjvO/ocluZJZu+7McRjgcRiyaZdu7/A1BbVS+5lPa7K/QsQDxY8bRvMYBcug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB5949.apcprd06.prod.outlook.com (2603:1096:400:337::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 23 Aug
 2024 03:51:34 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 03:51:34 +0000
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
Subject: [PATCH v3 1/4] i2c: emev2: Use devm_clk_get_enabled() helpers
Date: Fri, 23 Aug 2024 11:51:13 +0800
Message-Id: <20240823035116.21590-2-rongqianfeng@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0e3f713e-a081-4bfd-1c09-08dcc326e1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TmwKKpL9L4Og2HUnrg5ZddMBQEp3A2SVF3eqnSNHBgfzcpLgRYZUv0LJFSnz?=
 =?us-ascii?Q?pCsqviEirXxDUuht9AtEV/P2PHhrpqGR34kH465WgUI0WJXfZUuR97bUrXze?=
 =?us-ascii?Q?Cpx9Wj6nWDs1d+CLCiaoXKmDvoNv9KhRZmfsfY8T37/uS8UuAgWXeL57edYz?=
 =?us-ascii?Q?C+Fb4ZUVOyqk/0MT8H1nHs5aKR4/iW+lAK+MxXKpZz2AhT3gJ7NKIAlv2Bux?=
 =?us-ascii?Q?OQnIxYRtHW0OGOa0rm4dLiqhYC31sdkMk89lksXizSiFBag84DiteVgbb4zN?=
 =?us-ascii?Q?2MLwmQyvoLlKBOtW4ecTE1NC3cvc8XAgouLO4fo/pDfk7sw7RuDNc54549Ju?=
 =?us-ascii?Q?/vaWdhVttsJOz758i/ddZbYg89rm0jlKfVkF5UVfIaePvC/jnhRAVEoUzfZO?=
 =?us-ascii?Q?5m/A1ggRKMMLIKZ6u0dB5aeSxjZrV9Dynrud8sg/qXgcPWNRncaB+wljAoM7?=
 =?us-ascii?Q?oHq0tQyJ/biI2l4Z7+uwl7U7YbVrjod3buUKbGo8W/gxvmJexp7LnrSGZUZX?=
 =?us-ascii?Q?rUsO3jvcL0mZPEQVFcmHIEDbimwv0pSO+CRnGfCso+2PbpTiZP4/iR5TdGkf?=
 =?us-ascii?Q?E5QEpSDuv0sY5FRxkz01ORW+xIj8oP8z/DQPx0RQQBVap/wPaC7/EfCygZg4?=
 =?us-ascii?Q?kFj/A0cmDUSZjV3/L9W/FmbnGqIUKAOuW9O2OzWMBLBSGidFCSvktSrbX8+M?=
 =?us-ascii?Q?0y79sx0TUFhhkT8Q6r0Ny2iyZOdEGtReDRZtPeOZhr7Eec2/N0aMxoDCaHC3?=
 =?us-ascii?Q?9cmzYEd/Bzc5PddPAsDzSPh6DRxBliUWW5r4xO51KVpx6b/FVzc3+uPjRdSS?=
 =?us-ascii?Q?ZSrQcv/SVcbo8Ufn+p5khDGG5nJAWGgB8USX5TG/qK8khluxrX+96EDJ8NLw?=
 =?us-ascii?Q?hhU/rUTHlQ9A7PP/AraB+RezlIiuG2E/P4NzjkXedImYd/s6LUnq047a6vlG?=
 =?us-ascii?Q?AzuE9qQ/JKE0DB4Kb4Tupn93/a20xAvvHmerDn4gazcJT30QRdInn50sIG/E?=
 =?us-ascii?Q?oGFVhYQJNWMg+4kCE7FcXKFg0ERVuC6mGYNfCDTwA/ZD16627aRNREdbDi6u?=
 =?us-ascii?Q?9czskIOP/GPjVu6OGy0ciEN07bP3kvTqkTqr9QG1WkkmPKenRCyZU/VKUDCS?=
 =?us-ascii?Q?KEYJMnRTClFCbR5dBZkUjG160Yr2uq6lcuTArR1FlURHNAOIu40LzIRZBhZ7?=
 =?us-ascii?Q?LdeHMkZVzXwgi5p1PEmLkYDRXQhw9w9CBR+j2xfc4Xet7L9saeUe2Cri5xXn?=
 =?us-ascii?Q?8e4MzDSGknPT4YwOml4q4ircxsP0Eje5umHsyd76Gc8gA/rEuZuQuPZ0U2W/?=
 =?us-ascii?Q?FLMlYclNvytzsc786rib8L9f7jS+pvYWcsCa3IdpkrqE96IPRPn/7bFVU8Wd?=
 =?us-ascii?Q?8NJ8S92yFA1YNanFSFMM+yxNDHP1qTSHTLsbsjPEDcVfIE7HvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?B3vOppJOvTxv+MQ2TZmb/eb16Wt/VLqpaQn9O4lIIjd+8SgFTyz/Zc17fOPV?=
 =?us-ascii?Q?N12TL50d2//rnTI6Nbv9YDWHiMwaFdjvZsknmOaUBs797udWZaHOK7xezkk9?=
 =?us-ascii?Q?V8PYdium9ortncCFvwH/5D3fCG6jaI3c2VpgKWehi8doCPV0PUQw+U1NJjvQ?=
 =?us-ascii?Q?f3vX8dHQMF1o4I+xvplFm67JwXafC0ef9jEPb5uWhyN3Zd3zSoafYSS1+lST?=
 =?us-ascii?Q?YaAs4LTCxYWS1SPY+6k6XrGKo4pF3W4HZI/Xw8uciWiMJ+YqGyb0k9Cm2H7Q?=
 =?us-ascii?Q?BLEhpG/zxcYjK8Tc6yNTnXIenuPhqU4ZJTjYGO8FW8TcjV+ErUjylsng4sG+?=
 =?us-ascii?Q?xyfcFMxaJudCQ4Wzr5g/qneLLrH9QXj1kb8PSbn5yxM6T2NiUpWF9fbf22YU?=
 =?us-ascii?Q?L2Tbzp7AsmGfJAn2pqDEXqfF1Cc/HOugAVMxIFvT4pHgts6oiGFqaFh2w4za?=
 =?us-ascii?Q?2iQWLxUuaQcr0JKmt6fFUO+NZLt22wJYKaccScIHiH8ZPMKe3Z9eYcoD9ZDT?=
 =?us-ascii?Q?ufa87aivYmzKctVsk4LWKplYH3yZSP6r15LQ1Z9mYcSizpNopkV38JJJdE4H?=
 =?us-ascii?Q?KqiEBW+gUekryFmN9RATl8XlH1fgNhRDntHokUBTl8z9w5U62l9CipG5sYiA?=
 =?us-ascii?Q?+mq6+h2+ZNFggh+5NpB02vtraB1UzZOA2Sr7yFZtMV/OPxAOYYufEF7eLvBJ?=
 =?us-ascii?Q?yYM6QyeLclXELjrgQKaWZM+rWwHlSU+zafl8fUrMja6VwGK093gehDFmW0Xg?=
 =?us-ascii?Q?l8eujhs3UZhk2eHzaH5JKqLK4mye6MOx1UTWpKWCtnqznVr/qnr85S0ATv6C?=
 =?us-ascii?Q?lZ6VuT+VOY3UEA2C8VMqE57vjhSHJjNvu2onLP7/iY74jeumfPcSlmrhg55l?=
 =?us-ascii?Q?CmMPFWgC5N4rTUW8eVffqNK/QDxvFT07jsTEfJEEQ9RDLy/BKiKApyWfn+DA?=
 =?us-ascii?Q?npQjeyqfNq+f6fXEjW/kQckrZxL5fv/avqTxSEF5kAajnHM2hciQiNu3SZ5f?=
 =?us-ascii?Q?f0qJ0XepSQMXYsOQ25maFWRrWn0EOzh5hfIXgs1u12evcrMn5G04YoedBCjv?=
 =?us-ascii?Q?nbpEm0BK6cyKG5AWNaJzzygl5oonlNaAVRlkV7gyAo43YTOEoXf5KVfMZTs1?=
 =?us-ascii?Q?OHXNSYjYzpngk2GsJR7OKbUI9Hc35/CGIZxgGuRnwvrCZL+4QEPDbGQZMoIj?=
 =?us-ascii?Q?XkMZX5xqFDb8mTY926A+cLZmuCsmXXjJPemewBQd15FGxX1Ah30vWNa8u6/Z?=
 =?us-ascii?Q?M5Mn0wYEMsCO/K0T/MhNLj1rwijdRkZEJInbBUkKArBfYiUhN6wyRTgL77E2?=
 =?us-ascii?Q?lJ6XZ0kwyEf/LHAIA0UChtbeq7udv3vzGJW9+YjoWbXyCiHPsp0iyKomojrm?=
 =?us-ascii?Q?xB6Fy7rbjDek+64DAqmrZkdcRr1sac8nyvLdwnCbE9/cqD+UTo/5F0JJhQhZ?=
 =?us-ascii?Q?SZAQTvUHdAGzyMwGBMVNdFMRYKJ7PgadUSzilFR553bqHih2g8dXRtgAn2Py?=
 =?us-ascii?Q?H6zrvdL2jRPe42e7jYEW1/5O4V+ateGtSHjHvE5zetTBiX2ZXMsNCnAhLGbh?=
 =?us-ascii?Q?4bXPiBUNjO9dMhHfoWGJv61sQAcqNp+5mJjBjZX6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e3f713e-a081-4bfd-1c09-08dcc326e1d1
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 03:51:34.5972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgf3AeqpPU0KkYLD+Z2Jvwgrv+cnfUu/sNoatfwaUSKf3vawJ3fo4+DFSSG8hLSVDbwM+NLEtHQ7YXZXgIY4Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5949

The devm_clk_get_enabled() helpers:
    - call devm_clk_get()
    - call clk_prepare_enable() and register what is needed in order to
     call clk_disable_unprepare() when needed, as a managed resource.

This simplifies the code and avoids the calls to clk_disable_unprepare().

Signed-off-by: Rong Qianfeng <rongqianfeng@vivo.com>
---
 drivers/i2c/busses/i2c-emev2.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-emev2.c b/drivers/i2c/busses/i2c-emev2.c
index 557409410445..20efe0b0cb85 100644
--- a/drivers/i2c/busses/i2c-emev2.c
+++ b/drivers/i2c/busses/i2c-emev2.c
@@ -373,14 +373,10 @@ static int em_i2c_probe(struct platform_device *pdev)
 
 	strscpy(priv->adap.name, "EMEV2 I2C", sizeof(priv->adap.name));
 
-	priv->sclk = devm_clk_get(&pdev->dev, "sclk");
+	priv->sclk = devm_clk_get_enabled(&pdev->dev, "sclk");
 	if (IS_ERR(priv->sclk))
 		return PTR_ERR(priv->sclk);
 
-	ret = clk_prepare_enable(priv->sclk);
-	if (ret)
-		return ret;
-
 	priv->adap.timeout = msecs_to_jiffies(100);
 	priv->adap.retries = 5;
 	priv->adap.dev.parent = &pdev->dev;
@@ -397,26 +393,22 @@ static int em_i2c_probe(struct platform_device *pdev)
 
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-		goto err_clk;
+		return ret;
 	priv->irq = ret;
 	ret = devm_request_irq(&pdev->dev, priv->irq, em_i2c_irq_handler, 0,
 				"em_i2c", priv);
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	ret = i2c_add_adapter(&priv->adap);
 
 	if (ret)
-		goto err_clk;
+		return ret;
 
 	dev_info(&pdev->dev, "Added i2c controller %d, irq %d\n", priv->adap.nr,
 		 priv->irq);
 
 	return 0;
-
-err_clk:
-	clk_disable_unprepare(priv->sclk);
-	return ret;
 }
 
 static void em_i2c_remove(struct platform_device *dev)
@@ -424,7 +416,6 @@ static void em_i2c_remove(struct platform_device *dev)
 	struct em_i2c_device *priv = platform_get_drvdata(dev);
 
 	i2c_del_adapter(&priv->adap);
-	clk_disable_unprepare(priv->sclk);
 }
 
 static const struct of_device_id em_i2c_ids[] = {
-- 
2.39.0


