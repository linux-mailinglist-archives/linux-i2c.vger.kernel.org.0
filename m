Return-Path: <linux-i2c+bounces-11875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DA2AFDEBF
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 06:24:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DECB7A5E55
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Jul 2025 04:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACC020D51C;
	Wed,  9 Jul 2025 04:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="n0xHpAXN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012001.outbound.protection.outlook.com [40.107.75.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAA429D05;
	Wed,  9 Jul 2025 04:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752035075; cv=fail; b=Hr2hGKyaBVKdEhGxzbVMNmk2wscRa4TabFE2KT3xZEdPP+KVW7WHY444mA9xAwG2GHJvF1fiTX7fLX/FP/2yWmUuzeuReFxauJOjc0owZEzHrU6BKVpmqCTwZM7JlLRTvjKq9fcMB8OKqSVkDgXsv2qHy0MqwJ7QBk70ecww7PY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752035075; c=relaxed/simple;
	bh=QqlVOi2k5QUCSVjgFIUzA5cogYJpNtk9WvLGx3NiE5Y=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LoHS7P3e/yh43GcQFzs8y9mD5HjuQhptkUPdzXzUzx50UN9qjqjprMx5BJLCatk7SuFGT8+WzPTBGx1TwbgaKb6CDq8Iv25QDH5C1q/0qH7jdcKFhWc6fHlWet3+V2GbGFV0ZM3oxtUtQbcU5SYEpQmdV+ZXLynY7ThxkN1aISA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=n0xHpAXN; arc=fail smtp.client-ip=40.107.75.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+jA3Zl9UkKuWz7UPVdChMB2UQ47CS6mGv6Gq56+IDEW35BGpMHJ9GjwYal7PRKBChmEsLHhi4AxVVArXanzHFbcqVykVuKN9OO6Cd6LWF6pDO6tNiJXNETm7Q+B24GNCYkdlQ62n9qw3jskYNDvv0t6iqTTd5SpL9XI8d1Nvu/HljHji7AX3hllnF7H+D7GykK+lP+N8yNb72C9RwvENsHsvZH7/Cj94cKJZlFbpqWmxtsf/Nz9ojEV/OqDbf5JuaEjIneOkqBMcB0bi8Rzf0d6Un30AgdJXttXWDjT2cVBh7b/rja9nbIQ0Q3dmxoMrrMpKuq8wBlkRUi/HlRhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekX8LfMlsNgbfuZvlv6ZYIELNe9OsaNGwEaLUYxbkwc=;
 b=nChhww6O+D0GNZxCbzuyhI59jRYynK0zJeahOoSxtUohh0VNyXORl2yFoxlfrzq9t1QhR9povUGKtYcU8WAGIvBvR02iz35y5Ig6NnXgcrK+D9ENBwkHbTOshHiBouhzyFNooNzvfWDaPpetjjhAh9TX9pIC3UI6Jv0neiLwFGntHihLREVmtyaGWBEMoxMX0BSKmhLfpw09QjweUeL0BK75To9QMiJ0xEifg+vBXRBiDgZrSmrUvpknusEL0k3Mdq/1BoNqqE0R7rYZ7PBw54OrjVaFEAH6OQaBBHxZ6J3hNpZvJQHgihOKCdnEzRAr9fMycyt1P1BEy13CSROWBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekX8LfMlsNgbfuZvlv6ZYIELNe9OsaNGwEaLUYxbkwc=;
 b=n0xHpAXNUyQ3GLV7eUriod5VEsAEdhFJjLhSeHN8Z/NccsAG7Rl8t3DMh/h2slgD11TJOvmXPlFeqBZBF5vvfHY5PdAB9jnleMisvqoqsawAVDc6vtzC8duW+xWRivS5kVEHHu78ToEmYDvUlMie19b9k6IxMMKWEUPa8O/Cjr3hzmOqooGsaGw9vvzWg0x+zCJsJ0oqd07U4W2Ee8DHhH6DZjzfyN+D8FsU4vNMheJ/bRHETTOksz7PVTk4ShPDmfWEsljKD/SEeI3PPPICV2IYv8rMZKxK9gFZfV/ZlelSU7HMyzQ2sTCbj0xkoZBLIr5ueal2DZAOql32hJ1z1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYSPR06MB7007.apcprd06.prod.outlook.com (2603:1096:405:30::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.25; Wed, 9 Jul 2025 04:24:28 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8880.024; Wed, 9 Jul 2025
 04:24:28 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: wsa+renesas@sang-engineering.com,
	Jonathan.Cameron@huawei.com,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH v4] i2c: busses: Use min() to improve code
