Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA7233456D7
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Mar 2021 05:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhCWEe3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Mar 2021 00:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhCWEdy (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Mar 2021 00:33:54 -0400
Received: from gate2.alliedtelesis.co.nz (gate2.alliedtelesis.co.nz [IPv6:2001:df5:b000:5::4])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8CDC0613D8
        for <linux-i2c@vger.kernel.org>; Mon, 22 Mar 2021 21:33:53 -0700 (PDT)
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 37CA3891B0;
        Tue, 23 Mar 2021 17:33:48 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1616474028;
        bh=SN6b5LCcIucEvVtwLqIzgxrbW6usrE1b4VxLa99rvz8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Qw7ZRVQJPEusslfNI7H2jZa4b/qcLdv+PFz7uM4tDGf6geerD0/nHqF6WAqRbUF3M
         zXYgHJ313sglfyPCfsPZGIVRJ8gNQ3df9t2f20HsAfx+0gVhdr88NmjxT3R3proaXG
         +/gpej9yOV9j2vnlvV1HpE5SbGolnPQCcLubg8Nl425TXgn6x+CipKQ6XwTODAzjVD
         E6IgBGfhioreYY6sVezcYIejYRJwcMVVn+eQSIkOfkWerFBX2Y0IUOqYrD5DKwtaaI
         g/VZXB+IMm5jq+YHbgYZMJ3zWDIGlmnvDXqlRO7S+zEIRg386nKuE8XZ6NFxE+Mgsf
         86nb0815vozGA==
Received: from smtp (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B60596fac0000>; Tue, 23 Mar 2021 17:33:48 +1300
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by smtp (Postfix) with ESMTP id 9BFC613EED4;
        Tue, 23 Mar 2021 17:34:03 +1300 (NZDT)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id 1AD6328409A; Tue, 23 Mar 2021 17:33:48 +1300 (NZDT)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     robh+dt@kernel.org, linux@roeck-us.net, wsa@kernel.org,
        jdelvare@suse.com
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 3/6] i2c: mpc: Make use of i2c_recover_bus()
Date:   Tue, 23 Mar 2021 17:33:28 +1300
Message-Id: <20210323043331.21878-4-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
References: <20210323043331.21878-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=GfppYjfL c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=dESyimp9J3IA:10 a=SdC2vBNBQt3qShdCGKMA:9
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move the existing calls of mpc_i2c_fixup() to a recovery function
registered via bus_recovery_info. This makes it more obvious that
recovery is supported and allows for a future where recovery is
triggered by the i2c core.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 drivers/i2c/busses/i2c-mpc.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index d94f05c8b8b7..6a0d55e9e8e3 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -586,7 +586,7 @@ static int mpc_xfer(struct i2c_adapter *adap, struct =
i2c_msg *msgs, int num)
 			if ((status & (CSR_MCF | CSR_MBB | CSR_RXAK)) !=3D 0) {
 				writeb(status & ~CSR_MAL,
 				       i2c->base + MPC_I2C_SR);
-				mpc_i2c_fixup(i2c);
+				i2c_recover_bus(&i2c->adap);
 			}
 			return -EIO;
 		}
@@ -622,7 +622,7 @@ static int mpc_xfer(struct i2c_adapter *adap, struct =
i2c_msg *msgs, int num)
 			if ((status & (CSR_MCF | CSR_MBB | CSR_RXAK)) !=3D 0) {
 				writeb(status & ~CSR_MAL,
 				       i2c->base + MPC_I2C_SR);
-				mpc_i2c_fixup(i2c);
+				i2c_recover_bus(&i2c->adap);
 			}
 			return -EIO;
 		}
@@ -637,6 +637,15 @@ static u32 mpc_functionality(struct i2c_adapter *ada=
p)
 	  | I2C_FUNC_SMBUS_READ_BLOCK_DATA | I2C_FUNC_SMBUS_BLOCK_PROC_CALL;
 }
=20
+static int fsl_i2c_bus_recovery(struct i2c_adapter *adap)
+{
+	struct mpc_i2c *i2c =3D i2c_get_adapdata(adap);
+
+	mpc_i2c_fixup(i2c);
+
+	return 0;
+}
+
 static const struct i2c_algorithm mpc_algo =3D {
 	.master_xfer =3D mpc_xfer,
 	.functionality =3D mpc_functionality,
@@ -648,6 +657,10 @@ static struct i2c_adapter mpc_ops =3D {
 	.timeout =3D HZ,
 };
=20
+static struct i2c_bus_recovery_info fsl_i2c_recovery_info =3D {
+	.recover_bus =3D fsl_i2c_bus_recovery,
+};
+
 static const struct of_device_id mpc_i2c_of_match[];
 static int fsl_i2c_probe(struct platform_device *op)
 {
@@ -740,6 +753,7 @@ static int fsl_i2c_probe(struct platform_device *op)
 	i2c_set_adapdata(&i2c->adap, i2c);
 	i2c->adap.dev.parent =3D &op->dev;
 	i2c->adap.dev.of_node =3D of_node_get(op->dev.of_node);
+	i2c->adap.bus_recovery_info =3D &fsl_i2c_recovery_info;
=20
 	result =3D i2c_add_adapter(&i2c->adap);
 	if (result < 0)
--=20
2.30.2

