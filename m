Return-Path: <linux-i2c+bounces-9872-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB62A6661D
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 03:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8D8E3B40EF
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Mar 2025 02:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 397C378F4B;
	Tue, 18 Mar 2025 02:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="c2lk708i"
X-Original-To: linux-i2c@vger.kernel.org
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [202.36.163.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDE61922D4
	for <linux-i2c@vger.kernel.org>; Tue, 18 Mar 2025 02:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.36.163.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742264209; cv=none; b=Eavl8CaKw7x6h2/hTEvjQG/SNVrpks3p9GoBJryGilkUY8PElyzmfKxHRscL1XTThyaIZ1Xfjp2cO60ecgx/jTq0YZS8JFb1QJHbeOVlVFhfBiWUPUiMcVeJ+ZwohmD7rrYNNJGSysysAw9KtcYsLNtZCq0lB59Z5vJKuIETjn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742264209; c=relaxed/simple;
	bh=GjvmHJxsk9UGNrOlH4v/ZCEgatSxf19HzHHTkPyO7WM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhqDF3UDejye8TOzIO5+MM7r+zqb5a+p6CHp1oeakPoM8/1SzTvBgAG5rv7MmUv+tbwSmN3us9PqLR7AfYm9JC/fpp6LZ2InsQb3EIn7NAoU2B6W84SDyqynuIwUDXGMjaqI8zXiKM6d5P2OsSZUzyn2rbw1ESiCRj6DoCHutA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz; spf=pass smtp.mailfrom=alliedtelesis.co.nz; dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b=c2lk708i; arc=none smtp.client-ip=202.36.163.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=alliedtelesis.co.nz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alliedtelesis.co.nz
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id B7A522C0487;
	Tue, 18 Mar 2025 15:16:39 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1742264199;
	bh=nzRCVr5N6FLyIuCuaZbWfa3FU+qQwmvIafqw9d8IO/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c2lk708iXH2TBSPpWMpfKcZw5e8H2iZBtoN2Ursyu9te5BIUQtmhy02dpjPRlavIA
	 c945DWuW53FcXwdRLq7bFQI7ycePzLHDbsjgp/t4R6mbRJCwvAxcOwnSjJzNyV8sAp
	 VUv/zpEa1jfCzq4Pm4YwmvHBcKBqkGZTS04t3J1nI4d0cVMyVwAgks5AiYL7Smz28N
	 oHRPwZ0/m01/+YCsSji0JN76lgNbDrxt8bzKXgVparaMNjgxAn/Ve/iU9SKVQucqky
	 bCiEnxm4Lfz761BzyG0icGdyMDHb6kMQ/eYLwxx/EwVAYkZlb+dIBkIvYnzNouGOO1
	 F51PZKCyfaVVw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67d8d7860001>; Tue, 18 Mar 2025 15:16:38 +1300
Received: from aryans-dl.ws.atlnz.lc (aryans-dl.ws.atlnz.lc [10.33.22.38])
	by pat.atlnz.lc (Postfix) with ESMTP id 8A2F913ED56;
	Tue, 18 Mar 2025 15:16:39 +1300 (NZDT)
Received: by aryans-dl.ws.atlnz.lc (Postfix, from userid 1844)
	id 8B3822A1692; Tue, 18 Mar 2025 15:16:39 +1300 (NZDT)
From: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>,
	Robert Richter <rric@kernel.org>
Subject: [PATCH v13 2/3] i2c: octeon: remove 10-bit addressing support
Date: Tue, 18 Mar 2025 15:16:30 +1300
Message-ID: <20250318021632.2710792-3-aryan.srivastava@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
References: <20250318021632.2710792-1-aryan.srivastava@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.4 cv=Ko7u2nWN c=1 sm=1 tr=0 ts=67d8d786 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=Vs1iUdzkB0EA:10 a=GtLwDOobmrOBVprAYekA:9 a=3ZKOabzyN94A:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat

The driver gives the illusion of 10-bit address support, but the upper
3 bits of the given address are always thrown away. Remove unnecessary
considerations for 10 bit addressing and always complete 7 bit ops when
using the hlc methods.

Signed-off-by: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-octeon-core.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-octeon-core.c b/drivers/i2c/busses/i2=
c-octeon-core.c
index 0094fe5f7460..baf6b27f3752 100644
--- a/drivers/i2c/busses/i2c-octeon-core.c
+++ b/drivers/i2c/busses/i2c-octeon-core.c
@@ -421,17 +421,12 @@ static int octeon_i2c_hlc_read(struct octeon_i2c *i=
2c, struct i2c_msg *msgs)
 	octeon_i2c_hlc_enable(i2c);
 	octeon_i2c_hlc_int_clear(i2c);
=20
-	cmd =3D SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR;
+	cmd =3D SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR | SW_TWSI_OP_7;
 	/* SIZE */
 	cmd |=3D (u64)(msgs[0].len - 1) << SW_TWSI_SIZE_SHIFT;
 	/* A */
 	cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
=20
-	if (msgs[0].flags & I2C_M_TEN)
-		cmd |=3D SW_TWSI_OP_10;
-	else
-		cmd |=3D SW_TWSI_OP_7;
-
 	octeon_i2c_writeq_flush(cmd, i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
 	ret =3D octeon_i2c_hlc_wait(i2c);
 	if (ret)
@@ -463,17 +458,12 @@ static int octeon_i2c_hlc_write(struct octeon_i2c *=
i2c, struct i2c_msg *msgs)
 	octeon_i2c_hlc_enable(i2c);
 	octeon_i2c_hlc_int_clear(i2c);
=20
-	cmd =3D SW_TWSI_V | SW_TWSI_SOVR;
+	cmd =3D SW_TWSI_V | SW_TWSI_SOVR | SW_TWSI_OP_7;
 	/* SIZE */
 	cmd |=3D (u64)(msgs[0].len - 1) << SW_TWSI_SIZE_SHIFT;
 	/* A */
 	cmd |=3D (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
=20
-	if (msgs[0].flags & I2C_M_TEN)
-		cmd |=3D SW_TWSI_OP_10;
-	else
-		cmd |=3D SW_TWSI_OP_7;
-
 	for (i =3D 0, j =3D msgs[0].len - 1; i  < msgs[0].len && i < 4; i++, j-=
-)
 		cmd |=3D (u64)msgs[0].buf[j] << (8 * i);
=20
@@ -513,11 +503,6 @@ static bool octeon_i2c_hlc_ext(struct octeon_i2c *i2=
c, struct i2c_msg msg, u64 *
 	bool set_ext =3D false;
 	u64 cmd =3D 0;
=20
-	if (msg.flags & I2C_M_TEN)
-		cmd |=3D SW_TWSI_OP_10_IA;
-	else
-		cmd |=3D SW_TWSI_OP_7_IA;
-
 	if (msg.len =3D=3D 2) {
 		cmd |=3D SW_TWSI_EIA;
 		*ext =3D (u64)msg.buf[0] << SW_TWSI_IA_SHIFT;
@@ -550,7 +535,7 @@ static int octeon_i2c_hlc_comp_read(struct octeon_i2c=
 *i2c, struct i2c_msg *msgs
=20
 	octeon_i2c_hlc_enable(i2c);
=20
-	cmd =3D SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR;
+	cmd =3D SW_TWSI_V | SW_TWSI_R | SW_TWSI_SOVR | SW_TWSI_OP_7_IA;
 	/* SIZE */
 	cmd |=3D (u64)(msgs[1].len - 1) << SW_TWSI_SIZE_SHIFT;
 	/* A */
@@ -587,7 +572,7 @@ static int octeon_i2c_hlc_comp_write(struct octeon_i2=
c *i2c, struct i2c_msg *msg
=20
 	octeon_i2c_hlc_enable(i2c);
=20
-	cmd =3D SW_TWSI_V | SW_TWSI_SOVR;
+	cmd =3D SW_TWSI_V | SW_TWSI_SOVR | SW_TWSI_OP_7_IA;
 	/* SIZE */
 	cmd |=3D (u64)(msgs[1].len - 1) << SW_TWSI_SIZE_SHIFT;
 	/* A */
--=20
2.47.1


