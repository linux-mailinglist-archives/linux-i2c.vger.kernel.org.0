Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 517426A9C43
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Mar 2023 17:51:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbjCCQvq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Mar 2023 11:51:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbjCCQvn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Mar 2023 11:51:43 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750515D760;
        Fri,  3 Mar 2023 08:51:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQbCdzmhIGCCBi+V5o/UUbV5M8iiRwi3iCih+/5vm6cjomaa04GCskJXY4r5sP0GY4zk280KQbdMA0xw3V9/AalMnUfCwUrOd7nr7oTplGoCe6pQEe1SChT+0AmxnrwUJR7hmNRlJe79AQz3gsFAK0kiFi7e6SsZQFbQRIa+VC6AB6owsexVkEozgGFEFXpc2GiKKZUL1cJ4Bqvcf4SsU0vyFHVlQaWjua+ue0bTazjGcQjtOC23viyP5CkQJZ9u0AR0/araqw+Lm/bD3lRizDj2ThMF8rlnNUEkstisccuvNysKt40Ww2cpHwsbXRu1r7JadINwwJP3EAtGTxP1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XExh6Qbc0HUbp4dAX6paQ+nw4APW447RRFeKajIQSIk=;
 b=V1tHAvlA+PQGKSAjGzVlG3jOSYiRbBm8Cki4ZZpNWpAIk7vbEzIvWaTbJWDlBvZ3w8zvMvY1e3TQR+KWOcQAwVvradcJBqPIZHKBLNXP3nYDD3T8KN6C+M+b9943MC9aWzhZC8OD8KH0E4KQn2YgQMaSVNJRVV9vlqPANZHa4wfP0kWHF3yWaSD8KxOjiSy0pF00JZkHHMP1XWIyZdd/NLWvvenjmskEWEES2jit5lSGcIEcSJ1xAiEAJZwERLvXLLUH7vKuqQ4dl750qkkxgSeF68waAHTBC2plaJCsISXDv4mqHAx4REKG9kjE38ZNGr7mN+6WlZ1zsORgTeOhqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XExh6Qbc0HUbp4dAX6paQ+nw4APW447RRFeKajIQSIk=;
 b=ZgjH0OsGlklj1nGL1+nxPagroptmx2+vJplYMQb5xNmdbJDj/fahSFJxDB97mFd8aJAezNVoAl1qvBA57ODHdMHDIU7PvpybdOSEyqfrZzJ2Gd6rMXlEbaKCoqMHqV9HPNXRrYkcwKCmRmvT9V2vxd91a77HLASys3dUaqPbJL0=
Received: from MW4PR03CA0336.namprd03.prod.outlook.com (2603:10b6:303:dc::11)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.22; Fri, 3 Mar
 2023 16:51:09 +0000
