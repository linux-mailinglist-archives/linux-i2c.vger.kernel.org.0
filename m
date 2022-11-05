Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0FE761DE67
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Nov 2022 22:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiKEVNz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Nov 2022 17:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbiKEVNe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Nov 2022 17:13:34 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3ED911C0F;
        Sat,  5 Nov 2022 14:13:32 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 21so12287306edv.3;
        Sat, 05 Nov 2022 14:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVosFDdegYc2T7RE574s5zEjHMpyk85WYcARAoep7g4=;
        b=fyltJM5WyL6AFgNX1gBp4zc5q82ihqO5x6jGOFnI/L4ppp7hYWd9nh7m7pw/I4pp35
         ZHCNiYPst96enZydrjbTnz+BnGxcvfLgcpaxm22CS5owmr5pJ4vJAHmhElojcGcuoiH6
         K2XWs6NVIT09t+Bdz6eTsAE2z7NpgSVor7mlRjSBgIXh5me2IaXn38z8koQBbwaGwYi+
         WbpODgb9awKgtrh5Qhh02HGbJBqc12pwKm1sPgS47kUlCGF6P9egpn2YZXlPVC++E9+9
         Wi3HfbXKq+D/J7jsuSaCaKBLt9FmoOwmKuk+0Wi5CZR7f/mWeVdC2RXziVnZNesUsGkK
         LWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVosFDdegYc2T7RE574s5zEjHMpyk85WYcARAoep7g4=;
        b=TOmF9jBKoejjpO+YOtbzeYt75NVGgyV78JosAYCaSbN3JnihVKSHvhNFDzaIPIP5Ly
         R0HRLIWeATs7HvuoWu4A9+IJNlo0Qfz3gBHs7FRX2Stg5EUX2/Fe6OcqYFZ//IDrfYVd
         2YGCIU2ro/mJTRnjSBA9IUMeEotWoedai5jE5lvW9qYH03Mytm5prBCI3bV6eCQUD5G7
         aahnZcIsinBCle1vHwexcPkvfOA4xG1kUr5fM1/Ulyme48Hy5vsdm1bljy+4ALpTRTtE
         iARo1y0/FcaA+mDK36FuQ53QN6qwUT/Wz35l0K1Rc3A1tfT5agt0v9otQyL2Q+8xGGZb
         b9mQ==
X-Gm-Message-State: ACrzQf3TXq5xPSaygYJo03jvauuNEvK/gtelFUuj4zTbGLdcp1jh/PQB
        yGVf5oa0SKkOnNX0+4Wc7bA=
X-Google-Smtp-Source: AMsMyM53U8/5uP+6tI+gEGH84aRwbgmg1oyyqGL5fTi+NQsQK39mPVA0sqIPRkai+xWmEoHZJBDaug==
X-Received: by 2002:aa7:ce92:0:b0:461:78c7:dfe2 with SMTP id y18-20020aa7ce92000000b0046178c7dfe2mr43144584edv.342.1667682811259;
        Sat, 05 Nov 2022 14:13:31 -0700 (PDT)
Received: from michael-VirtualBox.. (89-138-220-136.bb.netvision.net.il. [89.138.220.136])
        by smtp.googlemail.com with ESMTPSA id ta19-20020a1709078c1300b0073d796a1043sm1323502ejc.123.2022.11.05.14.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 14:13:30 -0700 (PDT)
From:   Michael Zaidman <michael.zaidman@gmail.com>
To:     jikos@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org, Enrik.Berkhan@inka.de,
        Michael Zaidman <michael.zaidman@gmail.com>
Subject: [PATCH v4 10/13] HID: ft260: wake up device from power saving mode
Date:   Sat,  5 Nov 2022 23:11:48 +0200
Message-Id: <20221105211151.7094-11-michael.zaidman@gmail.com>
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

The FT260 can enter a power saving mode after being idle for longer
than 5 seconds.

When being woken up from power saving mode by an I2C write request,
a possible NACK is not correctly reported by the controller. As a
workaround, the driver will issue an I2C status report two times in
ft260_xfer_status() after the chip has been idle for more than 5s.

Co-developed-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Enrik Berkhan <Enrik.Berkhan@inka.de>
Signed-off-by: Michael Zaidman <michael.zaidman@gmail.com>
---
 drivers/hid/hid-ft260.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/hid/hid-ft260.c b/drivers/hid/hid-ft260.c
index 40fae81386e3..ac133980dfe9 100644
--- a/drivers/hid/hid-ft260.c
+++ b/drivers/hid/hid-ft260.c
@@ -31,6 +31,8 @@ MODULE_PARM_DESC(debug, "Toggle FT260 debugging messages");
 #define FT260_REPORT_MAX_LENGTH (64)
 #define FT260_I2C_DATA_REPORT_ID(len) (FT260_I2C_REPORT_MIN + (len - 1) / 4)
 
+#define FT260_WAKEUP_NEEDED_AFTER_MS (4800) /* 5s minus 200ms margin */
+
 /*
  * The ft260 input report format defines 62 bytes for the data payload, but
  * when requested 62 bytes, the controller returns 60 and 2 in separate input
@@ -237,6 +239,7 @@ struct ft260_device {
 	struct completion wait;
 	struct mutex lock;
 	u8 write_buf[FT260_REPORT_MAX_LENGTH];
+	unsigned long need_wakeup_at;
 	u8 *read_buf;
 	u16 read_idx;
 	u16 read_len;
@@ -306,6 +309,20 @@ static int ft260_xfer_status(struct ft260_device *dev)
 	struct ft260_get_i2c_status_report report;
 	int ret;
 
+	if (time_is_before_jiffies(dev->need_wakeup_at)) {
+		ret = ft260_hid_feature_report_get(hdev, FT260_I2C_STATUS,
+						(u8 *)&report, sizeof(report));
+		if (unlikely(ret < 0)) {
+			hid_err(hdev, "failed to retrieve status: %d, no wakeup\n",
+				ret);
+		} else {
+			dev->need_wakeup_at = jiffies +
+				msecs_to_jiffies(FT260_WAKEUP_NEEDED_AFTER_MS);
+			ft260_dbg("bus_status %#02x, wakeup\n",
+				  report.bus_status);
+		}
+	}
+
 	ret = ft260_hid_feature_report_get(hdev, FT260_I2C_STATUS,
 					   (u8 *)&report, sizeof(report));
 	if (unlikely(ret < 0)) {
-- 
2.34.1