Date: Wed,  9 Jul 2025 12:23:46 +0800
Message-Id: <20250709042347.550993-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0207.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::20) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYSPR06MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: 665d8712-ac0f-459c-6949-08ddbea07e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kQSy0NuAPDkHurWwmDX0dv8BinalL9QVYmj6k8uaiLXB9ppq3hRM479uzDob?=
 =?us-ascii?Q?EXs8aVGl7mKZqKUWUZW6qXzFc0DP74NYFpjsArTwVfLJZlNtsu1BfG0qKwWY?=
 =?us-ascii?Q?jgb/cjXbVh61OCPOIqJe4kJHLuyUzMpN39y1J8Qjgk1n3wJOWX6/v4Z18dmA?=
 =?us-ascii?Q?ik40d/QWoOL9vhn7XAGxVheBr+cFnyycHqZocCiZIr7kuUcEqncAfGUgKuSe?=
 =?us-ascii?Q?A3a41KZCfin95CP9XgE77SLIZzPxX7vJOKPIpv51tgQcyYoWE3taJpNjp+Bc?=
 =?us-ascii?Q?ryYKPIMMSZSqSRc0NqsI8I8B/7CKnDk+6entpPL6S6fUcIMvbKOlAOgE547i?=
 =?us-ascii?Q?GqfdNyvR6LR7vd3XZheZfwS656blmiwyLWhgXtsA7+OXR/Amztv4yEHhoib5?=
 =?us-ascii?Q?esYYuk+q+R6M2Lidw+jTF1sliLupJ2DWwimX2vOQHtZcCMSRbu04racx/sB+?=
 =?us-ascii?Q?1Ah1eiyoO6qjQxonlvsPGWV8IvUQLiIbc7ZfM8s2K1caFwnYmTiCtS7CD2If?=
 =?us-ascii?Q?dkPWBjcT6w2v7tzNZMz9p1iWOCa9fHbEeD4WnwNGoQqi2zMO1RCYS5ttqwI8?=
 =?us-ascii?Q?8O+XBOi7rE2FKBOzE2HVLMiKb5y63w4lf0A2Z6dRpin+cQCPQynHv+OzZYuj?=
 =?us-ascii?Q?M+Y2LT/llZlYCOq7QzGR9y/6umKUQtBVmUy3Q/mve4DaZyzifsplvVxr5LQ7?=
 =?us-ascii?Q?lab1UXib9jgEh92dZn2NMmthE10MUoPdbjpfTCF0uhJYFe9lbghNwM8N+vKt?=
 =?us-ascii?Q?IUxNFc1NBOwhb0h7PrG/C139OXYtHNa3TIGXwY77F0n/iodTLewi3eq/zZ8N?=
 =?us-ascii?Q?WjXrF8D2ubdNk9U7CLk0rK86Ij8cbs5SGtTsoK27CHcOKg6Tgr34aJTIIGh8?=
 =?us-ascii?Q?wdWJIo4EoHe3zUUwbw3raJtFakSHcwfNzdoIj9yOD2FMSwuhyih1r3VeDHn0?=
 =?us-ascii?Q?E46bAgnMT5VvYalDfYYy0YyCroqsJOABI21nKNlWki1hhF+qI+cjBZ+S8GLT?=
 =?us-ascii?Q?RWayJ8ddzKiF2IB757MoRUwAX7KWjVmxe0nvYpY3sGB14DYWAhnF6mvPtgIw?=
 =?us-ascii?Q?ZrPJDGTBjtiuyCcGhhU/V2iOXC3hr9JuVooXMYBnBvWQrmJ2946vSloAyovw?=
 =?us-ascii?Q?DSj/fGQaG3LUzTv9rK/O/oJ2vNmSy5QmIpP28Ntf93UikxlshabzhWezv5b/?=
 =?us-ascii?Q?szImbgY1lls82Uu5QW6u8qK7sL+Fk/PKBUSnFNkbpogZdKHrf2EGtd4Sv67X?=
 =?us-ascii?Q?zGiJ119XLzH2xWLnLD8kNdKUMyjletulixFoDA6sUfEnitxASFzEyuSIspG8?=
 =?us-ascii?Q?S/2ZxbziJckxXLZEklq16/jx6LhRHTWkLHJrXUI3kB5r6lVUWNmJNHW6ebT2?=
 =?us-ascii?Q?BKQfSkHMP6mSAWSW/Q9q4A+jzaMjaz9lxkZG6A407wC8hORgq6xtx+SEfZhS?=
 =?us-ascii?Q?3AFG870I4DOWPx+Gs3JdKZhWk9GB78Lad05IQIYvE0sXfWKWr1n1Ow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yQNUproeLkj1dKdypdrCfBh/adQMp8gY0Nhp1/6FaLlkTSRf97TAbFen9oYD?=
 =?us-ascii?Q?UrHlp1uiwm3GrlZ4oPnADVi8LALtTZCgcPHYOwwOjbLDXzRSXtbk5gZ7n3Hh?=
 =?us-ascii?Q?5AUcEDm3Vqi9nLdAqf+hpjjPOAl9K7AelIFRFXlcwejWyN6b6cLpY6CukjqU?=
 =?us-ascii?Q?jHYEzp7KQ2OU5CEEICvIYUaWSZbRxFPS8xRY/TLyOnl0Zk4l7ZxaC1QJa+u0?=
 =?us-ascii?Q?HWAwmVFpLZF1C2nR+VDcXSyoVlP9QMWfcBTNSNT1GXjFAn3q7QWKVZTctY2F?=
 =?us-ascii?Q?cNt6FEb30yIcnRyDTwlD911BKcsnUL1rUhHhfndZ7305BRgsby1YO38pZhk+?=
 =?us-ascii?Q?NPGVL/SFNgnR7kmSAtFiUvCydjuDDAF55KAH2mlMGAJC1KP5ERZTf6Jh74vR?=
 =?us-ascii?Q?oAmZG1+meFczFsKBGsH7yi32+6xokiOu1r7Jy+9Y9RMakCae9xxVRhdSfudB?=
 =?us-ascii?Q?KJNPLSqJtQ637IoP/fUIzdA9viLAKIPNH/iOxS9UjhuYJyEQZdbr1yHCPKLu?=
 =?us-ascii?Q?WwMn3wcZlQCg5LX3UOCGNOBAnqU9J12LjAY4pRPu4H6daCKOzSHQqFS80mq3?=
 =?us-ascii?Q?GSnagQMHIy7Ap+2N6aUM7v5sCxaIOV678VyZh2UiHVrnsedMlPiVhg3KJIav?=
 =?us-ascii?Q?e2hpZacn7LFdM0GonKh3ojKZYNi+Au1K3+QAToVDRP61x3yYDkBHt4XH/nON?=
 =?us-ascii?Q?z5Q07499fb8ELqA1PvJNbDCFmWGP5yVhPqMx2cqThOS1mCIZ6t0lvp9gQVsc?=
 =?us-ascii?Q?b0vLqEkUWx4HWugcXRTzGM7MLXpKkvD5VsZXEEsoj/8uQrBGvSGIuUICBBar?=
 =?us-ascii?Q?xsa8sswFwgdimwFd/82I+t7C9CvLMyngiI0Mn8g3siddjtpKXKKxiRRV5XlQ?=
 =?us-ascii?Q?rrA/JY4YahBIVhHB4DsqPCD3kczmLDLsN6c+mojrtAeKz7IXh2W/mtknL1tC?=
 =?us-ascii?Q?UGCJkjrtKBsN+asnpHGoeYiN2+/yzaLp5J0mHtAMQnHv/0g19pi/DTnbSTa3?=
 =?us-ascii?Q?yI78P/al5bPEvpvXcETszacH6Et6z3GqRgql0FzOsKWv+H87Pv6QKX2+fnmh?=
 =?us-ascii?Q?c6RGB4nqvldl3sFgcVqgb+PGdYGa8bWz9wbvZl/0HzS4d97LyU//XvAQrTfJ?=
 =?us-ascii?Q?83VVvMGmxHiJZR/LGGn7MygD+Qss4HWMQTfpfIRO015mt26Qi8lNksKMx3Yg?=
 =?us-ascii?Q?8B8fV4P8000GIu5VbMf0GhgJXV83VKR0guxOCXDv0cEODMKWDF2s72hBhbRx?=
 =?us-ascii?Q?la1OStUT3jK9O7hEKAQopwkFTKJLeAdz0B13IbX37myg06gDuBWAWNwkbm0L?=
 =?us-ascii?Q?Fd8HQsAJ30MDe0s5AXQ4ysGnVsX72Hl11qx12RlJuFdzLno7aI3IA53swy9c?=
 =?us-ascii?Q?uierYlB3wi8R1gT8NyCeEWDLiIsTNcZi5LyP4TuCUaeswuXPqdVSjSasVjFH?=
 =?us-ascii?Q?Z2g0GZZdbqe1E5I+xp9+c4nkOlXCevmX3dShnRuBga4uQLh4k8ij3h6Z/chd?=
 =?us-ascii?Q?SgSRBKPEZkRvb4lgzHwcoDnjHpr09a98zrdcY977XFOgXbBBU/VfWYXWoipp?=
 =?us-ascii?Q?SDnLL4vp6M2k+MtUIniQ2w7Uq8DY2ulcHSEQKHp5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 665d8712-ac0f-459c-6949-08ddbea07e83
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 04:24:28.5010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BpaEE84umlcrzv37fmk39x+RcSiETueFYncA6QfV2byR0thXaDCrP62MNg7kc/F/7TxsYQRsy89dpUyph+nCNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7007

