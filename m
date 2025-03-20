Return-Path: <linux-i2c+bounces-9936-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC594A69FC6
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 07:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72194888327
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 06:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68A6E1E2611;
	Thu, 20 Mar 2025 06:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q2S6lxFQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C11D15A8;
	Thu, 20 Mar 2025 06:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742451999; cv=fail; b=DBmGPvr7E1IkHAK4BMLrmfQb2XHh9TscWVw7t5WVSNJBjIXadU+vhIWoYN6tThYYgzTm0psoJtAI4sFNwueug7sh3/0Y+ccdUiSdFIy/jgYBj7dXE+WznFFSlMIMM4HgElMHcvh17B/BH89yb4ctC4aah9jJpbfaF5oPuMp7WOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742451999; c=relaxed/simple;
	bh=j2DPZ7LmLjkWFFZeqRfUHg/q7ZtEbTk+RGMyPVuxhLE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qRWgRshWj0rGL+3KuGQ254lgmzLGBoPXxk8y7NIZziTax2cSAf3FD96fDP3vo0VAnzsISUmyykvy8yAPGuGbefHE6NNsoSdB7OlfJqT4zE8qcq5AHe4y3PcOpIlw2sKVCIsMPNg54DOu4EXmFuf4UFWTcim9lQSafCMsqFjKlTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q2S6lxFQ; arc=fail smtp.client-ip=40.107.92.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1bnzpoR+4INVo3Ltm6l4iQA8QR4Uh3+cEewe3J6xIKpLvATGBfly9SarYP8mVXfbcOZwFSUceyx5L21ofd0sIzlRBufvb9looC6BakEIKbDIddkOXthadNSS6zVz99pOrEjYTm6KWa6VSUGEYMGY2YZcWUGD+e9uSYyCxNdxlGA2GmLgC1ywVebGTh8LB47Jv7j+Nj087Q41OoqCmycfxQaYzatfhIkWKaZ1G0MxcwyZnx+RV1g7CGLpuHAYRRA69dGR1VOYytHfY/aPtY2JLS7VioPedtD4eoSjOiGt+bR+tFN+Jebwzs6DRQ6L6cID8ikD37e8kYrFmt5KS/rGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4wpHxfa4y/D45/Oy/iRcAD2Hhv96CKq8oc7JcyCiUvM=;
 b=U/ekUUl1HneMo8WjfBmr3UH1VgcqelNmj/pd5drrcui4E6zqf+0+9VvGL0nuANNEnX0NO+TX3WJNRFT6pEtXWX1EErPzANbZojy3LcrqVqevXEXsnc29TDDAvHK/F6Itmcg5ey94wBqmrt8w6kOjrRpf0vhhEtgz+xhwC+/SdIP3081FyZDUOJTZ8PwQcJ3fxUFQBhpULaM/4sGDk+Of8JSR6d12FoQNkMyJRWzlYlty9UZoT9oSHn2UfWCY5+lvxOVmJLxlxuN/nLPuc1Ve3xtwlZEkga+ldTn8GKdMWV6XVgtleh3zgbw4/At5qZYvy/qA+rwKi80k/4l43mxVUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wpHxfa4y/D45/Oy/iRcAD2Hhv96CKq8oc7JcyCiUvM=;
 b=q2S6lxFQ40bKgaW+GQC17ORYVuea8fqXvoANyQWmdfReFTEaTPl8l4lDJun7cjs17biU8ktjn+nEov4r1NvQTIJjNAkgmW9HfaomdlFoI11PfxUJbWyqJ51TGib9vujQy3OcAWZJoYAHPWkC1kj3QxJa/px1bZ1Pt8Yjgnoq658LlofNEC8RNlTEAz//jc6ZAJCCGagCjxHyRtRr/Cmg704U087f8KB8t7GgrSSdlO54vonN8PzYkqfGHivNHGLZFa2/yKq697XUC60IdBk/h8H78LSaxZIqUzOMiWuheFt0vQV532zlPHbdfDJvLtKTP20z2KjZ51hloThvwZi4Cg==
Received: from MN2PR16CA0029.namprd16.prod.outlook.com (2603:10b6:208:134::42)
 by BL3PR12MB6548.namprd12.prod.outlook.com (2603:10b6:208:38f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 06:26:32 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::88) by MN2PR16CA0029.outlook.office365.com
 (2603:10b6:208:134::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 06:26:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.20 via Frontend Transport; Thu, 20 Mar 2025 06:26:32 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 19 Mar
 2025 23:26:21 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Wed, 19 Mar
 2025 23:26:20 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.1544.14 via Frontend
 Transport; Wed, 19 Mar 2025 23:26:17 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <ldewangan@nvidia.com>, <digetx@gmail.com>, <andi.shyti@kernel.org>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>, <wsa@kernel.org>,
	<linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH] i2c: tegra: Return if SMBUS message length is zero
