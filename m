Return-Path: <linux-i2c+bounces-7013-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB47986BAF
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 06:12:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A5E3B21A9F
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 04:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B039E17C7C3;
	Thu, 26 Sep 2024 04:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="Syd+RJST"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF27178CD9
	for <linux-i2c@vger.kernel.org>; Thu, 26 Sep 2024 04:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727323935; cv=none; b=FxTL5kM2h9UAO3V4FG0Jg2fKlR+kcKO0+X2pft+nhRGt/sDKAB/sHQe0Ppop8NtfK9FKaps6jUdPqDkbG/uVS0BhAxKLDpStFI6DeqUZKidl1VXratO/ZliaNUBrjd+Vr+ysIUn04MlkZg7w3lq4wwOSN4L8eFYAhb72Qw7M/n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727323935; c=relaxed/simple;
	bh=i0OrCEpGr1O+C7G/wVrCcenkxJ9fbLr0ptMPwouEatI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NdyaQPjsNyS1QsXYJn/N4j9ehgT8GlEX/A1rJmUtmo/0meN8dyKZK0Nm3foNXgXbj722J5v3l5KUz9PpOrhaf2QcETD1D5qHUnCnd0KDTn3oUwr/yDtJ4NEMSOvRboHbpGD5omOcHrEsYWwA2zNQfK1LdvjLlSMYbENJIJUBgMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=Syd+RJST; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 61CCD2C035A;
	Thu, 26 Sep 2024 16:12:12 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727323932;
	bh=wIsgXArYnNh+GVtYzuYg1faJB5SeDpS8547FXN93QNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Syd+RJSTFuW3CsvFYcTUOeu/vSiV8PaMok/HJDRtycVttICamp+7xgZZha+f6v2dV
	 aMNnKzXUqIIpR8ljx8jjXLMivCZAewUtPvRfVCkOH6WUPQu4q0iz8e8FM5G2MfpRmS
	 uQfDoCcv0p8sJBmmmDFuPFuQhoAj0vnC23O0NBvM5dxaX9jttsP03Je7qYST6pyAUo
	 fpwNZ9ngJbUQzuRS2YC/nhwCWaOFZJ5MmcpsNx4BegvMGPJxOrcmp/ovUMur7F1wr+
	 KbmGS4LBOOHsQfeZ9HHaHtecDG1sb2Oz8EohEkyPIuaCR3KOGVu/LYx+yh400pSkzI
	 34dlh7hOTPfig==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f4df1c0000>; Thu, 26 Sep 2024 16:12:12 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 2934413EE36;
	Thu, 26 Sep 2024 16:12:12 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 290B02A3C0E; Thu, 26 Sep 2024 16:12:12 +1200 (NZST)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aryan.srivastava@alliedtelesis.co.nz,
	Robert Richter <rric@kernel.org>
Subject: [PATCH v8 2/2] i2c: octeon: Add block-mode i2c operations
Date: Thu, 26 Sep 2024 16:12:02 +1200
Message-ID: <20240926041203.2850856-3-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240926041203.2850856-1-aryan.srivastava@alliedtelesis.co.nz>
References: <20240926041203.2850856-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f4df1c a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=_GL4yYo1NFTcpOcRNZkA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add functions to perform block read and write operations. This applies
for cases where the requested operation is for >8 bytes of data.

When not using the block mode transfer, the driver will attempt a series
of 8 byte i2c operations until it reaches the desired total. For
example, for a 40 byte request the driver will complete 5 separate
transactions. This results in large transactions taking a significant
amount of time to process.

Add block mode such that the driver can request larger transactions, up
to 1024 bytes per transfer.

Many aspects of the block mode transfer is common with the regular 8
byte operations. Use generic functions for parts of the message
construction and sending the message. The key difference for the block
mode is the usage of separate FIFO buffer to store data.

Write to this buffer in the case of a write (before command send).
Read from this buffer in the case of a read (after command send).

Data is written into this buffer by placing data into the MSB onwards.
This means the bottom 8 bits of the data will match the top 8 bits, and
so on and so forth.

