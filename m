Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5EB3137D5
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 16:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233554AbhBHPcM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 10:32:12 -0500
Received: from de-out1.bosch-org.com ([139.15.230.186]:34022 "EHLO
        de-out1.bosch-org.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229736AbhBHP30 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Feb 2021 10:29:26 -0500
Received: from fe0vm1649.rbesz01.com (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
        by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 4DZ8zw3cszz1XLFjd;
        Mon,  8 Feb 2021 16:28:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
        s=key3-intmail; t=1612798092;
        bh=fP74M6HwZDCum3+vzeaerJPkseKxvj4gZV75mefECbo=; l=10;
        h=From:Subject:From:Reply-To:Sender;
        b=cmOvwN6KNLx7u9bSrPYwyUx05tW6Xgvqd8dthEv00cfCUKFyQCM9lLf7yNGqW2xR6
         QPgfcpg451+pIRJAdlAjgQkpPz5AoygGb5ktP4xtKsJVctNJT+9MARpC0ylSpKDpKz
         Oq0WeKOzBJBMGRxTCrdJdVsRJIHtFee0wepKMBdk=
Received: from fe0vm7918.rbesz01.com (unknown [10.58.172.176])
        by fe0vm1649.rbesz01.com (Postfix) with ESMTPS id 4DZ8zw33tPz24S;
        Mon,  8 Feb 2021 16:28:12 +0100 (CET)
X-AuditID: 0a3aad10-af5ff70000002230-15-6021588cc59d
Received: from si0vm1949.rbesz01.com ( [10.58.173.29])
        (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by fe0vm7918.rbesz01.com (SMG Outbound) with SMTP id 94.19.08752.C8851206; Mon,  8 Feb 2021 16:28:12 +0100 (CET)
Received: from FE-HUB2000.de.bosch.com (unknown [10.4.103.109])
        by si0vm1949.rbesz01.com (Postfix) with ESMTPS id 4DZ8zw21ZBz6CjZP5;
        Mon,  8 Feb 2021 16:28:12 +0100 (CET)
Received: from luchador.grb-fir.grb.de.bosch.com (10.19.187.97) by
 FE-HUB2000.de.bosch.com (10.4.103.109) with Microsoft SMTP Server id
 15.1.2106.2; Mon, 8 Feb 2021 16:28:11 +0100
From:   Mark Jonas <mark.jonas@de.bosch.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
        <Adam.Thomson.Opensource@diasemi.com>,
        <stwiss.opensource@diasemi.com>, <marek.vasut@gmail.com>,
        <tingquan.ruan@cn.bosch.com>, <hubert.streidl@de.bosch.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Jonas <mark.jonas@de.bosch.com>
Subject: [PATCH v4] mfd: da9063: Support SMBus and I2C mode
Date:   Mon, 8 Feb 2021 16:27:58 +0100
Message-ID: <20210208152758.13093-1-mark.jonas@de.bosch.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrDLMWRmVeSWpSXmKPExsXCZbVWVrcnQjHB4GG7qMXS90uZLe5/Pcpo
        0fH3C6PF5V1z2CyO7rnHbHH193oWi72tF5kt7u6fy+jA4bHik77Hzll32T02repk87hzbQ+b
        x+dNcgGsUVw2Kak5mWWpRfp2CVwZB6fsZim4LFnRN+0hewNjo2gXIyeHhICJxNObt5m6GLk4
        hASmM0lcn/SDDcJZxyixes0eqMx2Ront3y+ygLSwCWhJ3DyxgxnEFhGIlmj5egKsiFlgFZPE
        nVW72EESwgLWEvOWdLKC2CwCKhItV9qBbA4OXgEbiZ8/8yFWy0vMvPQdrJxXQFDi5MwnYPOZ
        geLNW2czQ9gSEgdfvGCewMg3C0nZLCRls5CULWBkXsUompZqUJZrbmlooVeUlFpcZWCol5yf
        u4kREsACOxhvd3/QO8TIxMF4iFGCg1lJhDewUy5BiDclsbIqtSg/vqg0J7X4EKM0B4uSOK8K
        z8Y4IYH0xJLU7NTUgtQimCwTB6dUA9Ps25cqb09e+5Q5V4Gv4G7VUd6u/r7pU+7cfr7yu/xC
        YxvnR/Gxv89kdAT1eq82+p50OUhdIp3jlN37K6nsgR5zb4TEiPs9DrP89zHts6iShd/N4+f3
        tYt1mQQX7NjNec3+Z80VNyNZjpmPxcU+2WebZz/8LPVGV/fiA4uF7yWZml8eK9tSeOxu7uN0
        t8uXbn9us/WffvC2S76dI4N81o6Fc+9MKD6ZG+fJdeUwe4//MW/zmV2NPOV+ptunbF/xSmly
        uoTFvEzHbZ8P+SqqVF3UXhY6dYvs4a7stZEWRhbGO29dnNH38XWB3MxSwYhzWv6KWqmGMcXr
        OQyq1TSyXPYw/7D9MPmE6kSDAqW8a0osxRmJhlrMRcWJALSCjKfPAgAA
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
Changes in v4:
  - Remove logging of selected 2-wire bus mode.

Changes in v3:
  - busmode now contains the correct bit DA9063_TWOWIRE_TO

Changes in v2:
  - Implement proposal by Adam Thomson and Wolfram Sang to check for
    functionality I2C_FUNC_I2C instead of introducing a new DT property.

 drivers/mfd/da9063-i2c.c             | 11 +++++++++++
 include/linux/mfd/da9063/registers.h |  3 +++
 2 files changed, 14 insertions(+)

diff --git a/drivers/mfd/da9063-i2c.c b/drivers/mfd/da9063-i2c.c
index 3781d0bb7786..9450c95a3741 100644
--- a/drivers/mfd/da9063-i2c.c
+++ b/drivers/mfd/da9063-i2c.c
@@ -355,6 +355,7 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
 	struct da9063 *da9063;
+	unsigned int busmode;
 	int ret;
 
 	da9063 = devm_kzalloc(&i2c->dev, sizeof(struct da9063), GFP_KERNEL);
@@ -442,6 +443,16 @@ static int da9063_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	busmode = i2c_check_functionality(i2c->adapter, I2C_FUNC_I2C) ?
+		      0 : DA9063_TWOWIRE_TO;
+
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