Date: Thu, 20 Mar 2025 11:52:01 +0530
Message-ID: <20250320062201.54070-1-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|BL3PR12MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e220ae1-b71b-4b4d-629f-08dd6778287a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T0at1VApatSL8+dwb1RfVKfRfwtoLDva1hDV7URLtqGXagKQekQ+j/1OAw+3?=
 =?us-ascii?Q?EMr2T/3DGL5WUla843ICmts3vXGq1D6/6/ibYxyRLVsVZ4DxfxZdpWq3mk9Q?=
 =?us-ascii?Q?uQ9CsFum9Uv7TLgRv3v727ppYWqUfcXgJIkpPY84H+3QiKRH98WlT4yGXv/a?=
 =?us-ascii?Q?/TGHvdQtWicXwV5YePXNoSmg1h8UPion4VOp4aNjJyOZGzq7EvYDrpgxXPp0?=
 =?us-ascii?Q?mwVQGOIGuvlTx6gLHvvypvfiKXO0FFVdO8NvpYUfEwOKX0CVj0KMjis9qB1o?=
 =?us-ascii?Q?ncRXeGllu/ejmcX6VTxK44uPovClfsFSR2rmXeRwgowjFKjCeTKo2z6L2M0P?=
 =?us-ascii?Q?C2RLERB9i/5MuQjGSyINfts0gKZUcqDBFrHFw6hIBQ6nmsecGlWjmYcSS2/Y?=
 =?us-ascii?Q?QdU1EM0IjstM83/hYB9oasfC3+rcMPVOgUMo7w0HJ0jyx7ei1xB+vIJFxkPR?=
 =?us-ascii?Q?TT2wbnG8DPt1OPuV4U1MR92h7h/2PQSYHz/rOdmbRdyMAsbuootYIT1VKULi?=
 =?us-ascii?Q?AgttTdOUKDdKotb0N8ZEdD+G20F534GkmalcOdkr6ifwsSrNn7j9ve0U+/iB?=
 =?us-ascii?Q?8yaSiWOjwAJ2qufpZ9iO+4cbUeYCO2vh+KPiaEGPr0Z2xQY18uidzoZR65/h?=
 =?us-ascii?Q?frrgvql7mMLNO0HxwrSjFec7sRxk6QbY622sR7ddgbUhGxtStrlVD3yhCDBe?=
 =?us-ascii?Q?uwENEPW6Ust3cl83WdNafmitC8TMXUdu/DTNfyKW/TFWkhb/5M9zYA2ABCr4?=
 =?us-ascii?Q?Ba53PKcZYItHpFLRo2Ts3T5jF+SvIq0VWyQdsDVVhkUELm59f3+0J86+Ti3G?=
 =?us-ascii?Q?jaYqLnNDGunam7SmOv42GfYQordtJMMKqBolTAxFFFGenmd74sNYfalL09hw?=
 =?us-ascii?Q?V89TXGWEKFYhdky5eGmTZpxkqV0B2D3FnLLaoMVN60LQ+0JvB8rqGz4IWjMi?=
 =?us-ascii?Q?0Ok2HE2dt5kluBn5k09AuGo32nkoFx/WvjsclC6Ah6syUeE46jy1zZfx6cFp?=
 =?us-ascii?Q?dfQfomlwSENp4qYoUHIWYScV6O8aRtOHUIIB5QcLw4I+jmAqskqOVHFGNkn4?=
 =?us-ascii?Q?wfAYnRF17QUj6q8cq5zJx5xPPsr+0Ko/yy21IVmwYWyw9d3yalCMMvx/+wsw?=
 =?us-ascii?Q?kx139gdRiR9gcsJWv1BJ1qRqPkl2aGJVMQ3g2GxoraTUHnC9IIYYbxRQRfmN?=
 =?us-ascii?Q?E7A8p38+trY0+dz/3X1IINfI19b+HzlKkrsRkcLHIoA3gGHq7wCnkcXtF+ES?=
 =?us-ascii?Q?DZcAg6HiRSNdzqsnBL+pBmGjQfH5/k2VZyZOZgSM3e5QlluLLEL3cHMgJR6A?=
 =?us-ascii?Q?NHwO1F4dQ+G5n5gUWHIxSz4LiIDp356rKlVdq72SgVZ+p5zUX+hnAohsFvSN?=
 =?us-ascii?Q?JKUBUmadDh3tfbOidlRKNRF3kVXkXgGsBXdCC57jtcWM0VPp59eCZ6W4AO3s?=
 =?us-ascii?Q?Hk0yYkocN+PIjNcr1GMf7/zWAdeL7HdYye66gTIQnqjqxIxpyhYy9Ks5NVv0?=
 =?us-ascii?Q?8a8ZTsP6blfOCK0=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 06:26:32.7136
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e220ae1-b71b-4b4d-629f-08dd6778287a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6548

For SMBUS block read, do not continue to read if the message length
passed from the device is '0'.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 drivers/i2c/busses/i2c-tegra.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 87976e99e6d0..273d6aaa427b 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1393,7 +1393,7 @@ static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
 		/* If M_RECV_LEN use ContinueXfer to read the first byte */
 		if (msgs[i].flags & I2C_M_RECV_LEN) {
 			ret = tegra_i2c_xfer_msg(i2c_dev, &msgs[i], MSG_END_CONTINUE);
-			if (ret)
+			if (ret || msgs[i].buf[0] == 0)
 				break;
 			/* Set the msg length from first byte */
 			msgs[i].len += msgs[i].buf[0];
-- 
2.43.2


