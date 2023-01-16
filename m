Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC9A66B69E
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Jan 2023 05:35:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231717AbjAPEfa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Jan 2023 23:35:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbjAPEf2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 15 Jan 2023 23:35:28 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3965455AA
        for <linux-i2c@vger.kernel.org>; Sun, 15 Jan 2023 20:35:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VY2j6CZhAcmipEbwQNmIqfna8kqUPlcieSz3pcDxW0dpKkkcveIg+5jMmxNCXdOwguUpQmCtnT15r+ywufT5+2c9euI6d0snz2Wa8tve4ajchewtxHPyNFxYacAlS85lQP2/4aoxhtye7Jum7gdmQbmt8SDseSv7ilPOGKeJkqHhtV11plg4UXgyRpf8yBo1+KYBDq/UmEpvB2JRvkC7F699uO3PFG/suRNFtWomy4pPDsSI7KXOIc1D6cgpOofSnBYJmt2wQHpzZOdBred/gTEKOfbd22J/GWgv0j0Ys65ERWn6vxAWZh9tmPmwU82t2mNhi+7U6VuLwura6+YRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UvEFvcXzneszlEs3ZlOJ8P66rfXRmmwm6J0Jtns0hLM=;
 b=d/tt8yRPQ84JRx1ON+aPZ8SiBObXT0U3P1pYsL7kcdWUXK5Gir2HvpfPhtgLJIl+RgCs5JNOgeGdcKcPsHmhd7885lHxlZgpSrhnBmZpP/mUYgklIWi0bw9Vhe+l9HpF6zeTAi6a2QZjrrpeM+1dmc8H24jTLUhzvLm5Jgy3yG1dHlAfvuaBhIKDNAnem2FbSoU/wzOFNb8RDQwroK280C6pSbegA8foEgw1oOxIaGKXhsKQ3s2m7Mbm66ikXzir+8WTdyKp6/k95h0tUyPnSnLfXeAWPawytBiKvzXQPpTugli/LXhup2kD+PfciZr7RA34mJteYjhmmygMD9SVXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UvEFvcXzneszlEs3ZlOJ8P66rfXRmmwm6J0Jtns0hLM=;
 b=Te+qvW0huDcuv314WhAaTLkwsR4KCRFBt8B9pdn3n4HnSMsuEkix936WVmwFxn9FUi0SRaZVoWH6lsZvZy78LH+AFHilYdTTZdEvfnuLu0yyk80RvIM4XK5gxmSpSWqaqfOxwO6j4/tAHwFG+iEUrWPnM1hEp3sVFfJVkijUlEg=
