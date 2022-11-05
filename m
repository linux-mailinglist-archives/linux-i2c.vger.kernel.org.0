Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76FC461DE46
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:12:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbiKEVMg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:12:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbiKEVMf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:12:35 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0AB611810;
        Sat,  5 Nov 2022 14:12:34 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id ud5so21380187ejc.4;
        Sat, 05 Nov 2022 14:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSJlpADL6FxqQLVTkCQJu3ikcoUIWPyVlc8ef31tV88=;
        b=KkxYKwLguylCO+MOb3Wo7CY9rR2ZX6ti/BveSUiotix/fU5ITz9DR6TU/JEBJnD8dO
         Emvu1hSojxp2l3AlfTrBbDxTL/kkDr3jYrO6bCLL7ud00sIAYRPnmvphyYnLUeU6p0uA
         9gbBBObTNmua0uFrEeyFdPucSAf1xblJvPAy8/3vEgCfg9nonqgIET0X3SxF/xkOJzrC
         y2x5h+/k+6Yuq7lo/wuM2RBvIyYB6H7zRr9Xtni523bgRVNQoBLAHgfgH1CukRONGWMt
         YzDH4jshP0fDR3RyRYeQUIfLQn8uYJJ9LxivcyhrSszpvjdXVc+JQZKU00VX7brfOuF1
         comw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSJlpADL6FxqQLVTkCQJu3ikcoUIWPyVlc8ef31tV88=;
        b=2SBpT9XP5iHsE0c55dj4YP6+/pHMMI3uuMEC0odQ5zfogQwNLYZyaSrUsszL1iiET+
         73or/IDl6fegqySBjR7NV6ZLzfia858LdDOWwavstzN0GpA+bwYTqrwERrzklLANrNRR
         nGDnCaR3ZPGsFtoZHFNfhVn/bl1iIBU47XtGAHey64hRUwLSV49puYggiOjPB7mnGftV
         woiOnXRbPQ71ItWTmTolirABsR5cKyMxwZcDjiImndMva3Q/jqJ/DFj1VaM7P2gGhPwg
         5y0N6w8oClCIPzb2dVwqi3/sP6VuWgtyuqzhsy1wiIKVxSUq7gAnzdwlm6wiThPuZhIW
         jDGg==
X-Gm-Message-State: ACrzQf1QH79n6IUv16bY2Miaqr/HItWKay/vqp2/hF4oChgmYzGgWfJX
        CwfrNn2liiygS1WMA3qHxgo=
X-Google-Smtp-Source: AMsMyM5nuu0DYzHoEpqFUn/wyXveSAK3LL1IxYlC5a6zOxMHAIx7TCnalFV2T0emNlo/rhxIvzzKsw==
X-Received: by 2002:a17:907:72c3:b0:792:56d7:285a with SMTP id du3-20020a17090772c300b0079256d7285amr39988211ejc.597.1667682753198;
        Sat, 05 Nov 2022 14:12:33 -0700 (PDT)
Received: from michael-VirtualBox.. (89-138-220-136.bb.netvision.net.il. [89.138.220.136])
        by smtp.googlemail.com with ESMTPSA id ta19-20020a1709078c1300b0073d796a1043sm1323502ejc.123.2022.11.05.14.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:12:32 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [PATCH v4 01/13] HID: ft260: ft260_xfer_status routine cleanup
Date:   Sat,  5 Nov 2022 23:11:39 +0200
Message-Id: <20221105211151.7094-2-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221105211151.7094-1-michael.zaidman@gmail.com>
References: <20221105211151.7094-1-michael.zaidman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

After clarifying with FTDI's support, it turned out that the error
condition (bit 1) in byte 1 of the i2c status HID report is a status
bit reflecting all error conditions. When bits 2, 3, or 4 are raised
to 1, bit 1 is set to 1 also. Since the ft260_xfer_status routine tests
the error condition bit and exits in the case of an error, the program
flow never reaches the conditional expressions for 2, 3, and 4 bits when
any of them indicates an error state. Though these expressions are never
evaluated to true, they are checked several times per IO, increasing the
ft260_xfer_status polling cycle duration.

The patch removes the conditional expressions for 2, 3, and 4 bits in
byte 1 of the i2c status HID report.

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Tested-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 drivers/hid/hid-ft260.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 79505c64dbfe..a35201d68b15 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -313,27 +313,17 @@ static int ft260_xfer_status(struct ft260_device *dev)
 	if (report.bus_status & FT260_I2C_STATUS_CTRL_BUSY)
 		return -EAGAIN;
 
-	if (report.bus_status & FT260_I2C_STATUS_BUS_BUSY)
-		return -EBUSY;
-
-	if (report.bus_status & FT260_I2C_STATUS_ERROR)
+	/*
+	 * The error condition (bit 1) is a status bit reflecting any
+	 * error conditions. When any of the bits 2, 3, or 4 are raised
+	 * to 1, bit 1 is also set to 1.
+	 */
+	if (report.bus_status & FT260_I2C_STATUS_ERROR) {
+		hid_err(hdev, "i2c bus error: %#02x\n", report.bus_status);
 		return -EIO;
+	}
 
-	ret = -EIO;
-
-	if (report.bus_status & FT260_I2C_STATUS_ADDR_NO_ACK)
-		ft260_dbg("unacknowledged address\n");
-
-	if (report.bus_status & FT260_I2C_STATUS_DATA_NO_ACK)
-		ft260_dbg("unacknowledged data\n");
-
-	if (report.bus_status & FT260_I2C_STATUS_ARBITR_LOST)
-		ft260_dbg("arbitration loss\n");
-
-	if (report.bus_status & FT260_I2C_STATUS_CTRL_IDLE)
-		ret = 0;
-
-	return ret;
+	return 0;
 }
 
 static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
@@ -376,7 +366,7 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 			break;
 	} while (--try);
 
-	if (ret == 0 || ret == -EBUSY)
+	if (ret == 0)
 		return 0;
 
 	ft260_i2c_reset(hdev);
-- 
2.34.1

