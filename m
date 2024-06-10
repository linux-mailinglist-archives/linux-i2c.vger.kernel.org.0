Return-Path: <linux-i2c+bounces-3933-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC1B901980
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 05:00:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A02A71F21B3F
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 03:00:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63591101D4;
	Mon, 10 Jun 2024 03:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="SV+6lMUh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2733C0C
	for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2024 03:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717988429; cv=none; b=oATQuEYwhc1L6roJDwl9O1m574pt5SqxkXOaLCvNycXblF9k6yPeI2D2kVjp7a3KLWKV5U16rUfWV+BRpZ4VPZbUprO//+h2wD+SZgW1GTO3oFSs6YeCrDJO9GFz4MLauO2CjsJmkABxmze53HZTgWCOrnCDvrdRQzD5oJLwhdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717988429; c=relaxed/simple;
	bh=ls8lVLZI/JhlfN+lgoyPul05RRsn+IGQbtKfefjyEOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fuU0M/yZJuzs/Eh8YFnBcSglezkM+DstnlfncCmRMntndTmTvEVzy2ZvRNXEi9pAGP0DI+BKbdyCH1U3jzmkxHaj94/1+6L2+9sA3GIIpSt9TyLsmHRvAruEQe3HOJp4m3KHP/qiKEHe4ws72lNtq4VW7xDcN4VCKVYNj+iu1v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=SV+6lMUh; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id A44322C08BD;
	Mon, 10 Jun 2024 15:00:24 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1717988424;
	bh=P+Uxl+bBGM3zIF9XJgAP57gt674Rp7XeAf9PcWUJgXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SV+6lMUhh8UdauBt/Iu3RBv6YEXLC1OhQhV6MiCzxLD7iR9ukVQhbunOgz1YroVnu
	 gG5LTCOEMWeTOty8HXmgMGtl2eioDKnD6Q63rtTRmPBl8HqMJvgJDuLEwQaaIMjb54
	 vH2FJ2+7yqdIqLPXrupHOEquHNonqU5yFR6Rh6s+7/0M3Me1ywTI8G84tI6Umrtgpc
	 nRazvhFNyWu9n5xI9zH/VrmWgkOLnM6UxHhOhO18JGQMy/jr16gVxlUV4wHWGB0aMi
	 A6+i3ZqN+BCjVxI6doUMvhmPKUfcrflVHpDaNbxMQ+MPg2+/o2qDmJI3GHYEoogv7g
	 HNP8kAWw5wgPg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66666c480000>; Mon, 10 Jun 2024 15:00:24 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 6ACCA13EE2B;
	Mon, 10 Jun 2024 15:00:24 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 688F72A2270; Mon, 10 Jun 2024 15:00:24 +1200 (NZST)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: andi.shyti@kernel.org
Cc: aryan.srivastava@alliedtelesis.co.nz,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] i2c: octeon: Add block-mode r/w operations
Date: Mon, 10 Jun 2024 14:59:55 +1200
Message-ID: <20240610025955.2308688-3-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610025955.2308688-1-aryan.srivastava@alliedtelesis.co.nz>
References: <20240610025955.2308688-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=F9L0dbhN c=1 sm=1 tr=0 ts=66666c48 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=_GL4yYo1NFTcpOcRNZkA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add functions to perform block r/w operations. This applies
for cases where the requested operation is for >8 bytes of data.

When not using the block mode transfer, the driver will attempt a
series 8 byte r/w operations until it reaches the desired total.
For example, for a 40 byte request the driver will complete 5
separate transactions. This results in large i2c transactions taking
significant time to process.

Add block mode r/w such that the driver can request larger transactions,
up to 1024 bytes in one transaction.

Many aspects of the block mode r/w is common with the regular 8 byte
r/w operations. Use generic functions for parts or the message
construction and sending the message. The key difference for the
block mode is the usage of separate FIFO buffer to store data.

Write to this buffer in the case of an i2c write (before command send).
Read from this buffer in the case of an i2c read (after command send).

Data is written into this buffer by placing data into the MSB onwards.
This means the bottom 8 bits of the r/w data will match the top 8 bits,
and so on and so forth.

Set specific bits in message for block mode, enable block mode transfers
from global i2c management registers, construct message, send message,
read or write from FIFO buffer as required.

The block-mode transactions result in a significant speed increase in
large i2c r/w requests.

Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-octeon-core.c     | 146 ++++++++++++++++++++++-
 drivers/i2c/busses/i2c-octeon-core.h     |  14 +++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   4 +
 3 files changed, 158 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2=
