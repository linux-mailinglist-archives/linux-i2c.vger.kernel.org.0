Return-Path: <linux-i2c+bounces-8202-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BD89D8755
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 15:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE522164B2C
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2024 14:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF2771AE863;
	Mon, 25 Nov 2024 14:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ijRoYZxD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7AA1822E5;
	Mon, 25 Nov 2024 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732543613; cv=fail; b=GFbtFD1BozBCVCdCdXKFrGJHkWZz/aDNzgqXwY/srO4DweTKgmtMdwMEEzoQalATgb3Oeasf500c+ZYPwH19Aw1Q42eZSBk5D89zobnY6IxsbTJ2Inr3zt8lFOhJS1gjawO/UdcBQdCajef4b+9oqDb/WKTZdP+/hXUFQlgZ3ZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732543613; c=relaxed/simple;
	bh=64xt1JO42EliDXzuBpk7+EAtZ4UQ9DBSoQqbg6zCaUM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=G8yWOjxaRYtUVRGejlWOKtBSpahklxvhSNOgnBLmnqrtDqXh/KjXxX19yZDdX2Nq+XCfdypm0b0IBwhs299T1jehzSyxN6Rlfp2tlLqqUEkeQ3bPfiQ3G73Bd5ImhhTYfyx4jCmRZG5wnv/85ubayJSxDrsb3ZsDjxTwCnE+Gak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ijRoYZxD; arc=fail smtp.client-ip=40.107.22.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+z1oyK/dfbLEIyeZ7eIuh4/j/SPsnPpN7viZtQAINuXnG9C3wx8cZTYLccgYYu4nBJPqwehWoSQiVTGeb6BxZ0IWcdhe/YnbA6wmSGGkDahBP6wU35mpXzxYJPlx8rFXc/KjdYhghP5SbRh6D2DShXWEYu6HF1l3fvTxPYYTZS4gPtzdmrY/IMF/ZEWuLPXOj2nlolhjYuJMRn+Y9AllOvB1G59moyffBvrDCSDeA8gNAkl5YsgGPF/WVanZ0Sd1vxsLKCMxx8mGHhs2Pbh7ujF3xOFJ6rK0BmKdwpSkgbxYSUK3wR1VTPIZC+hrVcY6jkP7zJhiOo+MkFRMNMfcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaIdQrInkRuQ0JQhQUkfXrxuh827knd7KtBLV02hJhQ=;
 b=yEEZN+cYotSZs0bvaT0zmhms5rYaHqMYuPpJhb+Z8ugvCo9qyGHjBtBIkum+ZKSxUVcItvm67GwB6HujMUBYhijGhTuXBtjLNZEiTnlEy4lH/ShZ1URroegASGxYGwZXtnGfEJIFAZ0nQ/iEeIT2uoiMAiHTZVN5CtINusQs0KnDQOVZXvNzh5Uq4Ktk/ZgLkqi8HtElSn9rL13FHpZ3EgwNVW7SiZRhx5Aocn00XpMZYJSLF5OwqjrEP2okBlrWGxtibQfzjFc6A5/wqV8SiRR4oES6oCXNFl03SSWME7H0rYJv4URg7AlMpmlloJ+dvQTpGhM+ALoldB04XQw8+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaIdQrInkRuQ0JQhQUkfXrxuh827knd7KtBLV02hJhQ=;
 b=ijRoYZxDqvuAZ66xB+CJd7nMqBR+sm8Ox38Ogg8Fa4ADNgYI47+0HhiFiyM8kbC0slZA8H6hYAn0p4ZLRt58eF8RHzDCdx8z0J3w+Bb0fXK0huh9Db5W/S3ktY4hPeqrRHGgX22OIV79n02LjSrYLWX7fcCSq1XOmxLUe7nka5xlDDCH5XHezHugbtJ8ZAxVrCsVXEhamTXWZlPtJcX79y/zPk+nn0MDyoQNIHHS0E2LcOCptXhWADTZxJYYd08hs6TI9D7m2/Y0p1x6idF29duISi4gj2lOVG2Tqvl1J3M0ArDWMJjjWtVo5PO49Xme6NJO1uA+1BOHO9LUQchbmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by DB9PR04MB9282.eurprd04.prod.outlook.com (2603:10a6:10:36e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.27; Mon, 25 Nov
 2024 14:06:48 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%4]) with mapi id 15.20.8048.020; Mon, 25 Nov 2024
 14:06:48 +0000
