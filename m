Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3384A3B9B06
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Jul 2021 05:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234859AbhGBDaE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Jul 2021 23:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234791AbhGBDaE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Jul 2021 23:30:04 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4679AC061762
        for <linux-i2c@vger.kernel.org>; Thu,  1 Jul 2021 20:27:32 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 02490806B6;
        Fri,  2 Jul 2021 15:27:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1625196447;
        bh=cO8pJhuzeQCtGJIqElb+7nHztnkca1Np2ArIBfEQqN8=;
        h=From:To:Cc:Subject:Date;
        b=UKW6QiYfTzu6Yy9oWpp1T62ELeRpUQDBuS0vz81Fkx7xfCicu6cEJRwOwOdN0jHM9
         vm0rSI/9eRZnA/vki70dzthAhfo/TuvQcQcKsTsz9aex+PG35AmEqK8v3Hy590K7QQ
         lSwpSVZJIdpzg/1Bq54GJIAaNM+OOUw7fdOFNP7/xSEJvMTGkna7KOdHgPdbo3S1sN
         qCnFjK9v7zhBhFKKBoujchIkgQ/Rp5ojasgkWB8PSiu4iAITRJyU0VFe5evUib0Tua
         KlCoZRacpy8xc3k7HDOQw8kgtT+Q/daIV9Wd56zKg9Ol+2qRTiHnzTnZk/t6YYTes0
         8tt8Nm7wALlZw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60de879e0000>; Fri, 02 Jul 2021 15:27:26 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id D42A913EE56;
        Fri,  2 Jul 2021 15:27:26 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id CFBE4283A5F; Fri,  2 Jul 2021 15:27:26 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] i2c: mpc: Restore reread of I2C status register
Date:   Fri,  2 Jul 2021 15:27:24 +1200
Message-Id: <20210702032724.4370-1-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=IOh89TnG c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=e_q4qTt1xDgA:10 a=YJ3gJ8yDGUVric4AAhUA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Prior to commit 1538d82f4647 ("i2c: mpc: Interrupt driven transfer") the
old interrupt handler would reread MPC_I2C_SR after checking the CSR_MIF
bit. When the driver was re-written this was removed as it seemed
unnecessary. However as it turns out this is necessary for i2c devices
which do clock stretching otherwise we end up thinking the bus is still
busy when processing the interrupt.

Fixes: 1538d82f4647 ("i2c: mpc: Interrupt driven transfer")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index dcca9c2396db..6d5014ebaab5 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -635,6 +635,8 @@ static irqreturn_t mpc_i2c_isr(int irq, void *dev_id)
=20
 	status =3D readb(i2c->base + MPC_I2C_SR);
 	if (status & CSR_MIF) {
+		/* Read again to allow register to stabilise */
+		status =3D readb(i2c->base + MPC_I2C_SR);
 		writeb(0, i2c->base + MPC_I2C_SR);
 		mpc_i2c_do_intr(i2c, status);
 		return IRQ_HANDLED;
--=20
2.32.0

