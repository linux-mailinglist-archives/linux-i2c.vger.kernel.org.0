Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E940E5A79
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Oct 2019 14:35:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbfJZMfi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Oct 2019 08:35:38 -0400
Received: from mout.gmx.net ([212.227.15.18]:46373 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbfJZMfi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 26 Oct 2019 08:35:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1572093321;
        bh=1yugpwhKUCxitXlaCY5TBfzLToSRP5Lt2gahS402j5E=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=NXRWMy9C8l2xBGav8dQCTGmlq4IMvaDNwVahHjRE4SfVpUHgS2gt572fNwIObB5YB
         MvfNBKdvlDCGnhwhpMTVHH0S87ugIMmiqGjUhDITQGGiv/oGXb0XYGIKJt5cUzmhv2
         CuteKqgHbtOx0z1hj1VnVq/bvs5SdMpoa2AZzW0s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.112]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MSt8W-1iYodS3KXu-00UHkD; Sat, 26 Oct 2019 14:35:20 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Annaliese McDermond <nh6z@nh6z.net>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFC] i2c: bcm2835: Store pointer to bus clock
Date:   Sat, 26 Oct 2019 14:34:48 +0200
Message-Id: <1572093288-6223-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:fuPkfYs+IgimCcjJxA2bu5hUW+PGe+bszuHRigTxQcYcHsnx4qu
 WY/W/9h8LyCnYtr+aV4OJBP2GqLEKaTYZpgD3E5JorEOiocZ3LkjJErLI7SUHrEe2kditsv
 26IaMtYV5+uCttWQJbyxaxFBIzHRBdrQ6ty/VH8xRvGGgVL9M21boyK+3Zs5GlksStCUiqS
 f6X/MkcHQ9TeDSgJ5agcA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SVrXd/hEQTM=:6uBuqbn9rZfl2NXWZnL0s9
 8MOiHyjL6MWotrGIV4cmFcBrtUesAc3UzzLivKhJ4UEKX3N0xVjpRLl29nZTDPKTdWxatueh5
 3Xi1raAl6R4iH9LAYM9RN/AWDz15i3Fbjvktx8HSlEhiqv+auc4+0/E+qmZcIIV5Q/lPMo5Tf
 n+DuByLxfk1QrBe7z7ewHzdUHJBj+3fKVo//pjZfVIrB8jlDza75qUKKtIFMTZoLeTf/RObqG
 Uj7swI3OE/dkN8Ezo7PUHnIxuHcummiTNkEn2hcJHqNkudcFDDqjd6JwPsLzpMi5XdkcaEn2Q
 RC1v86c2H943+K+ukn673LZBLlY4oCBX+SleajAvgcHX1p5pVgSKa7wIWkdm4bYcoyvhNy2D0
 L2SRO+CRGafpW+WvmWVmn2h/Xmyd4ci7LsBd4Sx63ATcExGTXKDly0rE0HJu3VfPp1EKQtnoI
 ytAxVU/AA2cYfQuqBuksXqupUUuIzOrszkwsN2OZs96rPeEWy0IBqmfLKrdVZJmF3C9YgLncw
 1bq5BBqTeWQJR5cY9ut0h0WhZvMg68v6CKxBthaiKaPdPVRZ7wvfgEekLvGokWUO5k+kNLppF
 QGAiEW87Uaz8cMJFMV2LtXdOTz/hFGeRdjKuZ8QlhA74RQNEMsslI15r5BbT8rf1UuC+p4qrA
 +mvzHqc5bISHyfP+0qJyvCEfI697EQkLmWmhxvcAHjPq0+QdHZugOzSctYxgYUAAGHpRX3CfH
 xOC5oEv+4/DNGv8AFgUogkNghQFWMVDPAdwMu/L544GmGjuiW4LHEU8M2F5KpYB0naMYb/fTp
 Ybklb72T1yDdl/j7hnm1xN9kad7W2qmQr5/TV3SiMIa8mqqPOBqOUtbr8eCQRS6n/X+CfJnY0
 H76VuwYwmbJsZs/++VbgZK/2kR0x3+7U21opJKqPlqoMF/c1n5NMieorjcYbSpIiKNxGTP9fk
 ZHSf9CIf73KgtjQzm2Y8PAUwFNzJb08mhusBuidI4MOkqO9w6e4avJT58pJkVV8VvbwS5jgCY
 N2IEz02dF4EE4oDeIQgyy/FcbG6moRdsGhgCaD6iXwhTEm1M4rbKABMFm/ZusDwqu0HnDzJY5
 66sAZ4DviXfPrJK6jxkPtcyIM0jK4M4kU3CkZMeRYXc9dsN/eomW1CUfzeU+5XB8fMZJcZdp4
 sUhOG71ev0nG9Cx+16Ts0VHP72cwAmC55ybaWoIwxRyBsjOZsYK0q1CxwkRaXsQoPkMdgRM7n
 JD1F4vWjc3B0qNcw+o6/nr+wlBtyhblb4wPIEaQ==
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The commit bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF") introduced
a NULL pointer dereference on driver unload. It seems that we can't fetch
the bus clock via devm_clk_get in bcm2835_i2c_remove. As an alternative
approach store a pointer to the bus clock in the private driver structure.

