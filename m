Return-Path: <linux-i2c+bounces-7012-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABCE986BAD
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 06:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 252521F2316C
	for <lists+linux-i2c@lfdr.de>; Thu, 26 Sep 2024 04:12:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EF0A17A906;
	Thu, 26 Sep 2024 04:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="wfBE3n19"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7F51714AA
	for <linux-i2c@vger.kernel.org>; Thu, 26 Sep 2024 04:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727323934; cv=none; b=obpT2e1hfq6ZTfyYATNI/aC2E4SkV6voi0Q9buwtF6gt0/425I9zkGvxvNRHXvfFdru10ENuPSyCsYkSYgrx1Pm51TbUuZCZk26Kv9SsznDoA1gU5hpnZK5zlQuTVYHfGlEGO5LhpyHp944Lfl8ox+f83Rc52sP0xgAmCbATJy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727323934; c=relaxed/simple;
	bh=TKRcBzd3OsJ4JvnjsWsRUp6cF/To5IFWvMQrkseKxV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glpPhqahLKV8TXiumhIMG/wQYzeuOHhsAzBQ78/Z5hZj2gqsW5Q+JycGP7hZ6lAPt+TbEs1WX1rTAi5nrP0brqtqR8jpUUlIfCgjhKmbqiq43HuOltF7dEnEDxM8cM4HA3e4UFzZLcXlk83OiacWaHhiOojlomXgPU2AzgCPvkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=wfBE3n19; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 574212C01C6;
	Thu, 26 Sep 2024 16:12:10 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1727323930;
	bh=+ZyIHgGWyL9JEql5dWkADjcuC71D4+rInjYRbYzngwo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=wfBE3n19BNVmryAscP4sA8t76rn6RcIHSW1sgbTI+FtYiNzFlNsh1gJOAjG4NHLvL
	 oEpy15j/3A5V1i0Q1uegbjAA5AqRmMnQZmvuK/eWYENbJQhUCtil8Az+sliDUiOsGh
	 fybPXGvPuGHqOFbp5kgoZeGOF4yjCjA6UYTpDT3nP4K6aP3jgQQ/JsIKuQZSUD0Wmu
	 yuFo3IP2paii1vXXrs0UMMIuwn4a2xMmGNoBH9wx8CiupDvT4/TlMIqgR/6S1dXnjP
	 1rO+7crfJR8DJbpmGqIohKZx+Yx+5Y9c0mnOqt+0UEGiad6lZ9+96ynZaMOPzJyUp1
	 VBOf+yjPrL7Cg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66f4df1a0000>; Thu, 26 Sep 2024 16:12:10 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 25C4013EE36;
	Thu, 26 Sep 2024 16:12:10 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 254512A3C0E; Thu, 26 Sep 2024 16:12:10 +1200 (NZST)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	aryan.srivastava@alliedtelesis.co.nz,
	Robert Richter <rric@kernel.org>
Subject: [PATCH v8 1/2] i2c: octeon: refactor common i2c operations
Date: Thu, 26 Sep 2024 16:12:01 +1200
Message-ID: <20240926041203.2850856-2-aryan.srivastava@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Id0kWnqa c=1 sm=1 tr=0 ts=66f4df1a a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=EaEq8P2WXUwA:10 a=A-Af6rZeaoc7pdqLdb8A:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Refactor the current implementation of the high-level composite read and
write operations in preparation of the addition of block-mode read/write
operations.

The sending of the i2c command is generic and will apply for both the
block-mode and non-block-mode ops. Extract this from the current hlc
ops, and place into a generic function, octeon_i2c_hlc_cmd_send.

The considerations made for extended addresses in the command
construction are almost common for all cases, extract these into
octeon_i2c_hlc_ext. There is one difference between the extended read
and write cases. When performing extended read or writes the SW_TWSI_EXT
must be written with an extended internal address, but the data field is
only filled in the write case (read back in read case). This results in
the original code block for the read case immediately writing this
register, while the write case fills in any data and then writes the
register. To create a common block of code for both processes remove the
SW_TWSI_EXT write from within the code block and instead in it's place a
variable is set, set_ext, which is returned and used as a condition to
do the register write, in the read command case.

There are parts of the commands construction which are common (only in
the read case), extract this and place into generic function
octeon_i2c_hlc_read_cmd. This function also reads the return from
octeon_i2c_hlc_ext and completes the write to SW_TWSI_EXT if required.

The write commands cannot be made entirely into common code as there are
distinct differences in the block mode and non-block-mode process.
Particularly the writing of data into the buffer.

Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-octeon-core.c | 86 ++++++++++++++++------------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2=
c-octeon-core.c
index 5b7b942141e7..a3af94055b41 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -498,6 +498,50 @@ static int octeon_i2c_hlc_write(struct octeon_i2c *i=
2c, struct i2c_msg *msgs)
 	return ret;
 }
