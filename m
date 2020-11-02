Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED9342A261E
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Nov 2020 09:30:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727870AbgKBIaj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Nov 2020 03:30:39 -0500
Received: from inva021.nxp.com ([92.121.34.21]:60566 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727806AbgKBIaj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Nov 2020 03:30:39 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3E5B02014C2;
        Mon,  2 Nov 2020 09:30:38 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0DAE92014BF;
        Mon,  2 Nov 2020 09:30:32 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 28813402D2;
        Mon,  2 Nov 2020 09:30:24 +0100 (CET)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     leoyang.li@nxp.com, linux@rempel-privat.de, kernel@pengutronix.de,
        wsa@the-dreams.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, aisheng.dong@nxp.com, xiaoning.wang@nxp.com,
        o.rempel@pengutronix.de
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, xiaobo.xie@nxp.com,
        linux-arm-kernel@lists.infradead.org, Biwen Li <biwen.li@nxp.com>
Subject: [v9 2/2] i2c: imx: select I2C_SLAVE by default
Date:   Mon,  2 Nov 2020 16:21:02 +0800
Message-Id: <20201102082102.16508-2-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201102082102.16508-1-biwen.li@oss.nxp.com>
References: <20201102082102.16508-1-biwen.li@oss.nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

Select I2C_SLAVE by default

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v9:
	- none

 drivers/i2c/busses/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a4f473ef4e5c..d3d9a61db76e 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -675,6 +675,7 @@ config I2C_IMG
 config I2C_IMX
 	tristate "IMX I2C interface"
 	depends on ARCH_MXC || ARCH_LAYERSCAPE || COLDFIRE
+	select I2C_SLAVE
 	help
 	  Say Y here if you want to use the IIC bus controller on
 	  the Freescale i.MX/MXC, Layerscape or ColdFire processors.
-- 
2.17.1

