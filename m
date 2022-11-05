Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14C2061DE56
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiKEVN0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:13:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbiKEVNK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:13:10 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3521811828;
        Sat,  5 Nov 2022 14:13:06 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id q9so21477070ejd.0;
        Sat, 05 Nov 2022 14:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=47oIaMFA8Eg3AOKmQgHp46WYx0yoJU5i2kodk4hvPko=;
        b=N91QVKYwk9ywA88EX/NPEo03LgbDWYnJqPpnaX1AiBEMXleyJK57FALGJ4JbvOdeI8
         E0aR/ws0ryw9vU6yLUyqds00LvzZ5o1Zp/UcW51XN3PlKysQzh6IBDVMEV/hXppxOcfc
         AGp46ZXc9v90GcGm7FSKKr7N3/tmsqBI7YYRhx9umsace9YQDiSGoTLY8To7tHb30mCK
         bZrZamedDqEKFrj5kkqubBwbbZO7f40xjgILSi8isbDLnn3dQtl5Elv8hwBnb77mT59D
         ++bTDsVHTTfpYS9Puj2kkwivHZ60CTuAqn1ZITEKqNIgOHqy9HeRl3oHmtdGYiicrkZ6
         Jtuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47oIaMFA8Eg3AOKmQgHp46WYx0yoJU5i2kodk4hvPko=;
        b=w8Qe06/llEeeeXDH86Wx2SgF1+eUhaf5+XD0kY+QrKLS/HAbNNflbiKhQCAFRx0pNC
         TzQ+HE1spdQpUv0eXXsOmzeCmlshbAreulSAyFtNJ0RVJHMPHzSv4Y4C+Gi48QJhE5jA
         6pMmVgtr3Lv6VNitu6z1EEXqBGg2WIQs2PDhb46nklMIX6sPnCA3d+cFaA0KsjQNQ2ON
         HZO7C88tgdaWEL1jj948pcdzYwBZEOepiwjY7fIGiYmGc8A3O5HVYqbgzURRu/8u2rbq
         s4hzcqX6pW77Tp90zdZrTDJea84OeKXhHFBSY+YSgvEgKAjeMmEBD3sj39u0LhEatLc7
         hCjw==
X-Gm-Message-State: ACrzQf1+NM4B3eOY34cikNgLPxlLL8epy3B/MsA37Fiai/xwlNVncWDr
        r/RNrmABn+3KlRP+u+BiqT4=
X-Google-Smtp-Source: AMsMyM6Dwi+QxepqGR1MGBPEqdKbN8UKAmHc82B6JwRP4EZOx3pE3FyZ1GuAzQ4q/F7CMMyRNAFBgg==
X-Received: by 2002:a17:906:fe46:b0:73d:939a:ec99 with SMTP id wz6-20020a170906fe4600b0073d939aec99mr41008444ejb.169.1667682784743;
        Sat, 05 Nov 2022 14:13:04 -0700 (PDT)
Received: from michael-VirtualBox.. (89-138-220-136.bb.netvision.net.il. [89.138.220.136])
        by smtp.googlemail.com with ESMTPSA id ta19-20020a1709078c1300b0073d796a1043sm1323502ejc.123.2022.11.05.14.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:13:04 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4 07/13] HID: ft260: skip unexpected HID input reports
Date:   Sat,  5 Nov 2022 23:11:45 +0200
Message-Id: <20221105211151.7094-8-michael.zaidman@gmail.com>
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

The FT260 is not supposed to generate unexpected HID reports. However,
in theory, the unsolicited HID Input reports can be issued by a specially
crafted malicious USB device masquerading as FT260 when the attacker has
physical access to the USB port. In this case, the read_buf pointer points
to the final data portion of the previous I2C Read transfer, and the memcpy
invoked in the ft260_raw_event() will try copying the content of the
unexpected report into the wrong location.

This commit sets the Read buffer pointer to NULL on the I2C Read
transaction completion and checks it in the ft260_raw_event() to detect
and skip the unsolicited Input report.

Reported-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 8d6d2a19b9ed..8b6ebc5228eb 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -464,7 +464,7 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			  u16 len, u8 flag)
 {
 	u16 rd_len;
-	int timeout, ret;
+	int timeout, ret = 0;
 	struct ft260_i2c_read_request_report rep;
 	struct hid_device *hdev = dev->hdev;
 
@@ -480,10 +480,6 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			rd_len = FT260_RD_DATA_MAX;
 		}
 
-		dev->read_idx = 0;
-		dev->read_buf = data;
-		dev->read_len = rd_len;
-
 		rep.report = FT260_I2C_READ_REQ;
 		rep.length = cpu_to_le16(rd_len);
 		rep.address = addr;
@@ -494,22 +490,30 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 
 		reinit_completion(&dev->wait);
 
+		dev->read_idx = 0;
+		dev->read_buf = data;
+		dev->read_len = rd_len;
+
 		ret = ft260_hid_output_report(hdev, (u8 *)&rep, sizeof(rep));
 		if (ret < 0) {
 			hid_err(hdev, "%s: failed with %d\n", __func__, ret);
-			return ret;
+			goto ft260_i2c_read_exit;
 		}
 
 		timeout = msecs_to_jiffies(5000);
 		if (!wait_for_completion_timeout(&dev->wait, timeout)) {
+			ret = -ETIMEDOUT;
 			ft260_i2c_reset(hdev);
-			return -ETIMEDOUT;
+			goto ft260_i2c_read_exit;
 		}
 
+		dev->read_buf = NULL;
+
 		ret = ft260_xfer_status(dev);
 		if (ret < 0) {
+			ret = -EIO;
 			ft260_i2c_reset(hdev);
-			return -EIO;
+			goto ft260_i2c_read_exit;
 		}
 
 		len -= rd_len;
@@ -518,7 +522,9 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 
 	} while (len > 0);
 
-	return 0;
+ft260_i2c_read_exit:
+	dev->read_buf = NULL;
+	return ret;
 }
 
 /*
@@ -1036,6 +1042,13 @@ static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
 		ft260_dbg("i2c resp: rep %#02x len %d\n", xfer->report,
 			  xfer->length);
 
+		if ((dev->read_buf == NULL) ||
+		    (xfer->length > dev->read_len - dev->read_idx)) {
+			hid_err(hdev, "unexpected report %#02x, length %d\n",
+				xfer->report, xfer->length);
+			return -1;
+		}
+
 		memcpy(&dev->read_buf[dev->read_idx], &xfer->data,
 		       xfer->length);
 		dev->read_idx += xfer->length;
@@ -1044,10 +1057,9 @@ static int ft260_raw_event(struct hid_device *hdev, struct hid_report *report,
 			complete(&dev->wait);
 
 	} else {
-		hid_err(hdev, "unknown report: %#02x\n", xfer->report);
-		return 0;
+		hid_err(hdev, "unhandled report %#02x\n", xfer->report);
 	}
-	return 1;
+	return 0;
 }
 
 static struct hid_driver ft260_driver = {
-- 
2.34.1

