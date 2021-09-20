Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCEED41100E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Sep 2021 09:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234724AbhITHaV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 20 Sep 2021 03:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbhITHaV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Sep 2021 03:30:21 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8484BC061574
        for <linux-i2c@vger.kernel.org>; Mon, 20 Sep 2021 00:28:54 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id e26so12338641wmk.2
        for <linux-i2c@vger.kernel.org>; Mon, 20 Sep 2021 00:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lm1u5VFcAv+kZGi61xSeEM3XrIuze+ikLV/huDZ5nPk=;
        b=cPRknCu1fWRa2KdqOEcSz2KVX3wuY8GyVZMMdR4rNScmpwlpgbp+zPHzSzP9rP6veF
         9Mq/l5+SRKbYkVemannXZHenU5bgiphO1kKAB7QqGX310tG8U+q2BmwFNfeeoJCI80W/
         4bvuebBK42sn/7HSigDPcV4KDwVAxLRehfOu9E6MUZXRM9E5902vRv4+0rIohVMjVaut
         Ino4pbv9CpzAKQa2DDudBExur3BOl/g/2ZC5zT0/HqeY1ObDWvu0JGtSIUksY7BX7DWQ
         mA4B0sgbv1261vGxm5fG4q4EYyRzTXlAKvMCQklMC8f/ikb2ApZtyjlTwFGr7WYfnQxO
         MoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lm1u5VFcAv+kZGi61xSeEM3XrIuze+ikLV/huDZ5nPk=;
        b=8CiJa6uOM7geUrdzUAwsZxBePflPO17LjMNT5XBYjfwNYbQK1Mt2+1UqdP5y+aE65t
         RiYpIMGk2YPyzDFdr5WLF21zmA5SD8J6t2MY9ktUD5rjSd1jqiNPz8VY9rnPbmAKMPxY
         uFpoDhdfuk27YvWG/TQtksVwuLB0XC5rLOxyKBP3dE4lVc0yZbXzfxis2SZ5b7d55v46
         nHD06HPATlLTA++qQiPpAy3NUZJYRmzTJb2op6VoF1BqZ8RyLH1I+V2cm90hvnnzrT2z
         FyuANfgk+QmjVUkSh6zp3q+AZODFyuAGDMKbhyxjZJJwyHu7c+w08ITd6R7YATAm85JJ
         qIng==
X-Gm-Message-State: AOAM531ZVjfpWZ36s/8hKaKkMGbyhtpNZyu7AJ5Y1JrBHyCFTJC6XjNl
        6JNSf3kUb1pSQHb6H3J5o75ydg==
X-Google-Smtp-Source: ABdhPJxV/gLmGHCgSUKL7t/uOQUzPRMyr29oogObGYa6JpIIbuJljvBbV4S43xd0ANbicw3roYZJKw==
X-Received: by 2002:a05:600c:21d9:: with SMTP id x25mr26992888wmj.7.1632122933146;
        Mon, 20 Sep 2021 00:28:53 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j7sm18527225wrr.27.2021.09.20.00.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Sep 2021 00:28:52 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa@the-dreams.de>, Sekhar Nori <nsekhar@ti.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] MAINTAINERS: update my email address
Date:   Mon, 20 Sep 2021 09:28:42 +0200
Message-Id: <20210920072842.30889-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

My professional situation changes soon. Update my email address.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..6bebe6168922 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2962,7 +2962,7 @@ F:	crypto/async_tx/
 F:	include/linux/async_tx.h
 
 AT24 EEPROM DRIVER
-M:	Bartosz Golaszewski <bgolaszewski@baylibre.com>
+M:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
@@ -7986,7 +7986,7 @@ F:	include/linux/gpio/regmap.h
 
 GPIO SUBSYSTEM
 M:	Linus Walleij <linus.walleij@linaro.org>
-M:	Bartosz Golaszewski <bgolaszewski@baylibre.com>
+M:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
@@ -11367,7 +11367,7 @@ F:	Documentation/devicetree/bindings/iio/proximity/maxbotix,mb1232.yaml
 F:	drivers/iio/proximity/mb1232.c
 
 MAXIM MAX77650 PMIC MFD DRIVER
-M:	Bartosz Golaszewski <bgolaszewski@baylibre.com>
+M:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/*/*max77650.yaml
@@ -18689,7 +18689,7 @@ F:	include/linux/clk/ti.h
 
 TI DAVINCI MACHINE SUPPORT
 M:	Sekhar Nori <nsekhar@ti.com>
-R:	Bartosz Golaszewski <bgolaszewski@baylibre.com>
+R:	Bartosz Golaszewski <brgl@bgdev.pl>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/nsekhar/linux-davinci.git
-- 
2.30.1

