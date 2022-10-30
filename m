Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C33B612CAD
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:34:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiJ3Ue0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJ3UeZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:34:25 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F394EB1E8;
        Sun, 30 Oct 2022 13:34:23 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id l14so13466439wrw.2;
        Sun, 30 Oct 2022 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSJlpADL6FxqQLVTkCQJu3ikcoUIWPyVlc8ef31tV88=;
        b=HB38NIcXWQdMiWE5240TE0Z0Eqj+ulKlHtjPFfNZihIzZMBdVTWGNxrTbU6ypSJDDS
         nkQYRLh11gDbPf4KBA52u+cKFdrXFQR513d6mcCiVV9mGr54FxpjVKaSOmeGKsbQZuhs
         AbfTzuRXxGPxYDeI89APAN3lu2jDaYxUQ3ROynLvDiIlBj6WppPut4IYEB9Sm/sU+c+w
         voO1luE48P2vMxEnIRu/0grETuVpUqMsPW1IPnvZ7qpxDTmRSu6QhwkTsye90boPOrtd
         Gu/+9qaps9itld+YsaR+FbKH7k207UvsL2R34okxJZacZ5eKzfnxHTDo7GqetAgCumwv
         7VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZSJlpADL6FxqQLVTkCQJu3ikcoUIWPyVlc8ef31tV88=;
        b=sKwve+etjVdEyMxD4+2dyEpn7aN2LGKPeyaFwKj3r9C/5mdc/lYlqn2mAa9J+2KCJm
         oekjs26narbDIfNkQZZ2qNu3eacxJQWBR+lDqJCxhlNZMfuLUMI9ZRQLuz4Gf0khgSLI
         KaUiEbPEodQhZm2Vv3vKySmfBrJpN5TcCbR4YNCwiUMnSSt7PWM22I7JfS0xUo43VO68
         jSm+I/ZclX4tNeURcQaM3bx/KAb4FxaaNrv3j7hVAQR/vqIV8KTDn3MzL78k/4M4JimE
         ihz565NjleFenWtS9DLa+uM8skZqcVJfhU3tpJSw25enVRg+cQ/xSGCFtPI+5OwvwCkz
         4ZYA==
X-Gm-Message-State: ACrzQf1aq1l99NWxxHQiKecQ8vvq8uo2mxZLX2Z+ENoqdTeoGRiHVZBH
        Z8/Fo4QmORfJeilZHXQ6SDA=
X-Google-Smtp-Source: AMsMyM7QwNYThr9kT+OgTNBOSKxORRJ5xnHIHt/kXI5crESQlSllpCty1iLxbI5vnOW6ogbIHJtq4g==
X-Received: by 2002:a05:6000:168f:b0:22e:4c3:de09 with SMTP id y15-20020a056000168f00b0022e04c3de09mr5822079wrd.40.1667162061603;
        Sun, 30 Oct 2022 13:34:21 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:21 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>,
        Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [PATCH v3 01/12] HID: ft260: ft260_xfer_status routine cleanup
Date:   Sun, 30 Oct 2022 22:33:52 +0200
Message-Id: <20221030203403.4637-2-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221030203403.4637-1-michael.zaidman@gmail.com>
References: <20221030203403.4637-1-michael.zaidman@gmail.com>
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

