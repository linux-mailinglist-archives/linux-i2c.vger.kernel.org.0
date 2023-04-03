Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C966D5096
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Apr 2023 20:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233214AbjDCSdB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Apr 2023 14:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233237AbjDCScu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 Apr 2023 14:32:50 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20616.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::616])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73632704;
        Mon,  3 Apr 2023 11:32:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khrYSxZMckhq8FoBW6nNN7iyyn/ZUQ8a3mo2BFoJm0/+ew0lsx7+zkSTDDTa5HGxQg7yRkars0uWiu3QBKglGwTFk5ns6HkXLsnIszL/VjpPf9qrA5q2tmBDPXpjKu0WrMkVKvHlAM5uHbBWseRWiskNt/I7PwY64ezRib6QuWkcqW7x6UmdQQWz/+13/kqb+2c+99RKw2XPJ2DY/O+T3CoA64zaA9rtPp5akuHGJe4OsuYJbOMGs9EFwi/U2xSls1Zn5Yw0mbKtZfUWczimv4HcAtbNQnSc/7ZSBCK/GmXZl9LmutGM3bVTiHPcmVuSQv/MO2L9dKip/Gg2wtGSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77nPVA5wWjenZP1nJ46p1Xi+uNhV+OZxPX3G1omeKGI=;
 b=A5q6yBNICSrz2T0sHFyK0p9nKskoOfMcTeKzEPrPW4o4uG0poqrTSXItkkxOAAz7XmJ4SdHqEmSsfIMV6hUxYfqcVPfp82o2x5C3p5IcOFXyrsuTeXrphEYbIpuY9HA4fS4A7yT7T87VhB95c9R975IEazGhRGjW72O+yaB0VBLx0ERZ2m3jTpwflWLo6D78z/Cf2zwV+yaca38uLsUArzR2PP2aAYn5ORLComFZDUUdlHIm5DqOiajWlzDi57ubhwBFAPdUwH/8v4USL+DDNjOQPAjwnYSIPulWggDcoo2u3B8+OBE0J+u5FM9x3pLReyjovJbuSyIbcoQElqTAlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=77nPVA5wWjenZP1nJ46p1Xi+uNhV+OZxPX3G1omeKGI=;
 b=0WPxo6Bczmt13TjcHy5GUfnZ7MU17yBVKMcGwxeZgtCP4NgtwZEY25pDDmPJKfhYdFKHTPix9pV2opYUorDaG5UibCf/1z965EXTONashU3XoEenE504UalZTI90usoPSngOMPnsaG9mWLTZ6Cs7NQvoEgh98wSFu24FMliiGbc=
Received: from BL1PR13CA0192.namprd13.prod.outlook.com (2603:10b6:208:2be::17)
 by DM4PR12MB5280.namprd12.prod.outlook.com (2603:10b6:5:39d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 18:32:44 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2be:cafe::2e) by BL1PR13CA0192.outlook.office365.com
 (2603:10b6:208:2be::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.26 via Frontend
 Transport; Mon, 3 Apr 2023 18:32:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 3 Apr 2023 18:32:44 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 3 Apr
 2023 13:32:38 -0500
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
Subject: [PATCH v8 6/6] i2c: designware: Add doorbell support for Mendocino
Date:   Mon, 3 Apr 2023 13:32:15 -0500
Message-ID: <20230403183216.3493-7-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|DM4PR12MB5280:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d0190e-ac91-4cc6-edde-08db3471d0c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2t0PZ7XLgzyJRegGCc9MmWrJEvX/L39WWbd1fydl//f80hfVqXq40JJYTZEU7r6gzsMgn7J2KrOb+VMhx69mT898BKA1F0ECxOLyvXVavRDptqncG4KCIuQ1GjeVN4ZCndsNXOx6ydGRv22M1IQyYJD+BDsXvsGUMsMjfgA70BH6fN0oG0nfggR7HWLHC5sMrVMS2InQLL8dgDMVaxKqJRLgBvFW9dMCctcOPCKvCg8P+1XWCxY5n3gIUAGHI4BPA2ieUFz1GQvQQjdxJ1OxqVQ8SfKPWo0FiRYhng2sJE4d+yoiSUiBbmFSnQVYyMLC5NXO3KNzwg1sMk4UCeRGIeCbHHXqBAydifAaSmVpb+VxVg0fNJkF9lLHkBglYAdco+n6VBdp8WFsWGw5zVX8ZLTSLajmp8whQUZ3n+QJtc7M41rboZ1yJKi9xFdEj229vaQs0hdjeICJKdv1lGLI4QC5ia8VQ1/LzNZZjK3VIEFL7fbL4aP9mwlvVuENp0k6BN+ovQxxI/e5mKQ/mOqm1YKYtM8XRoPRcDyU+QD/v2KZVld6dw3nBpldyRdZKpECnAwNvXx2YTompC8MOtM8rx7SvxowGoBY8KebezNQ3wj6ULjAMGfqMR+3qWz8LsZVxtMs3GqGCT2R4Z2GpzlsZVgQL4y92vm9FS9hb6KTjDW0imbRcC1AuQALzHVV1kguaVMrPhrI1N13iEOGDafWeZucxra0042oqOYUWNFIU6c=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39860400002)(376002)(136003)(451199021)(36840700001)(40470700004)(46966006)(40480700001)(40460700003)(36860700001)(4326008)(8676002)(316002)(70586007)(70206006)(478600001)(110136005)(8936002)(54906003)(41300700001)(356005)(82740400003)(81166007)(44832011)(5660300002)(426003)(186003)(47076005)(83380400001)(16526019)(2616005)(336012)(6666004)(26005)(1076003)(86362001)(36756003)(2906002)(82310400005)(7696005)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 18:32:44.0907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d0190e-ac91-4cc6-edde-08db3471d0c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5280
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
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
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Mark Hasemeyer <markhas@chromium.org>
Tested-by: Mark Hasemeyer <markhas@chromium.org>
---
 drivers/i2c/busses/Kconfig                 |  1 +
 drivers/i2c/busses/i2c-designware-amdpsp.c | 26 +++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 89f8b75043d0..4b4323bbf268 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -568,6 +568,7 @@ config I2C_DESIGNWARE_AMDPSP
 	bool "AMD PSP I2C semaphore support"
 	depends on ACPI
 	depends on CRYPTO_DEV_SP_PSP
+	depends on PCI
 	depends on I2C_DESIGNWARE_PLATFORM
 	depends on (I2C_DESIGNWARE_PLATFORM=y && CRYPTO_DEV_CCP_DD=y) || \
 		   (I2C_DESIGNWARE_PLATFORM=m && CRYPTO_DEV_CCP_DD)
diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 12870dc44bdb..63454b06e5da 100644
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
 
+static int psp_send_i2c_req_doorbell(struct psp_i2c_req *req)
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
 
@@ -275,6 +291,14 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 	if (psp_i2c_dev)
 		return -EEXIST;
 
+	/* Cezanne uses platform mailbox, Mendocino and later use doorbell */
+	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
+	if (rdev->device == 0x1630)
+		_psp_send_i2c_req = psp_send_i2c_req_cezanne;
+	else
+		_psp_send_i2c_req = psp_send_i2c_req_doorbell;
+	pci_dev_put(rdev);
+
 	if (psp_check_platform_access_status())
 		return -EPROBE_DEFER;
 
-- 
2.34.1

