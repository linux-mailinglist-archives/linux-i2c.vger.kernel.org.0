Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C99EE6794C4
	for <lists+linux-i2c@lfdr.de>; Tue, 24 Jan 2023 11:07:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbjAXKHb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Jan 2023 05:07:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233689AbjAXKH2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 24 Jan 2023 05:07:28 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C27833EFC0
        for <linux-i2c@vger.kernel.org>; Tue, 24 Jan 2023 02:07:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fn/7oIuS/ZILRdh6qO6KOsJyXj0ZNM36kKP14fg7WTsXNfKQdudqeN7zPxt50m6yIak73HsUdYIOCHTM00Igb82o3fvBlbXV2SYHUTAWPgvvioYX4NO/IXq6m23duVUZ4RqVFrW8foRIoLhw+xuQZsLNPIk9A/1Fm3NNjtS7Tg9ziJi5TZieB9TlnXxpGvtYPeRAg0EYL25uzMw/61DYXYogRbYpQYeh1Ek/yOSnN3+RY/f1xHDgoHS9IEhQigG1PPaKN9rSa9m/iFXSYyo2WPMCiovx8iTzqgn1Zz5FrR2B+WelSZTp8+KvU4FMB3f1TXg9PBwZo6V09Uxrbky8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxczG2E2zNKrK9ZZbKT07BmbkJ/TEe0xkocCu5G4AWw=;
 b=Gy4DTzEY8j977CUrJd45cOG0adxHeA/caekNnGx8f0GcVTV1qTeZBxnrqLPPZSvVGXoPkmRnSqruqvA6BBHF23ADQHftdBjUY6f69mTYFY8i60UNzuu5QO6zCt1c0KEwQQEKPNjoYXvnBQKnFlH8wUWd0pQfYUTicen3T8ED/cUr4UejOp6D0qhT7l8EHYJgq4SEMvE2Gy92ZPw82E40fo575QjwdBd5DMZjyI4jBDQpSBHyHYgpZ2vWazvg24o/JTUTkpyfGY7ZtK8rukbmNRTOhqXUhpTis8LeMkF65D9ys/a+Qv8PBAl9qawzy74H5g9LygQ8jcyknTJ0cW4liw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxczG2E2zNKrK9ZZbKT07BmbkJ/TEe0xkocCu5G4AWw=;
 b=DtgQ0KmwNC4Pv5AILgS6QZjW5DFHFF0Q192DAK4vMPIEcFeohVTGO/VF8CV9XtJhFqOVv29FcfVaNJ1MhdTiWCndGbDJ/NKQeWmwVTgj3LJJbaCVACC9UAZY/SfN5NTx6QFGLfPDcVecGHWpYyKzFMtulfnw9XVY5oK4Jzzh6YQ=
Received: from DM6PR02CA0139.namprd02.prod.outlook.com (2603:10b6:5:332::6) by
 BL1PR12MB5850.namprd12.prod.outlook.com (2603:10b6:208:395::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.33; Tue, 24 Jan 2023 10:07:19 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::8a) by DM6PR02CA0139.outlook.office365.com
 (2603:10b6:5:332::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 10:07:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 10:07:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 24 Jan
 2023 04:07:09 -0600
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
CC:     <linux-i2c@vger.kernel.org>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH v3] i2c: designware: add a new bit check for IC_CON control
Date:   Tue, 24 Jan 2023 15:36:50 +0530
Message-ID: <20230124100650.1327656-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT031:EE_|BL1PR12MB5850:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d338412-4271-499f-71d3-08dafdf2c626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vdEWosInnRYEvHF0zhjcILm9ehZyAC56i0FhpzGjTqKAuXUmthrcWwAZNQH7GN+yqPSqBqfab49KKa37W7iW47DFS8cq6wjdCcWKkmmROvpMp6K+LQwWj9B2lQwLQQ1C3LJfYpQ0Ks7OGObGjW7ztCI50TFuxOcQGRVmeGndgjy0Kq3S1KCNgA34gNmZIpc+C/dF0wMyPuPpaBjjdyDc7rXosMYpvsD64StODIrzOP7X3so6aKWWwRkL5SKDfiPed7fX3mC4SDL1q2HJTvn30XHvN1zIH1dLKCmJszxTiFRfZoU7NMUDAS/lQ/sMREC+Rj6NySHt6AVl/+GF2YsNI/FpgzfCP/KjCnFla78mf3YBtwT12fNOJYAwUECqb2gvQRO5/zqfEjI7LzjpelPsjQaLTY4PBQXTHXgURGFFN/mpeDhajl00u2o1vJNabesdb6eYSYJM/L9mcGIV/db0yZrVVSwNzMit0bXVb0JktPYZ2aJKKJ2ICj/dnaZB7bEzEQnSVei6Nj9YjTlTg3jQcdSWieSrGY7+m4YMSpTAaBApwdzrkNQyHLj+Woi5ffBznWU2a6xq4G2+4t1ds46BQBRSMc1othA8nEp3ItezkoAQaxawGed/bP+qwFnN6MkHCQCo2W2FzbSjX8aDu4O/LMYFLBak0BoaaN1zmKYKqDXnwZILkzO/4+ZbupdCzOVIlu437EktUXjPsotAAfxrUCMJ0N8KQrlr19swkdTbBRA=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(46966006)(36840700001)(40470700004)(36756003)(40460700003)(86362001)(40480700001)(7696005)(478600001)(110136005)(316002)(54906003)(6666004)(5660300002)(2906002)(70586007)(70206006)(8676002)(4326008)(8936002)(41300700001)(81166007)(36860700001)(356005)(1076003)(82740400003)(82310400005)(2616005)(83380400001)(26005)(186003)(16526019)(336012)(47076005)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 10:07:17.3886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d338412-4271-499f-71d3-08dafdf2c626
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5850
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

Hence add a check in i2c_dw_probe_master() that if the BIOS
advertises the bus clear feature, let driver not ignore it and
adapt accordingly.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
v2->v3:
- Use regmap_read() instead of ioread32()
- Move the proposed changes to i2c_dw_probe_master() and protect the
  regmap read calls with acquire/release lock calls.

v1->v2:
- Update the commit message

 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

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
index 45f569155bfe..5db71e0a424a 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -865,6 +865,7 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_adapter *adap = &dev->adapter;
 	unsigned long irq_flags;
+	u32 ic_con;
 	int ret;
 
 	init_completion(&dev->cmd_complete);
@@ -884,6 +885,24 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
+	/*
+	 * On AMD platforms BIOS advertises the bus clear feature
+	 * and enables the SCL/SDA stuck low. SMU FW does the
+	 * bus recovery process. Driver should not ignore this BIOS
+	 * advertisement of bus clear feature.
+	 */
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(dev->map, DW_IC_CON, &ic_con);
+	i2c_dw_release_lock(dev);
+	if (ret)
+		return ret;
+
+	if (ic_con & DW_IC_CON_BUS_CLEAR_CTRL)
+		dev->master_cfg |= DW_IC_CON_BUS_CLEAR_CTRL;
+
 	ret = dev->init(dev);
 	if (ret)
 		return ret;
-- 
2.25.1

