Return-Path: <linux-i2c+bounces-8590-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2BF9F5DC9
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 05:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC22618946DE
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2024 04:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4684C14A630;
	Wed, 18 Dec 2024 04:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ExXROpi+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011036.outbound.protection.outlook.com [52.101.70.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8E9145B3E;
	Wed, 18 Dec 2024 04:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734495999; cv=fail; b=qficA2NJYvHPFTsNEIUnMFXDOHg8oHxKe0pdEPwJZQlCfkuNAZZftaW3gsFdHuieWpHKPCNETJgBTGvHDx0WLdokD2kpZlSnJlbeJz/S8A4x62VJHoGT/MbSEvw5kxD6iaWH3j7KTRRbpthLKlgtBrJ4tNaUBwzcASkv671MYU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734495999; c=relaxed/simple;
	bh=b4skL5jW0KE67vB5GO/bXIOnGkmK7jEV8scFmWyrpi4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Pzyz1IqhQQO0y68+2CnEK7n6ak+fsSaOhnMnQSKObQC/URLpYdQkayMyPB+kGvKNVgClwJiZh6lsJpvTJA3aZQru0YznGnCvfygXDZdYx6n+OTllYYs5I0YgZrAxP2AwJwlFU9/cUHyHhCKeout1Kmq3EfDzwxnV5554gvbj/cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ExXROpi+; arc=fail smtp.client-ip=52.101.70.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmNNw1Fmo03+Zm4Qa511Mdk4pxcffdme8xgjYoXLuFrlP56vNvmB3VWYUWISHEWYzk5g0ULlJafk0Hz1Neh+Z+MxXRMZpnfD+9vtEPzwb+xzlP7EeaUbUsMCVZ4laoBs/45zfVLZOl2yN2tLSeJH8A+8IKZhtMCBfLvXWjQfIBfTR8Wz8GbaGly64SU71lkRDVbkS3ytvzSDLROUkCWc5VZs48F4otSmJUYlqpDXIe/2LU9IpGDR6YPOwuZcXfNKOJb8lESrTlesiBhPzW1TvGv0xbSsNR0Fb/PRb109/wjdq7N9ugv1vQ8gU3nK1B05up3Ca4OkvOuEdrrJtMsZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYAkcW3QosnWPlCGo9IoIR5pHbtdZ8TN8SjZ67bmjDE=;
 b=vTkBek2DpL0Ew/dTf8H5SyEvVRoQmxYQjbHCiX5/luGnl6gseu/+TQIztajE5Q1wmUPQzctd3X5tnjWmhdp8+9pefyn1UTFT6mh1502/QHuTTE2oaflbKVmME235FJPtyDYbdP5GqhtQy4KnGyHE2zBHUXbBzVi/nfFcO8UHNd07Ye+EIPhGFGMi9Hud8032To7WpA2S7Xwb89buOdYCXG1ak7tjWKomvvE9wHJrdb4WCOsQxAd+BUHP3/cq9Mze+athV6ehcH28vwE0Cl4v2wQdavwTyw9dvDVLABYsAL1M8EurvBxDvsrRiCHeY4g9b57fAzsiEdoet9y+gXNHWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYAkcW3QosnWPlCGo9IoIR5pHbtdZ8TN8SjZ67bmjDE=;
 b=ExXROpi+Ma0Uud5MHpd1Kom3QxfCaFSYIMXrqfTaq3TDr5oUIN/H6EVGfQpouOARyyXzNqu0D67ujzktuTkaLEP7FMpi6mjtlF12JBUR6DpoBmasXGg8wwsVDrLXmVVnlutsFvhAhTkpjkcEZdrlFcUuFB+anABOKRGdtLMAkVGub+mA/9IpW/1lQa6+dXo/xVmtQQq2pk6W7/4FCaaQWpw21b4L5+fbUkRt0ei+WuEeFIDDRDXR3jMAxw+p4dbWvQtH/nMDSBR4iI08SL9DVOjLqfzQURDdJyHNnR64DeXLZe5qA06shYolSgApV1VV3uQqfYRHFoDL6NPd9L6w0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com (2603:10a6:208:5::22)
 by AM9PR04MB8873.eurprd04.prod.outlook.com (2603:10a6:20b:408::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 04:26:33 +0000
Received: from AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0]) by AM0PR0402MB3937.eurprd04.prod.outlook.com
 ([fe80::4e37:f56b:8a3e:bff0%5]) with mapi id 15.20.8251.015; Wed, 18 Dec 2024
 04:26:27 +0000
From: Carlos Song <carlos.song@nxp.com>
To: andi.shyti@kernel.org,
	frank.li@nxp.com,
	o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Carlos Song <carlos.song@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v5] i2c: imx: support DMA defer probing
