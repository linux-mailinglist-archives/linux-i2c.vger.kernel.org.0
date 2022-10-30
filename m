Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B3C8612CAF
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:34:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbiJ3Ueg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:34:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229779AbiJ3Uee (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:34:34 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C31DB85D;
        Sun, 30 Oct 2022 13:34:31 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id v7so371478wmn.0;
        Sun, 30 Oct 2022 13:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RqowWq5NnPX1JsllkPtBTllVoOrDwgpWdvHnLuJ47J8=;
        b=CwgpuJYre/63XIBX6gYSnLWmoIcHc/GAG2FALtWpMOzm6AMEpmIV8HzK+7V2TFQHHm
         x0Ca06DfSF061J8aZNShZy0/X9k4rPtN4/TrxB2m1Xg/SRgb54N6gqgC8JYVNE6TgOcq
         oBmMc63VCyEAFYbrBxMcu5zraMvcOEgtFTA7wfx5T/NEJ1jzmrglS/OwNAIqkqkXym+T
         hJLTWp++zerbt/sBZbtQnQqc3Ypq9l4cBiFh01XYSpF04KJNyS/MtoPISaIXNSefyH9Q
         cc4UTXe6Q+OIw13YzymHtSn5HhqeYwW75MkUSNLD1iTtDegAz9k1UqYjwnOefiSjDjfF
         bC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RqowWq5NnPX1JsllkPtBTllVoOrDwgpWdvHnLuJ47J8=;
        b=HjH3AvxRx1UoH70qw/X9jMDfc1aSMEF4lxWB+QzE+H+SWStJ/QrTEKKUwl3oyPtdfy
         kMp9tZGOvlTnkpo8oRENZc5Jz3hKLWoQy8Dm8D88zayd/2z0QVnME/XeIuaWdYgXRrwp
         aQAKFHf7VyDMp9i9+roIBDzMO8No5KsE1Vhk1+HJBFZ8QG5PW+w2jSJkwpCIhutcerKL
         km17mGk54ePYbKgw8Pzz8XxUDP2kJJOvF9MqfSrbtP2oxSuYcFVmiTekUpuHj97MbGJ7
         rSFq2uYPdojrF/xteIlwSVluMbnb+e5xAq887exE2uL5pYoylZLd2kfLcG/DhSjggQ7d
         kSng==
X-Gm-Message-State: ACrzQf3imhpqZjZ7HGwwCT+nHZrB72vr29AbRqTRsH+zPI2LE2wDLFS7
        DknYvaQOJm+wJBAknYEQmGE=
X-Google-Smtp-Source: AMsMyM6fhNK8oWuf2HkHiUZ1S709zu84zs3Bk8/FHNlQEW8t/pMnaOe0Ma1+klh5H0fMkNRQ7Ty27Q==
X-Received: by 2002:a1c:25c1:0:b0:3cf:4dc4:5a97 with SMTP id l184-20020a1c25c1000000b003cf4dc45a97mr14208076wml.147.1667162069673;
        Sun, 30 Oct 2022 13:34:29 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:29 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>,
        Guillaume Champagne <champagne.guillaume.c@gmail.com>
Subject: [PATCH v3 02/12] HID: ft260: improve i2c write performance
Date:   Sun, 30 Oct 2022 22:33:53 +0200
Message-Id: <20221030203403.4637-3-michael.zaidman@gmail.com>
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

The patch improves the I2C write performance by 20 - 30 percent by
revising the sleep time in the ft260_hid_output_report_check_status()
in the following ways:

1. Reduce the wait time and start to poll earlier.

Sending a large amount of data at a low I2C clock rate saturates the
internal FT260 buffer and causes hiccups in status readiness, as shown
below in the log fragment. Aligning the status check wait time to the
worst case significantly reduces the write performance.

[Oct22 10:28] ft260_i2c_write: rep 0xd8 addr 0x51 off 0 len 34 d[0] 0x0
[  +0.005296] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.013460] ft260_i2c_write: rep 0xd8 addr 0x51 off 0 len 34 d[0] 0x0
[  +0.003244] ft260_hid_output_report_check_status: wait 1920 usec, len 38
[  +0.000190] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.015324] ft260_i2c_write: rep 0xd8 addr 0x51 off 0 len 34 d[0] 0x0
[  +0.003491] ft260_hid_output_report_check_status: wait 1920 usec, len 38
[  +0.000202] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.016047] ft260_i2c_write: rep 0xd8 addr 0x51 off 0 len 34 d[0] 0x0
[  +0.002768] ft260_hid_output_report_check_status: wait 1920 usec, len 38
[  +0.000150] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.011389] ft260_i2c_write: rep 0xd8 addr 0x51 off 0 len 34 d[0] 0x0
[  +0.003467] ft260_hid_output_report_check_status: wait 1920 usec, len 38
[  +0.000191] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000172] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000131] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000241] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000233] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000190] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000196] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.011314] ft260_i2c_write: rep 0xd8 addr 0x51 off 0 len 34 d[0] 0x0
[  +0.003334] ft260_hid_output_report_check_status: wait 1920 usec, len 38
[  +0.000227] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000204] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000198] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000147] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.011060] ft260_i2c_write: rep 0xd8 addr 0x51 off 0 len 34 d[0] 0x0

  Before:
    $ sudo ./i2cperf -f 2 -o 2 -s 32 -r 0-0xff 13 0x51 -S

      Fill block with increment via i2ctransfer by chunks
      -------------------------------------------------------------------
      data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
      -------------------------------------------------------------------
      40510           80             256           8           32

  After:
    $ sudo ./i2cperf -f 2 -o 2 -s 32 -r 0-0xff 13 0x51 -S

      Fill block with increment via i2ctransfer by chunks
      -------------------------------------------------------------------
      data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
      -------------------------------------------------------------------
      52584           80             256           8           32

