Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AFF966DD91
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Jan 2023 13:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235796AbjAQM2o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Jan 2023 07:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236313AbjAQM23 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Jan 2023 07:28:29 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8ADD35252
        for <linux-i2c@vger.kernel.org>; Tue, 17 Jan 2023 04:28:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmTV7F5xWY+WM+TRBz1saxKnSRL5poGrbSOjBqjSN9nSUHigEhgwCyjvk/iSXY6WfHjTucDSEY8crIDG14dTqv5asDTERb+8QnS0vFMdgJcZGnb8Wg2dg0fMpb0rtqwxy3J8cv7OazCH3MjYIo5vJAi7ZN0YZsn5tpGrjv+sxu2d1wAXqfCkRH49qNLYWQRWkH8qnkpm5iu6SEGZruMDkh4l4GA3T7Kl4EDwLMCorjmLD3pyR+iw1iJ3h+6YFwl5YjlmgN1IfP6p3mPuhQEUeByV5C66smipH9IOgodzaFKcnPCNCgr86q7jFZhvL9NrDS4abluhuPDqT44G3utK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJcuhgvwdr1t0LG577eWlKe35N957hsNS5WI8ODiYfQ=;
 b=MKLj5rfJQlp5wNaSFlvCfXoV4l5RpROXiNIBksavWxLkJffbAifOot3M/x5Vdz6km5NZpotD9RX1woHhCcqYZYLQnZrVFvPyMQMFuoZMwIjnjSGmUZAcf3ptbzJkBX/4rXCMD8qo/n8idJkKwWY9GSwnGOdbIazM+5/2TjVaq5OGodB814zy7v0S3RB+5DkLEV+TLYescf2rWaQ2o8BR3mac057xnq+z+zsDSf6jUoXIgn3AbGDbWweFi/7ZWxY4R7+Bi8F125o8iYI3qOfnjm5p/T7wdkjv5ezh9bqBMKqdv7ztWoE1bniH8XfvSVitRY5nLCie3xDHJOKbfczGQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJcuhgvwdr1t0LG577eWlKe35N957hsNS5WI8ODiYfQ=;
 b=orEGON5Wc2Qr1kcI8pkWI1C30qino4xDYuE5SC8+U59W1defMNslvAShGAuFy0rD3JOFEW3DauzK+zxwU6eQyiw25csLJIpJ4KmnrtP94kTQ/Dz0bUxh5Wbgy8Q4O6TcGpCctLRqiEBwaUfSrWDzWqmiHoN7xj09aV3LOhdEfCg=