Date: Wed, 18 Dec 2024 12:35:41 +0800
Message-Id: <20241218043541.143194-1-carlos.song@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR05CA0085.eurprd05.prod.outlook.com
 (2603:10a6:208:136::25) To AM0PR0402MB3937.eurprd04.prod.outlook.com
 (2603:10a6:208:5::22)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0402MB3937:EE_|AM9PR04MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: c5866998-cdf3-4b98-8036-08dd1f1c237e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eqbSc8xrrSGNsLBROrv3JH9ekmV8KJ4Vax0Llj5vvPKPdnzc2PYWwYWtCHHw?=
 =?us-ascii?Q?V0019hzEeLhRtHncfG6YlcNY61WL2CuZllHtxyK/erOaUKiZIUO8fOxELxiV?=
 =?us-ascii?Q?7MbctNRhk6Kp4vHVdmE08gP7P1rQaRTVrWurT8R9/2Ctr7+HXIR1BRGK1if2?=
 =?us-ascii?Q?8mpq0AO+YFlAtXfhpBdYqg5WmOUdqXNUOuG2Dc+g56ubaL+JDAMEI0QritWv?=
 =?us-ascii?Q?+zuyNvyp17Bs01F7LQ8Tj4yyZxqQHebj3jlFXB+lPdKhVozSm6GHyIfV7lr8?=
 =?us-ascii?Q?fftzf8o3XiyIK/BQd0BkmV+EeJTIT9JwbJuTtqgVwmurUqQoHd39IJSDa5Ct?=
 =?us-ascii?Q?nwqKHoDkD/eR65A1vTISNTT0oWETjdQrTlRbgzlbFwZcWDnL0iyXwQ1sn9dB?=
 =?us-ascii?Q?Xyji3WQJAzmNFhkck08vhhdbdsLf0jlcZcPtZA/YmPBbWxQJLB8JaGNVfHPA?=
 =?us-ascii?Q?8dgWLjqziVcueqaU9d04kMKydsyMzyT7ffl43QAy7Uc5tEm1KtJujT25LqVM?=
 =?us-ascii?Q?it1EMok/MppP0wt08GhPGT4Ly+SrpxdMipUVQ0qvvJTPCxG/CDHCH81rQgnm?=
 =?us-ascii?Q?Jik3+QGw6DhknclgCYS1LvUOQ8XRZOPIZLSOeLPgxWAhUnCoJcJ6w6HaLFOj?=
 =?us-ascii?Q?vaWx60olUCZbK+C+By8V+iCaXykfhGzM8q0/QQWB6s93kROJXt0EFVAOCNll?=
 =?us-ascii?Q?zfd1R85ClZKcCHLdMzfUoOzJ/gy9onh2rMuoVIVKhZ+jyYwFo/Jsj16yVhsQ?=
 =?us-ascii?Q?PbFBE7ul5Hcu04mI8YaSSj1jttDo6Tb+xVfP5h9wckQ9LuK/IQCegd9TZLWj?=
 =?us-ascii?Q?94TB1juoMgp3iIOXLy/nTl0K8mhfx/hpQpYFAtvTyuGctoCVxxWoklGof0bX?=
 =?us-ascii?Q?jTLlJ7ohN6AwZIPVU3Vs59mnOgsXaP+qF6QDPr94OCHpDKuOf9dXH6yiYic5?=
 =?us-ascii?Q?eHV73MGI2bqSPTcU9iTjXb9cwrCkBUPjxM3VqCcoFtZmwquvX5NPwbhSPWtH?=
 =?us-ascii?Q?JKPRmiP2ecDCSwB9v4VGsthuWDuLI/+RY9h1zSWX75pc6bGlMOSyIrMXBmZJ?=
 =?us-ascii?Q?DgCb5pJNbVLmWSZkAJ8OobqSUwwr8dKyzKUXtkl4W41dswJ9cDBxFVo11cyw?=
 =?us-ascii?Q?Db1dnj4rVW2q3pLuZPxfE5eCLpkXHj5/Tp1jcI4sf87141nLVv/9ZZoketKw?=
 =?us-ascii?Q?dqUKKGaIdfk7Rp+LAzDEn6NR4tbGdkIaByN33sqq3cN0CxfQMYnFNkvDn+36?=
 =?us-ascii?Q?0w2Zbl5B0zcYZHAiKiPiY6KMPAPc+J33D7l6Z7psg3DB8WkCDjo1ZluZwjEz?=
 =?us-ascii?Q?O+2jScdz93jLEGA51anbItUmsQemzSbtytqBU9stASipIT7SmaOCFjSzGCGH?=
 =?us-ascii?Q?6fzXlRnRYSm08Lb0DISKx2NhebHpdqoxG05npwRVekm4dBx3TOhYSKVSJ5iD?=
 =?us-ascii?Q?p2eyO9+GRXIRneJgQIiFcCues9gmGzui?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3937.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kUaG/a6xobT1LZwPlqCk4KJCF8QoIzikZk7u9cgyEL+prP+FWVb/Abb7Os+i?=
 =?us-ascii?Q?ogn30NN3uHcNq7jSQu7es1bVw3v3uow5ts5jL4cvQhWCMcUmUXkFMqKoKNUc?=
 =?us-ascii?Q?nxmwz+CeYE2SCb3YtcVpBm+cwGo0scjdDOfmoDZIfgL+I8aOf9CZSLf0UDFo?=
 =?us-ascii?Q?ly2ElYllAffFl+z7uBVxURNGV+irDVPXGcaFtyLG9NGuvCo9kyy1GXZkAwvn?=
 =?us-ascii?Q?DRftC+no47GRlhWx5e6Lpibi73ihZ4b4bQ07EJssZalDxg62+HHsYv1G5p7q?=
 =?us-ascii?Q?/UTp9BeVhQVbtLy9nXV3yrXwj3pnbMjwfIy92/Oj1NJio4yzRJ1WEY/lCZ46?=
 =?us-ascii?Q?yLj8UX3CrrLkXEGk7JbNdCQCCmzeWZ11+liKxPxP4jd4Qm+OWKVVvxNSfIzE?=
 =?us-ascii?Q?vitdpPTKIAQf1TErgCmx3GnycPq3l+Lo3+x4WeG8FdBEdH+1EOebHKUMkn1K?=
 =?us-ascii?Q?plRUhmcnVA8GPXboEqy/g7nOSzrPQi2Wx8nVKIEYbxvyHHuSCQt+fi6f+qYT?=
 =?us-ascii?Q?wPLaXzo/D13cX+egwLCyQvznA+lwwlHn6VH5lnvM3cYHxc8GpiW91YE8TDg1?=
 =?us-ascii?Q?oRw+KUByyS7yONXuiF4Sx4GuSZXf9i/i++ybW7P5oaGn1QDWh0HAqsS2E8I0?=
 =?us-ascii?Q?miG8VwI4bIq4bfDluP5UY1a8D3g3WUZx1i1FPDs1dNDlpmSjUKh6FsQoCDrw?=
 =?us-ascii?Q?RvNRC78JQx+yHW+Jwtzezh4fyBJRi3agl9JOffzzbqgzTlLzgaJ6cmm9JawR?=
 =?us-ascii?Q?/UVz7xCzm+/8/kuXMTEfbmkc6H44vmxJth6Gk2OiZXK2oqoU2RV/kOtRu8YP?=
 =?us-ascii?Q?AZgcN7bNcagG7MGm173ZZr1kqREmjcIBcrY+CpYIZun8VlFzJm+5BjEDOu5u?=
 =?us-ascii?Q?2p2gIYjtmWkLbhEChT5+XIK+H1mDjdhqYFV2Hg8ABRKFnEkca52yW4wgwzd5?=
 =?us-ascii?Q?sXyW1jm4UFCcLunB0xogFr83PirL213FoR+3CNvUQ1xvqBIH3y1AryKpQv97?=
 =?us-ascii?Q?M9EX5rho/BfCFM65OaSO6SUE4D8xbkAvJXiVMShUpk4C73lzdHNcsLg/hXM3?=
 =?us-ascii?Q?WPV6V9wVQWRI1Wbo2QB8DKNXeAMDPa0NJsgsalRwibxp/IvHsDz4w5KUP0um?=
 =?us-ascii?Q?4aWQRbY7SlAESz6t9JclLDVDz4hJ+mxSOt5f0ccQhH3VOl9vjIBKH6O72xaE?=
 =?us-ascii?Q?xIKwY5QDievc5tMHOxrS4w6frqTkw97d5KD8bHyENjmCmx5+WouMaMWUJbg4?=
 =?us-ascii?Q?Te6vuhEbKMpOtzP01SuezUtQtFhVsRIW1aivaYkA+kyWK2+JUbhQ5xqSFLgC?=
 =?us-ascii?Q?pkysETfZ7s8QkHU1udOx6mWl/eG1gMIuc/xxcWDtEVPKvKdZpP1n+sKRBuEJ?=
 =?us-ascii?Q?eRdelIr5vohg6p4iAzCS5MwHxucOx2axrJwYo+ZmXb13ir4eNnE6eWdsucg+?=
 =?us-ascii?Q?LUgcBYJFTTYej4gV+346lCFaM9bTVTCNNRXGIVwPuhxlUm6o36mMUorXA5qQ?=
 =?us-ascii?Q?e+UFNC1agEyI0KfgF0My4Bc0P/bzxa1ARBbgf9LQ8NVq/PPWhy4BU9L81nAp?=
 =?us-ascii?Q?HkZ5ap9Qk+6ppyxsxh1JRhnCf64+DSh/87omMmWi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5866998-cdf3-4b98-8036-08dd1f1c237e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3937.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2024 04:26:27.7972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sXJHjaOe1jJW43OVBYBZoRD8oJYAxMF79vm46yXD+V7bt3Gq5I9NWSYRZXoJGMemo77nZiOJg8Cq9GBj6eUxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8873

