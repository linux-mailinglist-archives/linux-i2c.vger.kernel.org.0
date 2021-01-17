Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0ADFE2F9213
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Jan 2021 12:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728520AbhAQLox (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Jan 2021 06:44:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:36912 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726209AbhAQLn6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Jan 2021 06:43:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAE4820791;
        Sun, 17 Jan 2021 11:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610883798;
        bh=pXwoBrsnCseb0AgC6oGdyk0Fn0uWj3vQ6AeXdYK/sVI=;
        h=From:To:Cc:Subject:Date:From;
        b=ipLXtIgulv0Jj64GJIAXOG9cYcv6vxE6d8SLFkzMzFcIoxOFXaWQHMk0yk7ys4qAj
         g95inYDJgQkA5OjHekjfIAQZ/qq2Za5fW4GxhAlbzXebr4Ykz0QQkxxK4Poev3KuQ1
         vEVQOMUgw1VcdEfW16USHzHT69mS1TU0Z4UZqeByY1ryfoQJRQXi26BRwxJaSqcm9v
         VslLziSzXGYLHIZRM0DmJPwZRbGKyLTayYQX1cKvKB8gEo0xwGKiXJQe4pa2//iZ2i
         Tz2Ox+6IwojrqZkhMSS4a/MBdVWm+TOCqwh+Q54lngzX80UY67sRdry3ptbXNVfYJe
         LQhhEBUngPXcA==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] i2c: sprd:: depend on COMMON_CLK to fix compile tests
Date:   Sun, 17 Jan 2021 12:43:13 +0100
Message-Id: <20210117114313.141428-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C_SPRD uses Common Clock Framework thus it cannot be built on
platforms without it (e.g. compile test on MIPS with LANTIQ):

    /usr/bin/mips-linux-gnu-ld: drivers/i2c/busses/i2c-sprd.o: in function `sprd_i2c_probe':
    i2c-sprd.c:(.text.sprd_i2c_probe+0x254): undefined reference to `clk_set_parent'

Fixes: 4a2d5f663dab ("i2c: Enable compile testing for more drivers")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index d4d60ad0eda0..ab1f39ac39f4 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1013,6 +1013,7 @@ config I2C_SIRF
 config I2C_SPRD
 	tristate "Spreadtrum I2C interface"
 	depends on I2C=y && (ARCH_SPRD || COMPILE_TEST)
+	depends on COMMON_CLK
 	help
 	  If you say yes to this option, support will be included for the
 	  Spreadtrum I2C interface.
-- 
2.25.1

