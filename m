Return-Path: <linux-i2c+bounces-10281-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 411C0A86C5D
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 12:10:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94D6A19E7B7D
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 10:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62DF81AB530;
	Sat, 12 Apr 2025 10:10:05 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E99D192D77;
	Sat, 12 Apr 2025 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744452605; cv=fail; b=K8zKG0Rv6yXAWErZed/rq/AMn9GobeB+Wm6KLyMxRtIrrri9fpC41OS5NYrwY1NoVptP+/wGnwj3SPCh0U3na/lQMUEsnf60uGTxw5A3pa3usO6cVVzqgKly7ciT9hDFtvIzyERs3z/gaO8YJ3uF8GxjZnSrLHvNzh126E9ipl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744452605; c=relaxed/simple;
	bh=D6i+4xtnjenbRjnKP4FmC6fVdWuWUYhm49OxVzeXpFU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ElLAMsoURFiVXFjW7k/M8mpzL8Cj07XodBJMI3H+z3FrKKmNEr4ZUXKSkGuqbCV1m/lLz097wt8ITAtkWA3wjy+lterfOaLZ44aB6z8NhbgNKRxr8UymuzWeQDqMl6C2bhanIKAEIjSkK43wEAq3GqrsA7znxKbFlmBr6Mm00jw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Es4e4vkLbuJbwIuLWjTP3IsV8kYjt+zemc2gruRS1lyA7TdLrllCPmDRvu9q4WELEi9CphqgUVFPDVaYnv0tQXOggILAp0SUnEfsHOxPORBz0sIui+fJYsdMTSu/j7WHjCeJQ0P2ji1NZ4APbwJpvqled8nPNQQnh+BMIKXYDvhNI5/T6b7L72zi2pHBpCU608AzSIn/FQM8/9zFXUVd49IQEZNgJUTTzPbIK/oniSMprqscjcwoqGrwaTg8OVByQ+4Fq8jwwZib36TwVl7GFrwkxiUl3T8genD4I9Z9OJ/zJ09TI1XdGQVEsxoDiMjBdNaFHbl+NqsMLicUl8VHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ECiAeMW5bTAj+W1eCok0ft9wopZlzd8vRBtmP3mO9Y=;
 b=glgQ8S9sii9IGuEtdwsTXiJ7fyBC3szv2GrwNG5GaaQVHMPNKCwzsmapXjjfikiDVenJckVPWwkZL4gQO9VsFxoe41kfNQAwBlcg3RdC1wQ8aIZzjnaH6rrsO5aYu6zBiMtBchfmPoAosNOtzERvI4u+EwiqIVEIN/lNB3Ze0m0Cz+lPumF7tv1Bu8+p0Di10BQqTZy4AgCFHT9MjhxNKB5lFVMCXSIZiWguFyHkbD11HlfWa+6XahhaDQ6S1RWSSW8Y3dhXOiJxE0xlZRe11YpF2GZ4LnbTrRWbPJFv8cufJxtFUkh1d3zlm4B2/8e/F6lX87oVtXGbkIo402MYMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7) by NTZPR01MB0953.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Sat, 12 Apr
 2025 09:34:29 +0000
Received: from NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5]) by NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 ([fe80::e1c4:5bb3:adc:97f5%5]) with mapi id 15.20.8632.030; Sat, 12 Apr 2025
 09:34:28 +0000
From: ende.tan@starfivetech.com
To: linux-i2c@vger.kernel.org
Cc: jarkko.nikula@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	jsd@semihalf.com,
	andi.shyti@kernel.org,
	linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com,
	endeneer@gmail.com,
	Tan En De <ende.tan@starfivetech.com>
