Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13EAE6D5094
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 20:33:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbjDCSdA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 14:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233236AbjDCScu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 14:32:50 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 793BD271C;
        Mon,  3 Apr 2023 11:32:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnfVbSysY3h2zwoqbEaououcwnVJKV7h2OrOIm98VtBsT9cEDuMmc1L6jGFOSgvdrbUs5Z173aCl3Xxr2/5gsxyM2FO9bHmkoHpC5W/GCQcI+F7I2//TF84PZ7livAZHLXi+21luUpOieMc5P/bbhVuwqFBGv92tdX97p4vq/JsLsk6DyHjJJl7rrO33EpYqyBdKUBj6jPzZb3BnPDUU/dU4QnEgzTI/nWP/1bP4DvvNLhGXxXnIqiM47hovUbRAOyMI/YO05ANb3sxlRA/RyKEuVk72ouNYnMmoC6RUAM0DgyjMKZvjn4fphJIh5rTWZy5kha4rYgYQEb6Uf9lXrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMV8quoeXMSlZ6qbOJcT+4gf9PhcANIuYBy/bVjzo+M=;
 b=QeBSiX7RrolvcvVGZHwmEwT0PuQQ+0Uo/UFlFtuQ5Lcck5rbco+OALAtWqJIYNXTG2GUJCP12KwsjKyxObusEDwnBwvvRT+uiQZ+oBTSVOE4bR+AiOh2yWOTH7QmRKYcl9GNVp+URSIBqJbXnhmaBVBsttQWuXbSpx/DmTnQsWJbC6qZG6t/7b9ZC36Lc2Z2PbOJORE1zuTsEp/6zPyF/wkAwQgi66/QUCLr1dwa5NSfkrOuVwfLV4eY7jM8YKkBrmjd7VHGgkW7MTTR1LWPqRwMfm+ZKTxlyM/gLwY7gFBXETLV5zb2/12incKmq+QyrIXbSjUCaal+8fydTMn9Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMV8quoeXMSlZ6qbOJcT+4gf9PhcANIuYBy/bVjzo+M=;
 b=OTH4/X/E39QlGfsg5COuVVc4bH+zEu6Im8g9bWauH3q7CUEdoECuDs5u+/7go7NJJ0N9LZ1UcixJpcDUPQAjR01FNjUkpwnHlFaiPJy+31uczJk5zJc7AdukhUUw8A9npZtfmBEPp6D8/EDzeOQ6Mgt2MHewIjWN1AQdh9e+IZg=
Received: from BL1PR13CA0195.namprd13.prod.outlook.com (2603:10b6:208:2be::20)
 by BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.29; Mon, 3 Apr
 2023 18:32:43 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::91) by BL1PR13CA0195.outlook.office365.com
 (2603:10b6:208:2be::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.26 via Frontend
 Transport; Mon, 3 Apr 2023 18:32:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 3 Apr 2023 18:32:43 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 3 Apr
 2023 13:32:37 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
CC:     Held Felix <Felix.Held@amd.com>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>, Mark Hasemeyer <markhas@chromium.org>,
        "Grzegorz Bernacki" <gjb@semihalf.com>,
        Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v8 5/6] i2c: designware: Use PCI PSP driver for communication
Date:   Mon, 3 Apr 2023 13:32:14 -0500
Message-ID: <20230403183216.3493-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230403183216.3493-1-mario.limonciello@amd.com>
References: <20230403183216.3493-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 93d4a41e-8146-45af-3ecb-08db3471d092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SQZXPaTJzcevMgTpk+5GyqhfvFuecOvvkUV+RJAFI8WtDQpTX2V17vJiul9PCTla6dnsEus0kjZoh/9jOM1EjL71L9blfPhoE5VNCJPFZGij1I7n4D+OBbr6+oPd6PV9shjDChcv/YCTAk5SciFfVfx4c6oro3fuWsrOAb4Cf03i1TDyFIZl3OKNBhbNv71u5Y9RTq07G6SpWWqatB5mlLWi8G4T1PDUaKxPnGTJHD4qlJX+3fN+svj9OUYaf6DNjlfGOxZzT0PjYlf+LBy8Ee++/MwAbuXHGV4t9aK8iIbUIvIQQOhSR8+zkqoccmomausHuKRqGrck2aphhHE/8Dsv8LJndigDiKkd4O7o+Os1Dk57kch7/j+0C79Edvmw5TwXPSi3wq1gw07+mNH8SEfuYRxY3BwokbJ89sWsU28Smf7SmD4IfJmgbn9LsHJwo8+tgUgxzWsT04RiRyE/W4lUesMdW+KUD7LxYiuQXCGQD4NWJTeasXqfO9ravWEvJKZzmthq05gxDK3jWltnClX6DffWRj+bg2Zs3oq0kJKzxWkLdrlSTdz4l/5u+jZliI4YZgvvv1695LSaJWCiBXZHmvzosOjTjyoknbT0VH/gSBKHG9XqwHVbYVrEI/kzXBe5OW1Jn/+4QP+29iZ0S49ZpnxWzA4E47ABjSw2/JI0uJRJ1REdX6txMF94jHB2glbiHKEXiqTqZNq9H8lYv/Pv32wRheV/PKlHdDCxjLE=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199021)(40470700004)(36840700001)(46966006)(2906002)(40460700003)(8676002)(5660300002)(8936002)(82740400003)(81166007)(41300700001)(356005)(44832011)(2616005)(36756003)(82310400005)(40480700001)(86362001)(6666004)(7696005)(26005)(1076003)(54906003)(478600001)(36860700001)(83380400001)(47076005)(336012)(426003)(16526019)(186003)(70206006)(70586007)(4326008)(110136005)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 18:32:43.7782
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93d4a41e-8146-45af-3ecb-08db3471d092
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
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
Reviewed-by: Mark Hasemeyer <markhas@chromium.org>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Mark Hasemeyer <markhas@chromium.org>
---
v7->v8:
 * Drop hunk changing error message
 * Stop using imply.  As shown by failed configs for kernel robot we need
   stronger dependencies. Model them off of I2C_DESIGNWARE_BAYTRAIL which
   has a similar relationship
