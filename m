Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48DCD2FAE15
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Jan 2021 01:36:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732455AbhASAe7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 19:34:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730466AbhASAe6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 19:34:58 -0500
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86DC9C061574
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jan 2021 16:34:18 -0800 (PST)
Received: by mail-qv1-xf29.google.com with SMTP id p5so8388826qvs.7
        for <linux-i2c@vger.kernel.org>; Mon, 18 Jan 2021 16:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pOUXNGm8cuKVuz5chOjLt+pojzdg6mYDZS4jNJyIMWA=;
        b=LF4jWrMAITpIZ4Jra0GJSQbO30bVnqoLZCddDLOx9onN5K/g3XF3t4Bzb2f9KpL/81
         01wRCmu0zrRaV9i9bUFgou/1bRTzV4SLd3i6+UkhAKLMTzTe6GG6vDFVaMOUlDz64AW9
         nCUkgI84+QGfehZbnawG9LZvgNpNbfMfoZSQroyQTZk3naLETayN0DkN7UIOCyPnioTc
         j+zxJ04n5/ObHd5a68ZoVR5KnIjTruMMKTH9J8i+2Izal7dD4gQrP2ymSxE4LQ9KneMi
         KKmktRUKtbIs84PIlEMp7thbrlTncMxqF7SzPH0gl3Ae6J/nvFtaXMAMpKWuKP8vaRjp
         T/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pOUXNGm8cuKVuz5chOjLt+pojzdg6mYDZS4jNJyIMWA=;
        b=TrUVfrfxRFnDNiSY23bZRUy89nPad5vFN5GuZGQrD++6L7+QkBxnCycrGPtyLqpRko
         ZCmXviu7wTPureH8TY0w8wfWGABv0hOELoSG+2xupWSZ56G04K/Nn0dRLE6HvOqz/d26
         dpP3oPLPyauV4jdYgqRV4vvzOHtJ843X3IfVO0b/q5jii4XTmafSCtLfPx1mEPkRZrC4
         uZDCALfNMF/YNI39yFebxt7BAWl3pQmWqj0cZ820I/EkuwZi2ckccegLqe//i9a+3otM
         PWOOKUGfOH84zMqJDi3vTBLm3RwpPUk3d6i0IJbeBrbldSZ+Omr/bqAXCgeXBXnSlghN
         o/zA==
X-Gm-Message-State: AOAM5328ss24N+3Jvw0gi5PD1Bkwhi1bxEMfvnAnvfzWJYl/eQx/Ly7E
        xw+RsjbMg5oRre87rV8E0qGBpEpO/ac=
X-Google-Smtp-Source: ABdhPJy+iCsEaUkvkNRFpwUJhAmBi9kTXxLNGKzGGvb2u8J4gwMp9Z1qbkFeoekHDj2uEuaKjdMLbg==
X-Received: by 2002:a05:6214:727:: with SMTP id c7mr2268095qvz.22.1611016457433;
        Mon, 18 Jan 2021 16:34:17 -0800 (PST)
Received: from localhost.localdomain ([177.194.79.136])
        by smtp.gmail.com with ESMTPSA id r15sm11791050qke.55.2021.01.18.16.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 16:34:16 -0800 (PST)
From:   Fabio Estevam <festevam@gmail.com>
To:     linux@rempel-privat.de
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de, wsa@kernel.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] i2c: imx: Remove unneeded 'match' variable
Date:   Mon, 18 Jan 2021 21:31:48 -0300
Message-Id: <20210119003148.1793614-2-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119003148.1793614-1-festevam@gmail.com>
References: <20210119003148.1793614-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

There is no need to have the intermediate 'match' variable.

Assign the device_get_match_data() directly to simplify the code.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 5d0ce70411ad..6e5d26cf3f2f 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1309,7 +1309,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	void __iomem *base;
 	int irq, ret;
 	dma_addr_t phy_addr;
-	const struct imx_i2c_hwdata *match;
 
 	dev_dbg(&pdev->dev, "<%s>\n", __func__);
 
@@ -1327,8 +1326,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (!i2c_imx)
 		return -ENOMEM;
 
-	match = device_get_match_data(&pdev->dev);
-	i2c_imx->hwdata = match;
+	i2c_imx->hwdata = device_get_match_data(&pdev->dev);
 
 	/* Setup i2c_imx driver structure */
 	strlcpy(i2c_imx->adapter.name, pdev->name, sizeof(i2c_imx->adapter.name));
-- 
2.17.1

