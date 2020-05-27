Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D68FA1E45B4
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 16:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389145AbgE0OWA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 10:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389103AbgE0OWA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 27 May 2020 10:22:00 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACB3C08C5C2;
        Wed, 27 May 2020 07:22:00 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id u5so11832905pgn.5;
        Wed, 27 May 2020 07:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJWWlFowHHNM256k17yETc+XHlbxbBX4AAuZRvOBnEA=;
        b=H/mH86Zc+uqXPHsur/+idcfytxqQuoLsEYM/GP0wDJaNuH0KuMM/hmfRnLtE6eWILQ
         IdNBX/+t/EN+cKNLe9p2ngYcFcNzJQf45k6sQRYlE+HVUUe2vqS+j9VvjTFTaMGaNLXD
         DbmN49q6cujvyx5MAACH6Oost4PvqRfkPMCw8oxggWFKxFcxwTq6gpJTEfDdGZwryDS7
         N1gESVq7py8B9b1nZT+ggOaVJKAZypEyYGduUmc3ecR5BmZWtRTbGelW7dGcliKq6zQF
         pS74cKtx2WqJKqjR7aZhqsDCn9ntBx56I9VgPAdu9W0kTadoSYLLnn4mF8NTowC2u4DY
         hIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CJWWlFowHHNM256k17yETc+XHlbxbBX4AAuZRvOBnEA=;
        b=CamilqAwvVpR/6dV7badrIIMeWpufzxUFzOYWF8BKhCtlIwGzmYKq+8HoVNvkYvLxt
         JgEu4sVi+ppIQzEcUWkx4Tmo85jT7Bllslicmeoi5qZ7dCFyJxq9S+SSoZkaPgKyRAxv
         9zgytfR7ClxQNGrTpx057wKlhlVJNDhIms5eejUbrQrF6lbSIovphwknltYsbBJc4KPw
         Scy42KILuz4ut6TIEWchTLOKgSb55ZiyNFWNkcrYGUpJSoOZCUVdRp9rNm1LEN/e6n1/
         26kPXqx1Xba9ixxvF3tSaE9JAfVMnj3prmpwkdiyfa7H/eEMh2LYsYlXrzdpPF9XPISM
         l+AQ==
X-Gm-Message-State: AOAM5315exFFy2eZKR/h1Q99WyDA7HnsIE6iUlQNYUCGngXXDQ4tsY/9
        jf1q/PJJLcRgiejmQyA2+Wk=
X-Google-Smtp-Source: ABdhPJz+x5u0WY6FQMlMKbfoixKcK/iAmz/7r51nMPJKL9jhfw9HM0ZDj76SUy33XYN0RBLzXKNOhg==
X-Received: by 2002:a62:b40b:: with SMTP id h11mr4042841pfn.183.1590589319773;
        Wed, 27 May 2020 07:21:59 -0700 (PDT)
Received: from localhost ([144.34.194.82])
        by smtp.gmail.com with ESMTPSA id c2sm3045711pjg.51.2020.05.27.07.21.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 May 2020 07:21:59 -0700 (PDT)
From:   Dejin Zheng <zhengdejin5@gmail.com>
To:     corbet@lwn.net, gregkh@linuxfoundation.org, f.fainelli@gmail.com,
        michal.simek@xilinx.com, wsa+renesas@sang-engineering.com,
        paul@crapouillou.net, shawnguo@kernel.org,
        linus.walleij@linaro.org, linux-doc@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Dejin Zheng <zhengdejin5@gmail.com>
Subject: [PATCH v3 0/2] drivers: provide devm_platform_request_irq()
Date:   Wed, 27 May 2020 22:21:44 +0800
Message-Id: <20200527142146.8940-1-zhengdejin5@gmail.com>
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

v2 -> v3:
	- add devm_platform_request_irq() to devres.rst by Grygorii's
	  suggestion.
	- And also Thanks Michal, Wolfram and Linus's review and
	  comments.
v1 -> v2:
	- I give up this series of patches in v1 version. I resend this
	  patches v2 by that discussion:
	  https://patchwork.ozlabs.org/project/linux-i2c/patch/20200520144821.8069-1-zhengdejin5@gmail.com/
	  The patch content has not changed.

Dejin Zheng (2):
  drivers: provide devm_platform_request_irq()
  i2c: busses: convert to devm_platform_request_irq()

 .../driver-api/driver-model/devres.rst        |  1 +
 drivers/base/platform.c                       | 33 +++++++++++++++++++
 drivers/i2c/busses/i2c-bcm-kona.c             | 16 ++-------
 drivers/i2c/busses/i2c-cadence.c              | 10 ++----
 drivers/i2c/busses/i2c-digicolor.c            | 10 ++----
 drivers/i2c/busses/i2c-emev2.c                |  5 ++-
 drivers/i2c/busses/i2c-jz4780.c               |  5 ++-
 drivers/i2c/busses/i2c-meson.c                | 13 +++-----
 drivers/i2c/busses/i2c-mxs.c                  |  9 ++---
 drivers/i2c/busses/i2c-pnx.c                  |  9 ++---
 drivers/i2c/busses/i2c-rcar.c                 |  9 ++---
 drivers/i2c/busses/i2c-rk3x.c                 | 14 ++------
 drivers/i2c/busses/i2c-sirf.c                 | 10 ++----
 drivers/i2c/busses/i2c-stu300.c               |  4 +--
 drivers/i2c/busses/i2c-synquacer.c            | 12 ++-----
 include/linux/platform_device.h               |  4 +++
 16 files changed, 73 insertions(+), 91 deletions(-)

-- 
2.25.0

