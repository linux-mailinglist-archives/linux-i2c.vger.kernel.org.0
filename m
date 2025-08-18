Return-Path: <linux-i2c+bounces-12320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CF8B299D1
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 08:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41DC07A9210
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Aug 2025 06:36:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED97275878;
	Mon, 18 Aug 2025 06:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="m+evjM0C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013010.outbound.protection.outlook.com [52.101.127.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78901E1A33;
	Mon, 18 Aug 2025 06:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755499086; cv=fail; b=JLE7XlcmymgIFBaJlaxQiQKAzhq1OGdw0hcWAiv0vWY/6QbTmqRnpkaTmjH8s4PyQ1BkGmlIFNQ/fP95JA2n8fkuzRS1VJNJ6ViRmxwsp54zkBJQZnzqVyq+z0sUtt7QFr1kh0YmTunSsnUGL0QE1W2X4R0Cwldjxaxzza1fl+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755499086; c=relaxed/simple;
	bh=sYCiBLhGwA1/uAQR4NC//2VYlxDYe8ChHrNzFUMYfDw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LL0Yhj3fvUb3BIwOnuGm8hl7GOkEaXMgqymqtawCqYd8p1fXv0dRmvIq6d35caaa+BWQCd7EkKWz5styyU/LiVM6XAvXuX++CagauANnOhuq7Uyio8Sql7PpXG9PFREGWPf3ZIqZnXPDycBsKh86OUpUtS9B/Bp6f9SgcGVcnq4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=m+evjM0C; arc=fail smtp.client-ip=52.101.127.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZVqZG8MpSOPsCsPNg5ttGdwCD3/MhgwBc9DiKzBCY7Dom0Bnvi8fxy6VKwaM0taN4V+gw5c70NZk9mTYcmdWA0yKnEFYzadBkoPyPrUg1XJgXpI/jdUGX8JDpl52b7Dhbnh3WZUC1wzPRRfYGM8JgprFbJ9sNm68gwc8OYsuGZHNZ7/f3jkVPd8sY3oXBMEf85xhUGjMnx5cKiffP5lYShcohmunhN/HuURuhlQEoD31Dor7Or25kweq+JxtB3wD38Zliu75IWgbTAxIrjMM+l5vNiCNF80dvJ86PFlNe0WdO6hRTWsPpMMYd0gRNEwsSYVBdaSLZwDF9PqxkwOrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Atf+UOMkqOjy2v2JNrYzTieLnQlLfEjp9A4oM3xzEJI=;
 b=Z262pbydsyf5cDwTTaftZv3kVArhTvaE5KHgkz7iyf8yhxcR6SQqja9InxMy9vpGNf5nADh6rek35guvZ6af1V5KlOFpyX1XmHMn0Jdtxi01Kffdzg0FURuF7ZCsfiR4IhaVFmrb1UCJqO6bcJZehdYOk64tk5HZqgHbEFmtDW8j7puUtBA2Ak9Lw+WS6NFv4CzN/t37GQMDmQRQ6bd15tsx+1c1SGuP+Tsa8Eb7g5bpE+DlFONqya4T1tDQnnhGIGzjLCrcj74iXxSkY6z0t+nuG4rcjZfCh9IBZihwCIiEhLNTmShrOxNE1FQWNS4gx01B2uXUAhtZvXNa0WTlug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Atf+UOMkqOjy2v2JNrYzTieLnQlLfEjp9A4oM3xzEJI=;
 b=m+evjM0C+qAJO/8aKTzx//CjmzRtXgdMjm8B2Zu5X0ECV2DxTY4LvLDNbcT5V7SWGyJQDgeAzJAw5sVQa7Yb0Xp1p0mvDvZ1zXBY9L7gw6axYDb6teiY04EDjUbYbc/WQDQ4Rk11eC1VSirfyidu9Vuk3lp5LRnz0vu1+P8aYN1huxH09Z5jG/baBiR5O8HaxlFttM8GVmaMDiqBPA5+tEXTj5ojenv0ZLmhTpVYHqMfGgUfVb2VrDyYhPT21rKdsqDk/+te2mvlDJVNC+wv1+uvf4paCuOX1ZM5WfD/gIpkFIxZ1QYhPvg+UtKHC2SYHkWEw/UrWHR8ISjs/0nsfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by SEZPR06MB6690.apcprd06.prod.outlook.com (2603:1096:101:17b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 06:37:58 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 06:37:58 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: andi.shyti@kernel.org
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] i2c: algo: bit: use str_plural() to simplify the code
Date: Mon, 18 Aug 2025 14:37:48 +0800
Message-Id: <20250818063748.446466-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0027.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::7) To KL1PR06MB6020.apcprd06.prod.outlook.com
 (2603:1096:820:d8::5)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|SEZPR06MB6690:EE_
