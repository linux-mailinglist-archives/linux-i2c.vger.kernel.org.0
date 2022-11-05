Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9FF61DE70
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230245AbiKEVOL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:14:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230167AbiKEVNv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:13:51 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F7521013;
        Sat,  5 Nov 2022 14:13:48 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id ud5so21384023ejc.4;
        Sat, 05 Nov 2022 14:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RAH3kEkujeyAnJuII7Acg6ukzobTIRImw/F1DL0pg+A=;
        b=peYNN+X0rLVhiD6h2RacNrBcfFZKmdOwvM+SlIAqr/aJQdetlAygIYyIcAAto6KIgt
         uBgx+WYcUXmv/6V7Iy2kxQ+FOqsYz8++lO2F6MxoCGvP6WtDanbzHasfdlRSFh1yE0LS
         TVbU2LzzAPL482t2VU6G+OGDWlljex5SlIs6uryv9eM6LKO3/W4eDmIIKy4OX7WAab4n
         e6fgYI4EOzRLKkOqbWbTAoYTqeRxVsZ16Ldvq6+zYJWL4mpHK/6SJAuSUWNKe+6CFPeP
         beNHqZfTjWSCHdRsW84WWJUnflCM1RkDORUDk2eh/A4pDB9jMvOKxfTd8IHYw7HUIK5z
         Kwxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RAH3kEkujeyAnJuII7Acg6ukzobTIRImw/F1DL0pg+A=;
        b=noVnv8iuMtN+smopby7vlTJfwztn1PBhqITNkkkXXogKFtmoj1mADEtett3IrN8Z0z
         ORFDgTNEs20NWHtJ0szUH2cm60qqxXpXN3fjyJTFv5KnldTn96zzmVffWE+QWyZRRvlB
         TeeuT18/DqfKQ8Z1OnVZXcrMYz6sF2m0v3sNW3VzQ9Otg3VfeKh2c1M4L5iUnE3F+5y8
         yGSWTpjvwRRiLnQql6NUhqLjLnfhRrw4GsmDl/A1rE/W56i9mlKimhrtm0JLtRaL5QVc
         NaxRnrpBAh53yjnTUr/ZcLycgFG0VIcmgHXB507mxlTSxLbBUIqdMs1UmophQb3FmTMW
         iMhg==
X-Gm-Message-State: ACrzQf3+s7fBcVE9tpSvDSgPHwzwFth9g+BRvOFxrR4xYgDjEKRY8NKi
        sc/q53bpKYL6Lu7q9pCb0x8=
X-Google-Smtp-Source: AMsMyM4eqQ9WUMAOtK9vxdkojfHWbOPxZie4/zY7pbmZJIdNYBbXdCi/s6z1gOYhfuQ0O4sfR3tNRg==
X-Received: by 2002:a17:907:86a1:b0:7ac:c5c3:9c80 with SMTP id qa33-20020a17090786a100b007acc5c39c80mr41727981ejc.37.1667682826856;
        Sat, 05 Nov 2022 14:13:46 -0700 (PDT)
Received: from michael-VirtualBox.. (89-138-220-136.bb.netvision.net.il. [89.138.220.136])
        by smtp.googlemail.com with ESMTPSA id ta19-20020a1709078c1300b0073d796a1043sm1323502ejc.123.2022.11.05.14.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:13:46 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Germain Hebert <germain.hebert@ca.abb.com>
Subject: [PATCH v4 12/13] HID: ft260: missed NACK from busy device
Date:   Sat,  5 Nov 2022 23:11:50 +0200
Message-Id: <20221105211151.7094-13-michael.zaidman@gmail.com>
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

When writing into a slow device like an EEPROM chip, the
controller may exit the busy state before the device releases
the bus. In this case, the ft260_xfer_status returns success
before the data transfer completion.

The patch fixes it by returning from the ft260_xfer_status()
with the "-EAGAIN" on both controller and bus busy status when
appropriate.

It does not apply to the i2c combined transactions when after
the write IO, the controller keeps the bus busy until the read
IO and then between reading IOs to ensure an atomic operation.

Co-developed-by: Germain Hebert <germain.hebert@ca.abb.com>
Signed-off-by: Germain Hebert <germain.hebert@ca.abb.com>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index b4f180c8750a..d5b092b85d7f 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -303,7 +303,7 @@ static int ft260_i2c_reset(struct hid_device *hdev)
 	return ret;
 }
 
-static int ft260_xfer_status(struct ft260_device *dev)
+static int ft260_xfer_status(struct ft260_device *dev, u8 bus_busy)
 {
 	struct hid_device *hdev = dev->hdev;
 	struct ft260_get_i2c_status_report report;
@@ -334,7 +334,7 @@ static int ft260_xfer_status(struct ft260_device *dev)
 	ft260_dbg("bus_status %#02x, clock %u\n", report.bus_status,
 		  dev->clock);
 
-	if (report.bus_status & FT260_I2C_STATUS_CTRL_BUSY)
+	if (report.bus_status & (FT260_I2C_STATUS_CTRL_BUSY | bus_busy))
 		return -EAGAIN;
 
 	/*
@@ -369,8 +369,11 @@ static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
 static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 						u8 *data, int len)
 {
+	u8 bus_busy;
 	int ret, usec, try = 100;
 	struct hid_device *hdev = dev->hdev;
+	struct ft260_i2c_write_request_report *rep =
+		(struct ft260_i2c_write_request_report *)data;
 
 	ret = ft260_hid_output_report(hdev, data, len);
 	if (ret < 0) {
@@ -388,8 +391,18 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 		ft260_dbg("wait %d usec, len %d\n", usec, len);
 	}
 
+	/*
+	 * Do not check the busy bit for combined transactions
+	 * since the controller keeps the bus busy between writing
+	 * and reading IOs to ensure an atomic operation.
+	 */
+	if (rep->flag == FT260_FLAG_START)
+		bus_busy = 0;
+	else
+		bus_busy = FT260_I2C_STATUS_BUS_BUSY;
+
 	do {
-		ret = ft260_xfer_status(dev);
+		ret = ft260_xfer_status(dev, bus_busy);
 		if (ret != -EAGAIN)
 			break;
 	} while (--try);
@@ -488,6 +501,7 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 	int timeout, ret = 0;
 	struct ft260_i2c_read_request_report rep;
 	struct hid_device *hdev = dev->hdev;
+	u8 bus_busy = 0;
 
 	if ((flag & FT260_FLAG_START_REPEATED) == FT260_FLAG_START_REPEATED)
 		flag = FT260_FLAG_START_REPEATED;
@@ -531,7 +545,10 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 
 		dev->read_buf = NULL;
 
-		ret = ft260_xfer_status(dev);
+		if (flag & FT260_FLAG_STOP)
+			bus_busy = FT260_I2C_STATUS_BUS_BUSY;
+
+		ret = ft260_xfer_status(dev, bus_busy);
 		if (ret < 0) {
 			ret = -EIO;
 			ft260_i2c_reset(hdev);
@@ -1003,7 +1020,7 @@ static int ft260_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	mutex_init(&dev->lock);
 	init_completion(&dev->wait);
 
-	ret = ft260_xfer_status(dev);
+	ret = ft260_xfer_status(dev, FT260_I2C_STATUS_BUS_BUSY);
 	if (ret)
 		ft260_i2c_reset(hdev);
 
-- 
2.34.1

