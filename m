Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABFD9612CBE
	for <lists+linux-i2c@lfdr.de>; Sun, 30 Oct 2022 21:34:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229819AbiJ3Ueo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 30 Oct 2022 16:34:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229798AbiJ3Ueg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 30 Oct 2022 16:34:36 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B20FCB1E8;
        Sun, 30 Oct 2022 13:34:35 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id bs21so13454278wrb.4;
        Sun, 30 Oct 2022 13:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YSSvluQm3NGC5J6X42oGu/YUSo51/OoBhNLx5zGbzEw=;
        b=VsvBHYDiL+FDN9DKjUQwmovPnjmlpOfI/8bv6P5mWEioGjsozIiiVVcFhxPCGCP9D5
         O5cG4jet50RlXXSxlw6c+hF+qnJ+VRmrdk3CNstRNmKddAKEy+vBq6iPeMeRcZQYKVa+
         39qSpX/f1Bo+xTb6CPwl9VahH57WB6Tks03XNWCIkQm4W7QKeI0whC+LvshAk4XpPbGr
         1KAaVI8GxnFGbXdhAR4Wd+9assORv6r8tU0A+CcTKwL6ZItei2ONxOoQSRQGImkITV4x
         RMDmkJcBF3RxbKzY+23Z0zZYlTDyG8iFIf/eSy1rOpTHavtXirPvKaeaYfFmUnZ9JucR
         fBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YSSvluQm3NGC5J6X42oGu/YUSo51/OoBhNLx5zGbzEw=;
        b=zh3qc3nhGYs9ySlJKW6h6+9FdZDnDKLKfA7KeOZV2TJHovJGHZ3irfrajRMtnJH9d5
         GeZ0QQyzuYQvxGQ9h+dNXRQlwaOKFxQAtFYT94DlWr+gUl4A4jFzxRalZGmIDNXIdbGb
         8e1A7m31r+QjzyDWrIIS3KKeEvqqgjyvjwRsSxcEcboVtRLDqTODvXpAQ24vOK4f9Cp6
         eZfJCTQArHx9E5p51LCvxunij/ChBr2yueCpMZZgcKWCmPC8VvrnEL6JNLZFrOGkCw97
         RB9UGHMEP8c4YuMPN+aBD4F8NNn794TJDCnSzmZe1JqsdBebIu5fyBJrINMZoa9lwzU4
         hXyQ==
X-Gm-Message-State: ACrzQf286G0nBXF8CgWTHHcMXEpSCGrc5bankHF3D8fC33utSRET7m3S
        6/58QxsuCToRRrmQgiawsvM=
X-Google-Smtp-Source: AMsMyM6hCI+tWbEhji8iIg5DuxmfJQxC/JVelrtGfB2kVWhzw1ZEzAiDs+DSWJIqn/NmN6zCjXRSXA==
X-Received: by 2002:a5d:5f04:0:b0:236:cae9:2991 with SMTP id cl4-20020a5d5f04000000b00236cae92991mr1321897wrb.120.1667162073985;
        Sun, 30 Oct 2022 13:34:33 -0700 (PDT)
Received: from michael-VirtualBox.. (89-139-44-91.bb.netvision.net.il. [89.139.44.91])
        by smtp.googlemail.com with ESMTPSA id n25-20020a05600c181900b003b95ed78275sm4939385wmp.20.2022.10.30.13.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 13:34:33 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, germain.hebert@ca.abb.com,
        Enrik.Berkhan@inka.de, Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v3 05/12] HID: ft260: improve i2c large reads performance
Date:   Sun, 30 Oct 2022 22:33:56 +0200
Message-Id: <20221030203403.4637-6-michael.zaidman@gmail.com>
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

