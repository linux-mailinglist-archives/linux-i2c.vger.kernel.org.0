Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F5839C3E4
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Jun 2021 01:29:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbhFDXaq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 19:30:46 -0400
Received: from mail-pj1-f45.google.com ([209.85.216.45]:54863 "EHLO
        mail-pj1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbhFDXaq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Jun 2021 19:30:46 -0400
Received: by mail-pj1-f45.google.com with SMTP id g24so6356948pji.4
        for <linux-i2c@vger.kernel.org>; Fri, 04 Jun 2021 16:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Yso64/11K/NVoM1kuoUluh2W7Yq6bZwBUsc8+1WoqA=;
        b=Ia3/eX/3L13jjBWzDZuwOM3NO8zMtT+5VxJV8tyWEyA8n0xYAsylEpt5kKg+nCFdSl
         b0G4bvWjyxNwTzu6+T0YMcc22fyNxhd8Cj3oIi5+AplIabkpWDw+CTrC/99SnGp6nqxs
         b9bdwn1ANly7ZiJ2W8206qbgn3rwQ4YKY1Iog=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6Yso64/11K/NVoM1kuoUluh2W7Yq6bZwBUsc8+1WoqA=;
        b=qSbi263RHrt+a8M2PTMWlANNWXYwN+jwqgoDI2SHnSaMgBTuyhP4GQynopKN0BOnNl
         OIW4UnhPqkB1mIFU23m21rqY0C4Njg2oC2TBJdC6yJRv5AMUdmAISEubhkcQg58oYvBr
         dm+GvA9HJq58I9eRoDlqHj0yr0LJJ5lcAW9u6QicPG6AAORK12TaViJ0aEFdoqSLmG7p
         gYvtdC/MaXEPdeHefjJXVJlENbwXmH1RLk9LgZzYdCmxPsBGLWpHrbXGhW5BbH/nk33i
         Wloy/o23vZGw/97hSIgq17MUp/CC2NKI+8017oAwuvBsjvJtRVsOfyfos3LAMYOuQTR/
         8jlg==
X-Gm-Message-State: AOAM533QyVXFliuqChAbAtKTKp4ABuP5E0JNGb+MSQomLe+5g0L3BijQ
        7BdRUoQSKnWPu2xSdiUNlllWcw==
X-Google-Smtp-Source: ABdhPJw8D+6MHYgsOiDgLITaObaSsvLTQ7xCT0gLqec7W77m9834sj0d2tmYuttbPEuUKEWT5OoSjg==
X-Received: by 2002:a17:902:8b8a:b029:108:7849:dae0 with SMTP id ay10-20020a1709028b8ab02901087849dae0mr6614283plb.36.1622849266212;
        Fri, 04 Jun 2021 16:27:46 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:fb56:4f6a:ea47:556b])
        by smtp.gmail.com with ESMTPSA id t24sm5411155pji.56.2021.06.04.16.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 16:27:45 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] i2c: core: Disable client irq on reboot/shutdown
Date:   Fri,  4 Jun 2021 16:27:44 -0700
Message-Id: <20210604232744.1259150-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

If an i2c client receives an interrupt during reboot or shutdown it may
be too late to service it by making an i2c transaction on the bus
because the i2c controller has already been shutdown. This can lead to
system hangs if the i2c controller tries to make a transfer that is
doomed to fail because the access to the i2c pins is already shut down,
or an iommu translation has been torn down so i2c controller register
access doesn't work.

Let's simply disable the irq if there isn't a shutdown callback for an
i2c client when there is an irq associated with the device. This will
make sure that irqs don't come in later than the time that we can handle
it. We don't do this if the i2c client device already has a shutdown
callback because presumably they're doing the right thing and quieting
the device so irqs don't come in after the shutdown callback returns.

Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
[swboyd@chromium.org: Dropped newline, added commit text, added
interrupt.h for robot build error]
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

Dmitry, please add Signed-off-by so this can be merged through i2c

This supersedes https://lore.kernel.org/r/20210510220012.2003285-1-swboyd@chromium.org

Changes from v1 (https://lore.kernel.org/r/20210604212752.3547301-1-swboyd@chromium.org)
 * Add interrupt.h include for robot

 drivers/i2c/i2c-core-base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 5a97e4a02fa2..e314ccaf114a 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -24,6 +24,7 @@
 #include <linux/i2c-smbus.h>
 #include <linux/idr.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/irqflags.h>
 #include <linux/jump_label.h>
 #include <linux/kernel.h>
@@ -627,6 +628,8 @@ static void i2c_device_shutdown(struct device *dev)
 	driver = to_i2c_driver(dev->driver);
 	if (driver->shutdown)
 		driver->shutdown(client);
+	else if (client->irq > 0)
+		disable_irq(client->irq);
 }
 
 static void i2c_client_dev_release(struct device *dev)

base-commit: 8124c8a6b35386f73523d27eacb71b5364a68c4c
-- 
https://chromeos.dev

