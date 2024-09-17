Return-Path: <linux-i2c+bounces-6842-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B58F97B629
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Sep 2024 01:30:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06FE7B27B4E
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 23:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B41193069;
	Tue, 17 Sep 2024 23:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="i2iHtJ/R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0520C18BC15
	for <linux-i2c@vger.kernel.org>; Tue, 17 Sep 2024 23:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726615789; cv=none; b=cW1oX+57IKm1r4ZWeBf+6uc3OWjiviUxP0iAPhWh6LwBwljZsrPwEnoudxGnzgIhCnsbjhckzh921PRKw98BkYiVWxCzLxTo9ne9FpHaEfr+lq58StZreteCC6rDB2xm3BQdtmHHbGkpcGNk1ZWy5JmHB9aQhkFsAVVroz3skwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726615789; c=relaxed/simple;
	bh=PWXsu7hmdKyFryLbKF2H2hHNrjY4SabXvnkj3ZlXos0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VPf6ez8O/jueDCA05jlUL9Zg20PRFHjdpUjtX8ZZMX15XtTtZzveuKX7vM1+C2c+0F2toBnQwRK1IO89krqWVIs6Fq1pj29Y7bPoaeGtMVN2aBdBWkni1JegtX91Y56kiWhmtjHpoR8MRPmnheHSh6qZkzbBUp2Td/toyu2K6nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=i2iHtJ/R; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 37F312C04C6;
	Wed, 18 Sep 2024 11:29:37 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1726615777;
	bh=sK0OBjCO0TUSOtd9gJAG5cm4pxzayS0oqY9Ctba8wX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i2iHtJ/RUCePhTNHQrdP9ONcod08dRjbzksNzYh14ydqZyrmfbcu5i/4wazQgkgGT
	 ynHs4rNvsZBpbvWIcIZprwoG9Rqp+jNy9qAXVWJYAsq5I727IH0ZuNfqTM1g0UWeqq
	 jp6AdpU55ZLSiG9ptarqai0iaC9Yl91qbmkoqVIljHkUtAC6V7NhbAzKwLQDiuxf4N
	 71dZr/VzsVUlSLA5nb5yoyMZCe4ukr0s3U1quESecfx5QMMfxiG0JTpIgWB4BfrD/Y
	 3Xj/8U2YBKJ0dC4be02cuNrf7/uVl2WGfJ6aPuWCzLBNjFIXOUwIVoYI2Mrw9noee5
	 Jb+jabBHav+rg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66ea10e00002>; Wed, 18 Sep 2024 11:29:36 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 7EA7913EE84;
	Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 7BA6C280347; Wed, 18 Sep 2024 11:29:36 +1200 (NZST)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tsbogend@alpha.franken.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/5] i2c: Add driver for the RTL9300 I2C controller
Date: Wed, 18 Sep 2024 11:29:29 +1200
Message-ID: <20240917232932.3641992-3-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
References: <20240917232932.3641992-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66ea10e0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=jdP34snFAAAA:8 a=VwQbUJbxAAAA:8 a=UgJECxHJAAAA:8 a=wkefLfiLUHRAPrDp2TIA:9 a=3ZKOabzyN94A:10 a=jlphF6vWLdwq7oh3TaWq:22 a=-El7cUbtino8hM1DCn8D:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add support for the I2C controller on the RTL9300 SoC. This is based on
the openwrt implementation[1] but cleaned up to make use of the regmap
APIs.

[1] - https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dtarge=
t/linux/realtek/files-5.15/drivers/i2c/busses/i2c-rtl9300.c

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 MAINTAINERS                      |   1 +
 drivers/i2c/busses/Kconfig       |  10 +
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-rtl9300.c | 377 +++++++++++++++++++++++++++++++
 4 files changed, 389 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-rtl9300.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ccb1125444f4..9e123e9839a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19892,6 +19892,7 @@ M:	Chris Packham <chris.packham@alliedtelesis.co.=