---
 drivers/i2c/busses/Kconfig                  |   4 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c  | 175 +++-----------------
 drivers/i2c/busses/i2c-designware-core.h    |   1 -
 drivers/i2c/busses/i2c-designware-platdrv.c |   1 -
 include/linux/psp-platform-access.h         |   1 +
 5 files changed, 29 insertions(+), 153 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 25eb4e8fd22f..89f8b75043d0 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -566,9 +566,11 @@ config I2C_DESIGNWARE_PLATFORM
 
 config I2C_DESIGNWARE_AMDPSP
 	bool "AMD PSP I2C semaphore support"
-	depends on X86_MSR
 	depends on ACPI
+	depends on CRYPTO_DEV_SP_PSP
 	depends on I2C_DESIGNWARE_PLATFORM
+	depends on (I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=y) || \
+		   (I2C_DESIGNWARE_PLATFORM=m && CRYPTO_DEV_CCP_DD)
 	help
 	  This driver enables managed host access to the selected I2C bus shared
 	  between AMD CPU and AMD PSP.
diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 652e6b64bd5f..12870dc44bdb 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -1,35 +1,20 @@
 // SPDX-License-Identifier: GPL-2.0
 
-#include <linux/bitfield.h>
-#include <linux/bits.h>
 #include <linux/i2c.h>
-#include <linux/io-64-nonatomic-lo-hi.h>
+#include <linux/psp-platform-access.h>
 #include <linux/psp.h>
-#include <linux/types.h>
 #include <linux/workqueue.h>
 
-#include <asm/msr.h>
-
 #include "i2c-designware-core.h"
 
-#define MSR_AMD_PSP_ADDR	0xc00110a2
-#define PSP_MBOX_OFFSET		0x10570
-#define PSP_CMD_TIMEOUT_US	(500 * USEC_PER_MSEC)
-
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
@@ -41,119 +26,12 @@ struct psp_i2c_req {
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
@@ -173,22 +51,25 @@ static int check_i2c_req_sts(struct psp_i2c_req *req)
 	}
 }
 
-static int psp_send_check_i2c_req(struct psp_i2c_req *req)
+/*
+ * Errors in x86-PSP i2c-arbitration protocol may occur at two levels:
+ * 1. mailbox communication - PSP is not operational or some IO errors with
+ *    basic communication had happened.
+ * 2. i2c-requests - PSP refuses to grant i2c arbitration to x86 for too long.
+ *
+ * In order to distinguish between these in error handling code all mailbox
+ * communication errors on the first level (from CCP symbols) will be passed
+ * up and if -EIO is returned the second level will be checked.
+ */
+static int psp_send_i2c_req_cezanne(struct psp_i2c_req *req)
 {
-	/*
-	 * Errors in x86-PSP i2c-arbitration protocol may occur at two levels:
-	 * 1. mailbox communication - PSP is not operational or some IO errors
-	 * with basic communication had happened;
-	 * 2. i2c-requests - PSP refuses to grant i2c arbitration to x86 for too
-	 * long.
-	 * In order to distinguish between these two in error handling code, all
-	 * errors on the first level (returned by psp_send_cmd) are shadowed by
-	 * -EIO.
-	 */
-	if (psp_send_cmd(req))
-		return -EIO;
+	int ret;
 
-	return check_i2c_req_sts(req);
+	ret = psp_send_platform_access_msg(PSP_I2C_REQ_BUS_CMD, (struct psp_request *)req);
+	if (ret == -EIO)
+		return check_i2c_req_sts(req);
+
+	return ret;
 }
 
 static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
@@ -202,11 +83,11 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 	if (!req)
 		return -ENOMEM;
 
-	req->hdr.total_size = sizeof(*req);
+	req->hdr.payload_size = sizeof(*req);
 	req->type = i2c_req_type;
 
 	start = jiffies;
-	ret = read_poll_timeout(psp_send_check_i2c_req, status,
+	ret = read_poll_timeout(psp_send_i2c_req_cezanne, status,
 				(status != -EBUSY),
 				PSP_I2C_REQ_RETRY_DELAY_US,
 				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
@@ -381,7 +262,8 @@ static const struct i2c_lock_operations i2c_dw_psp_lock_ops = {
 
 int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 {
-	int ret;
+	if (!IS_REACHABLE(CONFIG_CRYPTO_DEV_CCP_DD))
+		return -ENODEV;
 
 	if (!dev)
 		return -ENODEV;
@@ -393,11 +275,10 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
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
 
@@ -411,9 +292,3 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 
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
index 1b661341d8f3..75da8f5f7ad8 100644
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

