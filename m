Return-Path: <linux-i2c+bounces-10279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51976A86A7B
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 04:53:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 095C41B643D9
	for <lists+linux-i2c@lfdr.de>; Sat, 12 Apr 2025 02:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03059146A6F;
	Sat, 12 Apr 2025 02:53:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2133.outbound.protection.partner.outlook.cn [139.219.17.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1BD17D2;
	Sat, 12 Apr 2025 02:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744426404; cv=fail; b=X5DuaCy191TaxUlLNxy1zBIuNTlq89+Hk7k+ZQdCdPCW/jUiM0Cczi9Shd/ZTn8KWei4koNVm8XTIiNUpKCLNrfNhBcJvWQuAp+kEJgI1fMWx/u2ul/dwq65uIyZspmJgbRtpQzh3QBWAKe8+NKFjKVhloaQ1vkHC72G0PCgHTc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744426404; c=relaxed/simple;
	bh=p46b95iX8t4Kz7JQ97573JPNLu+zLosHaAXQT0s+u3M=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=APLPldxjpQptNyk+a0H/QcCDSRQBA+byJRCY6KZdOck982zVIIbTtW6llJ8wCjvZ8i4syEklc3sFjQ0vCOE03S9UsVDE01cQoogmZQwzh7XlFABb+JEiiKaNaE3hd783Sl7drNzDGkIEEH9Ll+sjHGvFGXR59Q+TtIKoy8z0jag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IngInPyQETzpfM0xgbjLPRPwE41RhfgehApO5pJQVw2LOJX8aNIKe9ewmvxq01MFCc1NcOZu41QIX3YG2OxBkXWeQmS0GcSQWQ0LXtbTCRWxIzV5mJ81G1oCrluv8HaGTRpFGDQDBr+gS3ImUVlYyEniP2somvd9YVtKf2i4OlvEDhIXot1OJFWdKEikJZnaBNhWpEV9CLL50CBnCGqZMX08JR9xltkPNam2HSpCc46SaGD660/HTx5JOR2h28Vz0Ugj3JuhN1Rj0rPMumKQaYsZdesWnW9ska4MBxkyDAVGcon2piQ0/ixMKJOu4O+zKGjazcw5OpTWiGWGE9nqZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9P++HD6N4fFVl3oAi3DYLGuEEj7QGScnkBLPYjqRGs=;
 b=nhoG4M7DI7zYrSUe/M+K/TsWNzIsvOcbcFrDVdB4y7hGkXjlTELa7cRsaLAVj8+SkbbaTk/aLr2pDclFGOf1wtf7UlJDDO9owginJ/X5qY4CtaRpfmbhixHzZN4lWAVbK54TuXFQ/dfgfc54dSdx9Txpse3eXkcWTLc0UioTPFlswsH+DViEGhvNIRbM+DhxlGoTBx96Vzsnd16mEu9EI7OoS02CFOn5pn7aYNFhPS6hFAB9KUpVF9ksHM3sIfg/4uQIuDTH4S1V9navQCFx5Obj74HMrULEZuaZOqJ908ecZ2s81BwZrPE+qU489MQPuncfKqrvTIpFOklRuO3b+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1024.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:d::5) by NT0PR01MB1088.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Sat, 12 Apr
 2025 02:19:13 +0000
