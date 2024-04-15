Return-Path: <linux-i2c+bounces-2936-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2BA8A4665
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 02:52:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A6E6F1C213B3
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 00:52:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40064C7C;
	Mon, 15 Apr 2024 00:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="tqTW97c+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102D93D68
	for <linux-i2c@vger.kernel.org>; Mon, 15 Apr 2024 00:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713142353; cv=none; b=A8/fckc+LSQtSz9Kl5nH7fmrr9nHLRW8VmAelaxfYbWVxJb3Ni1YKSLFfvfS9f1FElWOqYJIv1AQYuK/GXvkjNeTMrQ13WVBLk3sKIWN5rSb8lAvE6jgh2eistxhmE6sY7s/CK/4etvHmIVQQ0bajasKrS9gBu4z7mSyojiZOzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713142353; c=relaxed/simple;
	bh=x8QuhzgQZpncS/DND0zG+7pb/T12A59Ohh01QtL7sDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpFYUBj3fVi5K+xFae7iLXcjVs3Y05WfPqPKVCRtMaAVYgQXcPJMxnAfkzQEoLmy2dAl7pl0L5gPZX+8uimIoAdpKTmf5zq8P+lDzILraiIFJaOCKvqA61e9qLsZQhNdpLM6Z0FdewmOrNvCcFcmpeGWJUGkpZ4p5m6yU8kfOu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=tqTW97c+; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AE2BD2C0240;
	Mon, 15 Apr 2024 12:52:26 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1713142346;
	bh=HdY0NeCX8eosOApuP6Ccr5tvaNQk2NJ05iaKCs7bg7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tqTW97c+OXmjPMJe/umojGrFxGwN2B/8no8xLOFLyZfOMKCixrPKeyYa47NrSDQGO
	 /bXFtlqf1cAcP1uZ07qtgSpXUVSOg8DoM5mhVrFnO3MYXX77RLH62fiUuiM5cDVbZw
	 Mg6Rn6zAk0stCsiaKjSdXQCpXjPzEkDTbPVdMyFwcOnU6jVt4NyTMoSzXGlpF5dfG2
	 k7LVZag2Y+h0Pc8ZTAcr2oxFRUfVAmMjuheiWotRCBUw+biheoPEKxGeOf6FpuhXl8
	 aE+s3RnEhlnX5/zoa2c9nQ/puNVOpm1piZDf7TT9a5VkCS2Vvs4RR48+Ve7aeKkrs0
	 fkrUrwT0UXUOg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B661c7a4a0000>; Mon, 15 Apr 2024 12:52:26 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 6943013ED0C;
	Mon, 15 Apr 2024 12:52:26 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 663C22A00BE; Mon, 15 Apr 2024 12:52:26 +1200 (NZST)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: andi.shyti@kernel.org
Cc: aryan.srivastava@alliedtelesis.co.nz,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4] i2c: octeon: Add block-mode r/w
Date: Mon, 15 Apr 2024 12:52:13 +1200
Message-ID: <20240415005213.3477671-1-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20230905102234.nlaeskxbbvu74co2@zenone.zhora.eu>
References: <20230905102234.nlaeskxbbvu74co2@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=dY4j3mXe c=1 sm=1 tr=0 ts=661c7a4a a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=raytVjVEu-sA:10 a=ypzmiDo2Z2DPeK6oHa8A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Add support for block mode read/write operations on
Thunderx chips.

When attempting r/w operations of greater then 8 bytes
block mode is used, instead of performing a series of
8 byte reads.

Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
Changes in v2:
- comment style and formatting.

Changes in v3:
- comment style and formatting.

Changes in v4:
- Refactoring common code.
- Additional comments.
---
 drivers/i2c/busses/i2c-octeon-core.c     | 196 +++++++++++++++++++----
 drivers/i2c/busses/i2c-octeon-core.h     |  14 ++
 drivers/i2c/busses/i2c-thunderx-pcidrv.c |   4 +
 3 files changed, 185 insertions(+), 29 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2=
c-octeon-core.c
index 845eda70b8ca..1ba4ac24b02a 100644
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
@@ -485,40 +505,53 @@ static int octeon_i2c_hlc_write(struct octeon_i2c *=
i2c, struct i2c_msg *msgs)
 	return ret;
 }
