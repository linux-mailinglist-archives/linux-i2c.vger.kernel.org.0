Return-Path: <linux-i2c+bounces-9136-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7249A16568
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2025 03:33:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6D613A75BF
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2025 02:33:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 292BD12D1F1;
	Mon, 20 Jan 2025 02:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="rfK7zr4w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F0F179BF
	for <linux-i2c@vger.kernel.org>; Mon, 20 Jan 2025 02:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737340420; cv=none; b=gk+xZGEKmjgGenDAiZhb7AeDsegBOjZJBW1GynP7c51/s4ysi7WjAs7SVDbjpJOPjkvVE+Jn2HJSjDLEQSGJ7S351zHXpKgP9kaRAg6reoUuEs/Ku9phjACzE6f7ZAZh+azWyjfdAQ5GB9VmfkkHnF+XvwiTv2CRIuB87tDkFwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737340420; c=relaxed/simple;
	bh=wuWJImjGwTNXGADmNrp0Z6q6D+BX1M6VB6xPHmkFaYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oMnBeh6rCleEPu6kh5GhC497JXONYicMQOqPETWeUKk0yWuI+9qcjO9j31wC0evwsztxQi52e9LdHxZe/IfCmXddm7QJIb5/mmyeGNgSm88StNj0QQYZ/4ZpcM1Y1wjnCm4OoyifzvGRz/OlpP023OueYBoTeB3kgjjysn0D8vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=rfK7zr4w; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CCDB02C083A;
	Mon, 20 Jan 2025 15:33:36 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1737340416;
	bh=8qAM5qvVN4+U9EO1+ZpCC0NnaqB8X6lgAM8A5xkUcuw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rfK7zr4wzgxu7b7lCTbL9f9Q/3NJDAKHuZl2mnI5QuhaZQmzmkfvOk6XLimhajnJU
	 erRp6K7xr2IexM3TUzpl69cD5KwTOgWwRnmO1y0NZfY8UAuGzWD8ekr/RsFjhOfsk6
	 BPmDKRi5k1DhhHZYM1JouVcTKNNwmUwKZDNiPVmjDVL5HaeypAni8ou3e49DMp5hFs
	 5WJUNGi751iBgQ75PUnmlUrDlSZwaDb+sv1SCNEq9shzJn4viwupWKj/YBu818DZrI
	 NMp/orRau7qsszobz/gpUpSU1Qz+hsE2dkMIkPFbmjRyn3oRXpR4dHOXGR4IgbkA6N
	 ACv55lLNADQ5g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B678db5fd0000>; Mon, 20 Jan 2025 15:33:33 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id B469213EE2B;
	Mon, 20 Jan 2025 15:33:33 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id B1D942A1696; Mon, 20 Jan 2025 15:33:33 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Robert Richter <rric@kernel.org>
Subject: [PATCH v11 1/2] i2c: octeon: refactor common i2c operations
Date: Mon, 20 Jan 2025 15:33:26 +1300
Message-ID: <20250120023327.2347863-2-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120023327.2347863-1-aryan.srivastava@alliedtelesis.co.nz>
References: <20250120023327.2347863-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=BNQQr0QG c=1 sm=1 tr=0 ts=678db5fe a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=VdSt8ZQiCzkA:10 a=A-Af6rZeaoc7pdqLdb8A:9 a=3ZKOabzyN94A:10
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
index 16cc34a0526e..3fbc828508ab 100644
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
+	u64 cmd =3D 0;
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
2.47.1