2. Do not sleep if the estimated I2C transfer time is below 2 ms since
   the first xfer status query frequently takes around 1.5 ms, and the
   following status queries take about 200us on average. So we usually
   return from the routine after the first 1 - 3 status checks.

[Oct22 11:14] ft260_i2c_write: rep 0xd4 addr 0x51 off 0 len 18 d[0] 0x0
[  +0.004270] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.013889] ft260_i2c_write: rep 0xd4 addr 0x51 off 0 len 18 d[0] 0x0
[  +0.000856] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000138] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.013352] ft260_i2c_write: rep 0xd4 addr 0x51 off 0 len 18 d[0] 0x0
[  +0.001501] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000177] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.014477] ft260_i2c_write: rep 0xd4 addr 0x51 off 0 len 18 d[0] 0x0
[  +0.001377] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000233] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000191] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.013197] ft260_i2c_write: rep 0xd4 addr 0x51 off 0 len 18 d[0] 0x0

  Before:
    $ sudo ./i2cperf -f 2 -o 2 -s 16 -r 0-0xff 13 0x51 -S

      Fill block with increment via i2ctransfer by chunks
      -------------------------------------------------------------------
      data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
      -------------------------------------------------------------------
      28826           73             256           16          16

  After:
    $ sudo ./i2cperf -f 2 -o 2 -s 16 -r 0-0xff 13 0x51 -S

      Fill block with increment via i2ctransfer by chunks
      -------------------------------------------------------------------
      data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
      -------------------------------------------------------------------
      45138           73             256           16          16

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
Tested-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
---
 drivers/hid/hid-ft260.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index a35201d68b15..44106cadd746 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -345,7 +345,7 @@ static int ft260_hid_output_report(struct hid_device *hdev, u8 *data,
 static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 						u8 *data, int len)
 {
-	int ret, usec, try = 3;
+	int ret, usec, try = 100;
 	struct hid_device *hdev = dev->hdev;
 
 	ret = ft260_hid_output_report(hdev, data, len);
@@ -356,10 +356,14 @@ static int ft260_hid_output_report_check_status(struct ft260_device *dev,
 		return ret;
 	}
 
-	/* transfer time = 1 / clock(KHz) * 10 bits * bytes */
-	usec = 10000 / dev->clock * len;
-	usleep_range(usec, usec + 100);
-	ft260_dbg("wait %d usec, len %d\n", usec, len);
+	/* transfer time = 1 / clock(KHz) * 9 bits * bytes */
+	usec = len * 9000 / dev->clock;
+	if (usec > 2000) {
+		usec -= 1500;
+		usleep_range(usec, usec + 100);
+		ft260_dbg("wait %d usec, len %d\n", usec, len);
+	}
+
 	do {
 		ret = ft260_xfer_status(dev);
 		if (ret != -EAGAIN)
-- 
2.34.1

