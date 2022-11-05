Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6013361DE52
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:13:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiKEVNN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbiKEVNE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:13:04 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C52911C13;
        Sat,  5 Nov 2022 14:12:55 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id v27so12272374eda.1;
        Sat, 05 Nov 2022 14:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSSvluQm3NGC5J6X42oGu/YUSo51/OoBhNLx5zGbzEw=;
        b=bBbmixxXZOY2xxelIgiyCOhcCDIZ52+f+3hq86RrpIDyUQnjg+eM+KJnq2/o9pCGZL
         VbU38fSx7CUQus6utx273xANyUL68yHm7zkRFQYBs9xQKOJWhESCIGlqCu/c1jesV1Ti
         2B5wBiCMJDxlZyRpkZ7RSX2+9/4UDq3GxvyK/rMC64Us86MrLKcUATGkxdDy9L2E0boZ
         vDLMSq2e9pCU6FrLylW3Y//4sfBmop/6DzNNIXFfqkHELrACSDXmk/W3d6DeYeD81FCV
         t+DysS04PJplx12tKBGVgDUDU8/ykwYV1B0kDa5QYbFgBOjV+9tZz3i+T543KUT7PLJq
         /sLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSSvluQm3NGC5J6X42oGu/YUSo51/OoBhNLx5zGbzEw=;
        b=8KtVdhlrUuY6+dz0hjvJuG6aI9zugvi2KtJHYzZveRyWVLl1a0DMnHYezwlrTrz0UQ
         +wXHxM2Y2XuAyRzLPUD99DF2Zjk/CYYblSSNS9/t0dKqdbBhq5Tz3vinyosrLgwxcNV5
         3+n+z/38GugtSx90PuSkK0jxMfI3b3KfU2g0Bu4s4gwL1BOCjkpp9eM+1dpJItHqtCff
         Tkn93CycycsiVScwxXbrzfhsnXSeBEBHO7KjsDduX0Bv4BRTUHwYe67o2d2z/uFubzoZ
         iGyIBPVc624uD2ZFXk6d5T08dCEJFVxPb3lxbByNZ/N2y/iylo4V85Rx/ICkw5LujJKo
         PkOQ==
X-Gm-Message-State: ACrzQf23UZiM9Y8ecZN5nXBkMyvdaA9Y68ZPwQsaVRHpXco9RN6nWEYo
        xZfdruJ4J4tkwnQxjfbMKjs=
X-Google-Smtp-Source: AMsMyM5vVypAaj3/q1whPPfHQnfPsa5f8ysab+6nwFUKbs9QM+VPJPNtgQrUr+DqzWM4PRlZLV/ewA==
X-Received: by 2002:a05:6402:5250:b0:461:e870:850f with SMTP id t16-20020a056402525000b00461e870850fmr41969402edd.404.1667682774203;
        Sat, 05 Nov 2022 14:12:54 -0700 (PDT)
Received: from michael-VirtualBox.. (89-138-220-136.bb.netvision.net.il. [89.138.220.136])
        by smtp.googlemail.com with ESMTPSA id ta19-20020a1709078c1300b0073d796a1043sm1323502ejc.123.2022.11.05.14.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:12:53 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4 05/13] HID: ft260: improve i2c large reads performance
Date:   Sat,  5 Nov 2022 23:11:43 +0200
Message-Id: <20221105211151.7094-6-michael.zaidman@gmail.com>
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

The patch increases the read buffer size to 180 bytes. It reduces
the number of ft260_i2c_read() calls by three, improving the big
reads performance.

$ sudo i2ctransfer -y -f 13 w2@0x51 0x0 0x0 r180

Before:

[  +4.071878] ft260_i2c_write_read: off 0x0 rlen 180 wlen 2
[  +0.000005] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.001097] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000175] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000004] ft260_i2c_read: rep 0xc2 addr 0x51 len 180 rlen 60 flag 0x3
[  +0.008579] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000208] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000001] ft260_i2c_read: rep 0xc2 addr 0x51 len 120 rlen 60 flag 0x0
[  +0.008794] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000181] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 60 rlen 60 flag 0x4
[  +0.008817] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000223] ft260_xfer_status: bus_status 0x20, clock 100

After:

[ +11.611642] ft260_i2c_write_read: off 0x0 rlen 180 wlen 2
[  +0.000005] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.008001] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.000001] ft260_i2c_read: rep 0xc2 addr 0x51 len 180 rlen 180 flag 0x7
[  +0.008994] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.007987] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.007992] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000206] ft260_xfer_status: bus_status 0x20, clock 100

Suggested-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index a354089bb747..91f9087e49dc 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -30,12 +30,19 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
 
 #define FT260_REPORT_MAX_LENGTH (64)
 #define FT260_I2C_DATA_REPORT_ID(len) (FT260_I2C_REPORT_MIN + (len - 1) / 4)
+
 /*
- * The input report format assigns 62 bytes for the data payload, but ft260
- * returns 60 and 2 in two separate transactions. To minimize transfer time
- * in reading chunks mode, set the maximum read payload length to 60 bytes.
- */
-#define FT260_RD_DATA_MAX (60)
+ * The ft260 input report format defines 62 bytes for the data payload, but
+ * when requested 62 bytes, the controller returns 60 and 2 in separate input
+ * reports. To achieve better performance with the multi-report read data
+ * transfers, we set the maximum read payload length to a multiple of 60.
+ * With a 100 kHz I2C clock, one 240 bytes read takes about 1/27 second,
+ * which is excessive; On the other hand, some higher layer drivers like at24
+ * or optoe limit the i2c reads to 128 bytes. To not block other drivers out
+ * of I2C for potentially troublesome amounts of time, we select the maximum
+ * read payload length to be 180 bytes.
+*/
+#define FT260_RD_DATA_MAX (180)
 #define FT260_WR_DATA_MAX (60)
 
 /*
-- 
2.34.1

