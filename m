Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE27DECD97
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Nov 2019 07:22:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfKBGWN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Nov 2019 02:22:13 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36061 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfKBGWN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Nov 2019 02:22:13 -0400
Received: by mail-wr1-f68.google.com with SMTP id w18so11668722wrt.3;
        Fri, 01 Nov 2019 23:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zhzCe9gexEx43QvM7xg8LGu1dhIv2+i6xu5dgHafDF4=;
        b=kwLnMiSMatRxSK1C76ObCExaPa9R1/4BJEHxx4D1XjeiecZuJ2/NVbjoC4Ph/eJ/2c
         RBOFwFKJImzh6GFcR5REGOsZiPm1EyZf5LViYrAM2YRo+OXh4tecrokck7kfBE9RpxIC
         QTOvF1QlG0sdyLRcdI1muyz0WwVPzncurGKQH+losdQ7UINUTxzJfX+X4K54Au/xkqir
         7DR79TKROUSQJ3ZfNdWabSGR3v/9EzbgQVsO/Rg7M7WoolGWIkdKNd3/rhR9C7VruSXe
         HBwC7tDoUo57wB732gk+BCWqZL2be9kJ2Z3I/0Qq6H9cKZ81tv2Yl1078ZGLLf+APkTK
         i6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zhzCe9gexEx43QvM7xg8LGu1dhIv2+i6xu5dgHafDF4=;
        b=ZCcioDf8vi5QS4T00S1dGsDJTaMAH22yaiCMmY+DFX/BKjYqFOJNQPwkz7humQsiVd
         DRs3mTAa9ELpg3sdZue90Jx2wjvVyQZrsbBelKVWp0ho3AMKCJYjuAJBbTmLhNJHqzji
         Aj+NuDkoMPzjOaTDjKXE2NDbtFRVC/nwqE2vFl+Vw/uJhh8HyXKmKKG2tQdrsbl+NhbY
         M6t7Y2DWhSqEYq6zv7VdV6zZpJDFHHKZtKNj9rlTinFUSgdAaDYGX+XHlfJ7EScLCn5z
         xCA//Uul9ocT9dQLYl6awK7YkpAQIXn5UWZs1Oztii2hQ7+J/Cbd2wcr4l3eiDHmO7Sp
         RrMA==
X-Gm-Message-State: APjAAAWB+iICh9qkzDhtNgp/EvSNcTzp2GQNwi/1E5RYXv+8NBPEfIJY
        WJCY74lTiogXVPhbEos75Qsy1F3c8YA=
X-Google-Smtp-Source: APXvYqzU8cyqw+/oDcKoSvzWSB/BEN+evKPThPEccSytbmI1say7JB4C0XssYGtF7LAmI3cV/QR2KA==
X-Received: by 2002:a5d:4612:: with SMTP id t18mr13307058wrq.255.1572675729879;
        Fri, 01 Nov 2019 23:22:09 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id u68sm11432918wmu.12.2019.11.01.23.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 23:22:09 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH v2] i2c: imx-lpi2c: add clk_disable_unprepare calls
Date:   Sat,  2 Nov 2019 14:21:49 +0800
Message-Id: <20191102062149.3957-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver forgets to call clk_disable_unprepare when probe fails
and remove.
Add the two calls to fix the problem.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Adjust the call order to make it consistent in probe failure and
    removal.

 drivers/i2c/busses/i2c-imx-lpi2c.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index c92b56485fa6..f964693c0901 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -618,6 +618,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	return 0;
 
 rpm_disable:
+	clk_disable_unprepare(lpi2c_imx->clk);
 	pm_runtime_put(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
@@ -630,6 +631,7 @@ static int lpi2c_imx_remove(struct platform_device *pdev)
 	struct lpi2c_imx_struct *lpi2c_imx = platform_get_drvdata(pdev);
 
 	i2c_del_adapter(&lpi2c_imx->adapter);
+	clk_disable_unprepare(lpi2c_imx->clk);
 
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
-- 
2.23.0

