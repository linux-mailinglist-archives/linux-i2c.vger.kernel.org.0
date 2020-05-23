Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C98CA1DF7D4
	for <lists+linux-i2c@lfdr.de>; Sat, 23 May 2020 16:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387849AbgEWOwL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 May 2020 10:52:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387815AbgEWOwL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 May 2020 10:52:11 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23B9DC061A0E;
        Sat, 23 May 2020 07:52:06 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id x11so4598311plv.9;
        Sat, 23 May 2020 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tOdjC4O+e+YMtAYdD4ccanDEzEZV+sYHcio00hA4VM0=;
        b=RkyXTXacfmVzZYcyiMbivo36j8sZS9aULFyS9WltDnKPsMw1SsMvB8NYnpW6A0kLoo
         /QgLbe19RRqghc/bXyN6sUlSJCTzwyUtUqwY0WQ4k7pABc6vSdAQ0cCqQpdSlvSyVAWr
         EILDzeYjozrfE1SRANYQsWE2WAYoYDF4xMLf1BAwchpId5wmcxWCSmxG3nUkSlqnpOBb
         HfcO1LoS1b0QRFK81hFyoSsfeqUbVIsXeMfghxRkpciWNKCJSQUapHQ0inH1YRPNEM+v
         P+nM1RJCth6FL7l9o2zu18W3A+K1NwNl8JpT6aEvftz2dBem45n+x6IlKfy2Y6yNpR41
         OCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tOdjC4O+e+YMtAYdD4ccanDEzEZV+sYHcio00hA4VM0=;
        b=UYMgFWf0nCeICYssW9rO8fs9OBUNjpjPifZiCq2W9sgs/bnz18H5d17E1jb6ysQ/OT
         qNqaDmZUS+0VqbkGOqltD4FmxmMZG8hIp74ap9xwSS6khbtXedzU9MMd035jLXDS16yq
         c2VU86uPVgkJ9aPLsPeBHqg/U6h18rDfBXsomrSqmFoTjXUKZP48BXMoQAosv0uyLgIp
         RlkW1uvY8Zs+D/M4BlpJpSzaJUw0NKidaj+9qJZU5Zn82uOSjzzOHHhgKTiundkfimwP
         tWEUIkyHSR6NsgbCqbf6WC+KRoSnc4gUdHRkrCAMkdHsJkztb6EpWxcFQHyhVn/q+SDO
         lqPQ==
X-Gm-Message-State: AOAM5315KDGQcs1iHup6ejCAl8IjfZQ8mZlxrX7jKc0N8m8TkzOvLdMl
        D5pzBEPTUU0CFF1WDo6eBQU=
X-Google-Smtp-Source: ABdhPJx+4hTx5Du/ULdrOnievYSXhAgRaap0qdrLvSwKmKugInc+/KjXr5s/l8b4PQzVR1dPAUkM0w==
X-Received: by 2002:a17:902:442:: with SMTP id 60mr20278528ple.103.1590245525602;
        Sat, 23 May 2020 07:52:05 -0700 (PDT)
Received: from localhost ([176.122.159.134])
        by smtp.gmail.com with ESMTPSA id s15sm8228858pgv.5.2020.05.23.07.52.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 23 May 2020 07:52:04 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     gregkh@linuxfoundation.org, rafael@kernel.org,
        f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
        michal.simek@xilinx.com, baruch@tkos.co.il, paul@crapouillou.net,
        khilman@baylibre.com, shawnguo@kernel.org, festevam@gmail.com,
        vz@mleia.com, heiko@sntech.de, linus.walleij@linaro.org,
        baohua@kernel.org, ardb@kernel.org, linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v2 0/2] drivers: provide devm_platform_request_irq()
Date:   Sat, 23 May 2020 22:51:55 +0800
Message-Id: <20200523145157.16257-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It will call devm_request_irq() after platform_get_irq() function
in many drivers, sometimes, it is not right for the error handling
of these two functions in some drivers. so provide this function
to simplify the driver.

the first patch will provide devm_platform_request_irq(), and the
other patch will convert to devm_platform_request_irq() in some
i2c bus dirver.

v1 -> v2:
	- I give up this series of patches in v1 version. I resend this
	  patches v2 by that discussion:
	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/
	  The patch content has not changed.

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

