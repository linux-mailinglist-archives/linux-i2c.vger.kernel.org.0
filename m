Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D59446B52BD
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 22:22:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231668AbjCJVWy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 16:22:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbjCJVWi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 16:22:38 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A8B12B659;
        Fri, 10 Mar 2023 13:22:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA3jt0tgYJRXznJNZiZdgkbjCKiQ2GctyPXT20Hij/RDOzinpcjyED7VPoh+QJZVDH9VHB47b9eGabVbGaIf/rlmuKIeFpjLkylxmmutLynx8mRMQyfknPoD07lxT6/VR6GR+0bNG+FnHdVT+Eu4f2J5kUyJ5BjlT3JFfMz/FQCznzdxwQvjI2Gq5LNZUg9FaTnI91kATSGu9eT+t9dr1ZGWBbvGTu7HplEpc/yShadQVsi4BJ1i7YMghkYGO99RdA++5Dt+Autn5sBVAwXvli9ks0kh3CVDLbjCvz0ubI0xytKbJC9IAVIbCWCsRs5YVcvXzotAhDCfuhuJlWgj2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rxd6+gD0xK2CiphjJTVAFLuQItATGt9DyC/cZjwngzE=;
 b=b9mfBqO5WlSvTl9ErrP/7A5f296jzgOr9mgMGgn8lfe8EmWjcqaKZe7IRj4DxzNx4GFjRj8iT+rz0iknlj/5CSa9/S9+RQYGeODh9/H3pjm4Ft8KGhkVTrKNlzvTl9IJT5C70T3cr2WgsuK4fFeRiUFuerzj/eqhQoiqWQgw7VsFEwTMJFogeXDNvBr2Wfeh6R6fnib6zAPFtAHcuUdcQKlpkAoFMLLK9hHhrKWDudGMDUi2KiIBeBvN7qXfhky/vmLY/1Ksoh3rDtGUvC8TntOd1D2CkIZ9v7aJdRYdcI9K+yjR7qZd05z2JfBkDEj+NWdpE9dVgtYJOUYO12F2YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rxd6+gD0xK2CiphjJTVAFLuQItATGt9DyC/cZjwngzE=;
 b=cGzn5UfOekXgPJYYd9eWBb7EvHy05GM1dHeAfhFwyX+NA2BiZXqN0oAJcx6tW9ZSFxdA5nK07MUjcYxw8XvGbfEutld7eM8WWaXXMByBW1OYfCNYnokwhsUgWi9uHh5kl07suak0UYZ9JC1lg30JCUnmOjyMBsUNZ9JcTLrkJIQ=
