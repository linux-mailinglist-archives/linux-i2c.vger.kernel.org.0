Return-Path: <linux-i2c+bounces-5407-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 087A195222D
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 848531F242BF
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 18:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CAF1BE22E;
	Wed, 14 Aug 2024 18:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="q2jUGwrT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578D3374FA;
	Wed, 14 Aug 2024 18:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723661273; cv=none; b=OPjVz11Dz9DtMOScAGC3JQXjs3BEy/sjrSQXn+xW+2bIo7HkDjtrArkpnlfrGhx4OhkLybWcf8IbMPhne3qTBfK/R1u0snvbiqF3HPFV/5/YIX7YW+sdHAXRfEv306aedtc+bN1lrr8XY+qoi4fvGjRABcPaE3MAa9X49BD99MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723661273; c=relaxed/simple;
	bh=mCBxdka291k0ThxNZp/dZ4uorDpdfjJsGKKtbiX+TI8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lb+SN+fzCXLvHfsY1ExBgHRb+4+xNfS+9sf0jbDqMeYY3Y4ifd1HSUHO4gXfCKyXP7BzFcSIH1hadQg/aTCLTZDD4D/SMCOguKVV9rZio2unEo3lYY9+h2M0X3duXcwT7kEmhDdb+/Vr1QhH2C7xUbtjP1w58VTWYaVRT08xpKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=q2jUGwrT; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id D8CDD414609E;
	Wed, 14 Aug 2024 14:47:43 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1723661263; x=1725475664; bh=mCBxd
	ka291k0ThxNZp/dZ4uorDpdfjJsGKKtbiX+TI8=; b=q2jUGwrTVtrTRnCasfTBd
	VTryCyRl25NkomL6RmKCZPYIlMQ/4ZXEAfGnqu79FA4DiLNho+zFFN6Z7EPzaukN
	iFAyRkfw03f2qeLPedGfE+IPizI/8DQmKsrUaRL7XWOWC4zJBarACkwfW8FIELou
	PqWgktRFhmyLqNNRCeL6aU=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PL3JFN303fnb; Wed, 14 Aug 2024 14:47:43 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id C920F45735E9;
	Wed, 14 Aug 2024 14:47:42 -0400 (EDT)
From: Mary Strodl <mstrodl@csh.rit.edu>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	urezki@gmail.com,
	hch@infradead.org,
	linux-mm@kvack.org,
	lee@kernel.org,
	andi.shyti@kernel.org,
	linux-i2c@vger.kernel.org,
	s.hauer@pengutronix.de,
	christian.gmeiner@gmail.com,
	Mary Strodl <mstrodl@csh.rit.edu>
Subject: [PATCH v4 2/2] i2c: Add Congatec CGEB I2C driver
Date: Wed, 14 Aug 2024 14:47:31 -0400
Message-ID: <20240814184731.1310988-3-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240814184731.1310988-1-mstrodl@csh.rit.edu>
References: <20240814184731.1310988-1-mstrodl@csh.rit.edu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Sascha Hauer <s.hauer@pengutronix.de>

This driver provides a I2C bus driver for the CGEB interface
found on some Congatec x86 modules. No devices are registered
on the bus, the user has to do this via the i2c device /sys
interface.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Signed-off-by: Christian Gmeiner <christian.gmeiner@gmail.com>
Signed-off-by: Mary Strodl <mstrodl@csh.rit.edu>
---
 drivers/i2c/busses/Kconfig             |  10 ++
 drivers/i2c/busses/Makefile            |   1 +
 drivers/i2c/busses/i2c-congatec-cgeb.c | 190 +++++++++++++++++++++++++
 3 files changed, 201 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-congatec-cgeb.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fe6e8a1bb607..0a5d348c4664 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1261,6 +1261,16 @@ config I2C_RCAR
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-rcar.
=20
+config I2C_CONGATEC_CGEB
+	tristate "Congatec CGEB I2C driver"
+	depends on MFD_CONGATEC_CGEB
+	help
+	  If you say yes to this option, support will be included for the
+	  Congatec CGEB I2C controller.
+
+	  This driver can also be built as a module.  If so, the module
+	  will be called i2c-congatec-cgeb.
+
 comment "External I2C/SMBus adapter drivers"
