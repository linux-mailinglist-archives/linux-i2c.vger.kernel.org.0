Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F1EC6CF62F
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 00:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230087AbjC2WIk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 29 Mar 2023 18:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbjC2WIZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 29 Mar 2023 18:08:25 -0400
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2045.outbound.protection.outlook.com [40.107.96.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 241E244A9;
        Wed, 29 Mar 2023 15:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=brQMdmP+J1z3xbarWnOa1iTj1/7TXNsRXxs6DbFOTvUStXet5c0APTC0svUhKOvmuBX3BK/wSNH2NJiJjmophWbo67hn1DkxuSnmUyZ0oXquDYEYalFBVU2w2pCMJ/MegvTijxcehyp99afaqGflUVWzGjuawPSuVZSr2ak1AjQgMeZd7BjP85+MQumlbX9DRaZg0R/NYqE7gVXiUrs8XLG21Bngjzv04TFnNM2CcEZ8iAPa6+6tIOzUtKyQTdeWKMuRPGQG46beRQSJZwYV2xwvWblcEvFn2ASV4lfz8mTARsi9D7B5MH8bM2nioWBwQNraEtd04WSCAa6QJkErmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAHCp3vagbiZu0QIWVK93rpCb+c5kghdpjLPHcxWcBw=;
 b=d9XzQqxFfkwCpTqDM7vtE+MSzZeNI43YuWEV0DS2x637XxPKFjLYQJVuoyp5fr0pbUmRfBGc6Zb4eUU0/4mUS6vZp+ULe+YA93OethzfOcnKvd1zXiHHpXhB2So95NZxEKaDNRCEMTMccPdn1/gZgMeLTjvk+Y2U6cTeF+uv9T65IQdfjXw9ftePsN99hzIEKdcWe/FApNPNgy9w7VQkXQ5Qz6veoSCA3JMzQtOz6EGiK+qOKAisypB61g8rtXsbWXnKscTel0bLxLRUXeqqMOkWD7LArsJhBgOL9Nbe6EXaX7M3opRadkrEbIFNT3hVOrh4R8hjr66Rgun+SwxLZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAHCp3vagbiZu0QIWVK93rpCb+c5kghdpjLPHcxWcBw=;
 b=NPSZh5M5uAgKE2ccmSGbVieWrXiUzYfc5NJGWqoSZqGbUV88V18oAzSqZ5VHfucuyZpfuNgVd5tzE7qaRdtnwEfOIJBB3D4V7nQe4pf06m+64Y4o92LdqIc0eI1GVRWoXWpEQTIRFxD5/d7kbdqxA4m6s5/I1aaKd7rDHSfcm6M=
Received: from BLAPR03CA0058.namprd03.prod.outlook.com (2603:10b6:208:32d::33)
 by SJ2PR12MB7866.namprd12.prod.outlook.com (2603:10b6:a03:4cc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Wed, 29 Mar
 2023 22:08:17 +0000
Received: from BL02EPF000145BB.namprd05.prod.outlook.com
 (2603:10b6:208:32d:cafe::73) by BLAPR03CA0058.outlook.office365.com
 (2603:10b6:208:32d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Wed, 29 Mar 2023 22:08:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF000145BB.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.35 via Frontend Transport; Wed, 29 Mar 2023 22:08:17 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 29 Mar
 2023 17:08:15 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Felix Held <Felix.Held@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 6/6] i2c: designware: Add doorbell support for Mendocino
Date:   Wed, 29 Mar 2023 17:07:52 -0500
Message-ID: <20230329220753.7741-7-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230329220753.7741-1-mario.limonciello@amd.com>
References: <20230329220753.7741-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145BB:EE_|SJ2PR12MB7866:EE_
X-MS-Office365-Filtering-Correlation-Id: 546b1554-b0c7-47cb-20e6-08db30a21955
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NUUBAlSa/Nyo5IYzOsNi0pFOEIlSMCmvGLwYTyUsi2P5i3CnStqORGNdHi6WRfi/J0+0KYd3jvdvN/s+fCHk6kIZ/rGuqwrhg0GLeirjyyVU37ump6s2O+vlBZNA/eBQUplccYZINcgmnM+w1f4Qf22nViqP786mQcPX70OOtuusv4ZHLaDHJ7+k/xsqoZR+1yqU6GvZMgc9VgVvsX8guqIirUlOVp7owG9jEQ+IQsSKN6RsF1MpYm7Y4PFWO1V5xK9RFn4s7McOtisEVPp3onL96UYEcv/mbzd0XJ/J7AI+JREHpUmAlbWntOz5WQZgvmGzS+7dz6b1jFfQMNJhc6v3EEEBtZ6+cp3XFivcI3gTiedS+m34OWxHSIXjNxmpx3iXuE+R9feQYXTWsm1JewwB8dyNPY4KY0+rFUw5bAxnv66Sm/weqmsSVJ1ztHv0Gmq6eCQtQBPFOVKl4cfSjZKoLQuCbJkWEnFz2Q4hUX9RDPMW0fKhh2yIdlPAdRCunAzMrK2v5cz/dWpmWexVO0SaAS0rJCz58WyLf+XyyM0tMQuBrQaHy6YK/MwCmjlcoCAGhul699+kVwaFfhts9ppOyjN3dNuWH0vZv/6HxIHzocfYTUOjkISanX83DxKeBcr9Zf+p5VwitQKCaTd/8bTL0NbnDZfz3ZG6zpErNZP6beQdWhXgdn+v3RFIHKhLhKXli7VgbYtH3Z4IOY8FGATRVVhNZ+OHwiNcF4ZUZzQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199021)(40470700004)(36840700001)(46966006)(186003)(83380400001)(2616005)(16526019)(2906002)(1076003)(26005)(86362001)(36860700001)(40480700001)(82740400003)(82310400005)(356005)(36756003)(6666004)(81166007)(40460700003)(336012)(426003)(47076005)(41300700001)(5660300002)(70586007)(54906003)(7696005)(70206006)(110136005)(316002)(8936002)(478600001)(4326008)(8676002)(44832011)(966005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 22:08:17.0433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 546b1554-b0c7-47cb-20e6-08db30a21955
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000145BB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7866
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
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
v6->v7:
 * Add missing pci_dev_put()
 * s/mendocino/doorbell/
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
 drivers/i2c/busses/i2c-designware-amdpsp.c | 26 +++++++++++++++++++++-
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 0d47d4eeb2a4..63bc52b85854 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -568,6 +568,7 @@ config I2C_DESIGNWARE_AMDPSP
 	bool "AMD PSP I2C semaphore support"
 	depends on ACPI
 	depends on I2C_DESIGNWARE_PLATFORM
+	depends on PCI
 	imply CRYPTO_DEV_SP_PSP
 	imply CRYPTO_DEV_CCP_DD
 	help
diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 37d7d8cd05c0..f62d7c081f91 100644
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

