Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D673F612CB2
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbiJ3Ueh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:34:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbiJ3Uee (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:34:34 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F715B85F;
        Sun, 30 Oct 2022 13:34:31 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id y16so13408739wrt.12;
        Sun, 30 Oct 2022 13:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DNp683CGj+Z6itDhM79bg7tLFjPTOBd5dr9kEuZxIG0=;
        b=J+146yPeeqATBVRWMjweqpFAnEut2Emhc1ifayU5sYCeklrHz0D8RLneGUR3Mi3wpS
         uz6Zxnt4jz00CPRLJdp1RKKwzq0sO+HxbrFPB/GbQytn0TOivMpOe4H7iyVF/5kOvqcZ
         7xtNto1uR8EpRY1JtRY2KVlSDFY4Awxe+kWuAPTobcAT4KUpCWoMadTmSktmoFiSJ4aN
         QxsAz1jBFhk9ftY8Lv/7lUN8YXN8YwNG9tQpWIcRFFYscU2OMSDVD4NXGn6EWWrkRNX2
         XOfG1f8WDUWptO4MV1qhphsnwRK0prejFVxW9y+5lDn0mRETzdZRkL1RPnmdr4j6PVZ4
         mg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DNp683CGj+Z6itDhM79bg7tLFjPTOBd5dr9kEuZxIG0=;
        b=qLinXwCg1UdAPqi0GdznvxCKlReJbHtKlCpxrEKCM+AKCgRX1UkUVhxTM+5I7rfVSQ
         DkYSTCcqJwV173uw0yxhRlQHXBN2f/uGmuXIdvIIlfjckaNSmz1KxR1YkdznrNvW5RCx
         BNOMiE/kspNgXkDBHju5AmBWsUnfG65hqfXKGiwUGZe/4uJRH38cvAJluTmoJBET0IJy
         37h2wE1gdjxkuCMMZY4CYSXWmTZYiRUhMEfsKuEeRv7DguCEuiwtZkRetH3hq/ZZcJlf
         y2+VIP4nGCHowGldXseF9MlZRhyZghNOxckU7nNNKDTGzVnofEfDuS6xLN3yxtDT5apM
         vALA==
X-Gm-Message-State: ACrzQf3ryrzUw/XCUymTs43gGm8rdI4dA58C9S1JEMGFFlXzmYeONapD
        fboFBD7O/cUcoTinke2IAskDwqW7gAN8Yw==
X-Google-Smtp-Source: AMsMyM5h+1XjQ+SoOEve5s2lUBHBKESIzzYp6JWSIslcb9uznXxX7zKc1BQvYjdCD58ulSyP7sRZmw==
X-Received: by 2002:a5d:564c:0:b0:236:6089:cc50 with SMTP id j12-20020a5d564c000000b002366089cc50mr5632337wrw.520.1667162071077;
        Sun, 30 Oct 2022 13:34:31 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:30 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>,
        Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [PATCH v3 03/12] HID: ft260: support i2c writes larger than HID report size
Date:   Sun, 30 Oct 2022 22:33:54 +0200
Message-Id: <20221030203403.4637-4-michael.zaidman@gmail.com>
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

To support longer than one HID report size write, the driver splits a
single i2c message data payload into multiple i2c messages of HID report
size. However, it does not replicate the offset bytes within the EEPROM
chip in every consequent HID report because it is not and should not be
aware of the EEPROM type. It breaks the i2c write message integrity and
causes the EEPROM device not to acknowledge the second HID report keeping
the i2c bus busy until the ft260 controller reports failure.

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
[  +0.000003] ft260_i2c_write: failed to start transfer, ret -5

After:

$ sudo ./i2cperf -f 2 -o 2 -s 128 -r 0-0xff 13 0x51 -S

  Fill block with increment via i2ctransfer by chunks
  -------------------------------------------------------------------
  data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
  -------------------------------------------------------------------
  71260           86             256           2           128

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Tested-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 drivers/hid/hid-ft260.c | 41 +++++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 18 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 44106cadd746..cec83f69ebdc 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -378,41 +378,46 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 }
 
 static int ft260_i2c_write(struct ft260_device *dev, u8 addr, u8 *data,
-			   int data_len, u8 flag)
+			   int len, u8 flag)
 {
-	int len, ret, idx = 0;
+	int ret, wr_len, idx = 0;
 	struct hid_device *hdev = dev->hdev;
 	struct ft260_i2c_write_request_report *rep =
 		(struct ft260_i2c_write_request_report *)dev->write_buf;
 
+	rep->flag = FT260_FLAG_START;
+
 	do {
-		if (data_len <= FT260_WR_DATA_MAX)
-			len = data_len;
-		else
-			len = FT260_WR_DATA_MAX;
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
+		rep->flag = 0;
 
-	} while (data_len > 0);
+	} while (len > 0);
 
 	return 0;
 }
-- 
2.34.1

