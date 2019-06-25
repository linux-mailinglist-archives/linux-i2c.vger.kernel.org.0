Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BBDE7526AC
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2019 10:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730246AbfFYIa4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jun 2019 04:30:56 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:38281 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbfFYIa4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jun 2019 04:30:56 -0400
Received: by mail-pg1-f196.google.com with SMTP id z75so5979885pgz.5;
        Tue, 25 Jun 2019 01:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:subject:date:message-id;
        bh=YqI+uB01O08qXYcfpRy+0O71chB2PgUQKTLZZkJEu5o=;
        b=VtQA0z3JZ77kvRWa+hBp5VvOlqyBOh4xUDxfpdIFJlUu/C54kDNC/14zdvK0WRp6Rl
         pkpvJmICr3UefhdE/eZ+riqBj5XUYwpdw8kqSlqcb/dBs1kD2TPWNjpqs8tnQqg9NYG3
         bBsMj5YCeD7vWbLSuSvpj7EI/MT5P/WgEdDZupn5EpCnKtbiOMuFRtXAAwmEtTxaqlnc
         AbIOah6P3e8g7dtRTR+hkdnyHlrjcBgMCAUPSQ0U0tayBXyufJWzTGZZ2WtIWApHhbvL
         erBwqItYxI+tg6tLZl8VGhhGr1s7go0yYQjOw4+C4p+1jRAz+afk28wDD3SAeVx5u6/I
         0rUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:subject:date:message-id;
        bh=YqI+uB01O08qXYcfpRy+0O71chB2PgUQKTLZZkJEu5o=;
        b=UnRFI3jJOLZvlK6tZkOGl4Z8c6YtVaGnLhK70kuLdKEHib/u8hHO/8KThDOEqe9iwu
         nCWMCVHhCc+1ANKjdVfxPlpSSQh5lAO3nDeCXseOg9YqlaPp6bcuTKs3Tb69iNOx/y63
         H1hpN5eAJbmUpSEQw1iEeG+px7RNv9bC+OJXDGTMBMEwo97yccHF0tonIrBf2vokVEni
         HGVQGoQgsJu+8/hvDRi1rEfljSxgwtCOaT7M6QAtXBGS79jiDuM52X8d3BuA/xYTjAmP
         xUiI6hZJNLTV7NGCzYBTU0TuDGGMZty/66cbnbpHO/S5/AJDj9ayrjkiznQA25Hrs2Bu
         1D9g==
X-Gm-Message-State: APjAAAUDrC0nZlrcFqbIu5CUtuQhY8hIqeDBesH7Ac54w1L5TMST8/7F
        I3ge75GiYF72WHXj5Gcw1BdqMPqK
X-Google-Smtp-Source: APXvYqx9aCCUlXyowJ/yjwEbnLcNSxx8p6Si+QM+nu42Hd3yUFM0Y+IOzm59T1aFkkPmWfGbHD2TOA==
X-Received: by 2002:a65:4841:: with SMTP id i1mr38287995pgs.37.1561451454950;
        Tue, 25 Jun 2019 01:30:54 -0700 (PDT)
Received: from localhost (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
        by smtp.gmail.com with ESMTPSA id v10sm13115787pfe.163.2019.06.25.01.30.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2019 01:30:54 -0700 (PDT)
From:   AceLan Kao <acelan.kao@canonical.com>
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: designware: Add disable runtime pm quirk
Date:   Tue, 25 Jun 2019 16:30:51 +0800
Message-Id: <20190625083051.30332-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Dell machines come with goodix touchpad IC suffer from the double click
issue if the Designware I2C adapter enters runtime suspend.

It's because the goodix re-assert the interrupt if host doesn't read the
data within 100ms and designware takes a longer time to wake up from
runtime suspend. In the case, it got a second interrupt during
resuming, so it thinks it's a double click.

There is no simple way to fix this, it's a firmware issue and goodix
agrees to fix this in their firmware on next release, but this issue
still affects the machines that don't come with an updated firmware. So,
add a quirk to mark those machines and avoid the designware from
entering runtime suspend.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=202683

Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 30 ++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index d464799e40a3..4048a66355f6 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -9,6 +9,7 @@
  * Copyright (C) 2009 Provigent Ltd.
  */
 #include <linux/delay.h>
+#include <linux/dmi.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/export.h>
@@ -22,6 +23,25 @@
 
 #include "i2c-designware-core.h"
 
+static int no_runtime_pm;
+static const struct dmi_system_id i2c_dw_no_runtime_pm[] = {
+	{
+		.ident = "Dell Inspiron 5390",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5390"),
+		},
+	},
+	{
+		.ident = "Dell Vostro 5390",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Vostro 5390"),
+		},
+	},
+	{ }
+};
+
 static void i2c_dw_configure_fifo_master(struct dw_i2c_dev *dev)
 {
 	/* Configure Tx/Rx FIFO threshold levels */
@@ -424,7 +444,8 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
 
-	pm_runtime_get_sync(dev->dev);
+	if (!no_runtime_pm)
+		pm_runtime_get_sync(dev->dev);
 
 	if (dev_WARN_ONCE(dev->dev, dev->suspended, "Transfer while suspended\n")) {
 		ret = -ESHUTDOWN;
@@ -501,7 +522,8 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 done_nolock:
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	if (!no_runtime_pm)
+		pm_runtime_put_autosuspend(dev->dev);
 
 	return ret;
 }
@@ -733,6 +755,10 @@ int i2c_dw_probe(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
+	no_runtime_pm = dmi_check_system(i2c_dw_no_runtime_pm);
+	if (no_runtime_pm)
+		__pm_runtime_disable(dev->dev, true);
+
 	/*
 	 * Increment PM usage count during adapter registration in order to
 	 * avoid possible spurious runtime suspend when adapter device is
-- 
2.17.1

