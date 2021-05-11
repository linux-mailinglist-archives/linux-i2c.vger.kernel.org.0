Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C010A37B0B0
	for <lists+linux-i2c@lfdr.de>; Tue, 11 May 2021 23:21:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230017AbhEKVWH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 May 2021 17:22:07 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:48270 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhEKVWG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 May 2021 17:22:06 -0400
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 2114C891B1;
        Wed, 12 May 2021 09:20:56 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1620768056;
        bh=Gbh5Hq8cFLe7sHg6877yUHfJTLnJ0lbE1WXVQxvk2xs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=xr5qNTRTGRHkFh3fc957QOCSy/4nCoQSB+iVpRvPwT6yFv/FE2F9jz6Vmh8ltlnUG
         EoM3XCySGX6wacChM5VrRN8H6uCg9TpHHYUzztAqzAklppPPNz3zuwOeF+i3bsanpo
         q+9hnB5h0twX2yAToLaKRZELCw+M8spxOSBNjTXChLr+H1STaQs9gEpFCHQDB9gjiv
         qwHkTVh9NfK3KDOqffEvQl+clB91uQebwXepT8WOpGXvAzWMIaFSHCdkjM/kbwrAQr
         lnRvs1oEPPgpd5FW3PuOzkSJU6i3Tq04KWlnCL1c4u0s37mCmQvZxF217ar7M4FUH/
         v/sYT3A7z/ZYg==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
        id <B609af5370004>; Wed, 12 May 2021 09:20:55 +1200
Received: from chrisp-dl.ws.atlnz.lc (chrisp-dl.ws.atlnz.lc [10.33.22.20])
        by pat.atlnz.lc (Postfix) with ESMTP id C8D5D13ECA6;
        Wed, 12 May 2021 09:20:55 +1200 (NZST)
Received: by chrisp-dl.ws.atlnz.lc (Postfix, from userid 1030)
        id C5E5E283A61; Wed, 12 May 2021 09:20:55 +1200 (NZST)
From:   Chris Packham <chris.packham@alliedtelesis.co.nz>
To:     wsa@kernel.org, andriy.shevchenko@linux.intel.com,
        andy.shevchenko@gmail.com, robh+dt@kernel.org, mpe@ellerman.id.au
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v3 4/4] i2c: mpc: implement erratum A-004447 workaround
Date:   Wed, 12 May 2021 09:20:52 +1200
Message-Id: <20210511212052.27242-5-chris.packham@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
References: <20210511212052.27242-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-SEG-SpamProfiler-Analysis: v=2.3 cv=K6Jc4BeI c=1 sm=1 tr=0 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=5FLXtPjwQuUA:10 a=w4j1xu5M8ypyE8uBZIYA:9
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The P2040/P2041 has an erratum where the normal i2c recovery mechanism
does not work. Implement the alternative recovery mechanism documented
in the P2040 Chip Errata Rev Q.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---

Notes:
    Changes in v3:
    - Further code reduction in i2c_mpc_wait_sr()
    Changes in v2:
    - Use readb_poll_timeout instead of open-coded loop

 drivers/i2c/busses/i2c-mpc.c | 81 +++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 30d9e89a3db2..dcca9c2396db 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -19,6 +19,7 @@
=20
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/fsl_devices.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -45,6 +46,7 @@
 #define CCR_MTX  0x10
 #define CCR_TXAK 0x08
 #define CCR_RSTA 0x04
+#define CCR_RSVD 0x02
=20
 #define CSR_MCF  0x80
 #define CSR_MAAS 0x40
@@ -97,7 +99,7 @@ struct mpc_i2c {
 	u32 block;
 	int rc;
 	int expect_rxack;
-
+	bool has_errata_A004447;
 };
=20
 struct mpc_i2c_divider {
@@ -136,6 +138,75 @@ static void mpc_i2c_fixup(struct mpc_i2c *i2c)
 	}
 }
