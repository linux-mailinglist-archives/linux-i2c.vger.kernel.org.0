Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E24046B1D2
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 05:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235317AbhLGEZj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Dec 2021 23:25:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235069AbhLGEZd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Dec 2021 23:25:33 -0500
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A1FC061354
        for <linux-i2c@vger.kernel.org>; Mon,  6 Dec 2021 20:22:03 -0800 (PST)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4B14F8364E;
        Tue,  7 Dec 2021 17:21:58 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1638850918;
        bh=XNS7tMPMWsz0YQlXTN2pcDOyy/ddhlLbJmGey5fqZ3Q=;
        h=From:To:Cc:Subject:Date;
        b=Tzr45wDVXTgIXnVOTvLOSgsHgMrcbvWYlA6MT/CZHMqteKmjbAoq56JUWKgiKcS0d
         GTuedigrpONq6LXK0RcRbZWeVpmiRS7Nx9/+lZlRJ5X5NmT3Ezom9e3PEm+C5sGBRS
         6UCh60LGLJTXzXK/gjUMtPwPgimflyAWiuVV9SwLMeYnUtOopT79CnuPcfs/hrnkm3
         jd7lkSPFToKtdk49yZjGPPvv02vgh6aag/TS/MmzTrz0RS0PYgftYd2UKO3idGN+hX
         to6wT41Ty4Ja+eKyaVICDMIHFpb2neJ0CUWt9ipc5JDlpb+Olg9LP2QJdo5KSpEABD
         xjIDdjDc9EkGw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B61aee1660000>; Tue, 07 Dec 2021 17:21:58 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.30])
        by pat.atlnz.lc (Postfix) with ESMTP id 208F913EC78;
        Tue,  7 Dec 2021 17:21:58 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 1BD422A02A6; Tue,  7 Dec 2021 17:21:58 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, mbizon@freebox.fr
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] i2c: mpc: Use atomic read and fix break condition
Date:   Tue,  7 Dec 2021 17:21:44 +1300
Message-Id: <20211207042144.358867-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=XOZOtjpE c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IOMw9HtfNCkA:10 a=pVfueR0RV8q608vrjqwA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Maxime points out that the polling code in mpc_i2c_isr should use the
_atomic API because it is called in an irq context and that the
behaviour of the MCF bit is that it is 1 when the byte transfer is
complete. All of this means the original code was effectively a
udelay(100).

Fix this by using readb_poll_timeout_atomic() and removing the negation
of the break condition.

Fixes: 4a8ac5e45cda ("i2c: mpc: Poll for MCF")
Reported-by: Maxime Bizon <mbizon@freebox.fr>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Maxime,

Can you give this a test on your setup. I've tried it on the setup where
I had the original problem that led to 4a8ac5e45cda and it seems OK so
far (I'll leave my test running overnight).

 drivers/i2c/busses/i2c-mpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index a6ea1eb1394e..53b8da6dbb23 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -636,7 +636,7 @@ static irqreturn_t mpc_i2c_isr(int irq, void *dev_id)
 	status =3D readb(i2c->base + MPC_I2C_SR);
 	if (status & CSR_MIF) {
 		/* Wait up to 100us for transfer to properly complete */
-		readb_poll_timeout(i2c->base + MPC_I2C_SR, status, !(status & CSR_MCF)=
, 0, 100);
+		readb_poll_timeout_atomic(i2c->base + MPC_I2C_SR, status, status & CSR=
_MCF, 0, 100);
 		writeb(0, i2c->base + MPC_I2C_SR);
 		mpc_i2c_do_intr(i2c, status);
 		return IRQ_HANDLED;
--=20
2.34.1

