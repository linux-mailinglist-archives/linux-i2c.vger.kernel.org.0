Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AA784A2D6E
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jan 2022 10:39:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233096AbiA2JjU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Jan 2022 04:39:20 -0500
Received: from mout.gmx.net ([212.227.17.21]:35221 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232711AbiA2JjU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Jan 2022 04:39:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1643449155;
        bh=Op5WAOFoopxJqRI4M6WGEIj6EBhlwpGSblJPcKgOtgY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=Rwz1Sy7QbfB3qeSPzD7xpKfY0U38AiNJ576xPDoEGyy08XfmAEkTttIqtHrhaZ1AA
         9qVXFwg1HkgJlHVhMV49Mzx3gA1QhFNM0y5cEeY0tms3DM5Gf3nCX6iqmAN4YFPQvw
         kMeNVVD6kArPlH0gVxIUGNCb8ii5l424Y3t5W7Dw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.194.160]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M3UZG-1nEIAD1h1W-000ZAM; Sat, 29
 Jan 2022 10:39:15 +0100
From:   =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To:     linux-i2c@vger.kernel.org
Cc:     =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: npcm7xx: Fix typos
Date:   Sat, 29 Jan 2022 10:39:07 +0100
Message-Id: <20220129093907.2196730-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:doqg1AvrDm2EWU0TKD4LgefzLSS50Klm1z7L4UIO6eD1gOSlxXZ
 6EQBqy2/3Cvwt+zh7HMSzylgtc4MF0x0csj0dmQjwiw7k2DvyygjHJVuvA7QIkiktgMveht
 EcjxQMrw+OZ/GxxSZTkIuFbvY6Xh5R+VKyZsxRWy3umfik0MgLZD7HsbO3WBYBSpcZnPwpp
 gcl6/qfkR4TQKIJnj9Klg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:C3nW1pPfTOs=:GwBV/SYaRmMtIAIF/gkZyF
 NEn7kDjnOOeuu9pCLhO3Ey0GOUdp4z0TicEjgWSoBdfA2sHqgZI59vOp+Sf/Ull59tZLeNgdE
 Yc9sa/LUL1Zns5Gx3mLkqOgKZt8lj1zL+p/roH+wLfPjZ9aYSFa9RCJHjy077xI0f/8rnUrpI
 zB8AvDGmCn7oLqgvlQAoaMZO3JpuZBOYTMSlBI40KxPCsT8FBAyuDHkdH64CLzM/TyDwZfPLe
 Yrkhs787l13WHislDdDvZR1yE/WOi5z+RxODe3CF/dkDT7TvzzAm61izsiZH3bgzGRz8i/xc6
 jl1004hP+yBtVsF/UEOnfsyAjf+u9USVkqK3TwMlrfyJ0vV46Nq9bDvIPz3a2ZwQkkugPaU2L
 A0ByUbrpLuuw9+SFuMgsuLXYJhjjCvBK0V6OhqXoHvnu58HQ9m9AgGWBwvymJ+EgIpdD2Aoq7
 xVfS5FifyTc0fGwJfAIVlBNY8oJFMTZ1Ybr69Q3nNQLNH8Kg+QED3vNqjUgXVth4n8rprbcdB
 CBIp6Z6lf7996PxYF31maD+tgtBHDxdoXa52i22GYF3u4l8hQcN9tY43brqKi/DXHiWGiMdiP
 IQx7+7oSY9Bj0L083HktTQZTXQM9QtqVfiq2F0LmXzM7Ej7wv2nHvZmQ1HExeX4AelkS1j/Qc
 mC0W0NIKxYSLkMfvlB8PlzC4bddJZRPtfc1QQMaNDwqPIPio/bj/Q+YO/VPdP3AlAtArhPAoN
 74lZUUKmn8CwNGN0vSgc3ANdmOe61sKsapPYt1ysyW+AaLG5qkeDeR/wqWeT+4HUlSo6eE5Fr
 Qxu2JWfpAxsmKrJ7wzs+7fIEFIagn2wYDXKaeztWss005nUYHRXSoMod70hcITIcp6Hp9aKd2
 X4SblpsX3tP96wNwRma2imvaA9Vq51h50ebEBiDheRdEIKFbm77Uhys695NY9kxs62iyN/TY4
 bF6odIYUKSJCI0H8nQ9ySSczOKrEtSWNcu1lTl598EfR51qsn6k9BXoXqizucQJbrYi0AMf8s
 a4/Pz9mDzGS6J0UDEdfvxY3kLgDf6pejZWUKS4qXxcfVzdYp/DIoIYSUqkJimaJAgY7tlf80x
 K8QXdJphsD4X+4=
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The comments in this driver have a few typos. Let's fix them.