Subject: [v2,1/1] i2c: designware: Add SMBus Quick Command support
Date: Sat, 12 Apr 2025 17:34:14 +0800
Message-Id: <20250412093414.39351-1-ende.tan@starfivetech.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0010.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::22) To NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:b::7)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NTZPR01MB1018:EE_|NTZPR01MB0953:EE_
X-MS-Office365-Filtering-Correlation-Id: 21e0fd3b-c8d7-46f1-f43f-08dd79a5385c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|41320700013|38350700014;
X-Microsoft-Antispam-Message-Info:
	4M5YLy9dzCZ6xzG1yVa7mCCqYng3LFesF5l7iM9GC9Q5BQPCdQsSq3Ebq9OGyisFr9rEXW1LbNHn7aCdSZmsjLWP+9hNtbiXxGcLRhIh+l+H5cSQ7eYLqFrqfDlo+X5BX/dLr+Jwc+ChN9sDqY6A1OmqReQJf2X1b1Xb7q3sdKoYJUdqk+HHSWknmH3Gj7KhkC6cY4d7T2rt/5/4Vbgc0ybKICF9okGx4uCyW5fGomr2ymAO6gcPBRBeqsxMvI9Mv1UkhKcoYRNatObuXb3DmveUIGtT1nBcFnvcdan8uL0GHOPU+FJsdJEF4+ZD3xce21K8jIZ4ZEj/Li74BmzOrTMb4HAfU1z77vQ08I/R680g/xqQYnUQqkgYpvVcHTWL+aoo5+Efz/Uwf4v4zEsOv1YeFn803EpHzZvwnEg/puzlE3s/YZyiTMfTy+wcssW1MO3wJZKhMC2ZTqLG6kxkRBQYsjE9xdK9l12IgY3K+olVEXAaO4154VwTqxU8+DagN7OqRePIyf3Oexn1ZMh22mmpEG1o6E1vmVEHo3HsuIkCL/ppckmkC2E36N6nqwG8aTLrtb9wEdH5oslNtCfjFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(41320700013)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BkefV/37hUkZIynwqpn3Q+bfzbJazifU0U04sraN6hkdQEzFtUtuhHqWRBOd?=
 =?us-ascii?Q?rFSO117wwQ76w7mckA9mhX9LHG9NHkG1JUL8V9B56kHf8rTQ24cAt8r2MvPs?=
 =?us-ascii?Q?Q8kigPIlXcZDTa2yJVu46C5ad9kF98vE52ED/A82Y24V5ZX0a5nIMWqOmA3b?=
 =?us-ascii?Q?sOQ8evzCT7qT4ILDBwWQ3o7mM5ZTprGHFgUJJr1KUgpjoGr4q5szpOYvaUEG?=
 =?us-ascii?Q?aFl7DwNHks3icl+8Tu5UVYUKYFBBaahRpOFvFEkySlKvSEzJ4gy6ulI4R8up?=
 =?us-ascii?Q?8Cb7FlZ1Cc4bBUZYXVZCI47eR/v/h1WCbwsdIlCLxMMAyhfIqmXAl95QrXb+?=
 =?us-ascii?Q?xaEZ3Af5c8ojDflrwyLBxjONsMnLCfXE/kq4msYLYY5cEbj5ci8Q2BaC+R7A?=
 =?us-ascii?Q?Dc9a1sdDnAKBZlLGdOBT4BKiex7CffPDDGO4KFP631QFsczrsAKWewrpSpm5?=
 =?us-ascii?Q?bw9saviLwIG+e0R7F9fXbtTwavQjkT+sGHFdQVUz5cjhx6pLcGexAkF9yYqc?=
 =?us-ascii?Q?7eemk2YeZuMnrw+R8OcHGUQkIbq7hXtzR+cPWZS3Y2qDNwz3jAmXRu9HESbA?=
 =?us-ascii?Q?Zo4dNgkv+yrf9x1c/FdeFpI0t8+VqOdcUGYGo6tMaTnyAlcDYtUtvNJ+MB+R?=
 =?us-ascii?Q?nzJEsLqeBr38mxnTbCs41dLCK5XrIx5gB4mVUMoxadp+CQ8mJmd/5uB2GWbu?=
 =?us-ascii?Q?TfkHfRSaytEOydOguFxdg5xIUR2lDjy9Cu5hnmsENCbnAnk2CcpX4Bgry5e1?=
 =?us-ascii?Q?sTm+dZxOw4e3Z017EODVz30wB5gbEXPA07GvBLPR7FHGwfuDAPYX/BiBuEBl?=
 =?us-ascii?Q?QHTJyUMSUuYuRu32gX0S0Q0Jvo/Br6cQuBQUi871govoopeXvOayTu1NJyt4?=
 =?us-ascii?Q?nqVEFIQorcLJFPLwBEfXKyKE2PUwb7nNOu7zguXweEDTufW/OagjZ6f+S72H?=
 =?us-ascii?Q?9C/w7aEUdjJsJaP8gOTnoBy9fDmANKp9fJrWBWtE+Ptf7GJMikslt5ZBA/lw?=
 =?us-ascii?Q?OKSgDtSyG/f8uPYPMKfMODRPHiCg2A/JS3JxHaSTpOcANhksdoyKme7Kc2AC?=
 =?us-ascii?Q?jYsw3Osm1fPHhBhnjLeLjZw5F6wFFl06Ee9CltfYG3Rx3fi10N2iL6Dfdsc0?=
 =?us-ascii?Q?NmlVepK7gDg4W9/sZMe+/iqcQxXq0DArlwRIJz8y7z4WXHWBKgP67jC2MFPf?=
 =?us-ascii?Q?v4dierbQfBUzXn8bkFw7oNR0bJBOW489L+bQhnx9tXbkztOxRyPlISNlf1fM?=
 =?us-ascii?Q?hoNBN91WtvQtzqudqNuHo9X6s31YEN5MdlE4rQaOrDsWZega5jMiYvxD9JFf?=
 =?us-ascii?Q?0fZTBiGtRsiPF02OI4pl3BvGwoSHSdN+DwM3/tMpOoNFayMmNpZk37+yn/aU?=
 =?us-ascii?Q?O9ix9LbEpTrkgF7CfzOWoEzZzuZnLGwRY98ea3ppjVS+33s1uF2mj8mwwcXG?=
 =?us-ascii?Q?UkDxd7yU8bO3bQe4R4hytxStsYKNeMgatCwX/nib6kD0OcRbLTJF0Dz5yxqG?=
 =?us-ascii?Q?Jb19MCZUP5135d9u9u2kCckpVEzKoIZKVtsuJGSpu7QUWkFRmfO1wOFVBGrZ?=
 =?us-ascii?Q?3Nizaqg4DmE5LJLUgCv4aA4/5hs6H3x7TxBkLCeSwTrifOqFJdvWLvZs3k2X?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21e0fd3b-c8d7-46f1-f43f-08dd79a5385c
