Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47A657B0A14
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 18:27:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbjI0Q04 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 12:26:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231860AbjI0Q0y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 12:26:54 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1AFCD139;
        Wed, 27 Sep 2023 09:26:47 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A04C12FC;
        Wed, 27 Sep 2023 09:27:25 -0700 (PDT)
Received: from e103737-lin.cambridge.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA64D3F59C;
        Wed, 27 Sep 2023 09:26:45 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
Date:   Wed, 27 Sep 2023 17:26:13 +0100
Subject: [PATCH v2 4/4] soc: kunpeng_hccs: Migrate to use generic PCC shmem
 related macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-pcc_defines-v2-4-0b8ffeaef2e5@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=u2l37EKodWl3t9KxuqJG431SMIrlAILGoiCEw5HkoSE=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBlFFe/MXQmrQGDt88mM/QuYZQQEwA0o/hLokyjA
 Qtrf/ED40uJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZRRXvwAKCRAAQbq8MX7i
 mJicEADBde2Fk7xTC+4jwSkOtCCkC4G/OVOGdOkVedcKO4keIhCg3lPB7DlKqPpwXJechXVZCNJ
 22v3vOv5cAojUmOVqXIa2kR1IN8wAeeKn9FkbRd0QmS4DLG0SPjxTOqw44eLWbYhn9zBxTFZ0zI
 E5P68YSocsTMtiNKXZ5+TnET1fJJGfkMlxBal91M9jonwmXwjThZW8MwEV1SKWmtY01NtznhnL8
 SmEtcB3+PuEXDHPrSZqR0Vl4GtfE3dNUEY5mKD+nL5MGy+Cobmqu6fDXKwnU4lqcv/twOeSNoSm
 sbPyEPcjyztqZk5tn0O0nswbc9mecLsBhR294g54qTycx9BxilFSUSp7Kv7Hda/6e6Oyp8aqrD2
 0Wk1nl6oi0nZMzzEpDMYJTwI6ORfQLQaGqLQ7GMJzaKaskFHwd9wdgVk/ssojjh1AIUo3bMVkH7
 dQyWosO6FIV23mcQc3HQnZujjitBpGglaXlYYYUpG/0d0bpk9GS8uMKIz9u36GhM9/sTkaNEjIT
 UZrcAMjOETjmNHl4Ih3hN9JNyQbGIelMtewDRUmiOrGcQHUJKXr5+vok5H8phxPyjbaemp9K6TS
 l3muPI06WmkrPCw3WXzmHYUpSGhxWCJwdIoI7pS5ikNGRl9ppXBR72Pb0ma39f/8uB/RBpqovVT
 JJNY7i5cWit+j9g==
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

Cc: Huisong Li <lihuisong@huawei.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/soc/hisilicon/kunpeng_hccs.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/hisilicon/kunpeng_hccs.c b/drivers/soc/hisilicon/kunpeng_hccs.c
index f3810d9d1caa..27a96cafd1ea 100644
--- a/drivers/soc/hisilicon/kunpeng_hccs.c
+++ b/drivers/soc/hisilicon/kunpeng_hccs.c
@@ -31,10 +31,6 @@
 
 #include "kunpeng_hccs.h"
 
-/* PCC defines */
-#define HCCS_PCC_SIGNATURE_MASK		0x50434300
-#define HCCS_PCC_STATUS_CMD_COMPLETE	BIT(0)
-
 /*
  * Arbitrary retries in case the remote processor is slow to respond
  * to PCC commands
@@ -187,7 +183,7 @@ static int hccs_check_chan_cmd_complete(struct hccs_dev *hdev)
 	 * deadline_us(timeout_us) until PCC command complete bit is set(cond)
 	 */
 	ret = readw_poll_timeout(&comm_base->status, status,
-				 status & HCCS_PCC_STATUS_CMD_COMPLETE,
+				 status & PCC_STATUS_CMD_COMPLETE,
 				 HCCS_POLL_STATUS_TIME_INTERVAL_US,
 				 cl_info->deadline_us);
 	if (unlikely(ret))
@@ -208,7 +204,7 @@ static int hccs_pcc_cmd_send(struct hccs_dev *hdev, u8 cmd,
 	int ret;
 
 	/* Write signature for this subspace */
-	tmp.signature = HCCS_PCC_SIGNATURE_MASK | hdev->chan_id;
+	tmp.signature = PCC_SIGNATURE | hdev->chan_id;
 	/* Write to the shared command region */
 	tmp.command = cmd;
 	/* Clear cmd complete bit */

-- 
2.42.0

