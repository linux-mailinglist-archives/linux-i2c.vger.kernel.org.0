Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29A809F11E
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Aug 2019 19:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfH0RFO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 27 Aug 2019 13:05:14 -0400
Received: from mout.gmx.net ([212.227.15.18]:55029 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730038AbfH0RFO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 27 Aug 2019 13:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1566925496;
        bh=Uo1b3HfhaDmYWZdy1HlA+2i2PHDkmmpjfklpjPXzKxw=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=jjZbzo+XYlVxeu0N/XlLeLTxHHg108xm2GU+uCwoe0MtEhlzCF3U8fRe7b09Wb7fz
         F1Ol9pWw4rD4TpFRbTuoYwQ1C7tB1Es1tg1/5cPN3UrFNIso5VrCM62mcUsWEtUYDK
         /tBoTkBn0c/5PoSIX7Oqtc7mEvkF8lXEiyOALMag=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MV5hN-1hhPfx0Gwn-00YUII; Tue, 27 Aug 2019 19:04:56 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Wolfram Sang <wsa@the-dreams.de>, Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH 2/3] i2c: bcm2835: Avoid clk stretch quirk for BCM2711
Date:   Tue, 27 Aug 2019 19:04:15 +0200
Message-Id: <1566925456-5928-3-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566925456-5928-1-git-send-email-wahrenst@gmx.net>
References: <1566925456-5928-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:Khj7mXUW5z0WC/ZBBqLcGNldA+ElzWSWMIlsnsdZzREPTsd8HDD
 J+gPVzpIk9piKLiieHnfv5qxCFOVhQ3hfNctz70sxa4cm6/sV7NaZCNL1Ceqrify33wKkgn
 Gh96Vz3/dCD+L1MF6KCEMkIA/3GpcRij0fKqaoWTeO1ThunIEOgqMH5WffrL0J3diX3cCUv
 8t2guKrtd7dEQorwAd8IA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:5pSzR/iKChg=:DVqxCdjc3UJXq8/A9WN25l
 f8lFLCErb4Rfa5ou0tV+AzzQ0Yh3Ze8ZPO0vgpX6FqmM8JNlspYjsiU6bEy/Cd19hWc9xG+6S
 sb4aysewj4iDvDrwfaNW2YOjzqHEV4IJkOigsAcwozkb8natDSbrGLxWUUkUiJ72tNULdHOVi
 LXVj+sW3kBzGJMIDYCO2zoKKlg4Wa3s5NAYXgwGjILCQx2sWCCROdfJesUyfSnISr0RnzJGXa
 ndFpwKZdotZPqVQEKUawsJJ+1xzPwIUgKrqv0GFQvgmVYcYOCjErv4HMCa52oByn8LBOrq5FU
 s2OHMEHLHCagVcoCvx54hdsK/0LMzECgP1CJSqMmHvrp1Kj8NAuzO7iHXSA2f35rLeDc4p6Oc
 4Xl4Ilkr2bT8LUnS0sMuTwr+t/qG6VUckZPSBr7eMVAt2CgxMUFKOyeUQCJZJBPjIXyD0s4wt
 h70hNHruPX/ItfT7kg0fu+JWMtFlYIlvtSLTlnsCgXoC3jeJ4UIUBWy8ygpWGbTZXwX5N1IlT
 N42kmySAZQEg1jAgItAnpArNSZ/CVVcCXWu7fXeqj56n8bDqKTOYcGn7P8zpQQ/yH3KY+JFNN
 jrDKs6+aJCK9b9oAk2jGvy659Gluq3qWkXvtYI2JlDs9IoaDph6JCtYpBvfyVJwyDrr3xzUaS
 IuAjtCWzLX8PHHgF/CXgjG8zLbo+0YrzC1tdi1Y5K7pIguueOXoUBM930jC5b8eMdbUGP6ByW
 8/IbMqwcuPpz1cb8DKOB+xh+wiIVaRQiHPEnubYAEqbvsrpBbu2BXkRouCDw8GoIdxV0sd3KI
 kfdI6w1EY8NgVpCtjw5hVlmOg3TV8PYlH5slBQXCGkvHfZrFL34fGpfR9np2bW2AziqOghyhu
 wpqpTnnkjlxgH87ShTCDtGZwmwkvEHKcFXC6JOkEiQtJ2hieXDzK9W712qVNdGNEk3WSN/oWb
 KxiXqIIBXYl/i740hGBfGRd2sTlSxHO0VOp7xwMRKuLy8OUkejFym2bJhW9kqvIsDS+rCjNII
 5g8ZL1qM7VhtE6OVEjvz7HolgHnuWDgrQC0m1Rsg1XCLVi5gP9KXiFF18t1STlC+dyGZdhA3X
 SUHrQggJpnNhDB2kKO4gcDmqocffp456FprdqWaXRYmLddn3qFSWuL1pFMNofQHP5RYl8CTDq
 IaeLK+0SDv/rM1ZHMh5Z8KR7v0xdKteNfKkkXC5GZQ9yr7VQ==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C block on the BCM2711 isn't affected by the clk stretching bug.
So there is no need to apply the corresponding quirk.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Eric Anholt <eric@anholt.net>
=2D--
 drivers/i2c/busses/i2c-bcm2835.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm=
2835.c
index 67752f7..ab5502f 100644
=2D-- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>

@@ -389,7 +390,7 @@ static const struct i2c_algorithm bcm2835_i2c_algo =3D=
 {
 };

 /*
- * This HW was reported to have problems with clock stretching:
+ * The BCM2835 was reported to have problems with clock stretching:
  * http://www.advamation.com/knowhow/raspberrypi/rpi-i2c-bug.html
  * https://www.raspberrypi.org/forums/viewtopic.php?p=3D146272
  */
@@ -475,7 +476,7 @@ static int bcm2835_i2c_probe(struct platform_device *p=
dev)
 	adap->algo =3D &bcm2835_i2c_algo;
 	adap->dev.parent =3D &pdev->dev;
 	adap->dev.of_node =3D pdev->dev.of_node;
-	adap->quirks =3D &bcm2835_i2c_quirks;
+	adap->quirks =3D of_device_get_match_data(&pdev->dev);

 	bcm2835_i2c_writel(i2c_dev, BCM2835_I2C_C, 0);

@@ -501,7 +502,8 @@ static int bcm2835_i2c_remove(struct platform_device *=
pdev)
 }

 static const struct of_device_id bcm2835_i2c_of_match[] =3D {
-	{ .compatible =3D "brcm,bcm2835-i2c" },
+	{ .compatible =3D "brcm,bcm2711-i2c" },
+	{ .compatible =3D "brcm,bcm2835-i2c", .data =3D &bcm2835_i2c_quirks },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_i2c_of_match);
=2D-
2.7.4

