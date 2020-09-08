Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65623260867
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 04:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728822AbgIHCOj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 22:14:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728338AbgIHCMD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 22:12:03 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF1E6C0617A3;
        Mon,  7 Sep 2020 19:11:59 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id w3so18003000ljo.5;
        Mon, 07 Sep 2020 19:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CqjfeQNlhTI+BPVPyT/fOr+xJ6iCGpnOYdb93ZFU2yk=;
        b=KLQnsVHROyCYPOlFK8ssWwNzuMMsbPzPfPyZRDHT6kE1mRHQsHWbFrwgcn4F7P0HSX
         h45HtJQZfgbc5ZRbs2yMdGabpeOLxjDKtWG+C/Jy6ILrbwPqRRV/0pesA2sH0v0c7PG7
         texli1RV4HcYtWGLNkSPJlpT8UmdyTNfvUs6G0Sl9WUiEpENn4v80+cNh7VQO/XloR9y
         QDrG96KbqZ+JWzeTnJJ+PKsclpI4GkrrzA5EOwNjlNmrIBeUN6VCaLkwmGTCcLpdPvmX
         niaw2hF9wSeb9VHMOofDbu/mTQwbnVJBpY1HNA0N046hCESbJmtf5JPtjLiR4/iTY4LP
         ynHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CqjfeQNlhTI+BPVPyT/fOr+xJ6iCGpnOYdb93ZFU2yk=;
        b=VOO+XZF4EtiVaz6p4aRfbo2h5qCGCd13jukQWlyGphjRMoHMMet3bQNyqK5De5Kzez
         to2NUHpbA0A4QdFfvtr4+MS2Ex8S5wPa8NiLr9jYjOrB9Z3sSTjj3mHfS21tZYbUBBQG
         kmOxxaN4/+vFmsvN190KyVfDVDIEql6i2lGYxkygthpEzgj54FOHdBkdnv8CZ47c/tbq
         htUcAsIQZcFHxHqN9Eb0V0X1QoddK3JZNTjjOf4DRO7gYCQWNkqOCcLpU984ONcQuYeX
         iX6fRtrezhG6yNFmpfpCpcE5C4jVNjnomIloOu3CT8w2lGZKTJHnLn/BzWrCgjrFOAmm
         3E8w==
X-Gm-Message-State: AOAM531WxN8NdSmGiUb1yNzvASlQkCP7HHGf93DM49JVyhj3g/jnc6wb
        88Z4ipg2mtPA2N2DEOHMz1U=
X-Google-Smtp-Source: ABdhPJwMEfOulv4bE9nM1fVJG5naXD7d7s3IwKXhN/mDZzEoaYCq1j198LcJ4tT15xhtWFgHfciAgg==
X-Received: by 2002:a2e:7a04:: with SMTP id v4mr12094444ljc.128.1599531118224;
        Mon, 07 Sep 2020 19:11:58 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id j12sm9070085lfj.5.2020.09.07.19.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 19:11:57 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 25/35] i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
Date:   Tue,  8 Sep 2020 05:10:11 +0300
Message-Id: <20200908021021.9123-26-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908021021.9123-1-digetx@gmail.com>
References: <20200908021021.9123-1-digetx@gmail.com>
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
index 0d823aae9eaf..e53334bc3de3 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1098,6 +1098,32 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
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
@@ -1282,24 +1308,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

