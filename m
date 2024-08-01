Return-Path: <linux-i2c+bounces-5097-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 460339448BB
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 11:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF996B23A23
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2024 09:45:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5F7171092;
	Thu,  1 Aug 2024 09:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cI6yDrIl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2059.outbound.protection.outlook.com [40.107.100.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CF4183CA3;
	Thu,  1 Aug 2024 09:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722505479; cv=fail; b=PdYF8dS+ijQKXI3gB/oUJu4T1GObwpnu8pas8MYR+qKu0D5czp211RU8hUtnzUSShtXJHY9VQFEfSFYmdqKftpF2rPXB6b2mumAfkmekGU8hMnNpnqzHEQXwL94RjZT4ZbC/HUkkTGqS20fRvlqlusDI5H9hDd5asi4Cx15/EKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722505479; c=relaxed/simple;
	bh=7b9xJoBiY0h4Dvq++h2robEBkXxJO1Tatab0O4b/ygs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WROGBY2auL6niWmPt/5yi12QyygYf23qIUcwbne0ugugWY0oERcRYXvSd9SNkbwqElF59GU+9UbitLKU1KzbnJzGMrpJpisNt3zm8s6nFjv9UhexGO2NjopJ/ReMjCVJS+ai+jpe3tdymmHPOiNzuX2t3FmeqcqcyW3UMvn81QQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cI6yDrIl; arc=fail smtp.client-ip=40.107.100.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfaRa9Fc7Nvul1NqzU93SmJ2jLBB+Wdo9MGthfx++o6DfthRUt45oPK4WXoFh0EM7K+2RoYodlTvDAG7aNPUlCi8ZbzMsl+gUzkSXN8tbip9cezNJznEgg3tg+JlV6JOFPRg/lk2qr5bgBMLk6TKbhGwy/4w0f1wT/HcwjEKLNsZF1PFf3EnskbND5yu1SGSWMP2qQ9ZAo8mRIw8KKhi8vMob/eHuEeF7NxTC+votv3gbOUrZTOz5SZxsbSF71psYjRAXuOvyqlmGpScysLpC6iRUq5ALFoIsuzwdLGkhWzP31i3iU8tepztMHi+DFFWokILD4n27rTrzGft5qor4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jvNWgj4HYDN+r4/iIpSW8c5iCRjU4wr2TN7Dx7RrDj8=;
 b=myZ4/W1dEpS51obrGpZEq00sZM134DcImzifGpW3eV3PRCbgUaMHiCnyI8ulgMD4GkdsLpSpiPHzDjxIVVI12Y9GSSrdUTHuz2UgKwbTsXCtNyk9OxyXoiq+B98+clh0O01muuHa4JSJUHjYnwOpBWJv/wKPRqTnclfe4mMepW1NyGUZ0KNF4Qo1wdt6cbmpewfVPGY8ENf16XxLTrAe2o5lJxZMi+fIk0k/2tMj4dqXawb6IAHE/tWn4kUBYLP51fjFTK2IrD/98Gw8IKEgzPxSPWyig0tm8q0eLzLzpIcglsThO9znoa56JefQblGeB3C9q7k6hF3JxxksLkjdmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jvNWgj4HYDN+r4/iIpSW8c5iCRjU4wr2TN7Dx7RrDj8=;
 b=cI6yDrIlvojOJDciSEzB84q/MT8SfGUKOw5jHz3VeJgdGDNswgLqtY/uWesDcTSVJFZrX9lX1hp84vup8WVSAHIFQIbpHb9j+EDsCMZLxiTJ3mCTbxR3bXbjGxUoGFQ4ZFlnnxkBWj8feND9D+BeUwUGrkLEqLH6YkqfwWTgUb0=
Received: from DM5PR07CA0097.namprd07.prod.outlook.com (2603:10b6:4:ae::26) by
 CY8PR12MB8363.namprd12.prod.outlook.com (2603:10b6:930:7a::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Thu, 1 Aug 2024 09:44:35 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::2e) by DM5PR07CA0097.outlook.office365.com
 (2603:10b6:4:ae::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 09:44:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:44:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:44:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:44:33 -0500
Received: from xhdsneeli40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 1 Aug 2024 04:44:30 -0500
From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
To: <git@amd.com>, <andi.shyti@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <michal.simek@amd.com>, <radhey.shyam.pandey@amd.com>,
	<srinivas.goud@amd.com>, <shubhrajyoti.datta@amd.com>,
	<manion05gk@gmail.com>, Manikanta Guntupalli <manikanta.guntupalli@amd.com>
Subject: [PATCH 2/3] i2c: cadence: Split cdns_i2c_master_xfer for Atomic Mode
Date: Thu, 1 Aug 2024 15:14:07 +0530
Message-ID: <20240801094408.2004460-3-manikanta.guntupalli@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
References: <20240801094408.2004460-1-manikanta.guntupalli@amd.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: manikanta.guntupalli@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|CY8PR12MB8363:EE_
X-MS-Office365-Filtering-Correlation-Id: 6faf14fd-08ad-4ff7-79d6-08dcb20e8d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?D1wFvT5ZmMfKvxmYv+YGPOUtXSwYNLgdgHRqeMzw3BPN1Z0Gw/0ocl7RY0g8?=
 =?us-ascii?Q?Q2xPmh6sHPJ5Oiv3fdeg61nDUBv0l9zs3+U19blipKHyfwSG2qb9tjtcn2sl?=
 =?us-ascii?Q?MgQfAudothnMKRdm1zk271mtzlmfC9NZrGxuCFuuDOLTrvYiKR4KQai/nB3W?=
 =?us-ascii?Q?SFozZndNimAAjge6DjYR7PAWk+iPI50/ondMF1zNegnkWkkpyf7rL35h9ZMF?=
 =?us-ascii?Q?AabxId9MYc5kMb0J2ArFgPEDZqqZZHRoKcHpqXGS0Bb9v1DMqt3rmfeiSvP4?=
 =?us-ascii?Q?VHhuBIf0aOaEvNSUcrGVgal5xkW0QFQNaSQqjfkZRbMdpXKF/vM4LSQK5pTL?=
 =?us-ascii?Q?BWhJrn1RWROy/JqTLbtahK/TpUA3fMfWpP+mgG+zMOWSbffQz7h/nXsz/6hG?=
 =?us-ascii?Q?wnHHEfz8nqFlZmLEqLayW5+Tf2m4m0JWH0/UixEFTOYBvnxYmPQhyCZJ+hzV?=
 =?us-ascii?Q?imOpnbKvz5At6zJaYbt+WiijIa31zWOCtx3nz1m249GMfD4ryvz+k1VQFCvi?=
 =?us-ascii?Q?vmE31/E9Xs9NTvWkcA1k8JBLY7eCpm5VNDRp/bKkAc3qntzzn3BLQvGaorpf?=
 =?us-ascii?Q?N+LlbhqsraMqY1cvw1eWyBLfyrwYZnUkB6WznhtkgYO4MacyvmpmxdKtZZvp?=
 =?us-ascii?Q?MEdnve9J5gZXxdZXHGlLIJO8pXTZ6dswjsEVLvsBOs2BkrYXGfa5jgV0SOKs?=
 =?us-ascii?Q?uIf82nuOTvvGUjc7KoL/+2gbYGriP39hG7xShjtVj9m78AcR0JKqgG7Afio+?=
 =?us-ascii?Q?99r9VjOK1LWkMhOFUxJKpLBnwsspsI5oRv8Ds/gmsuXZG1r8dcqrPuXWE7kn?=
 =?us-ascii?Q?kHW4KRFYmcgRwPjG9HycrtBFNfKhaeTmTH0x3n/RE/IB4XkIFNxfWZGgOEYQ?=
 =?us-ascii?Q?x+o882odmlg2dhzqUbFL0GiHbPOX9GtlA4MYkvOuS1MiJbJdFG5CwXj/YiQk?=
 =?us-ascii?Q?W/3+3Jl7QgzUcwVCL8moPp03hvYzYxVNgWrE5JjSrw0M4Ujdbok2RQs1vjQY?=
 =?us-ascii?Q?CEcCENrJkc5E1y6zc6umVNXBOJFoqxc37cSubI9KsI/av8QnbuIxCKrGQMHT?=
 =?us-ascii?Q?dlImeQjWGymoRWYS4xGS55Mxu9mQworEU7aQpji8+5XNLvOThw6pW1uMeZ9j?=
 =?us-ascii?Q?nDTXFl7pnmQQYdPwIuIgKx9VJ5u5JG6gJu36cVriZ8f8g0iXd5309mw6Oek+?=
 =?us-ascii?Q?Z3z0Ad4e1rMKYRyUosMJxECkLNJ9Mhz2UjRcL9VMT1rQcRONSxoZjzMuxsyI?=
 =?us-ascii?Q?sH0LSddPHpUbpovbZo9DE4GiZQE1STU0cTqPM+rGdA4ZAn8ePvTBxGlBJXtX?=
 =?us-ascii?Q?LwYGecRfr+McaJgRLkmFLqaThAXjsxkJLmrotveKlf64rDVdoT1/Ghk5GotU?=
 =?us-ascii?Q?c8uVPGjmI2cuLxwkA1/AGHgKXgeg1tlewzTCcW7koCZ79PFwsk9VStRmcgz2?=
 =?us-ascii?Q?qasUlOJyACZ9hMa++Z2Yuc6h+Toxmcuq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:44:35.0329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6faf14fd-08ad-4ff7-79d6-08dcb20e8d67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8363

The cdns_i2c_master_xfer function has been refactored to separate
the common code. This change facilitates better support for atomic
mode operations by isolating the shared logic.

Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
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


