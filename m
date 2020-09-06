Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1371C25EFBF
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Sep 2020 20:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbgIFSyU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Sep 2020 14:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729202AbgIFSwB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Sep 2020 14:52:01 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5860C061795;
        Sun,  6 Sep 2020 11:52:00 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id n25so2645805ljj.4;
        Sun, 06 Sep 2020 11:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HPtva3QOF7z2BDsRvLIDLJn90imY+2PY4PW7wDrTSQE=;
        b=PJ4kWSQeN0I2bDBfKqmVdf+pxSBkYAFdGHbtPYXeM1Et6Ip2a61cNj6FeyaT+SaIZA
         BAZxFUu58nTzCn42NLmVGIHORbtKfKytQpYPWtSiMnoMiT6xzqNHL58t7QqpKDhd6HM/
         890YxTl07MNQxrNHAd9LzaCA5FMcbXt5hu95tQhYcg1BQETQi0aEtz00p/DjEjBU7fKV
         mIS1Ro3iuj+TDXUxs998l0aD42/bE58jG91lJeapVgB8Tii6Q9Z722b1Abl8hrbq2aPf
         HxK1ekAbBXjqwJgB1bo5f/4DnKre+8UdeScQkjBRvv2F14gxPmwjHwmR8Klm7cRRLgCX
         rHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HPtva3QOF7z2BDsRvLIDLJn90imY+2PY4PW7wDrTSQE=;
        b=ZEqTkM+3uxuKJFk5OkrVEDJgC3RM7v0xppXLUYYNB9b2J9DMq+7evmQMHXbq7321l6
         RNM0Vok2oQD/u/0qP4OxvUzQJTJ/WNRT9b3jPonCiTUb4Jh9fCrozOT7STud2fQoYQiB
         9h3Answgg4pS3wLiXGYwfyA0QfMz6FuRpydZOaX/Xn0VEdCLn3EESQjbP12h0ozQYyK5
         u9HvMgFfOt1KiHe10hHRWI10JdLqffEeCLQYfySIT8Cj5PLm4lSLbuLYu6lnSn8m1hAP
         PbulFt6y4ghPE7hX294yxqWvuSP5UYsnQl/Z2cGgeA+f/LCD8b5IYQ2kEgPkMRc+AXhR
         YGgA==
X-Gm-Message-State: AOAM533FVUoHYQBwJ/y753asURKVlxR3aYRpwP+gUlAFjKgo1tqq88Be
        5noacyDH2/EJLgakK/BlAclrWqKSd6A=
X-Google-Smtp-Source: ABdhPJzcIdKOsmixWVk/4MIBPjcNDPcMc5twDtbofR2zOazL4iabVgQG9hoSalGzfK/sqqW/Qw7hog==
X-Received: by 2002:a2e:a314:: with SMTP id l20mr9104763lje.213.1599418319219;
        Sun, 06 Sep 2020 11:51:59 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s3sm4883407ljd.44.2020.09.06.11.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 11:51:58 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 23/36] i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
Date:   Sun,  6 Sep 2020 21:50:26 +0300
Message-Id: <20200906185039.22700-24-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906185039.22700-1-digetx@gmail.com>
References: <20200906185039.22700-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out error recovery code from tegra_i2c_xfer_msg() in order to
make this function easier to read and follow.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 8c87382b1612..7e1bab9c9ccd 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1128,6 +1128,32 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	return -EAGAIN;
 }
 
+static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
+				   struct i2c_msg *msg)
+{
+	if (i2c_dev->msg_err == I2C_ERR_NONE)
+		return 0;
+
+	tegra_i2c_init(i2c_dev);
+
+	/* start recovery upon arbitration loss in single master mode */
+	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
+		if (!i2c_dev->is_multimaster_mode)
+			return i2c_recover_bus(&i2c_dev->adapter);
+
+		return -EAGAIN;
+	}
+
+	if (i2c_dev->msg_err == I2C_ERR_NO_ACK) {
+		if (msg->flags & I2C_M_IGNORE_NAK)
+			return 0;
+
+		return -EREMOTEIO;
+	}
+
+	return -EIO;
+}
+
 static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 			      struct i2c_msg *msg,
 			      enum msg_end_type end_state)
@@ -1312,24 +1338,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_dev->msg_err);
 
 	i2c_dev->is_curr_dma_xfer = false;
-	if (i2c_dev->msg_err == I2C_ERR_NONE)
-		return 0;
 
-	tegra_i2c_init(i2c_dev);
-	/* start recovery upon arbitration loss in single master mode */
-	if (i2c_dev->msg_err == I2C_ERR_ARBITRATION_LOST) {
-		if (!i2c_dev->is_multimaster_mode)
-			return i2c_recover_bus(&i2c_dev->adapter);
-		return -EAGAIN;
-	}
-
-	if (i2c_dev->msg_err == I2C_ERR_NO_ACK) {
-		if (msg->flags & I2C_M_IGNORE_NAK)
-			return 0;
-		return -EREMOTEIO;
-	}
+	err = tegra_i2c_error_recover(i2c_dev, msg);
+	if (err)
+		return err;
 
-	return -EIO;
+	return 0;
 }
 
 static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
-- 
2.27.0

