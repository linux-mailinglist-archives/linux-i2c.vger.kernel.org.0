Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81756A89A9
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Mar 2023 20:43:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjCBTnh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Mar 2023 14:43:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbjCBTnb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Mar 2023 14:43:31 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2060.outbound.protection.outlook.com [40.107.244.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB63C55059;
        Thu,  2 Mar 2023 11:43:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCi371iPk7jumAWMi3Of6ZVdSdh9owKv6v8GAQGMC7fQZc/WPMu9pHgjKZ/XrHfbG3NuCtc1CHUy1N8wloDOxMoC+7V7X3BF1TjcAmjGZN6Yn23KQUv22Rg9ELz916BOIy6x4qkIhRuMET7IFfgpiN0gFFIfjFCuTRS0VU45TrE9tLLJTxWCHSLp47xnxhilmA+Des9V7oFfkx3ni5eW6dtyr+bDpcY/Y3maas3ToldpFDbfKT3co0KS2vk4ReKHVcsVLp+JiqYvL7WMj+LW3sgHxvht8rBDKoSgkbhG+p/QJE/6mLc2u9jkIZUPCeS1pXjcWzRECbIM3RIASKngUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XExh6Qbc0HUbp4dAX6paQ+nw4APW447RRFeKajIQSIk=;
 b=QY6w/VsrZ8SuwOvVcOwgKtQqZCWRm/W22HPe53Zx9g+KbxY1zll2SFvlrxLpvbG9Rm4UrGHP5vujl0YqhDnzq76+WOTh5IeFhWMfXZoKBSdJyiZQ1cHa4rWI0MqIk0VjXC++hdEnjsmz+hpKwftHH0ax+xVyfSuJx8EGDEmo3Wzh9oy5OA/yF1rM8X1LNx0eqxbwvFkcs5MbMqYLay9an30k17WPwD1YJkueCio2lktxSysCX2YYibJnQBY03v234GvmSIqusianuJLkevjq13FrTnp3QqNCMXDCxofTSK5ISE/Fedf7+PKSmJXjbXJgq/atFdWptMX7RTizpQGXkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=semihalf.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XExh6Qbc0HUbp4dAX6paQ+nw4APW447RRFeKajIQSIk=;
 b=gmqqyRTFe3lH4pZ1wkhM8yHwXHrnw935KAZ83AORDSxaAVyf/PSS/zSSQbb9BWQcZZQyCV8zRLcWCz94+CmpLn7+v34wgpm0tvBIBKb7vjSGtdVOXaNdFuxZf9dJgqi2rv/cSXvnodrVanptbPmrwmXLuxLr29qJ2NWiiW1RTKI=
Received: from BN9PR03CA0913.namprd03.prod.outlook.com (2603:10b6:408:107::18)
 by SA1PR12MB5613.namprd12.prod.outlook.com (2603:10b6:806:23e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Thu, 2 Mar
 2023 19:43:16 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:107:cafe::ad) by BN9PR03CA0913.outlook.office365.com
 (2603:10b6:408:107::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18 via Frontend
 Transport; Thu, 2 Mar 2023 19:43:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.21 via Frontend Transport; Thu, 2 Mar 2023 19:43:16 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Mar
 2023 13:43:04 -0600
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
Subject: [PATCH v2 2/9] crypto: ccp: Add a header for multiple drivers to use `__psp_pa`
Date:   Thu, 2 Mar 2023 13:42:25 -0600
Message-ID: <20230302194235.1724-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302194235.1724-1-mario.limonciello@amd.com>
References: <20230302194235.1724-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT025:EE_|SA1PR12MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: 71897875-8820-43ce-6cb3-08db1b565e38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5q6j/cCEzSRShinju9YH8pMiIDVzQeKoST+NTDV1fOmqrwiEanSFgor9jXbZVtBkdxCDNwzrsSsNT5Z8AZakDQ5iEAWx8YvVFaqTJAUWbvZEbtUatOAYMd80+/UyyPNZHgWbFhwXFw7BZSpuAgdpAHNiJqNrftcpzMH3+6K4eHDB0vwMO7CRAD32n7nWLOYm01+zKGR/ISeU8fZeW+ftgzKxh76e17zy/2xcIPhFZ9D0raTLQtBbFwJijUDHnhZE61vzX9YU/+8fGNXk1erGIpLgJCkir59GVAcOYjV00mdBxGaDIwcd1mQ0LkTKrjmiEkcu/h5UL0f/VNiGIUET2W/xHwAumUO/NOT4cedC9Alj2FYtfOh/qDspngPjk/TwIxOrLqZKpswIURz+o25jMSfKCSxzkDIezw7tRQujXXKLMH/uRoN/KDoxNKIh2pln4HHN0QrJN3ztekQQq+a6ScCB6pzt0ryCYex5IORLNFsFEKsQlyiVedayLa8C/rt1NQmw1mIflAVxsr32S+jJUSoPaYZZ8YR77kEUFFGn2jbzW69S2RWj8d07WzSBVs7pOMifz+sKxfk4UdJ9sjohpCtnYIvdz6ymbAwKJINFidaSXa/5TyUUHM0xlaBs+FIc17B78aTQVUgk6PdsDCIRweEmhVOlTfeDWOE16Qqx3yvVG1lTq7qCDJUWwyjRGktgiLzLoOBj/5Vq+ABSgvbuEfwV/E6rPmRLtftVG5FW3wtpqqnpH7WLar9pQlkuwXVJ2kK+jpOdqZWTR2mQ5AK/Pw==
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199018)(40470700004)(36840700001)(46966006)(16526019)(36860700001)(40460700003)(186003)(40480700001)(81166007)(82740400003)(2906002)(83380400001)(921005)(356005)(44832011)(41300700001)(8936002)(70586007)(336012)(4326008)(7416002)(70206006)(8676002)(1076003)(478600001)(47076005)(2616005)(426003)(7696005)(6666004)(5660300002)(36756003)(54906003)(316002)(110136005)(86362001)(82310400005)(26005)(81973001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 19:43:16.4481
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71897875-8820-43ce-6cb3-08db1b565e38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5613
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