Set specific bits in message for block mode, enable block mode transfers
from global i2c management registers, construct message, send message,
read or write from FIFO buffer as required.

The block-mode transactions result in a significant speed increase in
large i2c requests.

Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-octeon-core.c     | 155 ++++++++++++++++++++++-
 drivers/i2c/busses/i2c-octeon-core.h     |  13 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   3 +
 3 files changed, 164 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2=
c-octeon-core.c
index a3af94055b41..51ee2bc0b1a5 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -135,6 +135,32 @@ static void octeon_i2c_hlc_disable(struct octeon_i2c=
 *i2c)
 	octeon_i2c_ctl_write(i2c, TWSI_CTL_ENAB);
 }
=20
+static void octeon_i2c_block_enable(struct octeon_i2c *i2c)
+{
+	u64 mode;
+
+	if (i2c->block_enabled || !OCTEON_REG_BLOCK_CTL(i2c))
+		return;
+
+	i2c->block_enabled =3D true;
+	mode =3D __raw_readq(i2c->twsi_base + OCTEON_REG_MODE(i2c));
+	mode |=3D TWSX_MODE_BLOCK_MODE;
+	octeon_i2c_writeq_flush(mode, i2c->twsi_base + OCTEON_REG_MODE(i2c));
+}
+
+static void octeon_i2c_block_disable(struct octeon_i2c *i2c)
+{
+	u64 mode;
+
+	if (!i2c->block_enabled || !OCTEON_REG_BLOCK_CTL(i2c))
+		return;
+
+	i2c->block_enabled =3D false;
+	mode =3D __raw_readq(i2c->twsi_base + OCTEON_REG_MODE(i2c));
+	mode &=3D ~TWSX_MODE_BLOCK_MODE;
+	octeon_i2c_writeq_flush(mode, i2c->twsi_base + OCTEON_REG_MODE(i2c));
+}
+
 /**
  * octeon_i2c_hlc_wait - wait for an HLC operation to complete
  * @i2c: The struct octeon_i2c
@@ -281,6 +307,7 @@ static int octeon_i2c_start(struct octeon_i2c *i2c)
 	u8 stat;
=20
 	octeon_i2c_hlc_disable(i2c);
+	octeon_i2c_block_disable(i2c);
=20
 	octeon_i2c_ctl_write(i2c, TWSI_CTL_ENAB | TWSI_CTL_STA);
 	ret =3D octeon_i2c_wait(i2c);
@@ -619,6 +646,114 @@ static int octeon_i2c_hlc_comp_write(struct octeon_=
i2c *i2c, struct i2c_msg *msg
 	return ret;
 }
=20
+/**
+ * octeon_i2c_hlc_block_comp_read - high-level-controller composite bloc=
k read
+ * @i2c: The struct octeon_i2c
+ * @msgs: msg[0] contains address, place read data into msg[1]
+ *
+ * i2c core command is constructed and written into the SW_TWSI register=
.
+ * The execution of the command will result in requested data being
+ * placed into a FIFO buffer, ready to be read.
+ * Used in the case where the i2c xfer is for greater than 8 bytes of re=
ad data.
+ *
+ * Returns 0 on success, otherwise a negative errno.
+ */
+static int octeon_i2c_hlc_block_comp_read(struct octeon_i2c *i2c, struct=
 i2c_msg *msgs)
