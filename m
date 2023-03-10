Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 370896B52B2
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 22:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231338AbjCJVWf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 16:22:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbjCJVWd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 16:22:33 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9ED612B678;
        Fri, 10 Mar 2023 13:22:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GA1IvTIs/VqASsfvvlHhSGqzv3niNa+dmuyP/iUqx58nrXBLXM/fZ9aE6I7Sl8PAHW0J/XLcTfrDnIVWbGc69vH2fwWuKIjXqdmJO92SIOB4VUxdZo6Mw5pstn+E++rr7vdQFAjS/yaduH65jgqq1EfR38duUm8ySEfuM0pASv7+RqS3NG8wkvUV9ei+JPrdmMMOq186o9WRoCPDm3KA19EmCiMo6qgQ1a7v70hehekOkv04pOdVIwe+HcpElzGLxDXtDHvZhALbtR9/9RKuMGfUd7vd+6Q4s25bPQs0fK4dlLs6hXGhXqjuRxmWGodIFt2JPJ+T8+wd8DdBDYs4Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6q7FD/5mu+whLXnEGkQAs5KJT9bvxS5gDy2C5Zt4ToU=;
 b=JZDBd+viJg5fsmjLlPVfASMJXAs4e6VphCTnS96ZdORcpEvXAx9fcJcD2wmihTrNkVkv+pxK9kSsZJmd7Ud0DFoaaMrnP59dOLg34SHQGtXEyR9C5cJfzXfewUd17y3YloP9U55v0B9SqX7BqtnFKi00ArMHcoSYsaZqMWz2ohiHpR710LnCWzmkS4JxEyBnFXKeNMG/Jhp1CiXmfJYdtFcmffSSKU3rKIKI4MUuTV7gECaujtWMguTZ39WGoaA+xrBEjzuG2ysW+HAjVnbOizzUsLoZdyEl3aNSRIpwc0cJIXRqMjKojdCeTvmlXXnTIvZdmL2CdvcMX2eIvAqE8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6q7FD/5mu+whLXnEGkQAs5KJT9bvxS5gDy2C5Zt4ToU=;
 b=DXmaUCB7hQAKExo8ioPNIMMjNccUM1ozY51SunQlN01OExYY3BvkjEHQvERhecW8U5uz5a/YulLVNyNgKGVMCEF32aeexKDcMU5v7d5eIkjUkojZVKj3B5rMsdxXfKP1POE2J4cBUtk7rIylyt9a6dWQ4lmDLqCdesZpCAOrXRM=
