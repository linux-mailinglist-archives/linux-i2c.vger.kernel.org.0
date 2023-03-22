Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC7756C586C
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Mar 2023 22:05:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjCVVFh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Mar 2023 17:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCVVFc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Mar 2023 17:05:32 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F137B11EB9;
        Wed, 22 Mar 2023 14:05:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iEl77jpAHOnkFcp1sStoZ01uWCYSopGM23YIQV11Lr2TcGxv2cnaiyY65Dbx63j/D7+Uy1cV+V8wmDlex4AflQoQVDVVYtjPmC2uHgvkmmMLicPEU3Sg4QaOJ4eE9vcwwO74gKgE1EJQ+14VKf3a/g8JYoSBTqOYxPMYMh0j2J5mPVwxKmNqHsYW3+KyGnz+wH03qaopJH5Q+aW9B8LRNXp6gI8tUOcQP0L3gs7MXri01Eip5TonMgdIDleW1BMrJGXW18kUj9sAW/94UpLsV0E6q/icvWVItmysJLUAz4PW6dTbWQc3jfuF7FQ88MUsRiX972qX5l8fbb0HSN6c8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gODEmt89Z8dHVcHdT+1aUJVpWvl7CCoeG8E+4vlXKVo=;
 b=UR63A9LBxatr3Tn4qKxivTjd8+Q/kK61jT5M9EeBcvzws/OXIc/zoV/AbmZ9ClS3g8pPbZKnoTEDqZh6PAwK6G7O/P4s2o85TblbmIOojENg3l0I4TmL2/PgUUZVzXR8+cSMbKIo/bkJ4G2YGCf0cvjkF0qsmeInjzkEWxjhgQ5m1w6nCUZhYchA/p9Nr8EFoo2aeMnuiVDXdpAZLMkUpX2qxWjFJFJzrC1ada5GmYi5czJDxDXsA7tGo+KgQkWXGpmFQCkZ4GskR7GuQ+vl9dbLilV5Hk9LHp2+etUBFLYPFyEQtlOztg2IFqWPHu8vmqGgkVHGh6vsSEDiS3rXMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gODEmt89Z8dHVcHdT+1aUJVpWvl7CCoeG8E+4vlXKVo=;
 b=W/gw3gCuknjdH9GI724LxsdCimxmHwSWJXMQNSpwLl6fWcNDODgZvaEPIiXuo3uM6ir2KDOFtExKX9hSZIFSAhuKUmjw7eN5xpZocWRoFCp+EJfUvqoKDdhWpAXKXhHquxNvpsBfFilxFyh67McdlZ7oB4rPWRGVY7d89FYEBiA=
Received: from DS7PR03CA0048.namprd03.prod.outlook.com (2603:10b6:5:3b5::23)
 by SN7PR12MB7321.namprd12.prod.outlook.com (2603:10b6:806:298::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 21:05:28 +0000
Received: from DM6NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b5:cafe::77) by DS7PR03CA0048.outlook.office365.com
 (2603:10b6:5:3b5::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Wed, 22 Mar 2023 21:05:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT086.mail.protection.outlook.com (10.13.173.75) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.17 via Frontend Transport; Wed, 22 Mar 2023 21:05:28 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 22 Mar
 2023 16:05:26 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Mario Limonciello <mario.limonciello@amd.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 4/4] i2c: designware: Add doorbell support for Mendocino
Date:   Wed, 22 Mar 2023 16:02:26 -0500
Message-ID: <20230322210227.464-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230322210227.464-1-mario.limonciello@amd.com>
References: <20230322210227.464-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT086:EE_|SN7PR12MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: 47e31157-3af8-4422-4992-08db2b192a1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y4h32OXAx/Yl1TS24xhOimEe8LvK3oNsWc7TFgM3bIRJ+NhhsDfO2jEvzLOPtY0+Q5z+JGhFqxp5LHO+G4yNb482C0w3wKqWbFMog18d6mFQTq7Y0PJ2TINKkMOpdpqNvzJ8q/XG43CzOSYP+A7+E2O9soTFIgOv5rJ8CkoRo8i7Ae8zeXUSOByQX8+DvX1YXFTbaJRlBNkiHmedMJLKY+z66y6/PbfcBqsClbfEQ7EeaL9By6hbe+lIVNktMy8SvXrFzD3a/qX40ccl4Cfpb8daS/qP0S4v5TRPOrL+VKHKT1SbTi7zL3Ghbe09qqwD8NUWj578ZOZcJbE3Po3Inlh3Opc3MVbyexQkfmkPQAFBDdu6Rr7TM8Kg3w3w3RN8Pzh5Gjljxv8v1nGCYxyptkiCtFdof3ZnUnDxehK39/Uwf2y49crzHHvBhKgLSTZqbcaWgHltVpwMR1Vt6TjPbkM+5GNnS9okO5myP65+hlxGktF3eGNvr74/5KR1VW6wwuoKj5l2bXptlsDyQ8erZplPq30WqH0g8JN2m4CcX+4DgIDgbnZQ8gnvpU5HWKdCEJSIPhbCXeLEbELl0BFVP5UaT0J9YyBvuT9SK/wsiSfYSLAPeKcWZ1OF5SGIPuJTq+97goAMqXzkwCMMsllnstYGp4BuTYBL9VUBCNjnO3uwXS6gDyxzPudfDXFgnKEy8iX8vpkJmYxdrQeYqPtVo2j8tTfFZ5tiONJoHVtLDU8=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199018)(36840700001)(40470700004)(46966006)(81166007)(2906002)(86362001)(83380400001)(36860700001)(40480700001)(8936002)(5660300002)(336012)(82310400005)(356005)(2616005)(186003)(41300700001)(40460700003)(16526019)(1076003)(26005)(478600001)(54906003)(47076005)(7696005)(110136005)(316002)(36756003)(426003)(44832011)(966005)(70586007)(4326008)(8676002)(70206006)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 21:05:28.3015
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e31157-3af8-4422-4992-08db2b192a1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7321
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Mendocino and later platform don't use the platform feature mailbox for
communication for I2C arbitration, they rely upon ringing a doorbell.