c-octeon-core.c
index 6772359ca6c8..03d30e179728 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -130,6 +130,25 @@ static void octeon_i2c_hlc_disable(struct octeon_i2c=
 *i2c)
 	octeon_i2c_ctl_write(i2c, TWSI_CTL_ENAB);
 }
=20
+static void octeon_i2c_block_enable(struct octeon_i2c *i2c)
+{
+	if (i2c->block_enabled || !TWSI_BLOCK_CTL(i2c))
+		return;
+
+	i2c->block_enabled =3D true;
+	octeon_i2c_writeq_flush(TWSI_MODE_STRETCH
+		| TWSI_MODE_BLOCK_MODE, i2c->twsi_base + TWSI_MODE(i2c));
+}
+
+static void octeon_i2c_block_disable(struct octeon_i2c *i2c)
+{
+	if (!i2c->block_enabled || !TWSI_BLOCK_CTL(i2c))
+		return;
+
+	i2c->block_enabled =3D false;
+	octeon_i2c_writeq_flush(TWSI_MODE_STRETCH, i2c->twsi_base + TWSI_MODE(i=
2c));
+}
+
 /**
  * octeon_i2c_hlc_wait - wait for an HLC operation to complete
  * @i2c: The struct octeon_i2c
@@ -268,6 +287,7 @@ static int octeon_i2c_start(struct octeon_i2c *i2c)
 	u8 stat;
=20
 	octeon_i2c_hlc_disable(i2c);
+	octeon_i2c_block_disable(i2c);
=20
 	octeon_i2c_ctl_write(i2c, TWSI_CTL_ENAB | TWSI_CTL_STA);
 	ret =3D octeon_i2c_wait(i2c);
@@ -606,6 +626,112 @@ static int octeon_i2c_hlc_comp_write(struct octeon_=
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
+	octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + TWSI_BLOCK_CTL(i2c=
));
+
+	/* Prepare core command */
+	cmd =3D SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR;
+	cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
+
+	/* Send core command */
+	ret =3D octeon_i2c_hlc_cmd(i2c, msgs[0], cmd);
+	if (ret)
+		return ret;
+
+	cmd =3D __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
+	if ((cmd & SW_TWSI_R) =3D=3D 0)
+		return octeon_i2c_check_status(i2c, false);
+
+	/* read data in FIFO */
+	octeon_i2c_writeq_flush(TWSI_BLOCK_STS_RESET_PTR, i2c->twsi_base + TWSI=
_BLOCK_STS(i2c));
+	for (int i =3D 0; i < len; i +=3D 8) {
+		u64 rd =3D __raw_readq(i2c->twsi_base + TWSI_BLOCK_FIFO(i2c));
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
+	octeon_i2c_writeq_flush((u64)(len), i2c->twsi_base + TWSI_BLOCK_CTL(i2c=
));
+
+	/* Prepare core command */
+	cmd =3D SW_TWSI_V | SW_TWSI_SOVR;
+	cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
+
+	/* Set parameters for extended message (if required) */
+	set_ext =3D octeon_i2c_hlc_ext(i2c, msgs[0], &cmd, &ext);
+
+	/* Write msg into FIFO buffer */
+	octeon_i2c_writeq_flush(TWSI_BLOCK_STS_RESET_PTR, i2c->twsi_base + TWSI=
_BLOCK_STS(i2c));
+	for (int i =3D 0; i < len; i +=3D 8) {
+		u64 buf =3D 0;
+		/* Place data from msg buf into FIFO, MSB onwards */
+		for (int j =3D 7; j >=3D 0; j--)
+			buf |=3D (msgs[1].buf[i + (7 - j)] << (8 * j));
+		octeon_i2c_writeq_flush(buf, i2c->twsi_base + TWSI_BLOCK_FIFO(i2c));
+	}
+	if (set_ext)
+		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
+
+	/* Send command to core (send data in FIFO) */
+	ret =3D octeon_i2c_hlc_cmd_send(i2c, cmd);
+	if (ret)
+		return ret;
+
+	cmd =3D __raw_readq(i2c->twsi_base + SW_TWSI(i2c));
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
@@ -631,13 +757,21 @@ int octeon_i2c_xfer(struct i2c_adapter *adap, struc=
t i2c_msg *msgs, int num)
 		if ((msgs[0].flags & I2C_M_RD) =3D=3D 0 &&
 		    (msgs[1].flags & I2C_M_RECV_LEN) =3D=3D 0 &&
 		    msgs[0].len > 0 && msgs[0].len <=3D 2 &&
-		    msgs[1].len > 0 && msgs[1].len <=3D 8 &&
+		    msgs[1].len > 0 &&
 		    msgs[0].addr =3D=3D msgs[1].addr) {
-			if (msgs[1].flags & I2C_M_RD)
-				ret =3D octeon_i2c_hlc_comp_read(i2c, msgs);
-			else
-				ret =3D octeon_i2c_hlc_comp_write(i2c, msgs);
-			goto out;
+			if (msgs[1].len <=3D 8) {
+				if (msgs[1].flags & I2C_M_RD)
+					ret =3D octeon_i2c_hlc_comp_read(i2c, msgs);
+				else
+					ret =3D octeon_i2c_hlc_comp_write(i2c, msgs);
+				goto out;
+			} else if (msgs[1].len <=3D 1024 && TWSI_BLOCK_CTL(i2c)) {
+				if (msgs[1].flags & I2C_M_RD)
+					ret =3D octeon_i2c_hlc_block_comp_read(i2c, msgs);
+				else
+					ret =3D octeon_i2c_hlc_block_comp_write(i2c, msgs);
+				goto out;
+			}
 		}
 	}
