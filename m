Return-Path: <linux-i2c+bounces-6541-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA413974FD0
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 12:39:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6448C1F2119B
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 10:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A41184556;
	Wed, 11 Sep 2024 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="JVPeua7X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB388184530;
	Wed, 11 Sep 2024 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726051159; cv=fail; b=urULuJsxzmhYdmvfGpAfW8Dt1gFi08/sL2wMvhSTYwer2U8eJU7DVYxqlDpjl32Sx1GQ+3EB/aXV5FT2iHV3uTz3vzztUtBaCltyM5Mba5GkIIZXfi7GHrUNUoviXABMvpgyXZbYaJB99jPHu3LETkAEJbSNtKc09K9hsGkQUro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726051159; c=relaxed/simple;
	bh=0C++DWVAzA4+fVIVFmVXFGMXYk8GinOuKfn4e7d6FSk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lkhQsFs88Di1R9YMhuIk8jbfQLtAdeERNLDgF9oHLfmu3XM+UzCmyX5QU7xwXo0FHVkTV4kiWhK2C93lJgLzl0pW7iPWgTIlBmHieZ7YRyPfVDLveZUX2/GItHhbCQAK6HwHAWvtF2nq2E6Yg9EVoqC/yRTbHEppF5Ut1WMvpq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=JVPeua7X; arc=fail smtp.client-ip=40.107.236.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EiljSEJSMn8V4qRKI68zrHV3tkFK65Fe0OT5DYCHAN4Y1TLQw9tC4xArR35t6OmSfQVIboqWudzYdNaq5ZgW3gc6wyw9gWLXmsd1dX3ShsaAzlTTdHT8c8kgUdKU1rSE6ji7vkjeVRAPEqKx/M/6Q8ZS/bNG8IYerGlrj/iRxEccChrcv6afCT5UVomxva7TVgSI4Hpgg6Zi1PEOR43GKcBeeaMU2PdySTSfi9XKIE19ABJgafTPwwJHmwEBP2qsWldkaymVodlDQehjzz3YBHgbfAI1e54+47adF7zoS3qxdT8HGQ2qbQN0aLQ/rWUF3YaaxWC13sn4n7KvgTzvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Ukf+VtutPVAcE7udcrkQlQbx8+BPFG6OcYl/NUlMII=;
 b=E5/3H9rrhYEEd0rHrEx5NZP8jsNFTPyrDVWvBNydKnoNU4/N+ngJ68aQyhg8daD3PHMw+ByV9GzgW8OlISUixpV32lcHbQPYySJ8sKzLAfSBfVUO10+j7s5T8kmi3Ko6vMngfulBVk0ud2/fcTUgAltKjFCAmjmqDFaJA6ei1ccdwrJQi+IHqTjOLiMQVJ+kyRzmGVwell7YsVwVwrN80bFT5cxsgTpfb8zsXaGM/vxYvClHSfEG1J/OiK1Vy8/wVc97iYkj1eS4TKHQewvcRVvnOknIGZduCaB7AwPuLtMWqIKibU7HSFp7p0WIBdwzThNEEi66qRgoZMXrCVMCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Ukf+VtutPVAcE7udcrkQlQbx8+BPFG6OcYl/NUlMII=;
 b=JVPeua7X5yKgZThFWDD4+sloG2TfSfSO8hEUJBVZUWo2X+PC8hejLOCiHwdR6ng6ePpxcAWRXB8UMmPzVKLEl7QV+O4oGPukTxUOiSla0vc7ZX+CRYO5a7CUBJtoe9V47eai1dOfScZUuZIS1hW8F+PkqTajZz/pBNcUVbyHDQI=
