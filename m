Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE684284F91
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 18:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725947AbgJFQLx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 12:11:53 -0400
Received: from mailout12.rmx.de ([94.199.88.78]:38157 "EHLO mailout12.rmx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgJFQLw (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Oct 2020 12:11:52 -0400
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mailout12.rmx.de (Postfix) with ESMTPS id 4C5Msv4MsxzRq0K;
        Tue,  6 Oct 2020 18:11:47 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by kdin01.retarus.com (Postfix) with ESMTPS id 4C5Mrw5nVzz2xqM;
        Tue,  6 Oct 2020 18:10:56 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.45) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 6 Oct
 2020 18:10:03 +0200
From:   Christian Eggers <ceggers@arri.de>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        "David Laight" <David.Laight@ACULAB.COM>
CC:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, Christian Eggers <ceggers@arri.de>,
        <stable@vger.kernel.org>
Subject: [PATCH v4 3/3] i2c: imx: Don't generate STOP condition if arbitration has been lost
Date:   Tue, 6 Oct 2020 18:08:14 +0200
Message-ID: <20201006160814.22047-4-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006160814.22047-1-ceggers@arri.de>
References: <20201006160814.22047-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.54.45]
X-RMX-ID: 20201006-181104-4C5Mrw5nVzz2xqM-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

If arbitration is lost, the master automatically changes to slave mode.
I2SR_IBB may or may not be reset by hardware. Raising a STOP condition
by resetting I2CR_MSTA has no effect and will not clear I2SR_IBB.

So calling i2c_imx_bus_busy() is not required and would busy-wait until
timeout.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Cc: stable@vger.kernel.org # Requires trivial backporting, simple remove
                           # the 3rd argument from the calls to
                           # i2c_imx_bus_busy().
---
 drivers/i2c/busses/i2c-imx.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 63575af41c09..5d8a79319b2b 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -615,6 +615,8 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
 		/* Stop I2C transaction */
 		dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		if (!(temp & I2CR_MSTA))
+			i2c_imx->stopped = 1;
 		temp &= ~(I2CR_MSTA | I2CR_MTX);
 		if (i2c_imx->dma)
 			temp &= ~I2CR_DMAEN;
@@ -778,9 +780,12 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 		 */
 		dev_dbg(dev, "<%s> clear MSTA\n", __func__);
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		if (!(temp & I2CR_MSTA))
+			i2c_imx->stopped = 1;
 		temp &= ~(I2CR_MSTA | I2CR_MTX);
 		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-		i2c_imx_bus_busy(i2c_imx, 0, false);
+		if (!i2c_imx->stopped)
+			i2c_imx_bus_busy(i2c_imx, 0, false);
 	} else {
 		/*
 		 * For i2c master receiver repeat restart operation like:
@@ -905,9 +910,12 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 				dev_dbg(&i2c_imx->adapter.dev,
 					"<%s> clear MSTA\n", __func__);
 				temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+				if (!(temp & I2CR_MSTA))
+					i2c_imx->stopped =  1;
 				temp &= ~(I2CR_MSTA | I2CR_MTX);
 				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-				i2c_imx_bus_busy(i2c_imx, 0, atomic);
+				if (!i2c_imx->stopped)
+					i2c_imx_bus_busy(i2c_imx, 0, atomic);
 			} else {
 				/*
 				 * For i2c master receiver repeat restart operation like:
-- 
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternummer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternummer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Trauninger; Markus Zeiler

