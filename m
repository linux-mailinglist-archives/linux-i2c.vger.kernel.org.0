Return-Path: <linux-i2c+bounces-7443-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D05739A16D4
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 02:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 540AC1F26437
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 00:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 615F143172;
	Thu, 17 Oct 2024 00:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="hHuBfu6K"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D97B669
	for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 00:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729124232; cv=none; b=W7CelC2CNFV39po6JM7zLdGC3JzZ49qrbLZLtPCB0pfrPMuxFtG2QyuKyDkp0seAbCAj4Z3ZHoLrTPL/CkDdDFuR+LFwZpvwdBC5sWsTM9+ohvZFVM3MLQ572wNGq1YDGJnUuISFnmUSA4xOyUC5v/2Zyeq81WNrs5Lt0/LuGSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729124232; c=relaxed/simple;
	bh=xetTUmATXX1WJ/xYgHGoT3UaWc/Nk8Vf+3wP73VWT1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCgpSfdJBLIzFebEoKEjt5D03QFbIAB1tIFx7DM4+9IRI0PKPw5iz/TyEe3j+vJLnrZsNKmb5mf8EQRVCqG1hLr09B6MtZMDn86n9GNCTKX7CW5FyW/MMK7t6ydN4ZWvbNSB/quWH8AJPPusPFDEbiG262clx0mCQdmtUdW484U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=hHuBfu6K; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DDE8E2C06C5;
	Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1729124217;
	bh=ZIzRfpgaNFVD84ON47c4UQLxFmbqS3MzeIZlMZuxvg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hHuBfu6KB1p4l53QoPvwgOtfnthLOcwsvoeZIrk+lvr/uoBBfQQMr6CTnt1F+0d+H
	 SYwXGJa7pcDir2qOKKao2G0o5la1/VSyBAPW7OsDCoiLgGeyEzbVP+6JerjLi7YIde
	 nWfzwiOftjlucw8XYiGnxgz+yNvbIif/eNvt4oes+wcKtOhg97wVv8HsRctg1EpjnH
	 Oupca57FfOGrzZwaa5HzReWcutQ1uKP5VBAiKeTl8Rxnt6cC0fBDDKl+CY8lcSy/51
	 mBS3HdpkzNuTLiNrsSM4ufVO6RzSAyfPK57mP4hK4tP1Dobl/23i9754Fo8AMyNYxF
	 zDrCiX3zpLyMQ==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B671057790006>; Thu, 17 Oct 2024 13:16:57 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 4207413EEA2;
	Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
	id 40AF52807F7; Thu, 17 Oct 2024 13:16:57 +1300 (NZDT)
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	sre@kernel.org,
	tsbogend@alpha.franken.de,
	markus.stockhausen@gmx.de
Cc: linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v7 6/6] i2c: Add driver for the RTL9300 I2C controller
Date: Thu, 17 Oct 2024 13:16:53 +1300
Message-ID: <20241017001653.178399-7-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241017001653.178399-1-chris.packham@alliedtelesis.co.nz>
References: <20241017001653.178399-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67105779 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=DAUX931o1VcA:10 a=jdP34snFAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=UgJECxHJAAAA:8 a=aaOI7ajaZ5fHE1syFM0A:9 a=3ZKOabzyN94A:10 a=jlphF6vWLdwq7oh3TaWq:22 a=-El7cUbtino8hM1DCn8D:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add support for the I2C controller on the RTL9300 SoC. There are two I2C
controllers in the RTL9300 that are part of the Ethernet switch register
block. Each of these controllers owns a SCL pin (GPIO8 for the fiorst
I2C controller, GPIO17 for the second). There are 8 possible SDA pins
(GPIO9-16) that can be assigned to either I2C controller. This
relationship is represented in the device tree with a child node for
each SDA line in use.

This is based on the openwrt implementation[1] but has been
significantly modified

