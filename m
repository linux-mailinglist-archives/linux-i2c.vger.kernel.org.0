Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D5D233D9C7
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Mar 2021 17:49:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237084AbhCPQsz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Mar 2021 12:48:55 -0400
Received: from de-out1.bosch-org.com ([139.15.230.186]:55278 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236835AbhCPQst (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Mar 2021 12:48:49 -0400
Received: from fe0vm1649.rbesz01.com (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 4F0K4H17tKz1XLFjP;
        Tue, 16 Mar 2021 17:48:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1615913327;
        bh=fP74M6HwZDCum3+vzeaerJPkseKxvj4gZV75mefECbo=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=ZeLKWHlnJJ+gB39tx2cNTI6+V7uo1LisSbu6pDa0ie7dq38NEAFEfD6+irZRD+PS5
         0PaeUshEXH/QCTnMwteEZ5ez7K/mlWbKEtcZBg17WohLhnwVuJkcqnFug6xD1cJ2py
         W3uM8TjoUCo+BlUCuFCOMiesLe5OM3FSMX2WXcOU=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 4F0K4H0q36z1bh;
        Tue, 16 Mar 2021 17:48:47 +0100 (CET)
X-AuditID: 0a3aad10-e8dff7000000444e-8a-6050e16f62e3
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id 2D.B5.17486.F61E0506; Tue, 16 Mar 2021 17:48:47 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 4F0K4G71sczV19;
        Tue, 16 Mar 2021 17:48:46 +0100 (CET)
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
 FE-HUB2000.de.bosch.com (10.4.103.109) with Microsoft SMTP Server id
 15.1.2176.2; Tue, 16 Mar 2021 17:48:46 +0100
From:   Mark Jonas <mark.jonas@de.bosch.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <Adam.Thomson.Opensource@diasemi.com>,
        <stwiss.opensource@diasemi.com>, <marek.vasut@gmail.com>,
        <tingquan.ruan@cn.bosch.com>, <hubert.streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH v6 1/1] mfd: da9063: Support SMBus and I2C mode
Date:   Tue, 16 Mar 2021 17:22:37 +0100
Message-ID: <20210316162237.877436-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrELMWRmVeSWpSXmKPExsXCZbVWVjf/YUCCwaXtzBZL3y9ltrj/9Sij
        RcffL4wWl3fNYbO4+ns9i8Xe1ovMFnf3z2V0YPdY8UnfY9OqTjaPO9f2sHl83iQXwBLFZZOS
        mpNZllqkb5fAlXFiWi9LwXGJir71DUwNjL0iXYycHBICJhJ3J29j6mLk4hASmM4ksfdPCwuE
        s5tRYuaP54wgVUICOxglDv5RA7HZBLQkbp7YwQxiiwhES7R8PQHWzSywiknizqpd7CAJYQF7
        ieZLE8CaWQRUJZZ+XQjWwCtgKzH34hE2iNXyEjMvfWeHiAtKnJz5hAXEZgaKN2+dzQxhS0gc
        fPGCeQIj3ywkZbOQlM1CUraAkXkVo2haqkFZrrmloYVeUVJqcZWBoV5yfu4mRkiwAn1yu/uD
        3iFGJg7GQ4wSHMxKIrymeQEJQrwpiZVVqUX58UWlOanFhxilOViUxHlVeDbGCQmkJ5akZqem
        FqQWwWSZODilGpgSmbnerA/e7nrmUR132a/qN4tfun06/mOd0E9Og10xEqdNFt9Mvbk/5Ei8
        f8ZD30cdig4M3WY+pQcKNK6tCC6YPyMvMtzK4vOHN/8d2a1SXx9xqez3zq75IGqwj+tKfpZ4
        SnTRKdan6e3CC8s1NpoG2834/Cnvz1T24FgBrkWdPlvm+zFfmj+FwWTtt+WRjBcP7vLIt3us
        8erSjrStKzUOL5pz4HHZlpU3SyJ+B7P0m6Vvc68Tn7X8X/ptJa/XZ6bdu6r3reF0VI8ko3mN
        bR9D0Wv1kg9bRBfwFIV2pK3bU3NB8E7soT/Xd5o2HJysOl9/XcNkDeeJQd+yxVP1+T1yD8s2
        x+7sdX3RKb7Ds16JpTgj0VCLuag4EQCdmo4VxQIAAA==
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Hubert Streidl <hubert.streidl@de.bosch.com>

By default the PMIC DA9063 2-wire interface is SMBus compliant. This
means the PMIC will automatically reset the interface when the clock
signal ceases for more than the SMBus timeout of 35 ms.

If the I2C driver / device is not capable of creating atomic I2C
transactions, a context change can cause a ceasing of the clock signal.
This can happen if for example a real-time thread is scheduled. Then
the DA9063 in SMBus mode will reset the 2-wire interface. Subsequently
a write message could end up in the wrong register. This could cause
unpredictable system behavior.

The DA9063 PMIC also supports an I2C compliant mode for the 2-wire
interface. This mode does not reset the interface when the clock
signal ceases. Thus the problem depicted above does not occur.

This patch tests for the bus functionality "I2C_FUNC_I2C". It can
reasonably be assumed that the bus cannot obey SMBus timings if
this functionality is set. SMBus commands most probably are emulated
in this case which is prone to the latency issue described above.

This patch enables the I2C bus mode if I2C_FUNC_I2C is set or
otherwise keeps the default SMBus mode.

Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
Changes in v6:
  - Fixed checkpatch check 'unaligned broken line'.

Changes in v5:
  - Restructured according to feedback by Lee Jones.

Changes in v4:
  - Remove logging of selected 2-wire bus mode.

Changes in v3:
  - busmode now contains the correct bit DA9063_TWOWIRE_TO

Changes in v2:
  - Implement proposal by Adam Thomson and Wolfram Sang to check for
    functionality I2C_FUNC_I2C instead of introducing a new DT property.

 drivers/mfd/da9063-i2c.c             | 10 ++++++++++
 include/linux/mfd/da9063/registers.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index 3781d0bb7786..783a14af18e2 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -442,6 +442,16 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	/* If SMBus is not available and only I2C is possible, enter I2C mode */
+	if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
+		ret = regmap_clear_bits(da9063->regmap, DA9063_REG_CONFIG_J,
+					DA9063_TWOWIRE_TO);
+		if (ret < 0) {
+			dev_err(da9063->dev, "Failed to set Two-Wire Bus Mode.\n");
+			return -EIO;
+		}
+	}
+
 	return da9063_device_init(da9063, i2c->irq);
 }
 
diff --git a/include/linux/mfd/da9063/registers.h b/include/linux/mfd/da9063/registers.h
index 1dbabf1b3cb8..6e0f66a2e727 100644
--- a/include/linux/mfd/da9063/registers.h
+++ b/include/linux/mfd/da9063/registers.h
@@ -1037,6 +1037,9 @@
 #define		DA9063_NONKEY_PIN_AUTODOWN	0x02
 #define		DA9063_NONKEY_PIN_AUTOFLPRT	0x03
 
+/* DA9063_REG_CONFIG_J (addr=0x10F) */
+#define DA9063_TWOWIRE_TO			0x40
+
 /* DA9063_REG_MON_REG_5 (addr=0x116) */
 #define DA9063_MON_A8_IDX_MASK			0x07
 #define		DA9063_MON_A8_IDX_NONE		0x00
-- 
2.25.1

