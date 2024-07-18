Return-Path: <linux-i2c+bounces-5012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C069345B7
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 03:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D8CE1C21353
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jul 2024 01:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AAA1B86E7;
	Thu, 18 Jul 2024 01:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b="CpR5+1zi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from greygoose-centos7.csh.rit.edu (greygoose-centos7.csh.rit.edu [129.21.49.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CEA110A;
	Thu, 18 Jul 2024 01:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.21.49.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721265923; cv=none; b=KVCtlkICD4Y3EAb+k6nIZ7FfUZzuhwxHkExifAiNErUg7BXyi+2/EJ+Pkc/jP3iD3g7BD1cZb/4J10mHU3XIAAdZJyTkcby9r6k56aj/l4zRagYVQvKYz4EelSnJLlCbjeud8aPm1AboSXjw3Bd4JFd8lshIt3JXNf4gtzNCXck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721265923; c=relaxed/simple;
	bh=Iw5zX93m3E1bz0YWEvwpblm2zVBgrHtJbGtokDUqxh4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dvy7FpYGn340os6fISbynqH8E/CUlhV48ID3y3jd8Ayi7W9oLO2sSeXsVAxEBsihfaSyUpaG+8fORBueBV8wCu+lBjdcxM9yXwxkATmtRP7Q/b3Jx/cytm8CSJq0BqYgeWhIDMTDYNEUEDARppdvH7D3i8d77iewB5bmC7g/6hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu; spf=pass smtp.mailfrom=csh.rit.edu; dkim=pass (1024-bit key) header.d=csh.rit.edu header.i=@csh.rit.edu header.b=CpR5+1zi; arc=none smtp.client-ip=129.21.49.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csh.rit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csh.rit.edu
Received: from localhost (localhost [127.0.0.1])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id 8C948456D414;
	Wed, 17 Jul 2024 21:16:21 -0400 (EDT)
Authentication-Results: mail.csh.rit.edu (amavisd-new);
 dkim=pass (1024-bit key) reason="pass (just generated, assumed good)"
 header.d=csh.rit.edu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=csh.rit.edu; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mail; t=1721265380; x=1723079781; bh=Iw5zX
	93m3E1bz0YWEvwpblm2zVBgrHtJbGtokDUqxh4=; b=CpR5+1ziyEXREg8T3e/xV
	6e7nLA34GlEQNt6sZ8n0pYqD5PkbD6mwldmGstauY1SVlVfgmw1n9loTg48Ythqt
	mFPtQqzbENrlj4GVntEMXe+ZMQMC5qkMO3yGSCKzQNEcXh2iazxy+bTjDA0zGVMz
	48xytj4ueYZqdcfcsdncJg=
X-Virus-Scanned: amavisd-new at csh.rit.edu
Received: from greygoose-centos7.csh.rit.edu ([127.0.0.1])
 by localhost (mail.csh.rit.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5_gEh8dL0wtJ; Wed, 17 Jul 2024 21:16:20 -0400 (EDT)
Received: from freedom.csh.rit.edu (freedom.csh.rit.edu [129.21.49.182])
	by greygoose-centos7.csh.rit.edu (Postfix) with ESMTP id DC35B456D91E;
	Wed, 17 Jul 2024 21:16:20 -0400 (EDT)
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
Subject: [PATCH 3/3] i2c: Add Congatec CGEB I2C driver
Date: Wed, 17 Jul 2024 21:15:04 -0400
Message-ID: <20240718011504.4106163-4-mstrodl@csh.rit.edu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
References: <20240718011504.4106163-1-mstrodl@csh.rit.edu>
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
 drivers/i2c/busses/Kconfig             |   7 +
 drivers/i2c/busses/Makefile            |   1 +
 drivers/i2c/busses/i2c-congatec-cgeb.c | 187 +++++++++++++++++++++++++
 3 files changed, 195 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-congatec-cgeb.c

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index fe6e8a1bb607..504a0be54f04 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1261,6 +1261,13 @@ config I2C_RCAR
 	  This driver can also be built as a module.  If so, the module
 	  will be called i2c-rcar.
=20
+config I2C_CONGATEC_CGEB
+	tristate "Congatec CGEB I2C driver"
+	depends on MFD_CONGATEC_CGEB
+	help
+	  This driver provides support for the I2C busses accssable via
+	  the Congatec CGEB interface found on Congatec boards.
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
index 000000000000..decaef30ca0a
--- /dev/null
+++ b/drivers/i2c/busses/i2c-congatec-cgeb.c
@@ -0,0 +1,187 @@
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
+				"%s: rd: %p/%ld wr: %p/%ld flags: 0x%08lx %s\n",
+				__func__, rdbuf, rdlen, raw_wrbuf, wrlen + 1,
+				flags,
+				msgs[i].flags & I2C_M_RD ? "READ" : "WRITE");
+
+		memset(&fps, 0, sizeof(fps));
+
+		fps.unit =3D priv->unit;
+		fps.pars[0] =3D wrlen + 1;
+		fps.pars[1] =3D rdlen;
+		fps.pars[2] =3D flags;
+		fps.iptr =3D raw_wrbuf;
+		fps.optr =3D rdbuf;
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
+	strcpy(priv->adapter.name, pdev->name);
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
+		dev_err(&pdev->dev, "registration failed\n");
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


