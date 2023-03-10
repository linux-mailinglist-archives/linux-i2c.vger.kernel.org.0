Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFFA56B52B4
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Mar 2023 22:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231469AbjCJVWg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 10 Mar 2023 16:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231383AbjCJVWe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 10 Mar 2023 16:22:34 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2052.outbound.protection.outlook.com [40.107.102.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC6A212B7DA;
        Fri, 10 Mar 2023 13:22:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=by/igJ5XMCXz8aQ5i7qejWGCEYR/vzA7vta1HkhuHSHy4OMpQvQnrZ1J81QrWYypkdxybRdBRUZUiw6B1BYdVwrqltdP7EtqZtELpno2v3FlmbE/9XCw1osDL7TubyYU2cLW3lL2zC3GetVhDaewOckYgLuCp4LYidZEojBRm2T8bbQhwwykHUv58hLXByGbumhdOJJe8zljkYeqKUmqcI72IWWblsszj3ozuMFVL6MWKA5h6PKZWbK2lGxL8HMyUZY9gJaMJB6egJjdQYoJe6V8KH/uGFbpzTfzy7lYuwhDjaupWOegr8QhU9wuGCAFuG5ZjOKDWaEpyf0puzjJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuFABClax6BVJFKjxf0andJaMVVcPdFZx4+m4olz05g=;
 b=PALYE61ZvNRS5WjNTJdB2tKqh18VYAuKuzxX6JrFwVbt4/2TweOjnEDH+aAKVKoopc4F58Kt5E38qC248yC550gJ5DS2LFjaR/nzX17mokAXrueVIgJZ2U4ouEDVgtC0f5emiVwjzUfmf3iOq5An9p7rQw1oc07EHre2/BQNY3iaZ5YjoIw7weFW8LHmlm5hB4xx6MNHhg5Jo6E93ukk4gdU9iBiGJjNAAD8PM1lz+hwsIh04zRnpejNg51JFWEnuEY+uHOywPL5OyJtSskI1UzRfLgOjOs8KIoinO3pXbXbEnfR7Q0wiDty44tWJXrdgQG18ne6wKY5m9BdVF8CpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuFABClax6BVJFKjxf0andJaMVVcPdFZx4+m4olz05g=;
 b=gHPRCVTD/ooroqEcJb8afFe1uufC4TMGlkgasW5H+GVXbb/YBLVQEbPy9u+H69QDvGX1KMgdHM6+Sim9C9ZVYlSuzlRJALgtuGBjDFXsCLq+Bqzyk8htM11zpkeopKNTd8DHEUoDGUmtitg5b7mkow0ImavobHn1XMBB04LBqWg=
Received: from DS7PR05CA0027.namprd05.prod.outlook.com (2603:10b6:5:3b9::32)
 by LV2PR12MB5944.namprd12.prod.outlook.com (2603:10b6:408:14f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 21:22:26 +0000
Received: from DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::b7) by DS7PR05CA0027.outlook.office365.com
 (2603:10b6:5:3b9::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19 via Frontend
 Transport; Fri, 10 Mar 2023 21:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT075.mail.protection.outlook.com (10.13.173.42) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.20 via Frontend Transport; Fri, 10 Mar 2023 21:22:26 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 10 Mar
 2023 15:22:24 -0600
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
CC:     <Felix.Held@amd.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        "Sumit Garg" <sumit.garg@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Ingo Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jens Wiklander <jens.wiklander@linaro.org>,
        <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-crypto@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <op-tee@lists.trustedfirmware.org>
Subject: [PATCH v4 2/8] crypto: ccp: Add a header for multiple drivers to use `__psp_pa`
Date:   Fri, 10 Mar 2023 15:19:45 -0600
Message-ID: <20230310211954.2490-3-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DM6NAM11FT075:EE_|LV2PR12MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 5db611bd-8975-4bab-ae3e-08db21ad8bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eBNEFJ+QyQefx9AbDbTUifCFyQlm0ARnqK9CxDH/pnz6CGXMVFu1Ek0mPa1AXAJXa8a0RQiGI0QJwvdyqQNi/8WYOj8DVtF9OFXHX59jdUGiT/6CRnYdT7CQnO0WHrArGBkE7q6AZMLBtXV0P4Um4o78gBXH4/UQzYPM/dzI89+SNJSXvypWixbHxaWrtxZdTjmQrUENWVfOYUyortj54OOF3NBUjKSsRjUvsGeCz7dpSzOWLL1s/Lu+W53zjX7D0ZF9zZzeJ6xeAdLnda4tBe1XspQttMYkWeXFQGpACHAXbq8tK+RFCuVbxEmYDMY0rN1z8YpzlmYjMHV9ROYZwlY42ewSrN1P03gK0J+oL8ikQlmfkkMXrnzRXFcU0snqOIIFn1RWT8PLGGBIyzMFmGD8bvuGMQQCwRRxn5IviYhKZdV4N7S3if4BYr7/intbLWKSd4qcHB1LhAr7yMYLU841oj8FOqs86BasvrrwuwE0B92JvAn5e0RYnQz6nD4t9rrAWTQccL3G6s1hvShgvCrgjuudFvVD9qa7y+k5Vj0J9YZj5k60+Y/3dw+pPw0EOMwzjGNNZo25aGGKWd0YzSnh59JqcrBNkCpq8rU/wfBDK3W7oB4+Zq24WhXlu7Sfq0UZ53w5zgCDA1zy9er2HoxMNcsilhaEUwWvdJI0nP30ImUea1W5pb4n7IUuY0mGyiZnRxcLJeibhqM5i3b4A4J7M4aZMz2loH2oePlq0kcmAtSaM4GZRrMe7SSRS4h+X8uKTbv3NqKbtFuuMrhZgQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(39860400002)(396003)(451199018)(46966006)(40470700004)(36840700001)(82310400005)(1076003)(82740400003)(36860700001)(83380400001)(47076005)(426003)(36756003)(40480700001)(110136005)(54906003)(478600001)(921005)(316002)(356005)(41300700001)(7696005)(2616005)(81166007)(6666004)(186003)(26005)(16526019)(7416002)(70206006)(44832011)(40460700003)(336012)(5660300002)(8936002)(70586007)(4326008)(2906002)(86362001)(8676002)(81973001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 21:22:26.0257
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db611bd-8975-4bab-ae3e-08db21ad8bc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT075.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5944
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
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
Acked-by: Tom Lendacky <thomas.lendacky@amd.com>
Acked-by: Sean Christopherson <seanjc@google.com> # KVM
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v3->v4:
 * Pick up tags
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

