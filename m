Return-Path: <linux-i2c+bounces-4003-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D673C906227
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 04:54:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D4EE3B21DB6
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Jun 2024 02:54:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD88712D203;
	Thu, 13 Jun 2024 02:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="JHwAPIsB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291DD126F1D
	for <linux-i2c@vger.kernel.org>; Thu, 13 Jun 2024 02:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718247259; cv=none; b=ZNLdN64IAVvMREoohK0xOtGk5Wryrl+ycu2x90gk9L6Jy7QWPYJlrIIbxLvTEdhinJIo4eKTM02Tw44OEW6WJvNQXfu8/iGWr+LCz6ET5mCh7XnPWIZna2O2q2ib90fD/iFGwG17hRBjZkK0GXbstz7gL3nHojA6ZcsQq4MLlf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718247259; c=relaxed/simple;
	bh=hh1dptDgafzw7sDQeq3QkOAuKG4MFZcQiKoWQYOWYqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UUtStYu5GGsnUaID93uzCP/Dav5zZajYQxT/YzP71meaMf1dAgMYVmXK03/vanviwq7HzmD9r31uQt7viuvNegT3lfzkdPzqmX4MH4LtIPJljGkkFKwlO8I2tzdhREDrrx0caaNazLIJ3+Jwy0iBQKbOWd2fzuP0mgjOZQjdXlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=JHwAPIsB; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 5929A2C04C9;
	Thu, 13 Jun 2024 14:54:15 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1718247255;
	bh=KQSpoL/gBZiTOqoKkh+T2V82Nqs0vKqOwXVJZ858dR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JHwAPIsBEYrNxes4zbjOWym0Exh3H+ZjWXVIb8dcvHAAnN6HA0uws5mL3dn7gUerh
	 nudGftVf6UPawqc+/Lul94mHJUdP++X5L2Z3igANd+AdzTPFJis3m+zOneElvPmjee
	 ywH2o1GLgEs8dSrM7m0xAaeuKnzMQL/tcNC9lLm/uXvTqHldETe7Ehad/CreHntPxi
	 sEuqpwMgbwsEqFhwMH2yXCUpXO6E+wwKB9GAEU5HBojxSPyE/bI69UkXTKauUelHbr
	 O9gKykqwfUjUfyqdpkAfvKF+rzI7IUd2aDzyPNXZ1HvBv69/s1H5AgGYAH/Z0afKgT
	 ff0IbxziVau1A==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B666a5f570000>; Thu, 13 Jun 2024 14:54:15 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 2FCE913EDE9;
	Thu, 13 Jun 2024 14:54:15 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 2D3B72A2270; Thu, 13 Jun 2024 14:54:15 +1200 (NZST)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Robert Richter <rric@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] i2c: octeon: refactor hlc r/w operations
Date: Thu, 13 Jun 2024 14:54:10 +1200
Message-ID: <20240613025412.3848629-2-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240613025412.3848629-1-aryan.srivastava@alliedtelesis.co.nz>
References: <20240613025412.3848629-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=CvQccW4D c=1 sm=1 tr=0 ts=666a5f57 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=a7gkLlzbLAVbDXTTgMMA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Refactor the current implementation of the high-level composite read and
write operations in preparation of the addition of block-mode read/write
operations.

The sending of the i2c command is generic and will apply for both the
block-mode and non-block-mode R/W. Extract this from the current hlc
ops, and place into a generic function, octeon_i2c_hlc_cmd_send.

The considerations made for extended addresses in the command
construction are common for all r/w cases, extract these into
octeon_i2c_hlc_ext.

There are parts of the commands construction which are common (only in
the read case), extract this and place into generic function
octeon_i2c_hlc_read_cmd.

The write commands cannot be made entirely into common code as there are
distinct differences in the block mode and non-block-mode process.
Particularly the writing of data into the buffer.

Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-octeon-core.c | 86 ++++++++++++++++------------
 1 file changed, 49 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2=
c-octeon-core.c
index 845eda70b8ca..6772359ca6c8 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -485,6 +485,50 @@ static int octeon_i2c_hlc_write(struct octeon_i2c *i=
2c, struct i2c_msg *msgs)
 	return ret;
 }
=20
+/* Process hlc transaction */
+static int octeon_i2c_hlc_cmd_send(struct octeon_i2c *i2c, u64 cmd)
+{
+	octeon_i2c_hlc_int_clear(i2c);
+	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
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
+		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
+
+	return octeon_i2c_hlc_cmd_send(i2c, cmd);
+}
+
 /* high-level-controller composite write+read, msg0=3Daddr, msg1=3Ddata =
*/
 static int octeon_i2c_hlc_comp_read(struct octeon_i2c *i2c, struct i2c_m=
sg *msgs)
 {
@@ -499,26 +543,8 @@ static int octeon_i2c_hlc_comp_read(struct octeon_i2=
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
-		octeon_i2c_writeq_flush(ext, i2c->twsi_base + SW_TWSI_EXT(i2c));
-	} else {
-		cmd |=3D (u64)msgs[0].buf[0] << SW_TWSI_IA_SHIFT;
-	}
-
-	octeon_i2c_hlc_int_clear(i2c);
-	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + SW_TWSI(i2c));
-
-	ret =3D octeon_i2c_hlc_wait(i2c);
+	/* Send core command */
+	ret =3D octeon_i2c_hlc_cmd(i2c, msgs[0], cmd);
 	if (ret)
 		goto err;
=20
@@ -554,19 +580,8 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i=
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
@@ -579,10 +594,7 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i=
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
--=20
2.43.2


