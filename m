Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACFFB284F8C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Oct 2020 18:11:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726137AbgJFQLB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 6 Oct 2020 12:11:01 -0400
Received: from mailout11.rmx.de ([94.199.88.76]:50652 "EHLO mailout11.rmx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgJFQLB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 6 Oct 2020 12:11:01 -0400
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mailout11.rmx.de (Postfix) with ESMTPS id 4C5Mrw5w11z40qX;
        Tue,  6 Oct 2020 18:10:56 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by kdin01.retarus.com (Postfix) with ESMTPS id 4C5Mqn6vl6z2xZn;
        Tue,  6 Oct 2020 18:09:57 +0200 (CEST)
Received: from N95HX1G2.wgnetz.xx (192.168.54.45) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Tue, 6 Oct
 2020 18:09:33 +0200
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
Subject: [PATCH v4 2/3] i2c: imx: Check for I2SR_IAL after every byte
Date:   Tue, 6 Oct 2020 18:08:13 +0200
Message-ID: <20201006160814.22047-3-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201006160814.22047-1-ceggers@arri.de>
References: <20201006160814.22047-1-ceggers@arri.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [192.168.54.45]
X-RMX-ID: 20201006-181001-4C5Mqn6vl6z2xZn-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Arbitration Lost (IAL) can happen after every single byte transfer. If
arbitration is lost, the I2C hardware will autonomously switch from
master mode to slave. If a transfer is not aborted in this state,
consecutive transfers will not be executed by the hardware and will
timeout.

Signed-off-by: Christian Eggers <ceggers@arri.de>
Cc: stable@vger.kernel.org
---
 drivers/i2c/busses/i2c-imx.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index cbdcab73a055..63575af41c09 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -490,6 +490,16 @@ static int i2c_imx_trx_complete(struct imx_i2c_struct *i2c_imx, bool atomic)
 		dev_dbg(&i2c_imx->adapter.dev, "<%s> Timeout\n", __func__);
 		return -ETIMEDOUT;
 	}
+
+	/* check for arbitration lost */
+	if (i2c_imx->i2csr & I2SR_IAL) {
+		dev_dbg(&i2c_imx->adapter.dev, "<%s> Arbitration lost\n", __func__);
+		i2c_imx_clear_irq(i2c_imx, I2SR_IAL);
+
+		i2c_imx->i2csr = 0;
+		return -EAGAIN;
+	}
+
 	dev_dbg(&i2c_imx->adapter.dev, "<%s> TRX complete\n", __func__);
 	i2c_imx->i2csr = 0;
 	return 0;
-- 
Christian Eggers
Embedded software developer

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternummer: HRA 57918
Persoenlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: Muenchen - Registergericht: Amtsgericht Muenchen - Handelsregisternummer: HRB 54477
Geschaeftsfuehrer: Dr. Michael Neuhaeuser; Stephan Schenk; Walter Trauninger; Markus Zeiler