X-MS-Office365-Filtering-Correlation-Id: 071abcf0-602d-4b2e-0635-08ddde21c543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1mnBVvuEC+wb0ytnbIWKi4faY44zte5U8VBmOtGbq/sFBpaftkGRzbX5bhjj?=
 =?us-ascii?Q?ZIO+V+lvjHEhbl6fzjFndvLp8h41UTmVYrQ58RM9GNuZRejMv14bRxXcM25s?=
 =?us-ascii?Q?WqengiDZAxRbJ6xGrCIgLZplZ7wAhaUoFxZ0Y1W6J5TNRBhQKZQnJIVxcwjR?=
 =?us-ascii?Q?+W3FQlUAKqh9FM2xNkXoHdZwUdcdBw2dFAcRbL0QZVSLs0K35qMOW4Dpx09o?=
 =?us-ascii?Q?7LsVLGkz8Vax6KkL5xgd2X3C7JpNuDXsbBUS+goW9n1F1UkLh/DB4xT5nIfG?=
 =?us-ascii?Q?RyI25h1r8NH9LDoHMgtmziMlitBVnIkFbsCdJKmGJj0YTfAkIQgwekxE5Rqk?=
 =?us-ascii?Q?deh0/Ge6AuTIy7U1YKPJ1d3SBN/hCLItZkqroXDq4iTzG66gIEbFrWu6+k4i?=
 =?us-ascii?Q?EZ4AQKOk7LxoBKVZ8d4uewN5K4zhT2jQnGMt38ZILN84OsZ1EAbQMG+tyrKO?=
 =?us-ascii?Q?Xh7Cs/78bC5NXI9UPXGlynin1WC2Qbvw1bZ705WyM6HTj1W6SweD836Gkzuo?=
 =?us-ascii?Q?7VSTBaQkKpAZz4z2jDaLPG+lnwH2wZxA92KYllw8paOPy6KEwdKTK77i4YYu?=
 =?us-ascii?Q?tatnbSVUtu6yEuHonqbELt2Y1jNehdvo/IyjV9x8ZZvqXuEbr2yGx2Xe/yw6?=
 =?us-ascii?Q?1owBj1w+5Vj/lbAPQmhlyWZmRW8NUujtpOg9gt6K8Zm7yCnVfFAOWUQGdeOr?=
 =?us-ascii?Q?uf5TE88qoEhc1A2i5ul5mLoaGz09eo5fnE7KAVeN1hKJguf/bQCml4uJqDVm?=
 =?us-ascii?Q?QQUN+Oe8WgRIkw6/gJO2CLJ07ILT+74QNxlAvHxIv5I3DmWqbdDjxH9Plwje?=
 =?us-ascii?Q?xtJF2ll75dyrUbWfJOXs6yhb+rU4CuPY353IBaiOP7k5CljtyQsKwRw15sOo?=
 =?us-ascii?Q?WOvFEoYhKn1la8NenYWlfgdYops9EbVKh7DNny49WD4TRWH1ehx6zR4tyi8f?=
 =?us-ascii?Q?XrY2UYll7hzbsUxxr0TTgrS/ezlvW7uuDolVZGYEsRcq8PviQJtHs040gNjf?=
 =?us-ascii?Q?T0nZ6vaml2JHTYL+XFYAyv2BlJWDAAu+Xei0YmiPARQbWlB9225mMG2hkMVQ?=
 =?us-ascii?Q?r0zmB/CmpXQ9bXBG3HlTQ7bq57gkttjD69HaY6eHr37IwPWd5rho0IpK8hU+?=
 =?us-ascii?Q?YPH9dH1ks3qp9M4vBbejDi+phRdHsheuC2erQFmYefvFKAWoIG7A59vB4y6c?=
 =?us-ascii?Q?8WjAqTIy+7BvUicZVgRuVvLEqOjCwpwK8Ia2GpADx3wDCY5aiRm7+8CUGrpM?=
 =?us-ascii?Q?QCp2kIXr9+FzBBmie+HvCrpzYEx5ScjSuEAtHfCJ2GCuAvTp6Z2FpAIn79Aq?=
 =?us-ascii?Q?Jdtb6C+r1ABlcJty4nAuXgVR1eroTgZLjlhU1LwfSXY6XGevGozL4rkh9Mc4?=
 =?us-ascii?Q?pzAH5MN+YRLCTCl0rr9MdIZ+JX7GhpuET7Ra3I4W0c7W6/kPO6KsZyK6lm1F?=
 =?us-ascii?Q?VB7N8CuHQH1i5MEbfP4+T02QYC/6aoLGJBH8QLXH8Jp3et1QNVoRG/Rd/Fkw?=
 =?us-ascii?Q?wO9TPp5JM/ybDy0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6dvqtD/FP+Y7XgTQbUaLEjI9+iURoqn5ahisQBkG3PAifL6GC9vzHmvjP3SH?=
 =?us-ascii?Q?N0jtN2hlfqDF5w6qg1n0Yikq2OwEgG6ZZF6mdT6atgLBvZNXxATEeagUfC4E?=
 =?us-ascii?Q?ktx9WhSYrXRMFWyV1zmU+SyfBcp/KIWtmZbL4T7mrWtr9rC74BOZMU6IP5lY?=
 =?us-ascii?Q?pOvlr2778ZQS9iYDd6wqQyEBk5CVWr2IWeYDTdtCnsqoqDeYKgF8b/GFNT8A?=
 =?us-ascii?Q?RI3DMgFVphqh7bt6tDwndVDG6GJJ+p10dtEnXz+Vslxzn19NFCJzgkLt3Cih?=
 =?us-ascii?Q?PsFZXkwcAf8PVnhoIMyWbhnSW0xfb5uYGOWOtMifdguFF4EF/xFilLrrvBg2?=
 =?us-ascii?Q?z356nhrF6ZHsJrdVv6t9W8BdZR6JIlrjrpIowr0F21PKLo2YZjPVFRE5hHAM?=
 =?us-ascii?Q?7Y/sjJt5KV+zF/S2P8bIpWD9/saOSeuaafGhZwzJIc+l+snjJ7hGTtTNG6Y5?=
 =?us-ascii?Q?bjYGBymaGm+pO/s5gtRwNdmzk3X9H4uJrJhJW3CqeO73OSiELFsSRR+BCgVF?=
 =?us-ascii?Q?7xPmEBj/JPgx2BuRRT88GMZ2nk7Yeg9qATJIYRm9X6HS4EkENSN3wCwkW42o?=
 =?us-ascii?Q?sXsPS09rCLTZkg9XfPC++liLiPFe9XfEDhnVg/aCK1DZ1/n6yrE981U9glch?=
 =?us-ascii?Q?MLY6DdSdIXf47vXJ7piCEZK86Xxurw+PwJSMEaruM9JwrTAsH0GmW2HdyM6X?=
 =?us-ascii?Q?d24o99T1CLBv0+k+A5/3HxGdFgU3ULzLSBself/tUpUALaAQzk1EECQAT+eF?=
 =?us-ascii?Q?1D8Z22hjYmtJDiw/yrV7jv2eaaMgwG3+I+6tUF1V8jLM98kyM7gnhnl5/ErI?=
 =?us-ascii?Q?ZlVh8Mop9kPwwur6zk22W7p5GFVX/iA8XmAY7n/ywejB/EJDa1E8faKRKzsB?=
 =?us-ascii?Q?+EUZN74bVm7/ln7LA9/ECj+1bC1MaCx/6CyDi9zCt/1uVpo2hKYmmtZrfRck?=
 =?us-ascii?Q?q+v/rQPf7Bxq2RWMJVsZYDwbdMF97z0ylWFKt08RscV9QX/RX6qsY1AgmTNA?=
 =?us-ascii?Q?wxmpHnjd3IuDqyEyargHjUdC/sWDfT32363mqIzD7xWrFHbO9z000ZOdw1x9?=
 =?us-ascii?Q?7rCFYvOUKYCXEkYEjziK+jdr+uTtaiu6Tu3DwuMtpngQNCxOi/kZ4yiEN5vM?=
 =?us-ascii?Q?eIfpTsNtxB6PfjulNGqotN4qim19wbdeXrexeoIm7jFe1+d51wmhCre9H3qB?=
 =?us-ascii?Q?Tm/5pYOPVicjUWlTBhrl6i8SIgJeu0Qgj3sUiaxOQuwvqzDWdPYLdpZtT5Ic?=
 =?us-ascii?Q?jE5sMKEFW8kmEnPgMShy0jMXQ38YFGcAFMNfn+OK5Eaca6u8/lOEpCEnEVbo?=
 =?us-ascii?Q?aLxY+hNhoFShdFFFCw22cubJY19qHVw2FAzTvqsqIcmNA/3nz6Jgt2WRrbQm?=
 =?us-ascii?Q?5czwNBrZmgWKNnx5VW+Kqp4KkFa6VI7+F0AYcoOUNE6jbdS16NAP/4VPvT8r?=
 =?us-ascii?Q?dLopC9bakENfnqog86nGCjSgP1UJaa8FiQvtBuiQTZbdmBL19O0t+dkHP+XE?=
 =?us-ascii?Q?YjafoXVyhbSBVXYydWE0ZOkVPQTyYnLwtKw+enAb9rmFt4Ow5tzl70G8KcCv?=
 =?us-ascii?Q?Myu0EnF+EQdj0IrJaet69DFLXjC9czVRsWt1rKXY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071abcf0-602d-4b2e-0635-08ddde21c543
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 06:37:58.3626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGNo6nQujtvu0koex03nzEbXN3aZrvBU8andjJCmeQ1O81ZCi7Gj74VnuYbRwW90bpWU8366pwPfDDxyihhFtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6690

