Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7BA4417601
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Sep 2021 15:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245027AbhIXNiV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Sep 2021 09:38:21 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38018
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346702AbhIXNh7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Sep 2021 09:37:59 -0400
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4B1E94027C
        for <linux-i2c@vger.kernel.org>; Fri, 24 Sep 2021 13:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490585;
        bh=S6Kt/t1TSGyeiJtJgoFpkmvIPh9xU6Dr0xsilHYx1x4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=YVu1wkd3juuiuIsSYlHezkrgIfTumH6d03suWRQzi/Ldjf8fNK6Ys9pQO8QW8cmMi
         P8tI4YKBIP6m9zZ3UaCg1OFzzV0vJqzN5v7LTIeVs6j6HpwcF5ZRKLs3DlnhrBuvUy
         BRm0z3vjHV3mS/8lIdklSgzfArHwSri1eYW5z2nr2kFkRQ+cDFOZtYhS3oS7A7GR9L
         kPJjk60gP1P7cp+wr44lwhqxW2PUUQwq21M4if6Pt4UlfifuW9GpbluP1o9TzEqjMT
         0kxM/ehz4TYcC7p08L2pJqJnpjoFArPC11DZuvcpOBtspd1f1JVjVAZcuKJyzZ6PzX
         lFNZB/D2bCeTA==
Received: by mail-wr1-f69.google.com with SMTP id r9-20020a5d4989000000b0015d0fbb8823so8064219wrq.18
        for <linux-i2c@vger.kernel.org>; Fri, 24 Sep 2021 06:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S6Kt/t1TSGyeiJtJgoFpkmvIPh9xU6Dr0xsilHYx1x4=;
        b=HA4CsBeE6HVc8hlWzmbJ5u5/lDqgmWfTDDKqev6wqiuBWkxCTYs67V0PSoiFmUj97R
         eH73CH+sSWRcHaQ4en+z0uk1J1nXJlhx8hYH2wrv9dJHswCv7bKLEoU6lzpIKyZFugZS
         AhG4XmsnU5Js3sz8nSwJz8ZO3esX4Ga4dSRVFIVmh6LPzjxsaPsjB3qfWJL+ZrxRr4AC
         UKxJ1zBzgrtoaQxdNOSocf6g3UexIPhAODiy4LT+MPCnpldjJgRVo6yrlwW0ByfEJt78
         o9gJ50N81BYIePiQWykcyFAnav9E2Zald7ObRqVrPr9pyqWq2r2BEu9WXNI+aVEtE7+h
         qHzw==
X-Gm-Message-State: AOAM532yFVfIy48F1F6Cj+xtfVyK3/xY+x1O2c6RfcQUNhgdWt4NUd8/
        uxukSSDaVrtG9F4UvUaVodL0NDHtYHo2th0nYzUt4rZAHytt0OBFM8SGWYrKSLQAVK3C0Cp0xA0
        3vOPa+QybVIw9jbJyaYxpXwB6+bgttK9KItvsYg==
X-Received: by 2002:a05:600c:214a:: with SMTP id v10mr2117097wml.167.1632490584120;
        Fri, 24 Sep 2021 06:36:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI1yh/i/veV4CX3x/B+5KadPo5GhYE/87Z36LyePhdH5qhrHtk2EOcRVEL6+fCnuWBNcRmpA==
X-Received: by 2002:a05:600c:214a:: with SMTP id v10mr2117071wml.167.1632490583780;
        Fri, 24 Sep 2021 06:36:23 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id d70sm8377400wmd.3.2021.09.24.06.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:36:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: exynos: describe drivers in KConfig
Date:   Fri, 24 Sep 2021 15:35:49 +0200
Message-Id: <20210924133550.112488-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Describe better which driver applies to which SoC, to make configuring
kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/i2c/busses/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index e17790fe35a7..1df19ccc310b 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -615,7 +615,10 @@ config I2C_EXYNOS5
 	depends on ARCH_EXYNOS || COMPILE_TEST
 	default y if ARCH_EXYNOS
 	help
-	  High-speed I2C controller on Exynos5 and newer Samsung SoCs.
+	  High-speed I2C controller on Samsung Exynos5 and newer Samsung SoCs:
+	  Exynos5250, Exynos5260, Exynos5410, Exynos542x, Exynos5800,
+	  Exynos5433 and Exynos7.
+	  Choose Y here only if you build for such Samsung SoC.
 
 config I2C_GPIO
 	tristate "GPIO-based bitbanging I2C"
-- 
2.30.2

