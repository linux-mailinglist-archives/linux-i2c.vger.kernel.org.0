Return-Path: <linux-i2c+bounces-11849-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43635AF9FDF
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jul 2025 13:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8D631C27359
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jul 2025 11:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF28024A067;
	Sat,  5 Jul 2025 11:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="D1sOlw72"
X-Original-To: linux-i2c@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013026.outbound.protection.outlook.com [40.107.44.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12F0241122;
	Sat,  5 Jul 2025 11:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751715893; cv=fail; b=Jf1R71pHVLVj6TZHMqhYsqNSbqdpK6I0thjXXB1FoeHWYCB0sDAYZa2aKq6LDTQBVsVWm3t4PzBdtpgfP+aL65ft2Ml9DvaxpO21J3m48H0OWI9tu9VuYEUNxknTRUEq8ysey0PM91u3dg0QIIADQG8MpJJM+LkXGmo3YORDgPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751715893; c=relaxed/simple;
	bh=+ylyqTHzo8Lesx0O6kSLaiACh+yjl6oHo3p99tEfuYE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=RvVGNq8HoXNR/9315AtHlRAcwSpA09bKKZMm8zwKKpZDz5cZg4UPyJn39m7dMVHHYrDc+cpd0vGjWogbdZF6L/PWcCX8tC+Fho/O6nw3DQeACXNeQqGTgIDGdrmkhvhQonDsImXOE6y0GhJw8oSMYjHDskDm/KzMnz+xs2khQ7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=D1sOlw72; arc=fail smtp.client-ip=40.107.44.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c5IWSiPDUnGwMFg0MFuZwo0QY7at5nBfz27MKowiYm/5vwQ+Ofup5yjfVItiR705N+GGe4XePFesSJLhMvvMHkOgUBPbkxOg9IY+cieRZQ3MqaRo8BujI5V+t/4ZXM8AbQXShp48uCxchv7yOW5PRdILU8oOlEq7j/nlmzEgXeqavpLdKEcM9KVt2sB+D8DyTcLgvm+zWHdXsxYNfKjgcRIZ8601hoW+BOFtRKuq4u5vesLw04xiebn6YocutYIeVoLnZUcgbZj6sM4QHGSCMv2RK9JwT8vq68fqFsc9lwjChEC27ufoNwzfbNmex27itF86+a+ykSQUTuGGWUisSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=89wyhTIPjN0iT6nxpPAe5tNwZU712dhBB+ITtUGfmxs=;
 b=sViRySvfroH4Nt9F/PmVGcGxIeJ+JusQxrI9pHNqItMvGEqLRk9iIO0NhYyzUCB7cieqnZ5QS9DmK9BZRBH7/uT2SAw0Hd6xQ1o9NCdsfFH1oCzry5Ji1jT7VOb/QZ0qGFCExCP5jdHx74sKF3Ax9r4bHTS4iuxiSlC7W5lZt2jnq4hVdbszTHpBbfLzJwot/+dHn0nLtKkSWh7DgkaMDbG7yTUVWUZ1SM8RPVh4e1W8LiuY3w+c3A4/+6w3wHSoin5e/MFGEkoHDwzsAWlqSAc7tqFMnGmDutXlbvIeqrY+l5JsC+3oa7a7j7GOJj1cwfY/E5mjjjURgBvqx7b+HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89wyhTIPjN0iT6nxpPAe5tNwZU712dhBB+ITtUGfmxs=;
 b=D1sOlw72fVWhSID8QBaDh8JqZaRb2CdLlaVlzZVAcvFxxmNplZIbHreZciEd573MWFq174OiLuF5qFvH8c414QZT0viqQkxcLK1LS4ks1/k3ZLSxQkVW9s5IBZMQckPAusLvDHjiwJgNL2AZ+red072Ckz1uvdgHhTqCOwskSk2LfNiphttWGFJ73/K13n7Dsa/vn/bkVU19DlHrb4ET9XUylSs8NPnr2XYJUnUKLc4MCbSr6BEwJe6oIP66oLVmU8Kze7ZcsiMa6TtoJAJKNhET4q4CtKTbMc5ys4dWmYQj2p9caDdWkYUTWyHQ8WNUPvJp0MSSKmihrMZSy1Y+Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TY0PR06MB5836.apcprd06.prod.outlook.com (2603:1096:400:31f::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.24; Sat, 5 Jul 2025 11:44:46 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.8880.024; Sat, 5 Jul 2025
 11:44:46 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Patrice Chotard <patrice.chotard@foss.st.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH v2] i2c: busses: Use min() to improve code
Date: Sat,  5 Jul 2025 19:44:35 +0800
Message-Id: <20250705114436.579070-1-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TY0PR06MB5836:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b6de9e-569f-4d67-645e-08ddbbb9576b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iu+jtD/r4fUYRUEokoiO7e321TyUXr/mI1iMJophPM/e/aT4lhtqRt50V+YQ?=
 =?us-ascii?Q?ofxD6Wf2yOIVoqJ9EEiKXv8XxBDkn8YmrXRqTxJwMNO+sl12FrQIabsCEt3a?=
 =?us-ascii?Q?E+SPYN9rEGcc3USttg1UIKFDIeJyJtyNgUPNWAQfbZHtly4u3pAL36WfqKfT?=
 =?us-ascii?Q?+RGHkzvdzk06AKo9/jyKEqPjEQsAfenJspMDKg978svT9VziIS9Zzvj4lD3u?=
 =?us-ascii?Q?ZTP+icO5/LXbyF8ja33RLkMmzZpkjauEgGjIgsXRyhOC5r2m0/rriZwQDNeP?=
 =?us-ascii?Q?hB7p8cP2PCxnTAgs9Og+dxxeSSIomSRSZuz/PN6uMHCWVtW0bWHfVnmJfGtc?=
 =?us-ascii?Q?LVZJmeWb3kMZf8UNWVfvp3U89F6dIn+MM0Mjsv/S9F+kLvXrOoC0d7VbIqOR?=
 =?us-ascii?Q?sWnjSzRQauYndf8wmuHrdePl2z6hIWJyXq6yqfqtC36p04P4CYaWBo//JVIF?=
 =?us-ascii?Q?pgUqhAunxKs+/8XF1Sfisl/d1JGt5FtWwcxta+kd7tuJiBejfxH/cXtrv4D4?=
 =?us-ascii?Q?kPmVI24cewbuFpfvgFHMutPMFHUxX1lNZThYSmXN0Jjfal8W69b4m9EI0WUe?=
 =?us-ascii?Q?3Q8Z2lEViwM63UVCfxsvITIWSUsXPcv4ZpZFGaIrKvc6gZvzKwXE06l9dA/s?=
 =?us-ascii?Q?29ofnXTmKiT4EhZLFe7Bj8K2DP2AsO7xuCBSdAgaqzNy0qnBlLiyQcLp7FRG?=
 =?us-ascii?Q?qplifr0I9bxCUpMiGDlSk0vD6/OQtmaOG/5NyoeOtolGuw/U6lzCGwTPizXE?=
 =?us-ascii?Q?1/PrQyf9KdYi6Sts3x7RNggzGUdLHHTpLd6jzl4DK0kiYj7U4quzrwrjI5wo?=
 =?us-ascii?Q?Z6XY4AXk1wwMJExOt3vVHp6yf4WpY3m3QV4/C8w6xMXqqWPTX95KLYw3WPRI?=
 =?us-ascii?Q?Q2DlGnDwU6j5xKPin1VLyybK5Npz11KNsCNlRd7U3P+jBDsyG5M5EckhXdt0?=
 =?us-ascii?Q?25rFXgaIv/xx4QhSCDx7fExosnlvt0wInwPyP9bgCrhqZ126IvxVDWbCdihp?=
 =?us-ascii?Q?aCPmXmWCdPzTS5fHY99PGvUFbaSeIyzKa2cNpn//0UI9GGi8DtUNhHhU2ENV?=
 =?us-ascii?Q?4e6AKaGgT84PrJgdIuF145ahD2TQvzfBQSi+dXWYbWg2kvbQMk0lCNpUNeMv?=
 =?us-ascii?Q?AdeWsXdp7JydJpgLwIBCaYaGdEFmWqPDUSmQGsr5yOkfFVuzpWWRjHmsoFsa?=
 =?us-ascii?Q?uJ8CrPkdIOaGyMKQvel7haDAOS2JcuLy+h4m3bBeRriXHS9Z8I/K//0X6TZA?=
 =?us-ascii?Q?jGq51rJHljKw3cOkmUHdiqu4UgnPtS84384sNAO+bTjns0IGNu/BSiOhqx7G?=
 =?us-ascii?Q?P+NVb99x1HPe9QAFv9Th0e7Md4wNepxSXGHSHOG84+CcKXI8LbIlof3drZ1u?=
 =?us-ascii?Q?YnDKFPMCSyw2saQD+OHZ1K/oMAPoPbFOZgDtiSP/S48z/CEynm9QuprzxjWB?=
 =?us-ascii?Q?rLdtHhl24CekqdzfP1nnpNi/Qcjk0/h21qilqz1NyVoIE20Y0STYlQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?exKmH3qYb40J7yBRhe5iLwKMevMTw1QXMNs7m77O9me+VdR5tjOnFr97Y/lK?=
 =?us-ascii?Q?0gQY1aFgjj985i7ecalfKHW6XOuQTTS9S9g+Jeyuk2RNLn0NlvkXdnBDPMt+?=
 =?us-ascii?Q?RJTzv4nldG/fVI7Nx7XC3hbOYu0rs7uboRYsRFNw7jJnW29AqybU6W3JwwV7?=
 =?us-ascii?Q?gw3zv8q45YTP+vf4Zl7BUWwCOmqOPbhKRbBkW+t89w3RVHrOSlnNpPxXDq+c?=
 =?us-ascii?Q?HRutX4vt1ByoA2tQ6JaKWQcn0miJt86r0YSrXnrNCl6Gnj8tjwNmt7Fjb7wa?=
 =?us-ascii?Q?ZVgffe5dGUO0V5aLqeGmPMP1hvG0bDcBAofpPvTQKdhVl+ri8E0grHN9POMU?=
 =?us-ascii?Q?O6vMzotUeF4TsMnoHBMk06pb5Ru2vjwbxH3Ykmhn1FM1DUWZWlQxLHmKJnhm?=
 =?us-ascii?Q?xJ727CFH9AhN+BC6pKBoiGyhxlp2Bigu3Aa7sAbgigoGZjllChapsy1A2ZMm?=
 =?us-ascii?Q?quuf7bXI2NgzR0C+KFoX/hRvq6X8wiVotuOPwquIunKSoLIMATV5BU/uV611?=
 =?us-ascii?Q?Oe7ysWBp/d2I+yuMRDV7N5gTVCZBu+ZfcPgk9XGqzCQIyOspzbwdorchTw96?=
 =?us-ascii?Q?ZDe6j8EvDIBVKsvdMlsMmMs1QqCjHWnTX4BCnjxtp587Vw6vD7tFGHyS5Hv8?=
 =?us-ascii?Q?gBq6SLMJZYzMkIyAbjwCLWgjeNtN04CW0Q99AwFp3eIjuI2ueVSddNIDwVnU?=
 =?us-ascii?Q?cWHI+h3jIibM9a5KgP7lr/qEgXCs4HdvImxB7dDVZCw6uvGKADy7dpDn2Hwj?=
 =?us-ascii?Q?cP2t4EI5j+rspPAnec5pxfAjUC5kqVYmTQfOYMvKBvte78Q889rQeJPXZdZt?=
 =?us-ascii?Q?jIlUpYNIt+fpPMX6Ojr0S1jT5oHX0Og3mMwkoL2WWUWwS/6cq7sh0AOWbBKx?=
 =?us-ascii?Q?n5nmy0hgbQIHcmgdC9g0PsL9+o91P2EnzsFjJxVIx9MsZmC8WfxbNs5/T0hR?=
 =?us-ascii?Q?yJQLCNBfflXnixPMFEpTq4MpimoVjdv8FFXGKBD5bj3Yn8IR7I27ZIibH7Rf?=
 =?us-ascii?Q?XZcZz++Cn3+3/3862Z1voBc1OllSPXl62Vl6tVUuwmWMnGJM1fcjqKFUl+DD?=
 =?us-ascii?Q?HbRxpd9kdy2GeszQ36TShaCIDxbzzQk5GZdBwWyihuBru9Kpt4uYJk1T9XqO?=
 =?us-ascii?Q?g4aPUcb3Vog7LQfHXk4nLUvHV6gVuDfl9LgI3LimH7TluILST9hSWKAPseqx?=
 =?us-ascii?Q?CvepdruKQXiz0RA7Hkmc20NMlmvFBTlELigwS6bpM8su86KuD7Dkcvb+m8mY?=
 =?us-ascii?Q?FpzUGobLCyhDCnK+w8tELydKIy3Sr9n6FaDbrUMohnsomCkG8U75DIfi1Cit?=
 =?us-ascii?Q?od63v/RkZXSHTPgRj3qpyA4lLbmfJSeuVheBUW7CmhXB77BgZROJWXtUWQXO?=
 =?us-ascii?Q?oW6vcUTMX7xzdDsw1U3RGvcUtJ0uNNkAWpHyUWUMg/TRDm6+mB5g9L3Fl3ne?=
 =?us-ascii?Q?WYHDbhuoTepzMAF/zOimL/NdCYf4W5oleDrIe26j43iJbvnKK2i/EkA1mkIM?=
 =?us-ascii?Q?GEZMBL3EQnehSUfgSjFCC3ALJsNSjrPtc6g78pVt9MmPQQcGZeZwWckfqaFJ?=
 =?us-ascii?Q?wmyqF4PAo/Qa0Idoe0fBDsjrkr7FR0kK1ZmF95At?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b6de9e-569f-4d67-645e-08ddbbb9576b
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2025 11:44:46.8535
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oAnUz5ylRuxfvkrS5C8Hz8iH1WfGLvaBxssjnMX3tKPjdp4dGt+baNlWXNyWHlc8JGHZdcVKXolTjOJ5Se1iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5836

Use min() to reduce the code and improve its readability.

The type of the max parameter in the st_i2c_rd_fill_tx_fifo()
was changed from int to u32, because the max parameter passed
in is always greater than 0.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 drivers/i2c/busses/i2c-st.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 750fff3d2389..285d8a05ab36 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -422,10 +422,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
 	tx_fstat = readl_relaxed(i2c_dev->base + SSC_TX_FSTAT);
 	tx_fstat &= SSC_TX_FSTAT_STATUS;
 
-	if (c->count < (SSC_TXFIFO_SIZE - tx_fstat))
-		i = c->count;
-	else
-		i = SSC_TXFIFO_SIZE - tx_fstat;
+	i = min(c->count, SSC_TXFIFO_SIZE - tx_fstat);
 
 	for (; i > 0; i--, c->count--, c->buf++)
 		st_i2c_write_tx_fifo(i2c_dev, *c->buf);
@@ -439,7 +436,7 @@ static void st_i2c_wr_fill_tx_fifo(struct st_i2c_dev *i2c_dev)
  * This functions fills the Tx FIFO with fixed pattern when
  * in read mode to trigger clock.
  */
-static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
+static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, u32 max)
 {
 	struct st_i2c_client *c = &i2c_dev->client;
 	u32 tx_fstat, sta;
@@ -452,10 +449,7 @@ static void st_i2c_rd_fill_tx_fifo(struct st_i2c_dev *i2c_dev, int max)
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