Received: from BN9PR03CA0651.namprd03.prod.outlook.com (2603:10b6:408:13b::26)
 by DM4PR12MB7551.namprd12.prod.outlook.com (2603:10b6:8:10d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 12:28:23 +0000
Received: from BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13b:cafe::4) by BN9PR03CA0651.outlook.office365.com
 (2603:10b6:408:13b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 12:28:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT114.mail.protection.outlook.com (10.13.177.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Tue, 17 Jan 2023 12:28:22 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 06:28:20 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
CC:     <linux-i2c@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v2] i2c: designware: add a new bit check for IC_CON control
Date:   Tue, 17 Jan 2023 17:58:01 +0530
Message-ID: <20230117122801.1605176-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT114:EE_|DM4PR12MB7551:EE_
X-MS-Office365-Filtering-Correlation-Id: e8dfb9f0-4f20-4706-d00f-08daf886530c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s1mMwUtO20v8D4sC2jNX9wxiAJdE2Koq+34fnOifvKAfDjjzmeWO8c8dXqIgAjdE0Gw+wiz5KCZcPOrgM+0OsSC6c474PvqApPGIK7IjugCW3zRNv5MkS7WXXzjNn2IRorzcGMoFaXQS9W+7yv/Lj4Y3vnYDkxy6s1F2wD7Js7Z/tk/LKwq5ifDSLovMJnvDMvcQygGI0m9+CCTlOLvC0k0RCtLmrRs6mR5uupgGbldTBDJYLZGvx8m7vXRE1KFu270Z926BbnsbRwd1QNQ9yH5eYQPHk+8Wx+vEpsv7nSGt+vji56X/o6/9ZSvIebDJLaj/Y/n/qKXMqEBWpV1GtgfI8+U1QH/rSYKsaE+S6npKGd08qJatfc2iXjUbqcfxRIUHhmls1D64xXlzMluhDUGyknSdhovdhqsPcTlwLwc0+UvHaHG0lkRv0vIE+00edwyGpcOH1HFTGmzxzDWHBMt7UjDr6qRlq0E/rlyKKxRcKrQmyQZm90QE1UtHIOtE0QP0vPyhlfJnItjXrs4S3Lqpg9yiRO2OjkwqLaRrsj/v6fX8Pi7kX2f6732oT809vuKHSQKKIm69t4eoAkQbG3eNAKXt1CDANhgp2Lmus0qpybrxnTRgbZJrQyTl+9e4V5FPBtMYhNplpokWPIdn5TbkS4jEjOqa2bP+lO2fWVwFuXn+yFFmm3XMqh5ry8pW9ckbnVLTNHv5jvW1nK1KMHhv/+sfkfLQrzWUz8K2z+A=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(46966006)(40470700004)(36840700001)(110136005)(2616005)(16526019)(83380400001)(54906003)(4326008)(316002)(336012)(40480700001)(426003)(70586007)(47076005)(70206006)(8676002)(5660300002)(8936002)(2906002)(1076003)(36860700001)(41300700001)(81166007)(356005)(82310400005)(86362001)(7696005)(478600001)(82740400003)(186003)(36756003)(6666004)(40460700003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:28:22.8532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8dfb9f0-4f20-4706-d00f-08daf886530c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7551
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

AMD/Designware datasheet says:

Bit(11) BUS_CLEAR_FEATURE_CTRL. Read-write,Volatile. Reset: 0.
Description: In Master mode:
- 1'b1: Bus Clear Feature is enabled.
- 1'b0: Bus Clear Feature is Disabled.
In Slave mode, this register bit is not applicable.

On AMD platform designs:
1. BIOS programs the BUS_CLEAR_FEATURE_CTRL and enables the detection
of SCL/SDA stuck low.
2. Whenever the stuck low is detected, the SMU FW shall do the bus
recovery procedure.

Currently, the way in which the "master_cfg" is built in the driver, it
overrides the BUS_CLEAR_FEATURE_CTRL advertised by BIOS and the SMU FW
cannot initiate the bus recovery if the stuck low is detected.

Hence add a check in i2c_dw_configure_master() that if the BIOS
advertises the bus clear feature, let driver not ignore it and
adapt accordingly.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---

v1->v2:
- Update the commit message

 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

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
index 45f569155bfe..b98cab722b4d 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -780,6 +780,7 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 void i2c_dw_configure_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_timings *t = &dev->timings;
+	u32 ic_con;
 
 	dev->functionality = I2C_FUNC_10BIT_ADDR | DW_IC_DEFAULT_FUNCTIONALITY;
 
@@ -788,6 +789,16 @@ void i2c_dw_configure_master(struct dw_i2c_dev *dev)
 
 	dev->mode = DW_IC_MASTER;
 
+	/*
+	 * On AMD platforms BIOS advertises the bus clear feature
+	 * and enables the SCL/SDA stuck low. SMU FW does the
+	 * bus recovery process. Driver should not ignore this BIOS
+	 * advertisement of bus clear feature.
+	 */
+	ic_con = ioread32(dev->base + DW_IC_CON);
+	if (ic_con & DW_IC_CON_BUS_CLEAR_CTRL)
+		dev->master_cfg |= DW_IC_CON_BUS_CLEAR_CTRL;
+
 	switch (t->bus_freq_hz) {
 	case I2C_MAX_STANDARD_MODE_FREQ:
 		dev->master_cfg |= DW_IC_CON_SPEED_STD;
-- 
2.25.1