[1] - https://git.openwrt.org/?p=3Dopenwrt/openwrt.git;a=3Dblob;f=3Dtarge=
t/linux/realtek/files-5.15/drivers/i2c/busses/i2c-rtl9300.c

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v7:
    - None
    Changes in v6:
    - Make rtl9300_i2c_quirks static
    - Drop wildcard compatible
    - Add SoC specific compatibles
    Changes in v5:
    - Make lock part of struct rtl9300_i2c
    - Fix alignment in rtl9300_i2c_smbus_xfer
    Changes in v4:
    - skipped due to combining patch series
    Changes in v3:
    - None
    Changes in v2:
    - Replace a number of return 0; with tail calls
    - Add enum rtl9300_bus_freq
    - Use RTL9300_ prefix on new defines
    - Use reg property for register offset
    - Hard code RTL9300_I2C_MST_GLB_CTRL address as this does not need to
      come from DT binding
    - Use GENMASK() where appropriate
    - Propagate read/write errors through to rtl9300_i2c_smbus_xfer()
    - Don't error out on bad clock-frequency
    - Use devm_i2c_add_adapter()
    - Put more information in the commit message
    - Integrated multiplexing function, an adapter is created per SDA lin=
e

 MAINTAINERS                      |   7 +
 drivers/i2c/busses/Kconfig       |  10 +
 drivers/i2c/busses/Makefile      |   1 +
 drivers/i2c/busses/i2c-rtl9300.c | 425 +++++++++++++++++++++++++++++++
 4 files changed, 443 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-rtl9300.c

diff --git a/MAINTAINERS b/MAINTAINERS
index f328373463b0..79c67e95a682 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19887,6 +19887,13 @@ S:	Maintained
 T:	git https://github.com/pkshih/rtw.git
 F:	drivers/net/wireless/realtek/rtl8xxxu/
