Return-Path: <linux-i2c+bounces-11526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 889F9AE08B3
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 16:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B7435A0AC2
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 14:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC5E221C188;
	Thu, 19 Jun 2025 14:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="irMXjN2I"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012011.outbound.protection.outlook.com [40.107.75.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B413521A43D;
	Thu, 19 Jun 2025 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343187; cv=fail; b=eGpqCnp5rDlBdeAC3uEoyGjoevMv1FgpB3EyyB6hfydhsYZ2LbaJ4diAisfJRzVEDtzGMD4ulN8WMV4Q+zJPzCYSs/a+1MqeNsvMCczUEynzFRtC6lzwT/o3dcJ5bOG1FhOEly0cKpUOWHTMZny9y40Q3xG3gjfTCaY5+yfgbtU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343187; c=relaxed/simple;
	bh=vme7CFNUp2twOFJdpHsa8x+LOAFP7+IKYn7IyDuFhsI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=fqq2Y9I+bzeniby7WG3u0r16TsRhhZIPwjYE40eatDy3Tx14N80xiVRdE3+T33nyzp0Crm9enwm4jh5GsMrIU7xwNtJxFsfhP2jeIYL9LfgTQL5sR1fvMOFE8sAkcrw4YQiJBmaygeTFMdgZJz6EqAeevAFIuUou87LAaSFNOtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=irMXjN2I; arc=fail smtp.client-ip=40.107.75.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwtC40+B7/2cOauFWtdrOGlaFN00tXVlfLdOD26NkoIPTLNU5gcn7xKgCXa2WQeSAb//QbGBTZk/+/sLoiLC2TLNJK03Hn69S6L6B4VJ8p3FApzbkavhcF5WHQhYX0HJbsQoCD9cxLvaWvXjBq3gl8XhzeNg1fci2Ktw4eQiRv7ynkFQiKvg0h2NXrxYUni4BXGNddQvD4pK6i6Lno9KDRvhephltGp4wMs27wtIFaz7mkWRVqSDaAI+w/BJYMK/A/8j6cG63AAWXr5z858rgM1uA35M1tNWwNCEJ4LGfEIn5RqJAMdUdzNLsyon7eNlJzLdcntcoY5wEpsWDv3VfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WFC4jpzQ4MWJTSXo5lyGEfv5q58EoHJmKNouQrNASE=;
 b=cNxULm/fcrYAkDugr1z8Rr6w8Cfve5QnccR2jJQR02Tb6esNUdXa2J6dZOyL3cmlmoAgYTsYbhMzLiCACDErUC+DBsAJm0sJmsZl31qF61RZ8CqPrV3pNb8Ce+N0chpc+1QXKxFrJK1i1fX9F2o2bKijCNQes9RlW2r5lu4SSqmsRe19BmumUm8eTUIctoy7KToIZoIZHz0imVkksJAxxL/11B0QWM0stM/jrC96hrSj3QnrC5iSKl5EGWMvsyNVwUoGlCC4yc/AlaJ+yDmviIfpI5ZfKKWcjLWErEw6bXAEn3ShzKRIyH7cMgz9yxP9IUhIGp1hLa2YAPbgWPiz0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WFC4jpzQ4MWJTSXo5lyGEfv5q58EoHJmKNouQrNASE=;
 b=irMXjN2IXV94KrDyXjkA8QOa7tvh4jyeIid1RI8le+qPUz8GbVTdfJivtvhLdWak1Q6Zv4c6PcZGecxEkydEzhVm6HlewBHUTscu7jk9tJiywi4GwD3AIGnnsxJQmygELfJridKYOTa6oRsdgNlyx4/c86pl2NlRPaNjTO5pAGi9hp2b82exyGjpmG3mdIixIx17ebzQDsYYJ5IuozvIhNhcHlJIV2EEzi+nzy6NaKNdNM1abKqaHfZnxgJO9PEWcvhqnXxgmKx5+5tSEar6u59QbCDVA9CH86ZcdhNpqdr4HakFGBGtn8wq4l6SL04kqA02yCRe59yJCxUUKK99zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYZPR06MB5906.apcprd06.prod.outlook.com (2603:1096:400:333::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 14:26:20 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8835.026; Thu, 19 Jun 2025
 14:26:19 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH] i2c: busses: Use min() to improve code
Date: Thu, 19 Jun 2025 22:26:09 +0800
Message-Id: <20250619142609.323082-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0048.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::17) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYZPR06MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3c7620-9269-4066-2f21-08ddaf3d4242
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Sd5vW10PR5DQOoBaHsqt8wWfu5ihuFmDG3F5d7RlAnNZGo7BVd48FXOvMEdX?=
 =?us-ascii?Q?ZXg2NohaHQ0yQnTyELhNRXJpUlgwcgLacjT4cP/HYaGXjgj8RSq2RHvnTKUj?=
 =?us-ascii?Q?BAQ6A/G5i4J+sPAAj4uNBhfqli+hlGu20v9FLgt6F0eAtb3wTm2wrXLk9vJS?=
 =?us-ascii?Q?Yig1uwbftL3OziRgXavtS/obeeO4ZajXymv6HtSIYMrtyOItcXmYCGbcZPXj?=
 =?us-ascii?Q?Mqt9+RSgkV6PioYkCzv9JvCzkeIFNyfD/qdAVdVyPgtnwP4X7L60nrGa4vMF?=
 =?us-ascii?Q?Vk3g2bEEbG1sKIa+bCLgJbQ9e98ZMA6iOY3cOzW3EPQ3gOX/siFDM1CphsCZ?=
 =?us-ascii?Q?ZrVj8skGniAE1taQH6/ik1yexn60xQe8yk+HQbfRoB31R2uIMdKrowszrwQI?=
 =?us-ascii?Q?8FbUvX4gLvZyiNEXtDTcNykHqtAb+fM28j8aQJG6so/XWnOnphTNJOuo55HW?=
 =?us-ascii?Q?Wo/OuhTEngJ6JUnTofDJA5LrDjquD2fKhxGtv2lvfzTX8slktkZj7KZxgl0Z?=
 =?us-ascii?Q?Xy7GkvgytrGV+GqWFyoM71rMFVsHwq0LHJSIsLSnmr/lzdw9W8Qx8DrenuZT?=
 =?us-ascii?Q?/M07HTvNzSYNkO8RdmSdzippWUBBSGQze4MwLS9Y8r5UB2j9hXSplNVsv99M?=
 =?us-ascii?Q?PM91bZmbGRfjA6kj4VQ/9fVGQ7K4Sri5yV4J9IUgFCHYloBuxiuuPaxwNVYL?=
 =?us-ascii?Q?FtrKDc2dnXcHrAhrjQkUH4+e1585N+K+ykqb+4nn2kqTEWdiKN8LxuwtQdAc?=
 =?us-ascii?Q?GJ1BmgfYKpmJIGY6C8kH/PgOnxBZaXF3bwsVL9JhcyCfNr0+T4yT2Hzr+AKr?=
 =?us-ascii?Q?uG7k7eMGZMgI+9zKbEcDy95VhPYjR96gvY1iP6p3YcF5Gvh7QPgf++zKMlFz?=
 =?us-ascii?Q?/R4jXlcYlwsvOOqgCkp4jq4ObBJGV+e00op0b1DONlneXg3uBRHZ5ZUF8q2o?=
 =?us-ascii?Q?pLel2wpEsn71agA7f8DtPEiEUTGqSC16c1aUe3bPBFBByP3NdVyhYUQVoQ4C?=
 =?us-ascii?Q?TYpMRd9wU1nF5dTiMd8pzj3ZCzijfUbuO6w80DxjcbLmGKmxSIHO7klyMt/q?=
 =?us-ascii?Q?t+737y5a3LRlwRKIN57kwOUTH+UR190iicO9fQ5nnxdMj1P9sNmdAq7TpC/Z?=
 =?us-ascii?Q?RKytcUy47kTRo5eAnlORmG6uEKETdJOC7WJxZ5WJJMDaa5GhBDuRCkqPQkez?=
 =?us-ascii?Q?xQZyjguOMu7J/q0bTKJMnO9rN3+Y18GfeMarCpcIllbwH5X8/3Y86Uflq6Bw?=
 =?us-ascii?Q?89LoObJVA6w58TsHg+TFwt7HbsJUIEu2P8Z6feOJ/uW1+L5R19a45mN0Jsuu?=
 =?us-ascii?Q?Vztj5bZF5GLrL/ET0Q7HloTMJkP17WYzhZUHI3v68E3+HtXWYp8/OYLVKEe8?=
 =?us-ascii?Q?vsFAIzhQS4OZmOVvA6PjyO5saTskPy/2u2OD1JLo7IMk6r9w4dlSHV8XA6dK?=
 =?us-ascii?Q?2B5j3l6Sv68/TRBZ8XFgKM17f5H/y3QuwrELlpO5ZIi3IArONCYowA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?z+gEzprTGqmoHW3y8eTs0S8U4m+2xpFVqozCXkERybq2iAh8Sn9zkuNOKNZ8?=
 =?us-ascii?Q?0ovL4EEzzRzie5nwopBT1QEqVOeDzi7VAckxZ2DIDRMGyKmKLLCEk0N0wPwj?=
 =?us-ascii?Q?FrOHJsEQI2CLEtIMYSGEVzSTAAhN4qL4V3jsNvkM0qaPACrbiZfOkC7WawB9?=
 =?us-ascii?Q?MivbsiY62cyZFQc5jg0OKYbzkDrQCJVQNADCGuD4wWxv9WWfLI0fpLNJ0Otp?=
 =?us-ascii?Q?iPbW1PtrOvtX5MkbnLEw/0n05IBwFPMC2bvjVy+Ub2I/oNEAS9A2CU7yQ978?=
 =?us-ascii?Q?PpxEUwGHR2BiOST/bZM0ZfwPuK9RxTqmAtcsPFMjHt9zxQpg/ybPcv9z9wZU?=
 =?us-ascii?Q?cTOwQ4It5HPXEmj7KV5QcVp0XyYUUmG+CbqjDTG8BOOyG62s9ZEFnUQwY13V?=
 =?us-ascii?Q?FnDXL+DCU0aq992rI6Pb1lkCNhP8o5Nuq17cyePaJQDWFLN0vwTtNYOI/waG?=
 =?us-ascii?Q?+nTkpKVz+NzY9j/ZV4qvD/N8qSQ1BoLRhPl+uWYh3Eh4b/FxSaQEfEZPGr4U?=
 =?us-ascii?Q?q+NFvsgI7WQfz9r+8jNFlJRFuKAHVro2tNDlXSB1YjTHQsdvNoDA9iAUAVLl?=
 =?us-ascii?Q?mY0Pj4kkoZ8B80tC+AJTWwMq7+4TQ9pqkjEjPEarosAZFnK8eoL9Ct12ZKQK?=
 =?us-ascii?Q?JdKhf4XtEyLclw9xMWF2e+nWUa1wmiFa5xP+EJJNWoLqOFcCghb2j2vQmeDj?=
 =?us-ascii?Q?cfwAwynxzIIckGd02K6NqtMkvESZzQDE8jj32+mFhqQkfno4gWRz933LvNIY?=
 =?us-ascii?Q?NjZwYPWtOlWVCGGQQjDGL3cGeSdqKCbHw7WkiUXQ+/8TpBpqVIm6RBwoYCGz?=
 =?us-ascii?Q?T19ci1rcXCliLsup+7JR+vkOBH2Wq1P1T3NuEvaWL3/bVqq+I/Ob2NZJIwS9?=
 =?us-ascii?Q?RK4B4w+PGgK4UtM8NWV/jxhk+LKLFfKA+T8k/ax9x/+92lMX7HJVStNtUWR4?=
 =?us-ascii?Q?GNNIds4AIoHmb1DenQae258sGV8nRz8bYIDmZwBWnNhgihTKupumL6uw1iW1?=
 =?us-ascii?Q?fDOOqvvomFQE9PH22NRdiApn2GrQlMpUJ6H39C5cg5DnnWPV5zbDqj0HqZxJ?=
 =?us-ascii?Q?K/9o+rkfoo6s80w8b/iT8UVlOPoBbt4D1mIPh0aw2XAb2xAGXMQmpnhHqaOq?=
 =?us-ascii?Q?DFds4A0t0hxtuhAytCX5m0XQwZEUwjxQ8qa7FqGe4g3ignS5NF2aBKia8SlZ?=
 =?us-ascii?Q?ml2dU6F0h6GFz7ZgfUndaonm6kbNFYe32dDpRJnXid8Dzq76WUwfNRbT0tg8?=
 =?us-ascii?Q?aCixVc75L7tEgaP8U6tEJWLoM54oGj115gixYOQUJg2GzhuL6rOmdj8E70uh?=
 =?us-ascii?Q?GTjg8jfNv0z1BMisQVdMMwz9Z4OdlVnoAXW1jj4J/k75kYvYRb/Frv7AX+Tx?=
 =?us-ascii?Q?4G7rDaEoG1yngCAiOBbuNJjFgMBa7hM6AAdW0SxS+Ruw/7SjpaBYt7VC/U26?=
 =?us-ascii?Q?0bmy2Ah8cD4b9ww3CGhkUX4P7/XrDpOaP760nLj1kipfTEPs8819cuX6IpTv?=
 =?us-ascii?Q?EYvsrU5cRYbjpOHRP8bzlRBZciUyG2JWI1s6S6qqrmQu7qAZDc9NYd5a3Qc0?=
 =?us-ascii?Q?ansYqLsTcunXCOElyu7YtX/HucX+eNOS5p9tXXc6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3c7620-9269-4066-2f21-08ddaf3d4242
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 14:26:19.9056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aV5Ryg2UslOtEeGHXZzKFt6zTSLECwDpt+29ZRMwcJlIxkeQv8yhj2TlZUKRHCh/CtV5erxHQW9njiGCOFpG/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5906

Use min() to reduce the code and improve its readability.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/i2c/busses/i2c-st.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 750fff3d2389..3373a828b5a0 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/minmax.h>
 
 /* SSC registers */
 #define SSC_BRG				0x000
@@ -422,10 +423,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
 	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
 	tx_fstat &= SSC_TX_FSTAT_STATUS;
 
-	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
-		i = c->count;
-	else
-		i = SSC_TXFIFO_SIZE - tx_fstat;
+	i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
 
 	for (; i > 0; i--, c->count--, c->buf++)
 		st_i2c_write_tx_fifo(i2c_dev, *c->buf);
@@ -452,10 +450,7 @@ static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
 	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
 	tx_fstat &= SSC_TX_FSTAT_STATUS;
 
-	if (max < (SSC_TXFIFO_SIZE - tx_fstat))
-		i = max;
-	else
-		i = SSC_TXFIFO_SIZE - tx_fstat;
+	i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
 
 	for (; i > 0; i--, c->xfered++)
 		st_i2c_write_tx_fifo(i2c_dev, 0xff);
-- 
2.34.1


