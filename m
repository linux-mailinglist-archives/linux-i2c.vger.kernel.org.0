Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6AC814E3E6
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Jan 2020 21:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727142AbgA3UXW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Jan 2020 15:23:22 -0500
Received: from sauhun.de ([88.99.104.3]:52226 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbgA3UXW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 30 Jan 2020 15:23:22 -0500
Received: from localhost (p54B33261.dip0.t-ipconnect.de [84.179.50.97])
        by pokefinder.org (Postfix) with ESMTPSA id AE8332C0697;
        Thu, 30 Jan 2020 21:23:20 +0100 (CET)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] i2c: dev: keep sorting of includes
Date:   Thu, 30 Jan 2020 21:23:12 +0100
Message-Id: <20200130202312.5107-1-wsa@the-dreams.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---

It makes sense, another patch wanted to duplicate an entry...

 drivers/i2c/i2c-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-dev.c b/drivers/i2c/i2c-dev.c
index 94beacc41302..da020acc9bbd 100644
--- a/drivers/i2c/i2c-dev.c
+++ b/drivers/i2c/i2c-dev.c
@@ -15,6 +15,7 @@
 /* The I2C_RDWR ioctl code is written by Kolja Waschk <waschk@telos.de> */
 
 #include <linux/cdev.h>
+#include <linux/compat.h>
 #include <linux/device.h>
 #include <linux/fs.h>
 #include <linux/i2c-dev.h>
@@ -27,7 +28,6 @@
 #include <linux/notifier.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
-#include <linux/compat.h>
 
 /*
  * An i2c_dev represents an i2c_adapter ... an I2C or SMBus master, not a
-- 
2.20.1

