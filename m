Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8493A612CC4
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229894AbiJ3UfB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbiJ3Uem (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:34:42 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DF8FA1A9;
        Sun, 30 Oct 2022 13:34:41 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id n39-20020a05600c3ba700b003cf71011cddso335010wms.1;
        Sun, 30 Oct 2022 13:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAkHqN6oZd2dovWsENCSlIqD0VO6aehIZ8ArRH69xz8=;
        b=F4MXqGE9UQW3kaFZow314uGnPwlkkcUy93RM28Ql+tuVGTEOUkyx7/bPhZC1Z3tZiO
         Qf2MtRxiM/eZwtIZRysh7/GKoqsGPI4pSP9ZmVfQrgr9mWhCUXNFOIZ74oCOQ3Xv/EPD
         o+pT1Xn+t+eVENM/NYyfK6DlEOFk0PB0aKfx1nnEWjwmlqwLcYuqIA+fLKhndHg4mL6S
         ywQWsYOPu0og1RqppJWUFJu9uzLe+h2usjCJXILCK4kmElSpS5HUhB5X7VR/sLNg/50m
         X8POPgYHaajoDl5yqVXtnkfNH8TBIE/iRhtd0R7ZS5wvjOKbx2Ozq6Bm18O6xezE3jqh
         TmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yAkHqN6oZd2dovWsENCSlIqD0VO6aehIZ8ArRH69xz8=;
        b=JSPLxeqaSLPBzfWbXlkTIMKUcfSwWFS5AgOAYu4CfEKMOGpWb/VwjiqsqF37xd0KkH
         P5f7ytNs6MEX3Z+rhp/CJZn41rZ2WN7JtIuJwGDna88rxqo/aXndjCwBsoha7op6OKka
         C6uVVNpW9I0i1RJnndzgvCxp8wVHjPKNx9vLdyxJfw++Cbq1km6UJwNHFJ0amvUmFKgJ
         41wnBDqBn31kbay0JB7wq4DQbRaXLCT+aogsaQKmXo7seYC2Q1JvH2+awPxEaxQnMjTh
         c+AESTIiS/MNt/Q3/3Pw7S+WvxCnfCyKKhsd1iUlevM4qRwstBHgd1W8TrV9fSdAy0L6
         HKbw==
X-Gm-Message-State: ACrzQf320BVvy6YCS8NrQLXWGTaQmr1F6AXZG/ikvdRVgKAc+2PUErpK
        GcyTVm5xdD1iGmObQ3U318o=
X-Google-Smtp-Source: AMsMyM4ivnUkI4EN2HuHFheEejNYCvrW4t0H4IEqgyPxJC+eoMDkNVxgWwp4nP98UG5iILMUWZ77bA==
X-Received: by 2002:a05:600c:14c6:b0:3cf:6a83:c2a6 with SMTP id i6-20020a05600c14c600b003cf6a83c2a6mr3445866wmh.52.1667162079779;
        Sun, 30 Oct 2022 13:34:39 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:39 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v3 09/12] HID: ft260: missed NACK from big i2c read
Date:   Sun, 30 Oct 2022 22:34:00 +0200
Message-Id: <20221030203403.4637-10-michael.zaidman@gmail.com>
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

The FT260 controller does not return NACK when performing a big
read (of multiple hid reports size) from a non-existing device
or from the device responding with NACK when it is not ready
to serve the request. However, it responds correctly with NACK
to a read of up to a single hid report size.

To overcome this issue, we split the muli-report read request
into a read of a single HID report of 60 bytes size and a
multi-report read.

Big read of 256 bytes with first read of 60 bytes:

$ sudo ./i2cperf -d 2 -o 2 -s 256 -r 0-0xff 1 0x50 -S

[  +5.633280] ft260_i2c_write_read: off 0x0 rlen 255 wlen 2
[  +0.000006] ft260_i2c_write: rep 0xd0 addr 0x50 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.013205] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.000007] ft260_i2c_read: rep 0xc2 addr 0x50 len 255 rlen 60 flag 0x3
[  +0.010932] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.004733] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000006] ft260_i2c_read: rep 0xc2 addr 0x50 len 195 rlen 128 flag 0x0
[  +0.012572] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.005789] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.003189] ft260_raw_event: i2c resp: rep 0xd1 len 8
[  +0.004092] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000010] ft260_i2c_read: rep 0xc2 addr 0x50 len 67 rlen 67 flag 0x4
[  +0.011688] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.004700] ft260_raw_event: i2c resp: rep 0xd1 len 7
[  +0.004858] ft260_xfer_status: bus_status 0x20, clock 100

Read from non-existing device at address 8. The first 60 read responded
with NACK.

$ sudo ./i2cperf -d 2 -o 2 -s 256 -r 0-0xff 1 0x8 -S
[Oct19 15:37] ft260_i2c_write_read: off 0x0 rlen 255 wlen 2
[  +0.000007] ft260_i2c_write: rep 0xd0 addr 0x8 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.022820] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.000007] ft260_i2c_read: rep 0xc2 addr 0x8 len 255 rlen 60 flag 0x3
[  +0.010658] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.005965] ft260_xfer_status: bus_status 0x46, clock 100  <-- NACK
[  +0.000009] ft260 0003:0403:6030.0004: i2c bus error: 0x46
[  +0.007784] ft260_i2c_reset: done

Co-developed-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index d186aa5a8e73..40fae81386e3 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -464,6 +464,7 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 			  u16 len, u8 flag)
 {
 	u16 rd_len;
+	u16 rd_data_max = 60;
 	int timeout, ret = 0;
 	struct ft260_i2c_read_request_report rep;
 	struct hid_device *hdev = dev->hdev;
@@ -473,12 +474,13 @@ static int ft260_i2c_read(struct ft260_device *dev, u8 addr, u8 *data,
 	else
 		flag = FT260_FLAG_START;
 	do {
-		if (len <= FT260_RD_DATA_MAX) {
+		if (len <= rd_data_max) {
 			rd_len = len;
 			flag |= FT260_FLAG_STOP;
 		} else {
-			rd_len = FT260_RD_DATA_MAX;
+			rd_len = rd_data_max;
 		}
+		rd_data_max = FT260_RD_DATA_MAX;
 
 		rep.report = FT260_I2C_READ_REQ;
 		rep.length = cpu_to_le16(rd_len);
-- 
2.34.1