Fixes: bebff81fb8b9 ("i2c: bcm2835: Model Divider in CCF")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 drivers/i2c/busses/i2c-bcm2835.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm=
2835.c
index e01b2b5..5ab901a 100644
=2D-- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -58,6 +58,7 @@ struct bcm2835_i2c_dev {
 	struct i2c_adapter adapter;
 	struct completion completion;
 	struct i2c_msg *curr_msg;
+	struct clk *bus_clk;
 	int num_msgs;
 	u32 msg_err;
 	u8 *msg_buf;
@@ -404,7 +405,6 @@ static int bcm2835_i2c_probe(struct platform_device *p=
dev)
 	struct resource *mem, *irq;
 	int ret;
 	struct i2c_adapter *adap;
-	struct clk *bus_clk;
 	struct clk *mclk;
 	u32 bus_clk_rate;

@@ -427,11 +427,11 @@ static int bcm2835_i2c_probe(struct platform_device =
*pdev)
 		return PTR_ERR(mclk);
 	}

-	bus_clk =3D bcm2835_i2c_register_div(&pdev->dev, mclk, i2c_dev);
+	i2c_dev->bus_clk =3D bcm2835_i2c_register_div(&pdev->dev, mclk, i2c_dev)=
;

-	if (IS_ERR(bus_clk)) {
+	if (IS_ERR(i2c_dev->bus_clk)) {
 		dev_err(&pdev->dev, "Could not register clock\n");
-		return PTR_ERR(bus_clk);
+		return PTR_ERR(i2c_dev->bus_clk);
 	}

 	ret =3D of_property_read_u32(pdev->dev.of_node, "clock-frequency",
@@ -442,13 +442,13 @@ static int bcm2835_i2c_probe(struct platform_device =
*pdev)
 		bus_clk_rate =3D 100000;
 	}

-	ret =3D clk_set_rate_exclusive(bus_clk, bus_clk_rate);
+	ret =3D clk_set_rate_exclusive(i2c_dev->bus_clk, bus_clk_rate);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not set clock frequency\n");
 		return ret;
 	}

-	ret =3D clk_prepare_enable(bus_clk);
+	ret =3D clk_prepare_enable(i2c_dev->bus_clk);
 	if (ret) {
 		dev_err(&pdev->dev, "Couldn't prepare clock");
 		return ret;
@@ -491,10 +491,9 @@ static int bcm2835_i2c_probe(struct platform_device *=
pdev)
 static int bcm2835_i2c_remove(struct platform_device *pdev)
 {
 	struct bcm2835_i2c_dev *i2c_dev =3D platform_get_drvdata(pdev);
-	struct clk *bus_clk =3D devm_clk_get(i2c_dev->dev, "div");

-	clk_rate_exclusive_put(bus_clk);
-	clk_disable_unprepare(bus_clk);
+	clk_rate_exclusive_put(i2c_dev->bus_clk);
+	clk_disable_unprepare(i2c_dev->bus_clk);

 	free_irq(i2c_dev->irq, i2c_dev);
 	i2c_del_adapter(&i2c_dev->adapter);
=2D-
2.7.4

