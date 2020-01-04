Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A64EB1302EC
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Jan 2020 16:14:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgADPOE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Jan 2020 10:14:04 -0500
Received: from mout.gmx.net ([212.227.17.21]:51977 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725924AbgADPOE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 4 Jan 2020 10:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1578150827;
        bh=1yugpwhKUCxitXlaCY5TBfzLToSRP5Lt2gahS402j5E=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=MbnPZwmp6NPWyJ+nTYa4EQGMii3frRh2v/tYv40afiNz+99rEedEDdjxsKl27l4oD
         hWfzNCyvFs63mjvKx8zwxtQoMwXrbFQZJUxUJqWe3KpjvixGSRobAEy8mdZxGQbHqd
         nQXoMIWni2z++5qkHzH/F0xy9xYT116OnhuIz1bg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.154]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M2f9b-1irsO41fh9-0049KA; Sat, 04 Jan 2020 16:13:47 +0100
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH] i2c: bcm2835: Store pointer to bus clock
Date:   Sat,  4 Jan 2020 16:13:20 +0100
Message-Id: <1578150800-8284-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:+CxNNTTJTACKCcJ+cRBVN/0wjBwwrR6wt3tY7YEwflaFQx4D7PL
 dRD/pi7d86hR9Kqmt6/I4SZqwXKBDdCHvkGlz9LiZVro6vVrhS/EJb89e2LAskBLmuUzaWS
 CXMHy5h8/doVFj5ocE/mSeQ400jPVZ2ApWau5pt7rC6pufX3YBNbTvBreEUlFQMFXWwrW/H
 lngK3iebbDGwEDqTPTbPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BgSYWcKN3Gg=:yR4de8uWwpMTwn/AA0akTL
 1FGmpaNrY6tOVTwlSw9ddveXq6xNxJ1LTREtQB4WiHc7UywHF3NfS6p84GFGWNiUjjM4I5q9H
 cUy4UGpvYA8nq+7P6tJAZwQt0sM7g3+DlwH2T7cOoXdMw6cL8bdKISwNm7qQwf9rpiCEA07Gv
 Rh2zy0h8msMBnwA6QtMfOdYwHa5IVqsAG7xSUKnS1Wa042HGoHiophnd8XY4SK7CFhh5pW6WD
 k9m2NAPfek8zjuXL6bKHqnYFJLhNnGotVFAxfNTit8TxNwg4CUkSJiBvVMmueOvr0FdoJuJ1E
 Kg0uoDLJRGTG8vWfERzY3l5cxSDNY2n69z41x62koRSiqEuUSWt62BHnBcOUBidG5CezUMC9j
 L34FOGAW8dmHsUR6XoTj0dVOjFh8WmRsVgRuWo1m4BTwc68EOMD031qXxTF6z6EGW0qeONcTZ
 UYrMf6gunsciFK9ERpqwzgoqe+OBdhkvgJQ3v5LKo6Up9cXuTFzhLen3NLzsLBgtRY1n+mL9V
 XzxCIcnskixpBtKg6/pl93MT08n8KDgWrqS/eyVTKmPspS+sgqzTGAVFCSyadrRxK146Tt61A
 GldvTg0Vk0nqxG/a3spHVXXi9l3D5mMpWC8jBCSRbB5x6c49bzF0GiiiANNRy/jy4jCXRbwke
 reM/J0QWa7ctWbNV/LHFuQqM6f/m8BStgtw9N+9U3bXfOvswF0g0q4JKWdTe4hxoeyNLJAFA9
 p1MuF0pZN23NKDIn+Azi9P2oNGEfd87sEegkbY2TB6gymkWUs2pRu7g0i63ZWCMu2auH7M4CO
 KFvTYOluqmaIUoij+KWAPljj+Jyc45mUQ0ec5L+52uPAVSXasVDsEKxjiuS845EISJ5D8Mw0B
 51jk0SlqzRs85GcQX24yUFmje40VBTzO4+3WlAt+JMHtM5OmExyOxHAq36rgMbKuBXHGCR0mj
 8Z4bfwnBA/bkLR1c6wFD8EsP1KS5SbVr8J0p/seTiR+k3an4EGm+Wr5FzJzaNTguy1RlFjWdJ
 9R26CYFMPYd/A620QYkeUOfiDfEPXatgNmDetHKLkdD7plY53JT22ReZrKr/9qj8kUil0npiE
 JK1QEti0tJFHKobJSGRWLgGIkZDesF5f/pGZf/iSWTjTE+OZHzj7Yif2LMsvCT81FkabpKVQ3
 A8Mzv4Lld9I3Q92samCXzUYJQWqRmOlmy5xDaOeTkHB7fHEcAE7s7oNLHdoBgZJbp8Z61eszU
 hfbOMoMxjivHCXP9UZW2vLYjucMLKQfk/jtLoJQ==
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

