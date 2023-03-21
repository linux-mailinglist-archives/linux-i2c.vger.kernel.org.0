Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BD636C3CA5
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Mar 2023 22:29:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjCUV27 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Mar 2023 17:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbjCUV2s (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Mar 2023 17:28:48 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A49D85709F;
        Tue, 21 Mar 2023 14:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YhGLBWaJhOw1dTYKOvhdN7ZqLzEZzp1AGuiKOScE5v24kNUfhCkAe4RwOQCqYmobGgZQghMla03wU0Y13Yb0f2/QfN7nM2b8L3IZYpAEHmsxDlQqJyMPp1HvlMFC0ijoF98fy/uyMrIHT2IDunnpbv9mBstzjekP2vfPYQLPghFZNEJHSnXWn4REttAlg06URCp9xCC7KxZXWr8yvRMohXjVDg81TKFYOtattVj0ndoZQX3pUrrFfR5eB/Y5KjWg31mQoMznDIQ5PInYHcG5MAUPtjMjzdByOl4nfIE1yjF+WLqOGyDMRfre/o3nBLDShufhvwLnXAcWhTBlfpqq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlnaQu3lqbf7sRct1xoJ7owBCNv1DSMNWYFfpbHFy3g=;
 b=QS2QRAoppZvu0EPoqRZcxEl7x7Y88SHRM73m48SVf91/zklMwBsOp/3cWzo31qCaJTUn6k+zN94EcsCMApLyOaOyDE0nQM2PMhBmeyP2/o5YVy7rEetMONGB6Q+GX2fZmLQXiaisgzd6axyziUmAZAK882LP90T1tRIOw5CtFA0YzXSLiuIiZPtzYMgZ8k3D0529RskeVyOrL1VUxsxB1LLKrw0qV51f2GvPZyE+6+8La7Y/n5J/LKElAM12a6cmtTiFuiDu1oAHmC09OTW6iv+v8C6qyRy8mSRwjwdVRxL6+wv80CQJ8mxcRZHEDyT4JBVe0TW2b3llV5oJtKZaBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=chromium.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlnaQu3lqbf7sRct1xoJ7owBCNv1DSMNWYFfpbHFy3g=;
 b=pgwy6MCkSBKPcyT8FbclUcqNzyZRYGteErHEx9YWUKIeZYnFuB+YkawjQ9rdT4X7xOrypFzUEquB+gzYO0eTBlXkToBlXKk9KGfXjL3/leXGEDb2cgzkU7Yom6xYJQ6fO6o3P+1KL4SxN7pcx7Ok/7N7vX6dwGpZ82ECTOVVAKM=
Received: from BN9PR03CA0105.namprd03.prod.outlook.com (2603:10b6:408:fd::20)
 by IA1PR12MB6556.namprd12.prod.outlook.com (2603:10b6:208:3a0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 21:28:37 +0000
Received: from BL02EPF00010207.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::5c) by BN9PR03CA0105.outlook.office365.com
 (2603:10b6:408:fd::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 21:28:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00010207.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Tue, 21 Mar 2023 21:28:37 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 21 Mar
 2023 16:28:35 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Mark Hasemeyer <markhas@chromium.org>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
CC:     Held Felix <Felix.Held@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 3/3] i2c: designware: Add doorbell support for Mendocino
Date:   Tue, 21 Mar 2023 16:28:21 -0500
Message-ID: <20230321212822.5714-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230321212822.5714-1-mario.limonciello@amd.com>
References: <20230321212822.5714-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010207:EE_|IA1PR12MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: d22a103e-bdd6-4bb0-2f20-08db2a533b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9pKFf64zGWywrgswKCWwlKOFRq5Wdn7SmBJQfWYfwQZ9/jGwSU0lkCDMWS57vXDfI2b0wIC3sgnvMbjKzIHjn6GgzCOnR6mKBKPMylc1nO8WoQ3BPBipVJpWU2AcHcHSHM8u79t5yIxNm4FwjWoaVT2A58Px7iq8qZTFoE9peYRrkq5JYNMpMq7kMQYBaPpRI8jK6eADJIDKUAH3JnfPxhW8r6HoucrlQApuGTNVEU8tDS6+w04Id/ceyXGmjm9S1s5VGn5hnw8+9YZJn1PP8pnSQkjkGhRgUqNAMPk3QnM5ewq2JkQJV88gDOhWHh8q3AgssEKflShOjHPyivWCgmbax7EOArfc6Ih7rQ2YxDKaQROBPPIinsBrwzvekTFXb9wY3SVFq/pKBNggyRiaqEkDmG4IY+lCCV9FD6X9zIasWsdcHjukn0e/ODjRoUajqhvAX6kUWVN3ReNSiYh1SA5JjIbCnRTn6UFVr6b2hrDYnU2TxbYuUOIMxcDMrqeu9JasMQqWIzaH62tCGedqXuGbkra8XAZo+eYwsTKDa0fm/xb7pHspW8VyrSBTqreljrTgOdkZkasYEhkFkrHGBIa10nsgyC6v9YtSnMEqU3gcZpRnYODk7tGrwWOKwc/3tubX6fIgMX0kbXHfTRMWOQsiFoNLGca66pZ1fzXu0VXmS9FgisPYQooL6s9PjTQ3v7KZCm6LzgIuallx0UxxEo66r0ey996l18tRm0geOgg=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199018)(36840700001)(40470700004)(46966006)(186003)(1076003)(26005)(7696005)(82740400003)(47076005)(966005)(426003)(2616005)(83380400001)(478600001)(316002)(54906003)(16526019)(110136005)(6666004)(336012)(8676002)(4326008)(70586007)(8936002)(70206006)(41300700001)(36860700001)(44832011)(36756003)(5660300002)(40460700003)(2906002)(40480700001)(356005)(81166007)(86362001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 21:28:37.1562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d22a103e-bdd6-4bb0-2f20-08db2a533b81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010207.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6556
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
 drivers/i2c/busses/i2c-designware-amdpsp.c | 52 +++++++++++++++++-----
 2 files changed, 43 insertions(+), 10 deletions(-)

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
index 105584abcf8f..87b6cc345d1d 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
 #include <linux/i2c.h>
+#include <linux/pci.h>
 #include <linux/psp-platform-access.h>
 #include <linux/psp.h>
 #include <linux/workqueue.h>
@@ -36,6 +37,8 @@ static u32 psp_i2c_access_count;
 static bool psp_i2c_mbox_fail;
 static struct device *psp_i2c_dev;
 
+static int (*_psp_send_i2c_req)(enum psp_i2c_req_type);
+
 /* Helper to verify status returned by PSP */
 static int check_i2c_req_sts(struct psp_i2c_req *req)
 {
@@ -73,34 +76,55 @@ static int psp_send_check_i2c_req(struct psp_i2c_req *req)
 	return check_i2c_req_sts(req);
 }
 
-static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
+static int psp_send_i2c_req_cezanne(enum psp_i2c_req_type i2c_req_type)
 {
 	struct psp_i2c_req *req;
-	unsigned long start;
 	int status, ret;
 
 	/* Allocate command-response buffer */
 	req = kzalloc(sizeof(*req), GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
-
 	req->hdr.payload_size = sizeof(*req);
 	req->type = i2c_req_type;
-
-	start = jiffies;
 	ret = read_poll_timeout(psp_send_check_i2c_req, status,
 				(status != -EBUSY),
 				PSP_I2C_REQ_RETRY_DELAY_US,
 				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
 				0, req);
-	if (ret) {
+	kfree(req);
+
+	if (ret)
 		dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
 			(i2c_req_type == PSP_I2C_REQ_ACQUIRE) ?
 			"release" : "acquire");
-		goto cleanup;
-	}
 
-	ret = status;
+	return ret ? ret : status;
+}
+
+static int psp_send_i2c_req_mendocino(enum psp_i2c_req_type i2c_req_type)
+{
+	int status, ret;
+
+	ret = read_poll_timeout(psp_ring_platform_doorbell, status,
+				(status != -EBUSY),
+				PSP_I2C_REQ_RETRY_DELAY_US,
+				PSP_I2C_REQ_RETRY_CNT * PSP_I2C_REQ_RETRY_DELAY_US,
+				0, i2c_req_type);
+	if (ret)
+		dev_err(psp_i2c_dev, "Timed out waiting for PSP to %s I2C bus\n",
+			(i2c_req_type == PSP_I2C_REQ_ACQUIRE) ?
+			"release" : "acquire");
+
+	return ret ? ret : status;
+}
+
+static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
+{
+	unsigned long start = jiffies;
+	int ret;
+
+	ret = _psp_send_i2c_req(i2c_req_type);
 	if (ret) {
 		dev_err(psp_i2c_dev, "PSP communication error\n");
 		goto cleanup;
@@ -115,7 +139,6 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 		psp_i2c_mbox_fail = true;
 	}
 
-	kfree(req);
 	return ret;
 }
 
@@ -263,6 +286,8 @@ static const struct i2c_lock_operations i2c_dw_psp_lock_ops = {
 
 int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 {
+	struct pci_dev *rdev;
+
 	if (!IS_REACHABLE(CRYPTO_DEV_CCP_DD))
 		return -ENODEV;
 
@@ -276,6 +301,13 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
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

