Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B737AECCC
	for <lists+linux-i2c@lfdr.de>; Tue, 26 Sep 2023 14:28:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjIZM2X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 08:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234632AbjIZM2W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 08:28:22 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 03C4D10E;
        Tue, 26 Sep 2023 05:28:16 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEE4ADA7;
        Tue, 26 Sep 2023 05:28:53 -0700 (PDT)
Received: from e103737-lin.cambridge.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69B53F6C4;
        Tue, 26 Sep 2023 05:28:14 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
Date:   Tue, 26 Sep 2023 13:28:00 +0100
Subject: [PATCH 1/3] ACPI: PCC: Add PCC shared memory region command and
 status bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-pcc_defines-v1-1-0f925a1658fd@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=NVqjx3KgceHBDTtKRT2jKbwqByxepAzV4t81BveYQ5M=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBlEs5cZoCKp1fj4orfty+KxtexocPaVbXd7vjYf
 uLKxbZc9vGJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZRLOXAAKCRAAQbq8MX7i
 mLPaD/4vBWFKN8LW/fljCcv/jfrVigPDq5yyR4l6t/r19KeSBzENurRpQFPTxwg+oa88Wvnyu6s
 UO/+1IdUR4MotZ48Sb2rZUJKqPQP4iUGGPlC+q9EVW5TrTFpBBI+kNMxfp6mqSj6xCvKo+oROpE
 IPc3DJEUogDgTu1z70K7Ll5C1mxzmhJrZMEo/f5WGxXUETEfpb93rhUWcHSwC9flEc5a6gETG36
 1fZ/rQHy2UVdLaNwpPQDeCpSl4CXcxyPk8FmKmlV/2bm2ZECgd5JgjuREZ56NA8mEcQN2VA4ODL
 pDYMQAuSTWXnAK0f3dMdMsXDoE1SzwcpAg5nlouZPEjg6790k2WMpK/oAPlqQA6X2OA+PLWnztu
 n+euqI/RQhCFohzKjvrW5/X5jMXCiVDgG7+wfoSeuWURqkCYSPD9cPQza0OP2FP7mHE9/lJv4I5
 0RKBAHZpM2kjOgUcyziNGhnNx6pci8rVZXh8BytvUzpo2treIB/6vabmJiwWIjGyTa25IWibQhj
 SuhHVcAPVtWsEfte13t3DoLLphVQxCddRyrJOgrB5nXGTDJJpIgJZUPZL6JSWlW9gDWm9uVeW08
 zJSdNwCG+8lwVfWL8L1nBTNA89dab4dcVaZmX4LoHvqRWud9C6Ss17aygeNx0zMdXXaw/mazg2N
 y+70fICPW4QTJnw==
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

Define the common macros to use when referring to various bitfields in
the PCC generic communications channel command and status fields.

Currently different drivers that need to use these bitfields have defined
these locally. This common macro is intended to consolidate and replace
those.

Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 include/acpi/pcc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/acpi/pcc.h b/include/acpi/pcc.h
index 73e806fe7ce7..66d9934c2ee4 100644
--- a/include/acpi/pcc.h
+++ b/include/acpi/pcc.h
@@ -18,7 +18,18 @@ struct pcc_mbox_chan {
 	u16 min_turnaround_time;
 };
 
+/* Generic Communications Channel Shared Memory Region */
+#define PCC_SIGNATURE			0x50424300
+/* Generic Communications Channel Command Field */
+#define PCC_CMD_GENERATE_DB_INTR	BIT(15)
+/* Generic Communications Channel Status Field */
+#define PCC_STATUS_CMD_COMPLETE		BIT(0)
+#define PCC_STATUS_SCI_DOORBELL		BIT(1)
+#define PCC_STATUS_ERROR		BIT(2)
+#define PCC_STATUS_PLATFORM_NOTIFY	BIT(3)
+
 #define MAX_PCC_SUBSPACES	256
+
 #ifdef CONFIG_PCC
 extern struct pcc_mbox_chan *
 pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id);

-- 
2.42.0