Signed-off-by: Jonathan Neusch=C3=A4fer <j.neuschaefer@gmx.net>
=2D--
 drivers/i2c/busses/i2c-npcm7xx.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-npcm7xx.c b/drivers/i2c/busses/i2c-npc=
m7xx.c
index 2ad166355ec9b..71aad029425d8 100644
=2D-- a/drivers/i2c/busses/i2c-npcm7xx.c
+++ b/drivers/i2c/busses/i2c-npcm7xx.c
@@ -781,7 +781,7 @@ static void npcm_i2c_set_fifo(struct npcm_i2c *bus, in=
t nread, int nwrite)
 		/*
 		 * if we are about to read the first byte in blk rd mode,
 		 * don't NACK it. If slave returns zero size HW can't NACK
-		 * it immidiattly, it will read extra byte and then NACK.
+		 * it immediately, it will read extra byte and then NACK.
 		 */
 		if (bus->rd_ind =3D=3D 0 && bus->read_block_use) {
 			/* set fifo to read one byte, no last: */
@@ -981,7 +981,7 @@ static void npcm_i2c_slave_xmit(struct npcm_i2c *bus, =
u16 nwrite,
 /*
  * npcm_i2c_slave_wr_buf_sync:
  * currently slave IF only supports single byte operations.
- * in order to utilyze the npcm HW FIFO, the driver will ask for 16 bytes
+ * in order to utilize the npcm HW FIFO, the driver will ask for 16 bytes
  * at a time, pack them in buffer, and then transmit them all together
  * to the FIFO and onward to the bus.
  * NACK on read will be once reached to bus->adap->quirks->max_read_len.
@@ -1175,7 +1175,7 @@ static irqreturn_t npcm_i2c_int_slave_handler(struct=
 npcm_i2c *bus)
 				/*
 				 * the i2c module can response to 10 own SA.
 				 * check which one was addressed by the master.
-				 * repond to the first one.
+				 * respond to the first one.
 				 */
 				addr =3D ((i2ccst3 & 0x07) << 7) |
 					(i2ccst2 & 0x7F);
@@ -1753,8 +1753,8 @@ static void npcm_i2c_recovery_init(struct i2c_adapte=
r *_adap)
 	/*
 	 * npcm i2c HW allows direct reading of SCL and SDA.
 	 * However, it does not support setting SCL and SDA directly.
-	 * The recovery function can togle SCL when SDA is low (but not set)
-	 * Getter functions used internally, and can be used externaly.
+	 * The recovery function can toggle SCL when SDA is low (but not set)
+	 * Getter functions used internally, and can be used externally.
 	 */
 	rinfo->get_scl =3D npcm_i2c_get_SCL;
 	rinfo->get_sda =3D npcm_i2c_get_SDA;
@@ -1768,10 +1768,10 @@ static void npcm_i2c_recovery_init(struct i2c_adap=
ter *_adap)

 /*
  * npcm_i2c_init_clk: init HW timing parameters.
- * NPCM7XX i2c module timing parameters are depenent on module core clk (=
APB)
+ * NPCM7XX i2c module timing parameters are dependent on module core clk =
(APB)
  * and bus frequency.
- * 100kHz bus requires tSCL =3D 4 * SCLFRQ * tCLK. LT and HT are simetric=
.
- * 400kHz bus requires assymetric HT and LT. A different equation is reco=
mended
+ * 100kHz bus requires tSCL =3D 4 * SCLFRQ * tCLK. LT and HT are symmetri=
c.
+ * 400kHz bus requires asymmetric HT and LT. A different equation is reco=
mmended
  * by the HW designer, given core clock range (equations in comments belo=
w).
  *
  */
=2D-
2.34.1

