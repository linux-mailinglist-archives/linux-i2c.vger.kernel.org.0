Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D776204796
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jun 2020 04:53:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732025AbgFWCwm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jun 2020 22:52:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732005AbgFWCvr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 22 Jun 2020 22:51:47 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE936C061573
        for <linux-i2c@vger.kernel.org>; Mon, 22 Jun 2020 19:51:47 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id jz3so849727pjb.0
        for <linux-i2c@vger.kernel.org>; Mon, 22 Jun 2020 19:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Bkqe8eP6qav0NO7h7H0YnVgLuAUP47V9yLKohTYScP4=;
        b=SacbG/sMALx094GrI3w7UgttPeQ0KM2G3AoODCvFQJGFJ5vln9En6Frb+o9dKibvSg
         Okny/UMLQJ0rhbLGQCyBu5QdK9UVQ6bkIbPfzInNDmXXD1VDvL4Fk5eQnAF6Sj3p2w2Y
         2+FdERPjM6wES4ug+qUdx3gg4X7vQHpHE8DiQ0xiITzjC2e4JMKiuenvvQityR3Vg9D9
         PxSZHeUFisHW6YGR24OuLF+Fkp6WcuDGEoDhwAhouEVR26WTM7LJ9rRq9VWGfpMusq71
         kp0t2+FGL7LqQPW3OOCbVJWMZ6bbxHBot6lBBdjtBD79Tw29zxpM1olGSTmWEhdi2TsC
         cQsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Bkqe8eP6qav0NO7h7H0YnVgLuAUP47V9yLKohTYScP4=;
        b=peyhluWrShgJ5tp/Y33Flo6/gRTUVOYuUFErwcNOEsRyknA4Q/TA+hC1aM2m8OcyuA
         vDM0/vobQy5RWUYcPW3ZcO48xBXVRAEA6frIp7C15kakt6qisCKeN7Z2segEFaT/1YWf
         AjE778aYiP8T+pkR1gfk50G6RA0LOc001ixEY7yGu79b3MzCE2fS805XbVrAxGfykCYU
         0IkAX3/+G9b/08WIsRBstq4Cb/hQ6G6T7T5ofE2H2gTTmvLFiHO+RkWxEAFhiLgvTv9T
         UR4F7dJVYephJ7H9kfRTuWAjR3CKKQFyg3oALI5cWrQWC6IOv/7IL4ivgKaK+rVdaZEY
         Ym5Q==
X-Gm-Message-State: AOAM533W9y2Pleh7Jo8ewRwpuWOhtUwsQc3txmu94Hm4itRYkvAwd6ht
        p3S9FBiDEuNmdGwv2EXvYDhs/A==
X-Google-Smtp-Source: ABdhPJwQKgj2PeBSrZqxgChMqadOaXI5DuaCAkwJY1oO+kXbbPkv3BV7iGHMfNyJ7tZr2wPjeTAnMQ==
X-Received: by 2002:a17:902:ba83:: with SMTP id k3mr22973488pls.261.1592880707148;
        Mon, 22 Jun 2020 19:51:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id y7sm15807629pfq.43.2020.06.22.19.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 19:51:46 -0700 (PDT)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: designware: Fix functionality in !CONFIG_ACPI case
Date:   Tue, 23 Jun 2020 02:51:44 +0000
Message-Id: <20200623025144.34246-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On the HiKey board, where CONFIG_ACPI is not set, we started
to see a graphics regression where the adv7511 HDMI bridge driver
wasn't probing. This was due to the i2c bus failing to start up.

I bisected the problem down to commit f9288fcc5c615 ("i2c:
designware: Move ACPI parts into common module") and after
looking at it a bit, I realized that change moved some
initialization into i2c_dw_acpi_adjust_bus_speed(). However,
i2c_dw_acpi_adjust_bus_speed() is only functional if CONFIG_ACPI
is set.

This patch pulls i2c_dw_acpi_adjust_bus_speed() out of the
ifdef CONFIG_ACPI conditional, and gets the board working again.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org
Fixes: f9288fcc5c615 ("i2c: designware: Move ACPI parts into common module")
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/i2c/busses/i2c-designware-common.c | 4 ++--
 drivers/i2c/busses/i2c-designware-core.h   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e3a8640db7da..33de185e15f2 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -286,6 +286,8 @@ int i2c_dw_acpi_configure(struct device *device)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_acpi_configure);
 
+#endif	/* CONFIG_ACPI */
+
 void i2c_dw_acpi_adjust_bus_speed(struct device *device)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(device);
@@ -317,8 +319,6 @@ void i2c_dw_acpi_adjust_bus_speed(struct device *device)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_acpi_adjust_bus_speed);
 
-#endif	/* CONFIG_ACPI */
-
 u32 i2c_dw_scl_hcnt(u32 ic_clk, u32 tSYMBOL, u32 tf, int cond, int offset)
 {
 	/*
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 556673a1f61b..ea2485872cab 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -364,8 +364,7 @@ int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
 
 #if IS_ENABLED(CONFIG_ACPI)
 int i2c_dw_acpi_configure(struct device *device);
-void i2c_dw_acpi_adjust_bus_speed(struct device *device);
 #else
 static inline int i2c_dw_acpi_configure(struct device *device) { return -ENODEV; }
-static inline void i2c_dw_acpi_adjust_bus_speed(struct device *device) {}
 #endif
+void i2c_dw_acpi_adjust_bus_speed(struct device *device);
-- 
2.17.1

