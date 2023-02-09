Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B60269137F
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 23:38:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbjBIWiu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 17:38:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230402AbjBIWip (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 17:38:45 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CE7160D49;
        Thu,  9 Feb 2023 14:38:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mG328BDZQdWJCnktP+5rEvKEtSwFq9W28k5pBizHsL9CwL4RtWAInC8MLOeR+CV452G0d8GAkKXF2JESEzK3jo81N196ZTAEuxXYFB52ECb6oNr1wR/0xT3jDMSejqGNk3OXzlA+2O5+eLcfvFoVMyTKGRJ8ExjVoWeBjpnmdZRCE2q4BmtdNgXk5QpLQm4+Lb7yInx8lFxhi83kzrcrW6wVd7xut1X7IgLWpRimsrOGeYKEwrDF7+uU2qBgrL5hTt2ypeJyUAMcOOQIL02HDbIpTBwVUkzXAXJSv7Cvpo1P0RwzFRgIQpWnV8hAzGOeVgZLmP49JYk7AEWo+ptO7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C9qnQtcHYlxKhIJk5LC1e/eVODtX66bQnfF7jFH02nU=;
 b=jVj1XyzyG/iE/09UvajxNae0VqZ39nPCHHCq7xvWMyTRqY522xIG7u6ypJSydJ31S7ZGi0Ei/OYj0w45OKw0wWIplxuRrHFOCb4sDNjeX8xGn+jZhRw77w4JznLG1JGJoZs0r4wqGa0AAhEERqDkadLoDQLQM6XIDlHvkvLYw/fKHmLEGFnVqCiiJb/NzzlI7S/mp3dTZHishC9FNYnV6EU+LmkRxz8QeM0ItAuYR2axjT8kIzRLADwXUlPYnoxmgJgwBEffrYB6VANcIriXesfNwBaYCt7FXDn8+lMs16BWbl5maChZIR2ZLM5VrBDSeTG79BK9i0cN6ahNi1E8Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C9qnQtcHYlxKhIJk5LC1e/eVODtX66bQnfF7jFH02nU=;
 b=hH5Y9KMhkNZHo5DtzSwZ0eCJRxzim2JprYMWeZ5p0ox4OQeW4rJ5hdK+M8sriLL6VwmY3jARXDsCNezcqT+lOj/lc84pxaEl/86lroWTJLm2PDEpD7fRd7rg6lGGHgDH4Fttd6YXwuvtXCnJB1P3OAmUN3xAJTVdLWZRH7KBc78=
Received: from DS7PR03CA0153.namprd03.prod.outlook.com (2603:10b6:5:3b2::8) by
 MN0PR12MB5762.namprd12.prod.outlook.com (2603:10b6:208:375::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 22:38:37 +0000
Received: from DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::7b) by DS7PR03CA0153.outlook.office365.com
 (2603:10b6:5:3b2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17 via Frontend
 Transport; Thu, 9 Feb 2023 22:38:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT051.mail.protection.outlook.com (10.13.172.243) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 22:38:36 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Feb
 2023 16:38:35 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        "Lendacky Thomas" <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        John Allen <john.allen@amd.com>
CC:     <andriy.shevchenko@linux.intel.com>, <linux-i2c@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Mario Limonciello" <mario.limonciello@amd.com>,
        "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 4/6] crypto: ccp: Add support for an interface for platform features
Date:   Thu, 9 Feb 2023 16:38:06 -0600
Message-ID: <20230209223811.4993-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209223811.4993-1-mario.limonciello@amd.com>
References: <20230209223811.4993-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT051:EE_|MN0PR12MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: 4022432e-001f-492b-b69b-08db0aee6220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TLkAZCXimThTcz7/dlmGZoXrQ3vg9OPECh434BKduiiC8JkCampWuWbdc+WOJaxJ9OuLq2IXjBFEDEcdk6dUmgqB11yysOwbKBlLJl7mHsqb3K+T69uL3fO4j8+TjlYSlm5oPwjvBa9FjoPwomims3gWdC98O0X2gOA2u2YOy9KPKfYd9wYCvQk/nyzbTCesy9OrAGKB2n9COh9k5fDIaFyAkrFCLnNBpSh+eKlU05xitpcWPrLPKpwIxtEkU4AO1txk5HaS/dplPCI8XQPtkONQb62AN6KdDF+3M2aV6hHLRsFMURXcfoh8mLpsptyI7j281AG2YBGWybQ8GJPJoLSK1Qe70zZBm2YXTZBB1taAtu3tXP1cl5CNbjGEBLTOLQ8+MviF71SKGjgpAMk164G4iRTU6NSnZrE3j+YrKKsXA76iOjgLOU8xC6+pT9CnB7cjDxnU5Wp77H+1d61pjT4NvwZSN6tiUywc/X6Eqro+Bm7BvT5WRpjipq09SWjKu6g+HShUJCKMFgwcSq4xe1ETn2gu1Q36RNmxFZpVkHc3/vfB18i1WK+jOp7Z7PtnVM25CnWvNZSH+1zFyVbvU/V5HQOeePixPoORO0usMaPl67Y7tNLs3vI8t2FqZvTZGs/xk/oQDyiKcY9N8pP9pmC2NJfudjAUeBStGl1fqOn39Nnrx8uQCDCaUqdrPR1niXhLrAvK34KFwZ93VSVOa6TAe7O7ey1mugln8Z8OCxAWjJEWMiTw0ZOgVlhoPFXcJRyJNJUTFJVbFvYyAVIZDQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199018)(46966006)(36840700001)(40470700004)(8936002)(2906002)(2616005)(336012)(426003)(186003)(83380400001)(40460700003)(47076005)(316002)(478600001)(54906003)(8676002)(4326008)(7696005)(70206006)(70586007)(6636002)(26005)(110136005)(1076003)(40480700001)(6666004)(44832011)(30864003)(16526019)(41300700001)(356005)(5660300002)(82740400003)(36756003)(86362001)(82310400005)(36860700001)(81166007)(36900700001)(134885004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 22:38:36.7081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4022432e-001f-492b-b69b-08db0aee6220
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT051.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5762
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some platforms with a PSP support an interface for features that
interact directly with the PSP instead of through a SEV or TEE
environment.

Initialize this interface so that other drivers can consume it.
These drivers may either be subdrivers for the ccp module or
external modules.  For external modules, export a symbol for them
to utilize.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/crypto/ccp/Makefile          |   3 +-
 drivers/crypto/ccp/platform-access.c | 166 +++++++++++++++++++++++++++
 drivers/crypto/ccp/platform-access.h |  34 ++++++
 drivers/crypto/ccp/psp-dev.c         |  17 +++
 drivers/crypto/ccp/psp-dev.h         |   1 +
 drivers/crypto/ccp/sp-dev.h          |   7 ++
 include/linux/psp-platform-access.h  |  49 ++++++++
 7 files changed, 276 insertions(+), 1 deletion(-)
 create mode 100644 drivers/crypto/ccp/platform-access.c
 create mode 100644 drivers/crypto/ccp/platform-access.h
 create mode 100644 include/linux/psp-platform-access.h

diff --git a/drivers/crypto/ccp/Makefile b/drivers/crypto/ccp/Makefile
index db362fe472ea3..f6196495e862d 100644
--- a/drivers/crypto/ccp/Makefile
+++ b/drivers/crypto/ccp/Makefile
@@ -10,7 +10,8 @@ ccp-$(CONFIG_CRYPTO_DEV_CCP_DEBUGFS) += ccp-debugfs.o
 ccp-$(CONFIG_PCI) += sp-pci.o
 ccp-$(CONFIG_CRYPTO_DEV_SP_PSP) += psp-dev.o \
                                    sev-dev.o \
-                                   tee-dev.o
+                                   tee-dev.o \
+                                   platform-access.o
 
 obj-$(CONFIG_CRYPTO_DEV_CCP_CRYPTO) += ccp-crypto.o
 ccp-crypto-objs := ccp-crypto-main.o \
diff --git a/drivers/crypto/ccp/platform-access.c b/drivers/crypto/ccp/platform-access.c
new file mode 100644
index 0000000000000..8cd165ba915b9
--- /dev/null
+++ b/drivers/crypto/ccp/platform-access.c
@@ -0,0 +1,166 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * AMD Platform Security Processor (PSP) Platform Access interface
+ *
+ * Copyright (C) 2023 Advanced Micro Devices, Inc.
+ *
+ * Author: Mario Limonciello <mario.limonciello@amd.com>
+ *
+ * Some of this code is adapted from drivers/i2c/busses/i2c-designware-amdpsp.c
+ * developed by Jan Dabros <jsd@semihalf.com> and Copyright (C) 2022 Google Inc.
+ *
+ */
+
+#include <linux/bitfield.h>
+#include <linux/errno.h>
+#include <linux/iopoll.h>
+#include <linux/mutex.h>
+
+#include "platform-access.h"
+
+#define PSP_CMD_TIMEOUT_US	(500 * USEC_PER_MSEC)
+
+/* Recovery field should be equal 0 to start sending commands */
+static int check_recovery(u32 __iomem *cmd)
+{
+	return FIELD_GET(PSP_CMDRESP_RECOVERY, ioread32(cmd));
+}
+
+static int wait_cmd(u32 __iomem *cmd)
+{
+	u32 tmp, expected;
+
+	/* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
+	expected = FIELD_PREP(PSP_CMDRESP_RESP, 1);
+
+	/*
+	 * Check for readiness of PSP mailbox in a tight loop in order to
+	 * process further as soon as command was consumed.
+	 */
+	return readl_poll_timeout(cmd, tmp, (tmp & expected), 0,
+				  PSP_CMD_TIMEOUT_US);
+}
+
+int psp_check_platform_access_status(void)
+{
+	struct psp_device *psp = psp_get_master_device();
+
+	if (!psp || !psp->platform_access_data)
+		return -ENODEV;
+
+	return 0;
+}
+EXPORT_SYMBOL(psp_check_platform_access_status);
+
+int psp_send_platform_access_msg(enum psp_platform_access_msg msg,
+				 struct psp_request *req)
+{
+	struct psp_device *psp = psp_get_master_device();
+	u32 __iomem *cmd, __iomem *lo, __iomem *hi;
+	struct psp_platform_access_device *pa_dev;
+	phys_addr_t req_addr;
+	u32 cmd_reg;
+	int ret;
+
+	if (!psp || !psp->platform_access_data)
+		return -ENODEV;
+
+	pa_dev = psp->platform_access_data;
+	cmd = psp->io_regs + pa_dev->vdata->cmdresp_reg;
+	lo = psp->io_regs + pa_dev->vdata->cmdbuff_addr_lo_reg;
+	hi = psp->io_regs + pa_dev->vdata->cmdbuff_addr_hi_reg;
+
+	mutex_lock(&pa_dev->mutex);
+
+	if (check_recovery(cmd)) {
+		dev_dbg(psp->dev, "in recovery\n");
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	if (wait_cmd(cmd)) {
+		dev_dbg(psp->dev, "not done processing command\n");
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	/*
+	 * Fill mailbox with address of command-response buffer, which will be
+	 * used for sending i2c requests as well as reading status returned by
+	 * PSP. Use physical address of buffer, since PSP will map this region.
+	 */
+	req_addr = __psp_pa(req);
+	iowrite32(lower_32_bits(req_addr), lo);
+	iowrite32(upper_32_bits(req_addr), hi);
+
+	print_hex_dump_debug("->psp ", DUMP_PREFIX_OFFSET, 16, 2, req,
+			     req->header.payload_size, false);
+
+	/* Write command register to trigger processing */
+	cmd_reg = FIELD_PREP(PSP_CMDRESP_CMD, msg);
+	iowrite32(cmd_reg, cmd);
+
+	if (wait_cmd(cmd)) {
+		ret = -ETIMEDOUT;
+		goto unlock;
+	}
+
+	/* Ensure it was triggered by this driver */
+	if (ioread32(lo) != lower_32_bits(req_addr) ||
+	    ioread32(hi) != upper_32_bits(req_addr)) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+
+	/* Store the status in request header for caller to investigate */
+	cmd_reg = ioread32(cmd);
+	req->header.status = FIELD_GET(PSP_CMDRESP_STS, cmd_reg);
+	if (req->header.status) {
+		ret = -EIO;
+		goto unlock;
+	}
+
+	print_hex_dump_debug("<-psp ", DUMP_PREFIX_OFFSET, 16, 2, req,
+			     req->header.payload_size, false);
+
+	ret = 0;
+
+unlock:
+	mutex_unlock(&pa_dev->mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(psp_send_platform_access_msg);
+
+void platform_access_dev_destroy(struct psp_device *psp)
+{
+	struct psp_platform_access_device *pa_dev = psp->platform_access_data;
+
+	if (!pa_dev)
+		return;
+
+	mutex_destroy(&pa_dev->mutex);
+	psp->platform_access_data = NULL;
+}
+
+int platform_access_dev_init(struct psp_device *psp)
+{
+	struct device *dev = psp->dev;
+	struct psp_platform_access_device *pa_dev;
+
+	pa_dev = devm_kzalloc(dev, sizeof(*pa_dev), GFP_KERNEL);
+	if (!pa_dev)
+		return -ENOMEM;
+
+	psp->platform_access_data = pa_dev;
+	pa_dev->psp = psp;
+	pa_dev->dev = dev;
+
+	pa_dev->vdata = (struct platform_access_vdata *)psp->vdata->platform_access;
+
+	mutex_init(&pa_dev->mutex);
+
+	dev_dbg(dev, "platform access enabled\n");
+
+	return 0;
+}
diff --git a/drivers/crypto/ccp/platform-access.h b/drivers/crypto/ccp/platform-access.h
new file mode 100644
index 0000000000000..56bc8eabeacc8
--- /dev/null
+++ b/drivers/crypto/ccp/platform-access.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * AMD Platform Security Processor (PSP) Platform Access interface
+ *
+ * Copyright (C) 2023 Advanced Micro Devices, Inc.
+ *
+ * Author: Mario Limonciello <mario.limonciello@amd.com>
+ */
+
+#ifndef __PSP_PLATFORM_ACCESS_H__
+#define __PSP_PLATFORM_ACCESS_H__
+
+#include <linux/device.h>
+#include <linux/miscdevice.h>
+#include <linux/mutex.h>
+#include <linux/psp-platform-access.h>
+
+#include "psp-dev.h"
+
+struct psp_platform_access_device {
+	struct device *dev;
+	struct psp_device *psp;
+
+	struct platform_access_vdata *vdata;
+
+	struct mutex mutex;
+
+	void *platform_access_data;
+};
+
+void platform_access_dev_destroy(struct psp_device *psp);
+int platform_access_dev_init(struct psp_device *psp);
+
+#endif /* __PSP_PLATFORM_ACCESS_H__ */
diff --git a/drivers/crypto/ccp/psp-dev.c b/drivers/crypto/ccp/psp-dev.c
index cd8d1974726a8..ec98f19800de7 100644
--- a/drivers/crypto/ccp/psp-dev.c
+++ b/drivers/crypto/ccp/psp-dev.c
@@ -14,6 +14,7 @@
 #include "psp-dev.h"
 #include "sev-dev.h"
 #include "tee-dev.h"
+#include "platform-access.h"
 
 struct psp_device *psp_master;
 
@@ -102,6 +103,17 @@ static int psp_check_tee_support(struct psp_device *psp)
 	return 0;
 }
 
+static void psp_init_platform_access(struct psp_device *psp)
+{
+	int ret;
+
+	ret = platform_access_dev_init(psp);
+	if (ret) {
+		dev_warn(psp->dev, "platform access init failed: %d\n", ret);
+		return;
+	}
+}
+
 static int psp_init(struct psp_device *psp)
 {
 	int ret;
@@ -118,6 +130,9 @@ static int psp_init(struct psp_device *psp)
 			return ret;
 	}
 
+	if (psp->vdata->platform_access)
+		psp_init_platform_access(psp);
+
 	return 0;
 }
 
@@ -198,6 +213,8 @@ void psp_dev_destroy(struct sp_device *sp)
 
 	tee_dev_destroy(psp);
 
+	platform_access_dev_destroy(psp);
+
 	sp_free_psp_irq(sp, psp);
 
 	if (sp->clear_psp_master_device)
diff --git a/drivers/crypto/ccp/psp-dev.h b/drivers/crypto/ccp/psp-dev.h
index 55f54bb2b3fba..505e4bdeaca84 100644
--- a/drivers/crypto/ccp/psp-dev.h
+++ b/drivers/crypto/ccp/psp-dev.h
@@ -39,6 +39,7 @@ struct psp_device {
 
 	void *sev_data;
 	void *tee_data;
+	void *platform_access_data;
 
 	unsigned int capability;
 };
diff --git a/drivers/crypto/ccp/sp-dev.h b/drivers/crypto/ccp/sp-dev.h
index 20377e67f65df..5ec6c219a731b 100644
--- a/drivers/crypto/ccp/sp-dev.h
+++ b/drivers/crypto/ccp/sp-dev.h
@@ -53,9 +53,16 @@ struct tee_vdata {
 	const unsigned int ring_rptr_reg;
 };
 
+struct platform_access_vdata {
+	const unsigned int cmdresp_reg;
+	const unsigned int cmdbuff_addr_lo_reg;
+	const unsigned int cmdbuff_addr_hi_reg;
+};
+
 struct psp_vdata {
 	const struct sev_vdata *sev;
 	const struct tee_vdata *tee;
+	const struct platform_access_vdata *platform_access;
 	const unsigned int feature_reg;
 	const unsigned int inten_reg;
 	const unsigned int intsts_reg;
diff --git a/include/linux/psp-platform-access.h b/include/linux/psp-platform-access.h
new file mode 100644
index 0000000000000..60bfd5f0b045e
--- /dev/null
+++ b/include/linux/psp-platform-access.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __PSP_PLATFORM_ACCESS_H
+#define __PSP_PLATFORM_ACCESS_H
+
+#include <linux/psp.h>
+
+enum psp_platform_access_msg {
+	PSP_CMD_NONE = 0x0,
+};
+
+struct psp_req_buffer_hdr {
+	u32 payload_size;
+	u32 status;
+} __packed;
+
+struct psp_request {
+	struct psp_req_buffer_hdr header;
+	void *buf;
+} __packed;
+
+/**
+ * psp_send_platform_access_msg() - Send a message to control platform features
+ *
+ * This function is intended to be used by drivers outside of ccp to determine
+ * if platform features has initialized.
+ *
+ * Returns:
+ *  0:           success
+ *  -%EBUSY:     mailbox in recovery or in use
+ *  -%ENODEV:    driver not bound with PSP device
+ *  -%ETIMEDOUT: request timed out
+ *  -%EIO:       unknown error (see kernel log)
+ */
+int psp_send_platform_access_msg(enum psp_platform_access_msg, struct psp_request *req);
+
+/**
+ * psp_check_platform_access_status() - Checks whether platform features is ready
+ *
+ * This function is intended to be used by drivers outside of ccp to determine
+ * if platform features has initialized.
+ *
+ * Returns:
+ * 0          platform features is ready
+ * -%ENODEV   platform features is not ready or present
+ */
+int psp_check_platform_access_status(void);
+
+#endif /* __PSP_PLATFORM_ACCESS_H */
-- 
2.34.1