=20
diff --git a/drivers/i2c/busses/i2c-octeon-core.h b/drivers/i2c/busses/i2=
c-octeon-core.h
index 9bb9f64fdda0..81fcf413c890 100644
--- a/drivers/i2c/busses/i2c-octeon-core.h
+++ b/drivers/i2c/busses/i2c-octeon-core.h
@@ -85,6 +85,11 @@
 #define TWSI_INT_SDA		BIT_ULL(10)
 #define TWSI_INT_SCL		BIT_ULL(11)
=20
+#define TWSI_MODE_STRETCH		BIT_ULL(1)
+#define TWSI_MODE_BLOCK_MODE		BIT_ULL(2)
+
+#define TWSI_BLOCK_STS_RESET_PTR	BIT_ULL(0)
+#define TWSI_BLOCK_STS_BUSY		BIT_ULL(1)
 #define I2C_OCTEON_EVENT_WAIT 80 /* microseconds */
=20
 /* Register offsets */
@@ -92,11 +97,19 @@ struct octeon_i2c_reg_offset {
 	unsigned int sw_twsi;
 	unsigned int twsi_int;
 	unsigned int sw_twsi_ext;
+	unsigned int twsi_mode;
+	unsigned int twsi_block_ctl;
+	unsigned int twsi_block_sts;
+	unsigned int twsi_block_fifo;
 };
=20
 #define SW_TWSI(x)	(x->roff.sw_twsi)
 #define TWSI_INT(x)	(x->roff.twsi_int)
 #define SW_TWSI_EXT(x)	(x->roff.sw_twsi_ext)
+#define TWSI_MODE(x)	(x->roff.twsi_mode)
+#define TWSI_BLOCK_CTL(x)	(x->roff.twsi_block_ctl)
+#define TWSI_BLOCK_STS(x)	(x->roff.twsi_block_sts)
+#define TWSI_BLOCK_FIFO(x)	(x->roff.twsi_block_fifo)
=20
 struct octeon_i2c {
 	wait_queue_head_t queue;
@@ -110,6 +123,7 @@ struct octeon_i2c {
 	void __iomem *twsi_base;
 	struct device *dev;
 	bool hlc_enabled;
+	bool block_enabled;
 	bool broken_irq_mode;
 	bool broken_irq_check;
 	void (*int_enable)(struct octeon_i2c *);
diff --git a/drivers/i2c/busses/i2c-thunderx-pcidrv.c b/drivers/i2c/busse=
s/i2c-thunderx-pcidrv.c
index a77cd86fe75e..abde98117d7e 100644
--- a/drivers/i2c/busses/i2c-thunderx-pcidrv.c
+++ b/drivers/i2c/busses/i2c-thunderx-pcidrv.c
@@ -165,6 +165,10 @@ static int thunder_i2c_probe_pci(struct pci_dev *pde=
v,
 	i2c->roff.sw_twsi =3D 0x1000;
 	i2c->roff.twsi_int =3D 0x1010;
 	i2c->roff.sw_twsi_ext =3D 0x1018;
+	i2c->roff.twsi_mode =3D 0x1038;
+	i2c->roff.twsi_block_ctl =3D 0x1048;
+	i2c->roff.twsi_block_sts =3D 0x1050;
+	i2c->roff.twsi_block_fifo =3D 0x1058;
=20
 	i2c->dev =3D dev;
 	pci_set_drvdata(pdev, i2c);
--=20
2.43.2


