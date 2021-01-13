Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E2EE2F521B
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Jan 2021 19:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728351AbhAMScL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Jan 2021 13:32:11 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:36175 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbhAMScL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Jan 2021 13:32:11 -0500
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Jan 2021 13:32:10 EST
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D1C993F25F;
        Wed, 13 Jan 2021 19:25:25 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 2/3] i2c: qup: Introduce SCL/SDA noise rejection
Date:   Wed, 13 Jan 2021 19:25:21 +0100
Message-Id: <20210113182522.443262-3-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113182522.443262-1-angelogioacchino.delregno@somainline.org>
References: <20210113182522.443262-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Some I2C devices may be glitchy due to electrical noise coming
from the device itself or because of possible board design issues.
To overcome this issue, the QUP's I2C in Qualcomm SoCs supports
a noise rejection setting for both SCL and SDA lines.

Introduce a setting for noise rejection through device properties,
"qcom,noise-reject-sda" and "qcom,noise-reject-scl", which will
be used to set the level of noise rejection sensitivity.
If the properties are not specified, noise rejection will not be
enabled.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 drivers/i2c/busses/i2c-qup.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 5a47915869ae..35cc47f010e3 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -39,6 +39,8 @@
 #define QUP_MX_READ_CNT		0x208
 #define QUP_IN_FIFO_BASE	0x218
 #define QUP_I2C_CLK_CTL		0x400
+#define  QUP_I2C_CLK_CTL_SDA_NR	GENMASK(27, 26)
+#define  QUP_I2C_CLK_CTL_SCL_NR	GENMASK(25, 24)
 #define QUP_I2C_STATUS		0x404
 #define QUP_I2C_MASTER_GEN	0x408
 
@@ -1663,6 +1665,7 @@ static int qup_i2c_probe(struct platform_device *pdev)
 	int ret, fs_div, hs_div;
 	u32 src_clk_freq = DEFAULT_SRC_CLK;
 	u32 clk_freq = DEFAULT_CLK_FREQ;
+	u32 noise_reject_scl = 0, noise_reject_sda = 0;
 	int blocks;
 	bool is_qup_v1;
 
@@ -1860,6 +1863,19 @@ static int qup_i2c_probe(struct platform_device *pdev)
 		qup->clk_ctl = ((fs_div / 2) << 16) | (hs_div << 8) | (fs_div & 0xff);
 	}
 
+	/* SCL/SDA Noise rejection (optional) */
+	ret = device_property_read_u32(qup->dev, "qcom,noise-reject-scl",
+				      &noise_reject_scl);
+	if (ret == 0)
+		qup->clk_ctl |= FIELD_PREP(QUP_I2C_CLK_CTL_SCL_NR,
+					   noise_reject_scl);
+
+	ret = device_property_read_u32(qup->dev, "qcom,noise-reject-sda",
+				      &noise_reject_sda);
+	if (ret == 0)
+		qup->clk_ctl |= FIELD_PREP(QUP_I2C_CLK_CTL_SDA_NR,
+					   noise_reject_sda);
+
 	/*
 	 * Time it takes for a byte to be clocked out on the bus.
 	 * Each byte takes 9 clock cycles (8 bits + 1 ack).
-- 
2.29.2