=20
+RTL9300 I2C DRIVER (rtl9300-i2c)
+M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
+L:	linux-i2c@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
+F:	drivers/i2c/busses/i2c-rtl9300.c
+
 RTRS TRANSPORT DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
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
index 000000000000..cf3f322e45bd
--- /dev/null
+++ b/drivers/i2c/busses/i2c-rtl9300.c
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bits.h>
+#include <linux/i2c.h>
+#include <linux/i2c-mux.h>
+#include <linux/mod_devicetable.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+enum rtl9300_bus_freq {
+	RTL9300_I2C_STD_FREQ,
+	RTL9300_I2C_FAST_FREQ,
+};
+
+struct rtl9300_i2c;
+
+struct rtl9300_i2c_chan {
+	struct i2c_adapter adap;
+	struct rtl9300_i2c *i2c;
+	enum rtl9300_bus_freq bus_freq;
+	u8 sda_pin;
+};
+
+#define RTL9300_I2C_MUX_NCHAN	8
+
+struct rtl9300_i2c {
+	struct regmap *regmap;
+	struct device *dev;
+	struct rtl9300_i2c_chan chans[RTL9300_I2C_MUX_NCHAN];
+	u32 reg_base;
+	u8 sda_pin;
+	struct mutex lock;
+};
+
+#define RTL9300_I2C_MST_CTRL1			0x0
+#define  RTL9300_I2C_MST_CTRL1_MEM_ADDR_OFS	8
+#define  RTL9300_I2C_MST_CTRL1_MEM_ADDR_MASK	GENMASK(31, 8)
+#define  RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_OFS	4
+#define  RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_MASK	GENMASK(6, 4)
+#define  RTL9300_I2C_MST_CTRL1_GPIO_SCL_SEL	BIT(3)
+#define  RTL9300_I2C_MST_CTRL1_RWOP		BIT(2)
+#define  RTL9300_I2C_MST_CTRL1_I2C_FAIL		BIT(1)
+#define  RTL9300_I2C_MST_CTRL1_I2C_TRIG		BIT(0)
+#define RTL9300_I2C_MST_CTRL2			0x4
+#define  RTL9300_I2C_MST_CTRL2_RD_MODE		BIT(15)
+#define  RTL9300_I2C_MST_CTRL2_DEV_ADDR_OFS	8
+#define  RTL9300_I2C_MST_CTRL2_DEV_ADDR_MASK	GENMASK(14, 8)
+#define  RTL9300_I2C_MST_CTRL2_DATA_WIDTH_OFS	4
+#define  RTL9300_I2C_MST_CTRL2_DATA_WIDTH_MASK	GENMASK(7, 4)
+#define  RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_OFS	2
+#define  RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_MASK	GENMASK(3, 2)
+#define  RTL9300_I2C_MST_CTRL2_SCL_FREQ_OFS	0
+#define  RTL9300_I2C_MST_CTRL2_SCL_FREQ_MASK	GENMASK(1, 0)
+#define RTL9300_I2C_MST_DATA_WORD0		0x8
+#define RTL9300_I2C_MST_DATA_WORD1		0xc
+#define RTL9300_I2C_MST_DATA_WORD2		0x10
+#define RTL9300_I2C_MST_DATA_WORD3		0x14
+
+#define RTL9300_I2C_MST_GLB_CTRL  0x384
+
+static int rtl9300_i2c_reg_addr_set(struct rtl9300_i2c *i2c, u32 reg, u1=
6 len)
+{
+	u32 val, mask;
+	int ret;
+
+	val =3D len << RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_OFS;
+	mask =3D RTL9300_I2C_MST_CTRL2_MEM_ADDR_WIDTH_MASK;
+
+	ret =3D regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST=
_CTRL2, mask, val);
+	if (ret)
+		return ret;
+
+	val =3D reg << RTL9300_I2C_MST_CTRL1_MEM_ADDR_OFS;
+	mask =3D RTL9300_I2C_MST_CTRL1_MEM_ADDR_MASK;
+
+	return regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_=
CTRL1, mask, val);
+}
+
+static int rtl9300_i2c_config_io(struct rtl9300_i2c *i2c, u8 sda_pin)
+{
+	int ret;
+	u32 val, mask;
+
+	ret =3D regmap_update_bits(i2c->regmap, RTL9300_I2C_MST_GLB_CTRL, BIT(s=
da_pin), BIT(sda_pin));
+	if (ret)
+		return ret;
+
+	val =3D (sda_pin << RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_OFS) |
+		RTL9300_I2C_MST_CTRL1_GPIO_SCL_SEL;
+	mask =3D RTL9300_I2C_MST_CTRL1_SDA_OUT_SEL_MASK | RTL9300_I2C_MST_CTRL1=
_GPIO_SCL_SEL;
+
+	return regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_=
CTRL1, mask, val);
+}
+
+static int rtl9300_i2c_config_xfer(struct rtl9300_i2c *i2c, struct rtl93=
00_i2c_chan *chan,
+				   u16 addr, u16 len)
+{
+	u32 val, mask;
+
+	val =3D chan->bus_freq << RTL9300_I2C_MST_CTRL2_SCL_FREQ_OFS;
+	mask =3D RTL9300_I2C_MST_CTRL2_SCL_FREQ_MASK;
+
+	val |=3D addr << RTL9300_I2C_MST_CTRL2_DEV_ADDR_OFS;
+	mask |=3D RTL9300_I2C_MST_CTRL2_DEV_ADDR_MASK;
+
+	val |=3D ((len - 1) & 0xf) << RTL9300_I2C_MST_CTRL2_DATA_WIDTH_OFS;
+	mask |=3D RTL9300_I2C_MST_CTRL2_DATA_WIDTH_MASK;
+
+	mask |=3D RTL9300_I2C_MST_CTRL2_RD_MODE;
+
+	return regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_=
CTRL2, mask, val);
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
+	ret =3D regmap_bulk_read(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_D=
ATA_WORD0,
+			       vals, ARRAY_SIZE(vals));
+	if (ret)
+		return ret;
+
+	for (i =3D 0; i < len; i++) {
+		buf[i] =3D vals[i/4] & 0xff;
+		vals[i/4] >>=3D 8;
+	}
+
+	return 0;
+}
+
+static int rtl9300_i2c_write(struct rtl9300_i2c *i2c, u8 *buf, int len)
+{
+	u32 vals[4] =3D {};
+	int i;
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
+	return regmap_bulk_write(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_D=
ATA_WORD0,
+				vals, ARRAY_SIZE(vals));
+}
+
+static int rtl9300_i2c_writel(struct rtl9300_i2c *i2c, u32 data)
+{
+	return regmap_write(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST_DATA_W=
ORD0, data);
+}
+
+static int rtl9300_i2c_execute_xfer(struct rtl9300_i2c *i2c, char read_w=
rite,
+				int size, union i2c_smbus_data *data, int len)
+{
+	u32 val, mask;
+	int ret;
+
+	val =3D read_write =3D=3D I2C_SMBUS_WRITE ? RTL9300_I2C_MST_CTRL1_RWOP =
: 0;
+	mask =3D RTL9300_I2C_MST_CTRL1_RWOP;
+
+	val |=3D RTL9300_I2C_MST_CTRL1_I2C_TRIG;
+	mask |=3D RTL9300_I2C_MST_CTRL1_I2C_TRIG;
+
+	ret =3D regmap_update_bits(i2c->regmap, i2c->reg_base + RTL9300_I2C_MST=
_CTRL1, mask, val);
+	if (ret)
+		return ret;
+
+	ret =3D regmap_read_poll_timeout(i2c->regmap, i2c->reg_base + RTL9300_I=
2C_MST_CTRL1,
+				       val, !(val & RTL9300_I2C_MST_CTRL1_I2C_TRIG), 100, 2000);
+	if (ret)
+		return ret;
+
+	if (val & RTL9300_I2C_MST_CTRL1_I2C_FAIL)
+		return -EIO;
+
+	if (read_write =3D=3D I2C_SMBUS_READ) {
+		if (size =3D=3D I2C_SMBUS_BYTE || size =3D=3D I2C_SMBUS_BYTE_DATA) {
+			ret =3D regmap_read(i2c->regmap,
+					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
+			if (ret)
+				return ret;
+			data->byte =3D val & 0xff;
+		} else if (size =3D=3D I2C_SMBUS_WORD_DATA) {
+			ret =3D regmap_read(i2c->regmap,
+					  i2c->reg_base + RTL9300_I2C_MST_DATA_WORD0, &val);
+			if (ret)
+				return ret;
+			data->word =3D val & 0xffff;
+		} else {
+			ret =3D rtl9300_i2c_read(i2c, &data->block[0], len);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, un=
signed short flags,
+				  char read_write, u8 command, int size,
+				  union i2c_smbus_data *data)
+{
+	struct rtl9300_i2c_chan *chan =3D i2c_get_adapdata(adap);
+	struct rtl9300_i2c *i2c =3D chan->i2c;
+	int len =3D 0, ret;
+
+	mutex_lock(&i2c->lock);
+	if (chan->sda_pin !=3D i2c->sda_pin) {
+		ret =3D rtl9300_i2c_config_io(i2c, chan->sda_pin);
+		if (ret)
+			goto out_unlock;
+		i2c->sda_pin =3D chan->sda_pin;
+	}
+
+	switch (size) {
+	case I2C_SMBUS_QUICK:
+		ret =3D rtl9300_i2c_config_xfer(i2c, chan, addr, 0);
+		if (ret)
+			goto out_unlock;
+		ret =3D rtl9300_i2c_reg_addr_set(i2c, 0, 0);
+		if (ret)
+			goto out_unlock;
+		break;
+
+	case I2C_SMBUS_BYTE:
+		if (read_write =3D=3D I2C_SMBUS_WRITE) {
+			ret =3D rtl9300_i2c_config_xfer(i2c, chan, addr, 0);
+			if (ret)
+				goto out_unlock;
+			ret =3D rtl9300_i2c_reg_addr_set(i2c, command, 1);
+			if (ret)
+				goto out_unlock;
+		} else {
+			ret =3D rtl9300_i2c_config_xfer(i2c, chan, addr, 1);
+			if (ret)
+				goto out_unlock;
+			ret =3D rtl9300_i2c_reg_addr_set(i2c, 0, 0);
+			if (ret)
+				goto out_unlock;
+		}
+		break;
+
+	case I2C_SMBUS_BYTE_DATA:
+		ret =3D rtl9300_i2c_reg_addr_set(i2c, command, 1);
+		if (ret)
+			goto out_unlock;
+		ret =3D rtl9300_i2c_config_xfer(i2c, chan, addr, 1);
+		if (ret)
+			goto out_unlock;
+		if (read_write =3D=3D I2C_SMBUS_WRITE) {
+			ret =3D rtl9300_i2c_writel(i2c, data->byte);
+			if (ret)
+				goto out_unlock;
+		}
+		break;
+
+	case I2C_SMBUS_WORD_DATA:
+		ret =3D rtl9300_i2c_reg_addr_set(i2c, command, 1);
+		if (ret)
+			goto out_unlock;
+		ret =3D rtl9300_i2c_config_xfer(i2c, chan, addr, 2);
+		if (ret)
+			goto out_unlock;
+		if (read_write =3D=3D I2C_SMBUS_WRITE) {
+			ret =3D rtl9300_i2c_writel(i2c, data->word);
+			if (ret)
+				goto out_unlock;
+		}
+		break;
+
+	case I2C_SMBUS_BLOCK_DATA:
+		ret =3D rtl9300_i2c_reg_addr_set(i2c, command, 1);
+		if (ret)
+			goto out_unlock;
+		ret =3D rtl9300_i2c_config_xfer(i2c, chan, addr, data->block[0]);
+		if (ret)
+			goto out_unlock;
+		if (read_write =3D=3D I2C_SMBUS_WRITE) {
+			ret =3D rtl9300_i2c_write(i2c, &data->block[1], data->block[0]);
+			if (ret)
+				goto out_unlock;
+		}
+		len =3D data->block[0];
+		break;
+
+	default:
+		dev_err(&adap->dev, "Unsupported transaction %d\n", size);
+		ret =3D -EOPNOTSUPP;
+		goto out_unlock;
+	}
+
+	ret =3D rtl9300_i2c_execute_xfer(i2c, read_write, size, data, len);
+
+out_unlock:
+	mutex_unlock(&i2c->lock);
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
+static struct i2c_adapter_quirks rtl9300_i2c_quirks =3D {
+	.flags		=3D I2C_AQ_NO_CLK_STRETCH,
+	.max_read_len	=3D 16,
+	.max_write_len	=3D 16,
+};
+
+static int rtl9300_i2c_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct rtl9300_i2c_chan *chan;
+	struct rtl9300_i2c *i2c;
+	struct i2c_adapter *adap;
+	u32 clock_freq, sda_pin;
+	int ret, i =3D 0;
+	struct fwnode_handle *child;
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
+	mutex_init(&i2c->lock);
+
+	ret =3D device_property_read_u32(dev, "reg", &i2c->reg_base);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, i2c);
+
+	if (device_get_child_node_count(dev) >=3D RTL9300_I2C_MUX_NCHAN)
+		return dev_err_probe(dev, -EINVAL, "Too many channels\n");
+
+	device_for_each_child_node(dev, child) {
+		chan =3D &i2c->chans[i];
+		adap =3D &chan->adap;
+
+		ret =3D fwnode_property_read_u32(child, "reg", &sda_pin);
+		if (ret)
+			return ret;
+
+		ret =3D fwnode_property_read_u32(child, "clock-frequency", &clock_freq=
);
+		if (ret)
+			clock_freq =3D I2C_MAX_STANDARD_MODE_FREQ;
+
+		switch (clock_freq) {
+		case I2C_MAX_STANDARD_MODE_FREQ:
+			chan->bus_freq =3D RTL9300_I2C_STD_FREQ;
+			break;
+
+		case I2C_MAX_FAST_MODE_FREQ:
+			chan->bus_freq =3D RTL9300_I2C_FAST_FREQ;
+			break;
+		default:
+			dev_warn(i2c->dev, "SDA%d clock-frequency %d not supported using defa=
ult\n",
+				 sda_pin, clock_freq);
+			break;
+		}
+
+		chan->sda_pin =3D sda_pin;
+		chan->i2c =3D i2c;
+		adap =3D &i2c->chans[i].adap;
+		adap->owner =3D THIS_MODULE;
+		adap->algo =3D &rtl9300_i2c_algo;
+		adap->quirks =3D &rtl9300_i2c_quirks;
+		adap->retries =3D 3;
+		adap->dev.parent =3D dev;
+		i2c_set_adapdata(adap, chan);
+		adap->dev.of_node =3D to_of_node(child);
+		snprintf(adap->name, sizeof(adap->name), "%s SDA%d\n", dev_name(dev), =
sda_pin);
+		i++;
+
+		ret =3D devm_i2c_add_adapter(dev, adap);
+		if (ret)
+			return ret;
+	}
+	i2c->sda_pin =3D 0xff;
+
+	return 0;
+}
+
+static const struct of_device_id i2c_rtl9300_dt_ids[] =3D {
+	{ .compatible =3D "realtek,rtl9301-i2c" },
+	{ .compatible =3D "realtek,rtl9302b-i2c" },
+	{ .compatible =3D "realtek,rtl9302c-i2c" },
+	{ .compatible =3D "realtek,rtl9303-i2c" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, i2c_rtl9300_dt_ids);
+
+static struct platform_driver rtl9300_i2c_driver =3D {
+	.probe =3D rtl9300_i2c_probe,
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
--=20
2.47.0