Return -EPROBE_DEFER when dma_request_slave_channel() because DMA driver
have not ready yet.

Move i2c_imx_dma_request() before registering I2C adapter to avoid
infinite loop of .probe() calls to the same driver, see "e8c220fac415
Revert "i2c: imx: improve the error handling in i2c_imx_dma_request()""
and "Documentation/driver-api/driver-model/driver.rst".

Use CPU mode to avoid stuck registering i2c adapter when DMA resources
are unavailable.

Signed-off-by: Carlos Song <carlos.song@nxp.com>
Signed-off-by: Clark Wang <xiaoning.wang@nxp.com>
Acked-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
Change for V5:
- Add Ahmad Acked-by. No code change.
Change for V4:
- Output "Only use PIO mode" log in debug level when no DMA configure.
Change for V3:
- According to Marc's comment, remove error print when defer probe.
  Add info log when DMA has not been enabled and add error log when
  DMA error, both won't stuck the i2c adapter register, just for reminding,
  i2c adapter is working only in PIO mode.
Change for V2:
- According to Frank's comments, wrap at 75 char and Simplify fix code
  at i2c_imx_dma_request().
- Use strict patch check, fix alignment warning at i2c_imx_dma_request()
---
 drivers/i2c/busses/i2c-imx.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 9d5caa032c5c..0a5ddedf4dc1 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -397,17 +397,16 @@ static void i2c_imx_reset_regs(struct imx_i2c_struct *i2c_imx)
 }
 
 /* Functions for DMA support */