+{
+	int len, ret =3D 0;
+	u64 cmd =3D 0;
+
+	octeon_i2c_hlc_enable(i2c);
+	octeon_i2c_block_enable(i2c);
+
+	/* Write (size - 1) into block control register */
+	len =3D msgs[1].len - 1;
+	octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + OCTEON_REG_BLOCK_C=
TL(i2c));
+
+	/* Prepare core command */
+	cmd =3D SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR;
+	cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
+
+	/* Send core command */
+	ret =3D octeon_i2c_hlc_read_cmd(i2c, msgs[0], cmd);
+	if (ret)
+		return ret;
+
+	cmd =3D __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
+	if ((cmd & SW_TWSI_R) =3D=3D 0)
+		return octeon_i2c_check_status(i2c, false);
+
+	/* read data in FIFO */
+	octeon_i2c_writeq_flush(TWSX_BLOCK_STS_RESET_PTR,
+				i2c->twsi_base + OCTEON_REG_BLOCK_STS(i2c));
+	for (int i =3D 0; i < len; i +=3D 8) {
+		u64 rd =3D __raw_readq(i2c->twsi_base + OCTEON_REG_BLOCK_FIFO(i2c));
+		/* Place data into msg buf from FIFO, MSB onwards */
+		for (int j =3D 7; j >=3D 0; j--)
+			msgs[1].buf[i + (7 - j)] =3D (rd >> (8 * j)) & 0xff;
+	}
+
+	octeon_i2c_block_disable(i2c);
+	return ret;
+}
+
+/**
+ * octeon_i2c_hlc_block_comp_write - high-level-controller composite blo=
ck write
+ * @i2c: The struct octeon_i2c
+ * @msgs: msg[0] contains address, msg[1] contains data to be written
+ *
+ * i2c core command is constructed and write data is written into the FI=
FO buffer.
+ * The execution of the command will result in HW write, using the data =
in FIFO.
+ * Used in the case where the i2c xfer is for greater than 8 bytes of wr=
ite data.
+ *
+ * Returns 0 on success, otherwise a negative errno.
+ */
+static int octeon_i2c_hlc_block_comp_write(struct octeon_i2c *i2c, struc=
t i2c_msg *msgs)
+{
+	bool set_ext =3D false;
+	int len, ret =3D 0;
+	u64 cmd, ext =3D 0;
+
+	octeon_i2c_hlc_enable(i2c);
+	octeon_i2c_block_enable(i2c);
+
+	/* Write (size - 1) into block control register */
+	len =3D msgs[1].len - 1;
+	octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + OCTEON_REG_BLOCK_C=
TL(i2c));
+
+	/* Prepare core command */
+	cmd =3D SW_TWSI_V | SW_TWSI_SOVR;
+	cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
+
+	/* Set parameters for extended message (if required) */
+	set_ext =3D octeon_i2c_hlc_ext(i2c, msgs[0], &cmd, &ext);
+
+	/* Write msg into FIFO buffer */
+	octeon_i2c_writeq_flush(TWSX_BLOCK_STS_RESET_PTR,
+				i2c->twsi_base + OCTEON_REG_BLOCK_STS(i2c));
+	for (int i =3D 0; i < len; i +=3D 8) {
+		u64 buf =3D 0;
+		/* Place data from msg buf into FIFO, MSB onwards */
+		for (int j =3D 7; j >=3D 0; j--)
+			buf |=3D (msgs[1].buf[i + (7 - j)] << (8 * j));
+		octeon_i2c_writeq_flush(buf, i2c->twsi_base + OCTEON_REG_BLOCK_FIFO(i2=
c));
+	}
+	if (set_ext)
+		octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i=
2c));
+
+	/* Send command to core (send data in FIFO) */
+	ret =3D octeon_i2c_hlc_cmd_send(i2c, cmd);
+	if (ret)
+		return ret;
+
+	cmd =3D __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
+	if ((cmd & SW_TWSI_R) =3D=3D 0)
+		return octeon_i2c_check_status(i2c, false);
+
+	octeon_i2c_block_disable(i2c);
+	return ret;
+}
+
 /**
  * octeon_i2c_xfer - The driver's master_xfer function
  * @adap: Pointer to the i2c_adapter structure
@@ -645,13 +780,21 @@ int octeon_i2c_xfer(struct i2c_adapter *adap, struc=
t i2c_msg *msgs, int num)
 			if ((msgs[0].flags & I2C_M_RD) =3D=3D 0 &&
 			    (msgs[1].flags & I2C_M_RECV_LEN) =3D=3D 0 &&
 			    msgs[0].len > 0 && msgs[0].len <=3D 2 &&
-			    msgs[1].len > 0 && msgs[1].len <=3D 8 &&
+			    msgs[1].len > 0 &&
 			    msgs[0].addr =3D=3D msgs[1].addr) {
-				if (msgs[1].flags & I2C_M_RD)
-					ret =3D octeon_i2c_hlc_comp_read(i2c, msgs);
-				else
-					ret =3D octeon_i2c_hlc_comp_write(i2c, msgs);
-				goto out;
+				if (msgs[1].len <=3D 8) {
+					if (msgs[1].flags & I2C_M_RD)
+						ret =3D octeon_i2c_hlc_comp_read(i2c, msgs);
+					else
+						ret =3D octeon_i2c_hlc_comp_write(i2c, msgs);
+					goto out;
+				} else if (msgs[1].len <=3D 1024 && OCTEON_REG_BLOCK_CTL(i2c)) {
+					if (msgs[1].flags & I2C_M_RD)
+						ret =3D octeon_i2c_hlc_block_comp_read(i2c, msgs);
+					else
+						ret =3D octeon_i2c_hlc_block_comp_write(i2c, msgs);
+					goto out;
+				}
 			}
 		}
 	}
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2=
c-octeon-core.h
index 7af01864da75..ea78c2a01fcd 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -96,18 +96,28 @@ struct octeon_i2c_reg_offset {
 	unsigned int twsi_int;
 	unsigned int sw_twsi_ext;
 	unsigned int mode;
+	unsigned int block_ctl;
+	unsigned int block_sts;
+	unsigned int block_fifo;
 };
=20
 #define OCTEON_REG_SW_TWSI(x)		((x)->roff.sw_twsi)
 #define OCTEON_REG_TWSI_INT(x)		((x)->roff.twsi_int)
 #define OCTEON_REG_SW_TWSI_EXT(x)	((x)->roff.sw_twsi_ext)
 #define OCTEON_REG_MODE(x)		((x)->roff.mode)
+#define OCTEON_REG_BLOCK_CTL(x)	(x->roff.block_ctl)
+#define OCTEON_REG_BLOCK_STS(x)	(x->roff.block_sts)
+#define OCTEON_REG_BLOCK_FIFO(x)	(x->roff.block_fifo)
=20
-/* Set REFCLK_SRC and HS_MODE in TWSX_MODE register */
+/* TWSX_MODE register */
 #define TWSX_MODE_REFCLK_SRC	BIT(4)
