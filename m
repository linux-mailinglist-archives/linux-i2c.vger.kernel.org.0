Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61EE51D7D6E
	for <lists+linux-i2c@lfdr.de>; Mon, 18 May 2020 17:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728418AbgERPxP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 May 2020 11:53:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728301AbgERPxN (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 May 2020 11:53:13 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBBEFC061A0C;
        Mon, 18 May 2020 08:53:12 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id u35so5020032pgk.6;
        Mon, 18 May 2020 08:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KJY8NnDlJmnEJnvN0I1ofVJTW1IHAAedWbNgmMlbT50=;
        b=kyOCdvzYM0sExz3KLzDKD53zGh11TDLN8y38TzCtRMnfOjQdaNxIlRXlCDtcEuxe9h
         jSXjnMcuy5IFYAHAt/zfXoE1nOSRmzeo06p0A/8drDuk1+rorv3N8ZR5oXittr4BHGwN
         4IyPkMB5T/je0rNmjBoMJK5cR1EP6hTqF7qmAoGfExhYQD1ffBRtSdac1m2x2RBbJ06o
         8vtCBi0s9mDCZmFDeHzhrhUC2Ny/5lLcB6iJhhUOarODgyz8Tj9SekQZ26aQzyG9dA5v
         XruYIWSsDLuzEQwvZ1SHNP/jhf4JfV0c+FWUwbjpMOaRTBaGJoWowjrgW8degUOkxEfk
         j3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KJY8NnDlJmnEJnvN0I1ofVJTW1IHAAedWbNgmMlbT50=;
        b=bOplxPk+ldHdLO9DpMU599HmwgQEmr8X41xI0kPJQpH6XRJSPZ88pien232VmpL4iv
         RXQW6gjhVVnPUWUj3lrrvoforLxHZw/IuXhe8guA/udaynx9gQnphObCQzNSqKgI9nfV
         rTVKHxr3EM+Qi1V4ayr5NHuO3PWQi1r+kFMVEyK+F7aHMHYsOgdQb3w0AsMAKSfKuI+w
         HhbTLO7PZ0Q8PnJIrUuHYlLigmY2ol9pTJ+V07nkseGY+FpBE0k1nsD78ghWaOWklJJR
         Mu7XTLToML/+0W3U20Idc3AowGcJozTQBBmzrFMXRM/bYIbs0o40j/vPGYaNhbpNu8ni
         VEqA==
X-Gm-Message-State: AOAM5330Gt4+DI4i9mofIlfWZQ55cRHS92oifj5SSzeEMPVlZRboua8h
        vc4ROcCWAhulYWrHuqMjAwY=
X-Google-Smtp-Source: ABdhPJw8rcdsHH87QBEhPxH9GrgGkJQCOcyPiniXkCkGwJQogX8EIpYkX46R0Tyh/hF3hCfK1vKk6g==
X-Received: by 2002:a63:ed50:: with SMTP id m16mr16359077pgk.271.1589817192513;
        Mon, 18 May 2020 08:53:12 -0700 (PDT)
Received: from localhost ([176.122.159.242])
        by smtp.gmail.com with ESMTPSA id x23sm7927369pgf.32.2020.05.18.08.53.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 08:53:11 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     gregkh@linuxfoundation.org, rafael@kernel.org,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        michal.simek@xilinx.com, baruch@tkos.co.il,
        wsa+renesas@sang-engineering.com, paul@crapouillou.net,
        khilman@baylibre.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, vz@mleia.com,
        slemieux.tyco@gmail.com, heiko@sntech.de, baohua@kernel.org,
        linus.walleij@linaro.org, ardb@kernel.org,
        radu_nicolae.pirea@upb.ro, zhouyanjie@wanyeetech.com,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v1 0/2] drivers: provide devm_platform_request_irq()
Date:   Mon, 18 May 2020 23:53:02 +0800
Message-Id: <20200518155304.28639-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It will call devm_request_irq() after platform_get_irq() function
in many drivers, sometimes, it is not right of the error handling
for these two functions in some drivers. so provide this function
to simplify the driver.

the first patch will provide devm_platform_request_irq(), and the
other patch will convert to devm_platform_request_irq() in some
i2c bus dirver.

Dejin Zheng (2):
  drivers: provide devm_platform_request_irq()
  i2c: busses: convert to devm_platform_request_irq()

 drivers/base/platform.c            | 33 ++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-bcm-kona.c  | 16 +++------------
 drivers/i2c/busses/i2c-cadence.c   | 10 +++------
 drivers/i2c/busses/i2c-digicolor.c | 10 +++------
 drivers/i2c/busses/i2c-emev2.c     |  5 ++---
 drivers/i2c/busses/i2c-jz4780.c    |  5 ++---
 drivers/i2c/busses/i2c-meson.c     | 13 ++++--------
 drivers/i2c/busses/i2c-mxs.c       |  9 +++-----
 drivers/i2c/busses/i2c-pnx.c       |  9 ++------
 drivers/i2c/busses/i2c-rcar.c      |  9 +++-----
 drivers/i2c/busses/i2c-rk3x.c      | 14 +++----------
 drivers/i2c/busses/i2c-sirf.c      | 10 ++-------
 drivers/i2c/busses/i2c-stu300.c    |  4 ++--
 drivers/i2c/busses/i2c-synquacer.c | 12 +++--------
 include/linux/platform_device.h    |  4 ++++
 15 files changed, 72 insertions(+), 91 deletions(-)

-- 
2.25.0

