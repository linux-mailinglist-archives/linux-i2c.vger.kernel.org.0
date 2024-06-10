Return-Path: <linux-i2c+bounces-3932-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98290197D
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 05:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5376B1F21BE1
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 03:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CD16AB6;
	Mon, 10 Jun 2024 03:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="MN2w66A6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6EFBA2F
	for <linux-i2c@vger.kernel.org>; Mon, 10 Jun 2024 03:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717988426; cv=none; b=cB4iuQBh3FZgwW1Lv5VzgtXMTyps4ILiaQGWXvM5s/svJieN5C9gnhRJn0UEBoZiXQE/E0koBtBZ8HAIdxnnN8RYT06LLGTzSB3lK5IUZtJMLhzxUCGjdvTeMKfSjU+zq4yL5KPusTzigtNbqRM5bZvrueSpA9JajrDdoeVExok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717988426; c=relaxed/simple;
	bh=M6MOKtoJjmhfcp13s5cKdG6H8tEn/QFdSMXntGSR0GM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJnBCXycTvFDz8DN7OrJAM9A9iZZTVYuDSYQoZEBskgWcw43a4wUfgjM+c5ebXS9uCP8Xf7Icfjqa3cKRtgtXbGtWgcHmUxZwBLbtIh0SHEwglxJHjlCXZKUM1IIY4vGXV7uFrA4GWruIJeraoVYDStaMxZacUuSZ3H4B1+XTVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=MN2w66A6; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id ECE3D2C04C9;
	Mon, 10 Jun 2024 15:00:22 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1717988422;
	bh=ud957lKb8asL2PtFHNaW6BR3jvt+Fs1RgfPqFya4nvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MN2w66A6SxVEuMBEzztOMQXEE3aF6nCvri1cIlNZDidM8kdz6KURZ8jyXs5cQ9ef5
	 6XtdY6Z4JC8qf//02W26uO9y9OOr98xVjWc7fGGvktTR8dqPk8oCIEXJynfCyELFHk
	 VaDIQq77tKk8sTawOJ/xgJuVVkLjlmTPkkpVa6LJz7OtXLAxUHkB9uX1AJm1n+v/qA
	 KRH9danfPzn1mSaA2cXO5g7hnautdyQUud/gV1Yu8IpWIi7FImTNL1/xVY5F0fanj9
	 EtelZi2HTIC1GBFnnfdd85MaXdACJ+3QNo8BEs69yfl11fbzuRQIycOx2pffskqS+I
	 g4HkYwY2eDaaw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B66666c460000>; Mon, 10 Jun 2024 15:00:22 +1200
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id C479313EE2B;
	Mon, 10 Jun 2024 15:00:22 +1200 (NZST)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id C22F52A2270; Mon, 10 Jun 2024 15:00:22 +1200 (NZST)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: andi.shyti@kernel.org
Cc: aryan.srivastava@alliedtelesis.co.nz,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] i2c: octeon: refactor hlc r/w operations
Date: Mon, 10 Jun 2024 14:59:54 +1200
Message-ID: <20240610025955.2308688-2-aryan.srivastava@alliedtelesis.co.nz>
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
X-SEG-SpamProfiler-Analysis: v=2.4 cv=F9L0dbhN c=1 sm=1 tr=0 ts=66666c46 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=T1WGqf2p2xoA:10 a=a7gkLlzbLAVbDXTTgMMA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

Refactor the current implementation of the high-level
composite read and write operations in preparation of
the addition of block-mode read/write operations.

The sending of the i2c command is generic and will
apply for both the block-mode and non-block-mode R/W.
Extract this from the current hlc ops, and place into
a generic function, octeon_i2c_hlc_cmd_send.

The considerations made for extended addresses in the
command construction are common for all r/w cases,
extract these into octeon_i2c_hlc_ext.

There are parts of the commands construction which are
common (only in the read case), extract this and place
into generic function octeon_i2c_hlc_read_cmd.

The write commands cannot be made entirely into common
code as there are distinct differences in the block mode
and non-block-mode process. Particularly the writing of
data into the buffer.

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


