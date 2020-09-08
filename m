Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 567842622F4
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Sep 2020 00:42:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730381AbgIHWm4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 18:42:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730092AbgIHWlC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 18:41:02 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F71C061797;
        Tue,  8 Sep 2020 15:40:55 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k25so952902ljg.9;
        Tue, 08 Sep 2020 15:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S+lQblIYfMC0xoCVoTRie/3/bKbUPeIIfvh4Qt7sKEM=;
        b=BReUNAOTlJ4hBKM8LA0UIHTP/4IFUyCKrrkLbmFXhldyy98NTypenEo9AFp3kr4Ey5
         aAmsLKaR2esoCEqYRMOtqYmXPx2DvFloqQozmnYQzZ2LHWhCZvrWZsW6xRZx/HtvZBHY
         0DgOEhvyR7t1+BhRRwb4sIQfYWO0shB/wSj9Co6omVM8n99qN+GG8P/uKzUoUxiW4/Ai
         AiifHlyL7oeOVMlGO0iFxbAXyCQdgtPMAfTDPPC8N6MjKUjkzS63P5G7d8hj6cnrbeAR
         e4Pl4GSmb+UE6xZIz2oMTDiBz2Z63GJg1tVnP/u3LCsZdowKfiAp3y6OM3UDtsb9NXqY
         DgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S+lQblIYfMC0xoCVoTRie/3/bKbUPeIIfvh4Qt7sKEM=;
        b=Gpt6LjkIgZzNyJOlX4+/ilVELw71iRqpHrz82fMKZ3rTtaW2p3Klh1FDja5SKZw/Ou
         fnAjYKmKWzKCJZhmzQJLzUo2ruciiyNwZKTN5vN1jpDdPnIDO1WmeFVb3ktUos7tI4it
         ixcB2AzZM/ibrY+dw+m0YQdA4r9V7IyEp9SIPu2nZMyLwZV8mEH13euCtv8LrcoC0FQw
         EnEquXYW35g11/vdog5MavM/teyojdBaYigOjIg27Etqw7+1CM2tsaCgpcs4iPwv/tUY
         miSrF9odp5FwKf+iuVLagM4h+r7WVmuy/DYPKgKezTtFUR0WcDIAB2PdrM4vecIfOHfg
         9RDQ==
X-Gm-Message-State: AOAM530Xl10Zg1JeCthCiOC30nt05D0HRim4+Zm2oF6H81kEBHFVbgCp
        VRgv1tN0BkbXGvJ3AX8OafM=
X-Google-Smtp-Source: ABdhPJzHj/rYs+ujEiyukjCmncUFWTHbyN0yNFjNW+CTHM1nEdl7kZi7vOkIIJT8+GB/YseJbVJwYQ==
X-Received: by 2002:a2e:7d0e:: with SMTP id y14mr337450ljc.254.1599604853524;
        Tue, 08 Sep 2020 15:40:53 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s15sm268311ljp.25.2020.09.08.15.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 15:40:53 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v7 23/34] i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
Date:   Wed,  9 Sep 2020 01:39:55 +0300
Message-Id: <20200908224006.25636-24-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200908224006.25636-1-digetx@gmail.com>
References: <20200908224006.25636-1-digetx@gmail.com>
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
index 102d26c01dff..1ec2490d06ac 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1104,6 +1104,32 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
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
@@ -1290,24 +1316,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

