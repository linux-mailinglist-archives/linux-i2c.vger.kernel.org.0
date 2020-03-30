Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AE3B1979EB
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Mar 2020 12:54:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729278AbgC3KyS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Mar 2020 06:54:18 -0400
Received: from inva020.nxp.com ([92.121.34.13]:36550 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729214AbgC3KyS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Mar 2020 06:54:18 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 422B21A0467;
        Mon, 30 Mar 2020 12:54:16 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6DF141A0485;
        Mon, 30 Mar 2020 12:54:11 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 9C675402AA;
        Mon, 30 Mar 2020 18:54:05 +0800 (SGT)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     leoyang.li@nxp.com, linux@rempel-privat.de, kernel@pengutronix.de,
        wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, Biwen Li <biwen.li@nxp.com>
Subject: [PATCH] i2c: slave: support I2C_SLAVE_STOP event for the read transactions
Date:   Mon, 30 Mar 2020 18:50:38 +0800
Message-Id: <20200330105038.22546-1-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

Support I2C_SLAVE_STOP event for the read transactions(master read from slave)

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 62517a41b32d..1fd0d87885d5 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1464,6 +1464,7 @@ static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx)
 		ctl &= ~I2CR_MTX;
 		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
 		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+		i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
 	}
 	return IRQ_HANDLED;
 }
-- 
2.17.1

