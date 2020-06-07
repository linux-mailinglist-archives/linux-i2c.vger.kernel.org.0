Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90011F0E0D
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Jun 2020 20:38:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgFGSip (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Jun 2020 14:38:45 -0400
Received: from enpas.org ([46.38.239.100]:36476 "EHLO mail.enpas.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726611AbgFGSip (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 7 Jun 2020 14:38:45 -0400
X-Greylist: delayed 566 seconds by postgrey-1.27 at vger.kernel.org; Sun, 07 Jun 2020 14:38:44 EDT
Received: from [127.0.0.1] (localhost [127.0.0.1])
        by mail.enpas.org (Postfix) with ESMTPSA id 3AC10FF961;
        Sun,  7 Jun 2020 18:29:15 +0000 (UTC)
From:   Max Staudt <max@enpas.org>
To:     linux-i2c@vger.kernel.org, wsa+renesas@sang-engineering.com
Cc:     linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org,
        glaubitz@physik.fu-berlin.de, Max Staudt <max@enpas.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] i2c: icy: Fix build with CONFIG_AMIGA_PCMCIA=n
Date:   Sun,  7 Jun 2020 20:28:12 +0200
Message-Id: <20200607182812.9438-1-max@enpas.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This has been found by the Kernel Test Robot:
http://lkml.iu.edu/hypermail/linux/kernel/2006.0/06862.html

With CONFIG_AMIGA_PCMCIA=n, io_mm.h does not pull in amigahw.h and
ZTWO_VADDR is undefined. Add forgotten include to i2c-icy.c

Fixes: 4768e90ecaec ("i2c: Add i2c-icy for I2C on m68k/Amiga")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Max Staudt <max@enpas.org>
---
 drivers/i2c/busses/i2c-icy.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-icy.c b/drivers/i2c/busses/i2c-icy.c
index 271470f4d..66c9923fc 100644
--- a/drivers/i2c/busses/i2c-icy.c
+++ b/drivers/i2c/busses/i2c-icy.c
@@ -43,6 +43,7 @@
 #include <linux/i2c.h>
 #include <linux/i2c-algo-pcf.h>
 
+#include <asm/amigahw.h>
 #include <asm/amigaints.h>
 #include <linux/zorro.h>
 
-- 
2.20.1

