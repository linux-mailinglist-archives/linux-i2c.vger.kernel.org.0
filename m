Return-Path: <linux-i2c+bounces-5677-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2003C95B7F7
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 16:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC930283967
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 14:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708211CC14B;
	Thu, 22 Aug 2024 14:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="H3eC/EH2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2074.outbound.protection.outlook.com [40.107.117.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A843217D354;
	Thu, 22 Aug 2024 14:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724335575; cv=fail; b=BGLJ1hPhfAFYquUwsn4SFsPAJxI+o+Qb5WQmKuSQHO32yDHHJAYFFmWQ4rHG45mywhIpWkQQje+4ErD5/k5vfnK59uGqtQaCZQVk+FzazSGC1i7wnnZibcu9Gz10SzBk81R8tWybl2wF3WdwyISR8/SY0VIjMMNem3klZ7uk4R8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724335575; c=relaxed/simple;
	bh=vnalnjId2K+5bbr4HlD5b3d5EsYOi8iZr3cfDy4oQNM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pGzs6+E3SdKHu/Blu2J3SVFcc7OmUAP+b846xUj+5YN1ua5wFsPPi3c6XZcpnlDJ8RfE++m6GZsq3muZLlx9+mJDCAb0dg+bsHqgGAebPPScjm+hTqRRj/W22Q0ZMHGn4AVDaKSJa4yguikijtde9XDQeLmWD7PC4MgZDiERZQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=H3eC/EH2; arc=fail smtp.client-ip=40.107.117.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QSIXckn5ibmnHOhjIh0ACrf2JzhQinQk8SSEX7SR0Q+AdCA6fm4f0jALPMJP6GTYiRzJAOXgHy1//QbudxOJ2T0ZgDKOJMHseDQc/XbZ+LFqJ3Aj76m55P9hG33eXzN7TTaPkbFHKXsAQWFkWzqaupqbXbaDI5JUsQ1udqxjpZWlM+5qze26Wnq01HPYnxrHht7322eqgx2cM8ywrvpzszE1nQQ1IUTNdozeR6B82tE3Ckh2yK3fxJ5m5T5neiSvhsUKLDAn2bkC1C3aZA+mkMRyNCNi3zk7+U2/BxMtcjHnKKM1gJaZ/COyuV2XOR5FRJki5BDJzmRwY8MQ6/3jOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KD3mAZ47w3g6KpUQoAKSv2PDeCM4yshrE5QmLmclw4A=;
 b=fsugDLg7CZTP2kBXFmHZ3JN28QAp2JiH+UETELLqlH26Vi9sesGW6Mst8Pv3WNJ1ADPI6N9Q/3eXKMWfswlruTF3uX2zLfFrDLJ5qg2QNqKa2r4QYaSkTjM3o9zngj36w4Y76NQTHsR+o40vn5D2tAoJB66b29hFICDWUuk4XLPnmi0a3dLZubSTP2F52NbrHwSIHf4xO1H8gTUn3MDF7VnUVccdAmknC2zFPqv5PL4mfTQ7Bj9vQsXrfp1983hq3zuydTtEl8tO3pWUwje5uDltyD7JzBeijJSakXbsehLI16EH0JNhehy2XWPw/xe+S6deXKBmIOgDv2y3No1BVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KD3mAZ47w3g6KpUQoAKSv2PDeCM4yshrE5QmLmclw4A=;
 b=H3eC/EH2zbrQouLkWPiGni5jsUzbh+QzvJ1Mu+JeCVlllPOalHlY+5ydoyx+PiMbhmDIQe9388aaywfgJcMecuO054fkaqiOtc2LQMYZW8JPLWE+RP1dhTvzd4AXxKImUWpOk+lDeozHOTE/Uz0H23BmAUsqrryCHtSW55fs1FOKlK++DZrhGIYf5KEd6e67c+SN/lf9ybyzyatiAuS5VKnixEgfBbg2QapLPrbWusCRCjHKCOG22TUbbBlzD2/nZhPhKnq2uS8G/8xvtk6Pn6isIXZXDISQ1lkfniaIfMRXksh+BsygRfgXeE2WJZop6Nv9vujuPZwIrvUBktHZaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 SEYPR06MB5301.apcprd06.prod.outlook.com (2603:1096:101:82::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Thu, 22 Aug 2024 14:06:11 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%6]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 14:06:10 +0000
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
Subject: [PATCH v2 3/3] i2c: jz4780: Use devm_clk_get_enabled() helpers
Date: Thu, 22 Aug 2024 22:04:12 +0800
Message-Id: <20240822140413.65369-4-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20240822140413.65369-1-rongqianfeng@vivo.com>
References: <20240822140413.65369-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0294.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::6) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|SEYPR06MB5301:EE_
X-MS-Office365-Filtering-Correlation-Id: 4978fd37-006d-4e2d-57ac-08dcc2b39350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aWlVKvXpTq3tjWTJWvN9PxtiMnWeitSxCgUseovHUKYyqINJbvGQ8u+99HmS?=
 =?us-ascii?Q?DW55EubMA9CSx/UpX3LjQnY01KWZ+XXfg71fnMJ0vB2Q2xkqtUrXVksbK1ct?=
 =?us-ascii?Q?VKJgF/9kbqPqIA8xiC1IeN91MPn1lw2/sJTOMKJIX1/7pnFkqz9/YuRER0Oi?=
 =?us-ascii?Q?DCt5Dy4LMrSYY27It1/GMqTQUT+unamRT44hxdRCgKPcYu+UZI20wcgzBENn?=
 =?us-ascii?Q?+lIDXdqbp8vWp70+p+EvUi1NkSqOQmHHTi2x/qCNsz07btVViAjB+9BQo14I?=
 =?us-ascii?Q?lzKI5/OTGip/UULjb26+sRy/x55D942e+y6qJ/krQUHUo5Abg7pavhKNuRuM?=
 =?us-ascii?Q?ixKjL9uXy4NsMtJvacPEho/R8bxDiYItgJGj98iVE14MWr71PFK2msGA4oCv?=
 =?us-ascii?Q?EXgAMJRU0VyaD8Qr3X1tYZlKtvccCkyO7Q8uq+1XD9hKVOroFVLwbSETYMjx?=
 =?us-ascii?Q?NOw+TVjWx1plyCkm3kemgGxTQXcrr+L5nnnkDpyK6tUvtWgikSZDBEhh3qqA?=
 =?us-ascii?Q?WBs2C73qLLMg1b+MrlMVvo1t9al5e1RAJwJs4K64u2w51QadrW+DQC0vNiJg?=
 =?us-ascii?Q?EZSteOO7HgCRgswcXPsdncnpea2sOAPOqnt/HsxMlPH4l/53PBYOSMtWEVGp?=
 =?us-ascii?Q?H7PNFTiKbIKzr7dunb4C7bpmotj9QxxEX6riTn5FkJtCfwyBVRnugx5mzGc7?=
 =?us-ascii?Q?2Vmc+jGrmTTAoNeB/W+/mNSMxKz+ZPLdXXDyHNYZ5gFUrifPR6pv2OY+Awia?=
 =?us-ascii?Q?fUZRvCQTfvVYUWCBQj5A6L1VIYxsZZHk5z3qPTks9RXcorz0VfC3YxmqzS6P?=
 =?us-ascii?Q?O0eTbvIn2bbsQ6AqYZsD6X+lZ28WrOhQkh6ZANtphPSkzlf+tT12izRtNUDA?=
 =?us-ascii?Q?D1Tv6E7DtcCxzsXeSNKVbbrq0T1A2lmIP0IKmd0ghC4rWzJDh4zKaOsQWtB9?=
 =?us-ascii?Q?rYmko1dD/lNokP+PBmzyfHqQbn0KqoEqmrQEioDYIUJnKT665Oe1Q+sGA0WW?=
 =?us-ascii?Q?W6jTbzSpkJdewb0lLUY0qWohN48zJgY6lZrSGMf8NclMqya3hx2Wb+HEqZxH?=
 =?us-ascii?Q?4mhgKXGvUTbgbyiDMGTh5LQC6S+2fbwoC7yIlVi3bLgVn89TT3de3jrZTAIv?=
 =?us-ascii?Q?vyxPz4bCAuJHlg1oq52l6CYRATIhTUelgV6pP0KPlMf8eZ2OeGjl5dnZ6U1x?=
 =?us-ascii?Q?ziOeYvGCoOg8Xh7lHumhntZJqC4FsLczEvnVy7OPeR4qM/lVD52QkQXfMYba?=
 =?us-ascii?Q?0u/G14pqjKfAQ9F+vY7O9/cNwKIOB73jTpi3PRgFyuoaKxkSI+eAs5GVV9wo?=
 =?us-ascii?Q?AOZQ81FTrB9XyLlwMXFl9gX6/4W+o5W+U++h1BI/PfEDiGBUxuK8+vK96zqT?=
 =?us-ascii?Q?+4F2DppfMHePQJ5XcgSgBdRNYgzjUAkpIZCRY02GIdTFzkL7sw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hf3qwd0W6O6qDJojWcq57AvM12BRtcYz0T8Avt6mMdE2096dsbIWz4p2YYG+?=
 =?us-ascii?Q?Gc5ypN3lu9iLVsXWDBs4pmeY8z2DeFI5XMNwM1zWegquh9tFske09TdRPPVP?=
 =?us-ascii?Q?e6L2U+aPsSv5luap/rXeSQ+ElM0QbrZEL8lmnZPsLiYmc86/JRRSso6XPs3U?=
 =?us-ascii?Q?rhA2ya5FBq3gg4hdYh9EXyyHubxuSGIRzYkig+99j51kwS3Y2VF+NQ4HbJoO?=
 =?us-ascii?Q?38CEP3+E3ib7BArFH3/+c6IA9RtR4MtyHezUWcniZJY1heZUv11yz1XuM9xo?=
 =?us-ascii?Q?RRj+zF118Cb3me9VqlhUeaSisyJ0l2mEy+ByVesPcNJqekTu9UoTIAl4Q/8b?=
 =?us-ascii?Q?mUXTqWFqNQr+iWvEEkMZDOUmZsd0qTw2RrcxewoCQSxbe/ydaxf+6xRWdQC+?=
 =?us-ascii?Q?fwBXiGCugxh/fOgTCJu+0jQj715JcUyddbm+NgheUKde0ejpGvwfSVx/fb2K?=
 =?us-ascii?Q?L2X/AmcxI2gwgh5oMgvWsAha33eHSzDw1Z34JaW5p+vKzZuNWw31pW5rYdA0?=
 =?us-ascii?Q?oLmSaS7NR4viQg5YICHwVJUUZw4jNnxdxLZuc+g8t1ykv8xknH5bzMLjJHCk?=
 =?us-ascii?Q?r64Z4Tm1Q5KKXRdbzG08gCiZWju0MwF2OsVhZEKO5NB+3eLEOlL1EjOsMrax?=
 =?us-ascii?Q?4AsB9BlAXSmMipodUITDh1AuoeN0kDo7zirnbMZ14suFvagzwkX9e03gQH6d?=
 =?us-ascii?Q?F/2q6QwnsN/FpDGR5gu2RLDBuNZF1yXcRECt9Fl5EXlG50kHJlgqCBSR0ysk?=
 =?us-ascii?Q?L6dwduQK6fZ2tfN+slWkhFy3N0rr/NRNLQyWtfY2i94PMte+wfsDug7gr/76?=
 =?us-ascii?Q?sugL+jE5epMQkiwxN5zKKQk++aNQSEiDMwl78rt/pH4WExHk45GGQ7/emyVt?=
 =?us-ascii?Q?vrcSJNoaDjCSCqTMYip6zZ7mAGPuIzN9jk8Mf+LV+kCnphAm6KYe8p6WfpYP?=
 =?us-ascii?Q?zxBhqTCU722oYgvq+2IxcoPZbxL7SPg5QQvfZ4dxhfvy/ux5IF43wx7WNlvR?=
 =?us-ascii?Q?DL15/NSw1sxh447jHg6M8Ff3Y6AzRB77wzrttPOUkysyr1a2hvr6qux64XPJ?=
 =?us-ascii?Q?anXwKkxCcquAttHkuRys056GN63aI2wa0BQyXRfjlUNfR2x9Fhbf6UbWn6VD?=
 =?us-ascii?Q?kFWK20MY//KHAg69YjHoFSvBlPgkcY3FCtYOar/WF++AlBmmDV6ZqjL630Ug?=
 =?us-ascii?Q?KyMnmKjTWVp/k6OduLKC7LvkoHPcmlfpbfRq4TmlmJqoCrdq6zDdey/tDAU+?=
 =?us-ascii?Q?tfcic5Kdv1nam2mbbvd6L/0XquJwwlTgrQPIvmWUEDoW26i9ZgPaVnkjt4jh?=
 =?us-ascii?Q?50xuPuFAKAuwjT7kwkkW7/fmc1TK8v7TLrpfSG3+rIOFfztWKuHk86Vjd0CU?=
 =?us-ascii?Q?7mfMFl+qdEFJM1YHuVRxGxQd7ZGff49y2aqaZqU+D/EaGUIhgMbQFt6NcW2o?=
 =?us-ascii?Q?ecsjZPaaLZTE3qg9HdXFV6mVzJiKTibrs6suIxzm9FXSogscfG9lz25ylh5v?=
 =?us-ascii?Q?pXjPo7k+hDz2pFrzJWsa0bLh/FfjoRFOIxPQ23n2Sztm3Zt+Yc9JQtXJP6AL?=
 =?us-ascii?Q?Vy0DCBOZ/3OYi2fsBwaum8ZmfH9cGtZmUCX2mZpZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4978fd37-006d-4e2d-57ac-08dcc2b39350
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 14:06:10.8681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZ9fa7wmpRjRBUmi5BEK+eicE9uGzfaJRXcUvlEZu9HiFyvEJRE4sQdebs3GM447Ueu8pbxb6hUosNDWIGwNrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5301

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


