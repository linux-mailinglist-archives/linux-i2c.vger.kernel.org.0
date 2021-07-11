Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18F9D3C3F5D
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Jul 2021 23:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbhGKVEg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Jul 2021 17:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230435AbhGKVEf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Jul 2021 17:04:35 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB4DC0613DD
        for <linux-i2c@vger.kernel.org>; Sun, 11 Jul 2021 14:01:47 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id CF17A806B6;
        Mon, 12 Jul 2021 09:01:42 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1626037302;
        bh=PheO2vo1Km1pDXTteibH+ss152o51g73oTCPDfeNZyY=;
        h=From:To:Cc:Subject:Date;
        b=pRtYXf0QZCELXzxjqT2mPl3JIaOu7SOAQhGgMEtWGHCqs7+AA9WLBX+b4SlDAKb+c
         xaXzEBT+rb4BSdvDsH0kVN4Xsxe4eOpp5tALZRgbDPxrAWMFHCr6XP7k/4Mpi1K404
         uswFnE8EA4k8dpYNG7iJFqq1jUnq4Zc0wkw1BBpMk+pljl5Wy3spgCFTrKIWvjFp39
         er40/nDY+Z1GzU/DGiV26CnVrsT+iQgchiClsVyWBmESAmnZ/f5I4fWt6Q17wdRK1k
         7urDB9y1D4+/Q2k793GPThYqy5zDWy2Vf82ybbmnWtvNCVTlKf1Mgr603R6fm1qek+
         ULg0PI54jh3hA==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60eb5c360000>; Mon, 12 Jul 2021 09:01:42 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id A1EF013EDC1;
        Mon, 12 Jul 2021 09:01:42 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 9DBD0280055; Mon, 12 Jul 2021 09:01:42 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] i2c: mpc: Poll for MCF
Date:   Mon, 12 Jul 2021 09:01:40 +1200
Message-Id: <20210711210140.26994-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=Sr3uF8G0 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=e_q4qTt1xDgA:10 a=Mfs98-BscDKRgUXsZkwA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

During some transfers the bus can still be busy when an interrupt is
received. Commit 763778cd7926 ("i2c: mpc: Restore reread of I2C status
register") attempted to address this by re-reading MPC_I2C_SR once but
that just made it less likely to happen without actually preventing it.
Instead of a single re-read poll with a timeout so that the bus is given
enough time to settle but a genuine stuck SCL is still noticed.

Fixes: 1538d82f4647 ("i2c: mpc: Interrupt driven transfer")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 6d5014ebaab5..db2e4ae24ee4 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -635,8 +635,7 @@ static irqreturn_t mpc_i2c_isr(int irq, void *dev_id)
=20
 	status =3D readb(i2c->base + MPC_I2C_SR);
 	if (status & CSR_MIF) {
-		/* Read again to allow register to stabilise */
-		status =3D readb(i2c->base + MPC_I2C_SR);
+		readb_poll_timeout(i2c->base + MPC_I2C_SR, status, !(status & CSR_MCF)=
, 0, 100);
 		writeb(0, i2c->base + MPC_I2C_SR);
 		mpc_i2c_do_intr(i2c, status);
 		return IRQ_HANDLED;
--=20
2.32.0

