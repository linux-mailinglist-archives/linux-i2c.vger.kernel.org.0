Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2857598E10
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 22:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346061AbiHRUbc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 16:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346059AbiHRUbb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 16:31:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26817D0751
        for <linux-i2c@vger.kernel.org>; Thu, 18 Aug 2022 13:31:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 502C6614D5
        for <linux-i2c@vger.kernel.org>; Thu, 18 Aug 2022 20:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 047AAC433D7;
        Thu, 18 Aug 2022 20:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660854688;
        bh=/tpmq9WE0IOOFR9dg8ywBfvlwqqWxM1YT38GpiWdaH8=;
        h=From:To:Cc:Subject:Date:From;
        b=ZysWlMiRA2FOpWGrNXDMrJ81tqz8Eu6iinjV0CLltaiPgQuEnqHTc1GnTK7lXpoP2
         33IY2KQ38Xn3UnM0h6yNOMexnL2n4pA0GERRsxG0LpOPpoKOnox9qX36+4hKKPjCHD
         kkJE5pMN6/3+ayGNo6FaafYB8r2NN6L/w/XxiHednjlNtbalQzmMxEcmYdrxN+AsyC
         3Fa91PLnl1+bqgDADUYuCuzsKDLSZNnhda+S0Mfm9y4QpNeum50VY/FYFzG3I2cQuH
         S9y04BsRErDWiAHBL5UAQjWOCTJ9vQa/AVY3UspSbE5IIM4+mBtI87oXrwm99BII/c
         JONPr7bbcva3w==
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-i2c@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Josef Johansson <josef@oderland.se>,
        Wolfram Sang <wsa@kernel.org>
Subject: [PATCH] Revert "i2c: scmi: Replace open coded device_get_match_data()"
Date:   Thu, 18 Aug 2022 22:31:13 +0200
Message-Id: <20220818203113.1745-1-wsa@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This reverts commit 9ae551ded5ba55f96a83cd0811f7ef8c2f329d0c. We got a
regression report, so ensure this machine boots again. We will come back
with a better version hopefully.

Link: https://lore.kernel.org/r/4d2d5b04-0b6c-1cb1-a63f-dc06dfe1b5da@oderland.se
Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/busses/i2c-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-scmi.c b/drivers/i2c/busses/i2c-scmi.c
index 79798fc7462a..6746aa46d96c 100644
--- a/drivers/i2c/busses/i2c-scmi.c
+++ b/drivers/i2c/busses/i2c-scmi.c
@@ -30,7 +30,7 @@ struct acpi_smbus_cmi {
 	u8 cap_info:1;
 	u8 cap_read:1;
 	u8 cap_write:1;
-	const struct smbus_methods_t *methods;
+	struct smbus_methods_t *methods;
 };
 
 static const struct smbus_methods_t smbus_methods = {
@@ -361,6 +361,7 @@ static acpi_status acpi_smbus_cmi_query_methods(acpi_handle handle, u32 level,
 static int acpi_smbus_cmi_add(struct acpi_device *device)
 {
 	struct acpi_smbus_cmi *smbus_cmi;
+	const struct acpi_device_id *id;
 	int ret;
 
 	smbus_cmi = kzalloc(sizeof(struct acpi_smbus_cmi), GFP_KERNEL);
@@ -368,7 +369,6 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
 		return -ENOMEM;
 
 	smbus_cmi->handle = device->handle;
-	smbus_cmi->methods = device_get_match_data(&device->dev);
 	strcpy(acpi_device_name(device), ACPI_SMBUS_HC_DEVICE_NAME);
 	strcpy(acpi_device_class(device), ACPI_SMBUS_HC_CLASS);
 	device->driver_data = smbus_cmi;
@@ -376,6 +376,11 @@ static int acpi_smbus_cmi_add(struct acpi_device *device)
 	smbus_cmi->cap_read = 0;
 	smbus_cmi->cap_write = 0;
 
+	for (id = acpi_smbus_cmi_ids; id->id[0]; id++)
+		if (!strcmp(id->id, acpi_device_hid(device)))
+			smbus_cmi->methods =
+				(struct smbus_methods_t *) id->driver_data;
+
 	acpi_walk_namespace(ACPI_TYPE_METHOD, smbus_cmi->handle, 1,
 			    acpi_smbus_cmi_query_methods, NULL, smbus_cmi, NULL);
 
-- 
2.35.1