nz>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/realtek,rtl9300-i2c.yaml
+F:	drivers/i2c/busses/i2c-rtl9300.c
=20
 RTRS TRANSPORT DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index a22f9125322a..927b583002c7 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -1041,6 +1041,16 @@ config I2C_RK3X
 	  This driver can also be built as a module. If so, the module will
 	  be called i2c-rk3x.
=20
+config I2C_RTL9300
+	tristate "Realtek RTL9300 I2C controller"
+	depends on MACH_REALTEK_RTL || COMPILE_TEST
+	help
+	  Say Y here to include support for the I2C controller in Realtek
+	  RTL9300 SoCs.
+
+	  This driver can also be built as a module. If so, the module will
+	  be called i2c-rtl9300.
+
 config I2C_RZV2M
 	tristate "Renesas RZ/V2M adapter"
 	depends on ARCH_RENESAS || COMPILE_TEST
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 78d0561339e5..ac2f9f22803c 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -102,6 +102,7 @@ obj-$(CONFIG_I2C_QCOM_GENI)	+=3D i2c-qcom-geni.o
 obj-$(CONFIG_I2C_QUP)		+=3D i2c-qup.o
 obj-$(CONFIG_I2C_RIIC)		+=3D i2c-riic.o
 obj-$(CONFIG_I2C_RK3X)		+=3D i2c-rk3x.o
+obj-$(CONFIG_I2C_RTL9300)	+=3D i2c-rtl9300.o
 obj-$(CONFIG_I2C_RZV2M)		+=3D i2c-rzv2m.o
 obj-$(CONFIG_I2C_S3C2410)	+=3D i2c-s3c2410.o
 obj-$(CONFIG_I2C_SH7760)	+=3D i2c-sh7760.o
