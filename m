Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A6B311575
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Feb 2021 23:33:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbhBEWcV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Feb 2021 17:32:21 -0500
Received: from de-deferred2.bosch-org.com ([139.15.180.217]:39766 "EHLO
        de-deferred2.bosch-org.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232315AbhBEOQK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 Feb 2021 09:16:10 -0500
Received: from de-out1.bosch-org.com (snat-lb41g3-dmz-psi-sl1-maildeferred.fe.ssn.bosch.com [139.15.180.215])
        by fe0vms0193.rbdmz01.com (Postfix) with ESMTPS id 4DXKhV0dqhzqPN;
        Fri,  5 Feb 2021 16:53:30 +0100 (CET)
Received: from fe0vm1650.rbesz01.com (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
        by fe0vms0187.rbdmz01.com (Postfix) with ESMTPS id 4DXKdH1nd8z1XLDQv;
        Fri,  5 Feb 2021 16:50:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1612540243;
        bh=fP74M6HwZDCum3+vzeaerJPkseKxvj4gZV75mefECbo=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=BFyuHrASzp3561tTs9ypVNcLBywXr4MmrO95y/5oH8MS0atS6GpZS1diHxcL6YjaV
         9jEdK/DU2JgykhK6zqDnY5p3+AWQPpGfwi+8TjSUKQUX7cSlvNOhWc0CHEL++tEzqx
         XmdhOf/c+u1+OBzjti95/wHRyVC0PnBP4kut9DhU=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1650.rbesz01.com (Postfix) with ESMTPS id 4DXKdH1PBKz2HM;
        Fri,  5 Feb 2021 16:50:43 +0100 (CET)
X-AuditID: 0a3aad10-b0bff70000002230-42-601d6953e72d
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id 70.4D.08752.3596D106; Fri,  5 Feb 2021 16:50:43 +0100 (CET)
Received: from SI-HUB2000.de.bosch.com (si-hub2000.de.bosch.com [10.4.103.108])
        by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 4DXKdH0MYtzV16;
        Fri,  5 Feb 2021 16:50:43 +0100 (CET)
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
 SI-HUB2000.de.bosch.com (10.4.103.108) with Microsoft SMTP Server id
 15.1.2106.2; Fri, 5 Feb 2021 16:50:42 +0100
From:   Mark Jonas <mark.jonas@de.bosch.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <Adam.Thomson.Opensource@diasemi.com>,
        <stwiss.opensource@diasemi.com>, <marek.vasut@gmail.com>,
        <tingquan.ruan@cn.bosch.com>, <hubert.streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH v3] mfd: da9063: Support SMBus and I2C mode
Date:   Fri, 5 Feb 2021 16:50:06 +0100
Message-ID: <20210205155006.130458-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrLLMWRmVeSWpSXmKPExsXCZbVWVjc4UzbB4O88doul75cyW9z/epTR
        ouPvF0aLy7vmsFkc3XOP2eLq7/UsFntbLzJb3N0/l9GBw2PFJ32PnbPusntsWtXJ5nHn2h42
        j8+b5AJYo7hsUlJzMstSi/TtErgyrhzazlbwT7Li69aFrA2Ma0S7GDk5JARMJCZcP8zUxcjF
        ISQwnUli8do3bBDObkaJ1xNPs0I42xklrt7dwATSwiagJXHzxA5mEFtEIFqi5esJsHZmgVVM
        EndW7WIHSQgLWEt0zutiBLFZBFQkXpy8AtbMK2Ar8X3rTnaI3fISMy99Z4eIC0qcnPmEBcRm
        Boo3b53NDGFLSBx88YJ5AiPfLCRls5CUzUJStoCReRWjaFqqQVmuuaWhhV5RUmpxlYGhXnJ+
        7iZGSAgL7GC83f1B7xAjEwfjIUYJDmYlEd7ENqkEId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwq
        PBvjhATSE0tSs1NTC1KLYLJMHJxSDUxtYv6f5oU7LfyfMz13YxyzztSEh7tcjNT5a91fz9h0
        YlUgV7mnRlRz8NWMBO3T271lVhxbdz33nHmc0USH14V/j2+J6Np8Uv1yiGSnwHG1/xd2PXKt
        +qATtH2fqlTj/7cRAjl73RPlRVPy/rz6PSth1baU0nC3+uhkKQ9rG9FXO+4fbVqp/c1UzKL5
        clnAl51OG4vk+GanbTpawCou7SzRGPakTlNy88zpSo2qz7h439yPvn92bu0iQacTMYf0WiaI
        Ftx8vt2oyjUr/f+E3av3mXw+LsuaYXJapyGusuaF5gvGxdd1y36rbUr8PinOWeYZ37P+RRzy
        W7tW123avldrInPo2QvreCc8naS8dbMSS3FGoqEWc1FxIgDtFBBU0AIAAA==
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
otherwise enables the SMBus mode for a native SMBus controller
which doesn't have I2C_FUNC_I2C set.

Signed-off-by: Hubert Streidl <hubert.streidl@de.bosch.com>
Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
---
Changes in v3:
  - busmode now contains the correct bit DA9063_TWOWIRE_TO

Changes in v2:
  - Implement proposal by Adam Thomson and Wolfram Sang to check for
    functionality I2C_FUNC_I2C instead of introducing a new DT property.

 drivers/mfd/da9063-i2c.c             | 15 +++++++++++++++
 include/linux/mfd/da9063/registers.h |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index 3781d0bb7786..4c5e0f69942f 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -355,6 +355,7 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
 	struct da9063 *da9063;
+	unsigned int busmode;
 	int ret;
 
 	da9063 = devm_kzalloc(&i2c->dev, sizeof(struct da9063), GFP_KERNEL);
@@ -442,6 +443,20 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	if (i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C)) {
+		dev_info(da9063->dev, "I2C mode");
+		busmode = 0;
+	} else {
+		dev_info(da9063->dev, "SMBus mode");
+		busmode = DA9063_TWOWIRE_TO;
+	}
+	ret = regmap_update_bits(da9063->regmap, DA9063_REG_CONFIG_J,
+	      DA9063_TWOWIRE_TO, busmode);
+	if (ret < 0) {
+		dev_err(da9063->dev, "Failed to set 2-wire bus mode.\n");
+		return -EIO;
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

