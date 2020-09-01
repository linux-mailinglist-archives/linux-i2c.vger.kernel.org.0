Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF08F25A081
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Sep 2020 23:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729200AbgIAVLp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Sep 2020 17:11:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729031AbgIAVLh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Sep 2020 17:11:37 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72D4CC06124F;
        Tue,  1 Sep 2020 14:11:36 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id e11so3290805ljn.6;
        Tue, 01 Sep 2020 14:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Mv0yu222OJEMYIiqJ/vthowt2F9JGEiQsw/LQHLwEgU=;
        b=QTg2THmeoUlgLmN2bUFlxtuRYygcEYwmCBodh19ykmXbOmO5yHg1erdhsTzfAps6gz
         i3a/3R//kPQHxRUgYYiyZh712dlikYjoIs7KF6hsVRTMx/t9D47R9NFGuT2J7YlOjN53
         suPt3NC5kDEUUW5l1hOBv+6Sq7j2RvhFeV95nCeeOEBG10jpQPBOxXHAisUHRWRQmpNe
         2mOfLiSC+Rw6ppp1irXImXhp0EZCPOZZF327XX/LINebF5smm43ZJDsD2SBWYjhcGupM
         G5SDcLU6RqrxS+HXnROqQw76smufy+OVb404JecWIwasWXqod5cdVuYDf8OBmu4iNFLF
         0eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Mv0yu222OJEMYIiqJ/vthowt2F9JGEiQsw/LQHLwEgU=;
        b=dow4gB0vhpXhm8Xx9vCYwxl2Qmqu5HhyXH7zwtalkQVmVWw7hqAx9I9t+RjgmaA2uL
         KLPBwlDXUZITcuE2CgyqHhF/UKkM29VJxzSWNRz2ABYExlYn676Smp+khStLR545OmcR
         fzozVV46wp8VqOxNSHYzPT2BbkQ2U6bPiveRjSoaUFCI8TW/urts1k1wNXr6K3fVWOvq
         22aD7LymvA9cMQzeJXB9bwTndg871l36mTzAWtD8O8GmwUWeq4aJ+tJdGs+CwhVchjfq
         zK1+8RmY7ecFcOXGEfm0+fkeV3sZHThHk6ubtgYaFXqMW2dSigCe7SzRzSU90dPSl2Br
         VNVg==
X-Gm-Message-State: AOAM530VfFGy+GqWGqYD/y2JRgu5HLmQHiURwpfozVpxlQzk4yOXhyAs
        0ZxOBegNFulHial49RQaZOU=
X-Google-Smtp-Source: ABdhPJzKbRsQiqhofuzntiit4K/W8LLLu4HZ4/AGK1nSHBgPYR9TxloWk/j30Psz5j8PLCfQ6grRiQ==
X-Received: by 2002:a2e:9185:: with SMTP id f5mr1515470ljg.394.1598994694927;
        Tue, 01 Sep 2020 14:11:34 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id g19sm502656ljk.125.2020.09.01.14.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 14:11:34 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/17] i2c: tegra: Factor out error recovery from tegra_i2c_xfer_msg()
Date:   Wed,  2 Sep 2020 00:10:57 +0300
Message-Id: <20200901211102.11072-13-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200901211102.11072-1-digetx@gmail.com>
References: <20200901211102.11072-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out error recovery code from tegra_i2c_xfer_msg() in order to
make this function easier to read and follow.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 46 ++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 300a6576ff94..bc891d4b41ad 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1161,6 +1161,32 @@ static int tegra_i2c_issue_bus_clear(struct i2c_adapter *adap)
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
@@ -1341,24 +1367,12 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
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