diff --git a/drivers/i2c/busses/i2c-rtl9300.c b/drivers/i2c/busses/i2c-rt=
l9300.c
new file mode 100644
index 000000000000..f16e9b6343bf
--- /dev/null
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -0,0 +1,377 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+struct rtl9300_i2c {
+	struct regmap *regmap;
+	struct device *dev;
+	struct i2c_adapter adap;
+	u32 i2c_mst_ofs;
+	u32 i2c_mst_glb_ofs;
+	u8 bus_freq;
+	u8 sda_pin;
+};
+
+#define I2C_MST_CTRL1		0x0
+#define  MEM_ADDR_OFS		8
+#define  MEM_ADDR_MASK		0xffffff
+#define  SDA_OUT_SEL_OFS	4
+#define  SDA_OUT_SEL_MASK	0x7
+#define  GPIO_SCL_SEL		BIT(3)
+#define  RWOP			BIT(2)
+#define  I2C_FAIL		BIT(1)
+#define  I2C_TRIG		BIT(0)
+#define I2C_MST_CTRL2		0x4
+#define  RD_MODE		BIT(15)
+#define  DEV_ADDR_OFS		8
+#define  DEV_ADDR_MASK		0x7f
+#define  DATA_WIDTH_OFS		4
+#define  DATA_WIDTH_MASK	0xf
+#define  MEM_ADDR_WIDTH_OFS	2
+#define  MEM_ADDR_WIDTH_MASK	0x3
+#define  SCL_FREQ_OFS		0
+#define  SCL_FREQ_MASK		0x3
+#define I2C_MST_DATA_WORD0	0x8
+#define I2C_MST_DATA_WORD1	0xc
+#define I2C_MST_DATA_WORD2	0x10
+#define I2C_MST_DATA_WORD3	0x14
+
+#define RTL9300_I2C_STD_FREQ		0
+#define RTL9300_I2C_FAST_FREQ		1
+
+DEFINE_MUTEX(i2c_lock);
+
+static int rtl9300_i2c_reg_addr_set(struct rtl9300_i2c *i2c, u32 reg, u1=
6 len)
+{
+	u32 val, mask;
+	int ret;
+
+	val =3D len << MEM_ADDR_WIDTH_OFS;
+	mask =3D MEM_ADDR_WIDTH_MASK << MEM_ADDR_WIDTH_OFS;
+
+	ret =3D regmap_update_bits(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_CTRL=
2, mask, val);
+	if (ret)
+		return ret;
+
+	val =3D reg << MEM_ADDR_OFS;
+	mask =3D MEM_ADDR_MASK << MEM_ADDR_OFS;
+
+	ret =3D regmap_update_bits(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_CTRL=
1, mask, val);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, u8 sda_pin)
+{
+	int ret;
+
+	ret =3D regmap_update_bits(i2c->regmap, i2c->i2c_mst_glb_ofs, BIT(sda_p=
in), BIT(sda_pin));
+	if (ret)
+		return ret;
+
+	ret =3D regmap_update_bits(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_CTRL=
1,
+				 (SDA_OUT_SEL_MASK << SDA_OUT_SEL_OFS) | GPIO_SCL_SEL,
+				 (sda_pin << SDA_OUT_SEL_OFS) | GPIO_SCL_SEL);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, u16 addr, u1=
6 len)
+{
+	u32 val, mask;
+
+	val =3D i2c->bus_freq << SCL_FREQ_OFS;
+	mask =3D SCL_FREQ_MASK << SCL_FREQ_OFS;
+
+	val |=3D addr << DEV_ADDR_OFS;
+	mask |=3D DEV_ADDR_MASK << DEV_ADDR_OFS;
+
+	val |=3D ((len - 1) & 0xf) << DATA_WIDTH_OFS;
+	mask |=3D DATA_WIDTH_MASK << DATA_WIDTH_OFS;
+
+	mask |=3D RD_MODE;
+
+	return regmap_update_bits(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_CTRL2=
, mask, val);
+}
+
+static int rtl9300_i2c_read(struct rtl9300_i2c *i2c, u8 *buf, int len)
+{
+	u32 vals[4] =3D {};
+	int i, ret;
+
+	if (len > 16)
+		return -EIO;
+
+	ret =3D regmap_bulk_read(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_DATA_W=
ORD0,
+			       vals, ARRAY_SIZE(vals));
+	if (ret)
+		return ret;
+
+	for (i =3D 0; i < len; i++) {
+		buf[i] =3D vals[i/4] & 0xff;
+		vals[i/4] >>=3D 8;
+	}
+
+	return len;
+}
+
+static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, int len)
+{
+	u32 vals[4] =3D {};
+	int i, ret;
+
+	if (len > 16)
+		return -EIO;
+
+	for (i =3D 0; i < len; i++) {
+		if (i % 4 =3D=3D 0)
+			vals[i/4] =3D 0;
+		vals[i/4] <<=3D 8;
+		vals[i/4] |=3D buf[i];
+	}
+
+	ret =3D regmap_bulk_write(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_DATA_=
WORD0,
+				vals, ARRAY_SIZE(vals));
+	if (ret)
+		return ret;
+
+	return len;
+}
+
+static int rtl9300_i2c_writel(struct rtl9300_i2c *i2c, u32 data)
+{
+	int ret;
+
+	ret =3D regmap_write(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_DATA_WORD0=
, data);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_w=
rite,
+				int size, union i2c_smbus_data *data, int len)
+{
+	u32 val, mask;
+	int ret;
+
+	if (read_write =3D=3D I2C_SMBUS_READ)
+		val =3D 0;
+	else
+		val =3D RWOP;
+	mask =3D RWOP;
+
+	val |=3D I2C_TRIG;
+	mask |=3D I2C_TRIG;
+
+	ret =3D regmap_update_bits(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_CTRL=
1, mask, val);
+	if (ret)
+		return ret;
+
+	ret =3D regmap_read_poll_timeout(i2c->regmap, i2c->i2c_mst_ofs + I2C_MS=
T_CTRL1,
+				       val, !(val & I2C_TRIG), 100, 2000);
+	if (ret)
+		return ret;
+
+	if (val & I2C_FAIL)
+		return -EIO;
+
+	if (read_write =3D=3D I2C_SMBUS_READ) {
+		if (size =3D=3D I2C_SMBUS_BYTE || size =3D=3D I2C_SMBUS_BYTE_DATA) {
+			ret =3D regmap_read(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_DATA_WORD=
0, &val);
+			if (ret)
+				return ret;
+			data->byte =3D val & 0xff;
+		} else if (size =3D=3D I2C_SMBUS_WORD_DATA) {
+			ret =3D regmap_read(i2c->regmap, i2c->i2c_mst_ofs + I2C_MST_DATA_WORD=
0, &val);
+			if (ret)
+				return ret;
+			data->word =3D val & 0xffff;
+		} else {
+			rtl9300_i2c_read(i2c, &data->block[0], len);
+		}
+	}
+
+	return 0;
+}
+
+static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr,
+		  unsigned short flags, char read_write,
+		  u8 command, int size, union i2c_smbus_data *data)
+{
+	struct rtl9300_i2c *i2c =3D i2c_get_adapdata(adap);
+	int len =3D 0, ret;
+
+	mutex_lock(&i2c_lock);
+	switch (size) {
+	case I2C_SMBUS_QUICK:
+		rtl9300_i2c_config_xfer(i2c, addr, 0);
+		rtl9300_i2c_reg_addr_set(i2c, 0, 0);
+		break;
+
+	case I2C_SMBUS_BYTE:
+		if (read_write =3D=3D I2C_SMBUS_WRITE) {
+			rtl9300_i2c_config_xfer(i2c, addr, 0);
+			rtl9300_i2c_reg_addr_set(i2c, command, 1);
+		} else {
+			rtl9300_i2c_config_xfer(i2c, addr, 1);
+			rtl9300_i2c_reg_addr_set(i2c, 0, 0);
+		}
+		break;
+
+	case I2C_SMBUS_BYTE_DATA:
+		rtl9300_i2c_reg_addr_set(i2c, command, 1);
+		rtl9300_i2c_config_xfer(i2c, addr, 1);
+		if (read_write =3D=3D I2C_SMBUS_WRITE)
+			rtl9300_i2c_writel(i2c, data->byte);
+		break;
+
+	case I2C_SMBUS_WORD_DATA:
+		rtl9300_i2c_reg_addr_set(i2c, command, 1);
+		rtl9300_i2c_config_xfer(i2c, addr, 2);
+		if (read_write =3D=3D I2C_SMBUS_WRITE)
+			rtl9300_i2c_writel(i2c, data->word);
+		break;
+
+	case I2C_SMBUS_BLOCK_DATA:
+		rtl9300_i2c_reg_addr_set(i2c, command, 1);
+		rtl9300_i2c_config_xfer(i2c, addr, data->block[0]);
+		if (read_write =3D=3D I2C_SMBUS_WRITE)
+			rtl9300_i2c_write(i2c, &data->block[1], data->block[0]);
+		len =3D data->block[0];
+		break;
+
+	default:
+		dev_warn(&adap->dev, "Unsupported transaction %d\n", size);
+		ret =3D -EOPNOTSUPP;
+		goto out_unlock;
+	}
+
+	ret =3D rtl9300_i2c_execute_xfer(i2c, read_write, size, data, len);
+
+out_unlock:
+	mutex_unlock(&i2c_lock);
+
+	return ret;
+}
+
+static u32 rtl9300_i2c_func(struct i2c_adapter *a)
+{
+	return I2C_FUNC_SMBUS_QUICK | I2C_FUNC_SMBUS_BYTE |
+	       I2C_FUNC_SMBUS_BYTE_DATA | I2C_FUNC_SMBUS_WORD_DATA |
+	       I2C_FUNC_SMBUS_BLOCK_DATA;
+}
+
+static const struct i2c_algorithm rtl9300_i2c_algo =3D {
+	.smbus_xfer	=3D rtl9300_i2c_smbus_xfer,
+	.functionality	=3D rtl9300_i2c_func,
+};
+
+struct i2c_adapter_quirks rtl9300_i2c_quirks =3D {
+	.flags		=3D I2C_AQ_NO_CLK_STRETCH,
+	.max_read_len	=3D 16,
+	.max_write_len	=3D 16,
+};
+
+static int rtl9300_i2c_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct rtl9300_i2c *i2c;
+	struct i2c_adapter *adap;
+	u32 clock_freq, sda_pin;
+	int ret;
+
+	i2c =3D devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->regmap =3D syscon_node_to_regmap(dev->parent->of_node);
+	if (IS_ERR(i2c->regmap))
+		return PTR_ERR(i2c->regmap);
+	i2c->dev =3D dev;
+
+	ret =3D device_property_read_u32(dev, "realtek,control-offset", &i2c->i=
2c_mst_ofs);
+	if (ret)
+		return ret;
+
+	ret =3D device_property_read_u32(dev, "realtek,global-control-offset", =
&i2c->i2c_mst_glb_ofs);
+	if (ret)
+		return ret;
+
+	ret =3D device_property_read_u32(dev, "clock-frequency", &clock_freq);
+	if (ret)
+		clock_freq =3D I2C_MAX_STANDARD_MODE_FREQ;
+
+	switch (clock_freq) {
+	case I2C_MAX_STANDARD_MODE_FREQ:
+		i2c->bus_freq =3D RTL9300_I2C_STD_FREQ;
+		break;
+
+	case I2C_MAX_FAST_MODE_FREQ:
+		i2c->bus_freq =3D RTL9300_I2C_FAST_FREQ;
+		break;
+	default:
+		dev_warn(i2c->dev, "clock-frequency %d not supported\n", clock_freq);
+		return -EINVAL;
+	}
+
+	ret =3D device_property_read_u32(dev, "realtek,sda-pin", &sda_pin);
+	if (ret)
+		sda_pin =3D 0;
+	i2c->sda_pin =3D sda_pin;
+
+	adap =3D &i2c->adap;
+	adap->owner =3D THIS_MODULE;
+	adap->algo =3D &rtl9300_i2c_algo;
+	adap->quirks =3D &rtl9300_i2c_quirks;
+	adap->retries =3D 3;
+	adap->dev.parent =3D dev;
+	i2c_set_adapdata(adap, i2c);
+	adap->dev.of_node =3D dev->of_node;
+	strscpy(adap->name, dev_name(dev), sizeof(adap->name));
+
+	platform_set_drvdata(pdev, i2c);
+
+	ret =3D rtl9300_i2c_config_io(i2c, i2c->sda_pin);
+	if (ret)
+		return ret;
+
+	return i2c_add_adapter(adap);
+}
+
+static void rtl9300_i2c_remove(struct platform_device *pdev)
+{
+	struct rtl9300_i2c *i2c =3D platform_get_drvdata(pdev);
+
+	i2c_del_adapter(&i2c->adap);
+}
+
+static const struct of_device_id i2c_rtl9300_dt_ids[] =3D {
+	{ .compatible =3D "realtek,rtl9300-i2c" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, i2c_rtl9300_dt_ids);
+
+static struct platform_driver rtl9300_i2c_driver =3D {
+	.probe =3D rtl9300_i2c_probe,
+	.remove =3D rtl9300_i2c_remove,
+	.driver =3D {
+		.name =3D "i2c-rtl9300",
+		.of_match_table =3D i2c_rtl9300_dt_ids,
+	},
+};
+
+module_platform_driver(rtl9300_i2c_driver);
+
+MODULE_DESCRIPTION("RTL9300 I2C controller driver");
+MODULE_LICENSE("GPL");
+
--=20
2.46.1


