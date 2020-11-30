Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676882C8593
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Nov 2020 14:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727254AbgK3NeJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Nov 2020 08:34:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbgK3NdT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 30 Nov 2020 08:33:19 -0500
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E523C061A4A;
        Mon, 30 Nov 2020 05:32:09 -0800 (PST)
Received: by mail-wr1-x442.google.com with SMTP id p8so16244124wrx.5;
        Mon, 30 Nov 2020 05:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lLPC5gReMpBQQOjOEOK+BC7l1m2aD+CFv1l1upZuyWU=;
        b=ChBEr66AN5CJJiiJQBZ6+iTU5ba9fDPZ4wh6Y2LJroWiyvvs8jWWsSfm0nVsNTFrmm
         iIQSQSR6mkP3DSzhsZPm1Trv4qs4G2OokUvsbt28cJozO1//Fg274H2TFE5azshO7AF9
         MPuBmPPrPCyacfwX/hsbmd4RU+OaWnroJgJGw0gEOBGY2ojipKSGhoi4fAlyyv6FXlCv
         JhNI+HHHoE5fiBND0/neF5o+s5b5/JL2G/oz5DlVFyxRpwTDZV6sdgREBOazot2Tcrjw
         4oRRtTheATA05iC4gSyDYzEu/PGLZnT5YX7leawx/crhZQDDzywkqwyxdxiFcNUvG2up
         aItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lLPC5gReMpBQQOjOEOK+BC7l1m2aD+CFv1l1upZuyWU=;
        b=pxk2LtzwHt1rfUHyi4TZjzpXzHA1r45ZZ8TrmClBq5MRrfpwtVeLCnJKoxUzVg2lKF
         mutHv/9ZRwbfPqAIlrA6OZJPf7eU4Xej/+D7KDD0nDhCv1Yc2nJUucpM8YbcyCL14Y9+
         kSwzpyEBC9YEYc63zCn/8k23Ql2Qi/fLZ6AychxFStAUVyTLFq/0KXVpqBUY4EIy7WEm
         5eSdNroW5v7ndf3YvJ+N1bnKNJv0Dg75R+9scf9l5pdq16YoU/7dktPnl0YgJDub2Y2/
         20pPLtvyK7BBNd/1O9J9Gg7+zkbArt948eNcsFsdwF43+D64Fi2iFbptnK1wmQph6jHs
         F9/w==
X-Gm-Message-State: AOAM531r/F1dIhZwkOO1H8sgfyiGVQfMxvrOaGkzeX/AzXrOOxNKZxAW
        hffdz41yWm+rxgWXgHqF5PTmARIP6Ai6dYEt
X-Google-Smtp-Source: ABdhPJwdHT47DB4kBktF0O94g86AmqcC/kfAYNDEByp+i5WkpdWbz4M15u6JP6DBwO3wwJQKJfZhQw==
X-Received: by 2002:a5d:4585:: with SMTP id p5mr28223911wrq.65.1606743127500;
        Mon, 30 Nov 2020 05:32:07 -0800 (PST)
Received: from valhalla.home ([2.31.224.80])
        by smtp.gmail.com with ESMTPSA id g192sm7452333wme.48.2020.11.30.05.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Nov 2020 05:32:06 -0800 (PST)
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org
Cc:     rjw@rjwysocki.net, lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
        linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        wsa@kernel.org, yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 10/18] ipu3-cio2: Rename ipu3-cio2.c to allow module to be built from multiple source files retaining ipu3-cio2 name
Date:   Mon, 30 Nov 2020 13:31:21 +0000
Message-Id: <20201130133129.1024662-11-djrscally@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201130133129.1024662-1-djrscally@gmail.com>
References: <20201130133129.1024662-1-djrscally@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

ipu3-cio2 driver needs extending with multiple files; rename the main
source file and specify the renamed file in Makefile to accommodate that.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Daniel Scally <djrscally@gmail.com>
---
Changes since RFC v3:

	- None

 drivers/media/pci/intel/ipu3/Makefile                          | 2 ++
 drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} | 0
 2 files changed, 2 insertions(+)
 rename drivers/media/pci/intel/ipu3/{ipu3-cio2.c => ipu3-cio2-main.c} (100%)

diff --git a/drivers/media/pci/intel/ipu3/Makefile b/drivers/media/pci/intel/ipu3/Makefile
index 98ddd5beafe0..429d516452e4 100644
--- a/drivers/media/pci/intel/ipu3/Makefile
+++ b/drivers/media/pci/intel/ipu3/Makefile
@@ -1,2 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_VIDEO_IPU3_CIO2) += ipu3-cio2.o
+
+ipu3-cio2-y += ipu3-cio2-main.o
diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
similarity index 100%
rename from drivers/media/pci/intel/ipu3/ipu3-cio2.c
rename to drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
-- 
2.25.1

