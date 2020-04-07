Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D26F51A1198
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Apr 2020 18:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgDGQhu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Apr 2020 12:37:50 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:38525 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbgDGQhu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Apr 2020 12:37:50 -0400
Received: by mail-pj1-f68.google.com with SMTP id m15so983244pje.3;
        Tue, 07 Apr 2020 09:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbH71qtcBk1Vve5EXFDLfeZ7cSNd/ye1qiA5nHnyjAc=;
        b=mp79cbeXgxV3q8aN5MGI8dhfjS5nB0BWninAftSv8Jh3HSqrKAQFG9holcSdwDv/HF
         ZZ4yfR2cVhy/0umcaekR42f7Xt5aJdKiFZDe/5Ivvw7gzbJFMpzoIO22rhwQJqEsr9Ht
         yFZo44PluiAc3pNUGmQZ/bFsANUwnUzEyw0GYTbpi6nAQh7YO+oH60da2VCv9FFRHXUf
         3akfndibQjSVS8a8hyAc5NDcufqGDuj7d865EeJrD7zRbW4QSeQha2N2IN+KANdNxipu
         cbU4+fTz40BzbJ7PGQkZkgh19MVs+ro9ipqkYibJY4cUNujAW6SDSf7Q9X1hRoVycMAD
         jCOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QbH71qtcBk1Vve5EXFDLfeZ7cSNd/ye1qiA5nHnyjAc=;
        b=W4ATc4wMRTn+0jlWl7CNxxI39aNwi0RlFZsMt7/uZ3Pil/ojIPHX6Qo7OI0ESMJHS2
         ZrqLYoAC2/ctHi+wT6adra3yKIgpLbc6HPSXJWbzHjgVQ0lEC7/lN0qY7k1XGo7ppNAB
         SbyxpyqHesWLsqxGZALnLqM3J9JBVBs6WdaKDJAZ8ucxPIhJ8YgiIcjf3yrvSPprC7i6
         ZzoClt1pqpDOxSt4AkcRkepfN4oeccZV+AGWMidywXnhINT1Ileo5yGkOGY4tuOGlHUn
         dwgzBCjho5rU8lTmaipwrvphQqdnfEHC0y4nUtD0kDDlItpqDVU0fEFVss8EekGqLbeB
         tk7g==
X-Gm-Message-State: AGi0PuaJLnbwoYqvkHkIdHsLIIjMpDhiiM2NF+cu6ISTKe3va4NoaEba
        hKHM0K/RJvvvIZjsFPu/lqE=
X-Google-Smtp-Source: APiQypKXtsTVKeFbvx2qQa08GdzmigAGsMQvdu7jLTm1EJsa3gfn6IoVUOqjP9afR6yz7KKm3rheuw==
X-Received: by 2002:a17:90a:c20b:: with SMTP id e11mr235303pjt.60.1586277466813;
        Tue, 07 Apr 2020 09:37:46 -0700 (PDT)
Received: from localhost (89.208.244.140.16clouds.com. [89.208.244.140])
        by smtp.gmail.com with ESMTPSA id l18sm13616044pgc.26.2020.04.07.09.37.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Apr 2020 09:37:46 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     thor.thayer@linux.intel.com, krzysztof.adamski@nokia.com,
        rjui@broadcom.com, sbranden@broadcom.com,
        bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
        nsekhar@ti.com, bgolaszewski@baylibre.com,
        jarkko.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
        mika.westerberg@linux.intel.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, kgene@kernel.org,
        krzk@kernel.org, paul@crapouillou.net, vz@mleia.com,
        khilman@baylibre.com, matthias.bgg@gmail.com,
        gregory.clement@bootlin.com, rrichter@marvell.com,
        afaerber@suse.de, manivannan.sadhasivam@linaro.org,
        agross@kernel.org, bjorn.andersson@linaro.org, heiko@sntech.de,
        baohua@kernel.org, linus.walleij@linaro.org, mripard@kernel.org,
        wens@csie.org, ardb@kernel.org, michal.simek@xilinx.com,
        gcherian@marvell.com, jun.nie@linaro.org, shawnguo@kernel.org,
        rayagonda.kokatanur@broadcom.com, lori.hikichi@broadcom.com,
        nishkadg.linux@gmail.com, kstewart@linuxfoundation.org,
        allison@lohutok.net, gregkh@linuxfoundation.org,
        tglx@linutronix.de, bigeasy@linutronix.de, info@metux.net,
        hslester96@gmail.com, narmstrong@baylibre.com,
        martin.blumenstingl@googlemail.com, qii.wang@mediatek.com,
        drinkcat@chromium.org, hsinyi@chromium.org, fparent@baylibre.com,
        opensource@jilayne.com, swinslow@gmail.com,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1 00/28] convert to devm_platform_ioremap_resource
