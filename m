Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB76132116
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 09:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727574AbgAGINR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 03:13:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:56230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbgAGINQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Jan 2020 03:13:16 -0500
Received: from PC-kkoz.proceq.com (unknown [213.160.61.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C846F20848;
        Tue,  7 Jan 2020 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578384796;
        bh=HtmZmG2lwa9ETbqP7zabD9e9KA9KVJ75XZnfBiQ9TDU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XHxHobOfx/9twR7bleEOjRm97hwq4ru4O4+Etzt+Jg0qsVGhB4rmufvTl4dkYzBar
         J00ZTuZqRsxRQO1Juwv12oK3HBuJg+dZdyXy5QbIeSMtvW85VJ/jYCg42VzOmxPRrQ
         9R6dfUXjgPW8KDYSDqoSBxLMLcdBezufk90PUDYY=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Wolfram Sang <wsa@the-dreams.de>, Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Greg KH <greg@kroah.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 2/2] i2c: exynos: Update Kconfig documentation
Date:   Tue,  7 Jan 2020 09:12:59 +0100
Message-Id: <1578384779-15487-2-git-send-email-krzk@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578384779-15487-1-git-send-email-krzk@kernel.org>
References: <1578384779-15487-1-git-send-email-krzk@kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Update the help text to reflect current support devices:
1. The Exynos high speed I2C driver supports Exynos5 (ARMv7), Exynos5433
   and Exynos7 (both ARMv8) SoCs,
2. The S3C I2C driver supports S3C, S5Pv210 and Exynos{3,4,5} SoCs.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. New patch
---
 drivers/i2c/busses/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 132e6f374cd7..43984d5a7fad 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -612,12 +612,12 @@ config I2C_EMEV2
 	  I2C interface on the Renesas Electronics EM/EV family of processors.
 
 config I2C_EXYNOS5
-	tristate "Exynos5 high-speed I2C driver"
+	tristate "Exynos high-speed I2C driver"
 	depends on OF
 	depends on ARCH_EXYNOS || COMPILE_TEST
 	default y if ARCH_EXYNOS
 	help
-	  High-speed I2C controller on Exynos5 based Samsung SoCs.
+	  High-speed I2C controller on Exynos5 and newer Samsung SoCs.
 
 config I2C_GPIO
 	tristate "GPIO-based bitbanging I2C"
@@ -936,11 +936,11 @@ config HAVE_S3C2410_I2C
 	  respective Kconfig file.
 
 config I2C_S3C2410
-	tristate "S3C2410 I2C Driver"
+	tristate "S3C/Exynos I2C Driver"
 	depends on HAVE_S3C2410_I2C || COMPILE_TEST
 	help
 	  Say Y here to include support for I2C controller in the
-	  Samsung SoCs.
+	  Samsung SoCs (S3C, S5Pv210, Exynos).
 
 config I2C_SH7760
 	tristate "Renesas SH7760 I2C Controller"
-- 
2.7.4