+#define TWSX_MODE_BLOCK_MODE		BIT(2)
 #define TWSX_MODE_HS_MODE	BIT(0)
 #define TWSX_MODE_HS_MASK	(TWSX_MODE_REFCLK_SRC | TWSX_MODE_HS_MODE)
=20
+/* TWSX_BLOCK_STS register */
+#define TWSX_BLOCK_STS_RESET_PTR	BIT(0)
+
 /* Set BUS_MON_RST to reset bus monitor */
 #define BUS_MON_RST_MASK	BIT(3)
=20
@@ -123,6 +133,7 @@ struct octeon_i2c {
 	void __iomem *twsi_base;
 	struct device *dev;
 	bool hlc_enabled;
+	bool block_enabled;
 	bool broken_irq_mode;
 	bool broken_irq_check;
 	void (*int_enable)(struct octeon_i2c *);
diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busse=
s/i2c-thunderx-pcidrv.c
index 32d0e3930b67..1f40b56e6bc0 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -168,6 +168,9 @@ static int thunder_i2c_probe_pci(struct pci_dev *pdev=
,
 	i2c->roff.twsi_int =3D 0x1010;
 	i2c->roff.sw_twsi_ext =3D 0x1018;
 	i2c->roff.mode =3D 0x1038;
+	i2c->roff.block_ctl =3D 0x1048;
+	i2c->roff.block_sts =3D 0x1050;
+	i2c->roff.block_fifo =3D 0x1058;
=20
 	i2c->dev =3D dev;
 	pci_set_drvdata(pdev, i2c);
--=20
2.46.0


