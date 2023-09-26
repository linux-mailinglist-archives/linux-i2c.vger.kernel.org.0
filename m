Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E84C77AECC9
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Sep 2023 14:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234653AbjIZM21 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 08:28:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234644AbjIZM2Z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 08:28:25 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9BD93FC;
        Tue, 26 Sep 2023 05:28:18 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F7841480;
        Tue, 26 Sep 2023 05:28:56 -0700 (PDT)
Received: from e103737-lin.cambridge.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 475BB3F6C4;
        Tue, 26 Sep 2023 05:28:17 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
Date:   Tue, 26 Sep 2023 13:28:02 +0100
Subject: [PATCH 3/3] hwmon: (xgene) Migrate to use generic PCC shmem
 related macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-pcc_defines-v1-3-0f925a1658fd@arm.com>
References: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
In-Reply-To: <20230926-pcc_defines-v1-0-0f925a1658fd@arm.com>
To:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=xAB9DO9/WuBfrCyxIgct5Wml2oQRa0x+hPVPHrXNjoA=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBlEs5dgRCkg3Q8R+TXzB+/wrKszSybk6z9171cI
 3pqISWetFmJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZRLOXQAKCRAAQbq8MX7i
 mLEGEACl2JMbMOB+9OV8WlvKM7hyGqeLYE6pFW9p0ZqGXyCXsWZaZiAtXXFKjl9/l7Yi5oeoIrE
 dOK4RA1guAGaulOWlUZRn3E1VfZLwtUTztToPY6AP7sqXUbIouIRHajm6e6AEKs1PQlMIH6TSSQ
 HJa24nPd863GDeAgwSTO6Zc2vxv4A6ea+L40qP1U13f1xlj0vEaarNJ1qMfVo+T+xh2NyxpSlOB
 ptpiVoGj4JCBAFfm5bXKwegkaN/sXGe6G8vrJq9mpaCmtJ6eeAzimJIuufvmanNUGi8q/CMwKOJ
 avyx9YuhtVdlNhKN0eR5Yzs9blKq9nxQU2tGHKObR/2cUG41MZ4j3aJ4x5p9K0+91bn0G5VzdG9
 SzoZ2ehCblxfvjQP+15G1HLGfzfN2LBiyzi49cC48k72DxdLf1kxg2QOGfhCSuL8tb/eqeF6NAw
 m/aiGnxi7tVr53hP9aZ3XFUzpnuiz2r4wJs9n+kxV7srdj+CTa0U9LWKicfw2oQsjJYtnvyBqtF
 Pp+GxV2/2412qdNkjkAmnwOlU7aUW7FXkyfPOOBs5owBjoId3PxXttnqBTN009QwoiySA2ns4jZ
 lNv2UOxRJ2sGlZBdlbBvhTWfOnBX57RVNb0jXtNhmSBh8uZvvmYPUbmGm6sz0jRuAQNYUqygubF
 4WxWWr0QKYreLMA==
X-Developer-Key: i=sudeep.holla@arm.com; a=openpgp;
 fpr=7360A21742ADF5A11767C1C139CFD4755FE2D5B4
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the newly defined common and generic PCC shared memory region
related macros in this driver to replace the locally defined ones.

Cc: Jean Delvare <jdelvare@suse.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/hwmon/xgene-hwmon.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 78d9f52e2a71..1ccdd61b6d13 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -57,12 +57,6 @@
 	(MSG_TYPE_SET(MSG_TYPE_PWRMGMT) | \
 	MSG_SUBTYPE_SET(hndl) | TPC_CMD_SET(cmd) | type)
 
-/* PCC defines */
-#define PCC_SIGNATURE_MASK		0x50424300
-#define PCCC_GENERATE_DB_INT		BIT(15)
-#define PCCS_CMD_COMPLETE		BIT(0)
-#define PCCS_SCI_DOORBEL		BIT(1)
-#define PCCS_PLATFORM_NOTIFICATION	BIT(3)
 /*
  * Arbitrary retries in case the remote processor is slow to respond
  * to PCC commands
@@ -142,15 +136,15 @@ static int xgene_hwmon_pcc_rd(struct xgene_hwmon_dev *ctx, u32 *msg)
 
 	/* Write signature for subspace */
 	WRITE_ONCE(generic_comm_base->signature,
-		   cpu_to_le32(PCC_SIGNATURE_MASK | ctx->mbox_idx));
+		   cpu_to_le32(PCC_SIGNATURE | ctx->mbox_idx));
 
 	/* Write to the shared command region */
 	WRITE_ONCE(generic_comm_base->command,
-		   cpu_to_le16(MSG_TYPE(msg[0]) | PCCC_GENERATE_DB_INT));
+		   cpu_to_le16(MSG_TYPE(msg[0]) | PCC_CMD_GENERATE_DB_INTR));
 
 	/* Flip CMD COMPLETE bit */
 	val = le16_to_cpu(READ_ONCE(generic_comm_base->status));
-	val &= ~PCCS_CMD_COMPLETE;
+	val &= ~PCC_STATUS_CMD_COMPLETE;
 	WRITE_ONCE(generic_comm_base->status, cpu_to_le16(val));
 
 	/* Copy the message to the PCC comm space */
@@ -544,7 +538,7 @@ static void xgene_hwmon_pcc_rx_cb(struct mbox_client *cl, void *msg)
 	msg = generic_comm_base + 1;
 	/* Check if platform sends interrupt */
 	if (!xgene_word_tst_and_clr(&generic_comm_base->status,
-				    PCCS_SCI_DOORBEL))
+				    PCC_STATUS_SCI_DOORBELL))
 		return;
 
 	/*
@@ -566,7 +560,7 @@ static void xgene_hwmon_pcc_rx_cb(struct mbox_client *cl, void *msg)
 	      TPC_CMD(((u32 *)msg)[0]) == TPC_ALARM))) {
 		/* Check if platform completes command */
 		if (xgene_word_tst_and_clr(&generic_comm_base->status,
-					   PCCS_CMD_COMPLETE)) {
+					   PCC_STATUS_CMD_COMPLETE)) {
 			ctx->sync_msg.msg = ((u32 *)msg)[0];
 			ctx->sync_msg.param1 = ((u32 *)msg)[1];
 			ctx->sync_msg.param2 = ((u32 *)msg)[2];

-- 
2.42.0