Received: from DM6PR05CA0041.namprd05.prod.outlook.com (2603:10b6:5:335::10)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 21:22:35 +0000
Received: from DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::f) by DM6PR05CA0041.outlook.office365.com
 (2603:10b6:5:335::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.20 via Frontend
 Transport; Fri, 10 Mar 2023 21:22:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT062.mail.protection.outlook.com (10.13.173.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.20 via Frontend Transport; Fri, 10 Mar 2023 21:22:35 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 15:22:34 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        <Rijo-john.Thomas@amd.com>, <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <Felix.Held@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 8/8] i2c: designware: Add doorbell support for Skyrim
Date:   Fri, 10 Mar 2023 15:19:51 -0600
Message-ID: <20230310211954.2490-9-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230310211954.2490-1-mario.limonciello@amd.com>
References: <20230310211954.2490-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT062:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: 0156f178-771d-4904-9fe3-08db21ad9148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hc645T04SX01ZYmWPMCE0VK6rBdjyLPoBbCstP5NzghMqpmDYF6ffKYUlJBV2ltZazvp2kthtHA9058TpNiZj27GVTrkiQ1jOJ5S5U1UhSAvE4YCnBCh/4Uv1pw6Nb+hIGyzGf5TXhg4JaCvSKijOl0930gmVTdd24T98GzLYTc/bfwBwiRXEOYwwPD5eFl0OFkDNyYWDmHY2LnZA4nOxfADr7YRCDVQYplY8Tm4IB0h/+iQtGdInNf3EWZTZrKxIKILCDahLPi+oRoaKkPcylDS0s7hRgzTx1KcyH4Uhsv02EeyMRYlnHGn2xw8gzFw2X4OuTEeLhBgSxj53G0sivpohE2CvJEm2+2fKSZw6pIkAyN4+hOp/68uSnnRC59l50tL7gENJ69TASpwbaHYaAN9eBorAt8JovWaKyZErQhVXZtOPuwPS4j8I8qmXPdvM4ErU4hkB6Y/suhJYQD1Dyej3D6Z0BHdAw0y3E9J6HnLg31nBGwmaQSvuqYtLvhHnYodFkdPbkb3ag784Jg9WDzubQDw09WH+gPEfeQtDhDkGuWmbVOxZTjrNXrxCms/ukDAl67Hjw26vIQ3KgqZkS6axTEMm6F9X1iyPZvEIyT7XsJGNTVsuBfrLlASecYoreFwSwMnR39yuw8IL+5Y6PTDi90Mzc9C/AkRJPyZ+IgdmMvz6T1j4URDjXOENPLS4NqhuJCZ++PksPjR9raa/YqOze4SMlx3ZaLnodfbIVQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(39860400002)(396003)(451199018)(40470700004)(36840700001)(46966006)(336012)(47076005)(426003)(54906003)(110136005)(36756003)(40460700003)(356005)(86362001)(40480700001)(82740400003)(81166007)(1076003)(26005)(82310400005)(83380400001)(6666004)(186003)(16526019)(2616005)(36860700001)(316002)(7696005)(5660300002)(478600001)(966005)(41300700001)(8936002)(2906002)(70206006)(44832011)(4326008)(70586007)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 21:22:35.2790
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0156f178-771d-4904-9fe3-08db21ad9148
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Skyrim and later platform don't use the platform feature mailbox for
communication for I2C arbitration, they rely upon ringing a doorbell.

Detect the platform by the device ID of the root port and choose the
appropriate method.

Link: https://lore.kernel.org/linux-i2c/20220916131854.687371-3-jsd@semihalf.com/
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * Adjust to use PCI device ID and function pointers instead
v2->v3:
 * Use CPU ID rather than ACPI ID, this will be pushed to a later patch
v1->v2:
 * New patch
---
 drivers/i2c/busses/i2c-designware-amdpsp.c | 40 ++++++++++++++++------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 105584abcf8f..e5614d69c743 100644
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
@@ -73,34 +76,43 @@ static int psp_send_check_i2c_req(struct psp_i2c_req *req)
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
+static int psp_send_i2c_req_skyrim(enum psp_i2c_req_type i2c_req_type)
+{
+	return psp_ring_platform_doorbell(i2c_req_type);
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
@@ -115,7 +127,6 @@ static int psp_send_i2c_req(enum psp_i2c_req_type i2c_req_type)
 		psp_i2c_mbox_fail = true;
 	}
 
-	kfree(req);
 	return ret;
 }
 
@@ -263,6 +274,8 @@ static const struct i2c_lock_operations i2c_dw_psp_lock_ops = {
 
 int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 {
+	struct pci_dev *rdev;
+
 	if (!IS_REACHABLE(CRYPTO_DEV_CCP_DD))
 		return -ENODEV;
 
@@ -276,6 +289,13 @@ int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev)
 	if (psp_i2c_dev)
 		return -EEXIST;
 
+	/* Cezanne uses platform mailbox, Skyrim and later use doorbell */
+	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
+	if (rdev->device == 0x1630)
+		_psp_send_i2c_req = psp_send_i2c_req_cezanne;
+	else
+		_psp_send_i2c_req = psp_send_i2c_req_skyrim;
+
 	if (psp_check_platform_access_status())
 		return -EPROBE_DEFER;
 
-- 
2.34.1

