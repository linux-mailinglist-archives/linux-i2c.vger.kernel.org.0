Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9B0925EA8F
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Sep 2020 22:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728856AbgIEUnY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Sep 2020 16:43:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728772AbgIEUmu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Sep 2020 16:42:50 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1672AC06125C;
        Sat,  5 Sep 2020 13:42:50 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id r13so11852216ljm.0;
        Sat, 05 Sep 2020 13:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QVQHvYpAmw/p5n057vt+M6Pf6D2sgl2Gq7Y9V22cvJs=;
        b=eszHCt7NF1ar40aGRUIDppGRWQ6aSEptVk1w8Vx9dvrOmkJg7obJMDPcThfv+C6vT3
         0ON5XREVdQAQU7EeJe+OSGuZLay8XRRs23vun1Fypb28T0FY9ty1mACqsXAQmci5xM/j
         FQ89M0Tg9YgC4lfPX2NLTPTDoI9g/VZt04zTYK4l8lVuk4iHkgNMe7SB1RISsEuiwrK9
         sliIgDqqKi15B/Xs09vGPxeq/dR2WL57wXuqi1jomSH6PIuRehnhgNv3q33s5IKxs569
         CfdzJjs0WU0zeJY7Cmvr1O/6StRCUG7bJwaYyjr0sHIUEQBAVnEOHLJWQDDYZc6Lo1FG
         8s2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QVQHvYpAmw/p5n057vt+M6Pf6D2sgl2Gq7Y9V22cvJs=;
        b=Z8DmRJCy5/XNatqicRMPXDMmYOi7/sM8IJIGDzwEeTO2qp9mIOLqSQ9x0WgfEzj3nm
         pgZq8VYtb9NrcC83Usa/VcEjPT3XkqAf+31tWlZKyoNhDpP2iVC+uIT0jtK3n4LPwoWP
         C+FZe8CnSgiODd583efH4dTaCz7cUQSiRdGM4WFY2Nl1Ls3ViuQxAPvf2AvUqSO/Ui47
         g/S8XfaIsQvCu63od8TwI36FkXP1W+89wkZio/rJbUwDWzm3HVI2/irhaqho0T65YCR9
         nTYeK/pYPHoutpjvK3+jw64fvGAaeRp6dJ6y/MsoCyZXJLfGKjbF1du2bBRzDxmjESNN
         +28Q==
X-Gm-Message-State: AOAM531LbILCg75QA53cDN0UO3m6sIWwYZBnVmlSlwO8znf8+kovwfv0
        HGiP9sZVSvblY7/xWm0O5cI=
X-Google-Smtp-Source: ABdhPJz87s4luWSczsnDj0GYqf0APh+kyTLLv8eorcCRVtfhh+YwLcbbFwhBBm4hQ/HWqlo8YwaEHg==
X-Received: by 2002:a2e:81c2:: with SMTP id s2mr6858268ljg.10.1599338568575;
        Sat, 05 Sep 2020 13:42:48 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id e17sm1677763ljn.18.2020.09.05.13.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:42:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 26/31] i2c: tegra: Consolidate error handling in tegra_i2c_xfer_msg()
Date:   Sat,  5 Sep 2020 23:41:46 +0300
Message-Id: <20200905204151.25343-27-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200905204151.25343-1-digetx@gmail.com>
References: <20200905204151.25343-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Consolidate error handling in tegra_i2c_xfer_msg() into a common code
path in order to make code cleaner.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/i2c/busses/i2c-tegra.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
index 64776cd8e0ff..3dd688e9462a 100644
--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -1277,8 +1277,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 		if (!time_left && !completion_done(&i2c_dev->dma_complete)) {
 			dev_err(i2c_dev->dev, "DMA transfer timeout\n");
-			tegra_i2c_init(i2c_dev);
-			return -ETIMEDOUT;
+			err = -ETIMEDOUT;
+			goto reset_hardware;
 		}
 
 		if (i2c_dev->msg_read && i2c_dev->msg_err == I2C_ERR_NONE) {
@@ -1298,8 +1298,8 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 
 	if (time_left == 0) {
 		dev_err(i2c_dev->dev, "i2c transfer timed out\n");
-		tegra_i2c_init(i2c_dev);
-		return -ETIMEDOUT;
+		err = -ETIMEDOUT;
+		goto reset_hardware;
 	}
 
 	dev_dbg(i2c_dev->dev, "transfer complete: %lu %d %d\n",
@@ -1313,6 +1313,11 @@ static int tegra_i2c_xfer_msg(struct tegra_i2c_dev *i2c_dev,
 		return err;
 
 	return 0;
+
+reset_hardware:
+	tegra_i2c_init(i2c_dev);
+
+	return err;
 }
 
 static int tegra_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[],
-- 
2.27.0

