Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13CEC5337B9
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 09:48:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241294AbiEYHsw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 03:48:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235342AbiEYHsu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 03:48:50 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA0D47A441;
        Wed, 25 May 2022 00:48:49 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t5so2587005edc.2;
        Wed, 25 May 2022 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u9UJOS66i5yFUQsYYMbxlzi5aNdbaP9eMSKq+XXNp0c=;
        b=S3DJSeHecnZFxubSfPF0Z0w6xU+HxVkyDmhQd1s+4oAAiDhj+RGPz3G9zgndmoo8K8
         5bu7O6nJN/puyMuLNB5wU05y0mXAZUz3Uewto6vJau20hppEMFbfgDlQ4Hi3nfu0WwFh
         dgwgTUBKUQBhZg0TDHM62fVngJjdbYGqup0j5dOzheZx2psnB6PH/6YPwOXBYcsyTEXR
         CRhIPvyPODvaHLXpXt9b+THbUwM5e2UftrkAIl/Y0C/cfshcJ/wv5tC2kOlGgrMly57k
         9+mf5LrumWlBSePfZu/mfLkbigxCiKjbdt5OQp2Of61C2T1W9d25bMuN2nPY3LK/Spl5
         9pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u9UJOS66i5yFUQsYYMbxlzi5aNdbaP9eMSKq+XXNp0c=;
        b=MxPgXRopjEpEw7T2ZN+1LyBqkDiS7LfahUFR4+4os6+UBA+3wsRb2lHo6+mz8aZuOr
         6neqNHmhs21gK3pZIDmz4fHUCveBxyCSRHEKUxb/kJv/ch+1E4NzJtDj0uF3HsYxVmAd
         iP/gV59OwZysCddwXzmAIQrenAKDKdL+HymwGEM/4DqPgAOkBuDGgSTlendqjaaL8RYR
         qaIwKj9yh+WwhczoqiHvLPCNsiZ1sAJPkdZ0VoiOJf0D1r61dRnwrRuzDMH18l/RyX/1
         FcWMoDcBFEluoJtI1z41Jl4XmZA3hbDAQc31Y/qMtvNps39OY0CTEUvh9l5rPsnA+Lu9
         6LPg==
X-Gm-Message-State: AOAM533/QnM/pdzyu32wXwCzCRayJrx5pec6+6qbI4+z7x5oN49vC2p4
        TUI1pwXQrR3iYglhOvBO+9M=
X-Google-Smtp-Source: ABdhPJzcEWUi3dCkF3+FGXBK8vYUSbguKrAfvazHqmFLxDDMzDy7v0Q9RYwrIDGKS/Z9qKlo1q7Xpw==
X-Received: by 2002:a05:6402:1007:b0:428:beb6:f483 with SMTP id c7-20020a056402100700b00428beb6f483mr33044722edu.391.1653464928263;
        Wed, 25 May 2022 00:48:48 -0700 (PDT)
Received: from localhost.localdomain (109-186-136-71.bb.netvision.net.il. [109.186.136.71])
        by smtp.googlemail.com with ESMTPSA id v1-20020aa7d641000000b0042acd78014esm10230533edr.11.2022.05.25.00.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 00:48:47 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, champagne.guillaume.c@gmail.com,
        mathieu.gallichand@sonatest.com,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v1 3/5] HID: ft260: support i2c writes larger than HID report size
Date:   Wed, 25 May 2022 10:47:55 +0300
Message-Id: <20220525074757.7519-4-michael.zaidman@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220525074757.7519-1-michael.zaidman@gmail.com>
References: <20220525074757.7519-1-michael.zaidman@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To support longer than one HID report size write, the driver splits a single
i2c message data payload into multiple i2c messages of HID report size.
However, it does not replicate the offset bytes within the EEPROM chip in
every consequent HID report because it is not and should not be aware of
the EEPROM type. It breaks the i2c write message integrity and causes the
EEPROM device not to acknowledge the second HID report keeping the i2c bus
busy until the ft260 controller reports failure.

This patch preserves the i2c write message integrity by manipulating the
i2c flag bits across multiple HID reports to be seen by the EEPROM device
as a single i2c write transfer.

Before:

$ sudo ./i2cperf -f 2 -o 2 -s 64 -r 0-0xff 13 0x51 -S
Error: Sending messages failed: Input/output error

[  +3.667741] ft260_i2c_write: rep 0xde addr 0x51 off 0 len 60 d[0] 0x0
[  +0.007330] ft260_hid_output_report_check_status: wait 6400 usec, len 64
[  +0.000203] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000001] ft260_i2c_write: rep 0xd1 addr 0x51 off 60 len 6 d[0] 0x0
[  +0.002337] ft260_hid_output_report_check_status: wait 1000 usec, len 10
[  +0.000157] ft260_xfer_status: bus_status 0x2e, clock 100
[  +0.000241] ft260_i2c_reset: done
[  +0.000003] ft260 0003:0403:6030.000E: ft260_i2c_write: failed to start transfer, ret -5

After:

$ sudo ./i2cperf -f 2 -o 2 -s 128 -r 0-0xff 13 0x51 -S

  Fill block with increment via i2ctransfer by chunks
  -------------------------------------------------------------------
  data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
  -------------------------------------------------------------------
  58986           86             256           2           128

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 45 ++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 44106cadd746..bfda5b191a3a 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -378,41 +378,50 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 }
 
 static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
-			   int data_len, u8 flag)
+			   int len, u8 flag)
 {
-	int len, ret, idx = 0;
+	int ret, wr_len, idx = 0;
+	bool first = true;
 	struct hid_device *hdev = dev->hdev;
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->write_buf;
 
 	do {
-		if (data_len <= FT260_WR_DATA_MAX)
-			len = data_len;
-		else
-			len = FT260_WR_DATA_MAX;
+		rep->flag = 0;
+		if (first) {
+			rep->flag = FT260_FLAG_START;
+			first = false;
+		}
+
+		if (len <= FT260_WR_DATA_MAX) {
+			wr_len = len;
+			if (flag == FT260_FLAG_START_STOP)
+				rep->flag |= FT260_FLAG_STOP;
+		} else {
+			wr_len = FT260_WR_DATA_MAX;
+		}
 
-		rep->report = FT260_I2C_DATA_REPORT_ID(len);
+		rep->report = FT260_I2C_DATA_REPORT_ID(wr_len);
 		rep->address = addr;
-		rep->length = len;
-		rep->flag = flag;
+		rep->length = wr_len;
 
-		memcpy(rep->data, &data[idx], len);
+		memcpy(rep->data, &data[idx], wr_len);
 
-		ft260_dbg("rep %#02x addr %#02x off %d len %d d[0] %#02x\n",
-			  rep->report, addr, idx, len, data[0]);
+		ft260_dbg("rep %#02x addr %#02x off %d len %d wlen %d flag %#x d[0] %#02x\n",
+			  rep->report, addr, idx, len, wr_len,
+			  rep->flag, data[0]);
 
 		ret = ft260_hid_output_report_check_status(dev, (u8 *)rep,
-							   len + 4);
+							   wr_len + 4);
 		if (ret < 0) {
-			hid_err(hdev, "%s: failed to start transfer, ret %d\n",
-				__func__, ret);
+			hid_err(hdev, "%s: failed with %d\n", __func__, ret);
 			return ret;
 		}
 
-		data_len -= len;
-		idx += len;
+		len -= wr_len;
+		idx += wr_len;
 
-	} while (data_len > 0);
+	} while (len > 0);
 
 	return 0;
 }
-- 
2.25.1