From: carlos.song@nxp.com
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx: fix divide by zero warning
Date: Mon, 25 Nov 2024 22:15:21 +0800
Message-Id: <20241125141521.1612947-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0436.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::7) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|DB9PR04MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: 66602695-6383-4040-8f24-08dd0d5a66c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u+t5zyWClN7SrL/wbl8oclUZCiZVOYAYHRxv30y7MX9rTRw3X1JwoZgu7wSe?=
 =?us-ascii?Q?gFOEXZDjnmDuxbMCahYh6GxJOozwiF9zfDIXDBvdMeAED/lroaca1vvBgtm9?=
 =?us-ascii?Q?jdSjpcmKhaQt5cWKpBz21SXG7/y/mkTDb7cQNxLazbnkS/R9c5mq7VfDLrfw?=
 =?us-ascii?Q?Lk+PrsXlINLzSHRHtLGiMwV3c81ROzDaj2neLvq1txxZL06tglfXXUxcPb4i?=
 =?us-ascii?Q?b1h/65Tp3SR5K2Ey8vNgufhMtxIWS16zynfklKb60slFjyb5gwu3AciUhXQ7?=
 =?us-ascii?Q?mATwNYWoip/szCzpV+lukFpUJaP+K9v76tjMbIhCd2dw74AvOlaPv0Mp7yeC?=
 =?us-ascii?Q?VNDxOjJKeDyOTA055+UgiQP2LJmd3YXq+XazbSXNUMeBXOaxdZDWQAKmFtlK?=
 =?us-ascii?Q?HVMYLexLkZEMOLW8reZS0yvpjNVJqdVCeDhhdsA6UltaqaX7DuPsIVidcp0R?=
 =?us-ascii?Q?yGH7DWZb+LG9Gx5JyTgW/Gc8mryJhYECWeMRoLgb29h3UNyGSqduUFZsAnzj?=
 =?us-ascii?Q?n77fCgAp9UhMmakZp7ejZytnOwZmm7Lwf+GJOTnCf0cNIAS/ZSlyZ7JGQJUW?=
 =?us-ascii?Q?Fp+Ze34CHY5nJC0qDuAvnfHEcdLcT8Gx0FXRfPhYJNuty+Truwn4ZQ2J/3p1?=
 =?us-ascii?Q?seBQUzPHXvYLhjcWwH8Y/XXiTib4CF6d7y8YOwTsoVrdrCZJ7Gia8a2u7vDG?=
 =?us-ascii?Q?PP8CW1nBW+oeoXKAj+BqVKF16SYVK5qqJj5EGA8VlrlkZw/i6AerIKmkuRC3?=
 =?us-ascii?Q?O4g/k5TuQJ6SsjXHLHCOxq2dGlC9cDw1W/uA/g0Ym4amccTOTl02a537HBNN?=
 =?us-ascii?Q?kILIjBj2+5C2hqFGWZiMcwZsEVMndb3cKnIpPH+T1xeEPqJSjbArVUb/i+Go?=
 =?us-ascii?Q?HfCtZ2rx3ox3o0GaI8Tp8ReYTEuRqNTQW0tjSbuERPNovo8R7gf938v0NuNr?=
 =?us-ascii?Q?dh7XTxjKougZktQaSQbMnwlxI7isDvl6XLbYc/K86hNHk9uW1hDK3mtAMrB/?=
 =?us-ascii?Q?BLck9N35kEJh1ZK8vSTR6+C+NdBqYPJkGyxVJsjMvcLtWJcBWUyjY1g1b388?=
 =?us-ascii?Q?qpq+SFxxZ+B9cUR70l5KlpfeRgLPfwrhVaoMZzpxUB5NRzyjiZZDFKtF/LDK?=
 =?us-ascii?Q?E+d5AsHi4w9+YtnQe6ZcvdXzlPkw1Tj8aWxaY4jYAZ7ixOYEYgI5B34R+WJ5?=
 =?us-ascii?Q?PKYil0cyZPmepF/LI+eixt4Vx6N0WBV2QNCDw5pfCTfKKhcd4ZWPl/S0YxVG?=
 =?us-ascii?Q?FbNn7I1CvF2Gbdn2yUuxO9KnNdjkiu43wCyuru0Xdw5qYCbnljQI7D0naIQ6?=
 =?us-ascii?Q?ANxJ/L35TI+i2RfZAOi08zLev/baV+JqzEnmO7Pqozziain8VHIqdFuCC+8L?=
 =?us-ascii?Q?s0ogt/pexjzX2bMgKqSLAfoSIXGdANbW8Rir9yVFIWrXUTP49w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+3V5RtRLf6FpR+jYXrhYPHqFgAZqH3ZQb7Zl6hv1w0EMFVRHTIPUdQR7/UWZ?=
 =?us-ascii?Q?OevoQ2WduhrS32u8K4BnB98/xQKCjKdvfr81hOorDPeOF8Am4iKGWQSGKCs2?=
 =?us-ascii?Q?4ixqtBZ541m909W32jtl9YL0wU33AurZtGYJnzwSELDIiMH0JDzsyXldWEn2?=
 =?us-ascii?Q?XC6kphW6CguSLX/iQj/EFnCfgiRpJ1N+8+6a2HFz6FfFbJrNmOMqFkWLnLKB?=
 =?us-ascii?Q?F0WE5qLH2pW+m3nV8XWqbVqIkzC44YDLiHhzr6kNQwwniTGM3ccNxss0eMsC?=
 =?us-ascii?Q?a9UB5XLXqWCwfcQQfcdb5NXgeUHHqJyH3whdK+F6UU5gW+KhqXlQ7DJco4Sj?=
 =?us-ascii?Q?npC2CjOWKKU9I9dt4Mp3F9mzyBM3IU1X/WKbVoK9R9/5zwIN339/My5w98sI?=
 =?us-ascii?Q?n2dQboJM5ChxkhrJOQDUb/KSkmwrZqunBKdVwI95P6T9KJtPXDWIvb4om0Qs?=
 =?us-ascii?Q?O7VriVBfOPk50jQdHuRhCdKhlCwQ5/eKhFqaWC0QMskS6G9bWDWXbmOT9lRY?=
 =?us-ascii?Q?JAvcyP0d7Q2h2+6n0DzeO09nLF6MZZpfhScKQ3OmpYb/RiWJtDbdc3S9RahL?=
 =?us-ascii?Q?UU3xWlxpCJwzDWrEcMPGh0KeF46eab7HPOJNBRlGVOIrqjzMhhxwlV47yuZp?=
 =?us-ascii?Q?gORj2vhB4m00d/7kFI8SMGxHB+WVvwaGjXTvHvl6bshUMxdTWPoUMsJ25faq?=
 =?us-ascii?Q?BzZXdH9aT7XB83kfhUwQnrQUnrLndUgd4D1YL2VZosKBp5Ryi89AqkQchNJ+?=
 =?us-ascii?Q?CPe3GPkbbrgc4ksRWooLBExQWtq1YhUXVIVo1BTlJiZIbx3wknz+GyIXeZUM?=
 =?us-ascii?Q?s8VTueJfP5rIDS5EVmM9YZEyqxQO8u2yJ3GOcmPbZATKYwWWQssGPR85i+fR?=
 =?us-ascii?Q?D6RWkX1O5hBM8ZAlt0j+3KcJCzvePh+7Wdbti/I8lUqrw/1Sm1gANW3YzuI0?=
 =?us-ascii?Q?26tYE4J4OKksm3VZYeWc0Mc1SsYC8r2AkipSuqxKIvuDHvGFDTds2IGMjGuR?=
 =?us-ascii?Q?H6vifclmX9OGroMI4Rap6KNu7IyWyF+GF4z6VydaMQzHMB7M1cbZW+aFPjZH?=
 =?us-ascii?Q?EUERBTunxvjh+yu435bPMuIERfRL+v30Nh2I6ALy8q9twoQo5uDDJ7GtOAkc?=
 =?us-ascii?Q?WTjuBW6s0nNex21R9cyT/r+pzm1LDoi/go1L+NYmlSKJuJEVEjr9gzlhVaeX?=
 =?us-ascii?Q?laDrcqnodWHLE9dEzdZBNTmxVpsPy+ng/i+JG+oCeVSSHro3TEDRSKCt50nX?=
 =?us-ascii?Q?mz0kp8LGsQ5C6YQVn/lS5MukveJ/Mr7oCzQlHtGhbc9Uill/ZCAI93y57vei?=
 =?us-ascii?Q?O9zJwTIc8aouLHKlsnvT00aaqB7UCwBn8ozbKTXman2T78lVn4D5wSijbU6P?=
 =?us-ascii?Q?i6d8UR4ZoufS24T8LTFNqYHXEGv6wksf2w4qs/blFYkSBcs36iaA1hqafJ4x?=
 =?us-ascii?Q?TapfikulyShmyB7P3BhISfQnUEYPZcUhojZx0zLFyMPvVD9UIJBTx8OwnaBV?=
 =?us-ascii?Q?R0dDQ1M1KXBSqePAZx6iy6Hl3ZuHruyA3MLBv4OVrzdN12SaiHV8Ia8x2qLA?=
 =?us-ascii?Q?jYeS/u+o0ndYTNVVYnstNZRhs+P9thu8ExqTPz4F?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66602695-6383-4040-8f24-08dd0d5a66c6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 14:06:48.3243
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FcsYe7j+lLQF6Li/A4HjvAuG8HuBayZguOMvqqBPKRq668cpdiLr6odu3HT7CTIVHRf8imALWiqIBo0CnUltQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9282

