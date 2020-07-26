Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9936222E126
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Jul 2020 18:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgGZQQN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Jul 2020 12:16:13 -0400
Received: from www.zeus03.de ([194.117.254.33]:39448 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726663AbgGZQQN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Jul 2020 12:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=E12sEuHu7kCo5Bfmu2Y+lR34Cxr
        1WGgEEwin0TwQ4i0=; b=M8Tabv6USPKqWg18/Ey7ZM+GaPp1sRGbG0F4CDNCqGc
        5eJXoAUHIWmIY/zzPelV2IKdtwwVc+PI7ImrFhYnxxotN+8fCKsgQubjnokCLFum
        wm4wQZt0mUkuarHm9e5SMV9mZpLvy4pxE//5eJBI/JUpqyTikTgAutCzXCR0ZTpM
        =
Received: (qmail 77977 invoked from network); 26 Jul 2020 18:16:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jul 2020 18:16:10 +0200
X-UD-Smtp-Session: l3s3148p1@vBE3hlqrcsUgAwDPXy27AOM4pzPBFrIA
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Ray Jui <ray.jui@broadcom.com>,
        Scott Branden <scott.branden@broadcom.com>,
        Dhananjay Phadke <dphadke@linux.microsoft.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: rcar: avoid race when unregistering slave
Date:   Sun, 26 Jul 2020 18:16:06 +0200
Message-Id: <20200726161606.15315-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Due to the lockless design of the driver, it is theoretically possible
to access a NULL pointer, if a slave interrupt was running while we were
unregistering the slave. To make this rock solid, disable the interrupt
for a short time while we are clearing the interrupt_enable register.
This patch is purely based on code inspection. The OOPS is super-hard to
trigger because clearing SAR (the address) makes interrupts even more
unlikely to happen as well. While here, reinit SCR to SDBS because this
bit should always be set according to documentation. There is no effect,
though, because the interface is disabled.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Some people on CC here which encountered the same issue with the
bcm-iproc driver. Does something like this work for you, too?

 drivers/i2c/busses/i2c-rcar.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 8dd35522d95a..0f73f0681a6e 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -871,12 +871,14 @@ static int rcar_unreg_slave(struct i2c_client *slave)
 
 	WARN_ON(!priv->slave);
 
-	/* disable irqs and ensure none is running before clearing ptr */
+	/* ensure no irq is running before clearing ptr */
+	disable_irq(priv->irq);
 	rcar_i2c_write(priv, ICSIER, 0);
-	rcar_i2c_write(priv, ICSCR, 0);
+	rcar_i2c_write(priv, ICSSR, 0);
+	enable_irq(priv->irq);
+	rcar_i2c_write(priv, ICSCR, SDBS);
 	rcar_i2c_write(priv, ICSAR, 0); /* Gen2: must be 0 if not using slave */
 
-	synchronize_irq(priv->irq);
 	priv->slave = NULL;
 
 	pm_runtime_put(rcar_i2c_priv_to_dev(priv));
-- 
2.20.1

