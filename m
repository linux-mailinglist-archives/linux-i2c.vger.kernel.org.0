Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06F42290DAE
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Oct 2020 00:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392397AbgJPWZc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Oct 2020 18:25:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391990AbgJPWZc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Oct 2020 18:25:32 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 750C0C0613D3
        for <linux-i2c@vger.kernel.org>; Fri, 16 Oct 2020 15:25:32 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id t18so2021477plo.1
        for <linux-i2c@vger.kernel.org>; Fri, 16 Oct 2020 15:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KbXmC12vCkyVcsuizMiLb6hd66fnVjvjA5q9X2HN7hs=;
        b=FR5luAC7MOfdw/tBGdEvFvII2fJdbSlv1WbLCbyyyysjCn5fw28S9WCb4f242A8GKU
         qnGUD/K9PSOOmWB+dfZtKL/mPHQBmrwozQ4VVa9cSmHUzplPVqijgi8UY3mJ4Gm0AA8y
         G5ZyUNA3eOA9XPmewCHg4JEZJc24+YdUej/b0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KbXmC12vCkyVcsuizMiLb6hd66fnVjvjA5q9X2HN7hs=;
        b=NrTju7MC9/RbQ2recRsOUZQGPKNv5qUfCjeb4xo85IpHHHwZH/EBl8HAEI149gs/bI
         TSzG7RkzyrQxanu5SVi+4gXU3k21fDKHWsU1VGWOg0JlRcWbMUF//y1+oRdeY7AjHLsd
         SxMkRaJ6DjrQzyFKg3pnROvFAfW/a0QYKbbJFTPJn+f7rBZEg4bi0dWJ+YuLRWohp/rG
         Fg30LrzYqyxVajavQtWYwPj9wiRuy7clVz7rGLAqDrghzqpPm+oeLrOcKd8Ehs6pFc63
         rEGplYmLdY8gytolYvE7+HURfGOQ478ngW7v0+0dkuVTJmLFerwH6ukEx9dDA/ENmlGQ
         JMxg==
X-Gm-Message-State: AOAM5322408aYYzwqDRDmjXRO+m8LiCFFzp4lmovFG/ceH+bWozNWP5Y
        VDX7GzhxXwHhkWXXyFe3UbCcT8JZHjAiKw==
X-Google-Smtp-Source: ABdhPJxYBueNspj2O0WPS1Y29W08obImYQbosn1pdTz3WOvvykFD44nTZF6cWqJWAkFZanrQHPEPqg==
X-Received: by 2002:a17:90a:a111:: with SMTP id s17mr6306957pjp.28.1602887131974;
        Fri, 16 Oct 2020 15:25:31 -0700 (PDT)
Received: from evgreen-glaptop.cheshire.ch ([2601:646:c780:1404:a2ce:c8ff:fec4:54a3])
        by smtp.gmail.com with ESMTPSA id t10sm4099304pjr.37.2020.10.16.15.25.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 16 Oct 2020 15:25:31 -0700 (PDT)
From:   Evan Green <evgreen@chromium.org>
To:     Peter Rosin <peda@axentia.se>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Evan Green <evgreen@chromium.org>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] i2c: i2c-mux-gpio: Factor out pdev->dev in _probe_dt()
Date:   Fri, 16 Oct 2020 15:25:22 -0700
Message-Id: <20201016152454.v3.1.Ia45846771c63de3f2418d2b9c767cd95938a164c@changeid>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201016222523.364218-1-evgreen@chromium.org>
References: <20201016222523.364218-1-evgreen@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out &pdev->dev into a local variable in preparation for
the ACPI enablement of this function, which will utilize the variable
more.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Changes in v3:
 - Introduced minor &pdev->dev to dev refactor (Peter)

 drivers/i2c/muxes/i2c-mux-gpio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 4effe563e9e8d..caaa782b50d83 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -53,6 +53,7 @@ static int i2c_mux_gpio_deselect(struct i2c_mux_core *muxc, u32 chan)
 static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
 					struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct device_node *np = pdev->dev.of_node;
 	struct device_node *adapter_np, *child;
 	struct i2c_adapter *adapter;
@@ -77,11 +78,11 @@ static int i2c_mux_gpio_probe_dt(struct gpiomux *mux,
 
 	mux->data.n_values = of_get_child_count(np);
 
-	values = devm_kcalloc(&pdev->dev,
+	values = devm_kcalloc(dev,
 			      mux->data.n_values, sizeof(*mux->data.values),
 			      GFP_KERNEL);
 	if (!values) {
-		dev_err(&pdev->dev, "Cannot allocate values array");
+		dev_err(dev, "Cannot allocate values array");
 		return -ENOMEM;
 	}
 
-- 
2.26.2

