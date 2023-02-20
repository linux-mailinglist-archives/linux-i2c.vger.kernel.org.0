Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF0C169CF00
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Feb 2023 15:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231995AbjBTOKA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Feb 2023 09:10:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231370AbjBTOJ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Feb 2023 09:09:59 -0500
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939301F910
        for <linux-i2c@vger.kernel.org>; Mon, 20 Feb 2023 06:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=zgpUqrelktopTVU8xibdn1c4AJb
        dCFFp99o+iwh8m7Y=; b=q18tpMRPVov8fRgv2qxyG7WdMuB+qRyS92qPmM3jNcU
        uXSo2j+ImcC1AMdnYiev9CG7yCJQMQuAK3AfMzKU2sfZVbAcf+050uve71IyEwRb
        2sYEjhVpX3ypH1l1Gf4jjEcS1KF6BrTWc0137TP55JSSm5JuXk62KEgmY27AKKPw
        =
Received: (qmail 1323186 invoked from network); 20 Feb 2023 15:08:40 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Feb 2023 15:08:40 +0100
X-UD-Smtp-Session: l3s3148p1@8KI3MyL1nsAujntl
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "Poeche, Uwe" <uwe.poeche@siemens.com>
Subject: [PATCH i2c-tools] i2cdetect: only use "newer" I2C_FUNC_* flags if they exist
Date:   Mon, 20 Feb 2023 15:08:29 +0100
Message-Id: <20230220140830.74180-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This allows i2cdetect to be compiled for older kernels.

Reported-by: "Poeche, Uwe" <uwe.poeche@siemens.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Jean, do you mind these #ifdefs in the code?

 tools/i2cdetect.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/i2cdetect.c b/tools/i2cdetect.c
index 5ab4ea4..2d4d3b4 100644
--- a/tools/i2cdetect.c
+++ b/tools/i2cdetect.c
@@ -160,12 +160,16 @@ static const struct func all_func[] = {
 	  .name = "I2C Block Write" },
 	{ .value = I2C_FUNC_SMBUS_READ_I2C_BLOCK,
 	  .name = "I2C Block Read" },
+#if defined(I2C_FUNC_SMBUS_HOST_NOTIFY)
 	{ .value = I2C_FUNC_SMBUS_HOST_NOTIFY,
 	  .name = "SMBus Host Notify" },
+#endif
 	{ .value = I2C_FUNC_10BIT_ADDR,
 	  .name = "10-bit addressing" },
+#if defined(I2C_FUNC_SLAVE)
 	{ .value = I2C_FUNC_SLAVE,
 	  .name = "Target mode" },
+#endif
 	{ .value = 0, .name = "" }
 };
 
-- 
2.30.2

