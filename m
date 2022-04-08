Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B98F44F9B73
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Apr 2022 19:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232481AbiDHRRm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Apr 2022 13:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238121AbiDHRRk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Apr 2022 13:17:40 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B7DDF01
        for <linux-i2c@vger.kernel.org>; Fri,  8 Apr 2022 10:15:35 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 4641083B1E;
        Fri,  8 Apr 2022 19:15:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1649438133;
        bh=Qg7OsDYwM306AmCpuacgPRJBBExy7iiNkAo9b462pJE=;
        h=From:To:Cc:Subject:Date:From;
        b=eCReDApAiASL3D4aS8CGLiGAaAT670lLPu58+dOBMj1tMHJBxbzwSOBANyoYy8CMn
         8TPKn4XKsx5GFud3okm2EiXSXYVDEkjWUG+zGQDiTsQX8cddDwwDZltUJpuMuPSSV2
         I3tYYA39LJ3xMMyMBOeB1QjWoPUxZdtbWgG6Ws78XpDsS2d8p8WPK3LUmO+mTWwESK
         f0qX9Rka1/ubrtrTo/YMBaL1H4Vtx/Rr9ujHfZ9yA5wYoSBSi0JLANwlNl1plOx3f3
         Y79v0NBLN83IH8mrzOhaaF8a1OxVYhAoiGrNBIkXHeYeU0pY9eWkyRiPbUstNBOWGL
         jHwUJ4jGXe5Lw==
From:   Marek Vasut <marex@denx.de>
To:     linux-i2c@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@denx.de>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Oleksij Rempel <linux@rempel-privat.de>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] i2c: imx: Implement errata ERR007805 or e7805 bus frequency limit
Date:   Fri,  8 Apr 2022 19:15:24 +0200
Message-Id: <20220408171524.73551-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The i.MX8MP Mask Set Errata for Mask 1P33A, Rev. 2.0 has description of
errata ERR007805 as below. This errata is found on all MX8M{M,N,P,Q},
MX7{S,D}, MX6{UL{,L,Z},S{,LL,X},S,D,DL,Q,DP,QP} . MX7ULP, MX8Q, MX8X
are not affected. MX53 and older status is unknown, as the errata
first appears in MX6 errata sheets from 2016 and the latest errata
sheet for MX53 is from 2015. Older SoC errata sheets predate the
MX53 errata sheet. MX8ULP and MX9 status is unknown as the errata
sheet is not available yet.

"
ERR007805 I2C: When the I2C clock speed is configured for 400 kHz,
the SCL low period violates the I2C spec of 1.3 uS min

Description: When the I2C module is programmed to operate at the
maximum clock speed of 400 kHz (as defined by the I2C spec), the SCL
clock low period violates the I2C spec of 1.3 uS min. The user must
reduce the clock speed to obtain the SCL low time to meet the 1.3us
I2C minimum required. This behavior means the SoC is not compliant
to the I2C spec at 400kHz.

Workaround: To meet the clock low period requirement in fast speed
mode, SCL must be configured to 384KHz or less.
"

Implement the workaround by matching on the affected SoC specific
compatible strings and by limiting the maximum bus frequency in case
the SoC is affected.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@denx.de>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Cc: Oleksij Rempel <linux@rempel-privat.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
To: linux-i2c@vger.kernel.org
---
 drivers/i2c/busses/i2c-imx.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 27f969b3dc072..e9e2db68b9fb6 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -179,6 +179,12 @@ struct imx_i2c_hwdata {
 	unsigned int		ndivs;
 	unsigned int		i2sr_clr_opcode;
 	unsigned int		i2cr_ien_opcode;
+	/*
+	 * Errata ERR007805 or e7805:
+	 * I2C: When the I2C clock speed is configured for 400 kHz,
+	 * the SCL low period violates the I2C spec of 1.3 uS min.
+	 */
+	bool			has_err007805;
 };
 
 struct imx_i2c_dma {
@@ -240,6 +246,16 @@ static const struct imx_i2c_hwdata imx21_i2c_hwdata = {
 
 };
 
+static const struct imx_i2c_hwdata imx6_i2c_hwdata = {
+	.devtype		= IMX21_I2C,
+	.regshift		= IMX_I2C_REGSHIFT,
+	.clk_div		= imx_i2c_clk_div,
+	.ndivs			= ARRAY_SIZE(imx_i2c_clk_div),
+	.i2sr_clr_opcode	= I2SR_CLR_OPCODE_W0C,
+	.i2cr_ien_opcode	= I2CR_IEN_OPCODE_1,
+	.has_err007805		= true,
+};
+
 static struct imx_i2c_hwdata vf610_i2c_hwdata = {
 	.devtype		= VF610_I2C,
 	.regshift		= VF610_I2C_REGSHIFT,
@@ -266,6 +282,16 @@ MODULE_DEVICE_TABLE(platform, imx_i2c_devtype);
 static const struct of_device_id i2c_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx1-i2c", .data = &imx1_i2c_hwdata, },
 	{ .compatible = "fsl,imx21-i2c", .data = &imx21_i2c_hwdata, },
+	{ .compatible = "fsl,imx6q-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx6sl-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx6sll-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx6sx-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx6ul-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx7s-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx8mm-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx8mn-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx8mp-i2c", .data = &imx6_i2c_hwdata, },
+	{ .compatible = "fsl,imx8mq-i2c", .data = &imx6_i2c_hwdata, },
 	{ .compatible = "fsl,vf610-i2c", .data = &vf610_i2c_hwdata, },
 	{ /* sentinel */ }
 };
@@ -551,6 +577,13 @@ static void i2c_imx_set_clk(struct imx_i2c_struct *i2c_imx,
 	unsigned int div;
 	int i;
 
+	if (i2c_imx->hwdata->has_err007805 && i2c_imx->bitrate > 384000) {
+		dev_dbg(&i2c_imx->adapter.dev,
+			"SoC errata ERR007805 or e7805 applies, bus frequency limited from %d Hz to 384000 Hz.\n",
+			i2c_imx->bitrate);
+		i2c_imx->bitrate = 384000;
+	}
+
 	/* Divider value calculation */
 	if (i2c_imx->cur_clk == i2c_clk_rate)
 		return;
-- 
2.35.1

