Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA56469137A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 23:38:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbjBIWip (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 17:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbjBIWig (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 17:38:36 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099155A9C5;
        Thu,  9 Feb 2023 14:38:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aYtzV/OI2SsXeOATgNxWA3VBDVsnaEAf/pd/ZlmOCAcqxXN+weYdt3Q6GNp1on6Qb1Qpr9YIbawmJ1XdYBggjpu7B+B2SBBa/nlYRvDbgnWMVn3lCEZlCSI5zQxiOsPZ/9gziXpSSpcZWSIJAHXCHycNnHHAiyGWZNzW8kzuc4nyUupT6M6ihL3ThkFiEF490qnWxhLThIYHdqiYigwmjtyelHte2pQzxM077iDO3Gakiu28kaaY3RO1TtF6hhOhvR01U5QBtkx7JNyx3bocUKs7kuJxTQVMcUv8YxbEEUN0+PXmgR1DTYpE10PbvqIYaI8EAJmnVowX8ZR0bLdRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gUb7EiIkTIWL/SydqJnkGCvmei2QBIJ2vw0AMSW8l0M=;
 b=ntw+1JjfnGZAnXXuAXeZYMjABRhKcILx8o8KtbUa1jBA32WEBz8M9vc+4dNt+/4XtlGrX6UjYg6wbeXAI3EHIl+dpkjjQldkmRQKY/m0dYD9BNC3JGKKz2l7iJW1/8HBSRP/EZYUt8dm8siO5b97Qly5CcVyXM5Kzp23zyN21aMTiYnTEEodRzVmfjuE8yoYntBUuu6jJVi8+kgYNDvFdn/XQJYMKLJfpsTZq+Wp3brrrhhq7rr+cXi4LTDiT+6mSX+9ACHGOIsVy/1IPZh8SY+G0TFoDVv05ImbU2p5jgJrLKqpm+WUA2/RriYtDiw/7oLFQth7Uf/CHmH425Aasg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gUb7EiIkTIWL/SydqJnkGCvmei2QBIJ2vw0AMSW8l0M=;
 b=XDX7zOx7FZR8kr9kqmpmrdX/wFeB9qpA7u03FkaINgfyS44xKW3ubSGr07Ds4JAWV2W6S9dHo8z1g0SBBMR/tBYPt+1VpZEGVCsIwn23fIEPk5lvRSn3UAQeAIJqfEtXNxK0gjolDWeIOm1VCkSTibQSSKtTxuvTwWKZpo/74ak=
Received: from DM6PR05CA0037.namprd05.prod.outlook.com (2603:10b6:5:335::6) by
 IA1PR12MB6233.namprd12.prod.outlook.com (2603:10b6:208:3e7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Thu, 9 Feb
 2023 22:38:32 +0000
Received: from DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:335:cafe::57) by DM6PR05CA0037.outlook.office365.com
 (2603:10b6:5:335::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.5 via Frontend
 Transport; Thu, 9 Feb 2023 22:38:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT109.mail.protection.outlook.com (10.13.173.178) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 22:38:32 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 9 Feb
 2023 16:38:30 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        Thomas Rijo-john <Rijo-john.Thomas@amd.com>,
        "Lendacky Thomas" <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        "Sean Christopherson" <seanjc@google.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        John Allen <john.allen@amd.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Ingo Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@linaro.org>, <kvm@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>
Subject: [PATCH 2/6] crypto: ccp: Add a header for multiple drivers to use `__psp_pa`
Date:   Thu, 9 Feb 2023 16:38:04 -0600
Message-ID: <20230209223811.4993-3-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT109:EE_|IA1PR12MB6233:EE_
X-MS-Office365-Filtering-Correlation-Id: fd363c51-4dbb-4615-fdb4-08db0aee5f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+PEu65gMCcrAPJte+Fq2vtE5U8J0g4Bv7lhbajVdloJ8DT4HKckojwug+FADKAj5+yzS9TjB7/fbZYqbuZ1X+cRTcJlyVXo3JnfO5xzSqIo+3Ro2hkKsWfvU7CSfFq4+50X6qzut+TSOt40ZXrc1xRNyiYz6Lw4byeEV2IX0GO7ljMVn2XbWpiPnPFSkF1UPx6OmKGuGpjj3OYq8DXXgX1qHLW9lgPBzzgI2+Qte6a6+day6oZlVLzeSSVHBhY5ZZU2ATEjrjUw2YfJVxCkFRDxlPAYYm4TQiUc4hGOhebBotgnnQAtwYiKVamL8lNC2nLBYgdlUe01us7JCmX54OPURS/6Nx74DuZSAMLFmt+yF8NTALNpYbKDEbPutjWS79ICVXqGpYiPMhp3BTbCE6vHrJzrgB3eidqJVb7cywNO5m6F2O4VD96LF91/R1lyHVtZvtMU0Fi7WN8BHJ5gjkQRfKvkSCfUcooS+ktzki8DNax1hM8Zvk3NI8xDcbrH/jStYE6k3iKRcE3LPe0Lurcr+vbRQBMdZmNXMah3JquypBSLwt498zODVNCXbyxNoKL1zydwm/cUjmQgZiuivi+UoeUTYBhToIj4RTi02QeU250Cj6JLpPO3AqhdZLhTeKUa20r+hraj2QwGdoyZnh8vYM0LmJHrdGxcYbvzsx+CDZSMOxlp5c+ZQhWK9QgoeUNjmj5r9P4pek82GyOO9DhMPI3rxNdc95MN+MQ1ba7TF4ZYMsVvbJjxpN/zaMeZ2Gq52uR/8zXfOAGEL+ztRQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199018)(40470700004)(36840700001)(46966006)(16526019)(86362001)(7416002)(921005)(186003)(26005)(5660300002)(44832011)(81166007)(8936002)(6666004)(82740400003)(2906002)(82310400005)(70586007)(70206006)(4326008)(356005)(8676002)(41300700001)(36860700001)(316002)(40480700001)(1076003)(40460700003)(426003)(2616005)(478600001)(47076005)(7696005)(54906003)(36756003)(83380400001)(336012)(110136005)(81973001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 22:38:32.4722
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd363c51-4dbb-4615-fdb4-08db0aee5f97
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT109.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6233
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The TEE subdriver for CCP, the amdtee driver and the i2c-designware-amdpsp
drivers all include `psp-sev.h` even though they don't use SEV
functionality.

Move the definition of `__psp_pa` into a common header to be included
by all of these drivers.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 arch/x86/kvm/svm/sev.c                     |  1 +
 drivers/crypto/ccp/sev-dev.c               |  1 +
 drivers/crypto/ccp/tee-dev.c               |  2 +-
 drivers/i2c/busses/i2c-designware-amdpsp.c |  2 +-
 drivers/tee/amdtee/call.c                  |  2 +-
 drivers/tee/amdtee/shm_pool.c              |  2 +-
 include/linux/psp-sev.h                    |  8 --------
 include/linux/psp.h                        | 14 ++++++++++++++
 8 files changed, 20 insertions(+), 12 deletions(-)
 create mode 100644 include/linux/psp.h

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 86d6897f48068..ee8e9053f4468 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -11,6 +11,7 @@
 #include <linux/kvm_host.h>
 #include <linux/kernel.h>
 #include <linux/highmem.h>
+#include <linux/psp.h>
 #include <linux/psp-sev.h>
 #include <linux/pagemap.h>
 #include <linux/swap.h>
diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index e2f25926eb514..28945ca7c8563 100644
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@ -24,6 +24,7 @@
 #include <linux/cpufeature.h>
 #include <linux/fs.h>
 #include <linux/fs_struct.h>
+#include <linux/psp.h>
 
 #include <asm/smp.h>
 #include <asm/cacheflush.h>
diff --git a/drivers/crypto/ccp/tee-dev.c b/drivers/crypto/ccp/tee-dev.c
index 5c9d47f3be375..f24fc953718a0 100644
--- a/drivers/crypto/ccp/tee-dev.c
+++ b/drivers/crypto/ccp/tee-dev.c
@@ -13,7 +13,7 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/gfp.h>
-#include <linux/psp-sev.h>
+#include <linux/psp.h>
 #include <linux/psp-tee.h>
 
 #include "psp-dev.h"
diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 8f36167bce624..80f28a1bbbef6 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -4,7 +4,7 @@
 #include <linux/bits.h>
 #include <linux/i2c.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
-#include <linux/psp-sev.h>
+#include <linux/psp.h>
 #include <linux/types.h>
 #include <linux/workqueue.h>
 
diff --git a/drivers/tee/amdtee/call.c b/drivers/tee/amdtee/call.c
index cec6e70f0ac92..e8cd9aaa34675 100644
--- a/drivers/tee/amdtee/call.c
+++ b/drivers/tee/amdtee/call.c
@@ -8,7 +8,7 @@
 #include <linux/tee_drv.h>
 #include <linux/psp-tee.h>
 #include <linux/slab.h>
-#include <linux/psp-sev.h>
+#include <linux/psp.h>
 #include "amdtee_if.h"
 #include "amdtee_private.h"
 
diff --git a/drivers/tee/amdtee/shm_pool.c b/drivers/tee/amdtee/shm_pool.c
index f87f96a291c99..f0303126f199d 100644
--- a/drivers/tee/amdtee/shm_pool.c
+++ b/drivers/tee/amdtee/shm_pool.c
@@ -5,7 +5,7 @@
 
 #include <linux/slab.h>
 #include <linux/tee_drv.h>
-#include <linux/psp-sev.h>
+#include <linux/psp.h>
 #include "amdtee_private.h"
 
 static int pool_op_alloc(struct tee_shm_pool *pool, struct tee_shm *shm,
diff --git a/include/linux/psp-sev.h b/include/linux/psp-sev.h
index 1595088c428b4..7fd17e82bab43 100644
--- a/include/linux/psp-sev.h
+++ b/include/linux/psp-sev.h
@@ -14,14 +14,6 @@
 
 #include <uapi/linux/psp-sev.h>
 
-#ifdef CONFIG_X86
-#include <linux/mem_encrypt.h>
-
-#define __psp_pa(x)	__sme_pa(x)
-#else
-#define __psp_pa(x)	__pa(x)
-#endif
-
 #define SEV_FW_BLOB_MAX_SIZE	0x4000	/* 16KB */
 
 /**
diff --git a/include/linux/psp.h b/include/linux/psp.h
new file mode 100644
index 0000000000000..202162487ec3b
--- /dev/null
+++ b/include/linux/psp.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __PSP_H
+#define __PSP_H
+
+#ifdef CONFIG_X86
+#include <linux/mem_encrypt.h>
+
+#define __psp_pa(x)	__sme_pa(x)
+#else
+#define __psp_pa(x)	__pa(x)
+#endif
+
+#endif /* __PSP_H */
-- 
2.34.1