=20
-/* high-level-controller composite write+read, msg0=3Daddr, msg1=3Ddata =
*/
-static int octeon_i2c_hlc_comp_read(struct octeon_i2c *i2c, struct i2c_m=
sg *msgs)
+/* Process hlc transaction */
+static int octeon_i2c_hlc_cmd_send(struct octeon_i2c *i2c, u64 cmd)
 {
-	int i, j, ret =3D 0;
-	u64 cmd;
-
-	octeon_i2c_hlc_enable(i2c);
+	octeon_i2c_hlc_int_clear(i2c);
+	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
=20
-	cmd =3D SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR;
-	/* SIZE */
-	cmd |=3D (u64)(msgs[1].len - 1) << SW_TWSI_SIZE_SHIFT;
-	/* A */
-	cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
+	return octeon_i2c_hlc_wait(i2c);
+}
=20
-	if (msgs[0].flags & I2C_M_TEN)
+/* Construct and send i2c transaction core cmd */
+static int octeon_i2c_hlc_cmd(struct octeon_i2c *i2c, struct i2c_msg msg=
, u64 cmd)
+{
+	if (msg.flags & I2C_M_TEN)
 		cmd |=3D SW_TWSI_OP_10_IA;
 	else
 		cmd |=3D SW_TWSI_OP_7_IA;
=20
-	if (msgs[0].len =3D=3D 2) {
+	if (msg.len =3D=3D 2) {
 		u64 ext =3D 0;
=20
 		cmd |=3D SW_TWSI_EIA;
-		ext =3D (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
-		cmd |=3D (u64)msgs[0].buf[1] << SW_TWSI_IA_SHIFT;
+		ext =3D (u64)msg.buf[0] << SW_TWSI_IA_SHIFT;
+		cmd |=3D (u64)msg.buf[1] << SW_TWSI_IA_SHIFT;
 		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
 	} else {
-		cmd |=3D (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
+		cmd |=3D (u64)msg.buf[0] << SW_TWSI_IA_SHIFT;
 	}
=20
-	octeon_i2c_hlc_int_clear(i2c);
-	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
+	return octeon_i2c_hlc_cmd_send(i2c, cmd);
+}
=20
-	ret =3D octeon_i2c_hlc_wait(i2c);
+/* high-level-controller composite write+read, msg0=3Daddr, msg1=3Ddata =
*/
+static int octeon_i2c_hlc_comp_read(struct octeon_i2c *i2c, struct i2c_m=
sg *msgs)
+{
+	int i, j, ret =3D 0;
+	u64 cmd;
+
+	octeon_i2c_hlc_enable(i2c);
+
+	cmd =3D SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR;
+	/* SIZE */
+	cmd |=3D (u64)(msgs[1].len - 1) << SW_TWSI_SIZE_SHIFT;
+	/* A */
+	cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
+
+	/* Send core command */
+	ret =3D octeon_i2c_hlc_cmd(i2c, msgs[0], cmd);
 	if (ret)
 		goto err;
=20
@@ -579,10 +612,7 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i=
2c *i2c, struct i2c_msg *msg
 	if (set_ext)
 		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
=20
-	octeon_i2c_hlc_int_clear(i2c);
-	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
-
-	ret =3D octeon_i2c_hlc_wait(i2c);
+	ret =3D octeon_i2c_hlc_cmd_send(i2c, cmd);
 	if (ret)
 		goto err;
=20
@@ -594,6 +624,106 @@ static int octeon_i2c_hlc_comp_write(struct octeon_=
i2c *i2c, struct i2c_msg *msg
 	return ret;
 }
=20
+/**
+ * high-level-controller composite block write+read, msg0=3Daddr, msg1=3D=
data
+ * Used in the case where the i2c xfer is for greater than 8 bytes of re=
ad data.
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
+		for (int j =3D 7; j >=3D 0; j--)
+			msgs[1].buf[i + (7 - j)] =3D (rd >> (8 * j)) & 0xff;
+	}
+
+	octeon_i2c_block_disable(i2c);
+	return ret;
+}
+
+/**
+ * high-level-controller composite block write+write, m[0]len<=3D2, m[1]=
len<=3D1024
+ * Used in the case where the i2c xfer is for greater than 8 bytes of wr=
ite data.
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
+	if (msgs[0].flags & I2C_M_TEN)
+		cmd |=3D SW_TWSI_OP_10_IA;
+	else
+		cmd |=3D SW_TWSI_OP_7_IA;
+
+	if (msgs[0].len =3D=3D 2) {
+		cmd |=3D SW_TWSI_EIA;
+		ext |=3D (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
+		set_ext =3D true;
+		cmd |=3D (u64)msgs[0].buf[1] << SW_TWSI_IA_SHIFT;
+	} else {
+		cmd |=3D (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
+	}
+
+	/* Write msg into FIFO buffer */
+	octeon_i2c_writeq_flush(TWSI_BLOCK_STS_RESET_PTR, i2c->twsi_base + TWSI=
_BLOCK_STS(i2c));
+	for (int i =3D 0; i < len; i +=3D 8) {
+		u64 buf =3D 0;
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
@@ -619,13 +749,21 @@ int octeon_i2c_xfer(struct i2c_adapter *adap, struc=
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


