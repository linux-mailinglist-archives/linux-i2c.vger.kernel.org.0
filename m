Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7135327DBC1
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Sep 2020 00:21:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729556AbgI2WVd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Sep 2020 18:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbgI2WU7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Sep 2020 18:20:59 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A6E8C0613D2;
        Tue, 29 Sep 2020 15:20:59 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id y2so7394547lfy.10;
        Tue, 29 Sep 2020 15:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IJPW2qjg5IMKXCGe896iaRoUfwQvNo7FkLK94cFe4zY=;
        b=Mc/E4ToDkDEHiU5xetMyjkbQ4M0s+p7WwiDvmZ3d+8ppOCXTMntHy06mlMWceElZ2N
         TC3lVeLuJ/lusWbOthArnFX3FkTccLlP+g7PfpT1ByAwsphV/iBynEPchtOKra0taem3
         7lxPdd+rSiNXEmOdGRahw3xLjdwAc8AFYejTmEvlRO2iA7KBD7sSMqgzOd+EF+PTzFeJ
         EDRRrToi8seFOunQ4yevdQ0+KSCJ2GKy2Tl2TLjA4OswHo8bdRrpvLctVYuw4uYUkVsg
         Ldd4Zd6p8iL9G9mPpW9L0MGeE9zLtyIgYOqLRlJSWJoLa+37PxeQcUO4w78cJ+v05Udg
         rhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IJPW2qjg5IMKXCGe896iaRoUfwQvNo7FkLK94cFe4zY=;
        b=NsdmY8/6ljWAlVevkw2tlJEpr8UEB6W/VZKmYK9zuJ98gXJfuU77IT10bDOTOqkVK8
         +hSbEqQGoEfA+9BsICfjZboVtyTHjlzK177yrkgtrqwviDD2npaGhEgGFBd5IejmRQWH
         gMH3EfWeLh44f87ZkuX0tYInQgCnd5b8LBP162eAhLXVPmzJd0Y21pA+WKhDY9ymUx3L
         IYreaQ6dAO1BlYa75YelWA6xL1tTRzA1/gv1+EPXirb4uvcVHd7iFdRmVvoiV5aXlMtk
         k561pGT2nmoogpIuL8V35o2evEbaGqKDNK9kO+qgqzqenzXHTEXgqKRN6To/wf6tK93z
         fedQ==
X-Gm-Message-State: AOAM532nqXKP5onwZcRUxOPeiTPl1tQU4rlBYcRTzcUImkdwqk0bpoVI
        EzcLBPGny6RA2kB5AgAy7Mk=
X-Google-Smtp-Source: ABdhPJz6TIzFfZdHb10hjtWTGhgBVLghgdE2BqQEU4Cg40A8BNOY7Tvd/7Hw5JacVHa+CvjcQm4IDA==
X-Received: by 2002:a19:7fcb:: with SMTP id a194mr1844910lfd.121.1601418057447;
        Tue, 29 Sep 2020 15:20:57 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id q18sm3379750lfr.138.2020.09.29.15.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 15:20:56 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v9 22/32] i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
Date:   Wed, 30 Sep 2020 01:19:05 +0300
Message-Id: <20200929221915.10979-23-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200929221915.10979-1-digetx@gmail.com>
References: <20200929221915.10979-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out error recovery code from tegra_i2c_xfer_msg() in order to
make this function easier to read and follow.

Reviewed-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Acked-by: Thierry Reding <treding@nvidia.com>
Tested-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index f8bee67370aa..95d257cbd800 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1105,6 +1105,32 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
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
@@ -1288,24 +1314,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