=20
+static int i2c_mpc_wait_sr(struct mpc_i2c *i2c, int mask)
+{
+	void __iomem *addr =3D i2c->base + MPC_I2C_SR;
+	u8 val;
+
+	return readb_poll_timeout(addr, val, val & mask, 0, 100);
+}
+
+/*
+ * Workaround for Erratum A004447. From the P2040CE Rev Q
+ *
+ * 1.  Set up the frequency divider and sampling rate.
+ * 2.  I2CCR - a0h
+ * 3.  Poll for I2CSR[MBB] to get set.
+ * 4.  If I2CSR[MAL] is set (an indication that SDA is stuck low), then =
go to
+ *     step 5. If MAL is not set, then go to step 13.
+ * 5.  I2CCR - 00h
+ * 6.  I2CCR - 22h
+ * 7.  I2CCR - a2h
+ * 8.  Poll for I2CSR[MBB] to get set.
+ * 9.  Issue read to I2CDR.
+ * 10. Poll for I2CSR[MIF] to be set.
+ * 11. I2CCR - 82h
+ * 12. Workaround complete. Skip the next steps.
+ * 13. Issue read to I2CDR.
+ * 14. Poll for I2CSR[MIF] to be set.
+ * 15. I2CCR - 80h
+ */
+static void mpc_i2c_fixup_A004447(struct mpc_i2c *i2c)
+{
+	int ret;
+	u32 val;
+
+	writeccr(i2c, CCR_MEN | CCR_MSTA);
+	ret =3D i2c_mpc_wait_sr(i2c, CSR_MBB);
+	if (ret) {
+		dev_err(i2c->dev, "timeout waiting for CSR_MBB\n");
+		return;
+	}
+
+	val =3D readb(i2c->base + MPC_I2C_SR);
+
+	if (val & CSR_MAL) {
+		writeccr(i2c, 0x00);
+		writeccr(i2c, CCR_MSTA | CCR_RSVD);
+		writeccr(i2c, CCR_MEN | CCR_MSTA | CCR_RSVD);
+		ret =3D i2c_mpc_wait_sr(i2c, CSR_MBB);
+		if (ret) {
+			dev_err(i2c->dev, "timeout waiting for CSR_MBB\n");
+			return;
+		}
+		val =3D readb(i2c->base + MPC_I2C_DR);
+		ret =3D i2c_mpc_wait_sr(i2c, CSR_MIF);
+		if (ret) {
+			dev_err(i2c->dev, "timeout waiting for CSR_MIF\n");
+			return;
+		}
+		writeccr(i2c, CCR_MEN | CCR_RSVD);
+	} else {
+		val =3D readb(i2c->base + MPC_I2C_DR);
+		ret =3D i2c_mpc_wait_sr(i2c, CSR_MIF);
+		if (ret) {
+			dev_err(i2c->dev, "timeout waiting for CSR_MIF\n");
+			return;
+		}
+		writeccr(i2c, CCR_MEN);
+	}
+}
+
 #if defined(CONFIG_PPC_MPC52xx) || defined(CONFIG_PPC_MPC512x)
 static const struct mpc_i2c_divider mpc_i2c_dividers_52xx[] =3D {
 	{20, 0x20}, {22, 0x21}, {24, 0x22}, {26, 0x23},
@@ -670,7 +741,10 @@ static int fsl_i2c_bus_recovery(struct i2c_adapter *=
adap)
 {
 	struct mpc_i2c *i2c =3D i2c_get_adapdata(adap);
=20
-	mpc_i2c_fixup(i2c);
+	if (i2c->has_errata_A004447)
+		mpc_i2c_fixup_A004447(i2c);
+	else
+		mpc_i2c_fixup(i2c);
=20
 	return 0;
 }
@@ -767,6 +841,9 @@ static int fsl_i2c_probe(struct platform_device *op)
 	}
 	dev_info(i2c->dev, "timeout %u us\n", mpc_ops.timeout * 1000000 / HZ);
=20
+	if (of_property_read_bool(op->dev.of_node, "fsl,i2c-erratum-a004447"))
+		i2c->has_errata_A004447 =3D true;
+
 	i2c->adap =3D mpc_ops;
 	scnprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		  "MPC adapter (%s)", of_node_full_name(op->dev.of_node));
--=20
2.31.1

