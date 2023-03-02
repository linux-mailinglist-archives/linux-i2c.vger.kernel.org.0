Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9F1E6A89B2
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Mar 2023 20:44:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229974AbjCBToC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Mar 2023 14:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229971AbjCBTnz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Mar 2023 14:43:55 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2060f.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8a::60f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB9FB5678F;
        Thu,  2 Mar 2023 11:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mcWA7yIwqatkmoggjuMFT07hAjVfdJSAFwk6UuoqW4R1EYYx6mUGuME1H+aGSmOH0nsW/Jqf6eTXs+YeOXCXMQUicRPiTl5KGKZCIIOM7+VJGjcOR4Z5KVAWEN3MpmmyVA6hRQeP5ccyOPP4N1aaDceoLuzadDr6PudlGgt1Shohw+/RzI9Ouoxk4V4yQX8SveWOvc9LBn24S+diSHhxYgF8W0R51WILTuudIW09ZVJntQlglKA3dnWa0sD0eDY4qOFcIfyIIMoPqPc9hesLjrPUl/0sepa1ixigSCRoMsKmoktGsZ3Q0+HYlt7ZZZn9jgVhDOMbOzVg0LD7fQvoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU7eGTJHNycLv3DJQX1DQ4lVFobD1k4CUOeq1PRzxLE=;
 b=Ie35WPOVDoNmbonw23rI0rS4jTf5iN7eR965cWngHsvpU+yNZKT+kcqu2LA/tpUT6N2xAEmg8kcpqLVBmQGKUOb/uo8UzYWa0V3icxW6tj2ySdQlEyoe4bE/rpL6gn2jsGmrt81xU31/er0+xOlahN3al5klZehK0/hyPEmOC49s5ZrmotGrSAiaRVKgH4CixndMmeyDYraEX0wG39L4W4KYgSUPyhOl2gyZzDxaeFEJDTtHuTLte7bpDqp2UnByc3/A225RQ4M3lTgg1toSu9ueGCi3tlmi72ll6MVp4EwRYiDVIH75sF/qCKPWnhx0+XBkv20hWNO4Kr9BSNXQUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU7eGTJHNycLv3DJQX1DQ4lVFobD1k4CUOeq1PRzxLE=;
 b=XXionGYkdfZEuWaH3wACWq+22WSvZ98vshvkm6Vt0Tz1nHwwR0/I+KzHLFUJiLucLMfma/PoypRBvBYj4gJt3CxOrp5UFt1fxT2Aggo9jWqESjSzMAaFWbir926mSMd8j9X6799KytfhVcD962cqrb8c7Lfla8Qam9dtvR8gxNE=
