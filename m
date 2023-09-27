Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDC597B0A13
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 18:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbjI0Q0z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 12:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231714AbjI0Q0w (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 12:26:52 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE08B10E;
        Wed, 27 Sep 2023 09:26:45 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D78111FB;
        Wed, 27 Sep 2023 09:27:23 -0700 (PDT)
Received: from e103737-lin.cambridge.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 497373F59C;
        Wed, 27 Sep 2023 09:26:44 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
Date:   Wed, 27 Sep 2023 17:26:12 +0100
Subject: [PATCH v2 3/4] hwmon: (xgene) Migrate to use generic PCC shmem
 related macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-pcc_defines-v2-3-0b8ffeaef2e5@arm.com>
References: <20230927-pcc_defines-v2-0-0b8ffeaef2e5@arm.com>
In-Reply-To: <20230927-pcc_defines-v2-0-0b8ffeaef2e5@arm.com>
To:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Huisong Li <lihuisong@huawei.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2541; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=e32Z/r3IaDsaHYHj8nWt4Lv8AVCNX6N7POaKljbyrBw=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBlFFe/8ATNQ5W5OhNKHHOyXc8O/Ufd6H65Udjmc
 TST24uWvkCJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZRRXvwAKCRAAQbq8MX7i
 mBdwD/0VOPlPLeqGxEZBFzP9A0cUwIarRy9KpK+Yg33rj+6kw4Z8qmoK24Gao7B2RtUPOEcf48k
 qbCLgXlDmYg76gsa7jWGqPOMRLKNlq0Wgw8hEpvR2lerjZQcPpDI2eIoA4WQNBPSx1vPTRyJKuE
 Gm26pPsek3QBqZY716E83MsTb1uAZGKXbLEMlWCpp/NDEg5QLFteRu1K0JmAI7mxh4uNuDa7CJW
 vVvLfjS4R0UGRPAE/NV8j6n1kJreAsv2ymXQf7YAWdeuHoL7CwhBTLf62h4O0OgEOnfddCNbBdK
 HKNo/+PvRezPV1iqM3GbJd4xbT2cP4ynQsstdvcm/PwL3KvdTTcvj7AIbP5mh+Pbyaa92YSODGV
 skhvad0B86/wTjR0bUV7029aQz+q2j60aKsAEBvz52IZ4Hg8kA+LbMa624vpOpyZPujSfHyjhsY
 ybGSre4RLUPW5EwDIjLA3+48BI2HQn3bKkDmNWFOZ1a3ucKTjcZuBaP3D0+q0y4uKboAVkzspD7
 2EkjL6Hm1S+tX2fC/dxjStvZI0pNqC7Plb1CfD15Cw02HzzowrqsjSN0tzeYQM4mezdWmFfVNEd
 GVlwT8NRG0sauMt29SoQJTUju2Ab+eVV1lLtl75sAkK07bpJu2SQdLV5W0rBMWL+FkosXEV/8pA
 JDg4FvJ4TkOKvJQ==
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
Acked-by: Guenter Roeck <linux@roeck-us.net>
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