X-MS-Exchange-CrossTenant-AuthSource: NTZPR01MB1018.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 09:34:28.6764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1EPcXVwG0/DMV2OR0tadPjbd/8xeqbs0GgvCjfIrLUq/W7mc4/RvBpwUZj45niZLxmW3Ue0qCCX67RJAy5aNQURW4f9V1raLmWGGdWHGCsw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NTZPR01MB0953

From: Tan En De <ende.tan@starfivetech.com>

Add support for SMBus Quick Read and Quick Write commands.

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
---
v1 -> v2: Removed redundant check of tx_limit and rx_limit
---
 drivers/i2c/busses/i2c-designware-core.h   |  4 ++++
 drivers/i2c/busses/i2c-designware-master.c | 18 +++++++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 347843b4f5dd..91f17181ece1 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -40,6 +40,8 @@
 
 #define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
 #define DW_IC_DATA_CMD_FIRST_DATA_BYTE		BIT(11)
+#define DW_IC_DATA_CMD_STOP			BIT(9)
+#define DW_IC_DATA_CMD_CMD			BIT(8)
 
 /*
  * Registers offset
@@ -123,7 +125,9 @@
 
 #define DW_IC_ERR_TX_ABRT			0x1
 
+#define DW_IC_TAR_SMBUS_QUICK_CMD		BIT(16)
 #define DW_IC_TAR_10BITADDR_MASTER		BIT(12)
+#define DW_IC_TAR_SPECIAL			BIT(11)
 
 #define DW_IC_COMP_PARAM_1_SPEED_MODE_HIGH	(BIT(2) | BIT(3))
 #define DW_IC_COMP_PARAM_1_SPEED_MODE_MASK	GENMASK(3, 2)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c5394229b77f..a67add117e44 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -268,6 +268,10 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 	regmap_update_bits(dev->map, DW_IC_CON, DW_IC_CON_10BITADDR_MASTER,
 			   ic_con);
 
+	/* i2c-core-smbus.c: Only I2C_SMBUS_QUICK has msg[0].len = 0 */
+	if (dev->msgs[0].len == 0)
+		ic_tar |= DW_IC_TAR_SMBUS_QUICK_CMD | DW_IC_TAR_SPECIAL;
+
 	/*
 	 * Set the slave (target) address and enable 10-bit addressing mode
 	 * if applicable.
@@ -474,6 +478,16 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 		regmap_read(dev->map, DW_IC_RXFLR, &flr);
 		rx_limit = dev->rx_fifo_depth - flr;
 
+		/* i2c-core-smbus.c: Only I2C_SMBUS_QUICK has msg[0].len = 0 */
+		if (buf_len == 0) {
+			regmap_write(
+				dev->map, DW_IC_DATA_CMD,
+				*buf | DW_IC_DATA_CMD_STOP |
+				((msgs[dev->msg_write_idx].flags & I2C_M_RD) ?
+				DW_IC_DATA_CMD_CMD : 0)
+			);
+		}
+
 		while (buf_len > 0 && tx_limit > 0 && rx_limit > 0) {
 			u32 cmd = 0;
 
@@ -919,7 +933,9 @@ void i2c_dw_configure_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_timings *t = &dev->timings;
 
-	dev->functionality = I2C_FUNC_10BIT_ADDR | DW_IC_DEFAULT_FUNCTIONALITY;
+	dev->functionality = I2C_FUNC_10BIT_ADDR |
+			     I2C_FUNC_SMBUS_QUICK |
+			     DW_IC_DEFAULT_FUNCTIONALITY;
 
 	dev->master_cfg = DW_IC_CON_MASTER | DW_IC_CON_SLAVE_DISABLE |
 			  DW_IC_CON_RESTART_EN;
-- 
2.34.1