Use min() to reduce the code and improve its readability.

The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
was changed from int to u32, because the max parameter passed
in is always greater than 0.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Suggested-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
v3-> v4:
- Modified code alignment.

v2-> v3:
- added the <linux/minmax.h> as suggested by Jonathan.
- used i = min(...) as the loop initializer according
  to Jonathan.

v1-> v2:
- Change the max parameter type in st_i2c_rd_fill_tx_fifo()
  from int to u32
---
 drivers/i2c/busses/i2c-st.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 750fff3d2389..c86380fb05fb 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/minmax.h>
 
 /* SSC registers */
 #define SSC_BRG				0x000
@@ -422,12 +423,8 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
 	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
 	tx_fstat &= SSC_TX_FSTAT_STATUS;
 
-	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
-		i = c->count;
-	else
-		i = SSC_TXFIFO_SIZE - tx_fstat;
-
-	for (; i > 0; i--, c->count--, c->buf++)
+	for (i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
+	     i > 0; i--, c->count--, c->buf++)
 		st_i2c_write_tx_fifo(i2c_dev, *c->buf);
 }
 
@@ -439,7 +436,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
  * This functions fills the Tx FIFO with fixed pattern when
  * in read mode to trigger clock.
  */
-static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
+static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, u32 max)
 {
 	struct st_i2c_client *c = &i2c_dev->client;
 	u32 tx_fstat, sta;
@@ -452,12 +449,8 @@ static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
 	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
 	tx_fstat &= SSC_TX_FSTAT_STATUS;
 
-	if (max < (SSC_TXFIFO_SIZE - tx_fstat))
-		i = max;
-	else
-		i = SSC_TXFIFO_SIZE - tx_fstat;
-
-	for (; i > 0; i--, c->xfered++)
+	for (i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
+	     i > 0; i--, c->xfered++)
 		st_i2c_write_tx_fifo(i2c_dev, 0xff);
 }
 
-- 
2.34.1


