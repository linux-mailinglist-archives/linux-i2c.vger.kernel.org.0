Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7867A1A286B
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Apr 2020 20:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729890AbgDHSXS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Apr 2020 14:23:18 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36591 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729672AbgDHSXS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Apr 2020 14:23:18 -0400
Received: by mail-pf1-f195.google.com with SMTP id n10so2799206pff.3;
        Wed, 08 Apr 2020 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yXo+ettgksYs9O1p+Jf9F0piOCxyj5fRj6/t504rC0A=;
        b=HgXA5F5KvS9alyIuiEh1s0XlDejL9XQr4Od9fxGMwEXs6vOMCJvfXF+akeekR26ZjB
         jYEocfZDqTDsiuUAofVmefmaLs6xubaa6YplFMAkS+Ehoo+TVH4xOpET01Av6BzUUgM1
         ITftXXslvzUKs09A881sobeFs67Jqpcp7unN2wA6Z9WKnQYTq2brYx0TxGKvQXfVKNdo
         0a4e0xJhRORmtAi3Qe5fiSoilomSL2WPjG9u8AKuc0zV9ItuiZL5zJGXjIHliWwkPyba
         2A3kiGeBUvGl8ZvrjcK+EQ3/0ZnY38XcxKumpyKvAqqRrgO5wMqdnqk7XbuBx5TI2WfO
         Pslw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yXo+ettgksYs9O1p+Jf9F0piOCxyj5fRj6/t504rC0A=;
        b=Q1IAu9g8FFh67Aox1WHfjY7pGOjuiQ13CVQ2q4caNrbJo9at0CCYiJxaY55ZcrsKdi
         OW+kl4mw2zCfMy45iIasMZ8U1LLoiZn8jgLgAvtxnPBUFDCPplObHoZ0qNkqJqiWNzXn
         Fe2VQV5SlAwbGb0Lw06h0t9jMdVkzF3pQGFzGg5UjUMKo+0lwWpYeNPUxphiL3YV2Rnn
         fJLwTiyL0TSpeBpzuHHWe0ln4axPSQpoHHc9DuBFBNh1tqngig92JZBfXWuizseXwmTc
         KNbSIY+xLwKGaOJC+06a6ElSu6fTUkAkaMXGMfW0JgNWmSZl4I1wEI39zZc8r2du9ZQi
         CIxg==
X-Gm-Message-State: AGi0PuaME+yE2G3lsHxXvm6Vq6kB2EkSIl9SgotZEcbmebAc7svQPBJs
        XhAga6LZjL4UuzybguXBCpI=
X-Google-Smtp-Source: APiQypIHipVirOkjtSQpEZaco0Pm8g6zqozQ+oV6WMyAIOnsI08w3hBT/EyMu4L0pzIwwWmEonTM4w==
X-Received: by 2002:a05:6a00:42:: with SMTP id i2mr8980316pfk.108.1586370196715;
        Wed, 08 Apr 2020 11:23:16 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id mn18sm214852pjb.13.2020.04.08.11.23.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Apr 2020 11:23:15 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, nsekhar@ti.com,
        bgolaszewski@baylibre.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, gregory.clement@bootlin.com,
        rrichter@marvell.com, afaerber@suse.de,
        manivannan.sadhasivam@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, heiko@sntech.de, baohua@kernel.org,
        linus.walleij@linaro.org, mripard@kernel.org, wens@csie.org,
        ardb@kernel.org, gcherian@marvell.com, jun.nie@linaro.org,
        shawnguo@kernel.org, tglx@linutronix.de, zhouyanjie@wanyeetech.com,
        martin.blumenstingl@googlemail.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 00/24] convert to devm_platform_ioremap_resource
Date:   Thu,  9 Apr 2020 02:22:47 +0800
Message-Id: <20200408182311.26869-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

this patch sets use devm_platform_ioremap_resource() to simplify code,
which contains platform_get_resource() and devm_ioremap_resource(). so
use it to replace the platform_get_resource() and
devm_ioremap_resource().

v1 -> v2:
	- delete 4 patches of can not be sent by gmail server.

Dejin Zheng (24):
  i2c: img-scb: convert to devm_platform_ioremap_resource
  i2c: mv64xxx: convert to devm_platform_ioremap_resource
  i2c: owl: convert to devm_platform_ioremap_resource
  i2c: exynos5: convert to devm_platform_ioremap_resource
  i2c: zx2967: convert to devm_platform_ioremap_resource
  i2c: xlp9xx: convert to devm_platform_ioremap_resource
  i2c: synquacer: convert to devm_platform_ioremap_resource
  i2c: rk3x: convert to devm_platform_ioremap_resource
  i2c: qup: convert to devm_platform_ioremap_resource
  i2c: meson: convert to devm_platform_ioremap_resource
  i2c: hix5hd2: convert to devm_platform_ioremap_resource
  i2c: emev2: convert to devm_platform_ioremap_resource
  i2c: jz4780: convert to devm_platform_ioremap_resource
  i2c: altera: convert to devm_platform_ioremap_resource
  i2c: axxia: convert to devm_platform_ioremap_resource
  i2c: davinci: convert to devm_platform_ioremap_resource
  i2c: digicolor: convert to devm_platform_ioremap_resource
  i2c: lpc2k: convert to devm_platform_ioremap_resource
  i2c: sirf: convert to devm_platform_ioremap_resource
  i2c: stu300: convert to devm_platform_ioremap_resource
  i2c: sun6i-p2wi: convert to devm_platform_ioremap_resource
  i2c: xlr: convert to devm_platform_ioremap_resource
  i2c: bcm-kona: convert to devm_platform_ioremap_resource
  i2c: octeon-platdrv: convert to devm_platform_ioremap_resource

 drivers/i2c/busses/i2c-altera.c         | 4 +---
 drivers/i2c/busses/i2c-axxia.c          | 4 +---
 drivers/i2c/busses/i2c-bcm-kona.c       | 4 +---
 drivers/i2c/busses/i2c-davinci.c        | 4 +---
 drivers/i2c/busses/i2c-digicolor.c      | 4 +---
 drivers/i2c/busses/i2c-emev2.c          | 4 +---
 drivers/i2c/busses/i2c-exynos5.c        | 4 +---
 drivers/i2c/busses/i2c-hix5hd2.c        | 4 +---
 drivers/i2c/busses/i2c-img-scb.c        | 4 +---
 drivers/i2c/busses/i2c-jz4780.c         | 4 +---
 drivers/i2c/busses/i2c-lpc2k.c          | 4 +---
 drivers/i2c/busses/i2c-meson.c          | 4 +---
 drivers/i2c/busses/i2c-mv64xxx.c        | 4 +---
 drivers/i2c/busses/i2c-octeon-platdrv.c | 4 +---
 drivers/i2c/busses/i2c-owl.c            | 4 +---
 drivers/i2c/busses/i2c-qup.c            | 4 +---
 drivers/i2c/busses/i2c-rk3x.c           | 4 +---
 drivers/i2c/busses/i2c-sirf.c           | 4 +---
 drivers/i2c/busses/i2c-stu300.c         | 4 +---
 drivers/i2c/busses/i2c-sun6i-p2wi.c     | 4 +---
 drivers/i2c/busses/i2c-synquacer.c      | 4 +---
 drivers/i2c/busses/i2c-xlp9xx.c         | 4 +---
 drivers/i2c/busses/i2c-xlr.c            | 4 +---
 drivers/i2c/busses/i2c-zx2967.c         | 4 +---
 24 files changed, 24 insertions(+), 72 deletions(-)

-- 
2.25.0

