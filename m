Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 950BC5337BF
	for <lists+linux-i2c@lfdr.de>; Wed, 25 May 2022 09:49:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233874AbiEYHtD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 May 2022 03:49:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240135AbiEYHs6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 25 May 2022 03:48:58 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387D37A441;
        Wed, 25 May 2022 00:48:57 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id f21so26301316ejh.11;
        Wed, 25 May 2022 00:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=chBnq270F5Fwvfl8uan3+Yhvg63sd1rGbqIKPhc1Ois=;
        b=gA9+T+ilmMK6wfbzNN7GznBvQNcK7a7eQBDJmo+T17hrnf8aY388arsvAt9fdGXrHC
         AOOwLNFwIwsfEgKNtUSwEDa2iLags4iOsiLxlcQkBrvLIwR7RTW3zyuZedVwbBmQRkET
         Ahx7pRYkFkr2NSggSV6gc0Y4q0pKUbw2HWs6N7mECPWHjzdPgpd9v2KH/eO1KDDkkcQn
         594PaVc7UXpE6q6oqM/JZbAkhusR9rO/rqgkqTEy8+c5fVmo+8eXjQBayvkJiTct1R5u
         ElBhHMGUpgthQ+fntFIRgn/Ae7f/fjd+3OMnRoUMv1abODx198nKkn926e44fXedIuI7
         pLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=chBnq270F5Fwvfl8uan3+Yhvg63sd1rGbqIKPhc1Ois=;
        b=TNqWGi4mF+JZYnd5jmk5k1ghEyr20Zh+uumh27OVo0MW16ZxQ7Ej2AZhnPldMzyuK/
         4qqaEIdaTibuqyqWLLSzGG1Jt+mdaqQmdQC4OSOSORZM0IUeuHPcwq66fJIvQZLutBvE
         YUR3eu9H/bc3wnBZqZsn3FVr/04nnj11W6UMa4oWgWYa8l+EcaOThFZlBtQwOTEG5igB
         cUWDWIU/efC+Jf5OSwooPNJvMmliFBTZlz/nMmnRI0Ld/mqassDDAjIvEUNDtViA58b5
         cArG2rvzqASFOjdTSXRpNDn6elcrh7YzskYZZ2Ks3T/HSnxx0+rNdH1UkbPfTq1jIl9F
         huyw==
X-Gm-Message-State: AOAM532Gu53Od3o61yHRVMwLiX1WmJBje5b1yUDRQr+6KltAD/WqZKFr
        j56Gvy7AO4bRM4FfDBHNMQL7j/zvBHk+xw==
X-Google-Smtp-Source: ABdhPJzhq7kF+Qf+Mk+9t0TDEQePhUJI1GrBrPYuJkNLpV0eRNt7Cw9Iasn2yHlXPQF2qPUmr6SRUA==
X-Received: by 2002:a17:907:6090:b0:6fa:14ca:fba2 with SMTP id ht16-20020a170907609000b006fa14cafba2mr29010902ejc.564.1653464935586;
        Wed, 25 May 2022 00:48:55 -0700 (PDT)
Received: from localhost.localdomain (109-186-136-71.bb.netvision.net.il. [109.186.136.71])
        by smtp.googlemail.com with ESMTPSA id v1-20020aa7d641000000b0042acd78014esm10230533edr.11.2022.05.25.00.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 00:48:55 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org, benjamin.tissoires@redhat.com, wsa@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, champagne.guillaume.c@gmail.com,
        mathieu.gallichand@sonatest.com,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v1 5/5] HID: ft260: improve i2c large reads performance
Date:   Wed, 25 May 2022 10:47:57 +0300
Message-Id: <20220525074757.7519-6-michael.zaidman@gmail.com>
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

The patch increases the read buffer size to 128 bytes. It reduces the number
of ft260_i2c_read calls by three and improves the large data chunks' read
performance by about 10%.

Before:

$ sudo ./i2cperf -d 2 -o 2 -s 128 -r 0-0xff 13 0x51 -S

  Read block via i2ctransfer by chunks
  -------------------------------------------------------------------
  data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
  -------------------------------------------------------------------
  43990           85             256           2           128

[  +1.464346] ft260_i2c_write_read: off 0x0 rlen 128 wlen 2
[  +0.000002] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.001653] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000188] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 128 rlen 60 flag 0x3
[  +0.008609] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000157] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 68 rlen 60 flag 0x0
[  +0.008840] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000203] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 8 rlen 8 flag 0x4
[  +0.002794] ft260_raw_event: i2c resp: rep 0xd1 len 8
[  +0.000201] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.015171] ft260_i2c_write_read: off 0x80 rlen 128 wlen 2
[  +0.000002] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.000764] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000231] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000148] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 128 rlen 60 flag 0x3
[  +0.008488] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000205] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000002] ft260_i2c_read: rep 0xc2 addr 0x51 len 68 rlen 60 flag 0x0
[  +0.008795] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000176] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000001] ft260_i2c_read: rep 0xc2 addr 0x51 len 8 rlen 8 flag 0x4
[  +0.002819] ft260_raw_event: i2c resp: rep 0xd1 len 8
[  +0.000167] ft260_xfer_status: bus_status 0x20, clock 100

After:

$ sudo ./i2cperf -d 2 -o 2 -s 128 -r 0-0xff 13 0x51 -S

  Read block via i2ctransfer by chunks
  -------------------------------------------------------------------
  data rate(bps)  efficiency(%)  data size(B)  total IOs   IO size(B)
  -------------------------------------------------------------------
  49316           85             256           2           128

[  +1.447360] ft260_i2c_write_read: off 0x0 rlen 128 wlen 2
[  +0.000002] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.001633] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000190] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000001] ft260_i2c_read: rep 0xc2 addr 0x51 len 128 rlen 128 flag 0x7
[  +0.008617] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.008033] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.000954] ft260_raw_event: i2c resp: rep 0xd1 len 8
[  +0.000208] ft260_xfer_status: bus_status 0x20, clock 100
[  +0.015853] ft260_i2c_write_read: off 0x80 rlen 128 wlen 2
[  +0.000002] ft260_i2c_write: rep 0xd0 addr 0x51 off 0 len 2 wlen 2 flag 0x2 d[0] 0x0
[  +0.001182] ft260_xfer_status: bus_status 0x41, clock 100
[  +0.000180] ft260_xfer_status: bus_status 0x40, clock 100
[  +0.000001] ft260_i2c_read: rep 0xc2 addr 0x51 len 128 rlen 128 flag 0x7
[  +0.008575] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.008014] ft260_raw_event: i2c resp: rep 0xde len 60
[  +0.001001] ft260_raw_event: i2c resp: rep 0xd1 len 8
[  +0.000223] ft260_xfer_status: bus_status 0x20, clock 100

Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index cb8f1782d1f0..c7c3a9d395a2 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -30,12 +30,8 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
 
 #define FT260_REPORT_MAX_LENGTH (64)
 #define FT260_I2C_DATA_REPORT_ID(len) (FT260_I2C_REPORT_MIN + (len - 1) / 4)
-/*
- * The input report format assigns 62 bytes for the data payload, but ft260
- * returns 60 and 2 in two separate transactions. To minimize transfer time
- * in reading chunks mode, set the maximum read payload length to 60 bytes.
- */
-#define FT260_RD_DATA_MAX (60)
+
+#define FT260_RD_DATA_MAX (128)
 #define FT260_WR_DATA_MAX (60)
 
 /*
-- 
2.25.1

