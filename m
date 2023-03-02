Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 734426A89AB
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Mar 2023 20:43:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbjCBTnj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Mar 2023 14:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjCBTnb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Mar 2023 14:43:31 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF3818163;
        Thu,  2 Mar 2023 11:43:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XDTF+TrUFc01ffxJ7CP6AYFSdnhTkPP8rjJKtnaCOYlwFr2J1ZNnWAlthiCN0yaVXVEzTJxdHz2w015kS8w+v03ITj8PclOBfXv7xr2GilMmEHj95nELgsyHoTBPWniYyNEmKLTQcwOFr58rLytA9g1EwshMRWynhz0oVIW0UICgAxPghZ3UBWznvmzIdLAOkaGIXCUz+MGgUpPCDVBDC0nDDjuxis8jzS7kU9x5w3DTKGrzOQj3zhIpQ0mLgng+Boqg1nwzacyZOQ7kjuEpcDq6m2BHnE0XHG9DLPtrqHNBRK7OklFrKj8sdzkmoADpgALL1vEvmIC9daPoq8ED1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ldva1U0FnDIt0vo0SYbmtaF6GlGPv+WeONvDG7Udos=;
 b=CExmR0iVYlRacuT6r64HtGbF0LHcM8pNx/hu9JdfUcMq32cGBxU1nY0AhtIIzOy+T8LdjQ5v1/q/BMJ73CgTRXGgsiqBczJLCESgL01b4d4pnIWUn/HNoFahOEio4t6v4ok7/L0ciPvYmJ9VSiLbA1E4vv8Vmr+WiSozqL2VeKU6uOtQmfUO3SFf+sE5HNwP4IKjnf4f2e6ajXAjOtlCJfYuLDcQuLOls9QM2vOiEcOixswsf9QGRwxZCojuTjh4Ft73hY6U2JZXJ8z8qACLKJDDEl1pS5U6mBRDFK7Skdzp531mAn3rmmibRE5hffY9ECzvGc4ZntxQvFv18rYnxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ldva1U0FnDIt0vo0SYbmtaF6GlGPv+WeONvDG7Udos=;
 b=2JF2+apJQGbQKLutFsbpJY8j/Lmn+3ejCtX87uRdoD4iDju7datYTxn5wtxbg8lFdIdCMAe1zY6t40R+jtj3LHmvfzVp+rJVw8nCFYHfvqzlr1utvaCHB451hSXighjsBVB6arFMCsvlDcX1HNhSMgHjqr/zbGkr7mVT1GVu8Fg=
Received: from BN9PR03CA0914.namprd03.prod.outlook.com (2603:10b6:408:107::19)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Thu, 2 Mar
 2023 19:43:17 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::22) by BN9PR03CA0914.outlook.office365.com
 (2603:10b6:408:107::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Thu, 2 Mar 2023 19:43:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.21 via Frontend Transport; Thu, 2 Mar 2023 19:43:16 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Mar
 2023 13:43:15 -0600
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
CC:     Mario Limonciello <mario.limonciello@amd.com>,
        "David S. Miller" <davem@davemloft.net>,
        <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: [PATCH v2 3/9] crypto: ccp: Move some PSP mailbox bit definitions into common header
Date:   Thu, 2 Mar 2023 13:42:26 -0600
Message-ID: <20230302194235.1724-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302194235.1724-1-mario.limonciello@amd.com>
References: <20230302194235.1724-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT025:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 51b50da2-7dfa-41d0-a211-08db1b565e90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pp1A/EEdg32U+etz3hOnFrOvKj+ebQE3+8bb8DEHWgRt0HmM8a0ShFlSLInd9BLjuXJ8Nz16DYzhlZbGDL91ysHqGrvMhFpbVOBhKI0FKn+DSNO3Azb426fcH0p6yCx8TsGlGI7RnGGEHN3aosIL+1YWcsG02e8vfCPJ1Hb0p6kFTbA3ECkKf01SJk5YeSRFT+nbnb1n+D63DEqAktNJQmAHXxN8RlCqH54oQbhLbaSQQp4wgXBypkD6rDaCX32Q71WnDwagLZZNMlhOU79zSyo2Jnac5t7+k9k0EMrBAEof5+e40WQzU6R3QOgA+1rvaYI00uRcBfPJ6k4yHNM0oYYyIL4zPzBEittm0pRo09gZ+9kFcKZUEbPMSQqVh0QWs4bZB6wZ+KwTRzx99+N3g67oHj0o2+X9/8QY42wxor9BRM4RZ+c8I5mYkhuHmpTekAKPiLe+fjbQARF/O44FhmN5JA8lC23g52j+3+21dt99HTCrUkGRGJHdxQOFOztMrOXlaqJjdzFdSuVdcgFHPqdQ6yoWLMzmEQvHEN45XtD265RjpRuxT4fHUtYiSFoHNReovUQ3BhGCcWoCHlOe4fRZlTWjUennM6mz/CvEsJcJ9Q4LTKdxV6s65cOiVUQnOpm7wRgLBa3zEi3sUGRZcy4dWGbmEdyQ5ALGaKY5HWWx5HbgJxySa1ADNXdEdUwKJUFBp1FYgnL3P6hVNJ3J1dPMmvDHSJ06goNMGDoFSRRmvedmh/9VkKKhnmwjJL+g
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199018)(36840700001)(46966006)(40470700004)(82740400003)(2906002)(15650500001)(316002)(4326008)(478600001)(83380400001)(921005)(82310400005)(40460700003)(44832011)(7416002)(36756003)(5660300002)(86362001)(40480700001)(36860700001)(70206006)(356005)(8676002)(54906003)(81166007)(110136005)(41300700001)(70586007)(7696005)(6666004)(8936002)(47076005)(426003)(2616005)(16526019)(1076003)(336012)(26005)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 19:43:16.9950
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51b50da2-7dfa-41d0-a211-08db1b565e90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some of the bits and fields used for mailboxes communicating with the
PSP are common across all mailbox implementations (SEV, TEE, etc).

Move these bits into the common `linux/psp.h` so they don't need to
be re-defined for each implementation.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
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