From: Carlos Song <carlos.song@nxp.com>

Add "i2c_clk_rate / 2" check to avoid "divide by zero warning".
i2c_clk_rate may be zero if i2c clock is disabled.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 2c782cdc26bd..5ed4cb61e262 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -623,8 +623,8 @@ static int i2c_imx_acked(struct imx_i2c_struct *i2c_imx)
 	return 0;
 }
 
-static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
-			    unsigned int i2c_clk_rate)
+static int i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
+			   unsigned int i2c_clk_rate)
 {
 	struct imx_i2c_clk_pair *i2c_clk_div = i2c_imx->hwdata->clk_div;
 	unsigned int div;
@@ -639,7 +639,11 @@ static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
 
 	/* Divider value calculation */
 	if (i2c_imx->cur_clk == i2c_clk_rate)
-		return;
+		return 0;
+
+	/* Keep the denominator of the following program always NOT equal to 0. */
+	if (!(i2c_clk_rate / 2))
+		return -EINVAL;
 
 	i2c_imx->cur_clk = i2c_clk_rate;
 
@@ -670,6 +674,8 @@ static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
 	dev_dbg(&i2c_imx->adapter.dev, "IFDR[IC]=0x%x, REAL DIV=%d\n",
 		i2c_clk_div[i].val, i2c_clk_div[i].div);
 #endif
+
+	return 0;
 }
 
 static int i2c_imx_clk_notifier_call(struct notifier_block *nb,
@@ -679,11 +685,12 @@ static int i2c_imx_clk_notifier_call(struct notifier_block *nb,
 	struct imx_i2c_struct *i2c_imx = container_of(nb,
 						      struct imx_i2c_struct,
 						      clk_change_nb);
+	int ret = 0;
 
 	if (action & POST_RATE_CHANGE)
-		i2c_imx_set_clk(i2c_imx, ndata->new_rate);
+		ret = i2c_imx_set_clk(i2c_imx, ndata->new_rate);
 
-	return NOTIFY_OK;
+	return notifier_from_errno(ret);
 }
 
 static int i2c_imx_start(struct imx_i2c_struct *i2c_imx, bool atomic)
@@ -1782,7 +1789,11 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		i2c_imx->bitrate = pdata->bitrate;
 	i2c_imx->clk_change_nb.notifier_call = i2c_imx_clk_notifier_call;
 	clk_notifier_register(i2c_imx->clk, &i2c_imx->clk_change_nb);
-	i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
+	ret = i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "can't get I2C clock\n");
+		goto clk_notifier_unregister;
+	}
 
 	i2c_imx_reset_regs(i2c_imx);
 
-- 
2.34.1