Use the string choice helper function str_plural() to simplify the code.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/i2c/algos/i2c-algo-bit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
index 6544d27e4419..d1d9a6c1a1e2 100644
--- a/drivers/i2c/algos/i2c-algo-bit.c
+++ b/drivers/i2c/algos/i2c-algo-bit.c
@@ -13,6 +13,7 @@
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/sched.h>
+#include <linux/string_choices.h>
 #include <linux/i2c.h>
 #include <linux/i2c-algo-bit.h>
 
@@ -562,7 +563,7 @@ static int bit_xfer(struct i2c_adapter *i2c_adap,
 			ret = readbytes(i2c_adap, pmsg);
 			if (ret >= 1)
 				bit_dbg(2, &i2c_adap->dev, "read %d byte%s\n",
-					ret, ret == 1 ? "" : "s");
+					ret, str_plural(ret));
 			if (ret < pmsg->len) {
 				if (ret >= 0)
 					ret = -EIO;
@@ -573,7 +574,7 @@ static int bit_xfer(struct i2c_adapter *i2c_adap,
 			ret = sendbytes(i2c_adap, pmsg);
 			if (ret >= 1)
 				bit_dbg(2, &i2c_adap->dev, "wrote %d byte%s\n",
-					ret, ret == 1 ? "" : "s");
+					ret, str_plural(ret));
 			if (ret < pmsg->len) {
 				if (ret >= 0)
 					ret = -EIO;
-- 
2.34.1