Received: from NT0PR01MB1024.CHNPR01.prod.partner.outlook.cn
 ([fe80::44d2:4d05:c7ca:8356]) by
 NT0PR01MB1024.CHNPR01.prod.partner.outlook.cn ([fe80::44d2:4d05:c7ca:8356%5])
 with mapi id 15.20.8632.025; Sat, 12 Apr 2025 02:19:13 +0000
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
Subject: [PATCH 1/1] i2c: designware: Add SMBus Quick Command support
Date: Sat, 12 Apr 2025 10:18:22 +0800
Message-Id: <20250412021822.372805-1-ende.tan@starfivetech.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0011.CHNPR01.prod.partner.outlook.cn
 (10.43.110.212) To NT0PR01MB1024.CHNPR01.prod.partner.outlook.cn (10.2.10.69)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1024:EE_|NT0PR01MB1088:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ce87b4f-70f5-4de5-6984-08dd79686b02
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|41320700013|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZSifk1TUiwtQ3yFd/wqzLGKf1x3v6WKM95Qkv2bjq6CrEjDprh7+qOjyBNG4dAfK+Wg9/pVq40g79c2yPYHC+AN/JyAdkumA0B6y2NAOlZQc2OldOAPS1tR72KwpOOBwwegpemeu1E+nDMZ1XrJdJE99hgn7Prr7X6v7DzaxhC9XFdODrOJK/S5TaxcBOJiB84iIUamcMFWkXbId5tFMn685eDpOcD+DfhJlywoipqxY8rrZbXg1rEupHyLNy/5FrpkG6l+xtiu0HVjtFfJBbfjfrcsxgNVddYjmy941xIrbQ82Du0jOMBnSQQwHLEGik3Wn+NHiMeGLo+Dae/ZZQIAnReSR8ivI8NgVchLTSVNhYz8LbSVMRzezixpo7hKqgwrRYH4GhjbNTYUGRTK7k/A6+Lh+/gGk6DjH75l3XQ0c9i+XvLTmfZzIjE0mM9ohfWmxQBvX0icXxAJq/ldm+81GyyRZGWb2aP4nlx/N1NFxqFcwJLrQK+Pjn42YQcERevgn18IY0XBZce9LYWPQSoL7xZfRRu7+ZdJmS7im/ytO+ESVPZ9BCfWTgxk7Gp2Xln2/60Hd37ETVjJzalpsFg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1024.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(41320700013)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QOzMSvRk3wO2wMd+AhwMG7MtQTnm3jTNrMc7oG86V6UxXuNAJufN/RK0mqCj?=
 =?us-ascii?Q?cTNi22N1jpGYf64z3ycRwbDrA3lnGIj0Ta4TmLo0ZcEyS9OAdYoKm2spTdMQ?=
 =?us-ascii?Q?HjPe8+mYAvMlOLSjZ+Qnu318rsj2UIiIbg+CxgvK9qUln0DoPmk33FboAld3?=
 =?us-ascii?Q?mI86iHWKoXvWPt2x6ofSgzb5XSoyYhjwFgR4GlGB/TO1qcOtV5e9AszN3suI?=
 =?us-ascii?Q?PYciQsgFbvZC+O9fXgJknEQ0RTgnVfQAKeEEbF9LkW8JrISMA1VyVDtwa0me?=
 =?us-ascii?Q?Jnt6ZKTYotthMECDAWjmTM7j29NqcaHpnxEqgUuEzEc/fxbJURD1WPHI3xU7?=
 =?us-ascii?Q?dYsaYoy10fniBLU0R4TZVZfvC3p7uiaPyzVvBsTy3z0C+zwamaAKTnmzxzyq?=
 =?us-ascii?Q?f/awmO4Z/uAIzpVjeh1rt6TcgwMdjbyY8I5iBOCk8VYo3gJhbnGIlYnTaCh8?=
 =?us-ascii?Q?2N3TjfWWiyfTzEmaMZzk/I4EobOi0AFdX/5FlCBMQwRA3pdN+IGmF7XPUP9e?=
 =?us-ascii?Q?QiAlxtDgwi5tyaMc52UUYsgIOjPW6tsDLHdjWNOzJtfTzqXV3PqX/S+qGIye?=
 =?us-ascii?Q?HuiPBZu/ypMJ1cp7tvJWgkBtdUHwlP/pPuNxe0FYLz9+FtgoCUDfB5aUf3Bo?=
 =?us-ascii?Q?NekAu9LuaxSyhmkBT+cVzizaaN/3HM7juKTIGV5XGcGw3A53YiCERKDJ36Fd?=
 =?us-ascii?Q?qY5FchFiP918zaw0i4OsaJpNyAzX1SNd1v7SsIifuFEwLapNHbTgqTU8yGJi?=
 =?us-ascii?Q?6iOItA9UdLsiSpnQ4jMIRbNSteKsjhR+r44SfOF8w0TAXO+wTkb50tH6U/q3?=
 =?us-ascii?Q?D1JKs4EN/FH7Oi4JUZ8wBdur8tgCwMJZagQCk4vobZAsuzc8bwUM2aj6gxJI?=
 =?us-ascii?Q?FIVGMKLzjTEb1vodDauHChnMl1rK9rcSCmv072gtnCdk3IeA8bXD/RmXXD1j?=
 =?us-ascii?Q?kiFKF2sDog6XW9qcmU7Z72Gpw3iF2100JwNh4xh7cM99pifonwsIQzgBxY/1?=
 =?us-ascii?Q?e0M+dTvYr+A+fopEk3UF77c6rnKmXMtf8MFUH+/q4BFxEiah4LsPpRVBEJ//?=
 =?us-ascii?Q?MCuHUUyP4bq9EfNc3QqyiH6nfHVQRweLzVf+Fx1ptecGDBWb5JOTxLLW+oAG?=
 =?us-ascii?Q?vN5fafxLYIo3ngQi0zfRY+sC/eYHHEfL2CWwR+LmJxXzV/ZaCuOTLABxW9GR?=
 =?us-ascii?Q?kBNxwOvzjx0fh/5RJmeFK4mARW632xkAAuaoHnY7I7pIpnMRDWXgrnLKSgVU?=
 =?us-ascii?Q?FXNosc9dKNYtw8cRFb0dPiZqrwVRmWdk8LgKR7xDvaqmYdsGq9m2tXMFJvvE?=
 =?us-ascii?Q?8eMw5pysDyW2rm7mQ+6gMKE05D6SOSw6U3Y8oEZ53pi/fuHCrtYfe1D2JjRu?=
 =?us-ascii?Q?+FqCoNwtEFZBdJ2SF101ktsE9ZhBRj1B4xiX8HLdbOedv7OSEICRtcRyv9iO?=
 =?us-ascii?Q?oxieZ7Ogds6jaQ6o/axBNxY6SNAa32P28ct+S5ZFmdr2jbBGcreDkrbYA1Nc?=
 =?us-ascii?Q?i6MvlxAsT9ojl+gB6xZrpYZe8WWTtLvSFS674f0eZIbttbWmjLmfWhZvMKCO?=
 =?us-ascii?Q?3PSvSw9j1g4ihfKQeqWych2MAJOzBCxuQWK2U0vx9kSiwcWOSQ0WacxHedDS?=
 =?us-ascii?Q?/Q=3D=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ce87b4f-70f5-4de5-6984-08dd79686b02
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1024.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 02:19:13.6318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1dnfdAkaAvJyRa4fasTdDGTJMHPPSG5h8Jse/0jcy9+3WxQamM6WT8Ed8kOfrktXEM5BtCn8C6NQgvCYdJEIzs239KbHY77EncyyQHnNXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1088

From: Tan En De <ende.tan@starfivetech.com>

Add support for SMBus Quick Read and Quick Write commands.

Signed-off-by: Tan En De <ende.tan@starfivetech.com>
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
index c5394229b77f..bd5812f1168e 100644
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
+		if (buf_len == 0 && tx_limit > 0 && rx_limit > 0) {
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