Received: from BN9PR03CA0126.namprd03.prod.outlook.com (2603:10b6:408:fe::11)
 by CY8PR12MB7219.namprd12.prod.outlook.com (2603:10b6:930:59::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Mon, 16 Jan
 2023 04:35:24 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:408:fe:cafe::9b) by BN9PR03CA0126.outlook.office365.com
 (2603:10b6:408:fe::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 04:35:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Mon, 16 Jan 2023 04:35:23 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Sun, 15 Jan
 2023 22:35:21 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
CC:     <linux-i2c@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] i2c: designware: add a new bit check for IC_CON control
Date:   Mon, 16 Jan 2023 10:05:00 +0530
Message-ID: <20230116043500.413499-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|CY8PR12MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: b922d62a-9884-4018-38cf-08daf77b155e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wPDcuhU7wYa4UEqGflvaz878+yXpt1yfwyFcJskXzt6cgH00jF+iD8gF1itECB25zRF+2uULdoGzMqEaQHfB9NYSnZ1iSSRMQJrZla8LRRjHYwFuHVoI514fuHbItrJXJ32FzjMufMDIKP1ZFCYcSuJh2PsUa+npxr2813TPVXdLNK02PK6SO1roBZbfbtj2zagrNoHy8F9ic36BednHK71TFuzcMD91YiCgnhDgr/chwlHnGNmcMXpwybl0U2fQHfW2JzMkMGbyYaYNSaCKmIY5VLTLVV48LNyHi77Ux06x3Z3On6GuiZIWvauy3V2w1Dhj3UM07MODaw0lI0fIlsAqNF2eeUREOsBw9Avoc8PlZie7BUlXw2WE3IwhxWcwPP8MaGWF6ZXpV3I57t4FlJbvULTKYVr5/hy6Dk3W+KUgf4H6+DPImRrUW9D8oQUWTJMD1FgwE4otomf7PNc+tAm8vHv4KCpP9RzBAmtU+FOiUnljcKsrApSnR2c3UGZGXnY3jkwgk5293YP6XW2TqWa0fT+nEXpoIMoFND6dfgQjSRLbaM+v0vteN6Clwm1zFXLvc7ASXUldB9QIn2bOtxXlFxyOOyV9CLimHLWkOG/KiDbZ1kFTx4EY+1C/oqGkVqiX+YKYFB+3zXJQYu9FsGacNPWkr0zJ6Dq1ugfXCrEwGfteu4TWUm2LVlvL4tMXDqvLZ5IezwfkLbJugREPdaKEJSfc5dN8r0faatPsqOE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199015)(46966006)(40470700004)(36840700001)(5660300002)(86362001)(8676002)(70586007)(70206006)(4326008)(8936002)(41300700001)(110136005)(36756003)(316002)(54906003)(7696005)(40460700003)(478600001)(6666004)(40480700001)(356005)(16526019)(26005)(2616005)(186003)(47076005)(1076003)(2906002)(336012)(426003)(82310400005)(81166007)(83380400001)(82740400003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 04:35:23.7568
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b922d62a-9884-4018-38cf-08daf77b155e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7219
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On some AMD platforms, based on the new designware datasheet,
BIOS sets the BIT(11) within the IC_CON register to advertise
the "bus clear feature capability".

Since the current driver implementation completely ignores what
is advertised by BIOS, we just build the master_cfg and
overwrite the entire thing into IC_CON during
i2c_dw_configure_master().

Since, the bus clear feature is not enabled, sometimes there is
no way to reset if the BIT(11) is not set.

AMD/Designware datasheet says:

Bit(11) BUS_CLEAR_FEATURE_CTRL. Read-write,Volatile. Reset: 0.
Description: In Master mode:
- 1'b1: Bus Clear Feature is enabled.
- 1'b0: Bus Clear Feature is Disabled.
In Slave mode, this register bit is not applicable.

Hence add a check in i2c_dw_configure_master() that if the BIOS
advertises the bus clear feature, let driver not ignore it and
adapt accordingly.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/i2c/busses/i2c-designware-core.h   | 1 +
 drivers/i2c/busses/i2c-designware-master.c | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 95ebc5eaa5d1..a7ec8d5d0e72 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -37,6 +37,7 @@
 #define DW_IC_CON_STOP_DET_IFADDRESSED		BIT(7)
 #define DW_IC_CON_TX_EMPTY_CTRL			BIT(8)
 #define DW_IC_CON_RX_FIFO_FULL_HLD_CTRL		BIT(9)
+#define DW_IC_CON_BUS_CLEAR_CTRL		BIT(11)
 
 #define DW_IC_DATA_CMD_DAT			GENMASK(7, 0)
 
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 45f569155bfe..a45d4248caeb 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -780,6 +780,7 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 void i2c_dw_configure_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_timings *t = &dev->timings;
+	u32 ic_con;
 
 	dev->functionality = I2C_FUNC_10BIT_ADDR | DW_IC_DEFAULT_FUNCTIONALITY;
 
@@ -788,6 +789,10 @@ void i2c_dw_configure_master(struct dw_i2c_dev *dev)
 
 	dev->mode = DW_IC_MASTER;
 
+	ic_con = ioread32(dev->base + DW_IC_CON);
+	if (ic_con & DW_IC_CON_BUS_CLEAR_CTRL)
+		dev->master_cfg |= DW_IC_CON_BUS_CLEAR_CTRL;
+
 	switch (t->bus_freq_hz) {
 	case I2C_MAX_STANDARD_MODE_FREQ:
 		dev->master_cfg |= DW_IC_CON_SPEED_STD;
-- 
2.25.1