-static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
-						dma_addr_t phy_addr)
+static int i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx, dma_addr_t phy_addr)
 {
 	struct imx_i2c_dma *dma;
 	struct dma_slave_config dma_sconfig;
-	struct device *dev = &i2c_imx->adapter.dev;
+	struct device *dev = i2c_imx->adapter.dev.parent;
 	int ret;
 
 	dma = devm_kzalloc(dev, sizeof(*dma), GFP_KERNEL);
 	if (!dma)
-		return;
+		return -ENOMEM;
 
 	dma->chan_tx = dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->chan_tx)) {
@@ -452,7 +451,7 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dev_info(dev, "using %s (tx) and %s (rx) for DMA transfers\n",
 		dma_chan_name(dma->chan_tx), dma_chan_name(dma->chan_rx));
 
-	return;
+	return 0;
 
 fail_rx:
 	dma_release_channel(dma->chan_rx);
@@ -460,6 +459,8 @@ static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
 	dma_release_channel(dma->chan_tx);
 fail_al:
 	devm_kfree(dev, dma);
+
+	return ret;
 }
 
 static void i2c_imx_dma_callback(void *arg)
@@ -1804,6 +1805,23 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (ret == -EPROBE_DEFER)
 		goto clk_notifier_unregister;
 
+	/*
+	 * Init DMA config if supported, -ENODEV means DMA not enabled at
+	 * this platform, that is not a real error, so just remind "only
+	 * PIO mode is used". If DMA is enabled, but meet error when request
+	 * DMA channel, error should be showed in probe error log. PIO mode
+	 * should be available regardless of DMA.
+	 */
+	ret = i2c_imx_dma_request(i2c_imx, phy_addr);
+	if (ret) {
+		if (ret == -EPROBE_DEFER)
+			goto clk_notifier_unregister;
+		else if (ret == -ENODEV)
+			dev_dbg(&pdev->dev, "Only use PIO mode\n");
+		else
+			dev_err_probe(&pdev->dev, ret, "Failed to setup DMA, only use PIO mode\n");
+	}
+
 	/* Add I2C adapter */
 	ret = i2c_add_numbered_adapter(&i2c_imx->adapter);
 	if (ret < 0)
@@ -1818,9 +1836,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		i2c_imx->adapter.name);
 	dev_info(&i2c_imx->adapter.dev, "IMX I2C adapter registered\n");
 
-	/* Init DMA config if supported */
-	i2c_imx_dma_request(i2c_imx, phy_addr);
-
 	return 0;   /* Return OK */
 
 clk_notifier_unregister:
-- 
2.34.1