Date:   Wed,  8 Apr 2020 00:37:13 +0800
Message-Id: <20200407163741.17615-1-zhengdejin5@gmail.com>
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

Dejin Zheng (28):
  i2c: img-scb: convert to devm_platform_ioremap_resource
  i2c: mv64xxx: convert to devm_platform_ioremap_resource
  i2c: owl: convert to devm_platform_ioremap_resource
  i2c: exynos5: convert to devm_platform_ioremap_resource
  i2c: mt65xx: convert to devm_platform_ioremap_resource
  i2c: designware: convert to devm_platform_ioremap_resource
  i2c: zx2967: convert to devm_platform_ioremap_resource
  i2c: xlp9xx: convert to devm_platform_ioremap_resource
  i2c: xiic: convert to devm_platform_ioremap_resource
  i2c: synquacer: convert to devm_platform_ioremap_resource
  i2c: rk3x: convert to devm_platform_ioremap_resource
  i2c: qup: convert to devm_platform_ioremap_resource
  i2c: meson: convert to devm_platform_ioremap_resource
  i2c: hix5hd2: convert to devm_platform_ioremap_resource
  i2c: emev2: convert to devm_platform_ioremap_resource
  i2c: jz4780: convert to devm_platform_ioremap_resource
  i2c: altera: convert to devm_platform_ioremap_resource
  i2c: axxia: convert to devm_platform_ioremap_resource
  i2c: bcm-iproc: convert to devm_platform_ioremap_resource
  i2c: davinci: convert to devm_platform_ioremap_resource
  i2c: digicolor: convert to devm_platform_ioremap_resource
  i2c: lpc2k: convert to devm_platform_ioremap_resource
  i2c: sirf: convert to devm_platform_ioremap_resource
  i2c: stu300: convert to devm_platform_ioremap_resource
  i2c: sun6i-p2wi: convert to devm_platform_ioremap_resource
  i2c: xlr: convert to devm_platform_ioremap_resource
  i2c: bcm-kona: convert to devm_platform_ioremap_resource
  i2c: octeon-platdrv: convert to devm_platform_ioremap_resource

 drivers/i2c/busses/i2c-altera.c             | 4 +---
 drivers/i2c/busses/i2c-axxia.c              | 4 +---
 drivers/i2c/busses/i2c-bcm-iproc.c          | 8 ++------
 drivers/i2c/busses/i2c-bcm-kona.c           | 4 +---
 drivers/i2c/busses/i2c-davinci.c            | 4 +---
 drivers/i2c/busses/i2c-designware-platdrv.c | 8 ++------
 drivers/i2c/busses/i2c-digicolor.c          | 4 +---
 drivers/i2c/busses/i2c-emev2.c              | 4 +---
 drivers/i2c/busses/i2c-exynos5.c            | 4 +---
 drivers/i2c/busses/i2c-hix5hd2.c            | 4 +---
 drivers/i2c/busses/i2c-img-scb.c            | 4 +---
 drivers/i2c/busses/i2c-jz4780.c             | 4 +---
 drivers/i2c/busses/i2c-lpc2k.c              | 4 +---
 drivers/i2c/busses/i2c-meson.c              | 4 +---
 drivers/i2c/busses/i2c-mt65xx.c             | 7 ++-----
 drivers/i2c/busses/i2c-mv64xxx.c            | 4 +---
 drivers/i2c/busses/i2c-octeon-platdrv.c     | 4 +---
 drivers/i2c/busses/i2c-owl.c                | 4 +---
 drivers/i2c/busses/i2c-qup.c                | 4 +---
 drivers/i2c/busses/i2c-rk3x.c               | 4 +---
 drivers/i2c/busses/i2c-sirf.c               | 4 +---
 drivers/i2c/busses/i2c-stu300.c             | 4 +---
 drivers/i2c/busses/i2c-sun6i-p2wi.c         | 4 +---
 drivers/i2c/busses/i2c-synquacer.c          | 4 +---
 drivers/i2c/busses/i2c-xiic.c               | 4 +---
 drivers/i2c/busses/i2c-xlp9xx.c             | 4 +---
 drivers/i2c/busses/i2c-xlr.c                | 4 +---
 drivers/i2c/busses/i2c-zx2967.c             | 4 +---
 28 files changed, 31 insertions(+), 92 deletions(-)

-- 
2.25.0

