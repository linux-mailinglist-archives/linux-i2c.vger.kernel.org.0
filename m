Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C6E29E4D9
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Oct 2020 08:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387635AbgJ2Hr5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Oct 2020 03:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387704AbgJ2Hrc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Oct 2020 03:47:32 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23437C0613CF;
        Thu, 29 Oct 2020 00:47:32 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id h6so1662989pgk.4;
        Thu, 29 Oct 2020 00:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EfUvM2HIYqayJGNB5YFiLjHO4usiXX5f5sqxhofy1FE=;
        b=E/npHPWGKAKlhVPGqu3KrHiHe4Sw26z0cNVUoqYypll8q94Og6WXUQw6Cs0zO6J73w
         v/s28342fZ/1xid+SnprcFt946EX+P/PftlsB3LPM6B9HkyRS+X1HSoH0IuWhuUnnDSN
         2UWEiMHt1jjpNQe0vgn65y/z7ngPnmv6/r5dOhnDeroQN+tAsxHccRY0e2CkSWI524BC
         K0UQhPgEDtug8ifAbqmuBkzKLIpze8HpsJ9XUQBpQ77RYkFzcfX9yr6OBhYQBrRL+Yfc
         yi7WU5OZDo3ieFE8qZixr22U+VJszUO2cWmhjX6UIqRsRAlfVdNk941wNj7NSh9VeyJl
         I/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EfUvM2HIYqayJGNB5YFiLjHO4usiXX5f5sqxhofy1FE=;
        b=c6zfFcEyf/rXPF5I6HrgKMOdDEG7xTISGAOFbg5RgaYUl4FzgYYMjw969tBzKuwouv
         umfLWzt81v0/zH5noihudVZf4J3hJOyeZeIqm3xpw3r8tt1EERMiOiSbZY5qkFpt0Oxo
         2DN8bbGBlbD/TxIPP6bvjyaBAHX6kEqQFRIza6D7oZ8iUroTPY5Q13gWL5GQg2g3uL6i
         Voz8l8YW4HPHa1BpYs4gu9qn5ecU4+GaE0otVP0hhtyGZAs6rQY/kizJXP06NSR+SPAH
         5Bg4nIKV6zGBJ63euwzkTh+2rCMfqzqvFy/lrh1bDFrKNIjmkWa3EAHlwTaA+QMTlM2A
         Ob4g==
X-Gm-Message-State: AOAM533A/++FdcDnQS+M3RrUiBZMuGA8XeGNvOn2bMB6xSSZlbozPA8H
        SwxHZ8dxEl+DodAj2r2hzFXScT2DTdjtcZOe
X-Google-Smtp-Source: ABdhPJwudijRFRUrG2f6EdIKYZWfRNbRlMZjCvN3h1EpyMXrCHzLF6Zj1YYa35PjfEIP/4HGxJyJdQ==
X-Received: by 2002:aa7:83c2:0:b029:156:5ece:98b6 with SMTP id j2-20020aa783c20000b02901565ece98b6mr2981705pfn.4.1603957651547;
        Thu, 29 Oct 2020 00:47:31 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id q11sm1540708pgm.79.2020.10.29.00.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 00:47:31 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     linux-i2c@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org (moderated
        list:ARM/NOMADIK/U300/Ux500 ARCHITECTURES),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/5] i2c: nomadik: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 15:46:53 +0800
Message-Id: <20201029074654.227263-4-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074654.227263-1-coiby.xu@gmail.com>
References: <20201029074654.227263-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

SET_LATE_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index d4b1b0865f67..cd0f9f92c913 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -873,7 +873,6 @@ static irqreturn_t i2c_irq_handler(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int nmk_i2c_suspend_late(struct device *dev)
 {
 	int ret;
@@ -890,7 +889,6 @@ static int nmk_i2c_resume_early(struct device *dev)
 {
 	return pm_runtime_force_resume(dev);
 }
-#endif
 
 #ifdef CONFIG_PM
 static int nmk_i2c_runtime_suspend(struct device *dev)
-- 
2.28.0