Received: from DM6PR12CA0030.namprd12.prod.outlook.com (2603:10b6:5:1c0::43)
 by CY5PR12MB6405.namprd12.prod.outlook.com (2603:10b6:930:3e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Fri, 10 Mar
 2023 21:22:28 +0000
Received: from DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::d9) by DM6PR12CA0030.outlook.office365.com
 (2603:10b6:5:1c0::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20 via Frontend
 Transport; Fri, 10 Mar 2023 21:22:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT070.mail.protection.outlook.com (10.13.173.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.20 via Frontend Transport; Fri, 10 Mar 2023 21:22:27 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 15:22:26 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        <Rijo-john.Thomas@amd.com>, <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "John Allen" <john.allen@amd.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <Felix.Held@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        "David S. Miller" <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: [PATCH v4 3/8] crypto: ccp: Move some PSP mailbox bit definitions into common header
Date:   Fri, 10 Mar 2023 15:19:46 -0600
Message-ID: <20230310211954.2490-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310211954.2490-1-mario.limonciello@amd.com>
References: <20230310211954.2490-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT070:EE_|CY5PR12MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: f051f798-07b5-4462-f918-08db21ad8cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gGC5oBDTwa9HK8SjJjrk2zTom9j12Eki4vC5UYziFBpSZAioIh/mU4HM7btARAJyEfxBWzsgbN3gsJRpbFoLP5wn+BJGn48+Mu/DOcDqjkkaG27rXbhsVFYpCwStcZsM8ebXsrCIDw/ul1L3yMkhtUn0Q6lwXxDkmmphvrzKfE/42PGS4GDJq2DmNzdh4QNRLFFM3tVrT65cAFpNku69pNczVoPNl2CFklkCh+qhcHmb4Ig+to2kT29TESE8e7aKLpt2KgC/1TS5v7mqyjiut8lE8oqN/vPQZBEIpdV5AKTup+/o1lnRBEy1ha0+wBP2weS14hPeb2U1KCmOtVHOG2RZ8kGb1WL3Ecj9g0uNOkKkgSRW6mR7WQdTt7ly3Vo5q9upPYhAzbF4FZzvpDy/3PkZRKAXONABmhMTRLE9Hda7njDl7r/xOImTMgdFNqhjT8Qe+YA/Z3FCYymBazcH2QQQixCqVvX81ti/P62Jm9vWVvs33kG02CcazibIsczahmwVlNxwDvuej8+eCcoV1R94cFs7zvy5/rAF8TefMGJNrDqAbjbcrraF31RvusBaE199tbHzStGcqY340zsvljtMQX2RNkcbvTHChgcE4a36C9q7MieA5yX9qhWZRO2QdbqnM8LQ4aSkrJ7k4njh2z7iM/jS3NYTV/0WgDF8CtRMRNpc4AQX5obqbx65UIzt/skoDoVuOmtViodWDnUetg55mActzYPCXJVxWn2/RjcXOAZ2waT0cf8BAOMsVD8h
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199018)(36840700001)(40470700004)(46966006)(478600001)(82310400005)(44832011)(186003)(7416002)(16526019)(5660300002)(83380400001)(26005)(1076003)(40480700001)(2616005)(336012)(47076005)(426003)(86362001)(36860700001)(6666004)(36756003)(15650500001)(40460700003)(356005)(2906002)(70206006)(316002)(8676002)(41300700001)(81166007)(4326008)(70586007)(82740400003)(7696005)(921005)(54906003)(8936002)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 21:22:27.8757
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f051f798-07b5-4462-f918-08db21ad8cde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT070.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6405
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some of the bits and fields used for mailboxes communicating with the
PSP are common across all mailbox implementations (SEV, TEE, etc).

Move these bits into the common `linux/psp.h` so they don't need to
be re-defined for each implementation.

Acked-by: Rijo Thomas <Rijo-john.Thomas@amd.com>
Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * Pick up tags
v2->v3:
 * Pick up tags
v1->v2:
 * Update comment to indicate it's PSP response not PSP ready
---
 drivers/crypto/ccp/psp-dev.h               |  3 ---
 drivers/crypto/ccp/sev-dev.c               | 15 +++++++--------
 drivers/crypto/ccp/sev-dev.h               |  2 +-
 drivers/crypto/ccp/tee-dev.c               | 15 ++++++++-------
 drivers/i2c/busses/i2c-designware-amdpsp.c | 16 +++++-----------
 include/linux/psp.h                        | 12 ++++++++++++
 6 files changed, 33 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/ccp/psp-dev.h b/drivers/crypto/ccp/psp-dev.h
index 06e1f317216d..55f54bb2b3fb 100644
--- a/drivers/crypto/ccp/psp-dev.h
+++ b/drivers/crypto/ccp/psp-dev.h
@@ -17,9 +17,6 @@
 
 #include "sp-dev.h"
 
-#define PSP_CMDRESP_RESP		BIT(31)
-#define PSP_CMDRESP_ERR_MASK		0xffff
-
 #define MAX_PSP_NAME_LEN		16
 
 extern struct psp_device *psp_master;
diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index 28945ca7c856..6440d35dfa4e 100644
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@ -7,6 +7,7 @@
  * Author: Brijesh Singh <brijesh.singh@amd.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/kthread.h>
@@ -103,7 +104,7 @@ static void sev_irq_handler(int irq, void *data, unsigned int status)
 
 	/* Check if it is SEV command completion: */
 	reg = ioread32(sev->io_regs + sev->vdata->cmdresp_reg);
-	if (reg & PSP_CMDRESP_RESP) {
+	if (FIELD_GET(PSP_CMDRESP_RESP, reg)) {
 		sev->int_rcvd = 1;
 		wake_up(&sev->int_queue);
 	}
@@ -347,9 +348,7 @@ static int __sev_do_cmd_locked(int cmd, void *data, int *psp_ret)
 
 	sev->int_rcvd = 0;
 
-	reg = cmd;
-	reg <<= SEV_CMDRESP_CMD_SHIFT;
-	reg |= SEV_CMDRESP_IOC;
+	reg = FIELD_PREP(SEV_CMDRESP_CMD, cmd) | SEV_CMDRESP_IOC;
 	iowrite32(reg, sev->io_regs + sev->vdata->cmdresp_reg);
 
 	/* wait for command completion */
@@ -367,11 +366,11 @@ static int __sev_do_cmd_locked(int cmd, void *data, int *psp_ret)
 	psp_timeout = psp_cmd_timeout;
 
 	if (psp_ret)
-		*psp_ret = reg & PSP_CMDRESP_ERR_MASK;
+		*psp_ret = FIELD_GET(PSP_CMDRESP_STS, reg);
 
-	if (reg & PSP_CMDRESP_ERR_MASK) {
-		dev_dbg(sev->dev, "sev command %#x failed (%#010x)\n",
-			cmd, reg & PSP_CMDRESP_ERR_MASK);
+	if (FIELD_GET(PSP_CMDRESP_STS, reg)) {
+		dev_dbg(sev->dev, "sev command %#x failed (%#010lx)\n",
+			cmd, FIELD_GET(PSP_CMDRESP_STS, reg));
 		ret = -EIO;
 	} else {
 		ret = sev_write_init_ex_file_if_required(cmd);
diff --git a/drivers/crypto/ccp/sev-dev.h b/drivers/crypto/ccp/sev-dev.h
index 666c21eb81ab..778c95155e74 100644
--- a/drivers/crypto/ccp/sev-dev.h
+++ b/drivers/crypto/ccp/sev-dev.h
@@ -25,8 +25,8 @@
 #include <linux/miscdevice.h>
 #include <linux/capability.h>
 
+#define SEV_CMDRESP_CMD			GENMASK(26, 16)
 #define SEV_CMD_COMPLETE		BIT(1)
-#define SEV_CMDRESP_CMD_SHIFT		16
 #define SEV_CMDRESP_IOC			BIT(0)
 
 struct sev_misc_dev {
diff --git a/drivers/crypto/ccp/tee-dev.c b/drivers/crypto/ccp/tee-dev.c
index f24fc953718a..5560bf8329a1 100644
--- a/drivers/crypto/ccp/tee-dev.c
+++ b/drivers/crypto/ccp/tee-dev.c
@@ -8,6 +8,7 @@
  * Copyright (C) 2019,2021 Advanced Micro Devices, Inc.
  */
 
+#include <linux/bitfield.h>
 #include <linux/types.h>
 #include <linux/mutex.h>
 #include <linux/delay.h>
@@ -69,7 +70,7 @@ static int tee_wait_cmd_poll(struct psp_tee_device *tee, unsigned int timeout,
 
 	while (--nloop) {
 		*reg = ioread32(tee->io_regs + tee->vdata->cmdresp_reg);
-		if (*reg & PSP_CMDRESP_RESP)
+		if (FIELD_GET(PSP_CMDRESP_RESP, *reg))
 			return 0;
 
 		usleep_range(10000, 10100);
@@ -149,9 +150,9 @@ static int tee_init_ring(struct psp_tee_device *tee)
 		goto free_buf;
 	}
 
-	if (reg & PSP_CMDRESP_ERR_MASK) {
-		dev_err(tee->dev, "tee: ring init command failed (%#010x)\n",
-			reg & PSP_CMDRESP_ERR_MASK);
+	if (FIELD_GET(PSP_CMDRESP_STS, reg)) {
+		dev_err(tee->dev, "tee: ring init command failed (%#010lx)\n",
+			FIELD_GET(PSP_CMDRESP_STS, reg));
 		tee_free_ring(tee);
 		ret = -EIO;
 	}
@@ -179,9 +180,9 @@ static void tee_destroy_ring(struct psp_tee_device *tee)
 	ret = tee_wait_cmd_poll(tee, TEE_DEFAULT_TIMEOUT, &reg);
 	if (ret) {
 		dev_err(tee->dev, "tee: ring destroy command timed out\n");
-	} else if (reg & PSP_CMDRESP_ERR_MASK) {
-		dev_err(tee->dev, "tee: ring destroy command failed (%#010x)\n",
-			reg & PSP_CMDRESP_ERR_MASK);
+	} else if (FIELD_GET(PSP_CMDRESP_STS, reg)) {
+		dev_err(tee->dev, "tee: ring destroy command failed (%#010lx)\n",
+			FIELD_GET(PSP_CMDRESP_STS, reg));
 	}
 
 free_ring:
diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 80f28a1bbbef..652e6b64bd5f 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -25,12 +25,6 @@
 #define PSP_I2C_REQ_STS_BUS_BUSY	0x1
 #define PSP_I2C_REQ_STS_INV_PARAM	0x3
 
-#define PSP_MBOX_FIELDS_STS		GENMASK(15, 0)
-#define PSP_MBOX_FIELDS_CMD		GENMASK(23, 16)
-#define PSP_MBOX_FIELDS_RESERVED	GENMASK(29, 24)
-#define PSP_MBOX_FIELDS_RECOVERY	BIT(30)
-#define PSP_MBOX_FIELDS_READY		BIT(31)
-
 struct psp_req_buffer_hdr {
 	u32 total_size;
 	u32 status;
@@ -99,15 +93,15 @@ static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
 
 	tmp = readl(&mbox->cmd_fields);
 
-	return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
+	return FIELD_GET(PSP_CMDRESP_RECOVERY, tmp);
 }
 
 static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
 {
 	u32 tmp, expected;
 
-	/* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
-	expected = FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
+	/* Expect mbox_cmd to be cleared and the response bit to be set by PSP */
+	expected = FIELD_PREP(PSP_CMDRESP_RESP, 1);
 
 	/*
 	 * Check for readiness of PSP mailbox in a tight loop in order to
@@ -124,7 +118,7 @@ static u32 psp_check_mbox_sts(struct psp_mbox __iomem *mbox)
 
 	cmd_reg = readl(&mbox->cmd_fields);
 
-	return FIELD_GET(PSP_MBOX_FIELDS_STS, cmd_reg);
+	return FIELD_GET(PSP_CMDRESP_STS, cmd_reg);
 }
 
 static int psp_send_cmd(struct psp_i2c_req *req)
@@ -148,7 +142,7 @@ static int psp_send_cmd(struct psp_i2c_req *req)
 	writeq(req_addr, &mbox->i2c_req_addr);
 
 	/* Write command register to trigger processing */
-	cmd_reg = FIELD_PREP(PSP_MBOX_FIELDS_CMD, PSP_I2C_REQ_BUS_CMD);
+	cmd_reg = FIELD_PREP(PSP_CMDRESP_CMD, PSP_I2C_REQ_BUS_CMD);
 	writel(cmd_reg, &mbox->cmd_fields);
 
 	if (psp_wait_cmd(mbox))
diff --git a/include/linux/psp.h b/include/linux/psp.h
index 202162487ec3..d3424790a70e 100644
--- a/include/linux/psp.h
+++ b/include/linux/psp.h
@@ -11,4 +11,16 @@
 #define __psp_pa(x)	__pa(x)
 #endif
 
+/*
+ * Fields and bits used by most PSP mailboxes
+ *
+ * Note: Some mailboxes (such as SEV) have extra bits or different meanings
+ * and should include an appropriate local definition in their source file.
+ */
+#define PSP_CMDRESP_STS		GENMASK(15, 0)
+#define PSP_CMDRESP_CMD		GENMASK(23, 16)
+#define PSP_CMDRESP_RESERVED	GENMASK(29, 24)
+#define PSP_CMDRESP_RECOVERY	BIT(30)
+#define PSP_CMDRESP_RESP	BIT(31)
+
 #endif /* __PSP_H */
-- 
2.34.1