Detect the platform by the device ID of the root port and choose the
appropriate method.

Link: https://lore.kernel.org/linux-i2c/20220916131854.687371-3-jsd@semihalf.com/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Handle Mendocino busy code like Cezanne
v4->v5:
 * Poll for busy
 * Rename to mendocino
 * Add explicit dependency on PCI
v3->v4:
 * Adjust to use PCI device ID and function pointers instead
v2->v3:
 * Use CPU ID rather than ACPI ID, this will be pushed to a later patch
v1->v2:
 * New patch
---
 drivers/i2c/busses/Kconfig                 |  1 +
 drivers/i2c/busses/i2c-designware-amdpsp.c | 25 +++++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index d53bf716f97d..2aba5ffa8b03 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -568,6 +568,7 @@ config I2C_DESIGNWARE_AMDPSP
 	bool "AMD PSP I2C semaphore support"
 	depends on ACPI
 	depends on I2C_DESIGNWARE_PLATFORM
+	depends on PCI
 	imply CRYPTO_DEV_SP_PSP
 	help
 	  This driver enables managed host access to the selected I2C bus shared
diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 12870dc44bdb..f5c754919fbd 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/i2c.h>
+#include <linux/pci.h>
 #include <linux/psp-platform-access.h>
 #include <linux/psp.h>
 #include <linux/workqueue.h>
@@ -32,6 +33,8 @@ static u32 psp_i2c_access_count;
 static bool psp_i2c_mbox_fail;
 static struct device *psp_i2c_dev;
 
+static int (*_psp_send_i2c_req)(struct psp_i2c_req *req);
+
 /* Helper to verify status returned by PSP */
 static int check_i2c_req_sts(struct psp_i2c_req *req)
 {
@@ -72,6 +75,17 @@ static int psp_send_i2c_req_cezanne(struct psp_i2c_req *req)
 	return ret;
 }
 
+static int psp_send_i2c_req_mendocino(struct psp_i2c_req *req)
+{
+	int ret;
+
+	ret = psp_ring_platform_doorbell(req->type, &req->hdr.status);
+	if (ret == -EIO)
+		return check_i2c_req_sts(req);
+
+	return ret;
+}
+
 static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 {
 	struct psp_i2c_req *req;
@@ -87,7 +101,7 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 	req->type = i2c_req_type;
 
 	start = jiffies;
-	ret = read_poll_timeout(psp_send_i2c_req_cezanne, status,
+	ret = read_poll_timeout(_psp_send_i2c_req, status,
 				(status != -EBUSY),
 				PSP_I2C_REQ_RETRY_DELAY_US,
 				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
@@ -262,6 +276,8 @@ static const struct i2c_lock_operations i2c_dw_psp_lock_ops = {
 
 int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 {
+	struct pci_dev *rdev;
+
 	if (!IS_REACHABLE(CONFIG_CRYPTO_DEV_CCP_DD))
 		return -ENODEV;
 
@@ -275,6 +291,13 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 	if (psp_i2c_dev)
 		return -EEXIST;
 
+	/* Cezanne uses platform mailbox, Mendocino and later use doorbell */
+	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
+	if (rdev->device == 0x1630)
+		_psp_send_i2c_req = psp_send_i2c_req_cezanne;
+	else
+		_psp_send_i2c_req = psp_send_i2c_req_mendocino;
+
 	if (psp_check_platform_access_status())
 		return -EPROBE_DEFER;
 
-- 
2.34.1

