Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA4EC6E25F5
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Apr 2023 16:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230392AbjDNOkf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Apr 2023 10:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbjDNOkd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Apr 2023 10:40:33 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A78B9BBB3;
        Fri, 14 Apr 2023 07:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RdQZXJoXqzCnSelTQIAjolCQLYDxu2/m3tMJHvSO0PmyzBZlfO9pyJ6Iz10i2KtN87hdKEwNTLhBoCL+bw7dO58zIUSgFaGEvnEdPHNV6u/tgQwNDMjAxXkUQI4/aCuvGVB7oSZbSHWwQ8R8RM1sfoHCnpnCz3zY1I81Pukeplqsh1zPyQf5x+199fAa/MW9kMZbL+6d+7IiRR//bNRH3CO129x3ekT/vu5OWPyaUi+1jPK0NLvPjJj1DPYMfbGj5NSu9dAqXsc1y/enW2jo6cNE9IHc56E4pg7cFEDHfOYwfol5AYsPXGlct5pUy2Qc817yqoNQO01rcTLGC3xvfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3D7jx9wsbXrF7ajqwptdEzUSmNmvay40HB00Ok1hKQ=;
 b=UbYMuE6EBFF29yLkQ/CWWiG5Exlvq7wr31J47xBtsmVeiPn6gSWqdhVmgiH4lgWojYgpzY4SKz2FnZ/qb5Exu2UymwHTAbetkTaGoXQ/5vbflQQ7Z+OcU1I72r1RleZwl1rcKn9rboLsZrNxjSDlfVTo3qi+s+kz0WPcF1mXamcJsOwKcsBSBsxJTEQceoWOTh3O3xNYv1YBkWoDp+OKB1QudQXjIeRIApHVcYOllYesZTlzUhCWKkENf0cMkaXYNMkQNh4Wet74WJa+oE5mYgZY5Cu5bt+UI82m16pbod1Er6NBNR5RT/fR+UTSB//0zozU0lsnunxT4vcERWrMrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gondor.apana.org.au smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3D7jx9wsbXrF7ajqwptdEzUSmNmvay40HB00Ok1hKQ=;
 b=v6F5OLqR5I9ao2SeY9CvI3zhkSlwMtbhxYnklRtgPNL+HwQDWa/5Qs8onILWAAx1T7XMbXoA1xoZTQU1d65K1OPfIuU+arsiePg2Kv6kb6M71784+VfHRf6jAUqs4pU5Z1GFTn0fsq6ZayMZKUahR/s81beMYILyIx5mivHhDug=
Received: from BN0PR04CA0206.namprd04.prod.outlook.com (2603:10b6:408:e9::31)
 by IA0PR12MB8207.namprd12.prod.outlook.com (2603:10b6:208:401::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 14:40:29 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::fc) by BN0PR04CA0206.outlook.office365.com
 (2603:10b6:408:e9::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.36 via Frontend
 Transport; Fri, 14 Apr 2023 14:40:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.37 via Frontend Transport; Fri, 14 Apr 2023 14:40:28 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 14 Apr
 2023 09:40:26 -0500
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jan Dabros <jsd@semihalf.com>
CC:     <linux-crypto@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Hasemeyer <markhas@chromium.org>,
        "Wolfram Sang" <wsa@kernel.org>, <linux-i2c@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 2/2] i2c: designware: Add doorbell support for Mendocino
Date:   Fri, 14 Apr 2023 09:40:08 -0500
Message-ID: <20230414144008.836-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230414144008.836-1-mario.limonciello@amd.com>
References: <20230414144008.836-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|IA0PR12MB8207:EE_
X-MS-Office365-Filtering-Correlation-Id: 00cbae68-dc5e-4e74-1ad8-08db3cf630c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LuDgX6ZSghPM6bsaeKbEMNNoKBgGiQyyjMmTB1IVrZW4+IcyPnjiwbLUD++jC2D+WskV+vs+14eIYno2sd64rmuVhyW82s59ZGZDVY2iMWHSv3JUvprLeYFH2pnFNdUjRMIF1SGfx17ys0SdrUBEzKQIWmLoqCVkpu4ScJNMHMfi+Rs9D0T8+Vg6pKKH3AJiTl5MqUx28+vb5hJXCFedqBV/VxhjG+ajwPK1BcdEJCAcy95tS/Vc9lcjIbuUtQN29lOsgvnRQAEh4qXhcQ5JOgW4V9kYTnYgT9ZFvwheKVmkiixvyBET10OL4OAhG+uMtclS7jZ6hSt7Jh5q06u0H2pB13Rdajg+dG5/LZLTdOd/1nWFIVFkwqncw67AZeavVRia99QQipnR0CXFQ+/VjFcj9Oq6TiiH/mJDF+/qAJpvUdmfxljNLZsZRsL5Onc6p9ktp1bk9+DM0Kkb6RsNRJS8oGWmjkrv5ZWwZodLCaKz1y5mY6/7GDKk3E1fKSVMgnjSujUWbUdOQg2oxH99gU7fiEaxc5lPCuwJqvuASxy/nyVdr9EdIGD4ILNVAq/xOIw5o/XIfJAf0xNU2hQOinRqcFGZc0EQgJmAN9KCjT0DFklmFDmjuIi4tCB7kpDFfNyjfbpU4tPGIyXf39148dLHbYKqFAfP6M0rhlY19tTSRzNFBPN+LamGbl+TFm9U+FIuZwkOr6c70lC/0zirGg63LKFf4rMjRBOmb7Y1AEo=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(46966006)(36840700001)(40470700004)(26005)(36860700001)(5660300002)(36756003)(7416002)(44832011)(2906002)(316002)(40480700001)(8936002)(86362001)(4326008)(8676002)(81166007)(40460700003)(41300700001)(82310400005)(82740400003)(356005)(966005)(426003)(1076003)(70206006)(336012)(47076005)(70586007)(83380400001)(2616005)(54906003)(110136005)(186003)(7696005)(478600001)(16526019)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 14:40:28.0564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cbae68-dc5e-4e74-1ad8-08db3cf630c7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8207
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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
Acked-by: Wolfram Sang <wsa@kernel.org>
---
v8->v9:
 * Add tag

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

