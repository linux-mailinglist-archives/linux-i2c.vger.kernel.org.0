Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61365691383
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 23:38:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230436AbjBIWiy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 17:38:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbjBIWip (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 17:38:45 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2049.outbound.protection.outlook.com [40.107.93.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F6945B741;
        Thu,  9 Feb 2023 14:38:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYqk+q9SXgfZ/oBaNoAwWQzqqdvVljpBMxluDpDFayrZg/uuhS+mYG+weexlgbcjacUGIZfDRdiPp0xlyu24VNHko+Tn/AWoouBTRP42PFddBxyqQyK7qs2+oCJsL1mQ1Ump9ORtRLHEIAMAnw5ydVv4KcJdm+rvz6vZrvximolHWsVr9PeY8szlagNiQEAmv04dX6GbZSlDP37eEHnnmXooH6G7L4pL40DtHUCzXnuAA1I6Z05yj+YY7isgdhayLi1IEEA3WqMqyZGJJ01kQdmHUD5A83d/Mw32wHUFV4rjgjPtt/VCFgHetTWLu0b5EiuJBC7GSBUZ9QLQF6pdWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R8hFz63hgO8+POp8dkPJbWrXjVUvk3qiCntz1kWc8b4=;
 b=BMgIeh84iO8Mhqjbba/0jM+/Dcg2fGUPbsYhQarhglVD7ay/H30tGv1H8q+WLlAgE2knY+U9FalLwTWsrWYEy6vuaoOMCXpCth69/3n8rssTQ7+jJgh3hzKkTUMa4d5N+zAhrKEesnRrhBZZRnOKOydioV/gjWomp2W+Sy3ClxJw8j36ddp9eRN+11OOeocnajH2ZytFZdox78K2s7haD/pa60ucFlMPcuzI2D2pJnj8rAdaOjjpTGD6YmWLStgURzMuD5evT/hJsKygFbwC5c7OrSF105lNPmAfEVlU2tz2gUedXhhQFboyowU6STANM2gq89V72wThmUjoooGKUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R8hFz63hgO8+POp8dkPJbWrXjVUvk3qiCntz1kWc8b4=;
 b=CKyTHKb+09PsaN74dAziE5ezdknOIsbKp1oSIjz7tX6S7xS/oYCd2ptz5ft0v4NSQIlwYrLi29n5h8eRdghkYqiU7zZRMGsSwOx7QtgBAc6MchX0pOyoR98mZ3wJQj4q2p7Iz7hUzqOUTrKRie+yXpX5CpNblkndktvqZ+FZrxI=
Received: from DM6PR02CA0082.namprd02.prod.outlook.com (2603:10b6:5:1f4::23)
 by PH7PR12MB7355.namprd12.prod.outlook.com (2603:10b6:510:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 22:38:34 +0000
Received: from DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::3a) by DM6PR02CA0082.outlook.office365.com
 (2603:10b6:5:1f4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Thu, 9 Feb 2023 22:38:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT110.mail.protection.outlook.com (10.13.173.205) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 22:38:34 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Feb
 2023 16:38:33 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        "Lendacky Thomas" <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        John Allen <john.allen@amd.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        "David S. Miller" <davem@davemloft.net>
Subject: [PATCH 3/6] crypto: ccp: Move some PSP mailbox bit definitions into common header
Date:   Thu, 9 Feb 2023 16:38:05 -0600
Message-ID: <20230209223811.4993-4-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT110:EE_|PH7PR12MB7355:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d845270-9cc8-4e5a-0818-08db0aee60c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QplvDRtgg+6+VGDqYpCBWpZ5gJ664Iy7SYayfYFBeq61D9+DWAxRBrN3wuho6+bO2iXljXRlqB6LM1oabAIZZpjwIeHW+VSQz0c/X5b6TsWyLSmYT8htwmYxRyYntwGk00cPrxVJxtYzxrLlmV+Oi2Vn25yFc/H4h4+0vBY0s9Lj3hYLcZI7M1n5HRDUrSOzM6nLuQV0RkOUqGEdWX5x4vFyUQIjhX3CCwLC/JzQrrr/rMydiMYc7fwdw5WWdXZmN6bkhGaRtH+oChvTqU8lmWjTwuM1MZD33gSHuCyl6TZUV6psWTKqGel0cMB3dxcYEKjUe9OBix25da1lPJ5ubDLk4mD053h84XUUsZxgEyOZYDiSoj2b36sNRoqeZkX7Gqspu3e3j8P6WIBl0BQ++pvBQqI15HgC6M9+l9b0VV+kagCp2e/hke1xg4f+Rhl382mHgCmfct0slgktqeAjqDBFzpgyQQAH31eQOZ6s54lYfzJ+fuiJjSDfL19+4UmX9YTvJCMjZ/dMsN+8CDvt4B3DVMeBr6gVPbu1Ee0nIV8OAtwBYf0k6mmevtfTvjal1We+nwXWnTxVCiqm5JPrFsWKO4jt5o3MVKiIj5kk0fq7m2BLOdykx6/5xHdLZa41uD/jozamRn/TfhxDQW71O07Ha0l+/aWwt/HLHHjMJ5LthXMmx2/wyxKca0yH8l3YFs8iSUPDt7dl4FDcpirbalVdEfHsKMSIjihyyoj6d3Roh5nto+uQBsqd4f1Qu1zs
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(376002)(39860400002)(136003)(346002)(451199018)(46966006)(40470700004)(36840700001)(83380400001)(110136005)(82310400005)(86362001)(54906003)(186003)(26005)(7696005)(336012)(426003)(47076005)(36756003)(40480700001)(7416002)(16526019)(40460700003)(2906002)(8936002)(15650500001)(44832011)(36860700001)(5660300002)(70586007)(8676002)(41300700001)(70206006)(4326008)(6666004)(478600001)(2616005)(1076003)(82740400003)(356005)(81166007)(921005)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 22:38:34.4451
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d845270-9cc8-4e5a-0818-08db0aee60c5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7355
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
 drivers/crypto/ccp/psp-dev.h               |  3 ---
 drivers/crypto/ccp/sev-dev.c               | 15 +++++++--------
 drivers/crypto/ccp/sev-dev.h               |  2 +-
 drivers/crypto/ccp/tee-dev.c               | 15 ++++++++-------
 drivers/i2c/busses/i2c-designware-amdpsp.c | 14 ++++----------
 include/linux/psp.h                        | 12 ++++++++++++
 6 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/crypto/ccp/psp-dev.h b/drivers/crypto/ccp/psp-dev.h
index 06e1f317216d2..55f54bb2b3fba 100644
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
index 28945ca7c8563..6440d35dfa4ee 100644
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
index 666c21eb81ab3..778c95155e745 100644
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
index f24fc953718a0..5560bf8329a12 100644
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
index 80f28a1bbbef6..85d91cb6b9056 100644
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
@@ -99,7 +93,7 @@ static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
 
 	tmp = readl(&mbox->cmd_fields);
 
-	return FIELD_GET(PSP_MBOX_FIELDS_RECOVERY, tmp);
+	return FIELD_GET(PSP_CMDRESP_RECOVERY, tmp);
 }
 
 static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
@@ -107,7 +101,7 @@ static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
 	u32 tmp, expected;
 
 	/* Expect mbox_cmd to be cleared and ready bit to be set by PSP */
-	expected = FIELD_PREP(PSP_MBOX_FIELDS_READY, 1);
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
index 202162487ec3b..d3424790a70eb 100644
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