Received: from CO1NAM11FT091.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:dc:cafe::57) by MW4PR03CA0336.outlook.office365.com
 (2603:10b6:303:dc::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.21 via Frontend
 Transport; Fri, 3 Mar 2023 16:51:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT091.mail.protection.outlook.com (10.13.175.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.22 via Frontend Transport; Fri, 3 Mar 2023 16:51:08 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 3 Mar
 2023 10:51:06 -0600
From:   Mario Limonciello <mario.limonciello@amd.com>
To:     =?UTF-8?q?Jan=20D=C4=85bro=C5=9B?= <jsd@semihalf.com>,
        Grzegorz Bernacki <gjb@semihalf.com>,
        <Rijo-john.Thomas@amd.com>, <Thomas.Lendacky@amd.com>,
        <herbert@gondor.apana.org.au>,
        Sean Christopherson <seanjc@google.com>,
        "Paolo Bonzini" <pbonzini@redhat.com>,
        Brijesh Singh <brijesh.singh@amd.com>,
        "Tom Lendacky" <thomas.lendacky@amd.com>,
        John Allen <john.allen@amd.com>,
        "Jarkko Nikula" <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
CC:     Mario Limonciello <mario.limonciello@amd.com>,
        Sumit Garg <sumit.garg@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>
Subject: [PATCH v3 2/9] crypto: ccp: Add a header for multiple drivers to use `__psp_pa`
Date:   Fri, 3 Mar 2023 10:50:40 -0600
Message-ID: <20230303165050.2918-3-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: CO1NAM11FT091:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: 5971ef95-42d5-4bf9-181d-08db1c077cec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dErXDvke7aRINFhpkHQ8Z9iEaM/vN4prg64c9d8taqJMiBT56LA8p5dgExOUYt5CLxMdcNfRcB6bkM1hlA6IFL0HqJYNMjtiFYPv+ox9Ua5dPEL4OjPmcFc8Zwewhro8uE4z1Vamgrzi3zT57UIuiHjLG6wHrMO/KfMeWzBa7YZMsswplkOrqFXJNEuZILltbpHGTS2vYsFqjl5mMUgZxFdSyC6M3hcwNNv+kfHjzlB62H00VCnEEfwbi+v22KzfyMOypLTX0/seyuA8JNHe4GDSBubG4/4ROGzoXczykVBr7pcrMm17bcJyuML2ubMDo8r6nGXxRRPP4eXJhzTlmBpCM79Rh7noTRI/yFM0NCJABwLZNJ4It6YIJ+7Do/cAzn0gR11huEbhy4OR7SjyKgWchZ4DRzvBoN502fZhjyrunC2Us0Y6jQpvHWhG86C8HN1H6Dovhfe9SX+IiQYlGtS6ClBeoJdU4jUngpmLFuTU8BJufvgI+K7SaRN4xrNAYDD2ZlPm8YgCgjH1QUsQjs89NA6rQ25muoGTtkVs6b4XfOreJlfwSS7wD6udaX6fkVTpT8v2Dv7hmpLRurzq7ejFKLQ41aTBNfXKepsaVRxbOTJoNAadPqEqjFtcjGIwJ8F1QwdyWisfoxRka/7SNVOSfWRvpBNsaP4bH6U9UbLEVQkpphrlbhuXB/fnL04dTlDE4CBUvVfQN8PD32KSl4GNRz8G2Ii5LXvYJJP7HynPCe1jiRw1JvTggKmgHqtfhnxFXidkTAMy4wusqT32pQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199018)(40470700004)(36840700001)(46966006)(336012)(36860700001)(8936002)(7696005)(1076003)(26005)(2616005)(6666004)(16526019)(186003)(41300700001)(478600001)(54906003)(83380400001)(110136005)(316002)(921005)(4326008)(356005)(8676002)(40480700001)(47076005)(40460700003)(70586007)(426003)(70206006)(81166007)(82310400005)(86362001)(7416002)(2906002)(5660300002)(82740400003)(44832011)(36756003)(81973001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 16:51:08.7847
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5971ef95-42d5-4bf9-181d-08db1c077cec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT091.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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

Reviewed-by: Jan Dabros <jsd@semihalf.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com> # For the drivers/i2c/busses/i2c-designware-amdpsp.c
Acked-by: Sumit Garg <sumit.garg@linaro.org> # For TEE subsystem bits
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * Add tags
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
index c25aeb550cd9..ec18a756b7c9 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -12,6 +12,7 @@
 #include <linux/kvm_host.h>
 #include <linux/kernel.h>
 #include <linux/highmem.h>
+#include <linux/psp.h>
 #include <linux/psp-sev.h>
 #include <linux/pagemap.h>
 #include <linux/swap.h>
diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index e2f25926eb51..28945ca7c856 100644
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
index 5c9d47f3be37..f24fc953718a 100644
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
index 8f36167bce62..80f28a1bbbef 100644
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
index cec6e70f0ac9..e8cd9aaa3467 100644
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
index f87f96a291c9..f0303126f199 100644
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
index 1595088c428b..7fd17e82bab4 100644
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
index 000000000000..202162487ec3
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

