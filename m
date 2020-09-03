Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4F225B7E2
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 02:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgICAzE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Sep 2020 20:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727864AbgICAyE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Sep 2020 20:54:04 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38010C061249;
        Wed,  2 Sep 2020 17:54:04 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a15so1449155ljk.2;
        Wed, 02 Sep 2020 17:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sc3sYFcL0IEq/C/45fRKWcEzy6eLUtql8SQc3ArwAOw=;
        b=j9CAmor2iaWVc1iz4R0Dn1r6mpzTi9h/JTOyqyVF2pWfGM0SPAthghLflUOLf1hUl1
         gBtriaxI24UXlYd+1WWD1jKJE639150AXXzXUD6F21ZEvB92hj00vmkoKl+7RTwoSJPK
         wlsLNy4AafNiGM8WIXlmZENQNWm7HIEDZDvdgQ+02051Wo11FOxWjzZ3B02jQ6rDpqXH
         AR4j5aiu7JekOLF9lpqR9l4KzAUFCzY0F2TGzFUwfU30B3BMeTXmdKIw7iwuHtY1tEgk
         20LQ7VXZK0oBAh78UM9aD8Z3QzHXViaRnz2Lyg1tTMNiQEYyxn2gb0RH8NK8mhM81F1O
         SzOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sc3sYFcL0IEq/C/45fRKWcEzy6eLUtql8SQc3ArwAOw=;
        b=iaxEl0RaTHwXCwgOQdEyTtJFZJf848LSGEjmPXf/++5igsRBWtz9akGCKwHeiI/wlk
         ChEs6FKm5l9uLnagF84MtUVT1MuBv0/WTgyMgkXe9VrQm+m7Fzz5Mz88ThyT0SRVlJ8Z
         dUk8BryS722yyGORTs54+O22a8tS8OvvuTQveLrHE0Yk8K/iZ1jTKKdfFrUthXgwLSWv
         tfO2wKQ52hQum3AWxf//h3lWZFBzjz+omCGV6CE5ud6Dem5mUqn+eO3qKml5q0Ysh8tP
         cqKk6I88NDzf9J69sT2O1qTW9ElLc5HUa6SJDo/DONsvk2cOQHpfrKBvi/hDyhAn++2C
         ku6w==
X-Gm-Message-State: AOAM531z6dUYdhXM78Z44qMQMHyc3GyFWvvBOs0nXPrU33A0gttkjTt/
        vLAuiSGhZHhlKCg4CRZoaPs=
X-Google-Smtp-Source: ABdhPJyTAdhWYUHIujeYSpssEq6NJsbcuCh4I5wgcvEpP8uEQOK9Kntj9CgGyhmzbBHyw0EXdHddBg==
X-Received: by 2002:a2e:8ed4:: with SMTP id e20mr269317ljl.403.1599094442704;
        Wed, 02 Sep 2020 17:54:02 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g1sm250321ljj.56.2020.09.02.17.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 17:54:02 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/22] i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
Date:   Thu,  3 Sep 2020 03:52:50 +0300
Message-Id: <20200903005300.7894-13-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200903005300.7894-1-digetx@gmail.com>
References: <20200903005300.7894-1-digetx@gmail.com>
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
index f6b9345b8dfa..19cea39bd4c4 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1171,6 +1171,32 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
 	return -EAGAIN;
 }
 
+static int tegra_i2c_error_recover(struct tegra_i2c_dev *i2c_dev,
+				   struct i2c_msg *msg)
+{
+	if (i2c_dev->msg_err == I2C_ERR_NONE)
+		return 0;
+
+	tegra_i2c_init(i2c_dev, true);
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
@@ -1351,24 +1377,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		i2c_dev->msg_err);
 
 	i2c_dev->is_curr_dma_xfer = false;
-	if (i2c_dev->msg_err == I2C_ERR_NONE)
-		return 0;
 
-	tegra_i2c_init(i2c_dev, true);
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

