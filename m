Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A853C6AE5
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jul 2021 09:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbhGMHDb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Jul 2021 03:03:31 -0400
Received: from mail-co1nam11on2064.outbound.protection.outlook.com ([40.107.220.64]:36992
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233762AbhGMHDa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Jul 2021 03:03:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FYABvKkgxVKoLI0g/8RKI7FUbjlJ1PEhjYt2nrwRzjGo9/NJCWw5gfm+Y0TBMpFu4GihbVEtNRVwE3M9hW/M2D5TVLSqi6rfAwyPQhO1s2DDd94/fxph5BNH5kLaQY8B+QZMQfV2ULdqyuZwcJQCkcNhVk9socxwro+yQZcisHzMqF50B4G9CPRefOew3m4XhvcA7l/uKY0NUo2mQayVk/ChqD6jeiRYAwVFhMe71PXt0IFQOsqg1d/a9GXhJIFz9T2riL1pmfLw2FQ6abV/ZWNltGVX3y/QkXSZLVvBNwNkyhjR56UmsiM3cwCPrdKXwGwy0H6H/B9pLoOUnwJp0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agmzg8GdXRN3eXOZ+QuQxjmFtE4nuxjT8oL0MaRDhPw=;
 b=cVBCEz+//u8vX0tv5WX+1mtQuAYGCyI+BQvK4EHj8ja4b8yvchUaYT+k8H2ASeApHrv5UrnQit5KqNyKSVVT4yohjiDQXvbdvWhl1nHDOBqU4h9EsFl6QU6LjqPJK/oQmRcV4sUciONyvM6/G8cRwUbohDwRlZR5fze5eS9cCLkCdnvQNYRTbQKlv8gsNxR860LxE3lyrk9qBgUsGuoVBEI/rbTBqOYoD26VZqMNNsUtpEVBg8NzFrUxAAt0vhskG1L6FcPDGHQiNHaWXbIgAP8uBgpshz+Wf0y+bMENe0J7U4ALxE1WmhCNiF4J7r1fH1lFU4hKg4LVm6vDS50/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agmzg8GdXRN3eXOZ+QuQxjmFtE4nuxjT8oL0MaRDhPw=;
 b=E1h9bU6buRfecXRBDJYwWSQNZA/w07jOujmgUPJoBUx6SgAFdhUme8vQe/my9btWJsXkd4kazTdcOp4Bth1K2bFH9BQq6LnfJt3BLGXQK16colZuPD+hr1xVaFHHYd3/XaBXD8kBIxlbNu0chM6QOngP+fRR0+k6PvIijF9VaYw=
Received: from DM5PR12CA0064.namprd12.prod.outlook.com (2603:10b6:3:103::26)
 by BYAPR02MB4181.namprd02.prod.outlook.com (2603:10b6:a02:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 07:00:38 +0000
Received: from DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:103:cafe::3b) by DM5PR12CA0064.outlook.office365.com
 (2603:10b6:3:103::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 07:00:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT036.mail.protection.outlook.com (10.13.5.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Tue, 13 Jul 2021 07:00:36 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 13 Jul 2021 00:00:19 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Tue, 13 Jul 2021 00:00:19 -0700
Envelope-to: git@xilinx.com,
 linux-i2c@vger.kernel.org,
 shubhrajyoti.datta@gmail.com
Received: from [10.140.6.59] (port=58718 helo=xhdshubhraj40.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1m3COu-0001Lw-Uh; Tue, 13 Jul 2021 00:00:17 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <git@xilinx.com>, <linux-i2c@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <shubhrajyoti.datta@gmail.com>,
        "Shubhrajyoti Datta" <shubhrajyoti.datta@xilinx.com>
Subject: [PATCH] i2c: cadence: Implement save restore
Date:   Tue, 13 Jul 2021 12:30:11 +0530
Message-ID: <20210713070011.28254-1-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62e82e3e-1c56-449b-1b80-08d945cbeac8
X-MS-TrafficTypeDiagnostic: BYAPR02MB4181:
X-Microsoft-Antispam-PRVS: <BYAPR02MB4181340DE73B489C10E9C0BEAA149@BYAPR02MB4181.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zBEm6FAofM41RZPJCoaq/kzV3T3B1LksbWKJQgelfIlmyzAPzRSNmSS4kqxIHBX/Gbd2q2j131oHxmzw8SRfCcgGpTqXPrJFwiNaXYfDFEYuKkk/DQCRdJ9a88uAvIlboRleRcLBtM46WlM+VwJGX4vyVvUwXh3x5BxPFbNscVUR/cNhdFqYverccluyWdeYWlsXNfX/Qqhqmjv5BVtc8vhxduhC37Rmy8Zd7xZJAtRVaQfgGVpeQT412/egG7YzWgdPrOjukkHz+YJ+Y4OU+VK4y8vYxnMV+7YGLAsCu7GuWq/uH1F9619HZggy+t7MeV4+GcRyFAQ92vAFx/0y9ldRt8UhUuw/he9p9TJWui7dG4oSiMoF/86wo/ugIYQUheWL/PFAUQ70ye7Br96qGr0K101AGBa53LOGnIWyn01+v+m7yXu61War/8h4/Sce51KcEwKSFsb4ML727tr3T8yaYUXA4EuHuuB/wQ1NuXQvJMtu5uQDveZDl9re+pZMUDucccEbcKtTSzUzqGhwrFxoX+NSyumOALZDlcqEBbGF6oiYlt1IENDR1I2fnEDSG/rmKN1AFBT3xvobIECsm/GrnosOgLLnPbwpxuyyu9vxpKH/PobH9U/ZUB//PENmeOx/zFWxHT4PE+D4cPf6vWq47j0lNse5T7QyOvH/S97ghPRJ0YM4KYd7ss/4k5nQl/+pZzxJp93/a9NuvlNRsX5wJWgrcKdMHJCyBSkOPlg=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39840400004)(346002)(36840700001)(46966006)(8676002)(36906005)(8936002)(4326008)(426003)(336012)(9786002)(36860700001)(316002)(82310400003)(47076005)(44832011)(7636003)(478600001)(110136005)(54906003)(107886003)(36756003)(2616005)(1076003)(2906002)(6666004)(356005)(186003)(5660300002)(70206006)(70586007)(83380400001)(26005)(7696005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 07:00:36.6587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e82e3e-1c56-449b-1b80-08d945cbeac8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT036.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4181
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The zynqmp platform now supports chip-off so the registers can
lose context.
Implement save restore for i2c module.
Since we have only a couple of registers
an unconditional restore is done.

Acked-by: Michal Simek <michal.simek@xilinx.com>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
---
 drivers/i2c/busses/i2c-cadence.c | 38 +++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 66aafa7d1123..25a0447e9fbf 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -178,6 +178,7 @@ enum cdns_i2c_slave_state {
  * @clk:		Pointer to struct clk
  * @clk_rate_change_nb:	Notifier block for clock rate changes
  * @quirks:		flag for broken hold bit usage in r1p10
+ * @ctrl_reg:		Cached value of the control register.
  * @ctrl_reg_diva_divb: value of fields DIV_A and DIV_B from CR register
  * @slave:		Registered slave instance.
  * @dev_mode:		I2C operating role(master/slave).
@@ -202,6 +203,7 @@ struct cdns_i2c {
 	struct clk *clk;
 	struct notifier_block clk_rate_change_nb;
 	u32 quirks;
+	u32 ctrl_reg;
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	u16 ctrl_reg_diva_divb;
 	struct i2c_client *slave;
@@ -1037,10 +1039,11 @@ static int cdns_i2c_setclk(unsigned long clk_in, struct cdns_i2c *id)
 	if (ret)
 		return ret;
 
-	ctrl_reg = cdns_i2c_readreg(CDNS_I2C_CR_OFFSET);
+	ctrl_reg = id->ctrl_reg;
 	ctrl_reg &= ~(CDNS_I2C_CR_DIVA_MASK | CDNS_I2C_CR_DIVB_MASK);
 	ctrl_reg |= ((div_a << CDNS_I2C_CR_DIVA_SHIFT) |
 			(div_b << CDNS_I2C_CR_DIVB_SHIFT));
+	id->ctrl_reg = ctrl_reg;
 	cdns_i2c_writereg(ctrl_reg, CDNS_I2C_CR_OFFSET);
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 	id->ctrl_reg_diva_divb = ctrl_reg & (CDNS_I2C_CR_DIVA_MASK |
@@ -1128,6 +1131,26 @@ static int __maybe_unused cdns_i2c_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+/**
+ * cdns_i2c_init -  Controller initialisation
+ * @id:		Device private data structure
+ *
+ * Initialise the i2c controller.
+ *
+ */
+static void cdns_i2c_init(struct cdns_i2c *id)
+{
+	cdns_i2c_writereg(id->ctrl_reg, CDNS_I2C_CR_OFFSET);
+	/*
+	 * Cadence I2C controller has a bug wherein it generates
+	 * invalid read transaction after HW timeout in master receiver mode.
+	 * HW timeout is not used by this driver and the interrupt is disabled.
+	 * But the feature itself cannot be disabled. Hence maximum value
+	 * is written to this register to reduce the chances of error.
+	 */
+	cdns_i2c_writereg(CDNS_I2C_TIMEOUT_MAX, CDNS_I2C_TIME_OUT_OFFSET);
+}
+
 /**
  * cdns_i2c_runtime_resume - Runtime resume
  * @dev:	Address of the platform_device structure
@@ -1146,6 +1169,7 @@ static int __maybe_unused cdns_i2c_runtime_resume(struct device *dev)
 		dev_err(dev, "Cannot enable clock.\n");
 		return ret;
 	}
+	cdns_i2c_init(xi2c);
 
 	return 0;
 }
@@ -1246,7 +1270,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 	id->dev_mode = CDNS_I2C_MODE_MASTER;
 	id->slave_state = CDNS_I2C_SLAVE_STATE_IDLE;
 #endif
-	cdns_i2c_writereg(CDNS_I2C_CR_MASTER_EN_MASK, CDNS_I2C_CR_OFFSET);
+	id->ctrl_reg = CDNS_I2C_CR_ACK_EN | CDNS_I2C_CR_NEA | CDNS_I2C_CR_MS;
 
 	ret = cdns_i2c_setclk(id->input_clk, id);
 	if (ret) {
@@ -1261,15 +1285,7 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "cannot get irq %d\n", id->irq);
 		goto err_clk_dis;
 	}
-
-	/*
-	 * Cadence I2C controller has a bug wherein it generates
-	 * invalid read transaction after HW timeout in master receiver mode.
-	 * HW timeout is not used by this driver and the interrupt is disabled.
-	 * But the feature itself cannot be disabled. Hence maximum value
-	 * is written to this register to reduce the chances of error.
-	 */
-	cdns_i2c_writereg(CDNS_I2C_TIMEOUT_MAX, CDNS_I2C_TIME_OUT_OFFSET);
+	cdns_i2c_init(id);
 
 	ret = i2c_add_adapter(&id->adap);
 	if (ret < 0)
-- 
2.17.1