Received: from BN9PR03CA0912.namprd03.prod.outlook.com (2603:10b6:408:107::17)
 by CH3PR12MB8211.namprd12.prod.outlook.com (2603:10b6:610:125::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 19:43:21 +0000
Received: from BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::32) by BN9PR03CA0912.outlook.office365.com
 (2603:10b6:408:107::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Thu, 2 Mar 2023 19:43:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT026.mail.protection.outlook.com (10.13.177.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.20 via Frontend Transport; Thu, 2 Mar 2023 19:43:21 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Mar
 2023 13:43:20 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        <Rijo-john.Thomas@amd.com>, <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Mario Limonciello <mario.limonciello@amd.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 6/9] i2c: designware: Use PCI PSP driver for communication
Date:   Thu, 2 Mar 2023 13:42:29 -0600
Message-ID: <20230302194235.1724-7-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN8NAM11FT026:EE_|CH3PR12MB8211:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a15d421-0bf7-4d8e-ed9a-08db1b566108
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mAeifIqY5BTXxsX36mrXaC7FGyc6kJb0ZPC4qwI0hAVoqH60861phnNPDtjiAgeM5cZ16YTW5fFiyKQEkfDqmd1EOM8LioTygjbG515CA0Q3CU/55QwOMPWpVVK8xd4AWq7qYfGZaWcLbpNwN010ch/OlvjX/vrvh6qqVTcD/5OFVpcF2BLqrYNiCTimx40QqTwIj5tnpSPwla6NB6JpN9Mw3/82IeA4ECEedrr6eS29YiQO1Mj0PY5fP2kqxbvGLn2ak3FCWDCNiuhaGTY+u5/P0IXuXIAfKDs5CQ5Q06caWa5LTo+iHlTdIAs36qUyFmPit0hX4pWWTm1CrYwT84mePSnX39CkIhTEI2qa4L0moWTS/wNNG3jlh+G2hwPR5x2r8Bq+w/7g5gAG5pt/j3fK2cJXO8Ju6gZTRfCA6CGcpEWpq9DUa1NpXop7ZQzBVwsAPgZlL9Rs3EHRpEGCSHukGR+pBlFtPY10KGWwqtCBabBHHgwk0aGAt81o4JzWEVoCnmICo9Cm8WZs2FGrJ/Yqm+f2imMFCfYwTWGnchPCb/iSWODRKjvb8+sPTZEfEVRd/SBmGleeDgnd9yHjQz7EmkPPVhGVuCGqbF9i1B73ou/6NWvsMv56potz/XvZFuEOPzXTv42IOH+Mu//7vIrpCB2N+HgTPLne6H20bgjPOYJ8bX6RzW+u0FOKGl0ZNLg1Lu3XlAO4UQ9194CtN83rznXE57Kqymo9rdHGtUs=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199018)(46966006)(36840700001)(40470700004)(186003)(70206006)(47076005)(426003)(70586007)(2906002)(36756003)(40480700001)(16526019)(86362001)(40460700003)(478600001)(7696005)(1076003)(26005)(110136005)(356005)(2616005)(54906003)(336012)(316002)(8936002)(41300700001)(44832011)(81166007)(5660300002)(82310400005)(82740400003)(8676002)(36860700001)(83380400001)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 19:43:21.1700
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a15d421-0bf7-4d8e-ed9a-08db1b566108
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT026.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8211
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
        SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Currently the PSP semaphore communication base address is discovered
by using an MSR that is not architecturally guaranteed for future
platforms.  Also the mailbox that is utilized for communication with
the PSP may have other consumers in the kernel, so it's better to
make all communication go through a single driver.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * Fix Kconfig to use imply
 * Use IS_REACHABLE
---
 drivers/i2c/busses/Kconfig                  |   2 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 142 ++------------------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
 include/linux/psp-platform-access.h         |   1 +
 5 files changed, 11 insertions(+), 136 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 9b8e84f20604..a24534d5877a 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -566,9 +566,9 @@ config I2C_DESIGNWARE_PLATFORM
 
 config I2C_DESIGNWARE_AMDPSP
 	bool "AMD PSP I2C semaphore support"
-	depends on X86_MSR
 	depends on ACPI
 	depends on I2C_DESIGNWARE_PLATFORM
+	imply CRYPTO_DEV_SP_PSP
 	help
 	  This driver enables managed host access to the selected I2C bus shared
 	  between AMD CPU and AMD PSP.
diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 652e6b64bd5f..105584abcf8f 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -1,11 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <linux/bitfield.h>
-#include <linux/bits.h>
 #include <linux/i2c.h>
-#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/psp-platform-access.h>
 #include <linux/psp.h>
-#include <linux/types.h>
 #include <linux/workqueue.h>
 
 #include <asm/msr.h>
@@ -13,23 +10,15 @@
 #include "i2c-designware-core.h"
 
 #define MSR_AMD_PSP_ADDR	0xc00110a2
-#define PSP_MBOX_OFFSET		0x10570
-#define PSP_CMD_TIMEOUT_US	(500 * USEC_PER_MSEC)
 
 #define PSP_I2C_RESERVATION_TIME_MS 100
 
-#define PSP_I2C_REQ_BUS_CMD		0x64
 #define PSP_I2C_REQ_RETRY_CNT		400
 #define PSP_I2C_REQ_RETRY_DELAY_US	(25 * USEC_PER_MSEC)
 #define PSP_I2C_REQ_STS_OK		0x0
 #define PSP_I2C_REQ_STS_BUS_BUSY	0x1
 #define PSP_I2C_REQ_STS_INV_PARAM	0x3
 
-struct psp_req_buffer_hdr {
-	u32 total_size;
-	u32 status;
-};
-
 enum psp_i2c_req_type {
 	PSP_I2C_REQ_ACQUIRE,
 	PSP_I2C_REQ_RELEASE,
@@ -41,119 +30,12 @@ struct psp_i2c_req {
 	enum psp_i2c_req_type type;
 };
 
-struct psp_mbox {
-	u32 cmd_fields;
-	u64 i2c_req_addr;
-} __packed;
-
 static DEFINE_MUTEX(psp_i2c_access_mutex);
 static unsigned long psp_i2c_sem_acquired;
-static void __iomem *mbox_iomem;
 static u32 psp_i2c_access_count;
 static bool psp_i2c_mbox_fail;
 static struct device *psp_i2c_dev;
 
-/*
- * Implementation of PSP-x86 i2c-arbitration mailbox introduced for AMD Cezanne
- * family of SoCs.
- */
-
-static int psp_get_mbox_addr(unsigned long *mbox_addr)
-{
-	unsigned long long psp_mmio;
-
-	if (rdmsrl_safe(MSR_AMD_PSP_ADDR, &psp_mmio))
-		return -EIO;
-
-	*mbox_addr = (unsigned long)(psp_mmio + PSP_MBOX_OFFSET);
-
-	return 0;
-}
-
-static int psp_mbox_probe(void)
-{
-	unsigned long mbox_addr;
-	int ret;
-
-	ret = psp_get_mbox_addr(&mbox_addr);
-	if (ret)
-		return ret;
-
-	mbox_iomem = ioremap(mbox_addr, sizeof(struct psp_mbox));
-	if (!mbox_iomem)
-		return -ENOMEM;
-
-	return 0;
-}
-
-/* Recovery field should be equal 0 to start sending commands */
-static int psp_check_mbox_recovery(struct psp_mbox __iomem *mbox)
-{
-	u32 tmp;
-
-	tmp = readl(&mbox->cmd_fields);
-
-	return FIELD_GET(PSP_CMDRESP_RECOVERY, tmp);
-}
-
-static int psp_wait_cmd(struct psp_mbox __iomem *mbox)
-{
-	u32 tmp, expected;
-
-	/* Expect mbox_cmd to be cleared and the response bit to be set by PSP */
-	expected = FIELD_PREP(PSP_CMDRESP_RESP, 1);
-
-	/*
-	 * Check for readiness of PSP mailbox in a tight loop in order to
-	 * process further as soon as command was consumed.
-	 */
-	return readl_poll_timeout(&mbox->cmd_fields, tmp, (tmp == expected),
-				  0, PSP_CMD_TIMEOUT_US);
-}
-
-/* Status equal to 0 means that PSP succeed processing command */
-static u32 psp_check_mbox_sts(struct psp_mbox __iomem *mbox)
-{
-	u32 cmd_reg;
-
-	cmd_reg = readl(&mbox->cmd_fields);
-
-	return FIELD_GET(PSP_CMDRESP_STS, cmd_reg);
-}
-
-static int psp_send_cmd(struct psp_i2c_req *req)
-{
-	struct psp_mbox __iomem *mbox = mbox_iomem;
-	phys_addr_t req_addr;
-	u32 cmd_reg;
-
-	if (psp_check_mbox_recovery(mbox))
-		return -EIO;
-
-	if (psp_wait_cmd(mbox))
-		return -EBUSY;
-
-	/*
-	 * Fill mailbox with address of command-response buffer, which will be
-	 * used for sending i2c requests as well as reading status returned by
-	 * PSP. Use physical address of buffer, since PSP will map this region.
-	 */
-	req_addr = __psp_pa((void *)req);
-	writeq(req_addr, &mbox->i2c_req_addr);
-
-	/* Write command register to trigger processing */
-	cmd_reg = FIELD_PREP(PSP_CMDRESP_CMD, PSP_I2C_REQ_BUS_CMD);
-	writel(cmd_reg, &mbox->cmd_fields);
-
-	if (psp_wait_cmd(mbox))
-		return -ETIMEDOUT;
-
-	if (psp_check_mbox_sts(mbox))
-		return -EIO;
-
-	return 0;
-}
-
 /* Helper to verify status returned by PSP */
 static int check_i2c_req_sts(struct psp_i2c_req *req)
 {
@@ -182,10 +64,10 @@ static int psp_send_check_i2c_req(struct psp_i2c_req *req)
 	 * 2. i2c-requests - PSP refuses to grant i2c arbitration to x86 for too
 	 * long.
 	 * In order to distinguish between these two in error handling code, all
-	 * errors on the first level (returned by psp_send_cmd) are shadowed by
+	 * errors on the first level (returned by psp_send_platform_access_msg) are shadowed by
 	 * -EIO.
 	 */
-	if (psp_send_cmd(req))
+	if (psp_send_platform_access_msg(PSP_I2C_REQ_BUS_CMD, (struct psp_request *)req))
 		return -EIO;
 
 	return check_i2c_req_sts(req);
@@ -202,7 +84,7 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 	if (!req)
 		return -ENOMEM;
 
-	req->hdr.total_size = sizeof(*req);
+	req->hdr.payload_size = sizeof(*req);
 	req->type = i2c_req_type;
 
 	start = jiffies;
@@ -381,7 +263,8 @@ static const struct i2c_lock_operations i2c_dw_psp_lock_ops = {
 
 int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 {
-	int ret;
+	if (!IS_REACHABLE(CRYPTO_DEV_CCP_DD))
+		return -ENODEV;
 
 	if (!dev)
 		return -ENODEV;
@@ -393,11 +276,10 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 	if (psp_i2c_dev)
 		return -EEXIST;
 
-	psp_i2c_dev = dev->dev;
+	if (psp_check_platform_access_status())
+		return -EPROBE_DEFER;
 
-	ret = psp_mbox_probe();
-	if (ret)
-		return ret;
+	psp_i2c_dev = dev->dev;
 
 	dev_info(psp_i2c_dev, "I2C bus managed by AMD PSP\n");
 
@@ -411,9 +293,3 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 
 	return 0;
 }
-
-/* Unmap area used as a mailbox with PSP */
-void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev)
-{
-	iounmap(mbox_iomem);
-}
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 050d8c63ad3c..c5d87aae39c6 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -383,7 +383,6 @@ int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_AMDPSP)
 int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
-void i2c_dw_amdpsp_remove_lock_support(struct dw_i2c_dev *dev);
 #endif
 
 int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 74182db03a88..89ad88c54754 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -214,7 +214,6 @@ static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
 #ifdef CONFIG_I2C_DESIGNWARE_AMDPSP
 	{
 		.probe = i2c_dw_amdpsp_probe_lock_support,
-		.remove = i2c_dw_amdpsp_remove_lock_support,
 	},
 #endif
 	{}
diff --git a/include/linux/psp-platform-access.h b/include/linux/psp-platform-access.h
index 977df5cfd494..f5a03cd11f10 100644
--- a/include/linux/psp-platform-access.h
+++ b/include/linux/psp-platform-access.h
@@ -7,6 +7,7 @@
 
 enum psp_platform_access_msg {
 	PSP_CMD_NONE = 0x0,
+	PSP_I2C_REQ_BUS_CMD = 0x64,
 };
 
 struct psp_req_buffer_hdr {
-- 
2.34.1