=20
 config I2C_DIOLAN_U2C
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 78d0561339e5..f4e9fa7542be 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -128,6 +128,7 @@ obj-$(CONFIG_I2C_XILINX)	+=3D i2c-xiic.o
 obj-$(CONFIG_I2C_XLP9XX)	+=3D i2c-xlp9xx.o
 obj-$(CONFIG_I2C_RCAR)		+=3D i2c-rcar.o
 obj-$(CONFIG_I2C_GXP)		+=3D i2c-gxp.o
+obj-$(CONFIG_I2C_CONGATEC_CGEB)	+=3D i2c-congatec-cgeb.o
=20
 # External I2C/SMBus adapter drivers
 obj-$(CONFIG_I2C_DIOLAN_U2C)	+=3D i2c-diolan-u2c.o
diff --git a/drivers/i2c/busses/i2c-congatec-cgeb.c b/drivers/i2c/busses/=
i2c-congatec-cgeb.c
new file mode 100644
index 000000000000..3adeb7bf3534
--- /dev/null
+++ b/drivers/i2c/busses/i2c-congatec-cgeb.c
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * CGEB i2c driver
+ *
+ * (c) 2011 Sascha Hauer, Pengutronix
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/i2c.h>
+#include <linux/mfd/congatec-cgeb.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+#define CG_I2C_FLAG_START   0x00080    /* send START condition */
+#define CG_I2C_FLAG_STOP    0x00040    /* send STOP condition */
+#define CG_I2C_FLAG_ALL_ACK 0x08000    /* send ACK on all read bytes */
+#define CG_I2C_FLAG_ALL_NAK 0x04000    /* send NAK on all read bytes */
+
+struct cgeb_i2c_priv {
+	struct cgeb_board_data *board;
+	struct i2c_adapter adapter;
+	int unit;
+};
+
+static u32 cgeb_i2c_func(struct i2c_adapter *adapter)
+{
+	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL;
+}
+
+static int cgeb_i2c_set_speed(struct cgeb_i2c_priv *priv, int speed)
+{
+	struct cgeb_function_parameters fps;
+
+	memset(&fps, 0, sizeof(fps));
+
+	fps.unit =3D priv->unit;
+	fps.pars[0] =3D speed;
+
+	return cgeb_call(priv->board, &fps, CgebI2CSetFrequency);
+}
+
+static int cgeb_i2c_xfer(struct i2c_adapter *adapter,
+		struct i2c_msg *msgs, int num)
+{
+	struct cgeb_function_parameters fps;
+	int i, ret;
+	unsigned long flags =3D CG_I2C_FLAG_START;
+	struct cgeb_i2c_priv *priv =3D i2c_get_adapdata(adapter);
+	unsigned long rdlen, wrlen;
+	unsigned char *rdbuf, *wrbuf, *raw_wrbuf;
+	unsigned short lmax =3D 0;
+
+	/*
+	 * With cgeb the I2C address is part of the write data
+	 * buffer, so allocate a buffer with the length of the
+	 * longest write buffer + 1
+	 */
+	for (i =3D 0; i < num; i++)
+		if (!(msgs[i].flags & I2C_M_RD))
+			lmax =3D max(lmax, msgs[i].len);
+
+	raw_wrbuf =3D kmalloc(lmax + 1, GFP_KERNEL);
+	if (!raw_wrbuf)
+		return -ENOMEM;
+
+	for (i =3D 0; i < num; i++) {
+		if (msgs[i].flags & I2C_M_RD) {
+			rdbuf =3D msgs[i].buf;
+			rdlen =3D msgs[i].len;
+			wrbuf =3D NULL;
+			wrlen =3D 0;
+		} else {
+			rdbuf =3D NULL;
+			rdlen =3D 0;
+			wrbuf =3D msgs[i].buf;
+			wrlen =3D msgs[i].len;
+		}
+
+		raw_wrbuf[0] =3D msgs[i].addr << 1;
+		if (wrlen)
+			memcpy(&raw_wrbuf[1], wrbuf, wrlen);
+
+		if (msgs[i].flags & I2C_M_RD)
+			raw_wrbuf[0] |=3D 1;
+
+		if (i =3D=3D num - 1)
+			flags |=3D CG_I2C_FLAG_STOP;
+
+		dev_dbg(&adapter->dev,
+			"%s: rd: %p/%ld wr: %p/%ld flags: 0x%08lx %s\n",
+			__func__, rdbuf, rdlen, raw_wrbuf, wrlen + 1,
+			flags,
+			msgs[i].flags & I2C_M_RD ? "READ" : "WRITE");
+
+		memset(&fps, 0, sizeof(fps));
+
+		fps.unit =3D priv->unit;
+		fps.pars[0] =3D wrlen + 1;
+		fps.pars[1] =3D rdlen;
+		fps.pars[2] =3D flags;
+		fps.iptr =3D raw_wrbuf;
+		fps.optr =3D rdbuf;
+		fps.optr_size =3D sizeof(*rdbuf) * rdlen;
+		fps.iptr_size =3D (wrlen + 1) * sizeof(*raw_wrbuf);
+
+		ret =3D cgeb_call(priv->board, &fps, CgebI2CTransfer);
+		if (ret) {
+			ret =3D -EREMOTEIO;
+			goto out;
+		}
+	}
+
+	ret =3D num;
+
+out:
+	kfree(raw_wrbuf);
+
+	return ret;
+}
+
+static struct i2c_algorithm cgeb_i2c_algo =3D {
+	.master_xfer    =3D cgeb_i2c_xfer,
+	.functionality  =3D cgeb_i2c_func,
+};
+
+static int cgeb_i2c_probe(struct platform_device *pdev)
+{
+	struct cgeb_i2c_priv *priv;
+	struct cgeb_pdata *pdata =3D pdev->dev.platform_data;
+	int ret;
+
+	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	strscpy(priv->adapter.name, pdev->name);
+	priv->adapter.owner             =3D THIS_MODULE;
+	priv->adapter.algo              =3D &cgeb_i2c_algo;
+	priv->adapter.dev.parent        =3D &pdev->dev;
+	priv->unit =3D pdata->unit;
+	priv->board =3D pdata->board;
+	i2c_set_adapdata(&priv->adapter, priv);
+
+	platform_set_drvdata(pdev, priv);
+
+	ret =3D cgeb_i2c_set_speed(priv, 400000);
+	if (ret)
+		/* not a critical error, we can continue with the default speed. */
+		dev_warn(&pdev->dev, "Could not set speed to 400KHz\n");
+
+	ret =3D i2c_add_adapter(&priv->adapter);
+	if (ret < 0) {
+		dev_err_probe(&pdev->dev, ret, "registration failed\n");
+		return ret;
+	}
+
+	dev_info(&pdev->dev, "registered\n");
+
+	return 0;
+};
+
+static int cgeb_i2c_remove(struct platform_device *pdev)
+{
+	struct cgeb_i2c_priv *priv =3D platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&priv->adapter);
+
+	return 0;
+}
+
+static struct platform_driver cgeb_i2c_driver =3D {
+	.probe          =3D cgeb_i2c_probe,
+	.remove         =3D cgeb_i2c_remove,
+	.driver =3D {
+		.name   =3D "cgeb-i2c",
+	},
+};
+module_platform_driver(cgeb_i2c_driver);
+
+MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
+MODULE_DESCRIPTION("cgeb i2c driver");
+MODULE_LICENSE("GPL");
--=20
2.45.2