=20
+/* Process hlc transaction */
+static int octeon_i2c_hlc_cmd_send(struct octeon_i2c *i2c, u64 cmd)
+{
+	octeon_i2c_hlc_int_clear(i2c);
+	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
+
+	return octeon_i2c_hlc_wait(i2c);
+}
+
+/* Generic consideration for extended internal addresses in i2c hlc r/w =
ops */
+static bool octeon_i2c_hlc_ext(struct octeon_i2c *i2c, struct i2c_msg ms=
g, u64 *cmd_in, u64 *ext)
+{
+	bool set_ext =3D false;
+	u64 cmd;
+
+	if (msg.flags & I2C_M_TEN)
+		cmd |=3D SW_TWSI_OP_10_IA;
+	else
+		cmd |=3D SW_TWSI_OP_7_IA;
+
+	if (msg.len =3D=3D 2) {
+		cmd |=3D SW_TWSI_EIA;
+		*ext =3D (u64)msg.buf[0] << SW_TWSI_IA_SHIFT;
+		cmd |=3D (u64)msg.buf[1] << SW_TWSI_IA_SHIFT;
+		set_ext =3D true;
+	} else {
+		cmd |=3D (u64)msg.buf[0] << SW_TWSI_IA_SHIFT;
+	}
+
+	*cmd_in |=3D cmd;
+	return set_ext;
+}
+
+/* Construct and send i2c transaction core cmd for read ops */
+static int octeon_i2c_hlc_read_cmd(struct octeon_i2c *i2c, struct i2c_ms=
g msg, u64 cmd)
+{
+	u64 ext =3D 0;
+
+	if (octeon_i2c_hlc_ext(i2c, msg, &cmd, &ext))
+		octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i=
2c));
+
+	return octeon_i2c_hlc_cmd_send(i2c, cmd);
+}
+
 /* high-level-controller composite write+read, msg0=3Daddr, msg1=3Ddata =
*/
 static int octeon_i2c_hlc_comp_read(struct octeon_i2c *i2c, struct i2c_m=
sg *msgs)
 {
@@ -512,26 +556,8 @@ static int octeon_i2c_hlc_comp_read(struct octeon_i2=
c *i2c, struct i2c_msg *msgs
 	/* A */
 	cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
=20
-	if (msgs[0].flags & I2C_M_TEN)
-		cmd |=3D SW_TWSI_OP_10_IA;
-	else
-		cmd |=3D SW_TWSI_OP_7_IA;
-
-	if (msgs[0].len =3D=3D 2) {
-		u64 ext =3D 0;
-
-		cmd |=3D SW_TWSI_EIA;
-		ext =3D (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
-		cmd |=3D (u64)msgs[0].buf[1] << SW_TWSI_IA_SHIFT;
-		octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i=
2c));
-	} else {
-		cmd |=3D (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
-	}
-
-	octeon_i2c_hlc_int_clear(i2c);
-	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
-
-	ret =3D octeon_i2c_hlc_wait(i2c);
+	/* Send core command */
+	ret =3D octeon_i2c_hlc_read_cmd(i2c, msgs[0], cmd);
 	if (ret)
 		goto err;
=20
@@ -567,19 +593,8 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i=
2c *i2c, struct i2c_msg *msg
 	/* A */
 	cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
=20
-	if (msgs[0].flags & I2C_M_TEN)
-		cmd |=3D SW_TWSI_OP_10_IA;
-	else
-		cmd |=3D SW_TWSI_OP_7_IA;
-
-	if (msgs[0].len =3D=3D 2) {
-		cmd |=3D SW_TWSI_EIA;
-		ext |=3D (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
-		set_ext =3D true;
-		cmd |=3D (u64)msgs[0].buf[1] << SW_TWSI_IA_SHIFT;
-	} else {
-		cmd |=3D (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
-	}
+	/* Set parameters for extended message (if required) */
+	set_ext =3D octeon_i2c_hlc_ext(i2c, msgs[0], &cmd, &ext);
=20
 	for (i =3D 0, j =3D msgs[1].len - 1; i  < msgs[1].len && i < 4; i++, j-=
-)
 		cmd |=3D (u64)msgs[1].buf[j] << (8 * i);
@@ -592,10 +607,7 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i=
2c *i2c, struct i2c_msg *msg
 	if (set_ext)
 		octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i=
2c));
=20
-	octeon_i2c_hlc_int_clear(i2c);
-	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
-
-	ret =3D octeon_i2c_hlc_wait(i2c);
+	ret =3D octeon_i2c_hlc_cmd_send(i2c, cmd);
 	if (ret)
 		goto err;
=20
--=20
2.46.0


