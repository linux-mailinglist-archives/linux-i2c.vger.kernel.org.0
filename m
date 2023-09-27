Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0960C7B0A0C
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 18:26:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbjI0Q0o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 Sep 2023 12:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231707AbjI0Q0o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 Sep 2023 12:26:44 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E1CCD91;
        Wed, 27 Sep 2023 09:26:42 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFEF5DA7;
        Wed, 27 Sep 2023 09:27:20 -0700 (PDT)
Received: from e103737-lin.cambridge.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C3BD3F59C;
        Wed, 27 Sep 2023 09:26:41 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
Date:   Wed, 27 Sep 2023 17:26:10 +0100
Subject: [PATCH v2 1/4] ACPI: PCC: Add PCC shared memory region command and
 status bitfields
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230927-pcc_defines-v2-1-0b8ffeaef2e5@arm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=sudeep.holla@arm.com;
 h=from:subject:message-id; bh=9gga6E/NnFW9yCBghSYbPIOChbwQimJQ3QU3cLoDpm0=;
 b=owEBbQKS/ZANAwAIAQBBurwxfuKYAcsmYgBlFFe/Me9jLT2XV71r3uVNlo9aPALmZxxlCrgOw
 X8MaCVxgRiJAjMEAAEIAB0WIQS6ceUSBvMeskPdk+EAQbq8MX7imAUCZRRXvwAKCRAAQbq8MX7i
 mCA0EACf+1nskGS7DbkO6Bb+xst1fMMtA6+zGRPIS1A70mWfBaih2si4tLQQW3e8g+W3MZPuHwu
 z21Frb3/hUz7AUY63gcpZS4RcRAP/SSKDsbko3MC2zY0W0maIg2S+hJ03RJ0Eed3aei3/d1515+
 AejrTrWhbrNyiRKfPYljB395pUZ+ggYzvrrfDVj46iF/uq4A6KiBLbw0T+Qy5v+Dnyb8Ex4gWl6
 FqfkQc2BakOeQrSyxYwjuQQvnWzr155gSsioREoHQv91Lo2xlOJeA1mFCXKiszxAa5xFkaicTxJ
 rohZFAAgkEKuAI+fpVG9327S3M6QKzUUKZ2bNtzKJHGUCBrjM0k1odWnjadskRJ+UjdK5HOnBK5
 noZZe/jjNNKJKBCeL7FFajsSMDbmgMPnnAcdh27KeRFxTmLhPXw+BY8WmmTjE7Iof5boNynuiRB
 OSKVg5SfX4sZocpU8KJvIS8S0LKULh3pu5alVJ6P5mEjYdLdiXrlehxdtlFsXyZdxPKfLeNNZin
 I92/l6ZawK/eQ/qvTt28UeZkA0wkDe/8kiD+wOhOpE42kCAgu8st1EAOyWgXgFIMOjNOigPIg4D
 X225AnPHli9OB9WtyzAf6dRHkr4PYVZyRgPWrwbwQRuaVlmUs30QSwqlucMPWyXwhbFylFNr3Vh
 sqf0M2/eP9PZlIQ==
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
 include/acpi/pcc.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/acpi/pcc.h b/include/acpi/pcc.h
index 73e806fe7ce7..021891a7434f 100644
--- a/include/acpi/pcc.h
+++ b/include/acpi/pcc.h
@@ -18,7 +18,20 @@ struct pcc_mbox_chan {
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
+/* Initiator Responder Communications Channel Flags */
+#define PCC_CMD_COMPLETION_NOTIFY	BIT(0)
+
 #define MAX_PCC_SUBSPACES	256
+
 #ifdef CONFIG_PCC
 extern struct pcc_mbox_chan *
 pcc_mbox_request_channel(struct mbox_client *cl, int subspace_id);

-- 
2.42.0

