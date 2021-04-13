Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0465335D6D5
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 07:10:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242405AbhDMFKa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 01:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242498AbhDMFK1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Apr 2021 01:10:27 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D37C06138C
        for <linux-i2c@vger.kernel.org>; Mon, 12 Apr 2021 22:10:07 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 8BF52891B0;
        Tue, 13 Apr 2021 17:10:03 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1618290603;
        bh=i8Y1w1YcAAqAO7yzemekLbBaT++sUFSmMqKY8VBlQw8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=bpiaGOwEoO9XfDKAdmsVYHSVqDY8dXge2RFrzG7EhTRadqmbbu0pCqXpPCOJB/MYT
         o48PhUjMZ90R3t0v05tIYBCn4x73IBo5l/s+6NslCxgdJKWRt2YckPgHjSm2GVOruP
         9Cz+dJZRaEHLVWSGCYcbEhu1gvYTb3gQWUrD+nLYUj2/crKgy+QZdeH2GqBO1ZWMDL
         MWMVgEumI2Xy7Rbizr8VpJDDEwcMGCpATVyXftE/LYtMBlQZLjSspJsG5lyjLcq++G
         bQknVIxWxpgi+Mhz+YCcTlGbMoAHfnBX7XW1Du8aQDuhQkl/RQ7H+p9xYEv9DKxaSS
         DfjnpgslB0oPg==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B607527ab0003>; Tue, 13 Apr 2021 17:10:03 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id AB7DB13EEED;
        Tue, 13 Apr 2021 17:10:23 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 7355F284083; Tue, 13 Apr 2021 17:10:03 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 3/4] i2c: mpc: Remove redundant NULL check
Date:   Tue, 13 Apr 2021 17:09:54 +1200
Message-Id: <20210413050956.23264-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
References: <20210413050956.23264-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=NaGYKFL4 c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=3YhXtTcJ-WEA:10 a=VwQbUJbxAAAA:8 a=HTRbRoXyaG4WaP6nMdIA:9 a=AjGcO6oz07-iQ99wixmX:22
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In mpc_i2c_get_fdr_8xxx div is assigned as we iterate through the
mpc_i2c_dividers_8xxx array. By the time we exit the loop div will
either have the value that matches the requested speed or be pointing at
the last entry in mpc_i2c_dividers_8xxx. Checking for div being NULL
after the loop is redundant so remove the check.

Reported-by: Wolfram Sang <wsa@kernel.org>
Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 9818f9f6a553..c30687483147 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -377,7 +377,7 @@ static int mpc_i2c_get_fdr_8xxx(struct device_node *n=
ode, u32 clock,
 	}
=20
 	*real_clk =3D fsl_get_sys_freq() / prescaler / div->divider;
-	return div ? (int)div->fdr : -EINVAL;
+	return (int)div->fdr;
 }
=20
 static void mpc_i2c_setup_8xxx(struct device_node *node,
--=20
2.31.1

