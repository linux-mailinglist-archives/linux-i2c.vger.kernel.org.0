Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F268F25EA7B
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbgIEUm4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728755AbgIEUmr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:47 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F932C061246;
        Sat,  5 Sep 2020 13:42:45 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y2so5584317lfy.10;
        Sat, 05 Sep 2020 13:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=09tURB04/re3f0PypS3f04oI3QsoaJnQPq+D48ZVbS4=;
        b=utOcaYZGLHILJ5FtANar2RQFtxya6eCwFqjIPqSlm8HQP1YW6hvtz0zkAsjKtoycD/
         Z+YKVr1UGUEl0ZNwixOCHMikatXk10bIR+O2uxBeq40T9V6Cw3TsUDMSmxCSvCt9Keut
         ycyK2n1QJkdbw4vWtG2BoK28LMHx8WnUesG4FbTtq2yID4X4NGmLBgThJXO4EZw0Ljws
         aOZvFjQbEftRi5xdaTLD32XSdyEoCkCOotZjigE/2WOroMegkvmFDLodp+nto1iGN2Mv
         ZvY4IzXbWNzKTDBQkeCDh1liTGFZO/w76m/USxkmX6iaVkO75aGLFrA/w0tDkjkaT8Ub
         IrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=09tURB04/re3f0PypS3f04oI3QsoaJnQPq+D48ZVbS4=;
        b=cK9FnfDP1EI4bQt6BoWQ6rt8ywBzIqS1TNRWZyySXkH7RjY8kuA8aa/iCeDkq4gM89
         YNZ0pbfNS5IMpENd6PefztNfaR2I9IcS1KaluHSWhGCYSXCGjgIGXDtpQ1rpmJipaF4T
         5npVfHnV5JagO7N2CfeidflZaZIcINjjgk7YEoz2EH8WYK94Wv+CGYAm7JHSKJ1hYUPA
         xx6QRwELEmgrmRvX5v+m7P9MsL4LsiWNWcz/J8t0Dplasliuk8R9l5V/zRXezPw7tUfr
         wWljwgrtcDQ08zflwVIZTCdYsI9EIq3Q2NY7oVHYea9ePmfoEq58Czzb04JxO+HvcB9W
         dsvA==
X-Gm-Message-State: AOAM533od4i6p7CAj7idDeiAyrYcVmpT7QKe6DOiOub8do4AjQTg5E62
        YQr5NdPMHYfov4F81/63OeY=
X-Google-Smtp-Source: ABdhPJxrxyFgtqyN3otW/xvJhOxgcYjd9rWUuBc0VsYcwFwEoZMfAfWQ/WApeQVBOVe8RNE7wdCr+g==
X-Received: by 2002:ac2:546a:: with SMTP id e10mr6752525lfn.100.1599338563833;
        Sat, 05 Sep 2020 13:42:43 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 21/31] i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
Date:   Sat,  5 Sep 2020 23:41:41 +0300
Message-Id: <20200905204151.25343-22-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
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
index 6ec6161a1895..aa7adf8df668 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1134,6 +1134,32 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
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
@@ -1315,24 +1341,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

