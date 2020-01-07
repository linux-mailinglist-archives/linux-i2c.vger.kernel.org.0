Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86979133548
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 22:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727300AbgAGVyV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 16:54:21 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:49803 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgAGVyV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 16:54:21 -0500
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N2m3G-1jpOIO1L2a-013AA7; Tue, 07 Jan 2020 22:54:08 +0100
From:   Arnd Bergmann <arnd@arndb.de>
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, Wolfram Sang <wsa@the-dreams.de>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Max Staudt <max@enpas.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>, Stefan Roese <sr@denx.de>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: s3c24xx: allow compile-testing
Date:   Tue,  7 Jan 2020 22:53:53 +0100
Message-Id: <20200107215406.1632417-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NpK3sX5pFkd/JLqlZIwVdbCMtqdosujy4GpurPiyLlULllqXjnV
 ItYXEsoIMXdYpt2SXLN62KNjVttSo0Sp2632rLaGASGBsO0/D5xsgDJ+mZEZ5H1RR6mQagy
 3cd47T585pyGNY+pdheaMnMoj8OkgwWfEAxYyoOhUcKOKY6zV7+cTB77OPP8Ca8K4xUFRGE
 DQsoP9ScC80dUXnxX7ZbA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:i37LVIsjxXE=:i37t2FrmOrMxqElfl79e1M
 CPJXnt/ieI3aVmtn2+2kIFx0Nvc+0txJZOcIh+UtbPkxY8B+CMnoKROggFZ6hCoEvlg0PYWXj
 WOkx/eazdHJ8QiGjuJXlh6RiEjg7pKREuJ4zSmWOWytcTZVwDuY9tAHuejlPu+UWevEyFV898
 zVMKkNLfPhpr+RbaREHg+NVnnqvHlaQKBkwwgWs51Xmkl/ih4zrdPEQWb6U2pIFrVYKLLEcDK
 q3V6ppnTIJf7buBYG0RF4fHEfhUL0hKTShSvJXDevGv3MySc0sDEv8E48BIJPCebve0zeNFT3
 GAHkWgGZOnXWZb1Qwu0lA1kHs+SE1yLBZ4Ezz6WFGia5uaEcfN4PlGrdahjZ/XiTYkmm7akzJ
 7BRPimS9pbF6/01ZU6f7rC/VqIP8s6+4Kz6xVbaiZnUaMCDpyvEYN1HVL+ST/pgz6HrNU4WMT
 LKtG4pVQwb6mcAgKruUlKBCdq4lgjzm+3f58Z/kXbLDD4j0KhOD7/oB/PO3QYZ2KdSxWVy8xv
 SgitZqFAqPYPCO8qPDHGfGuAqmRVHdQiQyhsR/o3xtgKnR+GOAkSDSjvUBU+p2h4ccKPq4xHZ
 DWKDrJZGzDAzrsrFaEuHUIo8AIP8FSWrIwJPwQMci9KRtuvrJEXyRNBWacH0ASJSN6roee9dv
 3VUJPlubBFIIzF15MaYc9HWDwDLOr0jo2vL4pnViFTI97zxj//bSJyc6mzbInsLArZZGHDBuF
 PidlWEbu4tTGBztLbu0us5/BZvwTz8ufT9Ur+Xh6fxzKQwj1OA1wgGMCBxIqJr8qdrtaZ67VP
 Whv1+HapD0jrowNbrE+GaIxifz1zvf/I0wSPBIQZrAiBNpVc11HT+wgAYSQ+iNWctbmq7ysLV
 Ie2gtqVeAL4sZyBDkK8g==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The PHY_EXYNOS5250_SATA driver can now be selected on
any platform for compile testing, but this results in a Kconfig
warning:

WARNING: unmet direct dependencies detected for I2C_S3C2410
  Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && HAVE_S3C2410_I2C [=n]
  Selected by [y]:
  - PHY_EXYNOS5250_SATA [=y] && (SOC_EXYNOS5250 || COMPILE_TEST [=y]) && HAS_IOMEM [=y] && OF [=y]

Allow the I2C driver to be compile-tested as well.

Fixes: 1544133d48c3 ("phy: Enable compile testing for some of drivers")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 6a0aa76859f3..ac453c16483d 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -933,7 +933,7 @@ config HAVE_S3C2410_I2C
 
 config I2C_S3C2410
 	tristate "S3C2410 I2C Driver"
-	depends on HAVE_S3C2410_I2C
+	depends on HAVE_S3C2410_I2C || COMPILE_TEST
 	help
 	  Say Y here to include support for I2C controller in the
 	  Samsung SoCs.
-- 
2.20.0

