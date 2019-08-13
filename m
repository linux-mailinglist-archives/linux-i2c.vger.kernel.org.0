Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 797A08BE3C
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2019 18:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbfHMQVT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Aug 2019 12:21:19 -0400
Received: from mout.gmx.net ([212.227.15.18]:35873 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728237AbfHMQVS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Aug 2019 12:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1565713260;
        bh=Y5aGEI9G/hsaduQVg6mAPiwmIIHBg3hjSpNANdv++sg=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=AEEPLeS20UcPjgOac3mgYrID9haAhFjV3cGIkOXHOX4NxWyTb9VWiNzHLU3/i7I5e
         G/RLON8Yi2iZ0x+jyWryAWYYWdOahJ0ryvlypMiySkmYaPSbQazF6Q2FarCZgI9Kgq
         ckXIrfsGQw+lILB247R7iUqI0RQVSgVKt/e65VIo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.106]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N3bWr-1iNS51247n-010aN5; Tue, 13 Aug 2019 18:21:00 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 08/13] i2c: bcm2835: Avoid clk stretch quirk for BCM2711
Date:   Tue, 13 Aug 2019 18:20:43 +0200
Message-Id: <1565713248-4906-9-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:Pnlk69KrwCk9LvgrYJTYiJBIKI8o4JVBFM4dQ0wgTfUJNXIHwvE
 sNswh1Zm0es1wlgCP4X/1hGtxTHDFRiyNKKKsNzjCe79bHc1596yEHIsObjFFgI63RWhgMi
 Ob+Xn89m0mUMcFifQTaP+brmvGmYUeHcThDn0CHmuJ7Tu+er+BM+WFDBMcNcGuggrkTPKa4
 jDtfu+lyZqFfNAfJcCI4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MElBaoq2NOo=:NgQcO7MtpiaVPB+cYEBP4v
 +zQaSwTPLexJsZbZCFqVKXX4MFzR4yg1nqveO7UEo59M7zRIY4/Qn2Y4IEDrmNPRY9eTV5scB
 HtOvTa7bOkwai9Mt8g103rGzoRPv2GE1ZdDLSY9Q6ba7qRWFVHt2R5EzMlG+Q47YHCq0HN81Z
 oWL/VOgvAlM9Yqww4eT1TUxduRt8IKhJLc7uqxA3m7MMm6HqTKePBOHM6NoOnnXYLSqZi45Jd
 MyNTnH0NiIEf+LrOUK91Ec2Pqt7KzR534tbIXYOhZ84TTrruRNJuNDVDKp61JkCf1MH4Bi/tD
 8iqMyPVByOns1KBOauE5gKD8z/qSb/Y99+7JGcoFT2DiPks7vnE5ZofPyoPUUudLmL5kpYncj
 ghdwWZmPZuNk1eQ+wmTEULXvTj0T4pMXqxaEeCx/OCPq1n/1e75oirptZuChAXfqm7woIYD4+
 O200/efAFL79CtszzYo/pmVHrhCJQW41Ag9ukNXNb6soyQNCbzEWun9VnnJFWW8bj1MeD7MIt
 wilIC8R3ZjM6Vu/kVdhAYCaHszNAMhNTJnxvd7alY3llHvQ5mJtAyRuj78M/1SmMNB3VElFer
 oUamxL+vLUUswFtVT3fkpoOpTnzXfc8yVmnKPqgQTe8AMRYiw7tUJhZEImCj7NHrRmoL14NC1
 s6/58jPmjkMisoZ55C/yS5/SOrMTB8bIruWSpgGDYlfqseu+L//sy1PjdbdW/iO+HYj0QP/0x
 JMMr7SbbI+5nNP94Oq8P+k3DICT/h+ZhmYeH3ddmOZCdkLZvUJxE5GOLThg/Uc9edffEhRzqX
 ZfsmyeXZE4e1Ks/kMGqu0RVgcvt8k0C9JA4EJYnl+MufrnU28rRRaSuDyyeuGxZH+O5lX4uRN
 2HMhJv39uu00i3lY4R2EsdUXppMzvnH8fMjl9hbWJW/+p7F/Y7H1H0xMUQtbvznJ1oic98Mq0
 UiuigsDCL4fpgj6i3hpBgzKYS5Q0QRpPLp230mEujkscBoOLGuMR/F/Y5F51MI050KmHyyPbI
 YsAcLKB/WcRHq3t+Zrsaqd5Q7PIEg6yxC2xB7S/b2RlKpRdWE4MZMVc2YPIEAvVjZT27aIFwo
 jmZIAKyArntL7YVJUGy6prK24LZ14pW09xCvTVfTRWhDBidvCszKsCgTHXoJXoueb5wQyvjZy
 NXXyBl7CZL1tP/yDKz5xEu3T3EvlLmX0VqD3aUoldKdp3z6w==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C block on the BCM2711 isn't affected by the clock stretching bug.
So there is no need to apply the corresponding quirk.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/i2c/busses/i2c-bcm2835.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm=
2835.c
index 67752f7..340da70 100644
=2D-- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>

@@ -50,6 +51,9 @@
 #define BCM2835_I2C_CDIV_MIN	0x0002
 #define BCM2835_I2C_CDIV_MAX	0xFFFE

+#define NO_STRETCH_BUG	false
+#define STRETCH_BUG	true
+
 struct bcm2835_i2c_dev {
 	struct device *dev;
 	void __iomem *regs;
@@ -389,7 +393,7 @@ static const struct i2c_algorithm bcm2835_i2c_algo =3D=
 {
 };

 /*
- * This HW was reported to have problems with clock stretching:
+ * The BCM2835 was reported to have problems with clock stretching:
  * http://www.advamation.com/knowhow/raspberrypi/rpi-i2c-bug.html
  * https://www.raspberrypi.org/forums/viewtopic.php?p=3D146272
  */
@@ -406,6 +410,9 @@ static int bcm2835_i2c_probe(struct platform_device *p=
dev)
 	struct clk *bus_clk;
 	struct clk *mclk;
 	u32 bus_clk_rate;
+	bool clk_stretch_bug;
+
+	clk_stretch_bug =3D (bool)of_device_get_match_data(&pdev->dev);

 	i2c_dev =3D devm_kzalloc(&pdev->dev, sizeof(*i2c_dev), GFP_KERNEL);
 	if (!i2c_dev)
@@ -475,7 +482,9 @@ static int bcm2835_i2c_probe(struct platform_device *p=
dev)
 	adap->algo =3D &bcm2835_i2c_algo;
 	adap->dev.parent =3D &pdev->dev;
 	adap->dev.of_node =3D pdev->dev.of_node;
-	adap->quirks =3D &bcm2835_i2c_quirks;
+
+	if (clk_stretch_bug)
+		adap->quirks =3D &bcm2835_i2c_quirks;

 	bcm2835_i2c_writel(i2c_dev, BCM2835_I2C_C, 0);

@@ -501,7 +510,8 @@ static int bcm2835_i2c_remove(struct platform_device *=
pdev)
 }

 static const struct of_device_id bcm2835_i2c_of_match[] =3D {
-	{ .compatible =3D "brcm,bcm2835-i2c" },
+	{ .compatible =3D "brcm,bcm2711-i2c", .data =3D (void *)NO_STRETCH_BUG }=
,
+	{ .compatible =3D "brcm,bcm2835-i2c", .data =3D (void *)STRETCH_BUG },
 	{},
 };
 MODULE_DEVICE_TABLE(of, bcm2835_i2c_of_match);
=2D-
2.7.4

