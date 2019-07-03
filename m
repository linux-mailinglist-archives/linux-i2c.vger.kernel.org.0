Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BE8C5E374
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2019 14:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbfGCMIC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jul 2019 08:08:02 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43349 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbfGCMIB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Jul 2019 08:08:01 -0400
Received: by mail-wr1-f66.google.com with SMTP id p13so2492349wru.10
        for <linux-i2c@vger.kernel.org>; Wed, 03 Jul 2019 05:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GKkOWmRraH4v7kSVVGyYuNFM0+EnVaT3BXEuvGhf47g=;
        b=n+USIR8jbZeYefKyeZGOuyvRuZVX0jUMuTmuLGqtJMJXznBP193rJqLxJ71+E2w3Bj
         vtmZj4BXEdlfyJ7900ij46ffrWmuRiMk3INJaT8Ix6GF4zhyGYNU8h0UxxHBhAi6pZcH
         FPsgL+2PYODVaAQl3DkHhVVs8Rgqv0QYRvZCCiykK3jYuaSdBNjVJYsL+hY60l05Hd+p
         rv0xgImJyTVgqmMfXChm8Xm3XjPj9Z/EwP9XTIV2rcyZ/Ippqs4VA/1qUmxrSSBEJTRs
         qd4y9XQHBJmPBMsZ4XvVDL3SxUQoU2ml6YLOJr2/k9xM/PPhi1GfpNq3B3AVmGYSzye4
         sQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GKkOWmRraH4v7kSVVGyYuNFM0+EnVaT3BXEuvGhf47g=;
        b=Jqk29L8WaVRs/RSemBa/KvOrNb/XkVqgXISP1eWTaogZGUTOtiedEG70zQ/b++XGWz
         hkWPsAt5ReaMXBqUU1lzdiO35dRLNv8Oe2o5TLncbDjAefGIRqSNnP34jfkBZO+CQFNj
         FF2QPzt1HzKHM2KNlk2WOLLF/19HKqk/K2JuqDzdcSjbepwu14SI87p1ko8P9UPVctIJ
         sdsq4BXG0KKsSNZ5mDBsGvHXKngrWzRjvCW4Uci9xrjMhW6jJ42elS/xzPLLfyEh0wkM
         Ic+73I97pS1ly8rMvoYPps5YZFEZsKdO/7a32otskiuP3z3pdNAUd3vIi2HDRsnySQ0D
         xtDw==
X-Gm-Message-State: APjAAAW46HbS26vXPcj9mPPrGnKIV2yWr21doVM43PBZc3QDnitx4rop
        zghCIkzr70Px7l8GgQ909TRSRxdc4Kw=
X-Google-Smtp-Source: APXvYqwQOm2cUroADcn98UbXqJdaZ0SXZkZIFTuI0/mZUUBLd1tiVw9Dg7V7FXQImGiniXzaXmf+5Q==
X-Received: by 2002:a5d:4d81:: with SMTP id b1mr31109801wru.27.1562155679910;
        Wed, 03 Jul 2019 05:07:59 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id w10sm1385182wru.76.2019.07.03.05.07.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 05:07:59 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-i2c@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] eeprom: at24: remove unneeded include
Date:   Wed,  3 Jul 2019 14:07:54 +0200
Message-Id: <20190703120754.2602-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We used to have a call to ilog2() in AT24_DEVICE_MAGIC(). That's long
gone so this header is no longer needed.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/misc/eeprom/at24.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/misc/eeprom/at24.c b/drivers/misc/eeprom/at24.c
index 63aa541c9608..3a61b89024db 100644
--- a/drivers/misc/eeprom/at24.c
+++ b/drivers/misc/eeprom/at24.c
@@ -14,7 +14,6 @@
 #include <linux/delay.h>
 #include <linux/mutex.h>
 #include <linux/mod_devicetable.h>
-#include <linux/log2.h>
 #include <linux/bitops.h>
 #include <linux/jiffies.h>
 #include <linux/property.h>
-- 
2.21.0

