Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 775A43CAE2F
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Jul 2021 22:58:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhGOVBg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Jul 2021 17:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229685AbhGOVBe (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Jul 2021 17:01:34 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCBEEC06175F
        for <linux-i2c@vger.kernel.org>; Thu, 15 Jul 2021 13:58:39 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id DC5C6806B5;
        Fri, 16 Jul 2021 08:58:35 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1626382715;
        bh=2NqU4WWZ3YPu2BgU/zZU2jAcbTZQepkZFeQbTB6P5yI=;
        h=From:To:Cc:Subject:Date;
        b=DTf0MXu4W8SUFp7BQ3W82xvKE2TaoY2PAz3myA8pwFVcbEqhokAgEkFvUeM2BCzsT
         ru38bswhNFz23wIe7r7oTs7zmJwScvSTQHVVYq9H56Pt2qd8idkeDD8e+x4N+0pcWX
         c350amSNk3YSMryJJKuweQZdvbmkCGkiSaTHp81CHRcpoObT9TB7NkqeR8VcWQYR5Z
         jDLjJcF38FWkZvM0F3XtFy5sd6RKxWA09lFy3Onsaq+OfQqySrH197Cebxybfg3Njp
         KIcvyvEfhFjlHlks6UZKhZPfuRXpFDozWbd+v3xWQQMpVe+Jkk3mXBhL4xtnIC92EP
         kbo/pOJxAeF/g==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60f0a17b0000>; Fri, 16 Jul 2021 08:58:35 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id A45FE13EE58;
        Fri, 16 Jul 2021 08:58:35 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 9FF3B280055; Fri, 16 Jul 2021 08:58:35 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2] i2c: mpc: Poll for MCF
Date:   Fri, 16 Jul 2021 08:58:32 +1200
Message-Id: <20210715205832.17879-1-chris.packham@alliedtelesis.co.nz>
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
Instead of a single re-read, poll with a timeout so that the bus is given
enough time to settle but a genuine stuck SCL is still noticed.

Fixes: 1538d82f4647 ("i2c: mpc: Interrupt driven transfer")
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v2:
    - grammar fix in commit message
    - add comment above poll

 drivers/i2c/busses/i2c-mpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 6d5014ebaab5..a6ea1eb1394e 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -635,8 +635,8 @@ static irqreturn_t mpc_i2c_isr(int irq, void *dev_id)
=20
 	status =3D readb(i2c->base + MPC_I2C_SR);
 	if (status & CSR_MIF) {
-		/* Read again to allow register to stabilise */
-		status =3D readb(i2c->base + MPC_I2C_SR);
+		/* Wait up to 100us for transfer to properly complete */
+		readb_poll_timeout(i2c->base + MPC_I2C_SR, status, !(status & CSR_MCF)=
, 0, 100);
 		writeb(0, i2c->base + MPC_I2C_SR);
 		mpc_i2c_do_intr(i2c, status);
 		return IRQ_HANDLED;
--=20
2.32.0