Received: from BYAPR06CA0008.namprd06.prod.outlook.com (2603:10b6:a03:d4::21)
 by PH7PR12MB5903.namprd12.prod.outlook.com (2603:10b6:510:1d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.20; Wed, 11 Sep
 2024 10:39:11 +0000
Received: from SJ1PEPF00002326.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::c3) by BYAPR06CA0008.outlook.office365.com
 (2603:10b6:a03:d4::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 10:39:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002326.mail.protection.outlook.com (10.167.242.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 10:39:10 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 05:39:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 05:39:08 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Sep 2024 05:39:05 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <michal.simek@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <radhey.shyam.pandey@amd.com>, <srinivas.goud@amd.com>,
	<shubhrajyoti.datta@amd.com>, <manion05gk@gmail.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>
Subject: [PATCH V2 2/3] i2c: cadence: Split cdns_i2c_master_xfer for Atomic Mode
Date: Wed, 11 Sep 2024 16:08:51 +0530
Message-ID: <20240911103852.162234-3-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240911103852.162234-1-manikanta.guntupalli@amd.com>
References: <20240911103852.162234-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002326:EE_|PH7PR12MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fd177c0-60d2-4fad-8410-08dcd24df8e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HsgObyjki6O1K5lJqUslvZB0/GpVnkXhV/AwtIneRswqo4NAa31BnIvN+1st?=
 =?us-ascii?Q?5eCUXDxnhGqylfHo7gMwdT9jjxYgbhuemoWL2xmdkW/ud1CLW5NWMOUR1zvX?=
 =?us-ascii?Q?Dd1QtM9XQ6BnsxKjdKdFVGZd8EAPoLJv7btx1/YyA5cdh6vr5hJ/7sJFTzF3?=
 =?us-ascii?Q?1hVDXrlGvSOfAaDx+YD8hdrHdATt1m6Cqylbkzs42P84rkTZBnQvg/Z74GR6?=
 =?us-ascii?Q?i03/Kn80xtiMdg4BV7GZ6SC6IVkKkDC9GeNMYdAeLmm5pu4cHhHNn+UxkndH?=
 =?us-ascii?Q?VZQygq6+99sNo/glLF6tcTPx9NRlpCM1u+W6T/QLp3RRXtHYQt8BwAH5iLdt?=
 =?us-ascii?Q?2uKpITj7l/bWxgVtt0M7++8sKL8Q/ZZag5w3lPAfk8oWniPqyHtKKGf4m+kv?=
 =?us-ascii?Q?8thuREpW3DPJfs5lX0/qKp/d7drDZgCLtrxfyU94irnAiUm591ONI42OkkBY?=
 =?us-ascii?Q?5WFLvjU+DsSBPmS4+pD5FkMGi4e6CIWmvr+z3kOb9+nbnag0GaXoh35nKVv0?=
 =?us-ascii?Q?VLpwVY77MpUV/qRRpyMxxdZIyZeLlGO66EHokyKQzYBbH1e3gybGe6ZBhayt?=
 =?us-ascii?Q?Y0qUjLBO4OCIq+ND7/K9ovE+rAtlCSDffdbvPydN2O7Sb7dvkSCco2vXHkX9?=
 =?us-ascii?Q?xnAkM8lBTBUsnQazOVeXpdrsyREg8fg6wfQvWFPlW2HpO8TnOVRPMR5uGcgn?=
 =?us-ascii?Q?wjoSXHOHpwZ17Exo7+d+Y0iGTiNw2Zo9KcKIqAZpWV74JW8Q3LKwZBEmkz38?=
 =?us-ascii?Q?M7HID+f91xwAtWnXjBW8yFa44N+fWSw9mVDkEK9ZgZr/j4A31heahUE+kUal?=
 =?us-ascii?Q?tDusZiC41TEoG4ooxkuqst585boErgh8bA75zKrll92Y99C0wRGcHSibvKET?=
 =?us-ascii?Q?9lk13ZOU0BOfixGBAnT7iuZSAfK6W6reX0ZO/0yoaeM06e9tJoGl+rhN3J7Q?=
 =?us-ascii?Q?MbeoU4RlPVvz6q5Xhy1XfKz0kclUWVukVFXJoSNrQGXalCdYJCM2gCO3V08g?=
 =?us-ascii?Q?RyHL9f6vM1Z3pmNrKmRwtmNcKtFqhraxQhIROO8u1U983YqphJNXVXXggwol?=
 =?us-ascii?Q?DD0TJHR7VJJ0rdQrBgp6KJRbaDQxPHJxrSD/3Xy091j7f3gUn9YU2BwYx5aj?=
 =?us-ascii?Q?j39IbjTF/h8OwlGiu1+8Ygi6dzTPvHRnSP6ATrhc9TsydCrTrO6P99jGfE6B?=
 =?us-ascii?Q?3NOK1Fe/NeuBJEKPfbk+3cv4nr3r/SA1KxSjVHOsbC1zM2PCUl3iW1JEdv6W?=
 =?us-ascii?Q?ZD9iMGH7CO/bPgXu3WfcdVB+dxwpaDJXWckR4KhA39prim7t5dJmEsyfZPHQ?=
 =?us-ascii?Q?7yCPZuW4OHKJ4ev2fCobmg02RVViy3l9tO+tCpdit1hmt+EP8Pzm90RILiL7?=
 =?us-ascii?Q?AX7qhg3EAQ7I+8QLt79qsvTc4nJ4qvRVodxiq5shBqTzmwfN5+7atmoyKmKJ?=
 =?us-ascii?Q?HJt73JwyG28c7e8OiPFk2hvWiJeFMprw?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 10:39:10.7827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fd177c0-60d2-4fad-8410-08dcd24df8e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002326.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5903

The cdns_i2c_master_xfer function has been refactored to separate
the common code. This change facilitates better support for atomic
mode operations by isolating the shared logic.

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
---
Changes for V2:
Added review signature.
---
 drivers/i2c/busses/i2c-cadence.c | 100 ++++++++++++++++---------------
 1 file changed, 53 insertions(+), 47 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index d3f6ca2cb4d7..e689448d229f 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -866,46 +866,14 @@ static int cdns_i2c_process_msg(struct cdns_i2c *id, struct i2c_msg *msg,
 	return 0;
 }
 
-/**
- * cdns_i2c_master_xfer - The main i2c transfer function
- * @adap:	pointer to the i2c adapter driver instance
- * @msgs:	pointer to the i2c message structure
- * @num:	the number of messages to transfer
- *
- * Initiates the send/recv activity based on the transfer message received.
- *
- * Return: number of msgs processed on success, negative error otherwise
- */
-static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
-				int num)
+static int cdns_i2c_master_common_xfer(struct i2c_adapter *adap,
+				       struct i2c_msg *msgs,
+				       int num)
 {
 	int ret, count;
 	u32 reg;
 	struct cdns_i2c *id = adap->algo_data;
 	bool hold_quirk;
-#if IS_ENABLED(CONFIG_I2C_SLAVE)
-	bool change_role = false;
-#endif
-
-	ret = pm_runtime_resume_and_get(id->dev);
-	if (ret < 0)
-		return ret;
-
-#if IS_ENABLED(CONFIG_I2C_SLAVE)
-	/* Check i2c operating mode and switch if possible */
-	if (id->dev_mode == CDNS_I2C_MODE_SLAVE) {
-		if (id->slave_state != CDNS_I2C_SLAVE_STATE_IDLE) {
-			ret = -EAGAIN;
-			goto out;
-		}
-
-		/* Set mode to master */
-		cdns_i2c_set_mode(CDNS_I2C_MODE_MASTER, id);
-
-		/* Mark flag to change role once xfer is completed */
-		change_role = true;
-	}
-#endif
 
 	/* Check if the bus is free */
 
@@ -917,7 +885,7 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		ret = -EAGAIN;
 		if (id->adap.bus_recovery_info)
 			i2c_recover_bus(adap);
-		goto out;
+		return ret;
 	}
 
 	hold_quirk = !!(id->quirks & CDNS_I2C_BROKEN_HOLD_BIT);
@@ -937,8 +905,7 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			if (msgs[count].flags & I2C_M_RD) {
 				dev_warn(adap->dev.parent,
 					 "Can't do repeated start after a receive message\n");
-				ret = -EOPNOTSUPP;
-				goto out;
+				return -EOPNOTSUPP;
 			}
 		}
 		id->bus_hold_flag = 1;
