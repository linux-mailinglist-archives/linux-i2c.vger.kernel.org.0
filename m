Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251936A9C54
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 17:52:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbjCCQwH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 11:52:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231422AbjCCQvq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 11:51:46 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345D8298F2;
        Fri,  3 Mar 2023 08:51:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0HIerf2DfZbXr0rEkT54rS7T97AQd8xyj7iFLi4Z3ojhPIGxj2k1ainNM/LacB8NonQTpJjc9lPkK3OarXg3wsZy4kmpdUtK7sO7njoQGIvVimgxcs7zkf6pnP/nXZ7fMuVRUTmJEafJsHFWjG3UOc0pxq9iq3XUUWrSkdBj+IlwJuN6vosBkHfvyCAXCllwaKISTgidFCD6xdtFxgHPBsimhxP8zWK77BnY4b1YBkTSt+NLT0aPZIEoXPD+8Yk4MdgDSJfhINEnXXrrMIhlLf+3t8iBa0+DLLb2/GiAUNaA+uKMuMVksZYZMVLagZBE1GBbs0mqiDB0YBFn8rUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SU7eGTJHNycLv3DJQX1DQ4lVFobD1k4CUOeq1PRzxLE=;
 b=oAl/n16WM3BC6Yp0MkReICXMc3Ey/Z5R0Fe0pWbyiQlCXU+H8lzsdgLypEGstnCB8JSbeYy4ClmGPoavMqkXhzlrvMf6Wvxp0BgewJhouNS4qewg6YR4iVEnvruQ/xxQio8/b4HCRp5MbROpzCAJTxMfCELMxdNCXLKY9vM24Jlij52yafQ9j5mWEFckMCVjhmvI6uay9VNCr7UN/7ra7XQFTPXbZ7WsbxJnBX8GC1Lamq/TKoNNTrMJLMmcX9oINEXxtx11k2/seJEgvRPFD8GUoWYwQfTM59NnIDYnwlax5HN6Y5o778YY0FiQRs26YPTIQFAocLeZGCGZlAsqFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SU7eGTJHNycLv3DJQX1DQ4lVFobD1k4CUOeq1PRzxLE=;
 b=J/4cV12nWF4Wf4Mq1CWJQnbss8ciMLxyRF9behHmrSnnjHibhFM585F+ZmMXntz1SJvsJv+zRBexklOci1bitqGMYo8O2mCEbi38VvaIRNEZ/UHAE2dJZnxvCb3PcIgSWDzpqkKMuNKHpgPQsFe3CtPecnJz72rTsq/xW2GeGd4=
Received: from MW4PR04CA0163.namprd04.prod.outlook.com (2603:10b6:303:85::18)
 by DM4PR12MB6664.namprd12.prod.outlook.com (2603:10b6:8:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Fri, 3 Mar
 2023 16:51:16 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::d9) by MW4PR04CA0163.outlook.office365.com
 (2603:10b6:303:85::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22 via Frontend
 Transport; Fri, 3 Mar 2023 16:51:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 16:51:15 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 10:51:13 -0600
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
Subject: [PATCH v3 6/9] i2c: designware: Use PCI PSP driver for communication
Date:   Fri, 3 Mar 2023 10:50:44 -0600
Message-ID: <20230303165050.2918-7-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303165050.2918-1-mario.limonciello@amd.com>
References: <20230303165050.2918-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT054:EE_|DM4PR12MB6664:EE_
X-MS-Office365-Filtering-Correlation-Id: 899e4b02-6db4-4d8b-e38a-08db1c078120
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X7TtbVG8tk6+oXKDGSqFaGRISJ95dvTuK565aEZDl7nDqA6kAnC94pi4QmoL2YRIqQXsk1Z3nYe0pJ0GCtq/S3+BHeg8phXpcWwOTZWb15Bhhx78saz6qqpB/Wu6k/hTfRys6xcH9wCD9phR14e/6VmSOHtsN6STVOJf5Irsx2d4nqmnvJBoayW2obosrT1At5QLshp6r27o/bwhllA2jPV9YcN8Ejb1rJoxkVMIe1jQBtLonmQnBAPCXSRA/OqwL9FZQysVz8FOAb2/ID4TyTcCBvooDC2T6PVXSzP1N6OngNa85GRl2sDmprwu4d2yNMwzltpXnY9OvX90U8ZKEHYbURyZv3+vQI+WDUeO+AUe6etAgpeScJ93SiuTKcjdN6rXxND96WWPV7oMSKBbyEMF1OZNo1GWPSBOA7pnuKJM7UqrzTuWbw3dRUCKrK2eOv7ZTAx8q9JXFRIC9FglDw6d7XZNIBQg9FV13vIq/mKwzrF0yEhzOFM4cSWUc5Tw9vL6ipnP9lEZUbJeBz7SIVKasS/sqZ/ve4tExgQvNMuic5iPocby1UAsb9hOTR6lusDGyMmblxZNE0d0oBcrNt08fbkCtkisrn5atRcPQzd4MBpC7EJpgCXmMTwBm0PpUm8shhMOClLZKGhn+1X8IJAWKcWBcEdzTPrTKvPm1lwBf0lWEFkDNZMexqwojz2yYiQ17oVH884faQIskrota8En92X3A0b/qzm1hEuwFCI=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(82310400005)(426003)(54906003)(83380400001)(47076005)(336012)(316002)(478600001)(110136005)(81166007)(36756003)(4326008)(82740400003)(40480700001)(36860700001)(8676002)(41300700001)(40460700003)(16526019)(5660300002)(26005)(186003)(6666004)(2616005)(7696005)(8936002)(70586007)(44832011)(70206006)(86362001)(1076003)(356005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 16:51:15.8259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 899e4b02-6db4-4d8b-e38a-08db1c078120
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6664
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
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