@@ -956,26 +923,65 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 
 		ret = cdns_i2c_process_msg(id, msgs, adap);
 		if (ret)
-			goto out;
+			return ret;
 
 		/* Report the other error interrupts to application */
 		if (id->err_status) {
 			cdns_i2c_master_reset(adap);
 
-			if (id->err_status & CDNS_I2C_IXR_NACK) {
-				ret = -ENXIO;
-				goto out;
-			}
-			ret = -EIO;
-			goto out;
+			if (id->err_status & CDNS_I2C_IXR_NACK)
+				return -ENXIO;
+
+			return -EIO;
 		}
 	}
+	return 0;
+}
 
-	ret = num;
+/**
+ * cdns_i2c_master_xfer - The main i2c transfer function
+ * @adap:	pointer to the i2c adapter driver instance
+ * @msgs:	pointer to the i2c message structure
+ * @num:	the number of messages to transfer
+ *
+ * Initiates the send/recv activity based on the transfer message received.
+ *
+ * Return: number of msgs processed on success, negative error otherwise
+ */
+static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
+				int num)
+{
+	int ret;
+	struct cdns_i2c *id = adap->algo_data;
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	bool change_role = false;
+#endif
 
-out:
+	ret = pm_runtime_resume_and_get(id->dev);
+	if (ret < 0)
+		return ret;
+
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	/* Check i2c operating mode and switch if possible */
+	if (id->dev_mode == CDNS_I2C_MODE_SLAVE) {
+		if (id->slave_state != CDNS_I2C_SLAVE_STATE_IDLE) {
+			ret = -EAGAIN;
+			goto out;
+		}
+
+		/* Set mode to master */
+		cdns_i2c_set_mode(CDNS_I2C_MODE_MASTER, id);
+
+		/* Mark flag to change role once xfer is completed */
+		change_role = true;
+	}
+#endif
 
+	ret = cdns_i2c_master_common_xfer(adap, msgs, num);
+	if (!ret)
+		ret = num;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
+out:
 	/* Switch i2c mode to slave */
 	if (change_role)
 		cdns_i2c_set_mode(CDNS_I2C_MODE_SLAVE, id);
-- 
2.25.1


